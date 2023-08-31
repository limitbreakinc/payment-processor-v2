// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./PaymentProcessorModule.sol";

contract ModuleOnChainCancellation is PaymentProcessorModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    PaymentProcessorModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function revokeMasterNonce() external {
        emit MasterNonceInvalidated(appStorage().masterNonces[msg.sender], msg.sender);

        unchecked {
            ++appStorage().masterNonces[msg.sender];
        }
    }

    function revokeSingleNonce(uint256 nonce) external {
        _checkAndInvalidateNonce(msg.sender, nonce, true);
    }
}
