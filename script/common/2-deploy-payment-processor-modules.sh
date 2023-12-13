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
WRAPPED_NATIVE_COIN=""
COIN_1=""
COIN_2=""
COIN_3=""
COIN_4=""

# Function to display usage
usage() {
    echo "Usage: $0 --gas-price <gas price> --priority-gas-price <priority gas price> --chain-id <chain id>"
    exit 1
}

# Function to set RPC URL based on chain ID
set_rpc_url() {
    case $1 in
        1) RPC_URL="https://eth.llamarpc.com" ;;
        10) RPC_URL="https://optimism.llamarpc.com" ;;
        56) RPC_URL="https://bsc.meowrpc.com" ;;
        137) RPC_URL="https://polygon.llamarpc.com" ;;
        324) RPC_URL="https://mainnet.era.zksync.io" ;;
        1101) RPC_URL="https://zkevm-rpc.com" ;;
        8453) RPC_URL="https://developer-access-mainnet.base.org" ;;
        42161) RPC_URL="https://arbitrum.llamarpc.com" ;;
        42170) RPC_URL="https://arbitrum-nova.publicnode.com" ;;
        43114) RPC_URL="https://avalanche-c-chain.publicnode.com" ;;
        59144) RPC_URL="https://rpc.linea.build" ;;
        7777777) RPC_URL="https://rpc.zora.co" ;;
        534352) RPC_URL="https://rpc.ankr.com/scroll" ;;
        5) RPC_URL="https://goerli.blockpi.network/v1/rpc/public" ;;
        999) RPC_URL="https://testnet.rpc.zora.co" ;;
        5001) RPC_URL="https://rpc.testnet.mantle.xyz" ;;
        59140) RPC_URL="https://rpc.goerli.linea.build/" ;;
        80001) RPC_URL="https://endpoints.omniatech.io/v1/matic/mumbai/public" ;;
        84531) RPC_URL="https://goerli.base.org" ;;
        534353) RPC_URL="https://alpha-rpc.scroll.io/l2" ;;
        11155111) RPC_URL="https://1rpc.io/sepolia" ;;
        2863311531) RPC_URL="https://rpc-testnet.ancient8.gg/" ;;
        13472) RPC_URL="https://rpc.testnet.immutable.com/" ;;
        *) echo "Unsupported chain id"; exit 1 ;;
    esac
}

# Function to set wrapped native coin based on chain ID
set_wrapped_native_coin() {
  case $1 in
      1) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ETH ;;
      10) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_OPTIMISM ;;
      56) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_BSC ;;
      137) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_POLYGON ;;
      324) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ZKSYNC ;;
      1101) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_POLYGON_ZKEVM ;;
      8453) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_BASE ;;
      42161) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ARBITRUM ;;
      42170) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ARBITRUM_NOVA ;;
      43114) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_AVALANCHE ;;
      59144) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_LINEA ;;
      7777777) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ZORA ;;
      534352) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_SCROLL ;;
      5) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_GOERLI ;;
      999) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ZORA_TESTNET ;;
      5001) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_MANTLE_TESTNET ;;
      59140) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_LINEA_TESTNET ;;
      80001) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_MUMBAI ;;
      84531) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_BASE_GOERLI ;;
      534353) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_SCROLL_ALPHA ;;
      11155111) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_SEPOLIA ;;
      2863311531) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_ANCIENT_8_TESTNET ;;
      13472) WRAPPED_NATIVE_COIN=$WRAPPED_NATIVE_COIN_IMMUTABLE_ZKEVM_TESTNET ;;
      *) echo "Unsupported chain id"; exit 1 ;;
  esac

  export WRAPPED_NATIVE_COIN
}

# Function to set coin 1 based on chain ID
set_coin_1() {
  case $1 in
      1) COIN_1=$COIN_1_ETH ;;
      10) COIN_1=$COIN_1_OPTIMISM ;;
      56) COIN_1=$COIN_1_BSC ;;
      137) COIN_1=$COIN_1_POLYGON ;;
      324) COIN_1=$COIN_1_ZKSYNC ;;
      1101) COIN_1=$COIN_1_POLYGON_ZKEVM ;;
      8453) COIN_1=$COIN_1_BASE ;;
      42161) COIN_1=$COIN_1_ARBITRUM ;;
      42170) COIN_1=$COIN_1_ARBITRUM_NOVA ;;
      43114) COIN_1=$COIN_1_AVALANCHE ;;
      59144) COIN_1=$COIN_1_LINEA ;;
      7777777) COIN_1=$COIN_1_ZORA ;;
      534352) COIN_1=$COIN_1_SCROLL ;;
      5) COIN_1=$COIN_1_GOERLI ;;
      999) COIN_1=$COIN_1_ZORA_TESTNET ;;
      5001) COIN_1=$COIN_1_MANTLE_TESTNET ;;
      59140) COIN_1=$COIN_1_LINEA_TESTNET ;;
      80001) COIN_1=$COIN_1_MUMBAI ;;
      84531) COIN_1=$COIN_1_BASE_GOERLI ;;
      534353) COIN_1=$COIN_1_SCROLL_ALPHA ;;
      11155111) COIN_1=$COIN_1_SEPOLIA ;;
      2863311531) COIN_1=$COIN_1_ANCIENT_8_TESTNET ;;
      13472) COIN_1=$COIN_1_IMMUTABLE_ZKEVM_TESTNET ;;
      *) echo "Unsupported chain id"; exit 1 ;;
  esac

  export COIN_1
}

# Function to set coin 2 based on chain ID
set_coin_2() {
  case $1 in
      1) COIN_2=$COIN_2_ETH ;;
      10) COIN_2=$COIN_2_OPTIMISM ;;
      56) COIN_2=$COIN_2_BSC ;;
      137) COIN_2=$COIN_2_POLYGON ;;
      324) COIN_2=$COIN_2_ZKSYNC ;;
      1101) COIN_2=$COIN_2_POLYGON_ZKEVM ;;
      8453) COIN_2=$COIN_2_BASE ;;
      42161) COIN_2=$COIN_2_ARBITRUM ;;
      42170) COIN_2=$COIN_2_ARBITRUM_NOVA ;;
      43114) COIN_2=$COIN_2_AVALANCHE ;;
      59144) COIN_2=$COIN_2_LINEA ;;
      7777777) COIN_2=$COIN_2_ZORA ;;
      534352) COIN_2=$COIN_2_SCROLL ;;
      5) COIN_2=$COIN_2_GOERLI ;;
      999) COIN_2=$COIN_2_ZORA_TESTNET ;;
      5001) COIN_2=$COIN_2_MANTLE_TESTNET ;;
      59140) COIN_2=$COIN_2_LINEA_TESTNET ;;
      80001) COIN_2=$COIN_2_MUMBAI ;;
      84531) COIN_2=$COIN_2_BASE_GOERLI ;;
      534353) COIN_2=$COIN_2_SCROLL_ALPHA ;;
      11155111) COIN_2=$COIN_2_SEPOLIA ;;
      2863311531) COIN_2=$COIN_2_ANCIENT_8_TESTNET ;;
      13472) COIN_2=$COIN_2_IMMUTABLE_ZKEVM_TESTNET ;;
      *) echo "Unsupported chain id"; exit 1 ;;
  esac

  export COIN_2
}

# Function to set coin 3 based on chain ID
set_coin_3() {
  case $1 in
      1) COIN_3=$COIN_3_ETH ;;
      10) COIN_3=$COIN_3_OPTIMISM ;;
      56) COIN_3=$COIN_3_BSC ;;
      137) COIN_3=$COIN_3_POLYGON ;;
      324) COIN_3=$COIN_3_ZKSYNC ;;
      1101) COIN_3=$COIN_3_POLYGON_ZKEVM ;;
      8453) COIN_3=$COIN_3_BASE ;;
      42161) COIN_3=$COIN_3_ARBITRUM ;;
      42170) COIN_3=$COIN_3_ARBITRUM_NOVA ;;
      43114) COIN_3=$COIN_3_AVALANCHE ;;
      59144) COIN_3=$COIN_3_LINEA ;;
      7777777) COIN_3=$COIN_3_ZORA ;;
      534352) COIN_3=$COIN_3_SCROLL ;;
      5) COIN_3=$COIN_3_GOERLI ;;
      999) COIN_3=$COIN_3_ZORA_TESTNET ;;
      5001) COIN_3=$COIN_3_MANTLE_TESTNET ;;
      59140) COIN_3=$COIN_3_LINEA_TESTNET ;;
      80001) COIN_3=$COIN_3_MUMBAI ;;
      84531) COIN_3=$COIN_3_BASE_GOERLI ;;
      534353) COIN_3=$COIN_3_SCROLL_ALPHA ;;
      11155111) COIN_3=$COIN_3_SEPOLIA ;;
      2863311531) COIN_3=$COIN_3_ANCIENT_8_TESTNET ;;
      13472) COIN_3=$COIN_3_IMMUTABLE_ZKEVM_TESTNET ;;
      *) echo "Unsupported chain id"; exit 1 ;;
  esac

  export COIN_3
}

# Function to set coin 4 based on chain ID
set_coin_4() {
  case $1 in
      1) COIN_4=$COIN_4_ETH ;;
      10) COIN_4=$COIN_4_OPTIMISM ;;
      56) COIN_4=$COIN_4_BSC ;;
      137) COIN_4=$COIN_4_POLYGON ;;
      324) COIN_4=$COIN_4_ZKSYNC ;;
      1101) COIN_4=$COIN_4_POLYGON_ZKEVM ;;
      8453) COIN_4=$COIN_4_BASE ;;
      42161) COIN_4=$COIN_4_ARBITRUM ;;
      42170) COIN_4=$COIN_4_ARBITRUM_NOVA ;;
      43114) COIN_4=$COIN_4_AVALANCHE ;;
      59144) COIN_4=$COIN_4_LINEA ;;
      7777777) COIN_4=$COIN_4_ZORA ;;
      534352) COIN_4=$COIN_4_SCROLL ;;
      5) COIN_4=$COIN_4_GOERLI ;;
      999) COIN_4=$COIN_4_ZORA_TESTNET ;;
      5001) COIN_4=$COIN_4_MANTLE_TESTNET ;;
      59140) COIN_4=$COIN_4_LINEA_TESTNET ;;
      80001) COIN_4=$COIN_4_MUMBAI ;;
      84531) COIN_4=$COIN_4_BASE_GOERLI ;;
      534353) COIN_4=$COIN_4_SCROLL_ALPHA ;;
      11155111) COIN_4=$COIN_4_SEPOLIA ;;
      2863311531) COIN_4=$COIN_4_ANCIENT_8_TESTNET ;;
      13472) COIN_4=$COIN_4_IMMUTABLE_ZKEVM_TESTNET ;;
      *) echo "Unsupported chain id"; exit 1 ;;
  esac

  export COIN_4
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

# Set the coins based on chain ID
set_wrapped_native_coin $CHAIN_ID
set_coin_1 $CHAIN_ID
set_coin_2 $CHAIN_ID
set_coin_3 $CHAIN_ID
set_coin_4 $CHAIN_ID

echo ""
echo "============= DEPLOYING CREATOR REGISTRY ============="

echo "Gas Price (wei): $GAS_PRICE"
echo "Priority Gas Price (wei): $PRIORITY_GAS_PRICE"
echo "Chain ID: $CHAIN_ID"
echo "RPC URL: $RPC_URL"
echo "TRUSTED_FORWARDER_FACTORY_ADDRESS: $TRUSTED_FORWARDER_FACTORY_ADDRESS"
echo "PUSH_PAYMENT_GAS_LIMIT: $PUSH_PAYMENT_GAS_LIMIT"
echo "WRAPPED_NATIVE_COIN: $WRAPPED_NATIVE_COIN"
echo "COIN_1: $COIN_1"
echo "COIN_2: $COIN_2"
echo "COIN_3: $COIN_3"
echo "COIN_4: $COIN_4"
read -p "Do you want to proceed? (yes/no) " yn

case $yn in 
  yes ) echo ok, we will proceed;;
  no ) echo exiting...;
    exit;;
  * ) echo invalid response;
    exit 1;;
esac

forge script script/common/DeployPaymentProcessorModules.s.sol:DeployPaymentProcessorModules \
  --gas-price $GAS_PRICE \
  --priority-gas-price $PRIORITY_GAS_PRICE \
  --rpc-url $RPC_URL \
  --broadcast \
  --slow