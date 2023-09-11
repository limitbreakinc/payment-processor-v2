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
        SignatureECDSA memory sellerSignature,
        SignatureECDSA memory cosignerSignature
    ) public payable {
        bool tokenDispensedSuccessfully = _executeOrderBuySide(
            domainSeparator, 
            msg.value,
            saleDetails, 
            sellerSignature,
            cosignerSignature);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }
}
