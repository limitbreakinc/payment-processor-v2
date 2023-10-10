// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
| |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
| |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
| |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
| |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
| |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
 
 By Limit Break, Inc.
*/ 

import "./CPortModule.sol";

contract ModuleSingleTrades is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function buyListing(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature
    ) public payable {
        _executeOrderBuySide(
            domainSeparator, 
            true,
            msg.value,
            saleDetails, 
            sellerSignature
        );
    }

    function buyListingWithFeeOnTop(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        FeeOnTop memory feeOnTop
    ) public payable {
        _executeOrderBuySide(
            domainSeparator, 
            true,
            msg.value,
            saleDetails, 
            sellerSignature,
            feeOnTop
        );
    }

    function acceptOffer(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof
    ) public {
        _executeOrderSellSide(
            domainSeparator, 
            true,
            0,
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof);
    }

    function acceptOfferWithFeeOnTop(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
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
            feeOnTop);
    }
}
