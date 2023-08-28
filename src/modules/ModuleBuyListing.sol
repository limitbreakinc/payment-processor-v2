// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DataTypes.sol";
import "../Errors.sol";

import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

library ModuleBuyListing {
    /// @notice Emitted for each token successfully purchased using either `buySingleLising` or `buyBatchOfListings`
    event BuySingleListing(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
        uint256 tokenId,
        uint256 amount,
        uint256 salePrice);

    /// @notice Emitted when a user revokes a single listing or offer nonce for a specific marketplace.
    event NonceInvalidated(
        uint256 indexed nonce, 
        address indexed account, 
        bool wasCancellation);

    /// @dev Convenience to avoid magic number in bitmask get/set logic.
    uint256 private constant ONE = uint256(1);

    /// @notice The denominator used when calculating the marketplace fee.
    /// @dev    0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
    uint256 public constant FEE_DENOMINATOR = 10_000;

    /// @notice keccack256("OrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
    bytes32 public constant ORDER_APPROVAL_HASH = 0x61718384c415a086091f6ee7779f499c089559dc5f0d8a00c21a2760ef58ac47;

    /// @notice keccack256("CollectionOrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
    bytes32 public constant COLLECTION_ORDER_APPROVAL_HASH = 0x61e6f7cf8f226da53a60071c56608b1b1f6d80644b1a566f2f26a786a550d9b4;

    uint256 private constant pushPaymentGasLimit = 2300;

    address private constant weth = 0xc778417E063141139Fce010982780140Aa0cD5Ab;
    address private constant usdc = 0x07865c6E87B9F70255377e024ace6630C1Eaa37F;
    address private constant usdt = 0x1cEB5cB57C4D4E2b2433641b95Dd330A33185A44;
    address private constant dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    function isDefaultPaymentMethod(address paymentMethod) public view returns (bool) {
        if (paymentMethod == address(0)) {
            return true;
        } else if (paymentMethod == weth) {
            return true;
        } else if (paymentMethod == usdc) {
            return true;
        } else if (paymentMethod == usdt) {
            return true;
        } else if (paymentMethod == dai) {
            return true;
        } else {
            return false;
        }
    }

    function buyListing(PaymentProcessorStorage storage self, bytes32 domainSeparator, Order memory saleDetails, SignatureECDSA memory signature) public {
        if (saleDetails.paymentMethod == address(0)) {
            if (saleDetails.itemPrice != msg.value) {
                revert PaymentProcessor__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert PaymentProcessor__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        _verifyCallerIsBuyerAndTxOrigin(saleDetails.buyer);

        bool tokenDispensedSuccessfully = _executeOrder(self, domainSeparator, false, saleDetails.seller, saleDetails, signature);
        if (!tokenDispensedSuccessfully) {
            revert PaymentProcessor__DispensingTokenWasUnsuccessful();
        }
    }

    function _executeOrder(
        PaymentProcessorStorage storage self,
        bytes32 domainSeparator,
        bool isCollectionLevelOrder, 
        address signer, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) private returns (bool tokenDispensedSuccessfully) {
        if (saleDetails.protocol == TokenProtocols.ERC1155) {
            if (saleDetails.amount == 0) {
                revert PaymentProcessor__AmountForERC1155SalesGreaterThanZero();
            }
        } else {
            if (saleDetails.amount != ONE) {
                revert PaymentProcessor__AmountForERC721SalesMustEqualOne();
            }
        }

        if (block.timestamp > saleDetails.expiration) {
            revert PaymentProcessor__OrderHasExpired();
        }

        if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
            revert PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
        }

        CollectionPaymentSettings memory paymentSettingsForCollection = self.collectionPaymentSettings[saleDetails.tokenAddress];
        
        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!isDefaultPaymentMethod(saleDetails.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!self.collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId][saleDetails.paymentMethod]) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != saleDetails.paymentMethod) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }

            _verifySalePriceInRange(
                self,
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount, 
                saleDetails.itemPrice);
        }

        if (isCollectionLevelOrder) {
            _verifySignedCollectionOrder(self, domainSeparator, signer, saleDetails, signature);
        } else {
            _verifySignedItemOrder(self, domainSeparator, signer, saleDetails, signature);
        }

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds(
            saleDetails.buyer,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetailsSingletonBatch
        );

        tokenDispensedSuccessfully = !unsuccessfulFills[0];

        if (tokenDispensedSuccessfully) {
            emit BuySingleListing(
                saleDetails.marketplace,
                saleDetails.tokenAddress,
                saleDetails.paymentMethod,
                saleDetails.buyer,
                saleDetails.seller,
                saleDetails.tokenId,
                saleDetails.amount,
                saleDetails.itemPrice);
        }
    }

    function _verifySalePriceInRange(
        PaymentProcessorStorage storage self,
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount, 
        uint256 salePrice) private view {
        (uint256 floorPrice, uint256 ceilingPrice) = _getFloorAndCeilingPrices(self, tokenAddress, tokenId);

        if(salePrice < amount * floorPrice) {
            revert PaymentProcessor__SalePriceBelowMinimumFloor();
        }

        if(ceilingPrice < type(uint120).max) {
            ceilingPrice *= amount;
        }

        if(salePrice > ceilingPrice) {
            revert PaymentProcessor__SalePriceAboveMaximumCeiling();
        }
    }

    function _verifySignedItemOrder(
        PaymentProcessorStorage storage self,
        bytes32 domainSeparator,
        address signer,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) private {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        ORDER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        signer,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.tokenId,
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.nonce
                    ),
                    abi.encode(
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            self,
                            signer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert PaymentProcessor__UnauthorizeSale();
        }
    }

    function _verifySignedCollectionOrder(
        PaymentProcessorStorage storage self,
        bytes32 domainSeparator,
        address signer,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) private {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        COLLECTION_ORDER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        signer,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.nonce,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            self,
                            signer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert PaymentProcessor__UnauthorizeSale();
        }
    }

    function _checkAndInvalidateNonce(
        PaymentProcessorStorage storage self,
        address account, 
        uint256 nonce, 
        bool wasCancellation) private returns (uint256) {

        mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = self.invalidatedSignatures[account];

        unchecked {
            uint256 slot = nonce / 256;
            uint256 offset = nonce % 256;
            uint256 slotValue = ptrInvalidatedSignatureBitmap[slot];

            if (((slotValue >> offset) & ONE) == ONE) {
                revert PaymentProcessor__SignatureAlreadyUsedOrRevoked();
            }

            ptrInvalidatedSignatureBitmap[slot] = (slotValue | ONE << offset);
        }

        emit NonceInvalidated(nonce, account, wasCancellation);

        return self.masterNonces[account];
    }

    function _computeAndDistributeProceeds(
        address buyer,
        IERC20 paymentCoin,
        function(address,address,IERC20,uint256,uint256) funcPayout,
        function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken,
        Order[] memory saleDetailsBatch) private returns (bool[] memory unsuccessfulFills) {

        unsuccessfulFills = new bool[](saleDetailsBatch.length);

        PayoutsAccumulator memory accumulator = PayoutsAccumulator({
            lastSeller: address(0),
            lastMarketplace: address(0),
            lastRoyaltyRecipient: address(0),
            accumulatedSellerProceeds: 0,
            accumulatedMarketplaceProceeds: 0,
            accumulatedRoyaltyProceeds: 0
        });

        for (uint256 i = 0; i < saleDetailsBatch.length;) {
            Order memory saleDetails = saleDetailsBatch[i];

            bool successfullyDispensedToken = 
                funcDispenseToken(
                    saleDetails.seller, 
                    buyer, 
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount);

            if (!successfullyDispensedToken) {
                if (address(paymentCoin) == address(0)) {
                    revert PaymentProcessor__DispensingTokenWasUnsuccessful();
                }

                unsuccessfulFills[i] = true;
            } else {
                SplitProceeds memory proceeds =
                    _computePaymentSplits(
                        saleDetails.itemPrice,
                        saleDetails.tokenAddress,
                        saleDetails.tokenId,
                        saleDetails.marketplace,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    );
    
                if (proceeds.royaltyRecipient != accumulator.lastRoyaltyRecipient) {
                    if(accumulator.accumulatedRoyaltyProceeds > 0) {
                        funcPayout(accumulator.lastRoyaltyRecipient, buyer, paymentCoin, accumulator.accumulatedRoyaltyProceeds, 2300);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        funcPayout(accumulator.lastMarketplace, buyer, paymentCoin, accumulator.accumulatedMarketplaceProceeds, 2300);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.seller != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        funcPayout(accumulator.lastSeller, buyer, paymentCoin, accumulator.accumulatedSellerProceeds, 2300);
                    }
    
                    accumulator.lastSeller = saleDetails.seller;
                    accumulator.accumulatedSellerProceeds = 0;
                }

                unchecked {
                    accumulator.accumulatedRoyaltyProceeds += proceeds.royaltyProceeds;
                    accumulator.accumulatedMarketplaceProceeds += proceeds.marketplaceProceeds;
                    accumulator.accumulatedSellerProceeds += proceeds.sellerProceeds;
                }
            }

            unchecked {
                ++i;
            }
        }

        if(accumulator.accumulatedRoyaltyProceeds > 0) {
            funcPayout(accumulator.lastRoyaltyRecipient, buyer, paymentCoin, accumulator.accumulatedRoyaltyProceeds, 2300);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            funcPayout(accumulator.lastMarketplace, buyer, paymentCoin, accumulator.accumulatedMarketplaceProceeds, 2300);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            funcPayout(accumulator.lastSeller, buyer, paymentCoin, accumulator.accumulatedSellerProceeds, 2300);
        }

        return unsuccessfulFills;
    }

    function _computePaymentSplits(
        uint256 salePrice,
        address tokenAddress,
        uint256 tokenId,
        address marketplaceFeeRecipient,
        uint256 marketplaceFeeNumerator,
        uint256 maxRoyaltyFeeNumerator) internal view returns (SplitProceeds memory proceeds) {

        proceeds.sellerProceeds = salePrice;

        try IERC2981(tokenAddress).royaltyInfo(
            tokenId, 
            salePrice) 
            returns (address royaltyReceiver, uint256 royaltyAmount) {
            if (royaltyReceiver == address(0)) {
                royaltyAmount = 0;
            }

            if (royaltyAmount > 0) {
                if (royaltyAmount > (salePrice * maxRoyaltyFeeNumerator) / FEE_DENOMINATOR) {
                    revert PaymentProcessor__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
                }

                proceeds.royaltyRecipient = royaltyReceiver;
                proceeds.royaltyProceeds = royaltyAmount;

                unchecked {
                    proceeds.sellerProceeds -= royaltyAmount;
                }
            }
        } catch (bytes memory) {}

        proceeds.marketplaceProceeds =
            marketplaceFeeRecipient != address(0) ? (salePrice * marketplaceFeeNumerator) / FEE_DENOMINATOR : 0;
        if (proceeds.marketplaceProceeds > 0) {
            unchecked {
                proceeds.sellerProceeds -= proceeds.marketplaceProceeds;
            }
        }
    }

    function _pushProceeds(address to, uint256 proceeds, uint256 pushPaymentGasLimit_) internal {
        bool success;

        assembly {
            // Transfer the ETH and store if it succeeded or not.
            success := call(pushPaymentGasLimit_, to, proceeds, 0, 0, 0, 0)
        }

        if (!success) {
            revert PaymentProcessor__FailedToTransferProceeds();
        }
    }

    function _payoutNativeCurrency(
        address payee, 
        address /*payer*/, 
        IERC20 /*paymentCoin*/, 
        uint256 proceeds, 
        uint256 gasLimit_) internal {
        _pushProceeds(payee, proceeds, gasLimit_);
    }

    function _payoutCoinCurrency(
        address payee, 
        address payer, 
        IERC20 paymentCoin, 
        uint256 proceeds, 
        uint256 /*gasLimit_*/) internal {
        SafeERC20.safeTransferFrom(paymentCoin, payer, payee, proceeds);
    }

    function _dispenseERC721Token(
        address from, 
        address to, 
        address tokenAddress, 
        uint256 tokenId, 
        uint256 /*amount*/) internal returns (bool) {
        try IERC721(tokenAddress).transferFrom(from, to, tokenId) {
            return true;
        } catch {
            return false;
        }
    }

    function _dispenseERC1155Token(
        address from, 
        address to, 
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount) internal returns (bool) {
        try IERC1155(tokenAddress).safeTransferFrom(from, to, tokenId, amount, "") {
            return true;
        } catch {
            return false;
        }
    }

    function _verifyCallerIsBuyerAndTxOrigin(address buyer) internal view {
        if(buyer != msg.sender || msg.sender != tx.origin) {
            revert PaymentProcessor__BuyerMustBeCallerAndTransactionOrigin();
        }
    }

    function _getFloorAndCeilingPrices(
        PaymentProcessorStorage storage self,
        address tokenAddress, 
        uint256 tokenId) private view returns (uint256, uint256) {

        PricingBounds memory tokenLevelPricingBounds = self.tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return (tokenLevelPricingBounds.floorPrice, tokenLevelPricingBounds.ceilingPrice);
        } else {
            PricingBounds memory collectionLevelPricingBounds = self.collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return (collectionLevelPricingBounds.floorPrice, collectionLevelPricingBounds.ceilingPrice);
            }
        }

        return (0, type(uint256).max);
    }

    function _hashTypedDataV4(bytes32 domainSeparator, bytes32 structHash) internal view returns (bytes32) {
        return ECDSA.toTypedDataHash(domainSeparator, structHash);
    }
}