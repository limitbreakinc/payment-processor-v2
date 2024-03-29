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

contract ModuleTradesAdvanced is PaymentProcessorModule {

    constructor(address configurationContract) PaymentProcessorModule(configurationContract){}

    /**
     * @notice Executes a sweep transaction for buying multiple items from the same collection.
     *
     * @dev    Throws when the sweep order protocol is ERC1155_PARTIAL_FILL (unsupported).
     * @dev    Throws when a maker's nonce has already been used or has been cancelled.
     * @dev    Throws when any order has expired.
     * @dev    Throws when any combined marketplace and royalty fee exceeds 100%.
     * @dev    Throws when the taker fee on top exceeds 100% of the combined item sale prices.
     * @dev    Throws when a maker's master nonce does not match the order details.
     * @dev    Throws when an order does not comply with the collection payment settings.
     * @dev    Throws when a maker's signature is invalid.
     * @dev    Throws when an order is a cosigned order and the cosignature is invalid.
     * @dev    Throws when the transaction originates from an untrusted channel if untrusted channels are blocked.
     * @dev    Throws when any maker or taker is a banned account for the collection.
     * @dev    Throws when the taker does not have or did not send sufficient funds to complete the purchase.
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
     *
     * @param  domainSeparator  The domain separator to be used when verifying the order signature.
     * @param  feeOnTop         The additional fee to add on top of the orders, paid by taker.
     * @param  sweepOrder       The order information that is common to all items in the sweep.
     * @param  items            An array of items that contains the order information unique to each item.
     * @param  signedSellOrders An array of maker signatures authorizing the order execution.
     * @param  cosignatures     An array of additional cosignatures for cosigned orders, if applicable.
     */
    function sweepCollection(
        bytes32 domainSeparator, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signedSellOrders,
        Cosignature[] memory cosignatures
    ) public payable {
        uint256 appendedDataLength;
        unchecked {
            appendedDataLength = 
                msg.data.length - 
                BASE_MSG_LENGTH_SWEEP_COLLECTION - 
                (BASE_MSG_LENGTH_SWEEP_COLLECTION_PER_ITEM * items.length);
        }

        TradeContext memory context = TradeContext({
            domainSeparator: domainSeparator,
            channel: msg.sender,
            taker: appendedDataLength == 20 ? _msgSender() : msg.sender,
            disablePartialFill: false
        });

        uint256 remainingNativeProceeds =_executeSweepOrder(
            context,
            msg.value,
            feeOnTop,
            sweepOrder,
            items,
            signedSellOrders,
            cosignatures
        );

        if (remainingNativeProceeds > 0) {
            _pushProceeds(wrappedNativeCoinAddress, remainingNativeProceeds, gasleft());
            IERC20(wrappedNativeCoinAddress).
                transferFrom(address(this), context.taker, remainingNativeProceeds);
        }
    }
}
