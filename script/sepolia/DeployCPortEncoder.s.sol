// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/CPortEncoder.sol";

contract DeployCPortEncoder is Script {
    function run() public {
        bytes32 saltValue = bytes32(vm.envUint("SALT_CPORT_ENCODER"));
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address cPortEncoderAddress = address(new cPortEncoder{salt: saltValue}());

        vm.stopBroadcast();

        console.log("cPortEncoder: ", cPortEncoderAddress);
    }
}