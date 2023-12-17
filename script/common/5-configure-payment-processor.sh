#!/usr/bin/env bash

if [ -f .env.secrets ]
then
  export $(cat .env.secrets | xargs) 
else
    echo "Please set your .env.secrets file"
    exit 1
fi

if [ -f .env.common ]
then
  export $(cat .env.common | xargs) 
else
    echo "Please set your .env.common file"
    exit 1
fi

# Initialize variables
GAS_PRICE=""
PRIORITY_GAS_PRICE=""
CHAIN_ID=""
RPC_URL=""

# Function to display usage
usage() {
    echo "Usage: $0 --gas-price <gas price> --priority-gas-price <priority gas price> --chain-id <chain id>"
    exit 1
}

# Function to set RPC URL based on chain ID
set_rpc_url() {
    case $1 in
        1) RPC_URL=$RPC_URL_ETHEREUM ;;
        10) RPC_URL=$RPC_URL_OPTIMISM ;;
        56) RPC_URL=$RPC_URL_BSC ;;
        137) RPC_URL=$RPC_URL_POLYGON ;;
        324) RPC_URL=$RPC_URL_ZKEVM ;;
        1101) RPC_URL=$RPC_URL_POLYGON_ZKEVM ;;
        8453) RPC_URL=$RPC_URL_BASE ;;
        42161) RPC_URL=$RPC_URL_ARBITRUM ;;
        42170) RPC_URL=$RPC_URL_ARBITRUM_NOVA ;;
        43114) RPC_URL=$RPC_URL_AVALANCHE_C ;;
        59144) RPC_URL=$RPC_URL_LINEA ;;
        7777777) RPC_URL=$RPC_URL_ZORA ;;
        534352) RPC_URL=$RPC_URL_SCROLL ;;
        5) RPC_URL=$RPC_URL_GOERLI ;;
        999) RPC_URL=$RPC_URL_ZORA_TESTNET ;;
        5001) RPC_URL=$RPC_URL_MANTLE_TESTNET ;;
        59140) RPC_URL=$RPC_URL_GOERLI_LINEA ;;
        80001) RPC_URL=$RPC_URL_MUMBAI ;;
        84531) RPC_URL=$RPC_URL_GOERLI_BASE ;;
        534353) RPC_URL=$RPC_URL_SCROLL_ALPHA ;;
        11155111) RPC_URL=$RPC_URL_SEPOLIA ;;
        2863311531) RPC_URL=$RPC_URL_ANCIENT8 ;;
        13472) RPC_URL=$RPC_URL_IMMUTABLE_TESTNET ;;
        *) echo "Unsupported chain id"; exit 1 ;;
    esac

    export RPC_URL
}

# Process arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --gas-price) GAS_PRICE=$(($2 * 1000000000)); shift ;;
        --priority-gas-price) PRIORITY_GAS_PRICE=$(($2 * 1000000000)); shift ;;
        --chain-id) CHAIN_ID=$2; shift ;;
        *) usage ;;
    esac
    shift
done

# Check if all parameters are set
if [ -z "$GAS_PRICE" ] || [ -z "$PRIORITY_GAS_PRICE" ] || [ -z "$CHAIN_ID" ]; then
    usage
fi

# Set the RPC URL based on chain ID
set_rpc_url $CHAIN_ID

echo ""
echo "============= DEPLOYING CREATOR REGISTRY ============="

echo "Gas Price (wei): $GAS_PRICE"
echo "Priority Gas Price (wei): $PRIORITY_GAS_PRICE"
echo "Chain ID: $CHAIN_ID"
echo "RPC URL: $RPC_URL"
echo "DEFAULT_OWNER_ADDRESS: $DEFAULT_OWNER_ADDRESS"
echo "EXPECTED_MODULE_PAYMENT_SETTINGS_ADDRESS: $EXPECTED_MODULE_PAYMENT_SETTINGS_ADDRESS"
echo "EXPECTED_MODULE_ON_CHAIN_CANCELLATION_ADDRESS: $EXPECTED_MODULE_ON_CHAIN_CANCELLATION_ADDRESS"
echo "EXPECTED_MODULE_TRADES_ADDRESS: $EXPECTED_MODULE_TRADES_ADDRESS"
echo "EXPECTED_MODULE_TRADES_ADVANCED_ADDRESS: $EXPECTED_MODULE_TRADES_ADVANCED_ADDRESS"
read -p "Do you want to proceed? (yes/no) " yn

case $yn in 
  yes ) echo ok, we will proceed;;
  no ) echo exiting...;
    exit;;
  * ) echo invalid response;
    exit 1;;
esac

cast send \
  --private-key $DEFAULT_OWNER_PRIVATE_KEY \
  --gas-price $GAS_PRICE \
  --priority-gas-price $PRIORITY_GAS_PRICE \
  --rpc-url $RPC_URL \
  $EXPECTED_PAYMENT_PROCESSOR_CONFIGURATION_ADDRESS \
  "setPaymentProcessorConfiguration(address,address,address,address,address)" \
  $DEFAULT_OWNER_ADDRESS \
  $EXPECTED_MODULE_PAYMENT_SETTINGS_ADDRESS \
  $EXPECTED_MODULE_ON_CHAIN_CANCELLATION_ADDRESS \
  $EXPECTED_MODULE_TRADES_ADDRESS \
  $EXPECTED_MODULE_TRADES_ADVANCED_ADDRESS