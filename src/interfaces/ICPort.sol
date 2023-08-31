// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IcPort {
    function getDomainSeparator() external view returns (bytes32);
}