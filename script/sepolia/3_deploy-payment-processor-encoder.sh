#!/usr/bin/env bash

if [ -f .env.sepolia ]
then
  export $(cat .env.sepolia | xargs) 
else
    echo "Please set your .env.sepolia file"
    exit 1
fi

# Converts human readable gas to wei
./script/common/gweitowei.sh "${GAS_PRICE}"
gasPrice=`cat /tmp/gasfile`
rm -f /tmp/gasfile

# Converts human readable gas to wei
./script/common/gweitowei.sh "${PRIORITY_GAS_PRICE}"
priorityGasPrice=`cat /tmp/gasfile`
rm -f /tmp/gasfile

echo ""
echo "============= DEPLOYING CREATOR REGISTRY ============="

echo "RPC URL: ${RPC_URL}"
read -p "Do you want to proceed? (yes/no) " yn

case $yn in 
	yes ) echo ok, we will proceed;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

forge script script/common/DeployPaymentProcessorEncoder.s.sol:DeployPaymentProcessorEncoder \
  --with-gas-price $gasPrice \
  --rpc-url $RPC_URL \
  --optimize \
  --optimizer-runs 30000 \
  --broadcast \
  --slow
  