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
| acceptOffer                           | 24472           | 36404   | 36072   | 124506  | 18000   |
| acceptOfferCosigned                   | 24913           | 37426   | 36653   | 125048  | 36000   |
| acceptOfferCosignedWithFeeOnTop       | 25278           | 40438   | 39440   | 137769  | 72000   |
| acceptOfferWithFeeOnTop               | 24795           | 39366   | 38117   | 137175  | 36000   |
| bulkAcceptOffers                      | 281973          | 379725  | 373195  | 558265  | 1800    |
| bulkAcceptOffersCosigned              | 291064          | 394515  | 393282  | 567440  | 3600    |
| bulkAcceptOffersCosignedWithFeesOnTop | 296892          | 428228  | 428092  | 635221  | 7200    |
| bulkAcceptOffersWithFeesOnTop         | 286606          | 412168  | 409416  | 624709  | 3600    |
| bulkBuyListings                       | 271841          | 372638  | 377569  | 541869  | 1200    |
| bulkBuyListingsCosigned               | 281771          | 388913  | 388810  | 553129  | 1200    |
| bulkBuyListingsCosignedWithFeesOnTop  | 286432          | 425403  | 419021  | 631019  | 2400    |
| bulkBuyListingsWithFeesOnTop          | 277117          | 410387  | 407242  | 621706  | 2400    |
| buyListing                            | 23783           | 35881   | 35210   | 120315  | 12000   |
| buyListingCosigned                    | 24347           | 37112   | 36016   | 121020  | 12000   |
| buyListingCosignedWithFeeOnTop        | 24544           | 40267   | 39348   | 131530  | 24000   |
| buyListingWithFeeOnTop                | 24148           | 39294   | 38835   | 131035  | 24000   |
| sweepCollection                       | 222304          | 259487  | 252424  | 366050  | 1200    |
| sweepCollectionCosigned               | 225698          | 268748  | 264090  | 369444  | 1200    |
| sweepCollectionCosignedWithFeeOnTop   | 225899          | 272264  | 266605  | 379947  | 2400    |
| sweepCollectionWithFeeOnTop           | 222592          | 263090  | 257260  | 376640  | 2400    |