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

struct BundledOrderBase {
    TokenProtocols protocol;
    address buyer;
    address marketplace;
    address paymentMethod;
    address tokenAddress;
    uint256 marketplaceFeeNumerator;
}

struct BundledOrderExtended {
    BundledOrderBase bundleBase; 
    address seller;
    uint256 nonce;
    uint256 expiration;
}

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