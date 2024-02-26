// SPDX-License-Identifier: BSL-1.1
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/modules/ModuleTradesAdvanced.sol";

contract DeployModuleTradesAdvanced is Script {
    function run() public {
        bytes32 saltValue = bytes32(vm.envUint("SALT_MODULE_TRADES_ADVANCED"));
        address expectedAddress = vm.envAddress("EXPECTED_MODULE_TRADES_ADVANCED_ADDRESS");
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        address configuration = vm.envAddress("EXPECTED_PAYMENT_PROCESSOR_CONFIGURATION_ADDRESS");
        
        vm.startBroadcast(deployerPrivateKey);
        address module = address(new ModuleTradesAdvanced{salt: saltValue}(configuration));
        vm.stopBroadcast();

        console.log("ModuleTradesAdvanced: ", module);

        if (expectedAddress != module) {
            revert("Unexpected deploy address");
        }
    }
}