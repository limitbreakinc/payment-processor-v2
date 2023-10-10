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

import "./CPortModule.sol";

contract ModulePartiallyFillableTrades is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function buyListingPartialFill(
        bytes32 domainSeparator, 
        FillAmounts memory fillAmounts,
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public payable {
        _executeOrderBuySidePartialFill(
            domainSeparator, 
            true,
            msg.value,
            fillAmounts,
            saleDetails, 
            sellerSignature,
            cosignature,
            feeOnTop
        );
    }

    function acceptOfferPartialFill(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        FillAmounts memory fillAmounts,
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public {
        _executeOrderSellSidePartialFill(
            domainSeparator, 
            true,
            0,
            isCollectionLevelOffer, 
            fillAmounts,
            saleDetails, 
            buyerSignature,
            tokenSetProof,
            cosignature,
            feeOnTop);
    }

    function bulkBuyListingsPartialFill(
        bytes32 domainSeparator, 
        FillAmounts[] calldata fillAmountsArray,
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

        if (params.saleDetailsArray.length != fillAmountsArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        uint256 runningBalanceNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;
        Cosignature memory cosignature;
        FeeOnTop memory feeOnTop;
        FillAmounts memory fillAmounts;
        uint256 msgValue;

        for (uint256 i = 0; i < params.saleDetailsArray.length;) {
            saleDetails = params.saleDetailsArray[i];
            sellerSignature = params.sellerSignatures[i];
            cosignature = params.cosignatures[i];
            feeOnTop = params.feesOnTop[i];
            fillAmounts = fillAmountsArray[i];
            msgValue = 0;

            if(saleDetails.paymentMethod == address(0)) {
                msgValue = saleDetails.itemPrice + feeOnTop.amount;

                if (runningBalanceNativeProceeds < msgValue) {
                    revert cPort__RanOutOfNativeFunds();
                }

                unchecked {
                    runningBalanceNativeProceeds -= msgValue;
                }

                _executeOrderBuySidePartialFill(
                    domainSeparator, 
                    false, 
                    msgValue, 
                    fillAmounts, 
                    saleDetails, 
                    sellerSignature, 
                    cosignature, 
                    feeOnTop);
            } else {
                _executeOrderBuySidePartialFill(
                    domainSeparator, 
                    false, 
                    0, 
                    fillAmounts, 
                    saleDetails, 
                    sellerSignature, 
                    cosignature, 
                    feeOnTop);
            }

            unchecked {
                ++i;
            }
        }

        if (runningBalanceNativeProceeds > 0) {
            revert cPort__OverpaidNativeFunds();
        }
    }

    function bulkAcceptOffersPartialFill(
        bytes32 domainSeparator, 
        FillAmounts[] calldata fillAmountsArray,
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

        if (params.saleDetailsArray.length != fillAmountsArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        for (uint256 i = 0; i < params.saleDetailsArray.length;) {
            _executeOrderSellSidePartialFill(
                domainSeparator, 
                false,
                0, 
                params.isCollectionLevelOfferArray[i], 
                fillAmountsArray[i],
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
