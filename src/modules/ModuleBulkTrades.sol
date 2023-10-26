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

contract ModuleBulkTrades is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function bulkBuyListings(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata sellerSignatures
    ) public payable {
        if (saleDetailsArray.length != sellerSignatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        uint256 remainingNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            sellerSignature = sellerSignatures[i];

            if(saleDetails.paymentMethod == address(0)) {
                remainingNativeProceeds = _executeOrderBuySide(domainSeparator, false, remainingNativeProceeds, saleDetails, sellerSignature);
            } else {
                _executeOrderBuySide(domainSeparator, false, 0, saleDetails, sellerSignature);
            }

            unchecked {
                ++i;
            }
        }

        if (remainingNativeProceeds > 0) {
            revert cPort__OverpaidNativeFunds();
        }
    }

    function bulkBuyListingsWithFeesOnTop(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata sellerSignatures,
        FeeOnTop[] calldata feesOnTop
    ) public payable {
        if (saleDetailsArray.length != sellerSignatures.length) {
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
        FeeOnTop memory feeOnTop;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            sellerSignature = sellerSignatures[i];
            feeOnTop = feesOnTop[i];

            if(saleDetails.paymentMethod == address(0)) {
                remainingNativeProceeds = _executeOrderBuySide(domainSeparator, false, remainingNativeProceeds, saleDetails, sellerSignature, feeOnTop);
            } else {
                _executeOrderBuySide(domainSeparator, false, 0, saleDetails, sellerSignature, feeOnTop);
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
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata buyerSignaturesArray,
        TokenSetProof[] calldata tokenSetProofsArray
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

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            _executeOrderSellSide(
                domainSeparator, 
                false,
                0, 
                isCollectionLevelOfferArray[i], 
                saleDetailsArray[i], 
                buyerSignaturesArray[i],
                tokenSetProofsArray[i]);

            unchecked {
                ++i;
            }
        }
    }

    function bulkAcceptOffersWithFeesOnTop(
        bytes32 domainSeparator, 
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata buyerSignaturesArray,
        TokenSetProof[] calldata tokenSetProofsArray,
        FeeOnTop[] calldata feesOnTopArray
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

        if (saleDetailsArray.length != feesOnTopArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            _executeOrderSellSide(
                domainSeparator, 
                false,
                0, 
                isCollectionLevelOfferArray[i], 
                saleDetailsArray[i], 
                buyerSignaturesArray[i],
                tokenSetProofsArray[i],
                feesOnTopArray[i]);

            unchecked {
                ++i;
            }
        }
    }
}
