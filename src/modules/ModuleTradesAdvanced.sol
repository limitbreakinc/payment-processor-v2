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

import "./PaymentProcessorModule.sol";

contract ModuleTradesAdvanced is PaymentProcessorModule {

    constructor(
        address trustedForwarderFactory_,
        uint32 defaultPushPaymentGasLimit_,
        address wrappedNativeCoinAddress_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    PaymentProcessorModule(
        trustedForwarderFactory_, 
        defaultPushPaymentGasLimit_, 
        wrappedNativeCoinAddress_, 
        defaultPaymentMethods) {}

    function sweepCollection(
        bytes32 domainSeparator, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) public payable {
        uint256 appendedDataLength;
        unchecked {
            appendedDataLength = 
                msg.data.length - 
                BASE_MSG_LENGTH_SWEEP_COLLECTION - 
                (BASE_MSG_LENGTH_SWEEP_COLLECTION_PER_ITEM * items.length);
        }

        TradeContext memory context = TradeContext({
            domainSeparator: domainSeparator,
            channel: msg.sender,
            taker: appendedDataLength == 20 ? _msgSender() : msg.sender,
            disablePartialFill: false
        });

        uint256 remainingNativeProceeds =_executeSweepOrder(
            context,
            msg.value,
            feeOnTop,
            sweepOrder,
            items,
            signedSellOrders,
            cosignatures
        );

        if (remainingNativeProceeds > 0) {
            _pushProceeds(wrappedNativeCoinAddress, remainingNativeProceeds, gasleft());
            IERC20(wrappedNativeCoinAddress).
                transferFrom(address(this), context.taker, remainingNativeProceeds);
        }
    }
}
