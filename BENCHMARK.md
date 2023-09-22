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

| Benchmark                       | Min             | Avg     | Median  | Max     | # calls |
|---------------------------------|-----------------|---------|---------|---------|---------|
| acceptOffer                           | 24340           | 36243   | 35934   | 124790  | 9000    |
| acceptOfferCosigned                   | 24704           | 37258   | 36391   | 125257  | 18000   |
| acceptOfferCosignedWithFeeOnTop       | 25034           | 40234   | 39241   | 137947  | 36000   |
| acceptOfferWithFeeOnTop               | 24638           | 39183   | 37980   | 137441  | 18000   |
| bulkAcceptOffers                      | 281277          | 378944  | 372323  | 557527  | 900     |
| bulkAcceptOffersCosigned              | 290354          | 394434  | 393946  | 566691  | 1800    |
| bulkAcceptOffersCosignedWithFeesOnTop | 295913          | 427932  | 427153  | 634313  | 3600    |
| bulkAcceptOffersWithFeesOnTop         | 285834          | 411366  | 408626  | 624007  | 1800    |
| bulkBuyListings                       | 270088          | 370684  | 375585  | 537427  | 600     |
| bulkBuyListingsCosigned               | 280158          | 387781  | 386966  | 548826  | 600     |
| bulkBuyListingsCosignedWithFeesOnTop  | 284834          | 424314  | 417444  | 626732  | 1200    |
| bulkBuyListingsWithFeesOnTop          | 275406          | 408502  | 405632  | 617305  | 1200    |
| buyListing                            | 23532           | 35569   | 34908   | 120468  | 6000    |
| buyListingCosigned                    | 24078           | 36848   | 35720   | 121150  | 6000    |
| buyListingCosignedWithFeeOnTop        | 24259           | 39988   | 38980   | 131653  | 12000   |
| buyListingWithFeeOnTop                | 23845           | 38925   | 38446   | 131136  | 12000   |
| sweepCollection                       | 211844          | 248857  | 241966  | 355526  | 600     |
| sweepCollectionCosigned               | 218240          | 261632  | 256572  | 361944  | 600     |
| sweepCollectionCosignedWithFeeOnTop   | 218464          | 265154  | 259431  | 372444  | 1200    |
| sweepCollectionWithFeeOnTop           | 212067          | 252377  | 246434  | 366023  | 1200    |
