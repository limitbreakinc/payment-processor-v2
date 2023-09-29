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
| acceptOffer                           | 24589           | 36545   | 36218   | 125146  | 18000   |
| acceptOfferCosigned                   | 25067           | 37678   | 36844   | 125734  | 36000   |
| acceptOfferCosignedWithFeeOnTop       | 25399           | 40651   | 39683   | 138414  | 72000   |
| acceptOfferWithFeeOnTop               | 24913           | 39509   | 38236   | 137817  | 36000   |
| bulkAcceptOffers                      | 285100          | 382899  | 376278  | 561832  | 1800    |
| bulkAcceptOffersCosigned              | 294191          | 398431  | 397889  | 571007  | 3600    |
| bulkAcceptOffersCosignedWithFeesOnTop | 299851          | 431975  | 431101  | 638620  | 7200    |
| bulkAcceptOffersWithFeesOnTop         | 289777          | 415385  | 412590  | 628320  | 3600    |
| bulkBuyListings                       | 274788          | 375510  | 380516  | 542816  | 1200    |
| bulkBuyListingsCosigned               | 284770          | 392522  | 391809  | 554128  | 1200    |
| bulkBuyListingsCosignedWithFeesOnTop  | 289408          | 428989  | 422138  | 631995  | 2400    |
| bulkBuyListingsWithFeesOnTop          | 280086          | 413281  | 410211  | 622675  | 2400    |
| buyListing                            | 23904           | 36015   | 35361   | 120966  | 12000   |
| buyListingCosigned                    | 24426           | 37266   | 36096   | 121619  | 12000   |
| buyListingCosignedWithFeeOnTop        | 24641           | 40443   | 39470   | 132152  | 24000   |
| buyListingWithFeeOnTop                | 24251           | 39407   | 38964   | 131664  | 24000   |
| sweepCollection                       | 225076          | 262184  | 255196  | 369322  | 1200    |
| sweepCollectionCosigned               | 228427          | 272142  | 266821  | 372673  | 1200    |
| sweepCollectionCosignedWithFeeOnTop   | 228650          | 275680  | 270117  | 383198  | 2400    |
| sweepCollectionWithFeeOnTop           | 225276          | 265699  | 259944  | 379824  | 2400    |