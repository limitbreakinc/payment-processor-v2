// SPDX-License-Identifier: BSL-1.1 - Copyright 2024 Limit Break, Inc.
pragma solidity 0.8.19;

import "./DataTypes.sol";
import "./interfaces/IDomainSeparator.sol";

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

contract PaymentProcessorEncoder {

    /**************************************************************/
    /*           PAYMENT SETTINGS MANAGEMENT OPERATIONS           */
    /**************************************************************/

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `createPaymentMethodWhitelist` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  whitelistName            The name of the payment method whitelist.
     */
    function encodeCreatePaymentMethodWhitelistCalldata(address /*paymentProcessorAddress*/, string calldata whitelistName) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "createPaymentMethodWhitelist(string)",
                whitelistName));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `reassignOwnershipOfPaymentMethodWhitelist` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  id  The id of the payment method whitelist to transfer.
     * @param  newOwner The address of the new payment method whitelist owner.
     */
    function encodeReassignOwnershipOfPaymentMethodWhitelistCalldata(address /*paymentProcessorAddress*/, uint32 id, address newOwner) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "reassignOwnershipOfPaymentMethodWhitelist(uint32,address)",
                id,
                newOwner));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `renounceOwnershipOfPaymentMethodWhitelist` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  id  The id of the payment method whitelist to renounce.
     */
    function encodeRenounceOwnershipOfPaymentMethodWhitelistCalldata(address /*paymentProcessorAddress*/, uint32 id) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "renounceOwnershipOfPaymentMethodWhitelist(uint32)",
                id));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `whitelistPaymentMethod` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentMethodWhitelistId  The id of the payment method whitelist to update.
     * @param  paymentMethod             The address of the payment method to whitelist.
     */
    function encodeWhitelistPaymentMethodCalldata(address /*paymentProcessorAddress*/, uint32 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "whitelistPaymentMethod(uint32,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `unwhitelistPaymentMethod` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentMethodWhitelistId  The id of the payment method whitelist to update.
     * @param  paymentMethod             The address of the payment method to unwhitelist.
     */
    function encodeUnwhitelistPaymentMethodCalldata(address /*paymentProcessorAddress*/, uint32 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "unwhitelistPaymentMethod(uint32,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `setCollectionPaymentSettings` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenAddress                     The smart contract address of the NFT collection.
     * @param  paymentSettings                  The payment settings for the collection.
     * @param  paymentMethodWhitelistId         The id of the payment method whitelist to use for the collection.
     * @param  constrainedPricingPaymentMethod  The payment method to use for min/max pricing.
     * @param  royaltyBackfillNumerator         The royalty backfill numerator for the collection.
     * @param  royaltyBackfillReceiver          The royalty backfill receiver for the collection.
     * @param  royaltyBountyNumerator           The royalty bounty numerator for the collection.
     * @param  exclusiveBountyReceiver          The exclusive bounty receiver for the collection.
     * @param  blockTradesFromUntrustedChannels The block trades from untrusted channels flag for the collection.
     */
    function encodeSetCollectionPaymentSettingsCalldata(
        address /*paymentProcessorAddress*/, 
        address tokenAddress, 
        PaymentSettings paymentSettings,
        uint32 paymentMethodWhitelistId,
        address constrainedPricingPaymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver,
        bool blockTradesFromUntrustedChannels,
        bool blockBannedAccounts
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPaymentSettings(address,uint8,uint32,address,uint16,address,uint16,address,bool,bool)",
                tokenAddress,
                paymentSettings,
                paymentMethodWhitelistId,
                constrainedPricingPaymentMethod,
                royaltyBackfillNumerator,
                royaltyBackfillReceiver,
                royaltyBountyNumerator,
                exclusiveBountyReceiver,
                blockTradesFromUntrustedChannels,
                blockBannedAccounts));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `setCollectionPricingBounds` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  pricingBounds Includes the floor price and ceiling price.
     */
    function encodeSetCollectionPricingBoundsCalldata(
        address /*paymentProcessorAddress*/, 
        address tokenAddress, 
        PricingBounds calldata pricingBounds
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPricingBounds(address,(bool,uint120,uint120))",
                tokenAddress,
                pricingBounds));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `setTokenPricingBounds` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenIds      An array of token ids for which pricing bounds are being set.
     * @param  pricingBounds An array of pricing bounds used to set the floor and ceiling per token.
     */
    function encodeSetTokenPricingBoundsCalldata(
        address /*paymentProcessorAddress*/, 
        address tokenAddress, 
        uint256[] calldata tokenIds, 
        PricingBounds[] calldata pricingBounds
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setTokenPricingBounds(address,uint256[],(bool,uint120,uint120)[])",
                tokenAddress,
                tokenIds,
                pricingBounds));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `addTrustedChannelForCollection` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenAddress The collection.
     * @param  channel      The channel to add.
     */
    function encodeAddTrustedChannelForCollectionCalldata(address /*paymentProcessorAddress*/, address tokenAddress, address channel) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "addTrustedChannelForCollection(address,address)",
                tokenAddress,
                channel));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `removeTrustedChannelForCollection` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenAddress The collection.
     * @param  channel      The channel to remove.
     */
    function encodeRemoveTrustedChannelForCollectionCalldata(address /*paymentProcessorAddress*/, address tokenAddress, address channel) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "removeTrustedChannelForCollection(address,address)",
                tokenAddress,
                channel));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `addBannedAccountForCollection` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenAddress The collection.
     * @param  account      The account to add to the banned list.
     */
    function encodeAddBannedAccountForCollectionCalldata(address /*paymentProcessorAddress*/, address tokenAddress, address account) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "addBannedAccountForCollection(address,address)",
                tokenAddress,
                account));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `removeBannedAccountForCollection` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  tokenAddress The collection.
     * @param  account      The account to remove from the banned list.
     */
    function encodeRemoveBannedAccountForCollectionCalldata(address /*paymentProcessorAddress*/, address tokenAddress, address account) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "removeBannedAccountForCollection(address,address)",
                tokenAddress,
                account));
    }

    /**************************************************************/
    /*              ON-CHAIN CANCELLATION OPERATIONS              */
    /**************************************************************/

    function encodeDestroyCosignerCalldata(
        address /*paymentProcessorAddress*/, 
        address cosigner,
        SignatureECDSA memory signature
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "destroyCosigner(address,(uint8,bytes32,bytes32))",
                cosigner,
                signature));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `revokeSingleNonce` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  nonce The nonce that was signed in the revoked listing or offer.
     */
    function encodeRevokeSingleNonceCalldata(address /*paymentProcessorAddress*/, uint256 nonce) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "revokeSingleNonce(uint256)",
                nonce));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `revokeOrderDigest` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  digest The order digest that was signed in the revoked listing or offer.
     */
    function encodeRevokeOrderDigestCalldata(address /*paymentProcessorAddress*/, bytes32 digest) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "revokeOrderDigest(bytes32)",
                digest));
    }

    /**************************************************************/
    /*                     TRADING OPERATIONS                     */
    /**************************************************************/

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `buyListing` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentProcessorAddress  The address for Payment Processor, used to get Payment Processor's EIP-712 domain separator.
     * @param  saleDetails              The order execution details.
     * @param  signature                The maker's signature authorizing the order execution.
     * @param  cosignature              The additional cosignature for a cosigned order, if applicable.
     * @param  feeOnTop                 The additional fee to add on top of the order, paid by taker.
     */
    function encodeBuyListingCalldata(
        address paymentProcessorAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyListing(bytes32,(uint8,address,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248),(uint8,bytes32,bytes32),(address,address,uint256,uint8,bytes32,bytes32),(address,uint256))",
                IDomainSeparator(paymentProcessorAddress).getDomainSeparator(),
                saleDetails,
                signature,
                cosignature,
                feeOnTop));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `acceptOffer` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentProcessorAddress  The address for Payment Processor, used to get Payment Processor's EIP-712 domain separator.
     * @param  isCollectionLevelOffer   The flag to indicate if an offer is for any token in the collection.
     * @param  saleDetails              The order execution details.
     * @param  signature                The maker's signature authorizing the order execution.
     * @param  tokenSetProof            The root hash and merkle proofs for an offer that is a subset of tokens in a collection.
     * @param  cosignature              The additional cosignature for a cosigned order, if applicable.
     * @param  feeOnTop                 The additional fee to add on top of the order, paid by taker.
     */
    function encodeAcceptOfferCalldata(
        address paymentProcessorAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "acceptOffer(bytes32,bool,(uint8,address,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248),(uint8,bytes32,bytes32),(bytes32,bytes32[]),(address,address,uint256,uint8,bytes32,bytes32),(address,uint256))",
                IDomainSeparator(paymentProcessorAddress).getDomainSeparator(),
                isCollectionLevelOffer,
                saleDetails,
                signature,
                tokenSetProof,
                cosignature,
                feeOnTop));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `bulkBuyListings` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentProcessorAddress  The address for Payment Processor, used to get Payment Processor's EIP-712 domain separator.
     * @param  saleDetailsArray         An array of order execution details.
     * @param  signatures               An array of maker signatures authorizing the order execution.
     * @param  cosignatures             An array of additional cosignatures for cosigned orders, if applicable.
     * @param  feesOnTop                An array of additional fees to add on top of the orders, paid by taker.
     */
    function encodeBulkBuyListingsCalldata(
        address paymentProcessorAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures,
        FeeOnTop[] calldata feesOnTop
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkBuyListings(bytes32,(uint8,address,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248)[],(uint8,bytes32,bytes32)[],(address,address,uint256,uint8,bytes32,bytes32)[],(address,uint256)[])",
                IDomainSeparator(paymentProcessorAddress).getDomainSeparator(),
                saleDetailsArray,
                signatures,
                cosignatures,
                feesOnTop));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `bulkAcceptOffers` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentProcessorAddress       The address for Payment Processor, used to get Payment Processor's EIP-712 domain separator.
     * @param  isCollectionLevelOfferArray   An array of flags to indicate if an offer is for any token in the collection.
     * @param  saleDetailsArray              An array of order execution details.
     * @param  signatures                    An array of maker signatures authorizing the order executions.
     * @param  tokenSetProofsArray           An array of root hashes and merkle proofs for offers that are a subset of tokens in a collection.
     * @param  cosignaturesArray             An array of additional cosignatures for cosigned orders, as applicable.
     * @param  feesOnTopArray                An array of additional fees to add on top of the orders, paid by taker.
     */
    function encodeBulkAcceptOffersCalldata(
        address paymentProcessorAddress, 
        bool[] memory isCollectionLevelOfferArray,
        Order[] memory saleDetailsArray,
        SignatureECDSA[] memory signatures,
        TokenSetProof[] memory tokenSetProofsArray,
        Cosignature[] memory cosignaturesArray,
        FeeOnTop[] memory feesOnTopArray
    ) external view returns (bytes memory) {
        BulkAcceptOffersParams memory params = BulkAcceptOffersParams({
            isCollectionLevelOfferArray: isCollectionLevelOfferArray,
            saleDetailsArray: saleDetailsArray,
            buyerSignaturesArray: signatures,
            tokenSetProofsArray: tokenSetProofsArray,
            cosignaturesArray: cosignaturesArray,
            feesOnTopArray: feesOnTopArray
        });

        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkAcceptOffers(bytes32,(bool[],(uint8,address,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248)[],(uint8,bytes32,bytes32)[],(bytes32,bytes32[])[],(address,address,uint256,uint8,bytes32,bytes32)[],(address,uint256)[]))",
                IDomainSeparator(paymentProcessorAddress).getDomainSeparator(),
                params));
    }

    /**
     * @notice Helper function to encode transaction calldata in the format required for a `sweepCollection` call.
     *
     * @dev    Encoding parameters into a bytes array is performed for gas optimization in Payment Processor.
     * @dev    Payment Processor is separated into multiple module contracts due to contract size limitations.
     * @dev    Calls to the Payment Processor contract are passed along to the corresponding module through a delegate call.
     * @dev    *Note:* This encoding function should **not** be called on-chain as part of a transaction. It is meant to
     * @dev    be called off-chain to prepare the transaction data for a call to Payment Processor.
     *
     * @param  paymentProcessorAddress  The address for Payment Processor, used to get Payment Processor's EIP-712 domain separator.
     * @param  feeOnTop                 An array of additional fees to add on top of the orders, paid by taker.
     * @param  sweepOrder               The order information that is common to all items in the sweep.
     * @param  items                    An array of items that contains the order information unique to each item.
     * @param  signatures               An array of maker signatures authorizing the order execution.
     * @param  cosignatures             An array of additional cosignatures for cosigned orders, if applicable.
     */
    function encodeSweepCollectionCalldata(
        address paymentProcessorAddress, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "sweepCollection(bytes32,(address,uint256),(uint8,address,address,address),(address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[],(address,address,uint256,uint8,bytes32,bytes32)[])",
                IDomainSeparator(paymentProcessorAddress).getDomainSeparator(),
                feeOnTop,
                sweepOrder,
                items,
                signatures,
                cosignatures));
    }

    /**************************************************************/
    /*                      HELPER FUNCTIONS                      */
    /**************************************************************/

    function _removeFirst4Bytes(bytes memory data) private view returns (bytes memory result) {
        assembly {
            if lt(mload(data), 0x04) {
                revert(0,0)
            }
            mstore(result, sub(mload(data), 0x04))
            if iszero(staticcall(gas(), 0x04, add(data, 0x24), mload(result), add(result, 0x20), mload(result))){
              revert(0,0)
            }
        }
    }
}
