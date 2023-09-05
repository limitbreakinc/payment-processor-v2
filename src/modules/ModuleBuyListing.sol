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

    function buyListingForAnyone(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory signature
    ) public payable {
        if (saleDetails.buyer != msg.sender) {
            revert cPort__BuyerMustBeCaller();
        }

        _buyListing(domainSeparator, saleDetails, signature);
    }

    function buyListingForSelf(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory signature
    ) public payable {
        if (saleDetails.buyer != msg.sender) {
            revert cPort__BuyerMustBeCaller();
        }

        if (saleDetails.buyer != saleDetails.beneficiary) {
            revert("TODO");
        }

        _buyListing(domainSeparator, saleDetails, signature);
    }

    function buyListingForSelfWithEOA(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) public payable {
        if (saleDetails.buyer != saleDetails.beneficiary) {
            revert("TODO");
        }

        if (saleDetails.buyer != msg.sender) {
            revert cPort__BuyerMustBeCaller();
        }

        if (saleDetails.buyer != tx.origin) {
            revert cPort__BuyerMustBeCallerAndTransactionOrigin();
        }

        _buyListing(domainSeparator, saleDetails, signature);
    }

    function _buyListing(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory signature
    ) private {
        bool tokenDispensedSuccessfully = _executeOrderBuySide(
            domainSeparator, 
            saleDetails, 
            signature);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }
}
