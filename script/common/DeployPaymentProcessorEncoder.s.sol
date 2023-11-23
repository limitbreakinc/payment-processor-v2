// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/PaymentProcessorEncoder.sol";

contract DeployPaymentProcessorEncoder is Script {
    function run() public {
        bytes32 saltValue = bytes32(vm.envUint("SALT_PAYMENT_PROCESSOR_ENCODER"));
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address PaymentProcessorEncoderAddress = address(new PaymentProcessorEncoder{salt: saltValue}());

        vm.stopBroadcast();

        console.log("PaymentProcessorEncoder: ", PaymentProcessorEncoderAddress);
    }
}