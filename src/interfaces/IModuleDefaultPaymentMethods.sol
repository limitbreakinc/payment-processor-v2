// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface IModuleDefaultPaymentMethods {
    function getDefaultPaymentMethods() external view returns (address[] memory);
}