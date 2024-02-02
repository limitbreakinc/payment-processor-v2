// SPDX-License-Identifier: BSL-1.1 - Copyright 2024 Limit Break, Inc.
pragma solidity 0.8.19;

/** 
* @title Payment Processor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 
interface IDomainSeparator {

    /**
     * @notice Returns the EIP712 domain separator.
     */
    function getDomainSeparator() external view returns (bytes32);
}