// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/modules/ModuleTrades.sol";

contract DeployModuleTrades is Script {
    function run() public {
        bytes32 saltValue = bytes32(vm.envUint("SALT_MODULE_TRADES"));
        address expectedAddress = vm.envAddress("EXPECTED_MODULE_TRADES_ADDRESS");
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        address configuration = vm.envAddress("EXPECTED_PAYMENT_PROCESSOR_CONFIGURATION_ADDRESS");
        
        vm.startBroadcast(deployerPrivateKey);
        address module = address(new ModuleTrades{salt: saltValue}(configuration));
        vm.stopBroadcast();

        console.log("ModuleTrades: ", module);

        if (expectedAddress != module) {
            revert("Unexpected deploy address");
        }
    }
}