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

contract ModuleBuyListing is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    cPortModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function buyListing(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) public payable {

        if (saleDetails.paymentMethod == address(0)) {
            if (saleDetails.itemPrice != msg.value) {
                revert cPort__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert cPort__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        _verifyCallerIsBuyerAndTxOrigin(saleDetails.buyer);

        bool tokenDispensedSuccessfully = _executeOrder(
            domainSeparator, 
            false, 
            saleDetails.seller, 
            saleDetails, 
            signature);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }
}
