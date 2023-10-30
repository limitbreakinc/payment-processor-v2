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

import "./CPortModule.sol";

contract ModuleSingleTrades is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function buyListing(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public payable {
        uint256 remainingMsgValue = 
            _executeOrderBuySide(
                domainSeparator, 
                true,
                msg.value,
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop
            );

        if (remainingMsgValue > 0) {
            revert cPort__OverpaidNativeFunds();
        }
    }

    function acceptOffer(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public {
        _executeOrderSellSide(
            domainSeparator, 
            true,
            0,
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof,
            cosignature,
            feeOnTop);
    }

    function bulkBuyListings(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata sellerSignatures,
        Cosignature[] calldata cosignatures,
        FeeOnTop[] calldata feesOnTop
    ) public payable {
        if (saleDetailsArray.length != sellerSignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != cosignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != feesOnTop.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        uint256 remainingNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;
        Cosignature memory cosignature;
        FeeOnTop memory feeOnTop;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            sellerSignature = sellerSignatures[i];
            cosignature = cosignatures[i];
            feeOnTop = feesOnTop[i];

            if(saleDetails.paymentMethod == address(0)) {
                remainingNativeProceeds = _executeOrderBuySide(domainSeparator, false, remainingNativeProceeds, saleDetails, sellerSignature, cosignature, feeOnTop);
            } else {
                _executeOrderBuySide(domainSeparator, false, 0, saleDetails, sellerSignature, cosignature, feeOnTop);
            }

            unchecked {
                ++i;
            }
        }

        if (remainingNativeProceeds > 0) {
            revert cPort__OverpaidNativeFunds();
        }
    }

    function bulkAcceptOffers(
        bytes32 domainSeparator, 
        BulkAcceptOffersParams memory params
    ) public {
        if (params.saleDetailsArray.length != params.isCollectionLevelOfferArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.buyerSignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.tokenSetProofsArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.cosignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.feesOnTopArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        for (uint256 i = 0; i < params.saleDetailsArray.length;) {
            _executeOrderSellSide(
                domainSeparator, 
                false,
                0, 
                params.isCollectionLevelOfferArray[i], 
                params.saleDetailsArray[i], 
                params.buyerSignaturesArray[i],
                params.tokenSetProofsArray[i],
                params.cosignaturesArray[i],
                params.feesOnTopArray[i]);

            unchecked {
                ++i;
            }
        }
    }

    function sweepCollection(
        bytes32 domainSeparator, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) public payable {
        _executeSweepOrder(
            domainSeparator,
            msg.value,
            feeOnTop,
            sweepOrder,
            items,
            signedSellOrders,
            cosignatures
        );
    }
}
