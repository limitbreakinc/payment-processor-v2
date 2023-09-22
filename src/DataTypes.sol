// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

enum TokenProtocols { ERC721, ERC1155 }

enum PaymentSettings { 
    DefaultPaymentMethodWhitelist,
    AllowAnyPaymentMethod,
    CustomPaymentMethodWhitelist,
    PricingConstraints
}

struct CollectionPaymentSettings {
    PaymentSettings paymentSettings;
    uint88 paymentMethodWhitelistId;
    address constrainedPricingPaymentMethod;
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
    TokenProtocols protocol;
    address seller;
    address buyer;
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

struct SweepOrder {
    TokenProtocols protocol;
    address beneficiary;
    address marketplace;
    address paymentMethod;
    address tokenAddress;
    uint256 marketplaceFeeNumerator;
}

struct SweepItem {
    address seller;
    uint256 tokenId;
    uint256 amount;
    uint256 itemPrice;
    uint256 nonce;
    uint256 expiration;
    uint256 maxRoyaltyFeeNumerator;
}

/*
struct BundledOrderExtended {
    BundledOrderBase bundleBase; 
    address seller;
    uint256 nonce;
    uint256 expiration;
}
*/

struct BundledItem {
    address seller;
    uint256 tokenId;
    uint256 amount;
    uint256 maxRoyaltyFeeNumerator;
    uint256 itemPrice;
    uint256 nonce;
    uint256 expiration;
}

/**
 * @dev This struct is used to define pricing constraints for a collection or individual token.
 *
 * @dev **isSet**: When true, this indicates that pricing constraints are set for the collection or token.
 * @dev **isImmutable**: When true, this indicates that pricing constraints are immutable and cannot be changed.
 * @dev **floorPrice**: The minimum price for a token or collection.  This is only enforced when 
 * @dev `enforcePricingConstraints` is `true`.
 * @dev **ceilingPrice**: The maximum price for a token or collection.  This is only enforced when
 * @dev `enforcePricingConstraints` is `true`.
 */
struct PricingBounds {
    bool isSet;
    bool isImmutable;
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
struct Accumulator {
    uint256[] tokenIds;
    uint256[] amounts;
    uint256[] salePrices;
    uint256[] maxRoyaltyFeeNumerators;
    address[] sellers;
    uint256 sumListingPrices;
}

/** 
 * @dev Internal contract use only - this is not a public-facing struct
 */
struct AccumulatorHashes {
    bytes32 tokenIdsKeccakHash;
    bytes32 amountsKeccakHash;
    bytes32 maxRoyaltyFeeNumeratorsKeccakHash;
    bytes32 itemPricesKeccakHash;
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

struct cPortStorage {
    /// @dev Tracks the most recently created payment method whitelist id
    uint88 lastPaymentMethodWhitelistId;

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
    mapping (uint88 => address) paymentMethodWhitelistOwners;
    mapping (uint88 => mapping (address => bool)) collectionPaymentMethodWhitelists;

    /**
     * @dev Mapping of token contract addresses to the collection-level pricing boundaries (floor and ceiling price).
     */
    mapping (address => PricingBounds) collectionPricingBounds;

    /**
     * @dev Mapping of token contract addresses to the token-level pricing boundaries (floor and ceiling price).
     */
    mapping (address => mapping (uint256 => PricingBounds)) tokenPricingBounds;
}