# Creator Port Exchange Integration Guide

## Glossary

- **Creator Port**: An NFT exchange protocol built by creators, for creators.  Built for trading of ERC721-C and ERC1155-C tokens, but backwards compatible to support trading of any ERC721 or ERC1155 token as well. Analagous to Blur Marketplace and Seaport exchange protocols, but built entirely around honoring fully on-chain programmable royalties. Also known as `cPort`.
- **cPort**: Shorthand for `Creator Port`.
- **cPort Encoder**: A helper contract deployed alongside cPort that integrated marketplaces use to format cPort function calldata.
- **Maker(s)**: Create buying or selling orders that are not carried out immediately.  For example, "sell NFT `A` at a price of $100" or "buy NFT `B` for $100".  This creates liquidity, meaning that it is easier for others to instantly buy or sell NFTs when the conditions are met.  When Bob lists an NFT he owns for sale, Bob is considered maker of the order.  Similarly, when Bob offers to buy an NFT, Bob is considered the maker of the order.
- **Taker(s)**: The entities that buy or sell instantly are called takers. In other words, the takers fill the orders created by the makers.  When Alice executes and order to buy Bob's listing, Alice is considered the taker of the order.  Similarly, when Alice accepts an offer from Bob to buy an NFT she owns, Alice is considered the taker of the order.
- **Listing**: An order to sell an NFT once filled by a taker.  Listings are gaslessly signed off-chain by the owner of the NFT.
- **Item Offer**: An order to buy a single, specific NFT once filled by a taker.  Item offers apply to exactly one specific token id in a collection.  Offers are gaslessly signed off-chain by one or more parties interested in purchasing the NFT.
- **Collection Offer**: An order to buy any NFT belonging to the same collection once filled by a taker.  Collection offers apply to any token id for a specific collection.  Offers are gaslessly signed off-chain by one or more parties interested in purchasing an NFT.
- **Token Set Offer**: An order to buy a single NFT from a subset of token ids in the same collection once filled by a taker.  Token set offers apply to a subset of token ids for a specific collection.  Offers are gaslessly signed off-chain by one or more parties interested in purchasing an NFT.
- **Standard Order**: Any listing or offer that may be filled directly by a taker.  Standard orders, when cancelled, must be cancelled on-chain by the order maker at their own gas expense.  Standard orders are not susceptible to censorship.
- **Cosigned Order**: Any listing or offer that must be cosigned by another party in order to be filled by a taker.  Cosigned orders, when cancelled, can be gaslessly cancelled off-chain.  Order-book providers that support cosigned orders must properly secure and automate the co-signing process.  The order-book provider must guarantee that no cosignature can be generated for a previously cancelled order.  Similarly, the order-book provider must guarantee availability of cosignatures to takers such that orders can always be filled uninterrupted. The use of cosigned orders are at the order maker's discretion.  Pros include cheaper, faster cancellation/replacement of orders without incurring transaction gas costs.  Cons include censorship/denial of service risks.
- **Beneficiary**: The address of the account that receives the NFT/item when an order is filled.  The buyer and beneficiary can be, but don't have to be the same account.
- **Fee On Top**: A `fee on top` is typically reserved for a marketplace or specialized wallet that finds orders filled by the taker.  This taker marketplace fee is an optional fee paid by the taker in excess of the items' prices in one or more orders.

## Taker Operations / Functions

| Function                                                     | Parameter Encoding Function                         | Valid Maker Order Signature Input Type(s)                                                                                                                    |
|--------------------------------------------------------------|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [buyListing](#buy-listing)                                   | [encodeBuyListingCalldata](#encodebuylistingcalldata)                            | [SaleApproval](#sale-approval)                                                                                                                               |
| [buyListingWithFeeOnTop](#buy-listing)                       | [encodeBuyListingWithFeeOnTopCalldata](#encodebuylistingwithfeeontopcalldata)                | [SaleApproval](#sale-approval)                                                                                                                               | 
| [buyListingCosigned](#buy-listing)                           | [encodeBuyListingCosignedCalldata](#encodebuylistingcosignedcalldata)                    | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [buyListingCosignedWithFeeOnTop](#buy-listing)               | [encodeBuyListingCosignedWithFeeOnTopCalldata](#encodebuylistingcosignedwithfeeontopcalldata)        | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [buyListingPartialFill](#buy-listing)               | [encodeBuyListingPartialFillCalldata](#encodebuylistingpartialfillcalldata)        | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [acceptOffer](#accept-offer)                                 | [encodeAcceptOfferCalldata](#encodeacceptoffercalldata)                           | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         |
| [acceptOfferWithFeeOnTop](#accept-offer)                     | [encodeAcceptOfferWithFeeOnTopCalldata](#encodeacceptofferwithfeeontopcalldata)               | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         | 
| [acceptOfferCosigned](#accept-offer)                         | [encodeAcceptOfferCosignedCalldata](#encodeacceptoffercosignedcalldata)                   | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [acceptOfferCosignedWithFeeOnTop](#accept-offer)             | [encodeAcceptOfferCosignedWithFeeOnTopCalldata](#encodeacceptoffercosignedwithfeeontopcalldata)       | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [acceptOfferPartialFill](#accept-offer)             | [encodeAcceptOfferPartialFillCalldata](#encodeacceptofferpartialfillcalldata)       | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [bulkBuyListings](#bulk-buy-listings)                        | [encodeBulkBuyListingsCalldata](#encodebulkbuylistingscalldata)                       | [SaleApproval](#sale-approval)                                                                                                                               |
| [bulkBuyListingsWithFeesOnTop](#bulk-buy-listings)           | [encodeBulkBuyListingsWithFeesOnTopCalldata](#encodebulkbuylistingswithfeesontopcalldata)          | [SaleApproval](#sale-approval)                                                                                                                               | 
| [bulkBuyListingsCosigned](#bulk-buy-listings)                | [encodeBulkBuyListingsCosignedCalldata](#encodebulkbuylistingscosignedcalldata)               | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [bulkBuyListingsCosignedWithFeesOnTop](#bulk-buy-listings)   | [encodeBulkBuyListingsCosignedWithFeesOnTopCalldata](#encodebulkbuylistingscosignedwithfeesontopcalldata)  | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                                                                      |
| [bulkBuyListingsPartialFill](#bulk-buy-listings)   | [encodeBulkBuyListingsPartialFillCalldata](#encodebulkbuylistingspartialfillcalldata)  | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                                                                      |
| [bulkAcceptOffers](#bulk-accept-offers)                      | [encodeBulkAcceptOffersCalldata](#encodebulkacceptofferscalldata)                      | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         |
| [bulkAcceptOffersWithFeesOnTop](#bulk-accept-offers)         | [encodeBulkAcceptOffersWithFeesOnTopCalldata](#encodebulkacceptofferswithfeesontopcalldata)         | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         | 
| [bulkAcceptOffersCosigned](#bulk-accept-offers)              | [encodeBulkAcceptOffersCosignedCalldata](#encodebulkacceptofferscosignedcalldata)              | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [bulkAcceptOffersCosignedWithFeesOnTop](#bulk-accept-offers) | [encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata](#encodebulkacceptofferscosignedwithfeesontopcalldata) | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [bulkAcceptOffersPartialFill](#bulk-accept-offers) | [encodeBulkAcceptOffersPartialFillCalldata](#encodebulkacceptofferspartialfillcalldata) | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [sweepCollection](#sweep-collection)                         | [encodeSweepCollectionCalldata](#encodesweepcollectioncalldata)                       | [SaleApproval](#sale-approval)                                                                                                                               |
| [sweepCollectionWithFeeOnTop](#sweep-collection)             | [encodeSweepCollectionWithFeeOnTopCalldata](#encodesweepcollectionwithfeeontopcalldata)           | [SaleApproval](#sale-approval)                                                                                                                               | 
| [sweepCollectionCosigned](#sweep-collection)                 | [encodeSweepCollectionCosignedCalldata](#encodesweepcollectioncosignedcalldata)               | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [sweepCollectionCosignedWithFeeOnTop](#sweep-collection)     | [encodeSweepCollectionCosignedWithFeeOnTopCalldata](#encodesweepcollectioncosignedwithfeeontopcalldata)   | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |

### Buy Listing

Exchanges should call `buyListing` when a taker wants to purchase a single listing using a UX analogous to "Buy Now".  There are five variations of `buyListing`.

`buyListing` - To be used when the taker fills a standard sell order and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top.

`buyListingWithFeeOnTop` - To be used when the taker fills a standard sell order via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

`buyListingCosigned` - To be used when the taker fills a co-signed sell order and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top. 

`buyListingCosignedWithFeeOnTop` - To be used when the taker fills a co-signed sell order via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

`buyListingPartialFill` - To be used when the taker fills any kind of sell order where OrderProtocol is `ERC1155_FILL_PARTIAL` with or without a fee on top.

*Note: The taker/buyer (`msg.sender`) pays for the item and any fee on top when applicable.  Because the `buyListing` function is payable, both native or ERC-20 payment methods are accepted.*

### Accept Offer

Exchanges should call `acceptOffer` when a taker wants to sell a single item that matches an offer made by a prospective buyer.  The kinds of offers are currently supported by cPort:

1. Item Offer - An offer made on a specific collection where only one specific token id can be used to fill the order.
2. Collection Offer - An offer made on a specific collection where any token id can be used to fill the order.
3. Token Set Offer - An offer made on a specific collection where any token id contained in a specified subset of token ids can be used to fill the order.

There are five variations of `acceptOffer`.

`acceptOffer` - To be used when the taker fills a standard buy order (offer) and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top.

`acceptOfferWithFeeOnTop` - To be used when the taker fills a standard buy order (offer) via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

`acceptOfferCosigned` - To be used when the taker fills a co-signed buy order (offer) and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top. 

`acceptOfferCosignedWithFeeOnTop` - To be used when the taker fills a co-signed buy order (offer) via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

`acceptOfferPartialFill` - To be used when the taker fills any kind of buy order (offer) where OrderProtocol is `ERC1155_FILL_PARTIAL` with or without a fee on top.

*Note: The taker/seller (`msg.sender`) pays for the fee on top when applicable.  The maker/buyer pays the cost of the filled item.  Because the `acceptOffer` function is not payable, only ERC-20 payment methods are accepted.*

### Bulk Buy Listings

Exchanges should call `bulkBuyListings` when a taker wants to purchase more than one listing using a UX analagous to a "Shopping Cart".  This allows a taker to select many NFTs across different collections or with varying payment methods and fill all of the listings at once.  There are five variations of `bulkBuyListings`.

`bulkBuyListings` - To be used when the taker fills a set of orders that includes only standard sell orders, none of which includes fees on top.

`bulkBuyListingsWithFeesOnTop` - To be used when the taker fills a set of orders that includes only standard sell orders, at least one of which includes a fee on top.  

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*

`bulkBuyListingsCosigned` - To be used when the taker fills a set of orders that includes at least one co-signed sell order, and none of the orders includes fees on top.

- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

`bulkBuyListingsCosignedWithFeesOnTop` - To be used when the taker fills a set of orders that includes at least one co-signed sell order, and at least one order includes a fee on top.

`bulkBuyListingsPartialFill` - To be used when the taker fills a set of orders that includes at least one sell order where OrderProtocol is `ERC1155_FILL_PARTIAL`.

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*
- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

### Bulk Accept Offers

Exchanges should call `bulkAcceptOffers` when a taker wants to accept/fill more than one offer at once.  This allows a taker to sell multiple items they own across one or more collections in a single transaction.  The kinds of offers are currently supported by cPort:

1. Item Offer - An offer made on a specific collection where only one specific token id can be used to fill the order.
2. Collection Offer - An offer made on a specific collection where any token id can be used to fill the order.
3. Token Set Offer - An offer made on a specific collection where any token id contained in a specified subset of token ids can be used to fill the order.

There are five variations of `bulkAcceptOffers`. 

`bulkAcceptOffers` - To be used when the taker fills a set of orders that includes only standard buy orders (offers), none of which includes fees on top.

`bulkAcceptOffersWithFeesOnTop` - To be used when the taker fills a set of orders that includes only standard buy orders (offers), at least one of which includes a fee on top.

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*

`bulkAcceptOffersCosigned` - To be used when the taker fills a set of orders that includes at least one co-signed buy order (offer), and none of the orders includes fees on top.

- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

`bulkAcceptOffersCosignedWithFeesOnTop` - To be used when the taker fills a set of orders that includes at least one co-signed buy order (offer), and at least one order includes a fee on top.

`bulkAcceptOffersPartialFill` - To be used when the taker fills a set of orders that includes at least one buy order (offer) where OrderProtocol is `ERC1155_FILL_PARTIAL`.

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*
- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

### Sweep Collection

Exchanges should call `sweepCollection` (a more gas efficient form of `bulkBuyListings`) when a taker wants to purchase more than similar listings.  A common UX is the "Collection Sweep" UX where the taker specifies a number of items from a collection they want to buy, with some pricing limits.  

For a sweep to be filled, all items in the sweep order must share the following commonalities:

1. All sell orders fillable in the sweep must be from the same collection.
3. All sell orders fillable in the sweep must use the same method of payment.
5. All sell orders fillable in the sweep must specify the same beneficiary of the NFT.

When filling sweep orders, the following fields can be different for each filled item:

1. Maker
2. Marketplace
3. Token Id
4. Amount
5. Item Price
6. Nonce (for standard orders)
7. Expiration
8. Marketplace Fee Numerator
9. Max Royalty Fee Numerator

There are four variations of `sweepCollection`.

`sweepCollection` - To be used when the taker fills a set of orders that includes only standard sell orders with no fee on top.

`sweepCollectionWithFeesOnTop` - To be used when the taker fills a set of orders that includes only standard sell orders with a single fee on top.

- *Note that each sweep order defines a single fee on top.*

`sweepCollectionCosigned` - To be used when the taker fills a set of orders that includes at least one co-signed sell order with no fee on top.

- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

`sweepCollectionCosignedWithFeesOnTop` - To be used when the taker fills a set of orders that includes at least one co-signed sell order.  Each sweep order defines a single fee on top.  

- *Note that each sweep order defines a single fee on top.*
- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

*Note: The taker/buyer (`msg.sender`) pays for the items and any fee on top when applicable.  Because the `sweepCollection` function is payable, both native or ERC-20 payment methods are accepted.*

*Note: For the most gas-efficient collection sweeps, marketplaces should make a best effort to group orders in the array by marketplace address, seller, and royalty recipient.*

## Encoding Function Call Parameters

In order to not overflow smart contract bytecode size limits, cPort is split into smaller library modules.  When making calls to cPort, these calls are forwarded to the corresponding module and implementation function using `DELEGATECALL`.  For gas efficiency purposes, the function calldata must be passed in as a raw calldata byte array.  cPort is deployed with a helper contract called the cPortEncoder.  It accepts the expected function implementation parameters and encodes them as a single calldata byte array that should be passed into cPort when making calls to fill orders.  The subsections below detail each cPortEncoder function.

### encodeBuyListingCalldata

Used to encode calldata for cPort `buyListing` function.

```solidity
function encodeBuyListingCalldata(
        address cPortAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) external view returns (bytes memory);
```

### encodeBuyListingWithFeeOnTopCalldata

Used to encode calldata for cPort `buyListingWithFeeOnTop` function.

```solidity
function encodeBuyListingWithFeeOnTopCalldata(
        address cPortAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        FeeOnTop memory feeOnTop) external view returns (bytes memory);
```

### encodeBuyListingCosignedCalldata

Used to encode calldata for cPort `buyListingCosigned` function.

```solidity
function encodeBuyListingCosignedCalldata(
        address cPortAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        Cosignature memory cosignature) external view returns (bytes memory);
```

### encodeBuyListingCosignedWithFeeOnTopCalldata

Used to encode calldata for cPort `buyListingCosignedWithFeeOnTop` function.

```solidity
function encodeBuyListingCosignedWithFeeOnTopCalldata(
        address cPortAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop) external view returns (bytes memory);
```

### encodeBuyListingPartialFillCalldata

Used to encode calldata for cPort `buyListingPartialFill` function.

```solidity
function encodeBuyListingPartialFillCalldata(
        address cPortAddress, 
        FillAmounts memory fillAmounts,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop) external view returns (bytes memory);
```

### encodeAcceptOfferCalldata

Used to encode calldata for cPort `acceptOffer` function.

```solidity
function encodeAcceptOfferCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof) external view returns (bytes memory);
```

*Note: When filling an item offer, `isCollectionLevelOffer` MUST be set to `false`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

### encodeAcceptOfferWithFeeOnTopCalldata

Used to encode calldata for cPort `acceptOfferWithFeeOnTop` function.

```solidity
function encodeAcceptOfferWithFeeOnTopCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        FeeOnTop memory feeOnTop) external view returns (bytes memory);
```

*Note: When filling an item offer, `isCollectionLevelOffer` MUST be set to `false`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

### encodeAcceptOfferCosignedCalldata

Used to encode calldata for cPort `acceptOfferCosigned` function.

```solidity
function encodeAcceptOfferCosignedCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature) external view returns (bytes memory);
```

*Note: When filling an item offer, `isCollectionLevelOffer` MUST be set to `false`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

### encodeAcceptOfferCosignedWithFeeOnTopCalldata

Used to encode calldata for cPort `acceptOfferCosignedWithFeeOnTop` function.

```solidity
function encodeAcceptOfferCosignedWithFeeOnTopCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop) external view returns (bytes memory);
```

*Note: When filling an item offer, `isCollectionLevelOffer` MUST be set to `false`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

### encodeAcceptOfferPartialFillCalldata

Used to encode calldata for cPort `acceptOfferPartialFill` function.

```solidity
function encodeAcceptOfferPartialFillCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        FillAmounts memory fillAmounts,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop) external view returns (bytes memory);
```

*Note: When filling an item offer, `isCollectionLevelOffer` MUST be set to `false`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOffer` MUST be set to `true`, and `tokenSetProof` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

### encodeBulkBuyListingsCalldata

Used to encode calldata for cPort `bulkBuyListings` function.

```solidity
function encodeBulkBuyListingsCalldata(
        address cPortAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray` and `signatures` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`.*

### encodeBulkBuyListingsWithFeesOnTopCalldata

Used to encode calldata for cPort `bulkBuyListingsWithFeesOnTop` function.

```solidity
function encodeBulkBuyListingsWithFeesOnTopCalldata(
        address cPortAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        FeeOnTop[] calldata feesOnTop) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, and `feesOnTop` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]` and `feesOnTop[index]`.*

*Note: As fees on top may not apply to all orders being filled, `feesOnTop[index]` MUST be set to the empty `FeeOnTop({recipient: address(0), amount: 0})` for any order that is not subject to a fee on top.*

### encodeBulkBuyListingsCosignedCalldata

Used to encode calldata for cPort `bulkBuyListingsCosigned` function.

```solidity
function encodeBulkBuyListingsCosignedCalldata(
        address cPortAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, and `cosignatures` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]` and `cosignatures[index]`.*

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

### encodeBulkBuyListingsCosignedWithFeesOnTopCalldata

Used to encode calldata for cPort `bulkBuyListingsCosignedWithFeesOnTop` function.

```solidity
function encodeBulkBuyListingsCosignedWithFeesOnTopCalldata(
        address cPortAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures,
        FeeOnTop[] calldata feesOnTop) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `cosignatures`, and `feesOnTop` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `cosignatures[index]`, and `feesOnTop[index]`.*

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

*Note: As fees on top may not apply to all orders being filled, `feesOnTop[index]` MUST be set to the empty `FeeOnTop({recipient: address(0), amount: 0})` for any order that is not subject to a fee on top.*

### encodeBulkBuyListingsPartialFillCalldata

Used to encode calldata for cPort `bulkBuyListingsPartialFill` function.

```solidity
function encodeBulkBuyListingsPartialFillCalldata(
        address cPortAddress, 
        FillAmounts[] calldata fillAmountsArray,
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures,
        FeeOnTop[] calldata feesOnTop) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `cosignatures`, and `feesOnTop` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `cosignatures[index]`, and `feesOnTop[index]`.*

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

*Note: As fees on top may not apply to all orders being filled, `feesOnTop[index]` MUST be set to the empty `FeeOnTop({recipient: address(0), amount: 0})` for any order that is not subject to a fee on top.*

### encodeBulkAcceptOffersCalldata

Used to encode calldata for cPort `bulkAcceptOffers` function.

```solidity
function encodeBulkAcceptOffersCalldata(
        address cPortAddress, 
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures,
        TokenSetProof[] calldata tokenSetProofsArray) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `tokenSetProofsArray`, and `isCollectionLevelOfferArray` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `tokenSetProofsArray[index]`, and `isCollectionLevelOfferArray[index]`.*

*Note: When filling an item offer, `isCollectionLevelOfferArray[index]` MUST be set to `false`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

### encodeBulkAcceptOffersWithFeesOnTopCalldata

Used to encode calldata for cPort `bulkAcceptOffersWithFeesOnTop` function.

```solidity
function encodeBulkAcceptOffersWithFeesOnTopCalldata(
        address cPortAddress, 
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures,
        TokenSetProof[] calldata tokenSetProofsArray,
        FeeOnTop[] calldata feesOnTopArray) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `tokenSetProofsArray`, `isCollectionLevelOfferArray`, and `feesOnTopArray` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `tokenSetProofsArray[index]`, `isCollectionLevelOfferArray[index]`, and `feesOnTopArray[index]`.*

*Note: When filling an item offer, `isCollectionLevelOfferArray[index]` MUST be set to `false`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

*Note: As fees on top may not apply to all orders being filled, `feesOnTop[index]` MUST be set to the empty `FeeOnTop({recipient: address(0), amount: 0})` for any order that is not subject to a fee on top.*

### encodeBulkAcceptOffersCosignedCalldata

Used to encode calldata for cPort `bulkAcceptOffersCosigned` function.

```solidity
function encodeBulkAcceptOffersCosignedCalldata(
        address cPortAddress, 
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures,
        TokenSetProof[] calldata tokenSetProofsArray,
        Cosignature[] calldata cosignaturesArray) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `tokenSetProofsArray`, `isCollectionLevelOfferArray`, and `cosignatures` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `tokenSetProofsArray[index]`, `isCollectionLevelOfferArray[index]`, and `cosignatures[index]`.*

*Note: When filling an item offer, `isCollectionLevelOfferArray[index]` MUST be set to `false`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

### encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata

Used to encode calldata for cPort `bulkAcceptOffersCosignedWithFeesOnTop` function.

```solidity
function encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
        address cPortAddress, 
        bool[] memory isCollectionLevelOfferArray,
        Order[] memory saleDetailsArray,
        SignatureECDSA[] memory signatures,
        TokenSetProof[] memory tokenSetProofsArray,
        Cosignature[] memory cosignaturesArray,
        FeeOnTop[] memory feesOnTopArray) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `tokenSetProofsArray`, `isCollectionLevelOfferArray`, `cosignatures`, and `feesOnTopArray` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `tokenSetProofsArray[index]`, `isCollectionLevelOfferArray[index]`, `cosignatures[index]`, and `feesOnTopArray[index]`.*

*Note: When filling an item offer, `isCollectionLevelOfferArray[index]` MUST be set to `false`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

*Note: As fees on top may not apply to all orders being filled, `feesOnTop[index]` MUST be set to the empty `FeeOnTop({recipient: address(0), amount: 0})` for any order that is not subject to a fee on top.*

### encodeBulkAcceptOffersPartialFillCalldata

Used to encode calldata for cPort `bulkAcceptOffersPartialFill` function.

```solidity
function encodeBulkAcceptOffersPartialFillCalldata(
        address cPortAddress, 
        bool[] memory isCollectionLevelOfferArray,
        FillAmounts[] memory fillAmountsArray,
        Order[] memory saleDetailsArray,
        SignatureECDSA[] memory signatures,
        TokenSetProof[] memory tokenSetProofsArray,
        Cosignature[] memory cosignaturesArray,
        FeeOnTop[] memory feesOnTopArray) external view returns (bytes memory);
```

*Note: The length of the `saleDetailsArray`, `signatures`, `tokenSetProofsArray`, `isCollectionLevelOfferArray`, `cosignatures`, and `feesOnTopArray` MUST match and MUST be non-zero. `saleDetailsArray[index]` MUST correspond to `signatures[index]`, `tokenSetProofsArray[index]`, `isCollectionLevelOfferArray[index]`, `cosignatures[index]`, and `feesOnTopArray[index]`.*

*Note: When filling an item offer, `isCollectionLevelOfferArray[index]` MUST be set to `false`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a collection offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST be set to the empty `TokenSetProof({rootHash: bytes32(0), proof: bytes32[](0)})`.

*Note: When filling a token set offer, `isCollectionLevelOfferArray[index]` MUST be set to `true`, and `tokenSetProofsArray[index]` MUST contain the root hash of the merkle tree signed by the offer maker, and the proof must be the valid merkle proof for the collection and token id being filled.

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

*Note: As fees on top may not apply to all orders being filled, `feesOnTop[index]` MUST be set to the empty `FeeOnTop({recipient: address(0), amount: 0})` for any order that is not subject to a fee on top.*

### encodeSweepCollectionCalldata

Used to encode calldata for cPort `sweepCollection` function.

```solidity
function encodeSweepCollectionCalldata(
        address cPortAddress, 
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signatures) external view returns (bytes memory);
```

*Note: The length of the `items` and `signatures` MUST match and MUST be non-zero. `items[index]` MUST correspond to `signatures[index]`.*

### encodeSweepCollectionWithFeeOnTopCalldata

Used to encode calldata for cPort `sweepCollectionWithFeeOnTop` function.

```solidity
function encodeSweepCollectionWithFeeOnTopCalldata(
        address cPortAddress, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signatures) external view returns (bytes memory);
```

*Note: The length of the `items` and `signatures` MUST match and MUST be non-zero. `items[index]` MUST correspond to `signatures[index]`.*

*Note: A single fee on top may be applied to the entire sweep order.*

### encodeSweepCollectionCosignedCalldata

Used to encode calldata for cPort `sweepCollectionCosigned` function.

```solidity
function encodeSweepCollectionCosignedCalldata(
        address cPortAddress, 
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures) external view returns (bytes memory);
```

*Note: The length of the `items`, `signatures`, and `cosignatures` MUST match and MUST be non-zero. `items[index]` MUST correspond to `signatures[index]` and `cosignatures[index]`.*

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

### encodeSweepCollectionCosignedWithFeeOnTopCalldata

Used to encode calldata for cPort `sweepCollectionCosignedWithFeeOnTop` function.

```solidity
function encodeSweepCollectionCosignedWithFeeOnTopCalldata(
        address cPortAddress, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures) external view returns (bytes memory);
```

*Note: The length of the `items`, `signatures`, and `cosignatures` MUST match and MUST be non-zero. `items[index]` MUST correspond to `signatures[index]` and `cosignatures[index]`.*

*Note: As co-signatures may not apply to all orders being filled, `cosignatures[index]` MUST be set to the empty `Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)})` for any order that is not co-signed.*

*Note: A single fee on top may be applied to the entire sweep order.*

### encodeRevokeSingleNonceCalldata

Used to encode calldata for cPort `revokeSingleNonce` function (on-chain order cancellation).

```solidity
function encodeRevokeSingleNonceCalldata(address cPortAddress, uint256 nonce) external view returns (bytes memory);
```

## Maker Signature Formats

Makers sign orders in a human readable EIP-712 typed data format.  Exchanges that integrate cPort are responsible for correctly prompting makers to sign the appropriate messages at order creation time.  The typed data formats of each order vary depending on the order type.  The following subsections details the various typed data formats compatible with cPort.

All cPort typed data signatures share the same EIP-712 domain:

```js
EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)
```

***Note: One of the fields that must always be signed and acknowledged by the order maker is the maximum royalty fee that will be deducted from the proceeds. Upon each signature request, this max royalty fee amount should be queried from the NFT contract using the EIP-2981 `royaltyInfo` function. In case a collection does not implement `royaltyInfo`, the query logic should fallback to check the cPort contract to determine if a royalty backfill has been supplied by the collection creator/owner using the `collectionRoyaltyBackfillSettings` function. If the on-chain royalty increases after the listing has been signed, sales will not execute. However, if the on-chain royalty is reduced, the reduced royalty fee is paid during the sale.***

### Sale Approval

When listing an individual NFT for sale, with no co-signature required, the seller/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
SaleApproval(uint8 protocol,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)
```

### Sale Approval (Cosigned)

When listing an individual NFT for sale, with a co-signature required, the seller/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
SaleApprovalCosigned(uint8 protocol,address cosigner,address seller,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)
```

### Item Offer Approval

When making an offer on a specific NFT, with no co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
ItemOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)
```

### Item Offer Approval (Cosigned)

When making an offer on a specific NFT, with a co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
ItemOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator)
```

### Collection Offer Approval

When making an offer on any NFT in a specific collection, with no co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
CollectionOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce)
```

### Collection Offer Approval (Cosigned)

When making an offer on any NFT in a specific collection, with a co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
CollectionOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator)
```

### Token Set Offer Approval

When making an offer on a subset of NFTs in a specific collection, with no co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
TokenSetOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 nonce,uint256 masterNonce,bytes32 tokenSetMerkleRoot)
```

### Token Set Offer Approval (Cosigned)

When making an offer on a subset of NFTs in a specific collection, with a co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
TokenSetOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,bytes32 tokenSetMerkleRoot)
```

### Cosignature Format

All cosigned listings and offers require a secondary signature to be provided at fill-time/execution time.  The same cosignature format applies to all cosigned maker signatures, and takes a cosigner expiration and the maker's signature v, r, s components as typed data inputs.  Note: for security purposes, co-signatures must always be signed by EOA co-signers.  Furthermore, cosignature expiration times should be relatively short.  A cosignature expiration time between 5 and 10 minutes is suggested.  If the expiration time is too short, transactions may fail because the expiration time elapses before a transaction has been confirmed.  However, if the expiration time is too long a leak of the co-signature could be executed well into the future. 

```js
Cosignature(uint8 v,bytes32 r,bytes32 s,uint256 expiration,address taker)
```

## Data Structures

The following subsections detail the data structures needed for the creation of and filling of orders in cPort.  Note that [maker signature formats vary by order-type](#maker-signature-formats).

### SignatureECDSA

| V     | R       | S       |
|-------|---------|---------|
| uint8 | bytes32 | bytes32 |

- V: The `v` component of an ECDSA signature.
- R: The `r` component of an ECDSA signature.
- S: The `s` component of an ECDSA signature.

*[Note: For a detailed explanation of ECDSA signatures read this article](https://medium.com/mycrypto/the-magic-of-digital-signatures-on-ethereum-98fe184dc9c7).*

### Cosignature

| Signer  | Taker   | Expiration | V     | R       | S       |
|---------|---------|------------|-------|---------|---------|
| address | address | uint256    | uint8 | bytes32 | bytes32 |

- Signer: The co-signer designated and acknowledged in the order maker's signature approving the order.  MUST be an EOA, or `address(0)` when the co-signature is empty.  It is expected that marketplaces implementing co-signing MUST expose an API enabling the taker to retrieve a co-signature approving the fill of co-signed orders.
- Taker: The address of the account filling the co-signed order.  May be an EOA or Smart Contract account, or `address(0)` when the co-signature is empty.  A marketplace's co-signing API service MUST acknowledge the taker address in the co-signature.
- Expiration: The unix timestamp (in seconds) when the co-signature expires, or `0` when the co-signature is empty.  A marketplace's co-signing API should use the current unix timestamp and add a validity time that is acknowledged in the co-signature.  If the validity time is too short, there might not be sufficient time for the fill transaction to be confirmed on-chain, possibly resulting in failed fill transactions.  However, the validity time should also not be too long, as a taker could sit on a fill transaction for quite a while.  It is left up to the marketplace to determine an appropriate validity time.
- V: The `v` component of the co-signer's signature.  
- R: The `r` component of the co-signer's signature.
- S: The `s` component of the co-sigaer's signature.

*Note: The co-signature is generated when the co-signer creates an ECDSA signature of the [Cosignature](#cosignature-format) typed data message.*

### FeeOnTop

A `fee on top` is typically reserved for a marketplace or specialized wallet that found the order filled by the taker.  This taker marketplace fee is an optional fee paid by the taker in excess of the items' prices in one or more orders.  When the maker and taker marketplace is the same, it is strongly encouraged not to apply this fee, as the fee can already be assessed in the maker fee.  Note that the `fee on top` is paid in the same currency as the order's payment method.

| Recipient | Amount  |
|-----------|---------|
| address   | uint256 |

- Recipient: The address to which the fee is paid, or `address(0)` when the fee is empty.
- Amount: The absolute amount of the fee, in wei, or `0` when the fee is empty. Note that the fee amount is not permitted to exceed the item sale price of any given order.

### TokenSetProof

Token set proofs are required to fill token set offers on a collection.  A token set offer is a merkle tree where the leaf data is the keccak256 hash of the collection address and token id.

```
leafHash = keccak256(abi.encode(collectionAddress, tokenId));
```

| Root Hash | Proof     |
|-----------|-----------|
| bytes32   | bytes32[] |

- Root Hash: The root hash of the merkle tree containing 2 or more collection/token id leaf nodes, or `bytes32(0)` when the order being filled is not a token set offer.
- Proof: The merkle proof for the specific collection/token id leaf node being filled, , or `bytes32[](0)` when the order being filled is not a token set offer.

### Order

This data structure is used to fill all single and bulk orders that are not sweep orders.

| Protocol | Maker   | Beneficiary | Marketplace | Payment Method | Token Address | Token Id | Amount  | Item Price | Nonce   | Expiration | Marketplace Fee Numerator | Max Royalty Fee Numerator |
|----------|---------|-------------|-------------|----------------|---------------|----------|---------|------------|---------|------------|---------------------------|---------------------------|
|uint8     | address | address     | address     | address        | address       | uint256  | uint256 | uint256    | uint256 | uint256    | uint256                   | uint256                   |

- Protocol: `0` for ERC721 or `1` for ERC1155 collections.
- Maker: The address of the account the created the order.  May be an EOA or Smart Contract account. When the order was a listing, the maker is the seller of the item.  When the order was an offer, the maker is the buyer of the item.
- Beneficiary: The address of the account that receives the item when the order is filled.  When the order was a listing, the taker (`msg.sender`) can either buy with themselves as the beneficiary, or another account.  When the order was an offer, the maker would be the buyer, and the beneficiary address can either be the maker's account or another account. For example, the buyer could be a user's hot wallet, and the beneficiary could be the user's cold storage wallet.
- Marketplace: The address to which the primary (maker) marketplace fee should be paid, or `address(0)` if the maker marketplace charges no platform fees.  Note that for collections that offer non-exclusive royalty bounties, the maker marketplace also receives a royalty bounty paid out of creator royalties.  For collections that offer exclusive royalty bounties, the maker marketplace receives a royalty bounty only if it matches the exclusive royalty bounty recipient designated by the collection creator.
- Payment Method: The address of the ERC-20 coin used to fill the trade, or `address(0)` for the native currency of the chain the trade executed on.  For example, `address(0)` denotes ETH on ETH Mainnet, and Matic on Polygon Mainnet.
- Token Address: The address of the collection.
- Token Id: The id of the token (if collection is ERC721), or the token type id of the token (if collection is ERC1155).
- Amount: The number of tokens. MUST be `1` if collection is ERC721, and MUST be greater than or equal to `1` if collection is ERC1155.
- Item Price: The price of the token(s) in the order.
- Nonce: An id unique to the order that helps prevent replay attacks.  Nonce applies only to standard signed orders, and may not be re-used.  For co-signed order, nonce should be set to `0`. Note: It is easier to generate a random nonce than attempt to keep track of nonces that have been used.  However, be aware that a gas optimization is in place such that filled or cancelled nonces are tracked in a bitmap. 0-255, 256-511, 512-767, etc all fall within the same slot, so if possible it is ideal to track used nonces through fill events and attempt to use sequential nonces starting at zero.  Because each maker address has its own set of nonces generated for gasless listings, it is possible that marketplaces will have no knowledge of nonces used in outstanding order signatures.  Ideally, a shared service could be created and utilized by all marketplaces that issues nonces for orders.
- Expiration: The unix timestamp (in seconds) when the maker's order signature expires.  A marketplace's order making API should use the current unix timestamp and add a user-defined validity time that is acknowledged in the maker's signature.  
- Marketplace Fee Numerator: Marketplace fee percentage in bips. Should be in range 0-10,000, as denominator is 10,000. 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
- Max Royalty Fee Numerator: Maximum approved royalty fee percentage in bips.  Should be in range 0-10,000, as denominator is 10,000. 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.  When requesting the order signature from the order maker, the marketplace MUST first attempt to read the royalties for the individual token using the EIP-2981 `royaltyInfo` function call on the collection.  If `royaltyInfo` raises an exception (likely because it is unimplemented), the marketplace MUST attempt to determine if royalties have been backfilled  by calling the `collectionRoyaltyBackfillSettings` function on cPort.  If no on-chain royalties are present, this may be set to `0`.

### Sweep Order

This data structure is used to fill sweep orders, and represents the shared values that apply to all order in the sweep.

| Protocol | Token Address | Payment Method | Beneficiary |
|----------| --------------|----------------|-------------|
| uint8    | address       | address        | address     |

- Protocol: `0` for ERC721 or `1` for ERC1155 collections.
- Token Address: The address of the collection.
- Payment Method: The address of the ERC-20 coin used to fill the trade, or `address(0)` for the native currency of the chain the trade executed on.  For example, `address(0)` denotes ETH on ETH Mainnet, and Matic on Polygon Mainnet.
- Beneficiary: The address of the account that receives the item when the order is filled.

### Sweep Item

This data structure is used to fill sweep orders, and represents the values that apply to individual orders in the sweep.

| Maker   | Marketplace | Token Id | Amount     | Item Price | Nonce   | Expiration | Marketplace Fee Numerator | Max Royalty Fee Numerator |
|---------|-------------|----------|------------|------------|---------|------------|---------------------------|---------------------------|
| address | address     | uint256  | uint256    | uint256    | uint256 | uint256    | uint256                   | uint256                   |

- Maker: The address of the account the created the order.  May be an EOA or Smart Contract account. When the order was a listing, the maker is the seller of the item.  When the order was an offer, the maker is the buyer of the item.
- Marketplace: The address to which the primary (maker) marketplace fee should be paid, or `address(0)` if the maker marketplace charges no platform fees.  Note that for collections that offer non-exclusive royalty bounties, the maker marketplace also receives a royalty bounty paid out of creator royalties.  For collections that offer exclusive royalty bounties, the maker marketplace receives a royalty bounty only if it matches the exclusive royalty bounty recipient designated by the collection creator.
- Token Id: The id of the token (if collection is ERC721), or the token type id of the token (if collection is ERC1155).
- Amount: The number of tokens. MUST be `1` if collection is ERC721, and MUST be greater than or equal to `1` if collection is ERC1155.
- Item Price: The price of the token(s) in the order.
- Nonce: An id unique to the order that helps prevent replay attacks.  Nonce applies only to standard signed orders, and may not be re-used.  For co-signed order, nonce should be set to `0`. Note: It is easier to generate a random nonce than attempt to keep track of nonces that have been used.  However, be aware that a gas optimization is in place such that filled or cancelled nonces are tracked in a bitmap. 0-255, 256-511, 512-767, etc all fall within the same slot, so if possible it is ideal to track used nonces through fill events and attempt to use sequential nonces starting at zero.  Because each maker address has its own set of nonces generated for gasless listings, it is possible that marketplaces will have no knowledge of nonces used in outstanding order signatures.  Ideally, a shared service could be created and utilized by all marketplaces that issues nonces for orders.
- Expiration: The unix timestamp (in seconds) when the maker's order signature expires.  A marketplace's order making API should use the current unix timestamp and add a user-defined validity time that is acknowledged in the maker's signature.  
- Marketplace Fee Numerator: Marketplace fee percentage in bips. Should be in range 0-10,000, as denominator is 10,000. 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
- Max Royalty Fee Numerator: Maximum approved royalty fee percentage in bips.  Should be in range 0-10,000, as denominator is 10,000. 0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.  When requesting the order signature from the order maker, the marketplace MUST first attempt to read the royalties for the individual token using the EIP-2981 `royaltyInfo` function call on the collection.  If `royaltyInfo` raises an exception (likely because it is unimplemented), the marketplace MUST attempt to determine if royalties have been backfilled by calling the `collectionRoyaltyBackfillSettings` function on cPort.  If no on-chain royalties are present, this may be set to `0`.

## Recommended Marketplace Workflows

This section details the suggested workflows for implementing user facing trading features compatible with cPort.

### Making Orders

#### Making a Listing

1. Maker browses their items and selects an item to list for sale.
2. Maker inputs: Listing Currency/Payment Method, Price, Validity Time.
3. Maker prompted to acknowledge/accept maker marketplace fee percentage and on-chain royalty fee (display sale price, fees, and net seller proceeds)
4. Maker prompted to decide on standard order (on-chain cancellations) or co-signed order (gasless cancellation). For standard orders, a nonce is generated.  For co-signed orders, nonce not required.
5. Signature Prompt for either [SaleApproval](#sale-approval) or [SaleApprovalCosigned](#sale-approval-cosigned)
6. Order and signature added to order book.

#### Making An Item Offer

1. Maker browses a collection and selects a single item to make an offer on.
2. Maker inputs: Offer Currency/Payment Method, Price, Validity Time, Beneficiary.
3. Maker prompted to acknowledge/accept maker marketplace fee percentage (display sale price, fees, and net seller proceeds)
4. Maker prompted to decide on standard order (on-chain cancellations) or co-signed order (gasless cancellation). For standard orders, a nonce is generated.  For co-signed orders, nonce not required.
5. Signature Prompt for either [ItemOfferApproval](#item-offer-approval) or [ItemOfferApprovalCosigned](#item-offer-approval-cosigned)
6. Order and signature added to order book.

#### Making A Collection Offer

1. Maker browses a collection and chooses to make a collection offer for any item in the collection.
2. Maker inputs: Offer Currency/Payment Method, Price, Validity Time, Beneficiary.
3. Maker prompted to acknowledge/accept maker marketplace fee percentage (display sale price, fees, and net seller proceeds).
4. Maker prompted to decide on standard order (on-chain cancellations) or co-signed order (gasless cancellation). For standard orders, a nonce is generated.  For co-signed orders, nonce not required.
5. Signature Prompt for either [CollectionOfferApproval](#collection-offer-approval) or [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned)
6. Order and signature added to order book.

#### Making A Token Set Collection Offer

This can take a few forms depending on how the marketplace chooses to implement this.  This can take the form of offers on traits, offers on tokens that have not been stolen, etc.

1. Maker browses a collection and chooses some criteria for token ids to make an offer on.  The marketplace generates a merkle tree of tokens based on the criteria.
2. Maker inputs: Offer Currency/Payment Method, Price, Validity Time, Beneficiary.
3. Maker prompted to acknowledge/accept maker marketplace fee percentage (display sale price, fees, and net seller proceeds).
4. Maker prompted to acknowledge the set of tokens/merkle root.
5. Maker prompted to decide on standard order (on-chain cancellations) or co-signed order (gasless cancellation). For standard orders, a nonce is generated.  For co-signed orders, nonce not required.
6. Signature Prompt for either [TokenSetOfferApproval](#token-set-offer-approval) or [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned)
7. Order and signature added to order book.

### Cancelling Orders

#### Cancelling A Single Listing

1. Display maker's listings.
2. Maker selects a listing to cancel.
3. If standard order, maker confirms `revokeSingleNonce` transaction.  If co-signed order flag order as cancelled in DB and do not allow co-signing service to co-sign the order if requested.  Order should be hidden from future listing queries.

#### Cancelling A Single Offer

1. Display maker's offers.
2. Maker selects an offer to cancel.
3. If standard order, maker confirms `revokeSingleNonce` transaction.  If co-signed order flag order as cancelled in DB and do not allow co-signing service to co-sign the order if requested.  Order should be hidden from future offer queries.

#### Cancelling All Outstanding Standard Orders

1. If the maker chooses to cancel ALL outstanding standard listings and offers they have made, the maker simply needs to confirm a `revokeMasterNonce` transaction.  This should cancel/invalidate all prior orders that were not co-signed orders.

#### Cancelling All Outstanding Co-Signed Orders

1. The marketplace should flag all outstandingn orders for the user as cancelled in the DB.  The co-signing service should not return co-signatures for any of the cancelled orders, and the orders should be hidden from all future queries.

### Filling Orders

#### Filling A Single Listing (Buy Now)

1. Taker browses listings and chooses a listed item.
2. Taker selects "Buy Now".
3. Taker selects beneficiary (whether self or other account).
4. Taker prompted to review the details, including review and acknowledgement of fee on top when applicable.
5. If listing order was co-signed, client requests a co-signature for the listing.
6. The most applicable `buyListing` function should be called.  [Applicability Details](#buy-listing)
7. Marketplace calls the appropriate cPortEncoder function to generate the calldata to fill the order.
8. Wallet pops up a transaction confirmation of the applicable `buyListing` call.
9. Taker confirms or rejects the transaction through their wallet interface.

#### Filling A Batch Of Listings (Shopping Cart)

1. Taker browses listings and chooses several listed items (they may be from one or more collections).
2. Taker selects "Add To Shopping Cart" for each item.
3. Taker reviews cart and "Checks Out".
4. Taker selects beneficiary (whether self or other account).
5. Taker prompted to review the details, including review and acknowledgement of all fees on top when applicable.
6. For any co-signed listing orders, client requests co-signatures.
7. The most applicable `bulkBuyListings` function should be called.  [Applicability Details](#bulk-buy-listings)
8. Marketplace calls the appropriate cPortEncoder function to generate the calldata to bulk fill the orders.
9. Wallet pops up a transaction confirmation of the applicable `bulkBuyListings` call.
10. Taker confirms or rejects the transaction through their wallet interface.

#### Filling A Collection Sweep

1. Taker chooses "Sweep Collection" for the desired collection.
2. Taker specifies desired quantity and maximum price per item.
3. Taker selects beneficiary (whether self or other account).
4. Taker prompted to review the details, including review and acknowledgement of the fee on top when applicable.
5. For any co-signed listing orders, client requests co-signatures.
6. The most applicable `sweepCollection` function should be called. [Applicability Details](#sweep-collection)
7. Marketplace calls the appropriate cPortEncoder function to generate the calldata to fill the sweep.
8. Wallet pops up a transaction confirmation of the applicable `sweepCollection` call.
9. Taker confirms or rejects the transaction through their wallet interface.

#### Filling A Single Offer (Accept Offer)

1. Taker browser offers where the offer criteria matches items they own and chooses one.
2. Taker selects "Accept Offer".
3. Taker prompted to review the details, including review and acknowledgement of the current on-chain royalty fee, maker marketplace fee, and fee on top when applicable.
4. If the offer order was co-signed, client requests a co-signature for the offer.
5. The most applicable `acceptOffer` function should be called. [Applicability Details](#accept-offer)
6. Marketplace calls the appropriate cPortEncoder function to generate the calldata to fill the order.
7. Wallet pops up a transaction confirmation of the applicable `acceptOffer` call.
8. Taker confirms or rejects the transaction through their wallet interface.

#### Filling A Batch Of Offers (Offer Cart)

1. Taker browser offers where the offer criteria matches items they own and chooses several.
2. Taker selects "Add To Offer Cart" for each item.
3. Taker reviews cart and "Checks Out".
4. Taker prompted to review the details, including review and acknowledgement of the current on-chain royalty fees for each item, the maker marketplace fees for each item, and the fees on top when applicable.
5. For any co-signed offer orders, client requests co-signatures.
7. The most applicable `bulkAcceptOffers` function should be called.  [Applicability Details](#bulk-accept-offers)
8. Marketplace calls the appropriate cPortEncoder function to generate the calldata to bulk fill the orders.
9. Wallet pops up a transaction confirmation of the applicable `bulkAcceptOffers` call.
10. Taker confirms or rejects the transaction through their wallet interface.

***Note: There are other steps marketplaces may need to implement to prompt users in the workflow.  For instance: approving cPort to transfer NFTs and ERC-20 payments, prompting to wrap native currency or swap currencies when needed, or prompting buyers to perform a one-time signature to prove they are EOAs [for select ERC721-C security levels only].***