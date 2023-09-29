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

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

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

    function _validateBasicOrderDetails(
        uint256 msgValue, 
        Order memory saleDetails
    ) internal returns (RoyaltyBounty memory royaltyBounty) {
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

        royaltyBounty.numerator = paymentSettingsForCollection.royaltyBountyNumerator;
        royaltyBounty.exclusiveMarketplace = 
            paymentSettingsForCollection.isRoyaltyBountyExclusive ? 
                appStorage().collectionExclusiveBountyReceivers[saleDetails.tokenAddress] : 
                address(0);
    }

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder
    ) internal {
        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValue, saleDetails);
        _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrder);

        _fulfillSingleOrder(
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitBuyListingERC1155Event : _emitBuyListingERC721Event,
            saleDetails,
            royaltyBounty);
    }

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        FeeOnTop memory feeOnTop
    ) internal {
        if (feeOnTop.amount > saleDetails.itemPrice) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }

        uint256 msgValueItemPrice = 0;

        if (saleDetails.paymentMethod == address(0)) {
            if (feeOnTop.amount + saleDetails.itemPrice != msgValue) {
                revert cPort__IncorrectFundsToCoverFeeOnTop();
            }
            
            msgValueItemPrice = saleDetails.itemPrice;
        }

        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValueItemPrice, saleDetails);
        _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrder);

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitBuyListingERC1155Event : _emitBuyListingERC721Event,
            saleDetails,
            royaltyBounty,
            feeOnTop);
    }

    function _executeOrderBuySide(
        bytes32 domainSeparator,
        bool disablePartialFill,
        uint256 msgValue,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) internal {
        if (feeOnTop.amount > saleDetails.itemPrice) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }

        uint256 msgValueItemPrice = 0;

        if (saleDetails.paymentMethod == address(0)) {
            if (feeOnTop.amount + saleDetails.itemPrice != msgValue) {
                revert cPort__IncorrectFundsToCoverFeeOnTop();
            }
            
            msgValueItemPrice = saleDetails.itemPrice;
        }

        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValueItemPrice, saleDetails);

        if (cosignature.signer != address(0)) {
            _verifyCosignedSaleApproval(domainSeparator, saleDetails, signedSellOrder, cosignature);
        } else {
            _verifySignedSaleApproval(domainSeparator, saleDetails, signedSellOrder);
        }

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            msg.sender,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitBuyListingERC1155Event : _emitBuyListingERC721Event,
            saleDetails,
            royaltyBounty,
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
        //_verifyCallerIsSeller(saleDetails.seller);
        _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValue, saleDetails);

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                if(!MerkleProof.verify(tokenSetProof.proof, tokenSetProof.rootHash, keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
            }
        } else {
            _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
        }

        _fulfillSingleOrder(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitAcceptOfferERC1155Event : _emitAcceptOfferERC721Event,
            saleDetails,
            royaltyBounty);
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
        if (feeOnTop.amount > saleDetails.itemPrice) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }

        //_verifyCallerIsSeller(saleDetails.seller);
        _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValue, saleDetails);

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                if(!MerkleProof.verify(tokenSetProof.proof, tokenSetProof.rootHash, keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
            }
        } else {
            _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
        }

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitAcceptOfferERC1155Event : _emitAcceptOfferERC721Event,
            saleDetails,
            royaltyBounty,
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
        //_verifyCallerIsSeller(saleDetails.seller);
        _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValue, saleDetails);

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                if (cosignature.signer == address(0)) {
                    _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
                } else {
                    _verifyCosignedCollectionOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
                }
            } else {
                if(!MerkleProof.verify(tokenSetProof.proof, tokenSetProof.rootHash, keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                if (cosignature.signer == address(0)) {
                    _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
                } else {
                    _verifyCosignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof, cosignature);
                }
            }
        } else {
            if (cosignature.signer == address(0)) {
                _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                _verifyCosignedItemOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
            }
        }

        _fulfillSingleOrder(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitAcceptOfferERC1155Event : _emitAcceptOfferERC721Event,
            saleDetails,
            royaltyBounty);
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
        if (feeOnTop.amount > saleDetails.itemPrice) {
            revert cPort__FeeOnTopCannotBeGreaterThanItemPrice();
        }

        //_verifyCallerIsSeller(saleDetails.seller);
        _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
        RoyaltyBounty memory royaltyBounty = _validateBasicOrderDetails(msgValue, saleDetails);

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                if (cosignature.signer == address(0)) {
                    _verifySignedCollectionOffer(domainSeparator, saleDetails, buyerSignature);
                } else {
                    _verifyCosignedCollectionOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
                }
            } else {
                if(!MerkleProof.verify(tokenSetProof.proof, tokenSetProof.rootHash, keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert cPort__IncorrectTokenSetMerkleProof();
                }

                if (cosignature.signer == address(0)) {
                    _verifySignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof);
                } else {
                    _verifyCosignedTokenSetOffer(domainSeparator, saleDetails, buyerSignature, tokenSetProof, cosignature);
                }
            }
        } else {
            if (cosignature.signer == address(0)) {
                _verifySignedItemOffer(domainSeparator, saleDetails, buyerSignature);
            } else {
                _verifyCosignedItemOffer(domainSeparator, saleDetails, buyerSignature, cosignature);
            }
        }

        _fulfillSingleOrderWithFeeOnTop(
            disablePartialFill,
            saleDetails.maker,
            msg.sender,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _emitAcceptOfferERC1155Event : _emitAcceptOfferERC721Event,
            saleDetails,
            royaltyBounty,
            feeOnTop);
    }

    function _executeSweepOrder(
        bytes32 domainSeparator,
        uint256 msgValue,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders) internal {

        if (items.length != signedSellOrders.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        (Order[] memory saleDetailsBatch, RoyaltyBounty memory royaltyBounty) = 
            _validateSweepOrder(
                domainSeparator,
                msgValue,
                feeOnTop,
                sweepOrder,
                items,
                signedSellOrders,
                new Cosignature[](items.length));

        _fulfillSweepOrderWithFeeOnTop(
            SweepCollectionComputeAndDistributeProceedsParams(
                IERC20(sweepOrder.paymentMethod),
                sweepOrder.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
                sweepOrder.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
                sweepOrder.protocol == TokenProtocols.ERC1155 ? _emitBuyListingERC1155Event : _emitBuyListingERC721Event,
                feeOnTop,
                royaltyBounty,
                saleDetailsBatch
            ));
    }

    function _executeSweepOrder(
        bytes32 domainSeparator,
        uint256 msgValue,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures) internal {

        if (items.length != signedSellOrders.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length != cosignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        (Order[] memory saleDetailsBatch, RoyaltyBounty memory royaltyBounty) = 
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
            SweepCollectionComputeAndDistributeProceedsParams(
                IERC20(sweepOrder.paymentMethod),
                sweepOrder.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
                sweepOrder.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
                sweepOrder.protocol == TokenProtocols.ERC1155 ? _emitBuyListingERC1155Event : _emitBuyListingERC721Event,
                feeOnTop,
                royaltyBounty,
                saleDetailsBatch
            ));
    }

    function _validateSweepOrder(
        bytes32 domainSeparator,
        uint256 msgValue,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) internal returns (Order[] memory saleDetailsBatch, RoyaltyBounty memory royaltyBounty) {
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

        royaltyBounty.numerator = paymentSettingsForCollection.royaltyBountyNumerator;
        royaltyBounty.exclusiveMarketplace = 
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
                    marketplace: sweepOrder.marketplace,
                    paymentMethod: sweepOrder.paymentMethod,
                    tokenAddress: sweepOrder.tokenAddress,
                    tokenId: items[i].tokenId,
                    amount: items[i].amount,
                    itemPrice: items[i].itemPrice,
                    nonce: items[i].nonce,
                    expiration: items[i].expiration,
                    marketplaceFeeNumerator: sweepOrder.marketplaceFeeNumerator,
                    maxRoyaltyFeeNumerator: items[i].maxRoyaltyFeeNumerator
                });

            saleDetailsBatch[i] = saleDetails;
            sumListingPrices += saleDetails.itemPrice;

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

    function _verifySignedCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature
    ) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
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
                        saleDetails.maxRoyaltyFeeNumerator,
                        saleDetails.nonce,
                        _checkAndInvalidateNonce(
                            saleDetails.maker,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifyCosignedCollectionOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) internal view {
        bytes32 orderDigest = 
            _hashTypedDataV4(domainSeparator, keccak256(
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
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    )
                )
            )
        );

        bytes32 cosignedDigest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                abi.encode(
                    COSIGNATURE_HASH,
                    signature.v,
                    signature.r,
                    signature.s,
                    cosignature.expiration
                )
            )
        );

        if (cosignature.signer != ECDSA.recover(cosignedDigest, cosignature.v, cosignature.r, cosignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, orderDigest, signature);
        } else if (saleDetails.maker != ECDSA.recover(orderDigest, signature.v, signature.r, signature.s)) {
            revert cPort__BuyerDidNotAuthorizePurchase();
        }
    }

    function _verifySignedItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature
    ) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        ITEM_OFFER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
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
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        saleDetails.nonce,
                        _checkAndInvalidateNonce(
                            saleDetails.maker,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifyCosignedItemOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) internal view {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
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
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    )
                )
            )
        );

        bytes32 cosignedDigest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                abi.encode(
                    COSIGNATURE_HASH,
                    signature.v,
                    signature.r,
                    signature.s,
                    cosignature.expiration
                )
            )
        );

        if (cosignature.signer != ECDSA.recover(cosignedDigest, cosignature.v, cosignature.r, cosignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__BuyerDidNotAuthorizePurchase();
        }
    }

    function _verifySignedTokenSetOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof
    ) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        TOKEN_SET_OFFER_APPROVAL_HASH,
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
                        saleDetails.maxRoyaltyFeeNumerator,
                        saleDetails.nonce,
                        _checkAndInvalidateNonce(
                            saleDetails.maker,
                            saleDetails.nonce,
                            false
                        ),
                        tokenSetProof.rootHash
                    )
                )
            )
        );

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifyCosignedTokenSetOffer(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature
    ) internal view {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
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
                        saleDetails.maxRoyaltyFeeNumerator,
                        tokenSetProof.rootHash
                    )
                )
            )
        );

        bytes32 cosignedDigest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                abi.encode(
                    COSIGNATURE_HASH,
                    signature.v,
                    signature.r,
                    signature.s,
                    cosignature.expiration
                )
            )
        );

        if (cosignature.signer != ECDSA.recover(cosignedDigest, cosignature.v, cosignature.r, cosignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifySignedSaleApproval(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature
    ) internal {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                bytes.concat(
                    abi.encode(
                        SALE_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
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
                        saleDetails.maxRoyaltyFeeNumerator,
                        saleDetails.nonce,
                        _checkAndInvalidateNonce(
                            saleDetails.maker,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__UnauthorizeSale();
        }
    }

    function _verifyCosignedSaleApproval(
        bytes32 domainSeparator,
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) internal view {
        bytes32 digest = 
            _hashTypedDataV4(domainSeparator, keccak256(
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
            )
        );

        bytes32 cosignedDigest = 
            _hashTypedDataV4(domainSeparator, keccak256(
                abi.encode(
                    COSIGNATURE_HASH,
                    signature.v,
                    signature.r,
                    signature.s,
                    cosignature.expiration
                )
            )
        );

        if (cosignature.signer != ECDSA.recover(cosignedDigest, cosignature.v, cosignature.r, cosignature.s)) {
            revert cPort__NotAuthorizedByCoSigner();
        }

        if(saleDetails.maker.code.length > 0) {
            _verifyEIP1271Signature(saleDetails.maker, digest, signature);
        } else if (saleDetails.maker != ECDSA.recover(digest, signature.v, signature.r, signature.s)) {
            revert cPort__SellerDidNotAuthorizeSale();
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

    function _fulfillSingleOrder(
        bool disablePartialFill,
        address purchaser,
        address seller,
        IERC20 paymentCoin,
        function(address,address,IERC20,uint256,uint256) funcPayout,
        function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken,
        function(Order memory) funcEmitOrderExecutionEvent,
        Order memory saleDetails,
        RoyaltyBounty memory royaltyBounty) internal {

        if (!funcDispenseToken(
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
                    royaltyBounty
                );

            if (proceeds.royaltyProceeds > 0) {
                funcPayout(proceeds.royaltyRecipient, purchaser, paymentCoin, proceeds.royaltyProceeds, pushPaymentGasLimit);
            }

            if (proceeds.marketplaceProceeds > 0) {
                funcPayout(saleDetails.marketplace, purchaser, paymentCoin, proceeds.marketplaceProceeds, pushPaymentGasLimit);
            }

            if (proceeds.sellerProceeds > 0) {
                funcPayout(seller, purchaser, paymentCoin, proceeds.sellerProceeds, pushPaymentGasLimit);
            }

            funcEmitOrderExecutionEvent(saleDetails);
        }
    }

    function _fulfillSingleOrderWithFeeOnTop(
        bool disablePartialFill,
        address purchaser,
        address seller,
        IERC20 paymentCoin,
        function(address,address,IERC20,uint256,uint256) funcPayout,
        function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken,
        function(Order memory) funcEmitOrderExecutionEvent,
        Order memory saleDetails,
        RoyaltyBounty memory royaltyBounty,
        FeeOnTop memory feeOnTop) internal {

        if (!funcDispenseToken(
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
                    royaltyBounty
                );

            if (proceeds.royaltyProceeds > 0) {
                funcPayout(proceeds.royaltyRecipient, purchaser, paymentCoin, proceeds.royaltyProceeds, pushPaymentGasLimit);
            }

            if (proceeds.marketplaceProceeds > 0) {
                funcPayout(saleDetails.marketplace, purchaser, paymentCoin, proceeds.marketplaceProceeds, pushPaymentGasLimit);
            }

            if (proceeds.sellerProceeds > 0) {
                funcPayout(seller, purchaser, paymentCoin, proceeds.sellerProceeds, pushPaymentGasLimit);
            }

            if (feeOnTop.recipient != address(0)) {
                if (feeOnTop.amount > 0) {
                    funcPayout(feeOnTop.recipient, msg.sender, paymentCoin, feeOnTop.amount, pushPaymentGasLimit);
                }
            }

            funcEmitOrderExecutionEvent(saleDetails);
        }
    }

    function _fulfillSweepOrderWithFeeOnTop(SweepCollectionComputeAndDistributeProceedsParams memory params) internal {
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

            if (!params.funcDispenseToken(
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
                        params.royaltyBounty
                    );
    
                if (proceeds.royaltyRecipient != accumulator.lastRoyaltyRecipient) {
                    if(accumulator.accumulatedRoyaltyProceeds > 0) {
                        params.funcPayout(accumulator.lastRoyaltyRecipient, msg.sender, params.paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        params.funcPayout(accumulator.lastMarketplace, msg.sender, params.paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.maker != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        params.funcPayout(accumulator.lastSeller, msg.sender, params.paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastSeller = saleDetails.maker;
                    accumulator.accumulatedSellerProceeds = 0;
                }

                unchecked {
                    accumulator.accumulatedRoyaltyProceeds += proceeds.royaltyProceeds;
                    accumulator.accumulatedMarketplaceProceeds += proceeds.marketplaceProceeds;
                    accumulator.accumulatedSellerProceeds += proceeds.sellerProceeds;
                }

                params.funcEmitOrderExecutionEvent(saleDetails);
            }

            unchecked {
                ++i;
            }
        }

        if(accumulator.accumulatedRoyaltyProceeds > 0) {
            params.funcPayout(accumulator.lastRoyaltyRecipient, msg.sender, params.paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            params.funcPayout(accumulator.lastMarketplace, msg.sender, params.paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            params.funcPayout(accumulator.lastSeller, msg.sender, params.paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
        }

        if (params.feeOnTop.recipient != address(0)) {
            if (params.feeOnTop.amount > 0) {
                params.funcPayout(params.feeOnTop.recipient, msg.sender, params.paymentCoin, params.feeOnTop.amount, pushPaymentGasLimit);
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

    function _computePaymentSplits(
        uint256 salePrice,
        address tokenAddress,
        uint256 tokenId,
        address marketplaceFeeRecipient,
        uint256 marketplaceFeeNumerator,
        uint256 maxRoyaltyFeeNumerator,
        RoyaltyBounty memory royaltyBounty) internal view returns (SplitProceeds memory proceeds) {

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

        if (marketplaceFeeRecipient != address(0)) {
            if (royaltyBounty.exclusiveMarketplace == address(0) || 
                royaltyBounty.exclusiveMarketplace == marketplaceFeeRecipient) {
                uint256 royaltyBountyProceeds = proceeds.royaltyProceeds * royaltyBounty.numerator / FEE_DENOMINATOR;
            
                if (royaltyBountyProceeds > 0) {
                    unchecked {
                        proceeds.royaltyProceeds -= royaltyBountyProceeds;
                        proceeds.marketplaceProceeds += royaltyBountyProceeds;
                    }
                }
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

    function _verifyCallerIsSeller(address seller) internal view {
        if(seller != msg.sender) {
            revert cPort__SellerMustBeCaller();
        }
    }

    function _hashTypedDataV4(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32) {
        return ECDSA.toTypedDataHash(domainSeparator, structHash);
    }

    function _requireCallerOwnsPaymentMethodWhitelist(uint64 paymentMethodWhitelistId) internal view {
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