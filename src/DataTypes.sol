// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

enum OrderProtocols { 
    ERC721_FILL_OR_KILL, 
    ERC1155_FILL_OR_KILL,
    ERC1155_FILL_PARTIAL
}

enum PaymentSettings { 
    DefaultPaymentMethodWhitelist,
    AllowAnyPaymentMethod,
    CustomPaymentMethodWhitelist,
    PricingConstraints
}

struct DefaultPaymentMethods {
    address defaultPaymentMethod1;
    address defaultPaymentMethod2;
    address defaultPaymentMethod3;
    address defaultPaymentMethod4;
    address defaultPaymentMethod5;
    address defaultPaymentMethod6;
    address defaultPaymentMethod7;
    address defaultPaymentMethod8;
}

struct CollectionPaymentSettings {
    PaymentSettings paymentSettings;
    uint32 paymentMethodWhitelistId;
    address constrainedPricingPaymentMethod;
    uint16 royaltyBackfillNumerator;
    uint16 royaltyBountyNumerator;
    bool isRoyaltyBountyExclusive;
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

struct Order {
    OrderProtocols protocol;
    address maker;
    address beneficiary;
    address marketplace;
    address paymentMethod;
    address tokenAddress;
    uint256 tokenId;
    uint256 amount;
    uint256 itemPrice;
    uint256 nonce;
    uint256 expiration;
    uint256 marketplaceFeeNumerator;
    uint256 maxRoyaltyFeeNumerator;
}

struct Cosignature {
    address signer;
    address taker;
    uint256 expiration;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct FeeOnTop {
    address recipient;
    uint256 amount;
}

struct TokenSetProof {
    bytes32 rootHash;
    bytes32[] proof;
}

struct FillAmounts {
    uint248 requested;
    uint248 minimum;
}

enum PartiallyFillableOrderState { 
    Open, 
    Filled, 
    Cancelled
}

struct PartiallyFillableOrderStatus {
    PartiallyFillableOrderState state;
    uint248 remainingFillableQuantity;
}

struct RoyaltyBackfillAndBounty {
    uint16 backfillNumerator;
    address backfillReceiver;
    uint16 bountyNumerator;
    address exclusiveMarketplace;
}

struct SweepOrder {
    OrderProtocols protocol;
    address tokenAddress;
    address paymentMethod;
    address beneficiary;
}

struct SweepItem {
    address maker;
    address marketplace;
    uint256 tokenId;
    uint256 amount;
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

struct BulkBuyListingsCosignedWithFeeOnTopParams {
    Order[] saleDetailsArray;
    SignatureECDSA[] sellerSignatures;
    Cosignature[] cosignatures;
    FeeOnTop[] feesOnTop;
}

struct BulkAcceptOffersCosignedWithFeeOnTopParams {
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
    function(Order memory) funcEmitOrderExecutionEvent;
 }

struct cPortStorage {
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
    
    mapping (address => CollectionPaymentSettings) collectionPaymentSettings;
    mapping (uint32 => address) paymentMethodWhitelistOwners;
    mapping (uint32 => mapping (address => bool)) collectionPaymentMethodWhitelists;

    /**
     * @dev Mapping of token contract addresses to the collection-level pricing boundaries (floor and ceiling price).
     */
    mapping (address => PricingBounds) collectionPricingBounds;

    /**
     * @dev Mapping of token contract addresses to the token-level pricing boundaries (floor and ceiling price).
     */
    mapping (address => mapping (uint256 => PricingBounds)) tokenPricingBounds;

    mapping (address => address) collectionRoyaltyBackfillReceivers;
    mapping (address => address) collectionExclusiveBountyReceivers;

    mapping (address => mapping(bytes32 => PartiallyFillableOrderStatus)) partiallyFillableOrderStatuses;
}