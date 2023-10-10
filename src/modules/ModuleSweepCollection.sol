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

contract ModuleSweepCollection is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function sweepCollection(
        bytes32 domainSeparator, 
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders
    ) public payable {
        _executeSweepOrder(
            domainSeparator,
            msg.value,
            FeeOnTop({recipient: address(0), amount: 0}),
            sweepOrder,
            items,
            signedSellOrders
        );
    }

    function sweepCollectionWithFeeOnTop(
        bytes32 domainSeparator, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders
    ) public payable {
        _executeSweepOrder(
            domainSeparator,
            msg.value,
            feeOnTop,
            sweepOrder,
            items,
            signedSellOrders
        );
    }

    function sweepCollectionCosigned(
        bytes32 domainSeparator, 
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) public payable {
        _executeSweepOrder(
            domainSeparator,
            msg.value,
            FeeOnTop({recipient: address(0), amount: 0}),
            sweepOrder,
            items,
            signedSellOrders,
            cosignatures
        );
    }

    function sweepCollectionCosignedWithFeeOnTop(
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
