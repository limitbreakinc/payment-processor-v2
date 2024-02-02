#!/bin/bash
if [ -f .env.common ]
then
  export $(cat .env.common | xargs) 
else
    echo "Please set your .env.common file"
    exit 1
fi

ownerAddress=$(cast abi-encode "signature(address)" $DEFAULT_OWNER_ADDRESS)
ownerAddress=${ownerAddress:2}

echo "create2 PaymentProcessorConfiguration START"
paymentProcessorConfigurationCode="$(forge inspect src/PaymentProcessorConfiguration.sol:PaymentProcessorConfiguration bytecode)"
paymentProcessorConfigurationInitCode="$paymentProcessorConfigurationCode$ownerAddress"
cast create2 --starts-with 9A1D00 --case-sensitive --init-code $paymentProcessorConfigurationInitCode
echo "create2 PaymentProcessorConfiguration END"
echo "-------------------------------------"
echo ""