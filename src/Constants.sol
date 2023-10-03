// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// keccack256("Cosignature(uint8 v,bytes32 r,bytes32 s,uint256 expiration,address taker)")
bytes32 constant COSIGNATURE_HASH = 0x347b7818601b168f6faadc037723496e9130b057c1ffef2ec4128311e19142f2;

// keccack256("CollectionOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant COLLECTION_OFFER_APPROVAL_HASH = 0x75ff8430945f3f8849b57c272a74be75c248cf28efca1e170f6f94accc06472c;

// keccack256("CollectionOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant COLLECTION_OFFER_APPROVAL_COSIGNED_HASH = 0xc857b19ea875a2c59032ab6a2eba68c87915eb244b5ce35b2a5a21a0cb1cc5de;

// keccack256("ItemOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant ITEM_OFFER_APPROVAL_HASH = 0xc2dd44d34b7ad5d89d9f35d12737a08a0dc081d9fb038ded79ce2c993a0aeb6a;

// keccack256("ItemOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant ITEM_OFFER_APPROVAL_COSIGNED_HASH = 0x46060c357b0a7420ed05c51eb5ad779d8cdffd26c0ff772c00c4c6aac7d59e23;

//   keccack256("TokenSetOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce,bytes32 tokenSetMerkleRoot)")
bytes32 constant TOKEN_SET_OFFER_APPROVAL_HASH = 0xe916117b418ddf851da6bab6ad14a810a8cf63fe4189de0ce9a38703119bf0f7;

//   keccack256("TokenSetOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,bytes32 tokenSetMerkleRoot)")
bytes32 constant TOKEN_SET_OFFER_APPROVAL_COSIGNED_HASH = 0x4233e504226b05e23984f8e11bd8ed92194f9e2921f4b81313be7eb394e48b2a;

// keccack256("SaleApproval(uint8 protocol,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant SALE_APPROVAL_HASH = 0x02fc3df1d45374616275873444056e58c225fdbdd564036912309f93e2491cc4;

// keccack256("SaleApprovalCosigned(uint8 protocol,address cosigner,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant SALE_APPROVAL_COSIGNED_HASH = 0x08b356dc681531d988a5790f847e169f00bb27ce6f2d38beff8c2f976e79256a;

////

// keccack256("BundledSaleApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 expiration,uint256 nonce,uint256 marketplaceFeeNumerator,uint256 masterNonce,uint256[] tokenIds,uint256[] amounts,uint256[] maxRoyaltyFeeNumerators,uint256[] itemPrices)")
bytes32 constant BUNDLED_SALE_APPROVAL_HASH = 0x6ee338102e037f512a8d29ebe1eaa0b27e14cb37f4d8cbd347c71a55d5519c5b;

// The denominator used when calculating the marketplace fee.
// 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
uint256 constant FEE_DENOMINATOR = 10_000;

// Convenience to avoid magic number in bitmask get/set logic.
uint256 constant ONE = uint256(1);

// The default admin role for NFT collections using Access Control.
bytes32 constant DEFAULT_ACCESS_CONTROL_ADMIN_ROLE = 0x00;