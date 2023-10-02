// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DataTypes.sol";

interface cPortEvents {

    event BuyListingERC721(
        address indexed buyer,
        address indexed seller,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 salePrice);

    event BuyListingERC1155(
        address indexed buyer,
        address indexed seller,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 amount,
        uint256 salePrice);

    event AcceptOfferERC721(
        address indexed seller,
        address indexed buyer,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 salePrice);

    event AcceptOfferERC1155(
        address indexed seller,
        address indexed buyer,
        address indexed tokenAddress,
        address beneficiary,
        address paymentCoin,
        uint256 tokenId,
        uint256 amount,
        uint256 salePrice);

    event CreatedPaymentMethodWhitelist(
        uint88 indexed paymentMethodWhitelistId, 
        address whitelistOwner, 
        string whitelistName);

    /// @notice Emitted when a user revokes all of their existing listings or offers that share the master nonce.
    event MasterNonceInvalidated(
        uint256 indexed nonce, 
        address indexed account);

    /// @notice Emitted when a user revokes a single listing or offer nonce for a specific marketplace.
    event NonceInvalidated(
        uint256 indexed nonce, 
        address indexed account, 
        bool wasCancellation);

    /// @notice Emitted when a coin is added to the approved coins mapping for a security policy
    event PaymentMethodAddedToWhitelist(
        uint88 indexed paymentMethodWhitelistId, 
        address indexed paymentMethod);

    /// @notice Emitted when a coin is removed from the approved coins mapping for a security policy
    event PaymentMethodRemovedFromWhitelist(
        uint88 indexed paymentMethodWhitelistId, 
        address indexed paymentMethod);

    /// @notice Emitted whenever pricing bounds change at a collection level for price-constrained collections.
    event UpdatedCollectionLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 floorPrice, 
        uint256 ceilingPrice);

    /// @notice Emitted whenever the supported ERC-20 payment is set for price-constrained collections.
    event UpdatedCollectionPaymentSettings(
        address indexed tokenAddress, 
        PaymentSettings paymentSettings, 
        uint32 paymentMethodWhitelistId, 
        address constrainedPricingPaymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver);

    /// @notice Emitted whenever pricing bounds change at a token level for price-constrained collections.
    event UpdatedTokenLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 indexed tokenId, 
        uint256 floorPrice, 
        uint256 ceilingPrice);
}