// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./PaymentProcessorModule.sol";

contract ModuleBulkAcceptOffers is PaymentProcessorModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    PaymentProcessorModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function bulkAcceptOffers(
        bytes32 domainSeparator, 
        bool areCollectionLevelOffers,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures) public {
        
        PaymentProcessorStorage storage ptrAppStorage = appStorage();

        if (saleDetailsArray.length != signatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        Order memory saleDetails;
        SignatureECDSA memory signature;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            signature = signatures[i];

            _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
            _verifyCallerIsSellerAndTxOrigin(saleDetails.seller);

            _executeOrder(ptrAppStorage, domainSeparator, areCollectionLevelOffers, saleDetails.buyer, saleDetails, signature);

            unchecked {
                ++i;
            }
        }
    }
}
