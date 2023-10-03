# Payment Processor V2 Exchange Integration Guide

## Glossary

- **Maker(s)**: Create buying or selling orders that are not carried out immediately.  For example, "sell NFT `A` at a price of $100" or "buy NFT `B` for $100".  This creates liquidity, meaning that it is easier for others to instantly buy or sell NFTs when the conditions are met.  When Bob lists an NFT he owns for sale, Bob is considered maker of the order.  Similarly, when Bob offers to buy an NFT, Bob is considered the maker of the order.
- **Taker(s)**: The entities that buy or sell instantly are called takers. In other words, the takers fill the orders created by the makers.  When Alice executes and order to buy Bob's listing, Alice is considered the taker of the order.  Similarly, when Alice accepts an offer from Bob to buy an NFT she owns, Alice is considered the taker of the order.
- **Listing**: An order to sell an NFT once filled by a taker.  Listings are gaslessly signed off-chain by the owner of the NFT.
- **Item Offer**: An order to buy a single, specific NFT once filled by a taker.  Item offers apply to exactly one specific token id in a collection.  Offers are gaslessly signed off-chain by one or more parties interested in purchasing the NFT.
- **Collection Offer**: An order to buy any NFT belonging to the same collection once filled by a taker.  Collection offers apply to any token id for a specific collection.  Offers are gaslessly signed off-chain by one or more parties interested in purchasing an NFT.
- **Token Set Offer**: An order to buy a single NFT from a subset of token ids in the same collection once filled by a taker.  Token set offers apply to a subset of token ids for a specific collection.  Offers are gaslessly signed off-chain by one or more parties interested in purchasing an NFT.
- **Standard Order**: Any listing or offer that may be filled directly by a taker.  Standard orders, when cancelled, must be cancelled on-chain by the order maker at their own gas expense.  Standard orders are not susceptible to censorship.
- **Cosigned Order**: Any listing or offer that must be cosigned by another party in order to be filled by a taker.  Cosigned orders, when cancelled, can be gaslessly cancelled off-chain.  Order-book providers that support cosigned orders must properly secure and automate the co-signing process.  The order-book provider must guarantee that no cosignature can be generated for a previously cancelled order.  Similarly, the order-book provider must guarantee availability of cosignatures to takers such that orders can always be filled uninterrupted. The use of cosigned orders are at the order maker's discretion.  Pros include cheaper, faster cancellation/replacement of orders without incurring transaction gas costs.  Cons include censorship/denial of service risks.

## Taker Operations / Functions

| Function                                                     | Parameter Encoding Function                         | Valid Maker Order Signature Input Type(s)                                                                                                                    |
|--------------------------------------------------------------|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [buyListing](#buy-listing)                                   | encodeBuyListingCalldata                            | [SaleApproval](#sale-approval)                                                                                                                               |
| [buyListingWithFeeOnTop](#buy-listing)                       | encodeBuyListingWithFeeOnTopCalldata                | [SaleApproval](#sale-approval)                                                                                                                               | 
| [buyListingCosigned](#buy-listing)                           | encodeBuyListingCosignedCalldata                    | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [buyListingCosignedWithFeeOnTop](#buy-listing)               | encodeBuyListingCosignedWithFeeOnTopCalldata        | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [acceptOffer](#accept-offer)                                 | encodeAcceptOfferCalldata                           | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         |
| [acceptOfferWithFeeOnTop](#accept-offer)                     | encodeAcceptOfferWithFeeOnTopCalldata               | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         | 
| [acceptOfferCosigned](#accept-offer)                         | encodeAcceptOfferCosignedCalldata                   | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [acceptOfferCosignedWithFeeOnTop](#accept-offer)             | encodeAcceptOfferCosignedWithFeeOnTopCalldata       | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [bulkBuyListings](#bulk-buy-listings)                        | encodeBulkBuyListingsCalldata                       | [SaleApproval](#sale-approval)                                                                                                                               |
| [bulkBuyListingsWithFeesOnTop](#bulk-buy-listings)           | encodeBulkBuyListingsWithFeesOnTopCalldata          | [SaleApproval](#sale-approval)                                                                                                                               | 
| [bulkBuyListingsCosigned](#bulk-buy-listings)                | encodeBulkBuyListingsCosignedCalldata               | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [bulkBuyListingsCosignedWithFeesOnTop](#bulk-buy-listings)   | encodeBulkBuyListingsCosignedWithFeesOnTopCalldata  | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                                                                      |
| [bulkAcceptOffers](#bulk-accept-offers)                      | encodeBulkAcceptOffersCalldata                      | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         |
| [bulkAcceptOffersWithFeesOnTop](#bulk-accept-offers)         | encodeBulkAcceptOffersWithFeesOnTopCalldata         | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval)         | 
| [bulkAcceptOffersCosigned](#bulk-accept-offers)              | encodeBulkAcceptOffersCosignedCalldata              | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [bulkAcceptOffersCosignedWithFeesOnTop](#bulk-accept-offers) | encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata | [ItemOfferApproval](#item-offer-approval), [CollectionOfferApproval](#collection-offer-approval), [TokenSetOfferApproval](#token-set-offer-approval), [ItemOfferApprovalCosigned](#item-offer-approval-cosigned), [CollectionOfferApprovalCosigned](#collection-offer-approval-cosigned), [TokenSetOfferApprovalCosigned](#token-set-offer-approval-cosigned) |
| [sweepCollection](#sweep-collection)                         | encodeSweepCollectionCalldata                       | [SaleApproval](#sale-approval)                                                                                                                               |
| [sweepCollectionWithFeeOnTop](#sweep-collection)             | encodeSweepCollectionWithFeeOnTopCalldata           | [SaleApproval](#sale-approval)                                                                                                                               | 
| [sweepCollectionCosigned](#sweep-collection)                 | encodeSweepCollectionCosignedCalldata               | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |
| [sweepCollectionCosignedWithFeeOnTop](#sweep-collection)     | encodeSweepCollectionCosignedWithFeeOnTopCalldata   | [SaleApproval](#sale-approval), [SaleApprovalCosigned](#sale-approval-cosigned)                                                                              |

### Buy Listing

Exchanges should call `buyListing` when a taker wants to purchase a single listing using a UX analogous to "Buy Now".  There are four variations of `buyListing`.

`buyListing` - To be used when the taker fills a standard sell order and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top.

`buyListingWithFeeOnTop` - To be used when the taker fills a standard sell order via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

`buyListingCosigned` - To be used when the taker fills a co-signed sell order and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top. 

`buyListingCosignedWithFeeOnTop` - To be used when the taker fills a co-signed sell order via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

*Note: The taker/buyer (`msg.sender`) pays for the item and any fee on top when applicable.  Because the `buyListing` function is payable, both native or ERC-20 payment methods are accepted.*

### Accept Offer

Exchanges should call `acceptOffer` when a taker wants to sell a single item that matches an offer made by a prospective buyer.  The kinds of offers are currently supported by Payment Processor:

1. Item Offer - An offer made on a specific collection where only one specific token id can be used to fill the order.
2. Collection Offer - An offer made on a specific collection where any token id can be used to fill the order.
3. Token Set Offer - An offer made on a specific collection where any token id contained in a specified subset of token ids can be used to fill the order.

There are four variations of `acceptOffer`.

`acceptOffer` - To be used when the taker fills a standard buy order (offer) and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top.

`acceptOfferWithFeeOnTop` - To be used when the taker fills a standard buy order (offer) via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

`acceptOfferCosigned` - To be used when the taker fills a co-signed buy order (offer) and the maker and taker marketplace is the same, or when the taker marketplace does not include a fee on top. 

`acceptOfferCosignedWithFeeOnTop` - To be used when the taker fills a co-signed buy order (offer) via a secondary marketplace.  While the maker marketplace can assess a primary fee that is deducted from the seller's proceeds, the taker marketplace may assess an extra `fee on top` paid by the taker in excess of the item purchase price.

*Note: The taker/seller (`msg.sender`) pays for the fee on top when applicable.  The maker/buyer pays the cost of the filled item.  Because the `acceptOffer` function is not payable, only ERC-20 payment methods are accepted.*

### Bulk Buy Listings

Exchanges should call `bulkBuyListings` when a taker wants to purchase more than one listing using a UX analagous to a "Shopping Cart".  This allows a taker to select many NFTs across different collections or with varying payment methods and fill all of the listings at once.  There are four variations of `bulkBuyListings`.

`bulkBuyListings` - To be used when the taker fills a set of orders that includes only standard sell orders, none of which includes fees on top.

`bulkBuyListingsWithFeesOnTop` - To be used when the taker fills a set of orders that includes only standard sell orders, at least one of which includes a fee on top.  

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*

`bulkBuyListingsCosigned` - To be used when the taker fills a set of orders that includes at least one co-signed sell order, and none of the orders includes fees on top.

- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

`bulkBuyListingsCosignedWithFeesOnTop` - To be used when the taker fills a set of orders that includes at least one co-signed sell order, and at least one order includes a fee on top.

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*
- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

### Bulk Accept Offers

Exchanges should call `bulkAcceptOffers` when a taker wants to accept/fill more than one offer at once.  This allows a taker to sell multiple items they own across one or more collections in a single transaction.  The kinds of offers are currently supported by Payment Processor:

1. Item Offer - An offer made on a specific collection where only one specific token id can be used to fill the order.
2. Collection Offer - An offer made on a specific collection where any token id can be used to fill the order.
3. Token Set Offer - An offer made on a specific collection where any token id contained in a specified subset of token ids can be used to fill the order.

There are four variations of `bulkAcceptOffers`. 

`bulkAcceptOffers` - To be used when the taker fills a set of orders that includes only standard buy orders (offers), none of which includes fees on top.

`bulkAcceptOffersWithFeesOnTop` - To be used when the taker fills a set of orders that includes only standard buy orders (offers), at least one of which includes a fee on top.

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*

`bulkAcceptOffersCosigned` - To be used when the taker fills a set of orders that includes at least one co-signed buy order (offer), and none of the orders includes fees on top.

- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

`bulkAcceptOffersCosignedWithFeesOnTop` - To be used when the taker fills a set of orders that includes at least one co-signed buy order (offer), and at least one order includes a fee on top.

- *Note that when executing an array of orders, an array of fees on top must be provided of equal length such that saleDetailsArray[index] corresponds with feesOnTop[index].  When saleDetailsArray[index] has no fee on top, feesOnTop[index] must be an empty (zero) fee on top.*
- *Note that when executing an array of orders, an array of cosignatures must be provided of equal length such that saleDetailsArray[index] corresponds with cosignatures[index].  When saleDetailsArray[index] was signed as a standard order, cosignatures[index] must be an empty (zero) cosignature.*

### Sweep Collection

Exchanges should call `sweepCollection` (a more gas efficient form of `bulkBuyListings`) when a taker wants to purchase more than similar listings.  A common UX is the "Collection Sweep" UX where the taker specifies a number of items from a collection they want to buy, with some pricing limits.  

For a sweep to be filled, all items in the sweep order must share the following commonalities:

1. All sell orders fillable in the sweep must be from the same collection.
2. All sell orders fillable in the sweep must be made on the same primary maker marketplace.
3. All sell orders fillable in the sweep must use the same method of payment.
4. All sell orders fillable in the sweep must specify the same marketplace fee numerator.
5. All sell orders fillable in the sweep must specify the same beneficiary of the NFT.

When filling sweep orders, the following fields can be different for each filled item:

1. Maker
2. Token Id
3. Amount
4. Item Price
5. Nonce (for standard orders)
6. Expiration
7. Max Royalty Fee Numerator

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

## Maker Signature Formats

Makers sign orders in a human readable EIP-712 typed data format.  Exchanges that integrate Payment Processor are responsible for correctly prompting makers to sign the appropriate messages at order creation time.  The typed data formats of each order vary depending on the order type.  The following subsections details the various typed data formats compatible with Payment Processor.

All Payment Processor V2 typed data signatures share the same EIP-712 domain:

```js
EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)
```

***Note: One of the fields that must always be signed and acknowledged by the order maker is the maximum royalty fee that will be deducted from the proceeds. Upon each signature request, this max royalty fee amount should be queried from the NFT contract using the EIP-2981 `royaltyInfo` function. In case a collection does not implement `royaltyInfo`, the query logic should fallback to check the Payment Processor contract to determine if a royalty backfill has been supplied by the collection creator/owner using the `collectionRoyaltyBackfillSettings` function. If the on-chain royalty increases after the listing has been signed, sales will not execute. However, if the on-chain royalty is reduced, the reduced royalty fee is paid during the sale.***

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
ItemOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)
```

### Item Offer Approval (Cosigned)

When making an offer on a specific NFT, with a co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
ItemOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)
```

### Collection Offer Approval

When making an offer on any NFT in a specific collection, with no co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
CollectionOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce)
```

### Collection Offer Approval (Cosigned)

When making an offer on any NFT in a specific collection, with a co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
CollectionOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator)
```

### Token Set Offer Approval

When making an offer on a subset of NFTs in a specific collection, with no co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
TokenSetOfferApproval(uint8 protocol,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 nonce,uint256 masterNonce,bytes32 tokenSetMerkleRoot)
```

### Token Set Offer Approval (Cosigned)

When making an offer on a subset of NFTs in a specific collection, with a co-signature required, the buyer/maker must be prompted to sign an EIP-712 sale approval in the following format.

```js
TokenSetOfferApprovalCosigned(uint8 protocol,address cosigner,address buyer,address beneficiary,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,bytes32 tokenSetMerkleRoot)
```

### Cosignature Format

All cosigned listings and offers require a secondary signature to be provided at fill-time/execution time.  The same cosignature format applies to all cosigned maker signatures, and takes a cosigner expiration and the maker's signature v, r, s components as typed data inputs.  Note: for security purposes, co-signatures must always be signed by EOA co-signers.  Furthermore, cosignature expiration times should be relatively short.  A cosignature expiration time between 5 and 10 minutes is suggested.  If the expiration time is too short, transactions may fail because the expiration time elapses before a transaction has been confirmed.  However, if the expiration time is too long a leak of the co-signature could be executed well into the future. 

```js
Cosignature(uint8 v,bytes32 r,bytes32 s,uint256 expiration)
```

## Order Data Structures

The following subsections detail the data structures needed for execution of various types of orders.  Note that maker signature formats vary by order-type.  Signature formats will be described in a different section.

### Generic Structure of Orders (Fill-Time)

| Protocol | Maker   | Beneficiary | Marketplace | Payment Method | Token Address | Token Id | Amount  | Item Price | Nonce   | Expiration | Marketplace Fee Numerator | Max Royalty Fee Numerator |
|----------|---------|-------------|-------------|----------------|---------------|----------|---------|------------|---------|------------|---------------------------|---------------------------|
|uint8     | address | address     | address     | address        | address       | uint256  | uint256 | uint256    | uint256 | uint256    | uint256                   | uint256                   |
