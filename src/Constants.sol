// SPDX-License-Identifier: BSL-1.1
pragma solidity 0.8.19;

// keccack256("Cosignature(uint8 v,bytes32 r,bytes32 s,uint256 expiration,address taker)")
bytes32 constant COSIGNATURE_HASH = 0x347b7818601b168f6faadc037723496e9130b057c1ffef2ec4128311e19142f2;

// keccack256("CollectionOfferApproval(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address fallbackRoyaltyRecipient,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant COLLECTION_OFFER_APPROVAL_HASH = 0x8fe9498e93fe26b30ebf76fac07bd4705201c8609227362697082288e3b4af9c;

// keccack256("ItemOfferApproval(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address fallbackRoyaltyRecipient,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant ITEM_OFFER_APPROVAL_HASH = 0xce2e9706d63e89ddf7ee16ce0508a1c3c9bd1904c582db2e647e6f4690a0bf6b;

//   keccack256("TokenSetOfferApproval(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address fallbackRoyaltyRecipient,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce,bytes32 tokenSetMerkleRoot)")
bytes32 constant TOKEN_SET_OFFER_APPROVAL_HASH = 0x244905ade6b0e455d12fb539a4b17d7f675db14797d514168d09814a09c70e70;

// keccack256("SaleApproval(uint8 protocol,address cosigner,address seller,address marketplace,address fallbackRoyaltyRecipient,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)")
bytes32 constant SALE_APPROVAL_HASH = 0x938786a8256d04dc45d6d5b997005aa07c0c9e3e4925d0d6c33128d240096ebc;

// The denominator used when calculating the marketplace fee.
// 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
uint256 constant FEE_DENOMINATOR = 100_00;

// Default Payment Method Whitelist Id
uint32 constant DEFAULT_PAYMENT_METHOD_WHITELIST_ID = 0;

// Convenience to avoid magic number in bitmask get/set logic.
uint256 constant ZERO = uint256(0);
uint256 constant ONE = uint256(1);

// The default admin role for NFT collections using Access Control.
bytes32 constant DEFAULT_ACCESS_CONTROL_ADMIN_ROLE = 0x00;

/// @dev The plain text message to sign for cosigner self-destruct signature verification
string constant COSIGNER_SELF_DESTRUCT_MESSAGE_TO_SIGN = "COSIGNER_SELF_DESTRUCT";

/**************************************************************/
/*                   PRECOMPUTED SELECTORS                    */
/**************************************************************/

bytes4 constant SELECTOR_REASSIGN_OWNERSHIP_OF_PAYMENT_METHOD_WHITELIST= hex"a1e6917e";
bytes4 constant SELECTOR_RENOUNCE_OWNERSHIP_OF_PAYMENT_METHOD_WHITELIST= hex"0886702e";
bytes4 constant SELECTOR_WHITELIST_PAYMENT_METHOD = hex"bb39ce91";
bytes4 constant SELECTOR_UNWHITELIST_PAYMENT_METHOD = hex"e9d4c14e";
bytes4 constant SELECTOR_SET_COLLECTION_PAYMENT_SETTINGS = hex"fc5d8393";
bytes4 constant SELECTOR_SET_COLLECTION_PRICING_BOUNDS = hex"7141ae10";
bytes4 constant SELECTOR_SET_TOKEN_PRICING_BOUNDS = hex"22146d70";
bytes4 constant SELECTOR_ADD_TRUSTED_CHANNEL_FOR_COLLECTION = hex"ab559c14";
bytes4 constant SELECTOR_REMOVE_TRUSTED_CHANNEL_FOR_COLLECTION = hex"282e89f8";
bytes4 constant SELECTOR_ADD_BANNED_ACCOUNT_FOR_COLLECTION = hex"e21dde50";
bytes4 constant SELECTOR_REMOVE_BANNED_ACCOUNT_FOR_COLLECTION = hex"adf14a76";

bytes4 constant SELECTOR_DESTROY_COSIGNER = hex"2aebdefe";
bytes4 constant SELECTOR_REVOKE_MASTER_NONCE = hex"226d4adb";
bytes4 constant SELECTOR_REVOKE_SINGLE_NONCE = hex"b6d7dc33";
bytes4 constant SELECTOR_REVOKE_ORDER_DIGEST = hex"96ae0380";

bytes4 constant SELECTOR_BUY_LISTING = hex"a9272951";
bytes4 constant SELECTOR_ACCEPT_OFFER = hex"e35bb9b7";
bytes4 constant SELECTOR_BULK_BUY_LISTINGS = hex"27add047";
bytes4 constant SELECTOR_BULK_ACCEPT_OFFERS = hex"b3cdebdb";
bytes4 constant SELECTOR_SWEEP_COLLECTION = hex"206576f6";

/**************************************************************/
/*                   EXPECTED BASE msg.data LENGTHS           */
/**************************************************************/

uint256 constant PROOF_ELEMENT_SIZE = 32;

// | 4        | 32              | 512         | 96              | 192         | 64       | = 900 bytes
// | selector | domainSeparator | saleDetails | sellerSignature | cosignature | feeOnTop |
uint256 constant BASE_MSG_LENGTH_BUY_LISTING = 900;

// | 4        | 32              | 32                     | 512         |  96             | 32 + (96 + (32 * proof.length)) | 192         | 64       | = 1060 bytes + (32 * proof.length)
// | selector | domainSeparator | isCollectionLevelOffer | saleDetails |  buyerSignature | tokenSetProof                   | cosignature | feeOnTop |
uint256 constant BASE_MSG_LENGTH_ACCEPT_OFFER = 1060;

// | 4        | 32              | 64              | 512 * length      | 64              | 96 * length      | 64              | 192 * length | 64              | 64 * length | = 292 bytes + (864 * saleDetailsArray.length)
// | selector | domainSeparator | length + offset | saleDetailsArray  | length + offset | sellerSignatures | length + offset | cosignatures | length + offset | feesOnTop   |
uint256 constant BASE_MSG_LENGTH_BULK_BUY_LISTINGS = 292;
uint256 constant BASE_MSG_LENGTH_BULK_BUY_LISTINGS_PER_ITEM = 864;

// | 4        | 32              | 32           | 64              | 32 * length                 | 64              | 512 * length      | 64              | 96 * length          | 64              | 32 + (96 + (32 * proof.length)) | 64              | 192 * length | 64              | 64 * length | = 452 bytes + (1024 * saleDetailsArray.length) + (32 * proof.length [for each element])
// | selector | domainSeparator | struct info? | length + offset | isCollectionLevelOfferArray | length + offset | saleDetailsArray  | length + offset | buyerSignaturesArray | length + offset | tokenSetProof                   | length + offset | cosignatures | length + offset | feesOnTop   |
uint256 constant BASE_MSG_LENGTH_BULK_ACCEPT_OFFERS = 452;
uint256 constant BASE_MSG_LENGTH_BULK_ACCEPT_OFFERS_PER_ITEM = 1024;

// | 4        | 32              | 64       | 128        | 64              | 320 * length | 64              | 96 * length      | 64              | 192 * length | = 420 bytes + (608 * items.length)
// | selector | domainSeparator | feeOnTop | sweepOrder | length + offset | items        | length + offset | signedSellOrders | length + offset | cosignatures |
uint256 constant BASE_MSG_LENGTH_SWEEP_COLLECTION = 420;
uint256 constant BASE_MSG_LENGTH_SWEEP_COLLECTION_PER_ITEM = 608;