#!/bin/bash
if [ -f .env.common ]
then
  export $(cat .env.common | xargs) 
else
    echo "Please set your .env.common file"
    exit 1
fi

configurationAddress=$(cast abi-encode "signature(address)" $EXPECTED_PAYMENT_PROCESSOR_CONFIGURATION_ADDRESS)
configurationAddress=${configurationAddress:2}

echo "create2 ModuleOnChainCancellation START"
moduleOnChainCancellationCode="$(forge inspect src/modules/ModuleOnChainCancellation.sol:ModuleOnChainCancellation bytecode)"
moduleOnChainCancellationInitCode="$moduleOnChainCancellationCode$configurationAddress"
cast create2 --starts-with 6ABE00 --case-sensitive --init-code $moduleOnChainCancellationInitCode
echo "create2 ModuleOnChainCancellation END"
echo "-------------------------------------"
echo ""

echo "create2 ModulePaymentSettings START"
modulePaymentSettingsCode="$(forge inspect src/modules/ModulePaymentSettings.sol:ModulePaymentSettings bytecode)"
modulePaymentSettingsInitCode="$modulePaymentSettingsCode$configurationAddress"
cast create2 --starts-with 6ABE00 --case-sensitive --init-code $modulePaymentSettingsInitCode
echo "create2 ModulePaymentSettings END"
echo "-------------------------------------"
echo ""

echo "create2 ModuleTrades START"
moduleTradesCode="$(forge inspect src/modules/ModuleTrades.sol:ModuleTrades bytecode)"
moduleTradesInitCode="$moduleTradesCode$configurationAddress"
cast create2 --starts-with 6ABE00 --case-sensitive --init-code $moduleTradesInitCode
echo "create2 ModuleTrades END"
echo "-------------------------------------"
echo ""

echo "create2 ModuleTradesAdvanced START"
moduleTradesAdvancedCode="$(forge inspect src/modules/ModuleTradesAdvanced.sol:ModuleTradesAdvanced bytecode)"
moduleTradesAdvancedInitCode="$moduleTradesAdvancedCode$configurationAddress"
cast create2 --starts-with 6ABE00 --case-sensitive --init-code $moduleTradesAdvancedInitCode
echo "create2 ModuleTradesAdvanced END"
echo "-------------------------------------"
echo ""

echo "create2 PaymentProcessor START"
paymentProcessorCode="$(forge inspect src/PaymentProcessor.sol:PaymentProcessor bytecode)"
paymentProcessorInitCode="$paymentProcessorCode$configurationAddress"
cast create2 --starts-with 6ABE00 --case-sensitive --init-code $paymentProcessorInitCode
echo "create2 PaymentProcessor END"
echo "-------------------------------------"
echo ""