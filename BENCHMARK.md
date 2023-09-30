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
| acceptOffer                           | 24325           | 36212   | 35916   | 122322  | 18000   |
| acceptOfferCosigned                   | 24802           | 37276   | 36514   | 122909  | 36000   |
| acceptOfferCosignedWithFeeOnTop       | 25149           | 40267   | 39279   | 135608  | 72000   |
| acceptOfferWithFeeOnTop               | 24648           | 39175   | 37971   | 134992  | 36000   |
| bulkAcceptOffers                      | 281790          | 379342  | 372318  | 556082  | 1800    |
| bulkAcceptOffersCosigned              | 290881          | 394132  | 393099  | 565257  | 3600    |
| bulkAcceptOffersCosignedWithFeesOnTop | 296731          | 427867  | 427931  | 633060  | 7200    |
| bulkAcceptOffersWithFeesOnTop         | 286467          | 411829  | 409247  | 622570  | 3600    |
| bulkBuyListings                       | 271658          | 372255  | 377386  | 539686  | 1200    |
| bulkBuyListingsCosigned               | 281610          | 388552  | 388649  | 550968  | 1200    |
| bulkBuyListingsCosignedWithFeesOnTop  | 286248          | 425019  | 418837  | 628835  | 2400    |
| bulkBuyListingsWithFeesOnTop          | 276956          | 410026  | 407081  | 619545  | 2400    |
| buyListing                            | 23654           | 35711   | 35049   | 118154  | 12000   |
| buyListingCosigned                    | 24182           | 36900   | 35852   | 118814  | 12000   |
| buyListingCosignedWithFeeOnTop        | 24397           | 40076   | 39165   | 129347  | 24000   |
| buyListingWithFeeOnTop                | 24000           | 39102   | 38651   | 128851  | 24000   |
| sweepCollection                       | 222186          | 259169  | 252306  | 363932  | 1200    |
| sweepCollectionCosigned               | 225537          | 268387  | 263929  | 367283  | 1200    |
| sweepCollectionCosignedWithFeeOnTop   | 225760          | 271925  | 266466  | 377808  | 2400    |
| sweepCollectionWithFeeOnTop           | 222386          | 262684  | 257054  | 374434  | 2400    |