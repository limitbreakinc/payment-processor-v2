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
| acceptOffer                           | 24777           | 36754   | 36400   | 125370  | 18000   |
| acceptOfferCosigned                   | 25176           | 37809   | 36961   | 125881  | 36000   |
| acceptOfferCosignedWithFeeOnTop       | 25524           | 40803   | 39842   | 138582  | 72000   |
| acceptOfferWithFeeOnTop               | 25084           | 39698   | 38406   | 138020  | 36000   |
| bulkAcceptOffers                      | 287015          | 384710  | 378093  | 563652  | 1800    |
| bulkAcceptOffersCosigned              | 296154          | 400265  | 399665  | 572878  | 3600    |
| bulkAcceptOffersCosignedWithFeesOnTop | 301818          | 433815  | 432966  | 640496  | 7200    |
| bulkAcceptOffersWithFeesOnTop         | 291739          | 417245  | 414394  | 630191  | 3600    |
| bulkBuyListings                       | 275891          | 376614  | 381615  | 543919  | 1200    |
| bulkBuyListingsCosigned               | 285965          | 393720  | 393001  | 555323  | 1200    |
| bulkBuyListingsCosignedWithFeesOnTop  | 290651          | 430236  | 423382  | 633239  | 2400    |
| bulkBuyListingsWithFeesOnTop          | 281190          | 414387  | 411321  | 623778  | 2400    |
| buyListing                            | 23988           | 36112   | 35465   | 121070  | 12000   |
| buyListingCosigned                    | 24535           | 37394   | 36204   | 121755  | 12000   |
| buyListingCosignedWithFeeOnTop        | 24733           | 40551   | 39585   | 132268  | 24000   |
| buyListingWithFeeOnTop                | 24299           | 39464   | 39025   | 131724  | 24000   |
| sweepCollection                       | 225381          | 262491  | 255504  | 369635  | 1200    |
| sweepCollectionCosigned               | 228732          | 272451  | 267125  | 372986  | 1200    |
| sweepCollectionCosignedWithFeeOnTop   | 228955          | 275989  | 270426  | 383511  | 2400    |
| sweepCollectionWithFeeOnTop           | 225581          | 266006  | 260252  | 380137  | 2400    |