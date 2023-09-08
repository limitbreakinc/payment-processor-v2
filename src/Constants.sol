// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// keccack256("SaleApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
bytes32 constant SALE_APPROVAL_HASH = 0x61718384c415a086091f6ee7779f499c089559dc5f0d8a00c21a2760ef58ac47;

// keccack256("ItemOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
bytes32 constant ITEM_OFFER_APPROVAL_HASH = 0x14d5bd57a0f425f32bdf8ef6f67ffbe773bf0180cea351d08d6cc463f556e439;

// keccack256("CollectionOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce,bytes32 tokenSetMerkleRoot)")
bytes32 constant COLLECTION_OFFER_APPROVAL_HASH = 0xd5607d00fafa17001ca313328b7c81be0e4b02dfb10973c32ed5cb9b2d437400;

// keccack256("OrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
bytes32 constant ORDER_APPROVAL_HASH = 0x61718384c415a086091f6ee7779f499c089559dc5f0d8a00c21a2760ef58ac47;

// keccack256("CollectionOrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
bytes32 constant COLLECTION_ORDER_APPROVAL_HASH = 0x61e6f7cf8f226da53a60071c56608b1b1f6d80644b1a566f2f26a786a550d9b4;

// keccack256("BundledSaleApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 expiration,uint256 nonce,uint256 marketplaceFeeNumerator,uint256 masterNonce,uint256[] tokenIds,uint256[] amounts,uint256[] maxRoyaltyFeeNumerators,uint256[] itemPrices)")
bytes32 constant BUNDLED_SALE_APPROVAL_HASH = 0x6ee338102e037f512a8d29ebe1eaa0b27e14cb37f4d8cbd347c71a55d5519c5b;

// keccack256("SaleApprovalCoSigned(uint8 protocol,address cosigner,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant COSIGNED_SALE_APPROVAL_HASH = 0xabe0b224bb5c9c256a3453e711d53cb4ee3765f9cb13b433bf3c0a4133ec42eb;

// keccack256("CollectionOfferApprovalCoSigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant COSIGNED_COLLECTION_OFFER_APPROVAL_HASH = 0xe4e39dcd887ae459686913c1f0a7375b32768ec727b1f04d598478c5d0a80eeb;

// keccack256("ItemOfferApprovalCoSigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant COSIGNED_ITEM_OFFER_APPROVAL_HASH = 0x65f501f664a6b819fbdf5e476b74e83a9e10fb6234ab50ccc17add90d36f69b9;

// The denominator used when calculating the marketplace fee.
// 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
uint256 constant FEE_DENOMINATOR = 10_000;

// Convenience to avoid magic number in bitmask get/set logic.
uint256 constant ONE = uint256(1);

// The default admin role for NFT collections using Access Control.
bytes32 constant DEFAULT_ACCESS_CONTROL_ADMIN_ROLE = 0x00;