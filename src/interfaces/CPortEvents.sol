// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DataTypes.sol";

interface cPortEvents {
    /// @notice Emitted when a bundle of ERC-721 tokens is successfully purchased using `buyBundledListing`
    event BuyBundledListingERC721(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
        bool[] unsuccessfulFills,
        uint256[] tokenIds,
        uint256[] salePrices);

    /// @notice Emitted when a bundle of ERC-1155 tokens is successfully purchased using `buyBundledListing`
    event BuyBundledListingERC1155(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
        bool[] unsuccessfulFills,
        uint256[] tokenIds,
        uint256[] amounts,
        uint256[] salePrices);

    /// @notice Emitted for each token successfully purchased using either `buySingleLising` or `buyBatchOfListings`
    event BuySingleListing(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
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

    /// @notice Emitted when a collection of ERC-721 tokens is successfully swept using `sweepCollection`
    event SweepCollectionERC721(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        bool[] unsuccessfulFills,
        address[] sellers,
        uint256[] tokenIds,
        uint256[] salePrices);

    /// @notice Emitted when a collection of ERC-1155 tokens is successfully swept using `sweepCollection`
    event SweepCollectionERC1155(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        bool[] unsuccessfulFills,
        address[] sellers,
        uint256[] tokenIds,
        uint256[] amounts,
        uint256[] salePrices);

    /// @notice Emitted whenever pricing bounds change at a collection level for price-constrained collections.
    event UpdatedCollectionLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 floorPrice, 
        uint256 ceilingPrice);

    /// @notice Emitted whenever the supported ERC-20 payment is set for price-constrained collections.
    event UpdatedCollectionPaymentSettings(
        address indexed tokenAddress, 
        PaymentSettings paymentSettings, 
        uint88 paymentMethodWhitelistId, 
        address constrainedPricingPaymentMethod);

    /// @notice Emitted whenever pricing bounds change at a token level for price-constrained collections.
    event UpdatedTokenLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 indexed tokenId, 
        uint256 floorPrice, 
        uint256 ceilingPrice);
}