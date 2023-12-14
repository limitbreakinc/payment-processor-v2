// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "src/PaymentProcessorConfiguration.sol";
import "src/modules/ModuleOnChainCancellation.sol";
import "src/modules/ModulePaymentSettings.sol";
import "src/modules/ModuleTrades.sol";
import "src/modules/ModuleTradesAdvanced.sol";
import "src/PaymentProcessor.sol";

contract DeployPaymentProcessorModules is Script {
    struct ModuleAddresses {
        address moduleOnChainCancellation;
        address modulePaymentSettings;
        address moduleTrades;
        address moduleTradesAdvanced;
    }

    function run() public {
        /*
        address forwarderFactory = vm.envAddress("TRUSTED_FORWARDER_FACTORY_ADDRESS");
        address wrappedNativeCoin = vm.envAddress("WRAPPED_NATIVE_COIN");
        address coin1 = vm.envAddress("COIN_1");
        address coin2 = vm.envAddress("COIN_2");
        address coin3 = vm.envAddress("COIN_3");
        address coin4 = vm.envAddress("COIN_4");
        uint32 pushPaymentGasLimit = uint32(vm.envUint("PUSH_PAYMENT_GAS_LIMIT"));

        ModuleAddresses memory moduleAddresses = ModuleAddresses({
            moduleOnChainCancellation: address(0),
            modulePaymentSettings: address(0),
            moduleTrades: address(0),
            moduleTradesAdvanced: address(0)
        });

        DefaultPaymentMethods memory defaultPaymentMethods = DefaultPaymentMethods({
            defaultPaymentMethod1: coin1,
            defaultPaymentMethod2: coin2,
            defaultPaymentMethod3: coin3,
            defaultPaymentMethod4: coin4
        });

        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
        vm.startBroadcast(deployerPrivateKey);

        moduleAddresses.modulePaymentSettings = address(new ModulePaymentSettings(forwarderFactory, pushPaymentGasLimit, wrappedNativeCoin, defaultPaymentMethods));
        moduleAddresses.moduleOnChainCancellation = address(new ModuleOnChainCancellation(forwarderFactory, pushPaymentGasLimit, wrappedNativeCoin, defaultPaymentMethods));
        moduleAddresses.moduleTrades = address(new ModuleTrades(forwarderFactory, pushPaymentGasLimit, wrappedNativeCoin, defaultPaymentMethods));
        moduleAddresses.moduleTradesAdvanced = address(new ModuleTradesAdvanced(forwarderFactory, pushPaymentGasLimit, wrappedNativeCoin, defaultPaymentMethods));

        address paymentProcessorAddress = address(new PaymentProcessor(
            vm.addr(deployerPrivateKey),
            moduleAddresses.modulePaymentSettings,
            moduleAddresses.moduleOnChainCancellation,
            moduleAddresses.moduleTrades,
            moduleAddresses.moduleTradesAdvanced
        ));

        vm.stopBroadcast();

        console.log("Module On Chain Cancellation: ", moduleAddresses.moduleOnChainCancellation);
        console.log("Module Payment Settings: ", moduleAddresses.modulePaymentSettings);
        console.log("Module Trades: ", moduleAddresses.moduleTrades);
        console.log("Module Trades Advanced: ", moduleAddresses.moduleTradesAdvanced);
        console.log("PaymentProcessor: ", paymentProcessorAddress);
        */
    }
}