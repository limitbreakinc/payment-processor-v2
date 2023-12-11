// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DataTypes.sol";

/** 
* @title Payment Processor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 
interface IPaymentProcessorEvents {

    /// @notice Emitted when an ERC721 listing is purchased.
    event BuyListingERC721(
        address indexed buyer,
        address indexed seller,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 salePrice);

    /// @notice Emitted when an ERC1155 listing is purchased.
    event BuyListingERC1155(
        address indexed buyer,
        address indexed seller,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 amount,
        uint256 salePrice);

    /// @notice Emitted when an ERC721 offer is accepted.
    event AcceptOfferERC721(
        address indexed seller,
        address indexed buyer,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 salePrice);

    /// @notice Emitted when an ERC1155 offer is accepted.
    event AcceptOfferERC1155(
        address indexed seller,
        address indexed buyer,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 amount,
        uint256 salePrice);

    /// @notice Emitted when a new payment method whitelist is created.
    event CreatedPaymentMethodWhitelist(
        uint32 indexed paymentMethodWhitelistId, 
        address indexed whitelistOwner,
        string whitelistName);

    /// @notice Emitted when a user revokes all of their existing listings or offers that share the master nonce.
    event MasterNonceInvalidated(address indexed account, uint256 nonce);

    /// @notice Emitted when a user revokes a single listing or offer nonce for a specific marketplace.
    event NonceInvalidated(
        uint256 indexed nonce, 
        address indexed account, 
        bool wasCancellation);

    /// @notice Emitted when a user revokes a single listing or offer nonce for a specific marketplace.
    event OrderDigestInvalidated(
        bytes32 indexed orderDigest, 
        address indexed account, 
        bool wasCancellation);

    /// @notice Emitted when a coin is added to the approved coins mapping for a security policy
    event PaymentMethodAddedToWhitelist(
        uint32 indexed paymentMethodWhitelistId, 
        address indexed paymentMethod);

    /// @notice Emitted when a coin is removed from the approved coins mapping for a security policy
    event PaymentMethodRemovedFromWhitelist(
        uint32 indexed paymentMethodWhitelistId, 
        address indexed paymentMethod);

    /// @notice Emitted when a trusted channel is added for a collection
    event TrustedChannelAddedForCollection(
        address indexed tokenAddress, 
        address indexed channel);

    /// @notice Emitted when a trusted channel is removed for a collection
    event TrustedChannelRemovedForCollection(
        address indexed tokenAddress, 
        address indexed channel);

    /// @notice Emitted whenever pricing bounds change at a collection level for price-constrained collections.
    event UpdatedCollectionLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 floorPrice, 
        uint256 ceilingPrice);

    /// @notice Emitted whenever the supported ERC-20 payment is set for price-constrained collections.
    event UpdatedCollectionPaymentSettings(
        address indexed tokenAddress, 
        PaymentSettings paymentSettings, 
        uint32 indexed paymentMethodWhitelistId, 
        address indexed constrainedPricingPaymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver,
        bool blockTradesFromUntrustedChannels);

    /// @notice Emitted whenever pricing bounds change at a token level for price-constrained collections.
    event UpdatedTokenLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 indexed tokenId, 
        uint256 floorPrice, 
        uint256 ceilingPrice);
}