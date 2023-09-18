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
| acceptOffer                     | 25537           | 37663   | 37236   | 126357  | 9000    |
| acceptOfferCosigned             | 26312           | 39226   | 38418   | 127493  | 18000   |
| acceptOfferCosignedWithFeeOnTop | 26680           | 42266   | 41355   | 140268  | 36000   |
| acceptOfferWithFeeOnTop         | 25846           | 40615   | 39243   | 139021  | 18000   |
| buyListing                      | 24740           | 36999   | 36417   | 122046  | 6000    |
| buyListingCosigned              | 25532           | 38535   | 37498   | 123182  | 6000    |
| buyListingCosignedWithFeeOnTop  | 25888           | 41950   | 40980   | 133941  | 12000   |
| buyListingWithFeeOnTop          | 25052           | 40355   | 39953   | 132714  | 12000   |