// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/CPort.sol";

contract DeployCPort is Script {
    struct ModuleAddresses {
        address moduleOnChainCancellation;
        address modulePaymentSettings;
        address moduleTrades;
    }

    

    function run() public {
        ModuleAddresses memory moduleAddresses = ModuleAddresses({
            moduleOnChainCancellation: vm.envAddress("MODULE_ADDRESS_ON_CHAIN_CANCELLATION"),
            modulePaymentSettings: vm.envAddress("MODULE_ADDRESS_PAYMENT_SETTINGS"),
            moduleTrades: vm.envAddress("MODULE_ADDRESS_TRADES")
        });

        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address cPortAddress = address(new cPort(
            vm.addr(deployerPrivateKey),
            moduleAddresses.modulePaymentSettings,
            moduleAddresses.moduleOnChainCancellation,
            moduleAddresses.moduleTrades
        ));

        vm.stopBroadcast();

        console.log("cPort: ", cPortAddress);
    }
}