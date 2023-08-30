// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DataTypes.sol";

contract PaymentProcessorStorageAccess {
    bytes32 constant DIAMOND_STORAGE_PAYMENT_PROCESSOR = 
        keccak256("diamond.storage.payment.processor");

    function appStorage() internal view returns (PaymentProcessorStorage storage diamondStorage) {
        bytes32 slot = DIAMOND_STORAGE_PAYMENT_PROCESSOR;
        assembly {
            diamondStorage.slot := slot
        }
    }
}