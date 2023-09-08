// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
// | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
// | |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
// | |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
// | |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
// | |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
// | |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
// | |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
// | |              | || |              | || |              | || |              | || |              | || |              | |
// | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
//  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
// 
// By Limit Break, Inc.

import "../IOwnable.sol";
import "../interfaces/CPortEvents.sol";
import "../storage/CPortStorageAccess.sol";
import "../Constants.sol";
import "../Errors.sol";

import "@openzeppelin/contracts/interfaces/IERC1271.sol";
import "@openzeppelin/contracts/access/IAccessControl.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

abstract contract cPortModule is cPortStorageAccess, cPortEvents {

    uint256 private immutable pushPaymentGasLimit;
    address private immutable weth;
    address private immutable usdc;
    address private immutable usdt;
    address private immutable dai;

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) {
        pushPaymentGasLimit = defaultPushPaymentGasLimit_;
        
        weth = weth_;
        usdc = usdc_;
        usdt = usdt_;
        dai = dai_;
    }

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

    function getDefaultPaymentMethods() external view returns (address[] memory) {
        address[] memory defaultPaymentMethods = new address[](5);
        defaultPaymentMethods[0] = address(0);
        defaultPaymentMethods[1] = weth;
        defaultPaymentMethods[2] = usdc;
        defaultPaymentMethods[3] = usdt;
        defaultPaymentMethods[4] = dai;
        return defaultPaymentMethods;
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

    function _validateBasicOrderDetails(uint256 msgValue, Order memory saleDetails) internal {
        if (saleDetails.paymentMethod == address(0)) {
            if (saleDetails.itemPrice != msgValue) {
                revert cPort__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msgValue > 0) {
                revert cPort__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        if (saleDetails.protocol == TokenProtocols.ERC1155) {
            if (saleDetails.amount == 0) {
                revert cPort__AmountForERC1155SalesGreaterThanZero();
            }
        } else {
            if (saleDetails.amount != ONE) {
                revert cPort__AmountForERC721SalesMustEqualOne();
            }
        }

        if (block.timestamp > saleDetails.expiration) {
            revert cPort__OrderHasExpired();
        }

        if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
            revert cPort__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
        }

        CollectionPaymentSettings memory paymentSettingsForCollection = appStorage().collectionPaymentSettings[saleDetails.tokenAddress];
        
        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!isDefaultPaymentMethod(saleDetails.paymentMethod)) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!appStorage().collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId][saleDetails.paymentMethod]) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != saleDetails.paymentMethod) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }

            _verifySalePriceInRange(
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount, 
                saleDetails.itemPrice);
        }
    }

    // Description: Executes a buy-side order.  A buy-side order is when the caller is the account
    // purchasing the item(s) from the seller (whether for themselves or on behalf of someone else).
    // The signed seller order is validated to ensure that the seller has authorized the sale.
    // The seller may be either an EOA or a contract (such as a multi-sig).

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        uint256 msgValue,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder
    ) internal returns (bool tokenDispensedSuccessfully) {
        _verifySignedItemListing(domainSeparator, saleDetails, signedSellOrder);
        _validateBasicOrderDetails(msgValue, saleDetails);

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds2(
            msg.sender,
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

    function _executeOrderBuySideCosigned(
        bytes32 domainSeparator,
        uint256 msgValue,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        SignatureECDSA memory cosignerSignature
    ) internal returns (bool tokenDispensedSuccessfully) {
        _verifyCosignedItemListing(domainSeparator, saleDetails, signedSellOrder, cosignerSignature);
        _validateBasicOrderDetails(msgValue, saleDetails);

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds2(
            msg.sender,
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

    function _executeOrderBuySideCosignedOrNot(
        bytes32 domainSeparator,
        uint256 msgValue,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        SignatureECDSA memory cosignerSignature
    ) internal returns (bool tokenDispensedSuccessfully) {
        if (saleDetails.cosigner != address(0)) {
            _verifyCosignedItemListing(domainSeparator, saleDetails, signedSellOrder, cosignerSignature);
        } else {
            _verifySignedItemListing(domainSeparator, saleDetails, signedSellOrder);
        }
        
        _validateBasicOrderDetails(msgValue, saleDetails);

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds2(
            msg.sender,
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

    function _executeOrderSellSide(
        bytes32 domainSeparator,
        uint256 msgValue,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory signedBuyOrder
    ) internal returns (bool tokenDispensedSuccessfully) {
        // TODO: On the sell side, should revert if payment method is zero address (native)

        if (isCollectionLevelOrder) {
            _verifySignedCollectionOffer(domainSeparator, saleDetails, signedBuyOrder);
        } else {
            _verifySignedItemOffer(domainSeparator, saleDetails, signedBuyOrder);
        }

        _validateBasicOrderDetails(msgValue, saleDetails);

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds2(
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

    function _executeOrderSellSideCosigned(
        bytes32 domainSeparator,
        uint256 msgValue,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory signedBuyOrder,
        SignatureECDSA memory cosignerSignature
    ) internal returns (bool tokenDispensedSuccessfully) {
        // TODO: On the sell side, should revert if payment method is zero address (native)

        if (isCollectionLevelOrder) {
            _verifyCosignedCollectionOffer(domainSeparator, saleDetails, signedBuyOrder, cosignerSignature);
        } else {
            _verifyCosignedItemOffer(domainSeparator, saleDetails, signedBuyOrder, cosignerSignature);
        }

        _validateBasicOrderDetails(msgValue, saleDetails);

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds2(
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


    function _executeOrder(
        bytes32 domainSeparator,
        uint256 msgValue,
        bool isCollectionLevelOrder, 
        address signer, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) internal returns (bool tokenDispensedSuccessfully) {
        if (isCollectionLevelOrder) {
            _verifySignedCollectionOrder(domainSeparator, signer, saleDetails, signature);
        } else {
            _verifySignedItemOrder(domainSeparator, signer, saleDetails, signature);
        }

        _validateBasicOrderDetails(msgValue, saleDetails);

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

    function _validateBundledItems(
        bytes32 domainSeparator,
        bool individualListings,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] memory items,
        SignatureECDSA[] memory signatures) 
        internal returns (Accumulator memory accumulator, Order[] memory saleDetailsBatch) {

        CollectionPaymentSettings memory paymentSettingsForCollection = appStorage().collectionPaymentSettings[bundleDetails.bundleBase.tokenAddress];

        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!isDefaultPaymentMethod(bundleDetails.bundleBase.paymentMethod)) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!appStorage().collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId][bundleDetails.bundleBase.paymentMethod]) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != bundleDetails.bundleBase.paymentMethod) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        }

        saleDetailsBatch = new Order[](items.length);
        accumulator = Accumulator({
            tokenIds: new uint256[](items.length),
            amounts: new uint256[](items.length),
            salePrices: new uint256[](items.length),
            maxRoyaltyFeeNumerators: new uint256[](items.length),
            sellers: new address[](items.length),
            sumListingPrices: 0
        });

        for (uint256 i = 0; i < items.length;) {

            address seller = bundleDetails.seller;
            uint256 nonce = bundleDetails.nonce;
            uint256 expiration = bundleDetails.expiration;

            if (individualListings) {
                seller = items[i].seller;
                nonce = items[i].nonce;
                expiration = items[i].expiration;
            }
            
            Order memory saleDetails = 
                Order({
                    protocol: bundleDetails.bundleBase.protocol,
                    seller: seller,
                    buyer: bundleDetails.bundleBase.buyer,
                    beneficiary: bundleDetails.bundleBase.buyer,
                    marketplace: bundleDetails.bundleBase.marketplace,
                    paymentMethod: bundleDetails.bundleBase.paymentMethod,
                    tokenAddress: bundleDetails.bundleBase.tokenAddress,
                    cosigner: address(0), // TODO
                    tokenId: items[i].tokenId,
                    amount: items[i].amount,
                    itemPrice: items[i].itemPrice,
                    nonce: nonce,
                    expiration: expiration,
                    marketplaceFeeNumerator: bundleDetails.bundleBase.marketplaceFeeNumerator,
                    maxRoyaltyFeeNumerator: items[i].maxRoyaltyFeeNumerator
                });

            saleDetailsBatch[i] = saleDetails;

            accumulator.tokenIds[i] = saleDetails.tokenId;
            accumulator.amounts[i] = saleDetails.amount;
            accumulator.salePrices[i] = saleDetails.itemPrice;
            accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
            accumulator.sellers[i] = saleDetails.seller;
            accumulator.sumListingPrices += saleDetails.itemPrice;

            if (saleDetails.protocol == TokenProtocols.ERC1155) {
                if (saleDetails.amount == 0) {
                    revert cPort__AmountForERC1155SalesGreaterThanZero();
                }
            } else {
                if (saleDetails.amount != ONE) {
                    revert cPort__AmountForERC721SalesMustEqualOne();
                }
            }

            if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
                revert cPort__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
            }

            if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
                _verifySalePriceInRange(
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount, 
                    saleDetails.itemPrice);
            }
   
            if (individualListings) {
                if (block.timestamp > saleDetails.expiration) {
                    revert cPort__OrderHasExpired();
                }

                _verifySignedItemOrder(domainSeparator, saleDetails.seller, saleDetails, signatures[i]);
            }

            unchecked {
                ++i;
            }
        }

        if(!individualListings) {
            if (block.timestamp > bundleDetails.expiration) {
                revert cPort__OrderHasExpired();
            }

            _verifySignedBundleListing(
                domainSeparator,
                bundleDetails.seller,
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                }),
                bundleDetails, 
                signatures[0]);
        }
    }

    function _verifyCosignedItemListing(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory sellerSignature,
        SignatureECDSA memory cosignerSignature) internal {
        
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        COSIGNED_SALE_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        saleDetails.cosigner,
                        saleDetails.seller,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.tokenId,
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    )
                )
            )
        );

        if (saleDetails.cosigner != ECDSA.recover(digest, cosignerSignature.v, cosignerSignature.r, cosignerSignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.seller.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.seller, digest, sellerSignature);
        } else if (saleDetails.seller != ECDSA.recover(digest, sellerSignature.v, sellerSignature.r, sellerSignature.s)) {
            revert cPort__SellerDidNotAuthorizeSale();
        }
    }

    function _verifyCosignedCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        SignatureECDSA memory cosignerSignature) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        COSIGNED_COLLECTION_OFFER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        saleDetails.cosigner,
                        saleDetails.buyer,
                        saleDetails.beneficiary,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    )
                )
            )
        );

        if (saleDetails.cosigner != ECDSA.recover(digest, cosignerSignature.v, cosignerSignature.r, cosignerSignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.buyer.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.buyer, digest, buyerSignature);
        } else if (saleDetails.buyer != ECDSA.recover(digest, buyerSignature.v, buyerSignature.r, buyerSignature.s)) {
            revert cPort__BuyerDidNotAuthorizePurchase();
        }
    }

    function _verifyCosignedItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        SignatureECDSA memory cosignerSignature) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        COSIGNED_ITEM_OFFER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        saleDetails.cosigner,
                        saleDetails.buyer,
                        saleDetails.beneficiary,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.tokenId,
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    )
                )
            )
        );

        if (saleDetails.cosigner != ECDSA.recover(digest, cosignerSignature.v, cosignerSignature.r, cosignerSignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.buyer.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.buyer, digest, buyerSignature);
        } else if (saleDetails.buyer != ECDSA.recover(digest, buyerSignature.v, buyerSignature.r, buyerSignature.s)) {
            revert cPort__BuyerDidNotAuthorizePurchase();
        }
    }

    function _verifySignedItemListing(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        ORDER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        saleDetails.seller,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.tokenId,
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.nonce,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            saleDetails.seller,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if(saleDetails.seller.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.seller, digest, signedOrder);
        } else if (saleDetails.seller != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifySignedItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        ITEM_OFFER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        saleDetails.buyer,
                        saleDetails.beneficiary,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.tokenId,
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.nonce,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            saleDetails.buyer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if(saleDetails.buyer.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.buyer, digest, signedOrder);
        } else if (saleDetails.buyer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifySignedCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        COLLECTION_OFFER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        saleDetails.buyer,
                        saleDetails.beneficiary,
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
                            saleDetails.buyer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if(saleDetails.buyer.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.buyer, digest, signedOrder);
        } else if (saleDetails.buyer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifySignedItemOrder(
        bytes32 domainSeparator,
        address signer,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) internal {
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
                        saleDetails.nonce,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            signer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifySignedCollectionOrder(
        bytes32 domainSeparator,
        address signer,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) internal {
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
                            signer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifySignedBundleListing(
        bytes32 domainSeparator,
        address signer,
        AccumulatorHashes memory accumulatorHashes,
        BundledOrderExtended memory bundleDetails,
        SignatureECDSA memory signedListing) internal {

        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        BUNDLED_SALE_APPROVAL_HASH,
                        uint8(bundleDetails.bundleBase.protocol),
                        signer,
                        bundleDetails.bundleBase.marketplace,
                        bundleDetails.bundleBase.paymentMethod,
                        bundleDetails.bundleBase.tokenAddress
                    ),
                    abi.encode(
                        bundleDetails.expiration,
                        bundleDetails.nonce,
                        bundleDetails.bundleBase.marketplaceFeeNumerator,
                        _checkAndInvalidateNonce(
                            signer,
                            bundleDetails.nonce,
                            false
                        ),
                        accumulatorHashes.tokenIdsKeccakHash,
                        accumulatorHashes.amountsKeccakHash,
                        accumulatorHashes.maxRoyaltyFeeNumeratorsKeccakHash,
                        accumulatorHashes.itemPricesKeccakHash
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedListing.v, signedListing.r, signedListing.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _checkAndInvalidateNonce(
        address account, 
        uint256 nonce, 
        bool wasCancellation) internal returns (uint256) {

        mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = appStorage().invalidatedSignatures[account];

        unchecked {
            uint256 slot = nonce / 256;
            uint256 offset = nonce % 256;
            uint256 slotValue = ptrInvalidatedSignatureBitmap[slot];

            if (((slotValue >> offset) & ONE) == ONE) {
                revert cPort__SignatureAlreadyUsedOrRevoked();
            }

            ptrInvalidatedSignatureBitmap[slot] = (slotValue | ONE << offset);
        }

        emit NonceInvalidated(nonce, account, wasCancellation);

        return appStorage().masterNonces[account];
    }

    function _computeAndDistributeProceeds(
        address buyer,
        IERC20 paymentCoin,
        function(address,address,IERC20,uint256,uint256) funcPayout,
        function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken,
        Order[] memory saleDetailsBatch) internal returns (bool[] memory unsuccessfulFills) {

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
                    revert cPort__DispensingTokenWasUnsuccessful();
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
                        funcPayout(accumulator.lastRoyaltyRecipient, buyer, paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        funcPayout(accumulator.lastMarketplace, buyer, paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.seller != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        funcPayout(accumulator.lastSeller, buyer, paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
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
            funcPayout(accumulator.lastRoyaltyRecipient, buyer, paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            funcPayout(accumulator.lastMarketplace, buyer, paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            funcPayout(accumulator.lastSeller, buyer, paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
        }

        return unsuccessfulFills;
    }

    function _computeAndDistributeProceeds2(
        address purchaser,
        IERC20 paymentCoin,
        function(address,address,IERC20,uint256,uint256) funcPayout,
        function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken,
        Order[] memory saleDetailsBatch) internal returns (bool[] memory unsuccessfulFills) {

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
                    saleDetails.beneficiary, 
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount);

            if (!successfullyDispensedToken) {
                if (address(paymentCoin) == address(0)) {
                    revert cPort__DispensingTokenWasUnsuccessful();
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
                        funcPayout(accumulator.lastRoyaltyRecipient, purchaser, paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        funcPayout(accumulator.lastMarketplace, purchaser, paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.seller != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        funcPayout(accumulator.lastSeller, purchaser, paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
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
            funcPayout(accumulator.lastRoyaltyRecipient, purchaser, paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            funcPayout(accumulator.lastMarketplace, purchaser, paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            funcPayout(accumulator.lastSeller, purchaser, paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
        }

        return unsuccessfulFills;
    }

    function _pushProceeds(address to, uint256 proceeds, uint256 pushPaymentGasLimit_) internal {
        bool success;

        assembly {
            // Transfer the ETH and store if it succeeded or not.
            success := call(pushPaymentGasLimit_, to, proceeds, 0, 0, 0, 0)
        }

        if (!success) {
            revert cPort__FailedToTransferProceeds();
        }
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
                    revert cPort__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
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

    function _getFloorAndCeilingPrices(
        address tokenAddress, 
        uint256 tokenId) internal view returns (uint256, uint256) {

        PricingBounds memory tokenLevelPricingBounds = appStorage().tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return (tokenLevelPricingBounds.floorPrice, tokenLevelPricingBounds.ceilingPrice);
        } else {
            PricingBounds memory collectionLevelPricingBounds = appStorage().collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return (collectionLevelPricingBounds.floorPrice, collectionLevelPricingBounds.ceilingPrice);
            }
        }

        return (0, type(uint256).max);
    }

    function _verifySalePriceInRange(
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount, 
        uint256 salePrice) internal view {
        (uint256 floorPrice, uint256 ceilingPrice) = _getFloorAndCeilingPrices(tokenAddress, tokenId);

        if(salePrice < amount * floorPrice) {
            revert cPort__SalePriceBelowMinimumFloor();
        }

        if(ceilingPrice < type(uint120).max) {
            ceilingPrice *= amount;
        }

        if(salePrice > ceilingPrice) {
            revert cPort__SalePriceAboveMaximumCeiling();
        }
    }

    function _verifyPaymentMethodIsNonNative(address paymentMethod) internal pure {
        if (paymentMethod == address(0)) {
            revert cPort__BadPaymentMethod();
        }
    }

    function _verifyCallerIsSellerAndTxOrigin(address seller) internal view {
        if(seller != msg.sender || msg.sender != tx.origin) {
            revert cPort__SellerMustBeCallerAndTransactionOrigin();
        }
    }

    function _verifyCallerIsBuyer(address buyer) internal view {
        if(buyer != msg.sender) {
            revert cPort__BuyerMustBeCaller();
        }
    }

    function _verifyCallerIsBuyerAndTxOrigin(address buyer) internal view {
        if(buyer != msg.sender || msg.sender != tx.origin) {
            revert cPort__BuyerMustBeCallerAndTransactionOrigin();
        }
    }

    function _hashTypedDataV4(bytes32 domainSeparator, bytes32 structHash) internal view returns (bytes32) {
        return ECDSA.toTypedDataHash(domainSeparator, structHash);
    }

    function _requireCallerOwnsPaymentMethodWhitelist(uint88 paymentMethodWhitelistId) internal view {
        if(msg.sender != appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId]) {
            revert cPort__CallerDoesNotOwnPaymentMethodWhitelist();
        }
    }

    function _requireCallerIsNFTOrContractOwnerOrAdmin(address tokenAddress) internal view {
        bool callerHasPermissions = false;
        
        callerHasPermissions = msg.sender == tokenAddress;
        if(!callerHasPermissions) {
            try IOwnable(tokenAddress).owner() returns (address contractOwner) {
                callerHasPermissions = msg.sender == contractOwner;
            } catch {}

            if(!callerHasPermissions) {
                try IAccessControl(tokenAddress).hasRole(DEFAULT_ACCESS_CONTROL_ADMIN_ROLE, msg.sender) 
                    returns (bool callerIsContractAdmin) {
                    callerHasPermissions = callerIsContractAdmin;
                } catch {}
            }
        }

        if(!callerHasPermissions) {
            revert cPort__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
        }
    }

    function _verifyEIP1271Signature(
        address signer, 
        bytes32 hash, 
        SignatureECDSA memory signature) private view {
        bool isValidSignatureNow;
        
        try IERC1271(signer).isValidSignature(
            hash, 
            abi.encodePacked(signature.r, signature.s, signature.v)) 
            returns (bytes4 magicValue) {
            isValidSignatureNow = magicValue == IERC1271.isValidSignature.selector;
        } catch {}

        if (!isValidSignatureNow) {
            revert cPort__EIP1271SignatureInvalid();
        }
    }
}