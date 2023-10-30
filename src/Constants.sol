// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// keccack256("Cosignature(uint8 v,bytes32 r,bytes32 s,uint256 expiration,address taker)")
bytes32 constant COSIGNATURE_HASH = 0x347b7818601b168f6faadc037723496e9130b057c1ffef2ec4128311e19142f2;

// keccack256("CollectionOfferApproval(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant COLLECTION_OFFER_APPROVAL_HASH = 0x0ddc544147fe09af63f3e8e730de0e964958d294e593acdd574ab7dd0d1a92b3;

// keccack256("ItemOfferApproval(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant ITEM_OFFER_APPROVAL_HASH = 0x4880b829c8775ea5a85b73aa0c53a7e0d0b8b69931a17170ec6734182530302c;

//   keccack256("TokenSetOfferApproval(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce,bytes32 tokenSetMerkleRoot)")
bytes32 constant TOKEN_SET_OFFER_APPROVAL_HASH = 0xb3e692849cea2e94d188eace607dc564be5e22896779c9132abe34f9d8790f20;

// keccack256("SaleApproval(uint8 protocol,address cosigner,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant SALE_APPROVAL_HASH = 0x359a367d4f3e2b0c6e033a96f44fe38de8c901ebfcc258f5adbc20a3ae52061f;

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

bytes4 constant SELECTOR_BUY_LISTING = hex"afeef2fe";
bytes4 constant SELECTOR_ACCEPT_OFFER = hex"1a8cfb6a";
bytes4 constant SELECTOR_BULK_BUY_LISTINGS = hex"6c273b13";
bytes4 constant SELECTOR_BULK_ACCEPT_OFFERS = hex"fffa9147";
bytes4 constant SELECTOR_SWEEP_COLLECTION = hex"32103b1f";
