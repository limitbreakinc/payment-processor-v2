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
| acceptOffer                     | 24367           | 36263   | 35941   | 124799  | 9000    |
| acceptOfferCosigned             | 24760           | 37312   | 36449   | 125303  | 18000   |
| acceptOfferCosignedWithFeeOnTop | 25109           | 40305   | 39322   | 138004  | 36000   |
| acceptOfferWithFeeOnTop         | 24675           | 39208   | 37987   | 137450  | 18000   |
| buyListing                      | 23567           | 35610   | 34939   | 120487  | 6000    |
| buyListingCosigned              | 24116           | 36892   | 35738   | 121172  | 6000    |
| buyListingCosignedWithFeeOnTop  | 24296           | 40028   | 39038   | 131663  | 12000   |
| buyListingWithFeeOnTop          | 23879           | 38961   | 38500   | 131141  | 12000   |