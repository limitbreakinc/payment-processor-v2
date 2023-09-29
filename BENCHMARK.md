### Benchmark All Functions That Include Fee On Top

forge t --mt ".*_FeeOnTop.*" --gas-report

### Benchmark All Functions That Include Empty Fee On Top

forge t --mt ".*_EmptyFeeOnTop.*" --gas-report

### Benchmark All Functions Without Any Marketplace or Royalty Fees

forge t --mt ".*NoFees.*" --gas-report

### Benchmark All Functions With Marketplace Fees But No Royalty Fees

forge t --mt ".*MarketplaceFees.*" --gas-report

### Benchmark All Functions With Marketplace Fees And Royalty Fees

forge t --mt ".*MarketplaceAndRoyaltyFees.*" --gas-report

| Benchmark                             | Min             | Avg     | Median  | Max     | # calls |
|---------------------------------------|-----------------|---------|---------|---------|---------|
| acceptOffer                           | 24358           | 36250   | 35948   | 122363  | 18000   |
| acceptOfferCosigned                   | 24836           | 37316   | 36556   | 122951  | 36000   |
| acceptOfferCosignedWithFeeOnTop       | 25168           | 40289   | 39302   | 135631  | 72000   |
| acceptOfferWithFeeOnTop               | 24682           | 39215   | 38004   | 135034  | 36000   |
| bulkAcceptOffers                      | 282210          | 379762  | 372738  | 556502  | 1800    |
| bulkAcceptOffersCosigned              | 291301          | 394552  | 393519  | 565677  | 3600    |
| bulkAcceptOffersCosignedWithFeesOnTop | 296961          | 428097  | 428161  | 633290  | 7200    |
| bulkAcceptOffersWithFeesOnTop         | 286887          | 412249  | 409667  | 622990  | 3600    |
| bulkBuyListings                       | 271788          | 372385  | 377516  | 539816  | 1200    |
| bulkBuyListingsCosigned               | 281770          | 388712  | 388809  | 551128  | 1200    |
| bulkBuyListingsCosignedWithFeesOnTop  | 286408          | 425179  | 418997  | 628995  | 2400    |
| bulkBuyListingsWithFeesOnTop          | 277086          | 410156  | 407211  | 619675  | 2400    |
| buyListing                            | 23664           | 35722   | 35061   | 118166  | 12000   |
| buyListingCosigned                    | 24195           | 36915   | 35864   | 118830  | 12000   |
| buyListingCosignedWithFeeOnTop        | 24410           | 40091   | 39181   | 129363  | 24000   |
| buyListingWithFeeOnTop                | 24011           | 39115   | 38664   | 128864  | 24000   |
| sweepCollection                       | 222186          | 259169  | 252306  | 363932  | 1200    |
| sweepCollectionCosigned               | 225537          | 268387  | 263929  | 367283  | 1200    |
| sweepCollectionCosignedWithFeeOnTop   | 225760          | 271925  | 266466  | 377808  | 2400    |
| sweepCollectionWithFeeOnTop           | 222386          | 262684  | 257054  | 374434  | 2400    |