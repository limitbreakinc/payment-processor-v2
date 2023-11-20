// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
| |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
| |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
| |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
| |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
| |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
 
 By Limit Break, Inc.
*/ 


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

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

abstract contract cPortModule is cPortStorageAccess, cPortEvents {

    // Recommendations For Default Immutable Payment Methods Per Chain
    // Default Payment Method 1: Wrapped Native Coin
    // Default Payment Method 2: Wrapped ETH
    // Default Payment Method 3: USDC (Native)
    // Default Payment Method 4: USDC (Bridged)

    uint256 private immutable pushPaymentGasLimit;
    address public immutable wrappedNativeCoinAddress;
    address private immutable defaultPaymentMethod1;
    address private immutable defaultPaymentMethod2;
    address private immutable defaultPaymentMethod3;
    address private immutable defaultPaymentMethod4;

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address wrappedNativeCoinAddress_,
        DefaultPaymentMethods memory defaultPaymentMethods) {
        pushPaymentGasLimit = defaultPushPaymentGasLimit_;        
        wrappedNativeCoinAddress = wrappedNativeCoinAddress_;
        defaultPaymentMethod1 = defaultPaymentMethods.defaultPaymentMethod1;
        defaultPaymentMethod2 = defaultPaymentMethods.defaultPaymentMethod2;
        defaultPaymentMethod3 = defaultPaymentMethods.defaultPaymentMethod3;
        defaultPaymentMethod4 = defaultPaymentMethods.defaultPaymentMethod4;
    }

    /*************************************************************************/
    /*                        Default Payment Methods                        */
    /*************************************************************************/

    function _isDefaultPaymentMethod(address paymentMethod) internal view returns (bool) {
        if (paymentMethod == address(0)) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod1) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod2) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod3) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod4) {
            return true;
        } else {
            // If it isn't one of the gas efficient immutable default payment methods,
            // it may have bee added to the fallback default payment method whitelist,
            // but there are SLOAD costs.
            return appStorage().collectionPaymentMethodWhitelists[DEFAULT_PAYMENT_METHOD_WHITELIST_ID][paymentMethod];
        }
    }

    function _getDefaultPaymentMethods() internal view returns (address[] memory) {
        address[] memory defaultPaymentMethods = new address[](5);
        defaultPaymentMethods[0] = address(0);
        defaultPaymentMethods[1] = defaultPaymentMethod1;
        defaultPaymentMethods[2] = defaultPaymentMethod2;
        defaultPaymentMethods[3] = defaultPaymentMethod3;
        defaultPaymentMethods[4] = defaultPaymentMethod4;
        return defaultPaymentMethods;
    }

    /*************************************************************************/
    /*                            Order Execution                            */
    /*************************************************************************/

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 startingNativeFunds,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) internal returns (uint256 endingNativeFunds) {
        uint248 quantityToFill = _verifySaleApproval(
            domainSeparator, 
            saleDetails, 
            signedSellOrder, 
            cosignature);

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        endingNativeFunds = _fulfillSingleOrderWithFeeOnTop(
            startingNativeFunds,
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(Sides.Buy, saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(saleDetails),
            feeOnTop);
    }

    function _executeOrderSellSide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) internal {
        if (saleDetails.paymentMethod == address(0)) {
            revert cPort__BadPaymentMethod();
        }

        uint248 quantityToFill;

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                quantityToFill = _verifyCollectionOffer(
                    domainSeparator, 
                    saleDetails, 
                    buyerSignature, 
                    cosignature);
            } else {
                if(!MerkleProof.verify(
                    tokenSetProof.proof, 
                    tokenSetProof.rootHash, 
                    keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                quantityToFill = _verifyTokenSetOffer(
                    domainSeparator, 
                    saleDetails, 
                    buyerSignature, 
                    tokenSetProof, 
                    cosignature);
            }
        } else {
            quantityToFill = _verifyItemOffer(
                domainSeparator, 
                saleDetails, 
                buyerSignature, 
                cosignature);
        }

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty = _validateBasicOrderDetails(saleDetails);

        _fulfillSingleOrderWithFeeOnTop(
            0,
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(Sides.Sell, saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            royaltyBackfillAndBounty,
            feeOnTop);
    }

    function _executeSweepOrder(
        bytes32 domainSeparator,
        uint256 startingNativeFunds,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) internal returns (uint256 endingNativeFunds) {

        if (sweepOrder.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            revert cPort__OrderProtocolERC1155FillPartialUnsupportedInSweeps();
        }

        if (items.length != signedSellOrders.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length != cosignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        (Order[] memory saleDetailsBatch, RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) = 
            _validateSweepOrder(
                domainSeparator,
                feeOnTop,
                sweepOrder,
                items,
                signedSellOrders,
                cosignatures
            );

        endingNativeFunds = _fulfillSweepOrderWithFeeOnTop(
            startingNativeFunds,
            SweepCollectionComputeAndDistributeProceedsParams({
                paymentCoin: IERC20(sweepOrder.paymentMethod),
                fnPointers: _getOrderFulfillmentFunctionPointers(Sides.Buy, sweepOrder.paymentMethod, sweepOrder.protocol),
                feeOnTop: feeOnTop,
                royaltyBackfillAndBounty: royaltyBackfillAndBounty,
                saleDetailsBatch: saleDetailsBatch
            })
        );
    }

    /*************************************************************************/
    /*                           Order Validation                            */
    /*************************************************************************/

    function _validateBasicOrderDetails(
        Order memory saleDetails
    ) private view returns (RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) {
        if (saleDetails.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            if (saleDetails.amount != ONE) {
                revert cPort__AmountForERC721SalesMustEqualOne();
            }
        } else {
            if (saleDetails.amount == 0) {
                revert cPort__AmountForERC1155SalesGreaterThanZero();
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
            if (!_isDefaultPaymentMethod(saleDetails.paymentMethod)) {
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

            _validateSalePriceInRange(
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount, 
                saleDetails.itemPrice);
        }

        royaltyBackfillAndBounty.backfillNumerator = paymentSettingsForCollection.royaltyBackfillNumerator;
        royaltyBackfillAndBounty.backfillReceiver = 
            paymentSettingsForCollection.royaltyBackfillNumerator > 0 ?
                appStorage().collectionRoyaltyBackfillReceivers[saleDetails.tokenAddress] :
                address(0);
        royaltyBackfillAndBounty.bountyNumerator = paymentSettingsForCollection.royaltyBountyNumerator;
        royaltyBackfillAndBounty.exclusiveMarketplace = 
            paymentSettingsForCollection.isRoyaltyBountyExclusive ? 
                appStorage().collectionExclusiveBountyReceivers[saleDetails.tokenAddress] : 
                address(0);
    }

    function _validateSweepOrder(
        bytes32 domainSeparator,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) private returns (Order[] memory saleDetailsBatch, RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) {
        CollectionPaymentSettings memory paymentSettingsForCollection = appStorage().collectionPaymentSettings[sweepOrder.tokenAddress];

        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!_isDefaultPaymentMethod(sweepOrder.paymentMethod)) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!appStorage().collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId][sweepOrder.paymentMethod]) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != sweepOrder.paymentMethod) {
                revert cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        }

        royaltyBackfillAndBounty.backfillNumerator = paymentSettingsForCollection.royaltyBackfillNumerator;
        royaltyBackfillAndBounty.backfillReceiver = 
            paymentSettingsForCollection.royaltyBackfillNumerator > 0 ?
                appStorage().collectionRoyaltyBackfillReceivers[sweepOrder.tokenAddress] :
                address(0);
        royaltyBackfillAndBounty.bountyNumerator = paymentSettingsForCollection.royaltyBountyNumerator;
        royaltyBackfillAndBounty.exclusiveMarketplace = 
            paymentSettingsForCollection.isRoyaltyBountyExclusive ? 
                appStorage().collectionExclusiveBountyReceivers[sweepOrder.tokenAddress] : 
                address(0);

        saleDetailsBatch = new Order[](items.length);
        uint256 sumListingPrices;

        for (uint256 i = 0; i < items.length;) {
            Order memory saleDetails = 
                Order({
                    protocol: sweepOrder.protocol,
                    maker: items[i].maker,
                    beneficiary: sweepOrder.beneficiary,
                    marketplace: items[i].marketplace,
                    fallbackRoyaltyRecipient: items[i].fallbackRoyaltyRecipient,
                    paymentMethod: sweepOrder.paymentMethod,
                    tokenAddress: sweepOrder.tokenAddress,
                    tokenId: items[i].tokenId,
                    amount: items[i].amount,
                    itemPrice: items[i].itemPrice,
                    nonce: items[i].nonce,
                    expiration: items[i].expiration,
                    marketplaceFeeNumerator: items[i].marketplaceFeeNumerator,
                    maxRoyaltyFeeNumerator: items[i].maxRoyaltyFeeNumerator,
                    requestedFillAmount: items[i].amount,
                    minimumFillAmount: items[i].amount
                });

            saleDetailsBatch[i] = saleDetails;
            sumListingPrices += saleDetails.itemPrice;

            if (saleDetails.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
                if (saleDetails.amount != ONE) {
                    revert cPort__AmountForERC721SalesMustEqualOne();
                }
            } else {
                if (saleDetails.amount == 0) {
                    revert cPort__AmountForERC1155SalesGreaterThanZero();
                }
            }

            if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
                revert cPort__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
            }

            if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
                _validateSalePriceInRange(
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount, 
                    saleDetails.itemPrice);
            }

            if (block.timestamp > saleDetails.expiration) {
                    revert cPort__OrderHasExpired();
            }

            _verifySaleApproval(domainSeparator, saleDetails, signedSellOrders[i], cosignatures[i]);

            unchecked {
                ++i;
            }
        }

        if (feeOnTop.amount > sumListingPrices) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }
    }

    function _validateSalePriceInRange(
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount, 
        uint256 salePrice
    ) private view {
        (uint256 floorPrice, uint256 ceilingPrice) = _getFloorAndCeilingPrices(tokenAddress, tokenId);

        unchecked {
            uint256 unitPrice = salePrice / amount;

            if (unitPrice > ceilingPrice) {
                revert cPort__SalePriceAboveMaximumCeiling();
            }

            if (unitPrice < floorPrice) {
                revert cPort__SalePriceBelowMinimumFloor();
            }
        }
    }

    function _getFloorAndCeilingPrices(
        address tokenAddress, 
        uint256 tokenId
    ) internal view returns (uint256, uint256) {
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

    /*************************************************************************/
    /*                           Order Fulfillment                           */
    /*************************************************************************/

    function _fulfillSingleOrderWithFeeOnTop(
        uint256 startingNativeFunds,
        bool disablePartialFill,
        address purchaser,
        address seller,
        IERC20 paymentCoin,
        FulfillOrderFunctionPointers memory fnPointers,
        Order memory saleDetails,
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty,
        FeeOnTop memory feeOnTop
    ) private returns (uint256 endingNativeFunds) {
        endingNativeFunds = startingNativeFunds;

        if (!fnPointers.funcDispenseToken(
                seller, 
                saleDetails.beneficiary, 
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount)) {
            if (disablePartialFill) {
                revert cPort__DispensingTokenWasUnsuccessful();
            }
        } else {
            SplitProceeds memory proceeds =
                _computePaymentSplits(
                    saleDetails.itemPrice,
                    saleDetails.tokenAddress,
                    saleDetails.tokenId,
                    saleDetails.marketplace,
                    saleDetails.marketplaceFeeNumerator,
                    saleDetails.maxRoyaltyFeeNumerator,
                    saleDetails.fallbackRoyaltyRecipient,
                    royaltyBackfillAndBounty
                );

            uint256 feeOnTopAmount;
            if (feeOnTop.recipient != address(0)) {
                feeOnTopAmount = feeOnTop.amount;
            }

            if (saleDetails.paymentMethod == address(0)) {
                uint256 nativeProceedsToSpend = saleDetails.itemPrice + feeOnTopAmount;
                if (endingNativeFunds < nativeProceedsToSpend) {
                    revert cPort__RanOutOfNativeFunds();
                }

                unchecked {
                    endingNativeFunds -= nativeProceedsToSpend;
                }
            }

            if (proceeds.royaltyProceeds > 0) {
                fnPointers.funcPayout(proceeds.royaltyRecipient, purchaser, paymentCoin, proceeds.royaltyProceeds, pushPaymentGasLimit);
            }

            if (proceeds.marketplaceProceeds > 0) {
                fnPointers.funcPayout(saleDetails.marketplace, purchaser, paymentCoin, proceeds.marketplaceProceeds, pushPaymentGasLimit);
            }

            if (proceeds.sellerProceeds > 0) {
                fnPointers.funcPayout(seller, purchaser, paymentCoin, proceeds.sellerProceeds, pushPaymentGasLimit);
            }

            if (feeOnTopAmount > 0) {
                if (feeOnTopAmount > saleDetails.itemPrice) {
                    revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
                }

                fnPointers.funcPayout(feeOnTop.recipient, msg.sender, paymentCoin, feeOnTop.amount, pushPaymentGasLimit);
            }

            fnPointers.funcEmitOrderExecutionEvent(saleDetails);
        }
    }

    function _fulfillSweepOrderWithFeeOnTop(
        uint256 startingNativeFunds,
        SweepCollectionComputeAndDistributeProceedsParams memory params
    ) private returns (uint256 endingNativeFunds) {
        endingNativeFunds = startingNativeFunds;

        PayoutsAccumulator memory accumulator = PayoutsAccumulator({
            lastSeller: address(0),
            lastMarketplace: address(0),
            lastRoyaltyRecipient: address(0),
            accumulatedSellerProceeds: 0,
            accumulatedMarketplaceProceeds: 0,
            accumulatedRoyaltyProceeds: 0
        });

        for (uint256 i = 0; i < params.saleDetailsBatch.length;) {
            Order memory saleDetails = params.saleDetailsBatch[i];

            if (!params.fnPointers.funcDispenseToken(
                    saleDetails.maker, 
                    saleDetails.beneficiary, 
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount)) {
            } else {
                SplitProceeds memory proceeds =
                    _computePaymentSplits(
                        saleDetails.itemPrice,
                        saleDetails.tokenAddress,
                        saleDetails.tokenId,
                        saleDetails.marketplace,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        saleDetails.fallbackRoyaltyRecipient,
                        params.royaltyBackfillAndBounty
                    );

                if (saleDetails.paymentMethod == address(0)) {
                    if (endingNativeFunds < saleDetails.itemPrice) {
                        revert cPort__RanOutOfNativeFunds();
                    }
    
                    unchecked {
                        endingNativeFunds -= saleDetails.itemPrice;
                    }
                }
    
                if (proceeds.royaltyRecipient != accumulator.lastRoyaltyRecipient) {
                    if(accumulator.accumulatedRoyaltyProceeds > 0) {
                        params.fnPointers.funcPayout(accumulator.lastRoyaltyRecipient, msg.sender, params.paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        params.fnPointers.funcPayout(accumulator.lastMarketplace, msg.sender, params.paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.maker != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        params.fnPointers.funcPayout(accumulator.lastSeller, msg.sender, params.paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastSeller = saleDetails.maker;
                    accumulator.accumulatedSellerProceeds = 0;
                }

                unchecked {
                    accumulator.accumulatedRoyaltyProceeds += proceeds.royaltyProceeds;
                    accumulator.accumulatedMarketplaceProceeds += proceeds.marketplaceProceeds;
                    accumulator.accumulatedSellerProceeds += proceeds.sellerProceeds;
                }

                params.fnPointers.funcEmitOrderExecutionEvent(saleDetails);
            }

            unchecked {
                ++i;
            }
        }

        if(accumulator.accumulatedRoyaltyProceeds > 0) {
            params.fnPointers.funcPayout(accumulator.lastRoyaltyRecipient, msg.sender, params.paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            params.fnPointers.funcPayout(accumulator.lastMarketplace, msg.sender, params.paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            params.fnPointers.funcPayout(accumulator.lastSeller, msg.sender, params.paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
        }

        if (params.feeOnTop.recipient != address(0)) {
            if (params.feeOnTop.amount > 0) {
                if (address(params.paymentCoin) == address(0)) {
                    if (endingNativeFunds < params.feeOnTop.amount) {
                        revert cPort__RanOutOfNativeFunds();
                    }
    
                    unchecked {
                        endingNativeFunds -= params.feeOnTop.amount;
                    }
                }

                params.fnPointers.funcPayout(params.feeOnTop.recipient, msg.sender, params.paymentCoin, params.feeOnTop.amount, pushPaymentGasLimit);
            }
        }
    }

    function _computePaymentSplits(
        uint256 salePrice,
        address tokenAddress,
        uint256 tokenId,
        address marketplaceFeeRecipient,
        uint256 marketplaceFeeNumerator,
        uint256 maxRoyaltyFeeNumerator,
        address fallbackRoyaltyRecipient,
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty
    ) private view returns (SplitProceeds memory proceeds) {

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
        } catch (bytes memory) {
            // If the token doesn't implement the royaltyInfo function, then check if there are backfilled royalties.
            if (royaltyBackfillAndBounty.backfillReceiver != address(0)) {
                if (royaltyBackfillAndBounty.backfillNumerator > maxRoyaltyFeeNumerator) {
                    revert cPort__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
                }

                proceeds.royaltyRecipient = royaltyBackfillAndBounty.backfillReceiver;
                proceeds.royaltyProceeds = (salePrice * royaltyBackfillAndBounty.backfillNumerator) / FEE_DENOMINATOR;

                unchecked {
                    proceeds.sellerProceeds -= proceeds.royaltyProceeds;
                }
            } else if (fallbackRoyaltyRecipient != address(0)) {
                proceeds.royaltyRecipient = fallbackRoyaltyRecipient;
                proceeds.royaltyProceeds = (salePrice * maxRoyaltyFeeNumerator) / FEE_DENOMINATOR;

                unchecked {
                    proceeds.sellerProceeds -= proceeds.royaltyProceeds;
                }
            }
        }

        if (marketplaceFeeRecipient != address(0)) {
            proceeds.marketplaceProceeds = (salePrice * marketplaceFeeNumerator) / FEE_DENOMINATOR;
            unchecked {
                proceeds.sellerProceeds -= proceeds.marketplaceProceeds;
            }

            if (royaltyBackfillAndBounty.exclusiveMarketplace == address(0) || 
                royaltyBackfillAndBounty.exclusiveMarketplace == marketplaceFeeRecipient) {
                uint256 royaltyBountyProceeds = proceeds.royaltyProceeds * royaltyBackfillAndBounty.bountyNumerator / FEE_DENOMINATOR;
            
                if (royaltyBountyProceeds > 0) {
                    unchecked {
                        proceeds.royaltyProceeds -= royaltyBountyProceeds;
                        proceeds.marketplaceProceeds += royaltyBountyProceeds;
                    }
                }
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
            revert cPort__FailedToTransferProceeds();
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

    function _emitBuyListingERC721Event(Order memory saleDetails) internal {
        emit BuyListingERC721(
                msg.sender,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.itemPrice);
    }

    function _emitBuyListingERC1155Event(Order memory saleDetails) internal {
        emit BuyListingERC1155(
                msg.sender,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.amount,
                saleDetails.itemPrice);
    }

    function _emitAcceptOfferERC721Event(Order memory saleDetails) internal {
        emit AcceptOfferERC721(
                msg.sender,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.itemPrice);
    }

    function _emitAcceptOfferERC1155Event(Order memory saleDetails) internal {
        emit AcceptOfferERC1155(
                msg.sender,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.amount,
                saleDetails.itemPrice);
    }

    function _getOrderFulfillmentFunctionPointers(
        Sides side,
        address paymentMethod,
        OrderProtocols orderProtocol
    ) private view returns (FulfillOrderFunctionPointers memory orderFulfillmentFunctionPointers) {
        orderFulfillmentFunctionPointers = FulfillOrderFunctionPointers({
            funcPayout: paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            funcDispenseToken: orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? _dispenseERC721Token : _dispenseERC1155Token,
            funcEmitOrderExecutionEvent: orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 
                (side == Sides.Buy ? _emitBuyListingERC721Event : _emitAcceptOfferERC721Event) : 
                (side == Sides.Buy ?_emitBuyListingERC1155Event : _emitAcceptOfferERC1155Event)
        });
    }

    /*************************************************************************/
    /*                        Signature Verification                         */
    /*************************************************************************/

    function _checkAndUpdateRemainingFillableItems(
        address account,
        bytes32 orderDigest, 
        uint248 orderStartAmount,
        uint248 requestedFillAmount,
        uint248 minimumFillAmount
    ) private returns (uint248 quantityToFill) {
        quantityToFill = requestedFillAmount;
        PartiallyFillableOrderStatus storage partialFillStatus = 
            appStorage().partiallyFillableOrderStatuses[account][orderDigest];
    
        if (partialFillStatus.state == PartiallyFillableOrderState.Open) {
            if (partialFillStatus.remainingFillableQuantity == 0) {
                partialFillStatus.remainingFillableQuantity = uint248(orderStartAmount);
            }

            if (quantityToFill > partialFillStatus.remainingFillableQuantity) {
                quantityToFill = partialFillStatus.remainingFillableQuantity;
            }

            if (quantityToFill < minimumFillAmount) {
                revert cPort__UnableToFillMinimumRequestedQuantity();
            }

            unchecked {
                partialFillStatus.remainingFillableQuantity -= quantityToFill;
            }

            if (partialFillStatus.remainingFillableQuantity == 0) {
                partialFillStatus.state = PartiallyFillableOrderState.Filled;
                emit OrderDigestInvalidated(orderDigest, account, false);
            }
        } else {
            revert cPort__OrderIsEitherCancelledOrFilled();
        }
    }

    function _checkAndInvalidateNonce(
        address account, 
        uint256 nonce, 
        bool wasCancellation) internal returns (uint256) {

        // The following code is equivalent to, but saves 115 gas units:
        // 
        // mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = 
        //     appStorage().invalidatedSignatures[account];

        // unchecked {
        //     uint256 slot = nonce / 256;
        //     uint256 offset = nonce % 256;
        //     uint256 slotValue = ptrInvalidatedSignatureBitmap[slot];
        // 
        //     if (((slotValue >> offset) & ONE) == ONE) {
        //         revert cPort__SignatureAlreadyUsedOrRevoked();
        //     }
        // 
        //     ptrInvalidatedSignatureBitmap[slot] = (slotValue | ONE << offset);
        // }

        unchecked {
            if (uint256(appStorage().invalidatedSignatures[account][uint248(nonce >> 8)] ^= (ONE << uint8(nonce))) & 
                (ONE << uint8(nonce)) == ZERO) {
                revert cPort__SignatureAlreadyUsedOrRevoked();
            }
        }

        emit NonceInvalidated(nonce, account, wasCancellation);

        return appStorage().masterNonces[account];
    }

    function _revokeOrderDigest(address account, bytes32 orderDigest) internal {
        PartiallyFillableOrderStatus storage partialFillStatus = 
            appStorage().partiallyFillableOrderStatuses[account][orderDigest];
    
        if (partialFillStatus.state == PartiallyFillableOrderState.Open) {
            partialFillStatus.state = PartiallyFillableOrderState.Cancelled;
            partialFillStatus.remainingFillableQuantity = 0;
            emit OrderDigestInvalidated(orderDigest, account, true);
        } else {
            revert cPort__OrderIsEitherCancelledOrFilled();
        }
    }

    function _verifyItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(domainSeparator, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    ITEM_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
                    saleDetails.beneficiary,
                    saleDetails.marketplace,
                    saleDetails.fallbackRoyaltyRecipient,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress
                ),
                abi.encode(
                    saleDetails.tokenId,
                    saleDetails.amount,
                    saleDetails.itemPrice,
                    saleDetails.expiration,
                    saleDetails.marketplaceFeeNumerator,
                    saleDetails.nonce,
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false)
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    function _verifyCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(domainSeparator, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    COLLECTION_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
                    saleDetails.beneficiary,
                    saleDetails.marketplace,
                    saleDetails.fallbackRoyaltyRecipient,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress
                ),
                abi.encode(
                    saleDetails.amount,
                    saleDetails.itemPrice,
                    saleDetails.expiration,
                    saleDetails.marketplaceFeeNumerator,
                    saleDetails.nonce,
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false)
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    function _verifyTokenSetOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(domainSeparator, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    TOKEN_SET_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
                    saleDetails.beneficiary,
                    saleDetails.marketplace,
                    saleDetails.fallbackRoyaltyRecipient,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress
                ),
                abi.encode(
                    saleDetails.amount,
                    saleDetails.itemPrice,
                    saleDetails.expiration,
                    saleDetails.marketplaceFeeNumerator,
                    saleDetails.nonce,
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false),
                    tokenSetProof.rootHash
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    function _verifySaleApproval(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(domainSeparator, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    SALE_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
                    saleDetails.marketplace,
                    saleDetails.fallbackRoyaltyRecipient,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress,
                    saleDetails.tokenId
                ),
                abi.encode(
                    saleDetails.amount,
                    saleDetails.itemPrice,
                    saleDetails.expiration,
                    saleDetails.marketplaceFeeNumerator,
                    saleDetails.maxRoyaltyFeeNumerator,
                    saleDetails.nonce,
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false)
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    function _verifyMakerSignature(address maker, SignatureECDSA memory signature, bytes32 digest ) private view {
        if (maker != _ecdsaRecover(digest, signature.v, signature.r, signature.s)) {
            if (maker.code.length > 0) {
                _verifyEIP1271Signature(maker, digest, signature);
            } else {
                revert cPort__UnauthorizedOrder();
            }
        }
    }

    function _verifyCosignature(
        bytes32 domainSeparator, 
        SignatureECDSA memory signature, 
        Cosignature memory cosignature
    ) private view {
        if (block.timestamp > cosignature.expiration) {
            revert cPort__CosignatureHasExpired();
        }

        if (msg.sender != cosignature.taker) {
            revert cPort__UnauthorizedTaker();
        }

        if (cosignature.signer != _ecdsaRecover(
            _hashTypedDataV4(domainSeparator, keccak256(
                abi.encode(
                    COSIGNATURE_HASH,
                    signature.v,
                    signature.r,
                    signature.s,
                    cosignature.expiration,
                    cosignature.taker
                )
            )), 
            cosignature.v, 
            cosignature.r, 
            cosignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
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

    function _ecdsaRecover(
        bytes32 digest, 
        uint8 v, 
        bytes32 r, 
        bytes32 s
    ) private pure returns (address signer) {
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            revert cPort__UnauthorizedOrder();
        }

        signer = ecrecover(digest, v, r, s);
        if (signer == address(0)) {
            revert cPort__UnauthorizedOrder();
        }
    }

    function _hashTypedDataV4(bytes32 domainSeparator, bytes32 structHash) private pure returns (bytes32) {
        return ECDSA.toTypedDataHash(domainSeparator, structHash);
    }

    /*************************************************************************/
    /*                             Miscellaneous                             */
    /*************************************************************************/

    function _requireCallerOwnsPaymentMethodWhitelist(uint32 paymentMethodWhitelistId) internal view {
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
}