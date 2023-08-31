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

import "./PaymentProcessorModule.sol";

contract ModuleBuyBundledListing is PaymentProcessorModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    PaymentProcessorModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function buyBundledListing(
        bytes32 domainSeparator, 
        SignatureECDSA memory signature,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] calldata items) public payable {

        PaymentProcessorStorage storage ptrAppStorage = appStorage();
        
        _verifyCallerIsBuyerAndTxOrigin(bundleDetails.bundleBase.buyer);

        if (items.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        SignatureECDSA[] memory signatureAsSingletonArray = new SignatureECDSA[](1);
        signatureAsSingletonArray[0] = signature;

        (Accumulator memory accumulator, Order[] memory saleDetailsBatch) = 
        _validateBundledItems(
            ptrAppStorage,
            domainSeparator,
            false,
            bundleDetails,
            items,
            signatureAsSingletonArray
        );

        if (bundleDetails.bundleBase.paymentMethod == address(0)) {
            if (accumulator.sumListingPrices != msg.value) {
                revert PaymentProcessor__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert PaymentProcessor__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds(
            bundleDetails.bundleBase.buyer, 
            IERC20(bundleDetails.bundleBase.paymentMethod),
            bundleDetails.bundleBase.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            bundleDetails.bundleBase.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetailsBatch);

        if (bundleDetails.bundleBase.protocol == TokenProtocols.ERC1155) {
            emit BuyBundledListingERC1155(
                    bundleDetails.bundleBase.marketplace,
                    bundleDetails.bundleBase.tokenAddress,
                    bundleDetails.bundleBase.paymentMethod,
                    bundleDetails.bundleBase.buyer,
                    bundleDetails.seller,
                    unsuccessfulFills,
                    accumulator.tokenIds,
                    accumulator.amounts,
                    accumulator.salePrices);
        } else {
            emit BuyBundledListingERC721(
                    bundleDetails.bundleBase.marketplace,
                    bundleDetails.bundleBase.tokenAddress,
                    bundleDetails.bundleBase.paymentMethod,
                    bundleDetails.bundleBase.buyer,
                    bundleDetails.seller,
                    unsuccessfulFills,
                    accumulator.tokenIds,
                    accumulator.salePrices);
        }
    }
}
