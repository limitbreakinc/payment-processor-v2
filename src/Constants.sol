// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;


// keccack256("OrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
bytes32 constant ORDER_APPROVAL_HASH = 0x61718384c415a086091f6ee7779f499c089559dc5f0d8a00c21a2760ef58ac47;

// keccack256("CollectionOrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
bytes32 constant COLLECTION_ORDER_APPROVAL_HASH = 0x61e6f7cf8f226da53a60071c56608b1b1f6d80644b1a566f2f26a786a550d9b4;

// keccack256("BundledSaleApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 expiration,uint256 nonce,uint256 marketplaceFeeNumerator,uint256 masterNonce,uint256[] tokenIds,uint256[] amounts,uint256[] maxRoyaltyFeeNumerators,uint256[] itemPrices)")
bytes32 constant BUNDLED_SALE_APPROVAL_HASH = 0x6ee338102e037f512a8d29ebe1eaa0b27e14cb37f4d8cbd347c71a55d5519c5b;

// The denominator used when calculating the marketplace fee.
// 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
uint256 constant FEE_DENOMINATOR = 10_000;

// Convenience to avoid magic number in bitmask get/set logic.
uint256 constant ONE = uint256(1);

// The default admin role for NFT collections using Access Control.
bytes32 constant DEFAULT_ACCESS_CONTROL_ADMIN_ROLE = 0x00;