// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./PaymentProcessorModule.sol";

/*
                                                     @@@@@@@@@@@@@@             
                                                    @@@@@@@@@@@@@@@@@@(         
                                                   @@@@@@@@@@@@@@@@@@@@@        
                                                  @@@@@@@@@@@@@@@@@@@@@@@@      
                                                           #@@@@@@@@@@@@@@      
                                                               @@@@@@@@@@@@     
                            @@@@@@@@@@@@@@*                    @@@@@@@@@@@@     
                           @@@@@@@@@@@@@@@     @               @@@@@@@@@@@@     
                          @@@@@@@@@@@@@@@     @                @@@@@@@@@@@      
                         @@@@@@@@@@@@@@@     @@               @@@@@@@@@@@@      
                        @@@@@@@@@@@@@@@     #@@             @@@@@@@@@@@@/       
                        @@@@@@@@@@@@@@.     @@@@@@@@@@@@@@@@@@@@@@@@@@@         
                       @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@            
                      @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@             
                     @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@           
                    @@@@@@@@@@@@@@@     @@@@@&%%%%%%%%&&@@@@@@@@@@@@@@          
                    @@@@@@@@@@@@@@      @@@@@               @@@@@@@@@@@         
                   @@@@@@@@@@@@@@@     @@@@@                 @@@@@@@@@@@        
                  @@@@@@@@@@@@@@@     @@@@@@                 @@@@@@@@@@@        
                 @@@@@@@@@@@@@@@     @@@@@@@                 @@@@@@@@@@@        
                @@@@@@@@@@@@@@@     @@@@@@@                 @@@@@@@@@@@&        
                @@@@@@@@@@@@@@     *@@@@@@@               (@@@@@@@@@@@@         
               @@@@@@@@@@@@@@@     @@@@@@@@             @@@@@@@@@@@@@@          
              @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           
             @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
            @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@              
           .@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                 
           @@@@@@@@@@@@@@%     @@@@@@@@@@@@@@@@@@@@@@@@(                        
          @@@@@@@@@@@@@@@                                                       
         @@@@@@@@@@@@@@@                                                        
        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                         
       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                          
       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&                                          
      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                           
 
* @title Payment Processor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 

contract ModuleTrades is PaymentProcessorModule {

    constructor(
        address trustedForwarderFactory_,
        uint32 defaultPushPaymentGasLimit_,
        address wrappedNativeCoinAddress_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    PaymentProcessorModule(
        trustedForwarderFactory_, 
        defaultPushPaymentGasLimit_, 
        wrappedNativeCoinAddress_, 
        defaultPaymentMethods) {}

    function buyListing(
        bytes32 domainSeparator, 
        Order memory saleDetails, 
        SignatureECDSA memory sellerSignature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public payable {
        uint256 appendedDataLength;
        unchecked {
            appendedDataLength = msg.data.length - BASE_MSG_LENGTH_BUY_LISTING;
        }

        TradeContext memory context = TradeContext({
            domainSeparator: domainSeparator,
            channel: msg.sender,
            taker: appendedDataLength == 20 ? _msgSender() : msg.sender,
            disablePartialFill: true
        });

        uint256 remainingNativeProceeds = 
            _executeOrderBuySide(
                context,
                msg.value,
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop
            );

        if (remainingNativeProceeds > 0) {
            _pushProceeds(wrappedNativeCoinAddress, remainingNativeProceeds, gasleft());
            IERC20(wrappedNativeCoinAddress).
                transferFrom(address(this), context.taker, remainingNativeProceeds);
        }
    }

    function acceptOffer(
        bytes32 domainSeparator, 
        bool isCollectionLevelOffer, 
        Order memory saleDetails, 
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) public {
        uint256 appendedDataLength;
        unchecked {
            appendedDataLength = 
                msg.data.length - 
                BASE_MSG_LENGTH_ACCEPT_OFFER - 
                (PROOF_ELEMENT_SIZE * tokenSetProof.proof.length);
        }

        _executeOrderSellSide(
            TradeContext({
                domainSeparator: domainSeparator,
                channel: msg.sender,
                taker: appendedDataLength == 20 ? _msgSender() : msg.sender,
                disablePartialFill: true
            }),
            isCollectionLevelOffer, 
            saleDetails, 
            buyerSignature,
            tokenSetProof,
            cosignature,
            feeOnTop);
    }

    function bulkBuyListings(
        bytes32 domainSeparator, 
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata sellerSignatures,
        Cosignature[] calldata cosignatures,
        FeeOnTop[] calldata feesOnTop
    ) public payable {
        if (saleDetailsArray.length != sellerSignatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != cosignatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != feesOnTop.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        uint256 remainingNativeProceeds = msg.value;

        uint256 appendedDataLength;
        unchecked {
            appendedDataLength = 
                msg.data.length - 
                BASE_MSG_LENGTH_BULK_BUY_LISTINGS - 
                (BASE_MSG_LENGTH_BULK_BUY_LISTINGS_PER_ITEM * saleDetailsArray.length);
        }

        TradeContext memory context = TradeContext({
            domainSeparator: domainSeparator,
            channel: msg.sender,
            taker: appendedDataLength == 20 ? _msgSender() : msg.sender,
            disablePartialFill: false
        });

        Order memory saleDetails;
        SignatureECDSA memory sellerSignature;
        Cosignature memory cosignature;
        FeeOnTop memory feeOnTop;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            sellerSignature = sellerSignatures[i];
            cosignature = cosignatures[i];
            feeOnTop = feesOnTop[i];

            if(saleDetails.paymentMethod == address(0)) {
                remainingNativeProceeds = 
                    _executeOrderBuySide(
                        context, 
                        remainingNativeProceeds, 
                        saleDetails, 
                        sellerSignature, 
                        cosignature, 
                        feeOnTop);
            } else {
                _executeOrderBuySide(context, 0, saleDetails, sellerSignature, cosignature, feeOnTop);
            }

            unchecked {
                ++i;
            }
        }

        if (remainingNativeProceeds > 0) {
            _pushProceeds(wrappedNativeCoinAddress, remainingNativeProceeds, gasleft());
            IERC20(wrappedNativeCoinAddress).
                transferFrom(address(this), context.taker, remainingNativeProceeds);
        }
    }

    function bulkAcceptOffers(
        bytes32 domainSeparator, 
        BulkAcceptOffersParams memory params
    ) public {
        if (params.saleDetailsArray.length != params.isCollectionLevelOfferArray.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.buyerSignaturesArray.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.tokenSetProofsArray.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.cosignaturesArray.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length != params.feesOnTopArray.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (params.saleDetailsArray.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        uint256 appendedDataLength;
        unchecked {
            appendedDataLength = 
                msg.data.length - 
                BASE_MSG_LENGTH_BULK_ACCEPT_OFFERS - 
                (BASE_MSG_LENGTH_BULK_ACCEPT_OFFERS_PER_ITEM * params.saleDetailsArray.length);

            for (uint256 i = 0; i < params.tokenSetProofsArray.length;) {
                appendedDataLength -= PROOF_ELEMENT_SIZE * params.tokenSetProofsArray[i].proof.length;
                ++i;
            }
        }

        TradeContext memory context = TradeContext({
            domainSeparator: domainSeparator,
            channel: msg.sender,
            taker: appendedDataLength == 20 ? _msgSender() : msg.sender,
            disablePartialFill: false
        });

        for (uint256 i = 0; i < params.saleDetailsArray.length;) {
            _executeOrderSellSide(
                context,
                params.isCollectionLevelOfferArray[i], 
                params.saleDetailsArray[i], 
                params.buyerSignaturesArray[i],
                params.tokenSetProofsArray[i],
                params.cosignaturesArray[i],
                params.feesOnTopArray[i]);

            unchecked {
                ++i;
            }
        }
    }
}
