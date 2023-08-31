// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DataTypes.sol";

contract cPortStorageAccess {
    bytes32 constant DIAMOND_STORAGE_C_PORT = 
        keccak256("diamond.storage.c.port");

    function appStorage() internal view returns (cPortStorage storage diamondStorage) {
        bytes32 slot = DIAMOND_STORAGE_C_PORT;
        assembly {
            diamondStorage.slot := slot
        }
    }
}