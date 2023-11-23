// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IDomainSeparator {
    function getDomainSeparator() external view returns (bytes32);
}