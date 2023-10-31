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

import "./Constants.sol";
import "./interfaces/CPortEvents.sol";
import "./storage/CPortStorageAccess.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";


/**
 * @title  cPort
 * @author Limit Break, Inc.
 * @notice Short for Creator Port, cPort is the world's first creator-centric ERC721-C compatible marketplace protocol.
 *         Built by creators, for creators.
 * @notice Use ERC721-C to whitelist this contract or other marketplace contracts that process royalties entirely 
 *         on-chain manner to make them 100% enforceable and fully programmable! 
 *
 * @notice <h4>Features</h4>
 *
 * @notice <ul>
 *            <li>Payment Standards</li>
 *            <ul>
 *             <li>Native Currency (ETH or Equivalent)</li>
 *             <li>ERC-20</li>
 *            </ul>
 *            <li>Tradeable Item Support</li>
 *            <ul>
 *             <li>ERC721 (Non-Fungible Tokens)</li>
 *             <ul>
 *               <li>ERC721-C</li>
 *               <li>ERC721 + EIP-2981</li>
 *               <li>ERC721</li>
 *             </ul>
 *             <li>ERC1155 (Fungible Tokens)</li>
 *             <ul>
 *               <li>ERC1155-C</li>
 *               <li>ERC1155 + EIP-2981</li>
 *               <li>ERC1155</li>
 *             </ul>
 *            </ul>
 *           <li>Enforceable/Programmable Fees</li>
 *           <ul>
 *             <li>On-Chain Royalties</li>
 *             <ul>
 *               <li>EIP-2981</li>
 *               <li>Missing Royalty Backfill Per Collection</li>
 *             </ul>
 *             <li>Marketplace Fees</li>
 *             <ul>
 *               <li>Maker Fee</li>
 *               <li>Taker Fee (Fee On Top)</li>
 *               <li>Optional Creator Royalty Bounty for Maker MP</li>
 *             </ul>
 *           </ul>
 *           <li>Creator-Defined Payment Settings for Collections</li>
 *           <ul>
 *             <li>Default Payment Method Whitelist</li>
 *             <li>Allow Any Payment Method</li>
 *             <li>Custom Payment Method Whitelist</li>
 *             <li>Pricing Constraints (Min/Max Pricing)</li>
 *           </ul>
 *           <li>Order Cancellation</li>
 *           <ul>
 *             <li>On-Chain</li>
 *             <li>Gasless Cancellation Oracles (Co-Signing)</li>
 *           </ul>
 *           <li>A Multitude of Supported Trade Types</li>
 *           <ul>
 *             <li>Buy Listing</li>
 *             <li>Bulk Buy Listings</li>
 *             <li>Sweep Collection</li>
 *             <li>Accept Offer</li>
 *             <li>Bulk Accept Offers</li>
 *             <li>Offer Types</li>
 *             <ul>
 *               <li>Item</li>
 *               <li>Collection</li>
 *               <li>Token Set</li>
 *             </ul>
 *           </ul>
 *         </ul>
 *
 * @notice <h4>Security Considerations for Users</h4>
 *
 * @notice Virtually all on-chain marketplace contracts have the potential to be front-run.
 *         When purchasing high-value items, whether individually or in a batch/bundle it is highly
 *         recommended to execute transactions using Flashbots RPC Relay/private mempool to avoid
 *         sniper bots.  Partial fills are available for bulk and sweep trades when the method of payment is an 
 *         ERC-20 token, but not for purchases using native currency.  It is preferable to use wrapped ETH 
 *         (or equivalent) when buying multiple tokens and it is highly advisable to use a private mempool
 *         like Flashbots whenever possible.
 */
contract cPort is EIP712, Ownable, Pausable, cPortStorageAccess, cPortEvents {

    /// @dev The Payment Settings module implements of all payment configuration-related functionality.
    address private immutable _modulePaymentSettings;

    /// @dev The On-Chain Cancellation module implements of all on-chain cancellation-related functionality.
    address private immutable _moduleOnChainCancellation;

    /// @dev The Trades module implements all trade-related functionality.
    address private immutable _moduleTrades;

    constructor(
        address defaultContractOwner_,
        address modulePaymentSettings_,
        address moduleOnChainCancellation_,
        address moduleTrades_) 
        EIP712("cPort", "1") {
        _modulePaymentSettings = modulePaymentSettings_;
        _moduleOnChainCancellation = moduleOnChainCancellation_;
        _moduleTrades = moduleTrades_;

        _transferOwnership(defaultContractOwner_);
    }

    /**************************************************************/
    /*                         MODIFIERS                          */
    /**************************************************************/

    modifier delegateCallNoData(address module, bytes4 selector) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, selector)
            let result := delegatecall(gas(), module, ptr, 4, 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
        _;
    }

    modifier delegateCall(address module, bytes4 selector, bytes calldata data) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, selector)
            calldatacopy(add(ptr,0x04), data.offset, data.length)
            mstore(0x40, add(ptr,add(0x04, data.length)))

            let result := delegatecall(gas(), module, ptr, add(data.length, 4), 0, 0)
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
    /*                  CONTRACT OWNER FUNCTIONS                  */
    /**************************************************************/

    /**
     * @notice Allows cPort contract owner to pause trading on this contract.  This is only to be used
     *         in case a future vulnerability emerges to allow a migration to an updated contract.
     *
     * @dev    Throws when caller is not the contract owner.
     * @dev    Throws when contract is already paused.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The contract has been placed in the `paused` state.
     * @dev    2. Trading is frozen.
     */
    function pause() external onlyOwner {
        _pause();
    }

    /**
     * @notice Allows cPort contract owner to resume trading on this contract.  This is only to be used
     *         in case a pause was not necessary and trading can safely resume.
     *
     * @dev    Throws when caller is not the contract owner.
     * @dev    Throws when contract is not currently paused.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The contract has been placed in the `unpaused` state.
     * @dev    2. Trading is resumed.
     */
    function unpause() external onlyOwner {
        _unpause();
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
     *         cPort to backfill missing on-chain royalties.
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
        return appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId][paymentMethod];
    }

    /**
     * @notice Returns the floor price for a given collection and token id, when applicable.
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
     * @notice Returns the ceiling price for a given collection and token id, when applicable.
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

    /**************************************************************/
    /*           PAYMENT SETTINGS MANAGEMENT OPERATIONS           */
    /**************************************************************/

    /**
     * @notice Allows any user to create a new custom payment method whitelist.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The payment method whitelist id tracker has been incremented by `1`.
     * @dev    2. The caller has been assigned as the owner of the payment method whitelist.
     * @dev    3. A `CreatedPaymentMethodWhitelist` event has been emitted.
     *
     * @param  data  Calldata encoded with cPortEncoder.  Matches calldata for:
     *               `createPaymentMethodWhitelist(string calldata whitelistName)`
     * @return paymentMethodWhitelistId  The id of the newly created payment method whitelist.
     */
    function createPaymentMethodWhitelist(bytes calldata data) external returns (uint32 paymentMethodWhitelistId) {
        address module = _modulePaymentSettings;
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, hex"f83116c9")
            calldatacopy(add(ptr, 0x04), data.offset, data.length)
            mstore(0x40, add(ptr, add(0x04, data.length)))

            let result := delegatecall(gas(), module, ptr, add(data.length, 4), 0x00, 0x20)

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
     * @notice Allows custom payment method whitelist owners to approve a new coin for use as a payment currency.
     *
     * @dev    Throws when caller is not the owner of the specified payment method whitelist.
     * @dev    Throws when the specified coin is already whitelisted under the specified whitelist id.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `paymentMethod` has been approved in `paymentMethodWhitelist` mapping.
     * @dev    2. A `PaymentMethodAddedToWhitelist` event has been emitted.
     *
     * @param  data Calldata encoded with cPortEncoder.  Matches calldata for:
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
     * @param  data Calldata encoded with cPortEncoder.  Matches calldata for:
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
     * @dev    8. An `UpdatedCollectionPaymentSettings` event has been emitted.
     *
     * @param  data Calldata encoded with cPortEncoder.  Matches calldata for:
     *              `setCollectionPaymentSettings(
                        address tokenAddress, 
                        PaymentSettings paymentSettings,
                        uint32 paymentMethodWhitelistId,
                        address constrainedPricingPaymentMethod,
                        uint16 royaltyBackfillNumerator,
                        address royaltyBackfillReceiver,
                        uint16 royaltyBountyNumerator,
                        address exclusiveBountyReceiver)`
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
     * @param  data Calldata encoded with cPortEncoder.  Matches calldata for:
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
     * @param  data Calldata encoded with cPortEncoder.  Matches calldata for:
     *              `setTokenPricingBounds(
                        address tokenAddress, 
                        uint256[] calldata tokenIds, 
                        PricingBounds[] calldata pricingBounds)`
     */
    function setTokenPricingBounds(bytes calldata data) external 
    delegateCall(_modulePaymentSettings, SELECTOR_SET_TOKEN_PRICING_BOUNDS, data) {}

    /**************************************************************/
    /*              ON-CHAIN CANCELLATION OPERATIONS              */
    /**************************************************************/

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
     * @dev    1. The specified `nonce` for the `msg.sender` has been revoked and can
     *            no longer be used to execute a sale or purchase.
     * @dev    2. A `NonceInvalidated` event has been emitted.
     *
     * @param  data Calldata encoded with cPortEncoder.  Matches calldata for:
     *              `revokeSingleNonce(uint256 nonce)`
     */
    function revokeSingleNonce(bytes calldata data) external 
    delegateCall(_moduleOnChainCancellation, SELECTOR_REVOKE_SINGLE_NONCE, data) {}

    function revokeOrderDigest(bytes calldata data) external 
    delegateCall(_moduleOnChainCancellation, SELECTOR_REVOKE_ORDER_DIGEST, data) {}

    /**************************************************************/
    /*                      TAKER OPERATIONS                      */
    /**************************************************************/

    function buyListing(bytes calldata data) external payable 
    whenNotPaused 
    delegateCall(_moduleTrades, SELECTOR_BUY_LISTING, data) {}

    function acceptOffer(bytes calldata data) external payable 
    whenNotPaused 
    delegateCall(_moduleTrades, SELECTOR_ACCEPT_OFFER, data) {}

    function bulkBuyListings(bytes calldata data) external payable 
    whenNotPaused 
    delegateCall(_moduleTrades, SELECTOR_BULK_BUY_LISTINGS, data) {}

    function bulkAcceptOffers(bytes calldata data) external payable 
    whenNotPaused 
    delegateCall(_moduleTrades, SELECTOR_BULK_ACCEPT_OFFERS, data) {}

    function sweepCollection(bytes calldata data) external payable 
    whenNotPaused 
    delegateCall(_moduleTrades, SELECTOR_SWEEP_COLLECTION, data) {}
}
