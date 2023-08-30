// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./PaymentProcessorModule.sol";

contract ModuleAcceptOffer is PaymentProcessorModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    PaymentProcessorModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function acceptOffer(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) public {
        
        _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
        _verifyCallerIsSellerAndTxOrigin(saleDetails.seller);

        PaymentProcessorStorage storage ptrAppStorage = appStorage();

        bool tokenDispensedSuccessfully = _executeOrder(
            ptrAppStorage,
            domainSeparator,
            isCollectionLevelOffer, 
            saleDetails.buyer, 
            saleDetails, 
            signature);

        if (!tokenDispensedSuccessfully) {
            revert PaymentProcessor__DispensingTokenWasUnsuccessful();
        }
    }
}
