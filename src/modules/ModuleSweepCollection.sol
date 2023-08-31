// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
// | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
// | |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
// | |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
// | |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
// | |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
// | |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
// | |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
// | |              | || |              | || |              | || |              | || |              | || |              | |
// | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
//  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
// 
// By Limit Break, Inc.

import "./CPortModule.sol";

contract ModuleSweepCollection is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    cPortModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function sweepCollection(
        bytes32 domainSeparator, 
        BundledOrderBase memory bundleDetails,
        BundledItem[] calldata items,
        SignatureECDSA[] calldata signatures) public payable {

        cPortStorage storage ptrAppStorage = appStorage();
        
        _verifyCallerIsBuyerAndTxOrigin(bundleDetails.buyer);

        if (items.length != signatures.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        (Accumulator memory accumulator, Order[] memory saleDetailsBatch) = 
        _validateBundledItems(
            ptrAppStorage,
            domainSeparator,
            true,
            BundledOrderExtended({
                bundleBase: bundleDetails,
                seller: address(0),
                nonce: 0,
                expiration: 0
            }),
            items,
            signatures
        );

        if (bundleDetails.paymentMethod == address(0)) {
            if (accumulator.sumListingPrices != msg.value) {
                revert cPort__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert cPort__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds(
            bundleDetails.buyer, 
            IERC20(bundleDetails.paymentMethod),
            bundleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            bundleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetailsBatch);

        if (bundleDetails.protocol == TokenProtocols.ERC1155) {
            emit SweepCollectionERC1155(
                    bundleDetails.marketplace,
                    bundleDetails.tokenAddress,
                    bundleDetails.paymentMethod,
                    bundleDetails.buyer,
                    unsuccessfulFills,
                    accumulator.sellers,
                    accumulator.tokenIds,
                    accumulator.amounts,
                    accumulator.salePrices);
        } else {
            emit SweepCollectionERC721(
                    bundleDetails.marketplace,
                    bundleDetails.tokenAddress,
                    bundleDetails.paymentMethod,
                    bundleDetails.buyer,
                    unsuccessfulFills,
                    accumulator.sellers,
                    accumulator.tokenIds,
                    accumulator.salePrices);
        }
    }
}