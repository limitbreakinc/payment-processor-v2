// SPDX-License-Identifier: BSL-1.1
pragma solidity 0.8.19;

/** 
* @title Payment Processor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 
interface IModuleDefaultPaymentMethods {

    /**
     * @notice Returns the list of default payment methods that Payment Processor supports.
     */
    function getDefaultPaymentMethods() external view returns (address[] memory);
}