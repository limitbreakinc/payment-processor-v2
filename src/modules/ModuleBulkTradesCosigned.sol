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

contract ModuleBulkTradesCosigned is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function bulkBuyListingsCosigned(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata sellerSignatures,
        Cosignature[] calldata cosignatures
    ) public payable {
        if (saleDetailsArray.length != sellerSignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != cosignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        uint256 remainingNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;
        Cosignature memory cosignature;
        FeeOnTop memory emptyFeeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            sellerSignature = sellerSignatures[i];
            cosignature = cosignatures[i];

            if(saleDetails.paymentMethod == address(0)) {
                remainingNativeProceeds = _executeOrderBuySide(domainSeparator, false, remainingNativeProceeds, saleDetails, sellerSignature, cosignature, emptyFeeOnTop);
            } else {
                _executeOrderBuySide(domainSeparator, false, 0, saleDetails, sellerSignature, cosignature, emptyFeeOnTop);
            }

            unchecked {
                ++i;
            }
        }

        if (remainingNativeProceeds > 0) {
            revert cPort__OverpaidNativeFunds();
        }
    }

    function bulkBuyListingsCosignedWithFeesOnTop(
        bytes32 domainSeparator, 
        BulkBuyListingsCosignedWithFeeOnTopParams memory params
    ) public payable {
        if (params.saleDetailsArray.length != params.sellerSignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.cosignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.feesOnTop.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        uint256 remainingNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;
        Cosignature memory cosignature;
        FeeOnTop memory feeOnTop;

        for (uint256 i = 0; i < params.saleDetailsArray.length;) {
            saleDetails = params.saleDetailsArray[i];
            sellerSignature = params.sellerSignatures[i];
            cosignature = params.cosignatures[i];
            feeOnTop = params.feesOnTop[i];

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

    function bulkAcceptOffersCosigned(
        bytes32 domainSeparator, 
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata buyerSignaturesArray,
        TokenSetProof[] calldata tokenSetProofsArray,
        Cosignature[] calldata cosignaturesArray
    ) public {
        if (saleDetailsArray.length != isCollectionLevelOfferArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != buyerSignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != tokenSetProofsArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != cosignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        FeeOnTop memory emptyFeeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            _executeOrderSellSide(
                domainSeparator, 
                false,
                0, 
                isCollectionLevelOfferArray[i], 
                saleDetailsArray[i], 
                buyerSignaturesArray[i],
                tokenSetProofsArray[i],
                cosignaturesArray[i],
                emptyFeeOnTop);

            unchecked {
                ++i;
            }
        }
    }

    function bulkAcceptOffersCosignedWithFeesOnTop(
        bytes32 domainSeparator, 
        BulkAcceptOffersCosignedWithFeeOnTopParams memory params
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
}
