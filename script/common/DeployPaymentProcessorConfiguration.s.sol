// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/PaymentProcessorConfiguration.sol";

contract DeployPaymentProcessorConfiguration is Script {
    function run() public {
        bytes32 saltValue = bytes32(vm.envUint("SALT_PAYMENT_PROCESSOR_CONFIGURATION"));
        address expectedAddress = vm.envAddress("EXPECTED_PAYMENT_PROCESSOR_CONFIGURATION_ADDRESS");
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        address defaultOwner = vm.envAddress("DEFAULT_OWNER_ADDRESS");
        
        vm.startBroadcast(deployerPrivateKey);
        address configuration = address(new PaymentProcessorConfiguration{salt: saltValue}(defaultOwner));
        vm.stopBroadcast();

        console.log("PaymentProcessorConfiguration: ", configuration);

        if (expectedAddress != configuration) {
            revert("Unexpected deploy address");
        }
    }
}