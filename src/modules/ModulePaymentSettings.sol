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

contract ModulePaymentSettings is PaymentProcessorModule {
    using EnumerableSet for EnumerableSet.AddressSet;

    constructor(address configurationContract) PaymentProcessorModule(configurationContract){}

    /**
     * @notice Returns an array of the immutable default payment methods specified at deploy time.  
     *         However, if any post-deployment default payment methods have been added, they are
     *         not returned here because using an enumerable payment method whitelist would make trades
     *         less gas efficient.  For post-deployment default payment methods, exchanges should index
     *         the `PaymentMethodAddedToWhitelist` and `PaymentMethodRemovedFromWhitelist` events.
     */
    function getDefaultPaymentMethods() external view returns (address[] memory) {
        return _getDefaultPaymentMethods();
    }

    /**
     * @notice Allows any user to create a new custom payment method whitelist.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The payment method whitelist id tracker has been incremented by `1`.
     * @dev    2. The caller has been assigned as the owner of the payment method whitelist.
     * @dev    3. A `CreatedPaymentMethodWhitelist` event has been emitted.
     *
     * @param  whitelistName             The name of the payment method whitelist.
     * @return paymentMethodWhitelistId  The id of the newly created payment method whitelist.
     */
    function createPaymentMethodWhitelist(
        string calldata whitelistName
    ) external returns (uint32 paymentMethodWhitelistId) {
        address listCreator = _msgSender();
        paymentMethodWhitelistId = appStorage().lastPaymentMethodWhitelistId++;
        appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId] = listCreator;
        emit CreatedPaymentMethodWhitelist(paymentMethodWhitelistId, listCreator, whitelistName);
    }

    /**
     * @notice Transfer ownership of a payment method whitelist list to a new owner.
     *
     * @dev Throws when the new owner is the zero address.
     * @dev Throws when the caller does not own the specified list.
     *
     * @dev <h4>Postconditions:</h4>
     *      1. The payment method whitelist list ownership is transferred to the new owner.
     *      2. A `ReassignedPaymentMethodWhitelistOwnership` event is emitted.
     *
     * @param id       The id of the payment method whitelist.
     * @param newOwner The address of the new owner.
     */
    function reassignOwnershipOfPaymentMethodWhitelist(uint32 id, address newOwner) external {
        if(newOwner == address(0)) {
            revert PaymentProcessor__PaymentMethodWhitelistOwnershipCannotBeTransferredToZeroAddress();
        }

        _reassignOwnershipOfPaymentMethodWhitelist(id, newOwner);
    }

    /**
     * @notice Renounce the ownership of a payment method whitelist, rendering the list immutable.
     *
     * @dev Throws when the caller does not own the specified list.
     *
     * @dev <h4>Postconditions:</h4>
     *      1. The ownership of the specified payment method whitelist is renounced.
     *      2. A `ReassignedPaymentMethodWhitelistOwnership` event is emitted.
     *
     * @param id The id of the payment method whitelist.
     */
    function renounceOwnershipOfPaymentMethodWhitelist(uint32 id) external {
        _reassignOwnershipOfPaymentMethodWhitelist(id, address(0));
    }

    /**
     * @notice Allows custom payment method whitelist owners to approve a new coin for use as a payment currency.
     *
     * @dev    Throws when caller is not the owner of the specified payment method whitelist.
     * @dev    Throws when the specified coin is already whitelisted under the specified whitelist id.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `paymentMethod` has been approved in `paymentMethodWhitelist` mapping.
     * @dev    2. A `PaymentMethodAddedToWhitelist` event has been emitted.
     *
     * @param  paymentMethodWhitelistId The id of the payment method whitelist to update.
     * @param  paymentMethod            The address of the payment method to whitelist.
     */
    function whitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        if (appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId].add(paymentMethod)) {
            emit PaymentMethodAddedToWhitelist(paymentMethodWhitelistId, paymentMethod);
        } else {
            revert PaymentProcessor__PaymentMethodIsAlreadyApproved();
        }
    }

    /**
     * @notice Allows custom payment method whitelist owners to remove a coin from the list of approved payment 
     *         currencies.
     *
     * @dev    Throws when caller is not the owner of the specified payment method whitelist.
     * @dev    Throws when the specified coin is not currently whitelisted under the specified whitelist id.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `paymentMethod` has been removed from the `paymentMethodWhitelist` mapping.
     * @dev    2. A `PaymentMethodRemovedFromWhitelist` event has been emitted.
     *
     * @param  paymentMethodWhitelistId  The id of the payment method whitelist to update.
     * @param  paymentMethod             The address of the payment method to unwhitelist.
     */
    function unwhitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        if (appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId].remove(paymentMethod)) {
            emit PaymentMethodRemovedFromWhitelist(paymentMethodWhitelistId, paymentMethod);
        } else {
            revert PaymentProcessor__CoinIsNotApproved();
        }
        
    }

    /**
     * @notice Allows the smart contract, the contract owner, or the contract admin of any NFT collection to 
     *         specify the payment settings for their collections.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the royalty backfill numerator is greater than 10,000.
     * @dev    Throws when the royalty bounty numerator is greater than 10,000.
     * @dev    Throws when the specified payment method whitelist id does not exist.
     * 
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The `PaymentSettings` type for the collection has been set.
     * @dev    2. The `paymentMethodWhitelistId` for the collection has been set, if applicable.
     * @dev    3. The `constrainedPricingPaymentMethod` for the collection has been set, if applicable.
     * @dev    4. The `royaltyBackfillNumerator` for the collection has been set.
     * @dev    5. The `royaltyBackfillReceiver` for the collection has been set.
     * @dev    6. The `royaltyBountyNumerator` for the collection has been set.
     * @dev    7. The `exclusiveBountyReceiver` for the collection has been set.
     * @dev    8. The `blockTradesFromUntrustedChannels` for the collection has been set.
     * @dev    8. An `UpdatedCollectionPaymentSettings` event has been emitted.
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
    function setCollectionPaymentSettings(
        address tokenAddress, 
        PaymentSettings paymentSettings,
        uint32 paymentMethodWhitelistId,
        address constrainedPricingPaymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver,
        bool blockTradesFromUntrustedChannels,
        bool blockBannedAccounts) external {
            _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

            if (royaltyBackfillNumerator > FEE_DENOMINATOR) {
                revert PaymentProcessor__RoyaltyBackfillNumeratorCannotExceedFeeDenominator();
            }

            if (royaltyBountyNumerator > FEE_DENOMINATOR) {
                revert PaymentProcessor__RoyaltyBountyNumeratorCannotExceedFeeDenominator();
            }

            if (
                paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist || 
                paymentSettings == PaymentSettings.AllowAnyPaymentMethod
            ) {
                paymentMethodWhitelistId = 0;
                constrainedPricingPaymentMethod = address(0);
            } else if (paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
                constrainedPricingPaymentMethod = address(0);
            } else if (paymentSettings == PaymentSettings.PricingConstraints) {
                paymentMethodWhitelistId = 0;
            }

            if (paymentMethodWhitelistId > appStorage().lastPaymentMethodWhitelistId) {
                revert PaymentProcessor__PaymentMethodWhitelistDoesNotExist();
            }

            appStorage().collectionRoyaltyBackfillReceivers[tokenAddress] = royaltyBackfillReceiver;
            appStorage().collectionExclusiveBountyReceivers[tokenAddress] = exclusiveBountyReceiver;

            appStorage().collectionPaymentSettings[tokenAddress] = CollectionPaymentSettings({
                paymentSettings: paymentSettings,
                paymentMethodWhitelistId: paymentMethodWhitelistId,
                constrainedPricingPaymentMethod: constrainedPricingPaymentMethod,
                royaltyBackfillNumerator: royaltyBackfillNumerator,
                royaltyBountyNumerator: royaltyBountyNumerator,
                flags: _generateCollectionPaymentSettingsFlags(
                    tokenAddress, 
                    exclusiveBountyReceiver, 
                    blockTradesFromUntrustedChannels, 
                    blockBannedAccounts
                )
            });

            emit UpdatedCollectionPaymentSettings(
                tokenAddress, 
                paymentSettings, 
                paymentMethodWhitelistId, 
                constrainedPricingPaymentMethod,
                royaltyBackfillNumerator,
                royaltyBackfillReceiver,
                royaltyBountyNumerator,
                exclusiveBountyReceiver,
                blockTradesFromUntrustedChannels,
                blockBannedAccounts);
    }

    function overridePushPaymentGasLimit(address tokenAddress, uint256 gasLimitOverride) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if (gasLimitOverride < pushPaymentGasLimit) {
            revert PaymentProcessor__PushPaymentGasLimitTooLow();
        }

        appStorage().collectionPaymentSettings[tokenAddress].flags = 
                _setFlag(
                    appStorage().collectionPaymentSettings[tokenAddress].flags, 
                    FLAG_OVERRIDE_PUSH_PAYMENT_GAS_LIMIT, 
                    gasLimitOverride > pushPaymentGasLimit);

        appStorage().collectionPushPaymentGasLimitOverrides[tokenAddress] = gasLimitOverride;

        emit PushPaymentGasLimitOverriddenByCollection(tokenAddress, gasLimitOverride);
    }

    /**
     * @notice Allows the smart contract, the contract owner, or the contract admin of any NFT collection to 
     *         specify their own bounded price at the collection level.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the specified floor price is greater than the ceiling price.
     * 
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The collection-level pricing bounds for the specified tokenAddress has been set.
     * @dev    2. An `UpdatedCollectionLevelPricingBoundaries` event has been emitted.
     *
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  pricingBounds Includes the floor price and ceiling price.
     */
    function setCollectionPricingBounds(address tokenAddress, PricingBounds calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(pricingBounds.floorPrice > pricingBounds.ceilingPrice) {
            revert PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();
        }
        
        appStorage().collectionPricingBounds[tokenAddress] = pricingBounds;
        
        emit UpdatedCollectionLevelPricingBoundaries(
            tokenAddress, 
            pricingBounds.floorPrice, 
            pricingBounds.ceilingPrice);
    }

    /**
     * @notice Allows the smart contract, the contract owner, or the contract admin of any NFT collection to 
     *         specify their own bounded price at the individual token level.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the lengths of the tokenIds and pricingBounds array don't match.
     * @dev    Throws when the tokenIds or pricingBounds array length is zero. 
     * @dev    Throws when the any of the specified floor prices is greater than the ceiling price for that token id.
     * 
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The token-level pricing bounds for the specified tokenAddress and token ids has been set.
     * @dev    2. An `UpdatedTokenLevelPricingBoundaries` event has been emitted.
     *
     * @param  tokenAddress  The smart contract address of the NFT collection.
     * @param  tokenIds      An array of token ids for which pricing bounds are being set.
     * @param  pricingBounds An array of pricing bounds used to set the floor and ceiling per token.
     */
    function setTokenPricingBounds(
        address tokenAddress, 
        uint256[] calldata tokenIds, 
        PricingBounds[] calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(tokenIds.length != pricingBounds.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if(tokenIds.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        mapping (uint256 => PricingBounds) storage ptrTokenPricingBounds = 
            appStorage().tokenPricingBounds[tokenAddress];

        uint256 tokenId;
        for(uint256 i = 0; i < tokenIds.length;) {
            tokenId = tokenIds[i];
            PricingBounds memory pricingBounds_ = pricingBounds[i];

            if(pricingBounds_.floorPrice > pricingBounds_.ceilingPrice) {
                revert PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();
            }

            ptrTokenPricingBounds[tokenId] = pricingBounds_;

            emit UpdatedTokenLevelPricingBoundaries(
                tokenAddress, 
                tokenId, 
                pricingBounds_.floorPrice, 
                pricingBounds_.ceilingPrice);
            
            unchecked {
                ++i;
            }
        }
    }

    /**
     * @notice Allows trusted channels to be added to a collection.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the specified address is not a trusted forwarder.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `channel` has been approved for trusted forwarding of trades on a collection.
     * @dev    2. A `TrustedChannelAddedForCollection` event has been emitted.
     *
     * @param  tokenAddress The collection.
     * @param  channel      The channel to add.
     */
    function addTrustedChannelForCollection(address tokenAddress, address channel) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if (!isTrustedForwarder(channel)) {
            revert PaymentProcessor__ChannelIsNotTrustedForwarder();
        }

        if (appStorage().collectionTrustedChannels[tokenAddress].add(channel)) {
            emit TrustedChannelAddedForCollection(tokenAddress, channel);
        }
    }

    /**
     * @notice Allows trusted channels to be removed from a collection.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `channel` has been dis-approved for trusted forwarding of trades on a collection.
     * @dev    2. A `TrustedChannelRemovedForCollection` event has been emitted.
     *
     * @param  tokenAddress The collection.
     * @param  channel      The channel to remove.
     */
    function removeTrustedChannelForCollection(address tokenAddress, address channel) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if (appStorage().collectionTrustedChannels[tokenAddress].remove(channel)) {
            emit TrustedChannelRemovedForCollection(tokenAddress, channel);
        }
    }

    /**
     * @notice Allows creator to ban accounts from a collection.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `account` has been banned from trading on a collection.
     * @dev    2. A `BannedAccountAddedForCollection` event has been emitted.
     *
     * @param  tokenAddress The collection.
     * @param  account      The account to add to the banned list.
     */
    function addBannedAccountForCollection(address tokenAddress, address account) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if (appStorage().collectionBannedAccounts[tokenAddress].add(account)) {
            emit BannedAccountAddedForCollection(tokenAddress, account);
        }
    }

    /**
     * @notice Allows creator to un-ban accounts from a collection.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `account` ban has been lifted for trades on a collection.
     * @dev    2. A `BannedAccountRemovedForCollection` event has been emitted.
     *
     * @param  tokenAddress The collection.
     * @param  account      The account to remove from the banned list.
     */
    function removeBannedAccountForCollection(address tokenAddress, address account) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if (appStorage().collectionBannedAccounts[tokenAddress].remove(account)) {
            emit BannedAccountRemovedForCollection(tokenAddress, account);
        }
    }

    function _generateCollectionPaymentSettingsFlags(
        address tokenAddress,
        address exclusiveBountyReceiver,
        bool blockTradesFromUntrustedChannels,
        bool blockBannedAccounts
    ) internal view returns (uint8 flags) {
        flags = _setFlag(0, FLAG_IS_ROYALTY_BOUNTY_EXCLUSIVE, exclusiveBountyReceiver != address(0));
        flags = _setFlag(flags, FLAG_BLOCK_TRADES_FROM_UNTRUSTED_CHANNELS, blockTradesFromUntrustedChannels);
        flags = _setFlag(flags, FLAG_BLOCK_BANNED_ACCOUNTS, blockBannedAccounts);
        flags = _setFlag(
            flags, 
            FLAG_OVERRIDE_PUSH_PAYMENT_GAS_LIMIT, 
            _isFlagSet(
                appStorage().collectionPaymentSettings[tokenAddress].flags, 
                FLAG_OVERRIDE_PUSH_PAYMENT_GAS_LIMIT)
            );
    }
}
