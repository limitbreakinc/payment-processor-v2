// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/modules/ModuleOnChainCancellation.sol";
import "src/modules/ModulePaymentSettings.sol";
import "src/modules/ModuleSingleTrades.sol";

contract DeployCPortModules is Script {
    struct ModuleAddresses {
        address moduleOnChainCancellation;
        address modulePaymentSettings;
        address moduleSingleTrades;
        address moduleSingleTradesCosigned;
        address moduleBulkTrades;
        address moduleBulkTradesCosigned;
        address moduleSweepCollection;
    }

    address private immutable weth = address(0x7b79995e5f793A07Bc00c21412e50Ecae098E7f9);
    address private immutable usdc = address(0x8267cF9254734C6Eb452a7bb9AAF97B392258b21);
    uint32 private immutable pushPaymentGasLimit = 8_000;

    function run() public {
        ModuleAddresses memory moduleAddresses = ModuleAddresses({
            moduleOnChainCancellation: address(0),
            modulePaymentSettings: address(0),
            moduleSingleTrades: address(0),
            moduleSingleTradesCosigned: address(0),
            moduleBulkTrades: address(0),
            moduleBulkTradesCosigned: address(0),
            moduleSweepCollection: address(0)
        });

        DefaultPaymentMethods memory defaultPaymentMethods = DefaultPaymentMethods({
            defaultPaymentMethod1: weth,
            defaultPaymentMethod2: usdc,
            defaultPaymentMethod3: address(0),
            defaultPaymentMethod4: address(0),
            defaultPaymentMethod5: address(0),
            defaultPaymentMethod6: address(0),
            defaultPaymentMethod7: address(0),
            defaultPaymentMethod8: address(0)
        });

        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        vm.startBroadcast(deployerPrivateKey);

        moduleAddresses.moduleOnChainCancellation = address(new ModuleOnChainCancellation(pushPaymentGasLimit, defaultPaymentMethods));
        moduleAddresses.modulePaymentSettings = address(new ModulePaymentSettings(pushPaymentGasLimit, defaultPaymentMethods));
        moduleAddresses.moduleSingleTrades = address(new ModuleSingleTrades(pushPaymentGasLimit, defaultPaymentMethods));

        vm.stopBroadcast();

        console.log("Module On Chain Cancellation: ", moduleAddresses.moduleOnChainCancellation);
        console.log("Module Payment Settings: ", moduleAddresses.modulePaymentSettings);
        console.log("Module Single Trades: ", moduleAddresses.moduleSingleTrades);
    }
}