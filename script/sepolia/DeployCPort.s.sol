// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/CPort.sol";

contract DeployCPort is Script {
    struct ModuleAddresses {
        address moduleOnChainCancellation;
        address modulePaymentSettings;
        address moduleSingleTrades;
        address moduleSingleTradesCosigned;
        address moduleBulkTrades;
        address moduleBulkTradesCosigned;
        address moduleSweepCollection;
    }

    

    function run() public {
        ModuleAddresses memory moduleAddresses = ModuleAddresses({
            moduleOnChainCancellation: vm.envAddress("MODULE_ADDRESS_ON_CHAIN_CANCELLATION"),
            modulePaymentSettings: vm.envAddress("MODULE_ADDRESS_PAYMENT_SETTINGS"),
            moduleSingleTrades: vm.envAddress("MODULE_ADDRESS_SINGLE_TRADES"),
            moduleSingleTradesCosigned: vm.envAddress("MODULE_ADDRESS_SINGLE_TRADES_COSIGNED"),
            moduleBulkTrades: vm.envAddress("MODULE_ADDRESS_BULK_TRADES"),
            moduleBulkTradesCosigned: vm.envAddress("MODULE_ADDRESS_BULK_TRADES_COSIGNED"),
            moduleSweepCollection: vm.envAddress("MODULE_ADDRESS_SWEEP_COLLECTION")
        });

        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address cPortAddress = address(new cPort(
            vm.addr(deployerPrivateKey),
            moduleAddresses.modulePaymentSettings,
            moduleAddresses.moduleOnChainCancellation,
            moduleAddresses.moduleSingleTrades
        ));

        vm.stopBroadcast();

        console.log("cPort: ", cPortAddress);
    }
}