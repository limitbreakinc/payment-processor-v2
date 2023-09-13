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

contract ModuleSingleTrades is cPortModule {

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
        SignatureECDSA memory sellerSignature
    ) public payable {
        bool tokenDispensedSuccessfully = _executeOrderBuySide(
            domainSeparator, 
            msg.value,
            saleDetails, 
            sellerSignature);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }

    function buyListingWithFeeOnTop(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        FeeOnTop memory feeOnTop
    ) public payable {
        bool tokenDispensedSuccessfully = _executeOrderBuySide(
            domainSeparator, 
            msg.value,
            saleDetails, 
            sellerSignature,
            feeOnTop);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }

    function acceptOffer(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof
    ) public {
        bool tokenDispensedSuccessfully = _executeOrderSellSide(
            domainSeparator, 
            0,
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }

    function acceptOfferWithFeeOnTop(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        FeeOnTop memory feeOnTop
    ) public {
        bool tokenDispensedSuccessfully = _executeOrderSellSide(
            domainSeparator, 
            0,
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof,
            feeOnTop);

        if (!tokenDispensedSuccessfully) {
            revert cPort__DispensingTokenWasUnsuccessful();
        }
    }
}
