// SPDX-License-Identifier: BSL-1.1 - Copyright 2024 Limit Break, Inc.
pragma solidity 0.8.19;

import "../DataTypes.sol";

/** 
* @title PaymentProcessor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 
interface IPaymentProcessorConfiguration {

    /**
     * @notice Returns the ERC2771 context setup params for payment processor modules.
     */
    function getPaymentProcessorModuleERC2771ContextParams() 
        external 
        view 
        returns (
            address /*trustedForwarderFactory*/
        );

    /**
     * @notice Returns the setup params for payment processor modules.
     */
    function getPaymentProcessorModuleDeploymentParams() 
        external 
        view 
        returns (
            uint32, /*defaultPushPaymentGasLimit*/
            address, /*wrappedNativeCoin*/
            DefaultPaymentMethods memory /*defaultPaymentMethods*/
        );

    /**
     * @notice Returns the setup params for payment processor.
     */
    function getPaymentProcessorDeploymentParams()
        external
        view
        returns (
            address, /*defaultContractOwner*/
            PaymentProcessorModules memory /*paymentProcessorModules*/
        );
}