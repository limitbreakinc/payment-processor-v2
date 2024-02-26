// SPDX-License-Identifier: BSL-1.1
pragma solidity 0.8.19;

import "../DataTypes.sol";

/** 
* @title Payment Processor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 
contract PaymentProcessorStorageAccess {

    /// @dev The base storage slot for Payment Processor contract storage items.
    bytes32 constant DIAMOND_STORAGE_PAYMENT_PROCESSOR = 
        keccak256("diamond.storage.payment.processor");

    /**
     * @dev Returns a storage object that follows the Diamond standard storage pattern for
     * @dev contract storage across multiple module contracts.
     */
    function appStorage() internal pure returns (PaymentProcessorStorage storage diamondStorage) {
        bytes32 slot = DIAMOND_STORAGE_PAYMENT_PROCESSOR;
        assembly {
            diamondStorage.slot := slot
        }
    }
}