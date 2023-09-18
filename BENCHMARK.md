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
| acceptOffer                     | 24340           | 36243   | 35934   | 124790  | 9000    |
| acceptOfferCosigned             | 24721           | 37278   | 36413   | 125279  | 18000   |
| acceptOfferCosignedWithFeeOnTop | 25069           | 40276   | 39285   | 137991  | 36000   |
| acceptOfferWithFeeOnTop         | 24638           | 39183   | 37980   | 137441  | 18000   |
| buyListing                      | 23532           | 35569   | 34908   | 120468  | 6000    |
| buyListingCosigned              | 24078           | 36848   | 35720   | 121150  | 6000    |
| buyListingCosignedWithFeeOnTop  | 24259           | 39988   | 38980   | 131653  | 12000   |
| buyListingWithFeeOnTop          | 23844           | 38924   | 38445   | 131135  | 12000   |