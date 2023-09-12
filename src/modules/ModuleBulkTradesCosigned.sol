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

contract ModuleBulkTradesCosigned is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    cPortModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

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

        uint256 runningBalanceNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;
        Cosignature memory cosignature;
        uint256 msgValue;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            sellerSignature = sellerSignatures[i];
            cosignature = cosignatures[i];
            msgValue = 0;

            if(saleDetails.paymentMethod == address(0)) {
                msgValue = saleDetails.itemPrice;

                if (runningBalanceNativeProceeds < msgValue) {
                    revert cPort__RanOutOfNativeFunds();
                }

                unchecked {
                    runningBalanceNativeProceeds -= msgValue;
                }

                if (!_executeOrderBuySide(domainSeparator, msgValue, saleDetails, sellerSignature, cosignature)) {
                    revert cPort__DispensingTokenWasUnsuccessful();
                }
            } else {
                _executeOrderBuySide(domainSeparator, 0, saleDetails, sellerSignature, cosignature);
            }

            unchecked {
                ++i;
            }
        }

        if (runningBalanceNativeProceeds > 0) {
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
        if (saleDetailsArray.length != buyerSignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != cosignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            _executeOrderSellSide(
                domainSeparator, 
                0, 
                isCollectionLevelOfferArray[i], 
                saleDetailsArray[i], 
                buyerSignaturesArray[i],
                tokenSetProofsArray[i],
                cosignaturesArray[i]);

            unchecked {
                ++i;
            }
        }
    }
}
