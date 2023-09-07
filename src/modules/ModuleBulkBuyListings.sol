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

contract ModuleBulkBuyListings is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    cPortModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function bulkBuyListingsForAnyone(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) public payable {
        _bulkBuyListings(_validateCallerIsBuyer, domainSeparator, saleDetailsArray, signatures);
    }

    function bulkBuyListingsForSelf(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) public payable {
        _bulkBuyListings(_validateCallerIsBuyerAndBeneficiary, domainSeparator, saleDetailsArray, signatures);
    }

    function bulkBuyListingsForSelfWithEOA(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) public payable {
        _bulkBuyListings(
            _validateCallerIsBuyerAndBeneficiaryAndTxOrigin, 
            domainSeparator, 
            saleDetailsArray, 
            signatures);
    }

    function _validateCallerIsBuyer(address buyer, address /*beneficiary*/) internal view {
        if (buyer != msg.sender) {
            revert cPort__BuyerMustBeCaller();
        }
    }

    function _validateCallerIsBuyerAndBeneficiary(address buyer, address beneficiary) internal view {
        _validateCallerIsBuyer(buyer, beneficiary);

        if (buyer != beneficiary) {
            revert("TODO");
        }
    }

    function _validateCallerIsBuyerAndBeneficiaryAndTxOrigin(address buyer,address beneficiary) internal view {
        _validateCallerIsBuyerAndBeneficiary(buyer, beneficiary);

        if (buyer != tx.origin) {
            revert cPort__BuyerMustBeCallerAndTransactionOrigin();
        }
    }

    function _bulkBuyListings(
        function(address,address) funcValidateCaller,
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures) internal {

        if (saleDetailsArray.length != signatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        uint256 runningBalanceNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory signature;
        uint256 msgValue;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            signature = signatures[i];
            msgValue = 0;

            funcValidateCaller(saleDetails.buyer, saleDetails.beneficiary);

            if(saleDetails.paymentMethod == address(0)) {
                msgValue = saleDetails.itemPrice;

                if (runningBalanceNativeProceeds < msgValue) {
                    revert cPort__RanOutOfNativeFunds();
                }

                unchecked {
                    runningBalanceNativeProceeds -= msgValue;
                }

                if (!_executeOrderBuySide(domainSeparator, msgValue, saleDetails, signature)) {
                    revert cPort__DispensingTokenWasUnsuccessful();
                }
            } else {
                _executeOrderBuySide(domainSeparator, 0, saleDetails, signature);
            }

            unchecked {
                ++i;
            }
        }

        if (runningBalanceNativeProceeds > 0) {
            revert cPort__OverpaidNativeFunds();
        }
    }
}
