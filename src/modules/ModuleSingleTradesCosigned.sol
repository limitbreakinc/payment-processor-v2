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

contract ModuleSingleTradesCosigned is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    cPortModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function buyListingCosigned(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        Cosignature memory cosignature
    ) public payable {
        _executeOrderBuySide(
            domainSeparator, 
            true,
            msg.value,
            saleDetails, 
            sellerSignature,
            cosignature,
            FeeOnTop({recipient: address(0), amount: 0})
        );
    }

    function buyListingCosignedWithFeeOnTop(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public payable {
        _executeOrderBuySide(
            domainSeparator, 
            true,
            msg.value,
            saleDetails, 
            sellerSignature,
            cosignature,
            feeOnTop
        );
    }

    function acceptOfferCosigned(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature
    ) public {
        _executeOrderSellSide(
            domainSeparator, 
            true,
            0,
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof,
            cosignature);
    }

    function acceptOfferCosignedWithFeeOnTop(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public {
        _executeOrderSellSide(
            domainSeparator, 
            true,
            0,
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof,
            cosignature,
            feeOnTop);
    }
}
