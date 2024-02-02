// SPDX-License-Identifier: BSL-1.1 - Copyright 2024 Limit Break, Inc.

pragma solidity 0.8.19;

/**
 * @dev ERC-173 Ownable Interface
 */
interface IOwnable {
    function owner() external view returns (address);
}