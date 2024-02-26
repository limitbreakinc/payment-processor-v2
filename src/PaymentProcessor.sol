// SPDX-License-Identifier: BSL-1.1
pragma solidity 0.8.19;

import "./Constants.sol";
import "./Errors.sol";
import "./interfaces/IPaymentProcessorConfiguration.sol";
import "./interfaces/IPaymentProcessorEvents.sol";
import "./interfaces/IModuleDefaultPaymentMethods.sol";
import "./storage/PaymentProcessorStorageAccess.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";

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

contract PaymentProcessor is EIP712, PaymentProcessorStorageAccess, IPaymentProcessorEvents {
    using EnumerableSet for EnumerableSet.AddressSet;

    /// @dev The Payment Settings module implements of all payment configuration-related functionality.
    address private immutable _modulePaymentSettings;

    /// @dev The On-Chain Cancellation module implements of all on-chain cancellation-related functionality.
    address private immutable _moduleOnChainCancellation;

    /// @dev The Trades module implements all trade-related functionality.
    address private immutable _moduleTrades;

    /// @dev The Trades module implements all advanced trade-related functionality.
    address private immutable _moduleTradesAdvanced;

    constructor(address configurationContract) EIP712("PaymentProcessor", "2") {
        (
            address defaultContractOwner_,
            PaymentProcessorModules memory paymentProcessorModules
        ) = IPaymentProcessorConfiguration(configurationContract).getPaymentProcessorDeploymentParams();
        
        
        if (defaultContractOwner_ == address(0) ||
            paymentProcessorModules.modulePaymentSettings == address(0) ||
            paymentProcessorModules.moduleOnChainCancellation == address(0) ||
            paymentProcessorModules.moduleTrades == address(0) ||
            paymentProcessorModules.moduleTradesAdvanced == address(0)) {
            revert PaymentProcessor__InvalidConstructorArguments();
        }

        _modulePaymentSettings = paymentProcessorModules.modulePaymentSettings;
        _moduleOnChainCancellation = paymentProcessorModules.moduleOnChainCancellation;
        _moduleTrades = paymentProcessorModules.moduleTrades;
        _moduleTradesAdvanced = paymentProcessorModules.moduleTradesAdvanced;

        unchecked {
            uint32 paymentMethodWhitelistId = appStorage().lastPaymentMethodWhitelistId++;
            appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId] = defaultContractOwner_;
            emit CreatedPaymentMethodWhitelist(paymentMethodWhitelistId, defaultContractOwner_, "Default Payment Methods");
        }
    }

    /**************************************************************/
    /*                         MODIFIERS                          */
    /**************************************************************/

    /**
     * @dev Function modifier that generates a delegatecall to `module` with `selector` as the calldata
     * @dev This delegatecall is for functions that do not have parameters. The only calldata added is
     * @dev the extra calldata from a trusted forwarder, when present.
     * 
     * @param module The contract address being called in the delegatecall.
     * @param selector The 4 byte function selector for the function to call in `module`.
     */
    modifier delegateCallNoData(address module, bytes4 selector) {
        assembly {
            // This protocol is designed to work both via direct calls and calls from a trusted forwarder that
            // preserves the original msg.sender by appending an extra 20 bytes to the calldata.  
            // The following code supports both cases.  The magic number of 68 is:
            // 4 bytes for the selector
            let ptr := mload(0x40)
            mstore(ptr, selector)
            mstore(0x40, add(ptr, calldatasize()))
            calldatacopy(add(ptr, 0x04), 0x04, sub(calldatasize(), 0x04))
            let result := delegatecall(gas(), module, ptr, add(sub(calldatasize(), 4), 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
        _;
    }

    /**
     * @dev Function modifier that generates a delegatecall to `module` with `selector` and `data` as the 
     * @dev calldata. This delegatecall is for functions that have parameters but **DO NOT** take domain
     * @dev separator as a parameter. Additional calldata from a trusted forwarder is appended to the end, when present.
     * 
     * @param module The contract address being called in the delegatecall.
     * @param selector The 4 byte function selector for the function to call in `module`.
     * @param data The calldata to send to the `module`.
     */
    modifier delegateCall(address module, bytes4 selector, bytes calldata data) {
        assembly {
            // This protocol is designed to work both via direct calls and calls from a trusted forwarder that
            // preserves the original msg.sender by appending an extra 20 bytes to the calldata.  
            // The following code supports both cases.  The magic number of 68 is:
            // 4 bytes for the selector
            // 32 bytes calldata offset to the data parameter
            // 32 bytes for the length of the data parameter
            let lengthWithAppendedCalldata := sub(calldatasize(), 68)

            let ptr := mload(0x40)
            mstore(ptr, selector)
            calldatacopy(add(ptr,0x04), data.offset, lengthWithAppendedCalldata)
            mstore(0x40, add(ptr,add(0x04, lengthWithAppendedCalldata)))

            let result := delegatecall(gas(), module, ptr, add(lengthWithAppendedCalldata, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }        
        _;
    }

    /**
     * @dev Function modifier that generates a delegatecall to `module` with `selector` and `data` as the 
     * @dev calldata. This delegatecall is for functions that have parameters **AND** take domain
     * @dev separator as the first parameter. Any domain separator that has been included in `data`
     * @dev will be replaced with the Payment Processor domain separator.  Additional calldata from a 
     * @dev trusted forwarder is appended to the end, when present.
     * 
     * @param module The contract address being called in the delegatecall.
     * @param selector The 4 byte function selector for the function to call in `module`.
     * @param data The calldata to send to the `module`.
     */
    modifier delegateCallReplaceDomainSeparator(address module, bytes4 selector, bytes calldata data) {
        bytes32 domainSeparator = _domainSeparatorV4();
        assembly {
            // This protocol is designed to work both via direct calls and calls from a trusted forwarder that
            // preserves the original msg.sender by appending an extra 20 bytes to the calldata.  
            // The following code supports both cases.  The magic number of 68 is:
            // 4 bytes for the selector
            // 32 bytes calldata offset to the data parameter
            // 32 bytes for the length of the data parameter
            let lengthWithAppendedCalldata := sub(calldatasize(), 68)

            let ptr := mload(0x40)
            mstore(ptr, selector)
            calldatacopy(add(ptr,0x04), data.offset, lengthWithAppendedCalldata)
            mstore(0x40, add(ptr,add(0x04, lengthWithAppendedCalldata)))
            mstore(add(ptr, 0x04), domainSeparator)
        
            let result := delegatecall(gas(), module, ptr, add(lengthWithAppendedCalldata, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
        _;
    }

    /**************************************************************/
    /*                    READ ONLY ACCESSORS                     */
    /**************************************************************/

    /**
     * @notice Returns the EIP-712 domain separator for this contract.
     */
    function getDomainSeparator() public view returns (bytes32) {
        return _domainSeparatorV4();
    }

    /**
     * @notice Returns the user-specific master nonce that allows order makers to efficiently cancel all listings or offers
     *         they made previously. The master nonce for a user only changes when they explicitly request to revoke all
     *         existing listings and offers.
     *
     * @dev    When prompting makers to sign a listing or offer, marketplaces must query the current master nonce of
     *         the user and include it in the listing/offer signature data.
     */
    function masterNonces(address account) public view returns (uint256) {
        return appStorage().masterNonces[account];
    }

    /**
     * @notice Returns true if the nonce for the given account has been used or cancelled. In comparison to a master nonce for
     *         a user, this nonce value is specific to a single order and may only be used or cancelled a single time.
     *
     * @dev    When prompting makers to sign a listing or offer, marketplaces must generate a unique nonce value that
     *         has not been previously used for filled, unfilled or cancelled orders. User nonces are unique to each
     *         user but common to that user across all marketplaces that utilize Payment Processor and do not reset
     *         when the master nonce is incremented. Nonces are stored in a BitMap for gas efficiency so it is recommended
     *         to utilize sequential numbers that do not overlap with other marketplaces.
     */
    function isNonceUsed(address account, uint256 nonce) public view returns (bool isUsed) {
        // The following code is equivalent to, but saves gas:
        //
        // uint256 slot = nonce / 256;
        // uint256 offset = nonce % 256;
        // uint256 slotValue = appStorage().invalidatedSignatures[account][slot];
        // isUsed = ((slotValue >> offset) & ONE) == ONE;

        isUsed = ((appStorage().invalidatedSignatures[account][uint248(nonce >> 8)] >> uint8(nonce)) & ONE) == ONE;
    }

    /**
     * @notice Returns the state and remaining fillable quantity of an order digest given the maker address.
     */
    function remainingFillableQuantity(
        address account, 
        bytes32 orderDigest
    ) external view returns (PartiallyFillableOrderStatus memory) {
        return appStorage().partiallyFillableOrderStatuses[account][orderDigest];
    }

    /**
     * @notice Returns the payment settings for a given collection.
     *
     * @notice paymentSettings: The payment setting type for a given collection 
     *         (DefaultPaymentMethodWhitelist|AllowAnyPaymentMethod|CustomPaymentMethodWhitelist|PricingConstraints)
     * @notice paymentMethodWhitelistId: The payment method whitelist id for a given collection.  
     *         Applicable only when paymentSettings is CustomPaymentMethodWhitelist
     * @notice constrainedPricingPaymentMethod: The payment method that min/max priced collections are priced in.
     *         Applicable only when paymentSettings is PricingConstraints.
     * @notice royaltyBackfillNumerator: The royalty backfill percentage for a given collection.  Used only as a
     *         fallback when a collection does not implement EIP-2981.
     * @notice royaltyBountyNumerator: The royalty bounty percentage for a given collection.  When set, this percentage
     *         is applied to the creator's royalty amount and paid to the maker marketplace as a bounty.
     * @notice isRoyaltyBountyExclusive: When true, only the designated marketplace is eligible for royalty bounty.
     * @notice blockTradesFromUntrustedChannels: When true, only transactions from channels that the collection 
     *         authorizes will be allowed to execute.
     */
    function collectionPaymentSettings(address tokenAddress) external view returns (CollectionPaymentSettings memory) {
        return appStorage().collectionPaymentSettings[tokenAddress];
    }

    /**
     * @notice Returns the optional creator-defined royalty bounty settings for a given collection.
     * 
     * @return royaltyBountyNumerator  The royalty bounty percentage for a given collection.  When set, this percentage
     *         is applied to the creator's royalty amount and paid to the maker marketplace as a bounty.
     * @return exclusiveBountyReceiver When non-zero, only the designated marketplace is eligible for royalty bounty.
     */
    function collectionBountySettings(
        address tokenAddress
    ) external view returns (uint16 royaltyBountyNumerator, address exclusiveBountyReceiver) {
        CollectionPaymentSettings memory collectionPaymentSettings = 
            appStorage().collectionPaymentSettings[tokenAddress];

        return (
            collectionPaymentSettings.royaltyBountyNumerator, 
            collectionPaymentSettings.isRoyaltyBountyExclusive ? 
                appStorage().collectionExclusiveBountyReceivers[tokenAddress] : 
                address(0));
    }

    /**
     * @notice Returns the optional creator-defined royalty backfill settings for a given collection.
     *         This is useful for legacy collection lacking EIP-2981 support, as the collection owner can instruct
     *         PaymentProcessor to backfill missing on-chain royalties.
     * 
     * @return royaltyBackfillNumerator  The creator royalty percentage for a given collection.  
     *         When set, this percentage is applied to the item sale price and paid to the creator if the attempt
     *         to query EIP-2981 royalties fails.
     * @return royaltyBackfillReceiver When non-zero, this is the destination address for backfilled creator royalties.
     */
    function collectionRoyaltyBackfillSettings(
        address tokenAddress
    ) external view returns (uint16 royaltyBackfillNumerator, address royaltyBackfillReceiver) {
        CollectionPaymentSettings memory collectionPaymentSettings = 
            appStorage().collectionPaymentSettings[tokenAddress];

        return (
            collectionPaymentSettings.royaltyBackfillNumerator, 
            collectionPaymentSettings.royaltyBackfillNumerator > 0 ?
                appStorage().collectionRoyaltyBackfillReceivers[tokenAddress] : 
                address(0));
    }

    /**
     * @notice Returns the address of the account that owns the specified payment method whitelist id.
     */
    function paymentMethodWhitelistOwners(uint32 paymentMethodWhitelistId) external view returns (address) {
        return appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId];
    }

    /**
     * @notice Returns true if the specified payment method is whitelisted for the specified payment method whitelist.
     */
    function isPaymentMethodWhitelisted(uint32 paymentMethodWhitelistId, address paymentMethod) external view returns (bool) {
        return appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId].contains(paymentMethod);
    }

    /**
     * @notice Returns the pricing bounds floor price for a given collection and token id, when applicable.
     *
     * @dev    The pricing bounds floor price is only enforced when the collection payment settings are set to
     *         the PricingContraints type.
     */
    function getFloorPrice(address tokenAddress, uint256 tokenId) external view returns (uint256) {
        PricingBounds memory tokenLevelPricingBounds = appStorage().tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return tokenLevelPricingBounds.floorPrice;
        } else {
            PricingBounds memory collectionLevelPricingBounds = appStorage().collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return collectionLevelPricingBounds.floorPrice;
            }
        }

        return 0;
    }

    /**
     * @notice Returns the pricing bounds ceiling price for a given collection and token id, when applicable.
     *
     * @dev    The pricing bounds ceiling price is only enforced when the collection payment settings are set to
     *         the PricingConstraints type.
     */
    function getCeilingPrice(address tokenAddress, uint256 tokenId) external view returns (uint256) {
        PricingBounds memory tokenLevelPricingBounds = appStorage().tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return tokenLevelPricingBounds.ceilingPrice;
        } else {
            PricingBounds memory collectionLevelPricingBounds = appStorage().collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return collectionLevelPricingBounds.ceilingPrice;
            }
        }

        return type(uint256).max;
    }

    /**
     * @notice Returns the last created payment method whitelist id.
     */
    function lastPaymentMethodWhitelistId() external view returns (uint32) {
        return appStorage().lastPaymentMethodWhitelistId;
    }

    /**
     * @notice Returns the set of payment methods for a given payment method whitelist.
     */
    function getWhitelistedPaymentMethods(uint32 paymentMethodWhitelistId) external view returns (address[] memory) {
        return appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId].values();
    }

    /**
     * @notice Returns the set of trusted channels for a given collection.
     */
    function getTrustedChannels(address tokenAddress) external view returns (address[] memory) {
        return appStorage().collectionTrustedChannels[tokenAddress].values();
    }

    /**
     * @notice Returns the set of banned accounts for a given collection.
     */
    function getBannedAccounts(address tokenAddress) external view returns (address[] memory) {
        return appStorage().collectionBannedAccounts[tokenAddress].values();
    }

    /**************************************************************/
    /*           PAYMENT SETTINGS MANAGEMENT OPERATIONS           */
    /**************************************************************/

    /**
     * @notice Returns true if the specified payment method is on the deploy-time default payment method whitelist
     *         or post-deploy default payment method whitelist (id 0).
     */
    function isDefaultPaymentMethod(address paymentMethod) external view returns (bool) {
        address[] memory defaultPaymentMethods = 
            IModuleDefaultPaymentMethods(_modulePaymentSettings).getDefaultPaymentMethods();

        for (uint256 i = 0; i < defaultPaymentMethods.length;) {
            if (paymentMethod == defaultPaymentMethods[i]) {
                return true;
            }

            unchecked {
                ++i;
            }
        }

        return appStorage().collectionPaymentMethodWhitelists[DEFAULT_PAYMENT_METHOD_WHITELIST_ID].contains(paymentMethod);
    }

    /**
     * @notice Returns an array of the immutable default payment methods specified at deploy time.  
     *         However, if any post-deployment default payment methods have been added, they are
     *         not returned here because using an enumerable payment method whitelist would make trades
     *         less gas efficient.  For post-deployment default payment methods, exchanges should index
     *         the `PaymentMethodAddedToWhitelist` and `PaymentMethodRemovedFromWhitelist` events.
     */
    function getDefaultPaymentMethods() external view returns (address[] memory) {
        return IModuleDefaultPaymentMethods(_modulePaymentSettings).getDefaultPaymentMethods();
    }

    /**
     * @notice Allows any user to create a new custom payment method whitelist.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The payment method whitelist id tracker has been incremented by `1`.
     * @dev    2. The caller has been assigned as the owner of the payment method whitelist.
     * @dev    3. A `CreatedPaymentMethodWhitelist` event has been emitted.
     *
     * @param  data  Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *               `createPaymentMethodWhitelist(string calldata whitelistName)`
     * @return paymentMethodWhitelistId  The id of the newly created payment method whitelist.
     */
    function createPaymentMethodWhitelist(bytes calldata data) external returns (uint32 paymentMethodWhitelistId) {
        address module = _modulePaymentSettings;
        assembly {
            // This protocol is designed to work both via direct calls and calls from a trusted forwarder that
            // preserves the original msg.sender by appending an extra 20 bytes to the calldata.  
            // The following code supports both cases.  The magic number of 68 is:
            // 4 bytes for the selector
            // 32 bytes calldata offset to the data parameter
            // 32 bytes for the length of the data parameter
            let lengthWithAppendedCalldata := sub(calldatasize(), 68)

            let ptr := mload(0x40)
            mstore(ptr, hex"f83116c9")
            calldatacopy(add(ptr, 0x04), data.offset, lengthWithAppendedCalldata)
            mstore(0x40, add(ptr, add(0x04, lengthWithAppendedCalldata)))

            let result := delegatecall(gas(), module, ptr, add(lengthWithAppendedCalldata, 4), 0x00, 0x20)

            switch result case 0 {
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            } default {
                return (0x00, 0x20)
            }
        }
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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `reassignOwnershipOfPaymentMethodWhitelist(uint32 id, address newOwner)`
     */
    function reassignOwnershipOfPaymentMethodWhitelist(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_REASSIGN_OWNERSHIP_OF_PAYMENT_METHOD_WHITELIST, data) {}

    /**
     * @notice Renounce the ownership of a payment method whitelist, rendering the list immutable.
     *
     * @dev Throws when the caller does not own the specified list.
     *
     * @dev <h4>Postconditions:</h4>
     *      1. The ownership of the specified payment method whitelist is renounced.
     *      2. A `ReassignedPaymentMethodWhitelistOwnership` event is emitted.
     *
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `renounceOwnershipOfPaymentMethodWhitelist(uint32 id)`
     */
    function renounceOwnershipOfPaymentMethodWhitelist(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_RENOUNCE_OWNERSHIP_OF_PAYMENT_METHOD_WHITELIST, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `whitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod)`
     */
    function whitelistPaymentMethod(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_WHITELIST_PAYMENT_METHOD, data) {}

    /**
     * @notice Allows custom payment method whitelist owners to remove a coin from the list of approved payment currencies.
     *
     * @dev    Throws when caller is not the owner of the specified payment method whitelist.
     * @dev    Throws when the specified coin is not currently whitelisted under the specified whitelist id.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `paymentMethod` has been removed from the `paymentMethodWhitelist` mapping.
     * @dev    2. A `PaymentMethodRemovedFromWhitelist` event has been emitted.
     *
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `unwhitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod)`
     */
    function unwhitelistPaymentMethod(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_UNWHITELIST_PAYMENT_METHOD, data) {}

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
     * @dev    9. An `UpdatedCollectionPaymentSettings` event has been emitted.
     *
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `setCollectionPaymentSettings(
                        address tokenAddress, 
                        PaymentSettings paymentSettings,
                        uint32 paymentMethodWhitelistId,
                        address constrainedPricingPaymentMethod,
                        uint16 royaltyBackfillNumerator,
                        address royaltyBackfillReceiver,
                        uint16 royaltyBountyNumerator,
                        address exclusiveBountyReceiver,
                        bool blockTradesFromUntrustedChannels)`
     */
    function setCollectionPaymentSettings(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_SET_COLLECTION_PAYMENT_SETTINGS, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `setCollectionPricingBounds(address tokenAddress, PricingBounds calldata pricingBounds)`
     */
    function setCollectionPricingBounds(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_SET_COLLECTION_PRICING_BOUNDS, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `setTokenPricingBounds(
                        address tokenAddress, 
                        uint256[] calldata tokenIds, 
                        PricingBounds[] calldata pricingBounds)`
     */
    function setTokenPricingBounds(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_SET_TOKEN_PRICING_BOUNDS, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `addTrustedChannelForCollection(
     *                  address tokenAddress, 
     *                  address channel)`
     */
    function addTrustedChannelForCollection(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_ADD_TRUSTED_CHANNEL_FOR_COLLECTION, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `removeTrustedChannelForCollection(
     *                  address tokenAddress, 
     *                  address channel)`
     */
    function removeTrustedChannelForCollection(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_REMOVE_TRUSTED_CHANNEL_FOR_COLLECTION, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `addBannedAccountForCollection(
     *                  address tokenAddress, 
     *                  address account)`
     */
    function addBannedAccountForCollection(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_ADD_BANNED_ACCOUNT_FOR_COLLECTION, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `removeBannedAccountForCollection(
     *                  address tokenAddress, 
     *                  address account)`
     */
    function removeBannedAccountForCollection(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_REMOVE_BANNED_ACCOUNT_FOR_COLLECTION, data) {}

    /**************************************************************/
    /*              ON-CHAIN CANCELLATION OPERATIONS              */
    /**************************************************************/

    /**
     * @notice Allows a cosigner to destroy itself, never to be used again.  This is a fail-safe in case of a failure
     *         to secure the co-signer private key in a Web2 co-signing service.  In case of suspected cosigner key
     *         compromise, or when a co-signer key is rotated, the cosigner MUST destroy itself to prevent past listings 
     *         that were cancelled off-chain from being used by a malicious actor.
     *
     * @dev    Throws when the cosigner did not sign an authorization to self-destruct.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The cosigner can never be used to co-sign orders again.
     * @dev    2. A `DestroyedCosigner` event has been emitted.
     *
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `destroyCosigner(address cosigner, SignatureECDSA signature)`
     */
    function destroyCosigner(bytes calldata data) external
    delegateCall(_moduleOnChainCancellation, SELECTOR_DESTROY_COSIGNER, data) {}

    /**
     * @notice Allows a maker to revoke/cancel all prior signatures of their listings and offers.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The maker's master nonce has been incremented by `1` in contract storage, rendering all signed
     *            approvals using the prior nonce unusable.
     * @dev    2. A `MasterNonceInvalidated` event has been emitted.
     */
    function revokeMasterNonce() external 
    delegateCallNoData(_moduleOnChainCancellation, SELECTOR_REVOKE_MASTER_NONCE) {}

    /**
     * @notice Allows a maker to revoke/cancel a single, previously signed listing or offer by specifying the
     *         nonce of the listing or offer.
     *
     * @dev    Throws when the maker has already revoked the nonce.
     * @dev    Throws when the nonce was already used by the maker to successfully buy or sell an NFT.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The specified `nonce` for the `_msgSender()` has been revoked and can
     *            no longer be used to execute a sale or purchase.
     * @dev    2. A `NonceInvalidated` event has been emitted.
     *
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `revokeSingleNonce(uint256 nonce)`
     */
    function revokeSingleNonce(bytes calldata data) external 
    delegateCall(_moduleOnChainCancellation, SELECTOR_REVOKE_SINGLE_NONCE, data) {}

    /**
     * @notice Allows a maker to revoke/cancel a partially fillable order by specifying the order digest hash.
     *
     * @dev    Throws when the maker has already revoked the order digest.
     * @dev    Throws when the order digest was already used by the maker and has been fully filled.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The specified `orderDigest` for the `_msgSender()` has been revoked and can
     *            no longer be used to execute a sale or purchase.
     * @dev    2. An `OrderDigestInvalidated` event has been emitted.
     *
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `revokeOrderDigest(bytes32 orderDigest)`
     */
    function revokeOrderDigest(bytes calldata data) external 
    delegateCall(_moduleOnChainCancellation, SELECTOR_REVOKE_ORDER_DIGEST, data) {}

    /**************************************************************/
    /*                      TAKER OPERATIONS                      */
    /**************************************************************/

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `function buyListing(
     *                  bytes32 domainSeparator, 
     *                  Order memory saleDetails, 
     *                  SignatureECDSA memory sellerSignature,
     *                  Cosignature memory cosignature,
     *                  FeeOnTop memory feeOnTop)`
     */
    function buyListing(bytes calldata data) external payable 
    delegateCallReplaceDomainSeparator(_moduleTrades, SELECTOR_BUY_LISTING, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `function acceptOffer(
     *                  bytes32 domainSeparator, 
     *                  bool isCollectionLevelOffer, 
     *                  Order memory saleDetails, 
     *                  SignatureECDSA memory buyerSignature,
     *                  TokenSetProof memory tokenSetProof,
     *                  Cosignature memory cosignature,
     *                  FeeOnTop memory feeOnTop)`
     */
    function acceptOffer(bytes calldata data) external payable 
    delegateCallReplaceDomainSeparator(_moduleTrades, SELECTOR_ACCEPT_OFFER, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `function bulkBuyListings(
     *                  bytes32 domainSeparator, 
     *                  Order[] calldata saleDetailsArray,
     *                  SignatureECDSA[] calldata sellerSignatures,
     *                  Cosignature[] calldata cosignatures,
     *                  FeeOnTop[] calldata feesOnTop)`
     */
    function bulkBuyListings(bytes calldata data) external payable 
    delegateCallReplaceDomainSeparator(_moduleTrades, SELECTOR_BULK_BUY_LISTINGS, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `function bulkAcceptOffers(
     *                  bytes32 domainSeparator, 
     *                  BulkAcceptOffersParams memory params)`
     */
    function bulkAcceptOffers(bytes calldata data) external payable 
    delegateCallReplaceDomainSeparator(_moduleTrades, SELECTOR_BULK_ACCEPT_OFFERS, data) {}

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
     * @param  data Calldata encoded with PaymentProcessorEncoder.  Matches calldata for:
     *              `function sweepCollection(
     *                  bytes32 domainSeparator, 
     *                  FeeOnTop memory feeOnTop,
     *                  SweepOrder memory sweepOrder,
     *                  SweepItem[] calldata items,
     *                  SignatureECDSA[] calldata signedSellOrders,
     *                  Cosignature[] memory cosignatures)`
     */
    function sweepCollection(bytes calldata data) external payable 
    delegateCallReplaceDomainSeparator(_moduleTradesAdvanced, SELECTOR_SWEEP_COLLECTION, data) {}
}