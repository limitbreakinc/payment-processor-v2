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

    uint256 private immutable pushPaymentGasLimit;
    address private immutable defaultPaymentMethod1;
    address private immutable defaultPaymentMethod2;
    address private immutable defaultPaymentMethod3;
    address private immutable defaultPaymentMethod4;
    address private immutable defaultPaymentMethod5;
    address private immutable defaultPaymentMethod6;
    address private immutable defaultPaymentMethod7;
    address private immutable defaultPaymentMethod8;

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) {
        pushPaymentGasLimit = defaultPushPaymentGasLimit_;        
        defaultPaymentMethod1 = defaultPaymentMethods.defaultPaymentMethod1;
        defaultPaymentMethod2 = defaultPaymentMethods.defaultPaymentMethod2;
        defaultPaymentMethod3 = defaultPaymentMethods.defaultPaymentMethod3;
        defaultPaymentMethod4 = defaultPaymentMethods.defaultPaymentMethod4;
        defaultPaymentMethod5 = defaultPaymentMethods.defaultPaymentMethod5;
        defaultPaymentMethod6 = defaultPaymentMethods.defaultPaymentMethod6;
        defaultPaymentMethod7 = defaultPaymentMethods.defaultPaymentMethod7;
        defaultPaymentMethod8 = defaultPaymentMethods.defaultPaymentMethod8;
    }

    /*************************************************************************/
    /*                        Default Payment Methods                        */
    /*************************************************************************/

    function isDefaultPaymentMethod(address paymentMethod) public view returns (bool) {
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
        } else if (paymentMethod == defaultPaymentMethod5) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod6) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod7) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod8) {
            return true;
        } else {
            return false;
        }
    }

    function getDefaultPaymentMethods() external view returns (address[] memory) {
        address[] memory defaultPaymentMethods = new address[](9);
        defaultPaymentMethods[0] = address(0);
        defaultPaymentMethods[1] = defaultPaymentMethod1;
        defaultPaymentMethods[2] = defaultPaymentMethod2;
        defaultPaymentMethods[3] = defaultPaymentMethod3;
        defaultPaymentMethods[4] = defaultPaymentMethod4;
        defaultPaymentMethods[5] = defaultPaymentMethod5;
        defaultPaymentMethods[6] = defaultPaymentMethod6;
        defaultPaymentMethods[7] = defaultPaymentMethod7;
        defaultPaymentMethods[8] = defaultPaymentMethod8;
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
        SignatureECDSA memory signedSellOrder
    ) internal returns (uint256 endingNativeFunds) {
        uint248 quantityToFill = _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrder);

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;            
        }

        uint256 msgValueItemPrice;

        if (saleDetails.paymentMethod == address(0)) {
            msgValueItemPrice = saleDetails.itemPrice;

            if (startingNativeFunds < msgValueItemPrice) {
                revert cPort__RanOutOfNativeFunds();
            }

            unchecked {
                endingNativeFunds = startingNativeFunds - msgValueItemPrice;
            }
        }

        _fulfillSingleOrder(
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(msgValueItemPrice, saleDetails));
    }

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 startingNativeFunds,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        FeeOnTop memory feeOnTop
    ) internal returns (uint256 endingNativeFunds) {
        uint248 quantityToFill = _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrder);

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        uint256 msgValueItemPrice = 0;

        if (saleDetails.paymentMethod == address(0)) {
            msgValueItemPrice = saleDetails.itemPrice;

            if (startingNativeFunds < msgValueItemPrice + feeOnTop.amount) {
                revert cPort__RanOutOfNativeFunds();
            }

            unchecked {
                endingNativeFunds = startingNativeFunds - msgValueItemPrice - feeOnTop.amount;
            }
        }

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(msgValueItemPrice, saleDetails),
            feeOnTop);
    }

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 startingNativeFunds,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) internal returns (uint256 endingNativeFunds) {
        uint248 quantityToFill;

        if (cosignature.signer != address(0)) {
            quantityToFill = 
                _verifyCosignedSaleApproval(domainSeparator, saleDetails, signedSellOrder, cosignature);
        } else {
            quantityToFill = _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrder);
        }

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        uint256 msgValueItemPrice = 0;

        if (saleDetails.paymentMethod == address(0)) {
            msgValueItemPrice = saleDetails.itemPrice;

            if (startingNativeFunds < msgValueItemPrice + feeOnTop.amount) {
                revert cPort__RanOutOfNativeFunds();
            }

            unchecked {
                endingNativeFunds = startingNativeFunds - msgValueItemPrice - feeOnTop.amount;
            }
        }

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(msgValueItemPrice, saleDetails),
            feeOnTop);
    }

    function _executeOrderSellSide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof
    ) internal {
        if (saleDetails.paymentMethod == address(0)) {
            revert cPort__BadPaymentMethod();
        }

        uint248 quantityToFill;

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                quantityToFill = _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                if(!MerkleProof.verify(
                    tokenSetProof.proof, 
                    tokenSetProof.rootHash, 
                    keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                quantityToFill = 
                    _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
            }
        } else {
            quantityToFill = _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
        }

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        _fulfillSingleOrder(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(msgValue, saleDetails));
    }

    function _executeOrderSellSide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        FeeOnTop memory feeOnTop
    ) internal {
        if (saleDetails.paymentMethod == address(0)) {
            revert cPort__BadPaymentMethod();
        }

        uint248 quantityToFill;

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                quantityToFill = _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                if(!MerkleProof.verify(
                    tokenSetProof.proof, 
                    tokenSetProof.rootHash, 
                    keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                quantityToFill = 
                    _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
            }
        } else {
            quantityToFill = _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
        }

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(msgValue, saleDetails),
            feeOnTop);
    }

    function _executeOrderSellSide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature
    ) internal {
        if (saleDetails.paymentMethod == address(0)) {
            revert cPort__BadPaymentMethod();
        }

        uint248 quantityToFill;

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                if (cosignature.signer == address(0)) {
                    quantityToFill = _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
                } else {
                    quantityToFill = 
                        _verifyCosignedCollectionOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
                }
            } else {
                if(!MerkleProof.verify(
                    tokenSetProof.proof, 
                    tokenSetProof.rootHash, 
                    keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                if (cosignature.signer == address(0)) {
                    quantityToFill = 
                        _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
                } else {
                    quantityToFill = 
                        _verifyCosignedTokenSetOffer(
                            domainSeparator, 
                            saleDetails, 
                            buyerSignature, 
                            tokenSetProof, 
                            cosignature);
                }
            }
        } else {
            if (cosignature.signer == address(0)) {
                quantityToFill = _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                quantityToFill = 
                    _verifyCosignedItemOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
            }
        }

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        _fulfillSingleOrder(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            _validateBasicOrderDetails(msgValue, saleDetails));
    }

    function _executeOrderSellSide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
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
                if (cosignature.signer == address(0)) {
                    quantityToFill = _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
                } else {
                    quantityToFill = 
                        _verifyCosignedCollectionOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
                }
            } else {
                if(!MerkleProof.verify(
                    tokenSetProof.proof, 
                    tokenSetProof.rootHash, 
                    keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                if (cosignature.signer == address(0)) {
                    quantityToFill = 
                        _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
                } else {
                    quantityToFill = 
                        _verifyCosignedTokenSetOffer(
                            domainSeparator, 
                            saleDetails, 
                            buyerSignature, 
                            tokenSetProof, 
                            cosignature);
                }
            }
        } else {
            if (cosignature.signer == address(0)) {
                quantityToFill = _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                quantityToFill = 
                    _verifyCosignedItemOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
            }
        }

        if (quantityToFill != saleDetails.amount) {
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty = _validateBasicOrderDetails(msgValue, saleDetails);

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            royaltyBackfillAndBounty,
            feeOnTop);
    }

    

    function _executeSweepOrder(
        bytes32 domainSeparator,
        uint256 msgValue,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders) internal {

        if (sweepOrder.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            revert cPort__OrderProtocolERC1155FillPartialUnsupportedInSweeps();
        }

        if (items.length != signedSellOrders.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        (Order[] memory saleDetailsBatch, RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) = 
            _validateSweepOrder(
                domainSeparator,
                msgValue,
                feeOnTop,
                sweepOrder,
                items,
                signedSellOrders,
                new Cosignature[](items.length));

        _fulfillSweepOrderWithFeeOnTop(
            SweepCollectionComputeAndDistributeProceedsParams({
                paymentCoin: IERC20(sweepOrder.paymentMethod),
                fnPointers: _getOrderFulfillmentFunctionPointers(sweepOrder.paymentMethod, sweepOrder.protocol),
                feeOnTop: feeOnTop,
                royaltyBackfillAndBounty: royaltyBackfillAndBounty,
                saleDetailsBatch: saleDetailsBatch
            })
        );
    }

    function _executeSweepOrder(
        bytes32 domainSeparator,
        uint256 msgValue,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures) internal {

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
                msgValue,
                feeOnTop,
                sweepOrder,
                items,
                signedSellOrders,
                cosignatures
            );

        _fulfillSweepOrderWithFeeOnTop(
            SweepCollectionComputeAndDistributeProceedsParams({
                paymentCoin: IERC20(sweepOrder.paymentMethod),
                fnPointers: _getOrderFulfillmentFunctionPointers(sweepOrder.paymentMethod, sweepOrder.protocol),
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
        uint256 msgValue, 
        Order memory saleDetails
    ) private view returns (RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) {
        if (saleDetails.paymentMethod == address(0)) {
            if (saleDetails.itemPrice != msgValue) {
                revert cPort__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msgValue > 0) {
                revert cPort__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

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
        uint256 msgValue,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) private returns (Order[] memory saleDetailsBatch, RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) {
        CollectionPaymentSettings memory paymentSettingsForCollection = appStorage().collectionPaymentSettings[sweepOrder.tokenAddress];

        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!isDefaultPaymentMethod(sweepOrder.paymentMethod)) {
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

            if (cosignatures[i].signer != address(0)) {
                _verifyCosignedSaleApproval(domainSeparator, saleDetails, signedSellOrders[i], cosignatures[i]);
            } else {
                _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrders[i]);
            }

            unchecked {
                ++i;
            }
        }

        if (feeOnTop.amount > sumListingPrices) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }

        if (sweepOrder.paymentMethod == address(0)) {
            if (feeOnTop.amount + sumListingPrices != msgValue) {
                revert cPort__IncorrectFundsToCoverFeeOnTop();
            }
        } else {
            if (msgValue > 0) {
                revert cPort__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
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

    function _fulfillSingleOrder(
        bool disablePartialFill,
        address purchaser,
        address seller,
        IERC20 paymentCoin,
        FulfillOrderFunctionPointers memory fnPointers,
        Order memory saleDetails,
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty
    ) private {
        if (!fnPointers.funcDispenseToken(
                seller, 
                saleDetails.beneficiary, 
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount)) {
            if (address(paymentCoin) == address(0)) {
                revert cPort__DispensingTokenWasUnsuccessful();
            }

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
                    royaltyBackfillAndBounty
                );

            if (proceeds.royaltyProceeds > 0) {
                fnPointers.funcPayout(proceeds.royaltyRecipient, purchaser, paymentCoin, proceeds.royaltyProceeds, pushPaymentGasLimit);
            }

            if (proceeds.marketplaceProceeds > 0) {
                fnPointers.funcPayout(saleDetails.marketplace, purchaser, paymentCoin, proceeds.marketplaceProceeds, pushPaymentGasLimit);
            }

            if (proceeds.sellerProceeds > 0) {
                fnPointers.funcPayout(seller, purchaser, paymentCoin, proceeds.sellerProceeds, pushPaymentGasLimit);
            }

            fnPointers.funcEmitOrderExecutionEvent(saleDetails);
        }
    }

    function _fulfillSingleOrderWithFeeOnTop(
        bool disablePartialFill,
        address purchaser,
        address seller,
        IERC20 paymentCoin,
        FulfillOrderFunctionPointers memory fnPointers,
        Order memory saleDetails,
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty,
        FeeOnTop memory feeOnTop
    ) private {
        if (feeOnTop.amount > saleDetails.itemPrice) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }

        if (!fnPointers.funcDispenseToken(
                seller, 
                saleDetails.beneficiary, 
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount)) {
            if (address(paymentCoin) == address(0)) {
                revert cPort__DispensingTokenWasUnsuccessful();
            }

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
                    royaltyBackfillAndBounty
                );

            if (proceeds.royaltyProceeds > 0) {
                fnPointers.funcPayout(proceeds.royaltyRecipient, purchaser, paymentCoin, proceeds.royaltyProceeds, pushPaymentGasLimit);
            }

            if (proceeds.marketplaceProceeds > 0) {
                fnPointers.funcPayout(saleDetails.marketplace, purchaser, paymentCoin, proceeds.marketplaceProceeds, pushPaymentGasLimit);
            }

            if (proceeds.sellerProceeds > 0) {
                fnPointers.funcPayout(seller, purchaser, paymentCoin, proceeds.sellerProceeds, pushPaymentGasLimit);
            }

            if (feeOnTop.recipient != address(0)) {
                if (feeOnTop.amount > 0) {
                    fnPointers.funcPayout(feeOnTop.recipient, msg.sender, paymentCoin, feeOnTop.amount, pushPaymentGasLimit);
                }
            }

            fnPointers.funcEmitOrderExecutionEvent(saleDetails);
        }
    }

    function _fulfillSweepOrderWithFeeOnTop(SweepCollectionComputeAndDistributeProceedsParams memory params) private {
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
                if (address(params.paymentCoin) == address(0)) {
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
                        params.royaltyBackfillAndBounty
                    );
    
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
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) private view returns (SplitProceeds memory proceeds) {

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
                proceeds.royaltyRecipient = royaltyBackfillAndBounty.backfillReceiver;
                proceeds.royaltyProceeds = (salePrice * royaltyBackfillAndBounty.backfillNumerator) / FEE_DENOMINATOR;

                if (proceeds.royaltyProceeds > (salePrice * maxRoyaltyFeeNumerator) / FEE_DENOMINATOR) {
                    revert cPort__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
                }

                unchecked {
                    proceeds.sellerProceeds -= proceeds.royaltyProceeds;
                }
            }
        }

        proceeds.marketplaceProceeds =
            marketplaceFeeRecipient != address(0) ? (salePrice * marketplaceFeeNumerator) / FEE_DENOMINATOR : 0;
        if (proceeds.marketplaceProceeds > 0) {
            unchecked {
                proceeds.sellerProceeds -= proceeds.marketplaceProceeds;
            }
        }

        if (marketplaceFeeRecipient != address(0)) {
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
        address paymentMethod,
        OrderProtocols orderProtocol
    ) private view returns (FulfillOrderFunctionPointers memory orderFulfillmentFunctionPointers) {
        orderFulfillmentFunctionPointers = FulfillOrderFunctionPointers({
            funcPayout: paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            funcDispenseToken: orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? _dispenseERC721Token : _dispenseERC1155Token,
            funcEmitOrderExecutionEvent: orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? _emitBuyListingERC721Event : _emitBuyListingERC1155Event
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

        mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = 
            appStorage().invalidatedSignatures[account];

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

    function _verifySignedItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature
    ) private returns (uint248 quantityToFill) {
        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    ITEM_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    saleDetails.maker,
                    saleDetails.beneficiary,
                    saleDetails.marketplace,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress,
                    saleDetails.tokenId
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

    function _verifyCosignedItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        _verifyCosignature(domainSeparator, signature, cosignature);

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    ITEM_OFFER_APPROVAL_COSIGNED_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
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
                    saleDetails.marketplaceFeeNumerator
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

    function _verifySignedCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature
    ) private returns (uint248 quantityToFill) {
        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    COLLECTION_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    saleDetails.maker,
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

    function _verifyCosignedCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        _verifyCosignature(domainSeparator, signature, cosignature);

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    COLLECTION_OFFER_APPROVAL_COSIGNED_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
                    saleDetails.beneficiary,
                    saleDetails.marketplace,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress
                ),
                abi.encode(
                    saleDetails.amount,
                    saleDetails.itemPrice,
                    saleDetails.expiration,
                    saleDetails.marketplaceFeeNumerator
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

    function _verifySignedTokenSetOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof
    ) private returns (uint248 quantityToFill) {
        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    TOKEN_SET_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    saleDetails.maker,
                    saleDetails.beneficiary,
                    saleDetails.marketplace,
                    saleDetails.paymentMethod,
                    saleDetails.tokenAddress,
                    saleDetails.amount
                ),
                abi.encode(
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

    function _verifyCosignedTokenSetOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        _verifyCosignature(domainSeparator, signature, cosignature);

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    TOKEN_SET_OFFER_APPROVAL_COSIGNED_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
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

    function _verifySignedSaleApproval(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature
    ) private returns (uint248 quantityToFill) {
        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    SALE_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    saleDetails.maker,
                    saleDetails.marketplace,
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

    function _verifyCosignedSaleApproval(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        _verifyCosignature(domainSeparator, signature, cosignature);

        bytes32 orderDigest = _hashTypedDataV4(domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    SALE_APPROVAL_COSIGNED_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
                    saleDetails.maker,
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
                revert cPort__UnauthorizeOrder();
            }
        }
    }

    function _verifyCosignature(
        bytes32 domainSeparator, 
        SignatureECDSA memory signature, 
        Cosignature memory cosignature
    ) private view {
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

        if (msg.sender != cosignature.taker) {
            revert cPort__UnauthorizedTaker();
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
            revert cPort__UnauthorizeOrder();
        }

        signer = ecrecover(digest, v, r, s);
        if (signer == address(0)) {
            revert cPort__UnauthorizeOrder();
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