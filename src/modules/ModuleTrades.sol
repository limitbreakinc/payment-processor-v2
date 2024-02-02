// SPDX-License-Identifier: BSL-1.1
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

    constructor(address configurationContract) PaymentProcessorModule(configurationContract){}

    /**
     * @notice Executes a buy listing transaction for a single order item.
     *
     * @dev    Throws when the maker's nonce has already been used or has been cancelled.
     * @dev    Throws when the order has expired.
     * @dev    Throws when the combined marketplace and royalty fee exceeds 100%.
     * @dev    Throws when the taker fee on top exceeds 100% of the item sale price.
     * @dev    Throws when the maker's master nonce does not match the order details.
     * @dev    Throws when the order does not comply with the collection payment settings.
     * @dev    Throws when the maker's signature is invalid.
     * @dev    Throws when the order is a cosigned order and the cosignature is invalid.
     * @dev    Throws when the transaction originates from an untrusted channel if untrusted channels are blocked.
     * @dev    Throws when the maker or taker is a banned account for the collection.
     * @dev    Throws when the taker does not have or did not send sufficient funds to complete the purchase.
     * @dev    Throws when the token transfer fails for any reason such as lack of approvals or token no longer owned by maker.
     * @dev    Throws when the maker has revoked the order digest on a ERC1155_PARTIAL_FILL order.
     * @dev    Throws when the order is an ERC1155_PARTIAL_FILL order and the item price is not evenly divisible by the amount.
     * @dev    Throws when the order is an ERC1155_PARTIAL_FILL order and the remaining fillable quantity is less than the requested minimum fill amount.
     * @dev    Any unused native token payment will be returned to the taker as wrapped native token.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. Payment amounts and fees are sent to their respective recipients.
     * @dev    2. Purchased tokens are sent to the beneficiary.
     * @dev    3. Maker's nonce is marked as used for ERC721_FILL_OR_KILL and ERC1155_FILL_OR_KILL orders.
     * @dev    4. Maker's partially fillable order state is updated for ERC1155_PARTIAL_FILL orders.
     * @dev    5. An `BuyListingERC721` event has been emitted for a ERC721 purchase.
     * @dev    6. An `BuyListingERC1155` event has been emitted for a ERC1155 purchase.
     * @dev    7. A `NonceInvalidated` event has been emitted for a ERC721_FILL_OR_KILL or ERC1155_FILL_OR_KILL order.
     * @dev    8. A `OrderDigestInvalidated` event has been emitted for a ERC1155_PARTIAL_FILL order, if fully filled.
     *
     * @param  domainSeparator The domain separator to be used when verifying the order signature.
     * @param  saleDetails     The order execution details.
     * @param  sellerSignature The maker's signature authorizing the order execution.
     * @param  cosignature     The additional cosignature for a cosigned order, if applicable.
     * @param  feeOnTop        The additional fee to add on top of the order, paid by taker.
     */
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

    /**
     * @notice Executes an offer accept transaction for a single order item.
     *
     * @dev    Throws when the maker's nonce has already been used or has been cancelled.
     * @dev    Throws when the order has expired.
     * @dev    Throws when the combined marketplace and royalty fee exceeds 100%.
     * @dev    Throws when the taker fee on top exceeds 100% of the item sale price.
     * @dev    Throws when the maker's master nonce does not match the order details.
     * @dev    Throws when the order does not comply with the collection payment settings.
     * @dev    Throws when the maker's signature is invalid.
     * @dev    Throws when the order is a cosigned order and the cosignature is invalid.
     * @dev    Throws when the transaction originates from an untrusted channel if untrusted channels are blocked.
     * @dev    Throws when the maker or taker is a banned account for the collection.
     * @dev    Throws when the maker does not have sufficient funds to complete the purchase.
     * @dev    Throws when the token transfer fails for any reason such as lack of approvals or token not owned by the taker.
     * @dev    Throws when the token the offer is being accepted for does not match the conditions set by the maker.
     * @dev    Throws when the maker has revoked the order digest on a ERC1155_PARTIAL_FILL order.
     * @dev    Throws when the order is an ERC1155_PARTIAL_FILL order and the item price is not evenly divisible by the amount.
     * @dev    Throws when the order is an ERC1155_PARTIAL_FILL order and the remaining fillable quantity is less than the requested minimum fill amount.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. Payment amounts and fees are sent to their respective recipients.
     * @dev    2. Purchased tokens are sent to the beneficiary.
     * @dev    3. Maker's nonce is marked as used for ERC721_FILL_OR_KILL and ERC1155_FILL_OR_KILL orders.
     * @dev    4. Maker's partially fillable order state is updated for ERC1155_PARTIAL_FILL orders.
     * @dev    5. An `AcceptOfferERC721` event has been emitted for a ERC721 sale.
     * @dev    6. An `AcceptOfferERC1155` event has been emitted for a ERC1155 sale.
     * @dev    7. A `NonceInvalidated` event has been emitted for a ERC721_FILL_OR_KILL or ERC1155_FILL_OR_KILL order.
     * @dev    8. A `OrderDigestInvalidated` event has been emitted for a ERC1155_PARTIAL_FILL order, if fully filled.
     *
     * @param  domainSeparator        The domain separator to be used when verifying the order signature.
     * @param  isCollectionLevelOffer The flag to indicate if an offer is for any token in the collection.
     * @param  saleDetails            The order execution details.
     * @param  buyerSignature         The maker's signature authorizing the order execution.
     * @param  tokenSetProof          The root hash and merkle proofs for an offer that is a subset of tokens in a collection.
     * @param  cosignature            The additional cosignature for a cosigned order, if applicable.
     * @param  feeOnTop               The additional fee to add on top of the order, paid by taker.
     */
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

    /**
     * @notice Executes a buy listing transaction for multiple order items.
     *
     * @dev    Throws when a maker's nonce has already been used or has been cancelled.
     * @dev    Throws when any order has expired.
     * @dev    Throws when any combined marketplace and royalty fee exceeds 100%.
     * @dev    Throws when any taker fee on top exceeds 100% of the item sale price.
     * @dev    Throws when a maker's master nonce does not match the order details.
     * @dev    Throws when an order does not comply with the collection payment settings.
     * @dev    Throws when a maker's signature is invalid.
     * @dev    Throws when an order is a cosigned order and the cosignature is invalid.
     * @dev    Throws when the transaction originates from an untrusted channel if untrusted channels are blocked.
     * @dev    Throws when any maker or taker is a banned account for the collection.
     * @dev    Throws when the taker does not have or did not send sufficient funds to complete the purchase.
     * @dev    Throws when a maker has revoked the order digest on a ERC1155_PARTIAL_FILL order.
     * @dev    Throws when an order is an ERC1155_PARTIAL_FILL order and the item price is not evenly divisible by the amount.
     * @dev    Throws when an order is an ERC1155_PARTIAL_FILL order and the remaining fillable quantity is less than the requested minimum fill amount.
     * @dev    Will NOT throw when a token fails to transfer but also will not disperse payments for failed items.
     * @dev    Any unused native token payment will be returned to the taker as wrapped native token.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. Payment amounts and fees are sent to their respective recipients.
     * @dev    2. Purchased tokens are sent to the beneficiary.
     * @dev    3. Makers nonces are marked as used for ERC721_FILL_OR_KILL and ERC1155_FILL_OR_KILL orders.
     * @dev    4. Makers partially fillable order states are updated for ERC1155_PARTIAL_FILL orders.
     * @dev    5. `BuyListingERC721` events have been emitted for each ERC721 purchase.
     * @dev    6. `BuyListingERC1155` events have been emitted for each ERC1155 purchase.
     * @dev    7. A `NonceInvalidated` event has been emitted for each ERC721_FILL_OR_KILL or ERC1155_FILL_OR_KILL order.
     * @dev    8. A `OrderDigestInvalidated` event has been emitted for each ERC1155_PARTIAL_FILL order, if fully filled.
     *
     * @param  domainSeparator  The domain separator to be used when verifying the order signature.
     * @param  saleDetailsArray An array of order execution details.
     * @param  sellerSignatures An array of maker signatures authorizing the order execution.
     * @param  cosignatures     An array of additional cosignatures for cosigned orders, if applicable.
     * @param  feesOnTop        An array of additional fees to add on top of the orders, paid by taker.
     */
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

    /**
     * @notice Executes an accept offer transaction for multiple order items.
     *
     * @dev    Throws when a maker's nonce has already been used or has been cancelled.
     * @dev    Throws when any order has expired.
     * @dev    Throws when any combined marketplace and royalty fee exceeds 100%.
     * @dev    Throws when any taker fee on top exceeds 100% of the item sale price.
     * @dev    Throws when a maker's master nonce does not match the order details.
     * @dev    Throws when an order does not comply with the collection payment settings.
     * @dev    Throws when a maker's signature is invalid.
     * @dev    Throws when an order is a cosigned order and the cosignature is invalid.
     * @dev    Throws when the transaction originates from an untrusted channel if untrusted channels are blocked.
     * @dev    Throws when any maker or taker is a banned account for the collection.
     * @dev    Throws when a maker does not have sufficient funds to complete the purchase.
     * @dev    Throws when the token an offer is being accepted for does not match the conditions set by the maker.
     * @dev    Throws when a maker has revoked the order digest on a ERC1155_PARTIAL_FILL order.
     * @dev    Throws when an order is an ERC1155_PARTIAL_FILL order and the item price is not evenly divisible by the amount.
     * @dev    Throws when an order is an ERC1155_PARTIAL_FILL order and the remaining fillable quantity is less than the requested minimum fill amount.
     * @dev    Will NOT throw when a token fails to transfer but also will not disperse payments for failed items.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. Payment amounts and fees are sent to their respective recipients.
     * @dev    2. Purchased tokens are sent to the beneficiary.
     * @dev    3. Makers nonces are marked as used for ERC721_FILL_OR_KILL and ERC1155_FILL_OR_KILL orders.
     * @dev    4. Makers partially fillable order states are updated for ERC1155_PARTIAL_FILL orders.
     * @dev    5. `AcceptOfferERC721` events have been emitted for each ERC721 sale.
     * @dev    6. `AcceptOfferERC1155` events have been emitted for each ERC1155 sale.
     * @dev    7. A `NonceInvalidated` event has been emitted for each ERC721_FILL_OR_KILL or ERC1155_FILL_OR_KILL order.
     * @dev    8. A `OrderDigestInvalidated` event has been emitted for each ERC1155_PARTIAL_FILL order, if fully filled.
     *
     * @param  domainSeparator The domain separator to be used when verifying the order signature.
     * @param  params          The parameters for the bulk offers being accepted.
     */
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
