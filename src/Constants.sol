// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// keccack256("Cosignature(uint8 v,bytes32 r,bytes32 s,uint256 expiration,address taker)")
bytes32 constant COSIGNATURE_HASH = 0x347b7818601b168f6faadc037723496e9130b057c1ffef2ec4128311e19142f2;

// keccack256("CollectionOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant COLLECTION_OFFER_APPROVAL_HASH = 0x0bddbde6db95e748de1301fc5fb8424dd11a587bac80c6f79448134b92ad3b70;

// keccack256("CollectionOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator)")
bytes32 constant COLLECTION_OFFER_APPROVAL_COSIGNED_HASH = 0x752278e6558e1d94cc16cf261d8ef40d9325b5b7ecef0e560f911baad4581f40;

// keccack256("ItemOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant ITEM_OFFER_APPROVAL_HASH = 0x784dbb94c672fceba441ec9dec648b5ab944412f1f20f175c28a384f96e06412;

// keccack256("ItemOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator)")
bytes32 constant ITEM_OFFER_APPROVAL_COSIGNED_HASH = 0x3073cb5eb7956da9bf09d0f162dad1fbf7167de77f67135eb676d520c03b6ef4;

//   keccack256("TokenSetOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce,bytes32 tokenSetMerkleRoot)")
bytes32 constant TOKEN_SET_OFFER_APPROVAL_HASH = 0xba5f99df4b6bb89386fdec0bfa4c626336bc8e26d3168f42f3a76724f6c72378;

//   keccack256("TokenSetOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,bytes32 tokenSetMerkleRoot)")
bytes32 constant TOKEN_SET_OFFER_APPROVAL_COSIGNED_HASH = 0xa8943fe280a0379481848219df2976c04ae2bec1738844a6d2ebb4c1bd4ca06a;

// keccack256("SaleApproval(uint8 protocol,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant SALE_APPROVAL_HASH = 0x02fc3df1d45374616275873444056e58c225fdbdd564036912309f93e2491cc4;

// keccack256("SaleApprovalCosigned(uint8 protocol,address cosigner,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)")
bytes32 constant SALE_APPROVAL_COSIGNED_HASH = 0x08b356dc681531d988a5790f847e169f00bb27ce6f2d38beff8c2f976e79256a;

// The denominator used when calculating the marketplace fee.
// 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
uint256 constant FEE_DENOMINATOR = 100_00;

// Convenience to avoid magic number in bitmask get/set logic.
uint256 constant ONE = uint256(1);

// The default admin role for NFT collections using Access Control.
bytes32 constant DEFAULT_ACCESS_CONTROL_ADMIN_ROLE = 0x00;

/**************************************************************/
/*                   PRECOMPUTED SELECTORS                    */
/**************************************************************/

bytes4 constant SELECTOR_WHITELIST_PAYMENT_METHOD = hex"bb39ce91";
bytes4 constant SELECTOR_UNWHITELIST_PAYMENT_METHOD = hex"e9d4c14e";
bytes4 constant SELECTOR_SET_COLLECTION_PAYMENT_SETTINGS = hex"eeabfa03";
bytes4 constant SELECTOR_SET_COLLECTION_PRICING_BOUNDS = hex"7141ae10";
bytes4 constant SELECTOR_SET_TOKEN_PRICING_BOUNDS = hex"22146d70";

bytes4 constant SELECTOR_REVOKE_MASTER_NONCE = hex"226d4adb";
bytes4 constant SELECTOR_REVOKE_SINGLE_NONCE = hex"b6d7dc33";
bytes4 constant SELECTOR_REVOKE_ORDER_DIGEST = hex"96ae0380";

bytes4 constant SELECTOR_BUY_LISTING = hex"8ef40e40";
bytes4 constant SELECTOR_BUY_LISTING_WITH_FEE_ON_TOP = hex"8b03b8fa";
bytes4 constant SELECTOR_BUY_LISTING_COSIGNED = hex"dfc759a3";
bytes4 constant SELECTOR_BUY_LISTING_COSIGNED_WITH_FEE_ON_TOP = hex"6ea9a286";

bytes4 constant SELECTOR_ACCEPT_OFFER = hex"089b2f82";
bytes4 constant SELECTOR_ACCEPT_OFFER_WITH_FEE_ON_TOP = hex"13096dc3";
bytes4 constant SELECTOR_ACCEPT_OFFER_COSIGNED = hex"ab105cd3";
bytes4 constant SELECTOR_ACCEPT_OFFER_COSIGNED_WITH_FEE_ON_TOP = hex"70ca4dcc";

bytes4 constant SELECTOR_BULK_BUY_LISTINGS = hex"d30ebf67";
bytes4 constant SELECTOR_BULK_BUY_LISTINGS_WITH_FEES_ON_TOP = hex"fe936b43";
bytes4 constant SELECTOR_BULK_BUY_LISTINGS_COSIGNED = hex"e4569986";
bytes4 constant SELECTOR_BULK_BUY_LISTINGS_COSIGNED_WITH_FEES_ON_TOP = hex"95634dcf";

bytes4 constant SELECTOR_BULK_ACCEPT_OFFERS = hex"f2d99f07";
bytes4 constant SELECTOR_BULK_ACCEPT_OFFERS_WITH_FEES_ON_TOP = hex"2496dd8d";
bytes4 constant SELECTOR_BULK_ACCEPT_OFFERS_COSIGNED = hex"29d9ed85";
bytes4 constant SELECTOR_BULK_ACCEPT_OFFERS_COSIGNED_WITH_FEES_ON_TOP = hex"66449220";

bytes4 constant SELECTOR_SWEEP_COLLECTION = hex"d1ce07aa";
bytes4 constant SELECTOR_SWEEP_COLLECTION_WITH_FEE_ON_TOP = hex"51eac725";
bytes4 constant SELECTOR_SWEEP_COLLECTION_COSIGNED = hex"e921d907";
bytes4 constant SELECTOR_SWEEP_COLLECTION_COSIGNED_WITH_FEE_ON_TOP = hex"5a14c119";