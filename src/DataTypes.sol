// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

/**
 * @dev Used internally to indicate which side of the order the taker is on.
 */
enum Sides { 
    // 0: Taker is on buy side of order.
    Buy, 

    // 1: Taker is on sell side of order.
    Sell 
}

/**
 * @dev Defines condition to apply to order execution.
 */
enum OrderProtocols { 
    // 0: ERC721 order that must execute in full or not at all.
    ERC721_FILL_OR_KILL,

    // 1: ERC1155 order that must execute in full or not at all.
    ERC1155_FILL_OR_KILL,

    // 2: ERC1155 order that may be partially executed.
    ERC1155_FILL_PARTIAL
}

/**
 * @dev Defines the rules applied to a collection for payments.
 */
enum PaymentSettings { 
    // 0: Utilize Payment Processor default whitelist.
    DefaultPaymentMethodWhitelist,

    // 1: Allow any payment method.
    AllowAnyPaymentMethod,

    // 2: Use a custom payment method whitelist.
    CustomPaymentMethodWhitelist,

    // 3: Single payment method with floor and ceiling limits.
    PricingConstraints,

    // 4: Pauses trading for the collection.
    Paused
}

/**
 * @dev This struct is used internally for the deployment of the Payment Processor contract and 
 * @dev module deployments to define the default payment method whitelist.
 */
struct DefaultPaymentMethods {
    address defaultPaymentMethod1;
    address defaultPaymentMethod2;
    address defaultPaymentMethod3;
    address defaultPaymentMethod4;
}

/**
 * @dev This struct is used internally for the deployment of the Payment Processor contract to define the
 * @dev module addresses to be used for the contract.
 */
struct PaymentProcessorModules {
    address modulePaymentSettings;
    address moduleOnChainCancellation;
    address moduleTrades;
    address moduleTradesAdvanced;
}

/**
 * @dev This struct defines the payment settings parameters for a collection.
 *
 * @dev **paymentSettings**: The general rule definition for payment methods allowed.
 * @dev **paymentMethodWhitelistId**: The list id to be used when paymentSettings is set to CustomPaymentMethodWhitelist.
 * @dev **constraintedPricingPaymentMethod**: The payment method to be used when paymentSettings is set to PricingConstraints.
 * @dev **royaltyBackfillNumerator**: The royalty fee to apply to the collection when ERC2981 is not supported.
 * @dev **royaltyBountyNumerator**: The percentage of royalties the creator will grant to a marketplace for order fulfillment.
 * @dev **isRoyaltyBountyExclusive**: If true, royalty bounties will only be paid if the order marketplace is the set exclusive marketplace.
 * @dev **blockTradesFromUntrustedChannels**: If true, trades that originate from untrusted channels will not be executed.
 * @dev **blockBannedAccounts**: If true, banned accounts can be neither maker or taker for trades on a per-collection basis.
 */
struct CollectionPaymentSettings {
    PaymentSettings paymentSettings;
    uint32 paymentMethodWhitelistId;
    address constrainedPricingPaymentMethod;
    uint16 royaltyBackfillNumerator;
    uint16 royaltyBountyNumerator;
    bool isRoyaltyBountyExclusive;
    bool blockTradesFromUntrustedChannels;
    bool blockBannedAccounts;
}

/**
 * @dev The `v`, `r`, and `s` components of an ECDSA signature.  For more information
 *      [refer to this article](https://medium.com/mycrypto/the-magic-of-digital-signatures-on-ethereum-98fe184dc9c7).
 */
struct SignatureECDSA {
    uint8 v;
    bytes32 r;
    bytes32 s;
}

/**
 * @dev This struct defines order execution parameters.
 * 
 * @dev **protocol**: The order protocol to apply to the order.
 * @dev **maker**: The user that created and signed the order to be executed by a taker.
 * @dev **beneficiary**: The account that will receive the tokens.
 * @dev **marketplace**: The fee receiver of the marketplace that the order was created on.
 * @dev **fallbackRoyaltyRecipient**: The address that will receive royalties if ERC2981 
 * @dev is not supported by the collection and the creator has not defined backfilled royalties with Payment Processor.
 * @dev **paymentMethod**: The payment method for the order.
 * @dev **tokenAddress**: The address of the token collection the order is for.
 * @dev **tokenId**: The token id that the order is for.
 * @dev **amount**: The quantity of token the order is for.
 * @dev **itemPrice**: The price for the order in base units for the payment method.
 * @dev **nonce**: The maker's nonce for the order.
 * @dev **expiration**: The time, in seconds since the Unix epoch, that the order will expire.
 * @dev **marketplaceFeeNumerator**: The percentage fee that will be sent to the marketplace.
 * @dev **maxRoyaltyFeeNumerator**: The maximum royalty the maker is willing to accept. This will be used
 * @dev as the royalty amount when ERC2981 is not supported by the collection.
 * @dev **requestedFillAmount**: The amount of tokens for an ERC1155 partial fill order that the taker wants to fill.
 * @dev **minimumFillAmount**: The minimum amount of tokens for an ERC1155 partial fill order that the taker will accept.
 */
struct Order {
    OrderProtocols protocol;
    address maker;
    address beneficiary;
    address marketplace;
    address fallbackRoyaltyRecipient;
    address paymentMethod;
    address tokenAddress;
    uint256 tokenId;
    uint248 amount;
    uint256 itemPrice;
    uint256 nonce;
    uint256 expiration;
    uint256 marketplaceFeeNumerator;
    uint256 maxRoyaltyFeeNumerator;
    uint248 requestedFillAmount;
    uint248 minimumFillAmount;
}

/**
 * @dev This struct defines the cosignature for verifying an order that is a cosigned order.
 *
 * @dev **signer**: The address that signed the cosigned order. This must match the cosigner that is part of the order signature.
 * @dev **taker**: The address of the order taker.
 * @dev **expiration**: The time, in seconds since the Unix epoch, that the cosignature will expire.
 * @dev The `v`, `r`, and `s` components of an ECDSA signature.  For more information
 *      [refer to this article](https://medium.com/mycrypto/the-magic-of-digital-signatures-on-ethereum-98fe184dc9c7).
 */
struct Cosignature {
    address signer;
    address taker;
    uint256 expiration;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

/**
 * @dev This struct defines an additional fee on top of an order, paid by taker.
 *
 * @dev **recipient**: The recipient of the additional fee.
 * @dev **amount**: The amount of the additional fee, in base units of the payment token.
 */
struct FeeOnTop {
    address recipient;
    uint256 amount;
}

/**
 * @dev This struct defines the root hash and proof data for accepting an offer that is for a subset
 * @dev of items in a collection. The root hash must match the root hash specified as part of the 
 * @dev maker's order signature.
 * 
 * @dev **rootHash**: The merkletree root hash for the items that may be used to fulfill the offer order.
 * @dev **proof**: The merkle proofs for the item being supplied to fulfill the offer order.
 */
struct TokenSetProof {
    bytes32 rootHash;
    bytes32[] proof;
}

/**
 * @dev Current state of a partially fillable order.
 */
enum PartiallyFillableOrderState { 
    // 0: Order is open and may continue to be filled.
    Open, 

    // 1: Order has been completely filled.
    Filled, 

    // 2: Order has been cancelled.
    Cancelled
}

/**
 * @dev This struct defines the current status of a partially fillable order.
 * 
 * @dev **state**: The current state of the order as defined by the PartiallyFillableOrderState enum.
 * @dev **remainingFillableQuantity**: The remaining quantity that may be filled for the order.
 */
struct PartiallyFillableOrderStatus {
    PartiallyFillableOrderState state;
    uint248 remainingFillableQuantity;
}

/**
 * @dev This struct defines the royalty backfill and bounty information. Its data for an
 * @dev order execution is constructed internally based on the collection settings and
 * @dev order execution details.
 * 
 * @dev **backfillNumerator**: The percentage of the order amount to pay as royalties
 * @dev for a collection that does not support ERC2981.
 * @dev **backfillReceiver**: The recipient of backfill royalties.
 * @dev **bountyNumerator**: The percentage of royalties to share with the marketplace for order fulfillment.
 * @dev **exclusiveMarketplace**: If non-zero, the address of the exclusive marketplace for royalty bounties.
 */
struct RoyaltyBackfillAndBounty {
    uint16 backfillNumerator;
    address backfillReceiver;
    uint16 bountyNumerator;
    address exclusiveMarketplace;
}

/**
 * @dev This struct defines order information that is common to all items in a sweep order.
 * 
 * @dev **protocol**: The order protocol to apply to the order.
 * @dev **tokenAddress**: The address of the token collection the order is for.
 * @dev **paymentMethod**: The payment method for the order.
 * @dev **beneficiary**: The account that will receive the tokens.
 */
struct SweepOrder {
    OrderProtocols protocol;
    address tokenAddress;
    address paymentMethod;
    address beneficiary;
}

/**
 * @dev This struct defines order information that is unique to each item of a sweep order.
 * @dev Combined with the SweepOrder header information to make an Order to execute.
 * 
 * @dev **maker**: The user that created and signed the order to be executed by a taker.
 * @dev **marketplace**: The marketplace that the order was created on.
 * @dev **fallbackRoyaltyRecipient**: The address that will receive royalties if ERC2981 
 * @dev is not supported by the collection and the creator has not defined royalties with Payment Processor.
 * @dev **tokenId**: The token id that the order is for.
 * @dev **amount**: The quantity of token the order is for.
 * @dev **itemPrice**: The price for the order in base units for the payment method.
 * @dev **nonce**: The maker's nonce for the order.
 * @dev **expiration**: The time, in seconds since the Unix epoch, that the order will expire.
 * @dev **marketplaceFeeNumerator**: The percentage fee that will be sent to the marketplace.
 * @dev **maxRoyaltyFeeNumerator**: The maximum royalty the maker is willing to accept. This will be used
 * @dev as the royalty amount when ERC2981 is not supported by the collection.
 */
struct SweepItem {
    address maker;
    address marketplace;
    address fallbackRoyaltyRecipient;
    uint256 tokenId;
    uint248 amount;
    uint256 itemPrice;
    uint256 nonce;
    uint256 expiration;
    uint256 marketplaceFeeNumerator;
    uint256 maxRoyaltyFeeNumerator;
}

/**
 * @dev This struct is used to define pricing constraints for a collection or individual token.
 *
 * @dev **isSet**: When true, this indicates that pricing constraints are set for the collection or token.
 * @dev **floorPrice**: The minimum price for a token or collection.  This is only enforced when 
 * @dev `enforcePricingConstraints` is `true`.
 * @dev **ceilingPrice**: The maximum price for a token or collection.  This is only enforced when
 * @dev `enforcePricingConstraints` is `true`.
 */
struct PricingBounds {
    bool isSet;
    uint120 floorPrice;
    uint120 ceilingPrice;
}

/**
 * @dev This struct defines the parameters for a bulk offer acceptance transaction.
 * 
 * 
 * @dev **isCollectionLevelOfferArray**: An array of flags to indicate if an offer is for any token in the collection.
 * @dev **saleDetailsArray**: An array of order execution details.
 * @dev **buyerSignaturesArray**: An array of maker signatures authorizing the order executions.
 * @dev **tokenSetProofsArray**: An array of root hashes and merkle proofs for offers that are a subset of tokens in a collection.
 * @dev **cosignaturesArray**: An array of additional cosignatures for cosigned orders, as applicable.
 * @dev **feesOnTopArray**: An array of additional fees to add on top of the orders, paid by taker.
 */
struct BulkAcceptOffersParams {
    bool[] isCollectionLevelOfferArray;
    Order[] saleDetailsArray;
    SignatureECDSA[] buyerSignaturesArray;
    TokenSetProof[] tokenSetProofsArray;
    Cosignature[] cosignaturesArray;
    FeeOnTop[] feesOnTopArray;
}

/** 
 * @dev Internal contract use only - this is not a public-facing struct
 */
struct SplitProceeds {
    address royaltyRecipient;
    uint256 royaltyProceeds;
    uint256 marketplaceProceeds;
    uint256 sellerProceeds;
}

/** 
 * @dev Internal contract use only - this is not a public-facing struct
 */
struct PayoutsAccumulator {
    address lastSeller;
    address lastMarketplace;
    address lastRoyaltyRecipient;
    uint256 accumulatedSellerProceeds;
    uint256 accumulatedMarketplaceProceeds;
    uint256 accumulatedRoyaltyProceeds;
}

/** 
 * @dev Internal contract use only - this is not a public-facing struct
 */
struct SweepCollectionComputeAndDistributeProceedsParams {
    IERC20 paymentCoin;
    FulfillOrderFunctionPointers fnPointers;
    FeeOnTop feeOnTop;
    RoyaltyBackfillAndBounty royaltyBackfillAndBounty;
    Order[] saleDetailsBatch;
}

/** 
 * @dev Internal contract use only - this is not a public-facing struct
 */
 struct FulfillOrderFunctionPointers {
    function(address,address,IERC20,uint256,uint256) funcPayout;
    function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken;
    function(TradeContext memory, Order memory) funcEmitOrderExecutionEvent;
 }

 /** 
 * @dev Internal contract use only - this is not a public-facing struct
 */
 struct TradeContext {
    bytes32 domainSeparator;
    address channel;
    address taker;
    bool disablePartialFill;
 }

/**
 * @dev This struct defines contract-level storage to be used across all Payment Processor modules.
 * @dev Follows the Diamond storage pattern.
 */
struct PaymentProcessorStorage {
    /// @dev Tracks the most recently created payment method whitelist id
    uint32 lastPaymentMethodWhitelistId;

    /**
     * @notice User-specific master nonce that allows buyers and sellers to efficiently cancel all listings or offers
     *         they made previously. The master nonce for a user only changes when they explicitly request to revoke all
     *         existing listings and offers.
     *
     * @dev    When prompting sellers to sign a listing or offer, marketplaces must query the current master nonce of
     *         the user and include it in the listing/offer signature data.
     */
    mapping(address => uint256) masterNonces;

    /**
     * @dev The mapping key is the keccak256 hash of marketplace address and user address.
     *
     * @dev ```keccak256(abi.encodePacked(marketplace, user))```
     *
     * @dev The mapping value is another nested mapping of "slot" (key) to a bitmap (value) containing boolean flags
     *      indicating whether or not a nonce has been used or invalidated.
     *
     * @dev Marketplaces MUST track their own nonce by user, incrementing it for every signed listing or offer the user
     *      creates.  Listings and purchases may be executed out of order, and they may never be executed if orders
     *      are not matched prior to expriation.
     *
     * @dev The slot and the bit offset within the mapped value are computed as:
     *
     * @dev ```slot = nonce / 256;```
     * @dev ```offset = nonce % 256;```
     */
    mapping(address => mapping(uint256 => uint256)) invalidatedSignatures;
    
    /// @dev Mapping of token contract addresses to the collection payment settings.
    mapping (address => CollectionPaymentSettings) collectionPaymentSettings;

    /// @dev Mapping of payment method whitelist id to the owner address for the list.
    mapping (uint32 => address) paymentMethodWhitelistOwners;

    /// @dev Mapping of payment method whitelist id to a defined list of allowed payment methods.
    mapping (uint32 => EnumerableSet.AddressSet) collectionPaymentMethodWhitelists;

    /// @dev Mapping of token contract addresses to the collection-level pricing boundaries (floor and ceiling price).
    mapping (address => PricingBounds) collectionPricingBounds;

    /// @dev Mapping of token contract addresses to the token-level pricing boundaries (floor and ceiling price).
    mapping (address => mapping (uint256 => PricingBounds)) tokenPricingBounds;

    /// @dev Mapping of token contract addresses to the defined royalty backfill receiver addresses.
    mapping (address => address) collectionRoyaltyBackfillReceivers;

    /// @dev Mapping of token contract addresses to the defined exclusive bounty receivers.
    mapping (address => address) collectionExclusiveBountyReceivers;

    /// @dev Mapping of maker addresses to a mapping of order digests to the status of the partially fillable order for that digest.
    mapping (address => mapping(bytes32 => PartiallyFillableOrderStatus)) partiallyFillableOrderStatuses;

    /// @dev Mapping of token contract addresses to the defined list of trusted channels for the token contract.
    mapping (address => EnumerableSet.AddressSet) collectionTrustedChannels;

    /// @dev Mapping of token contract addresses to the defined list of banned accounts for the token contract.
    mapping (address => EnumerableSet.AddressSet) collectionBannedAccounts;

    /// @dev A list of all co-signers that have self-destructed and can never be used as cosigners again.
    EnumerableSet.AddressSet destroyedCosigners;
}