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

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 64733           | 108626 | 112299 | 140129 | 6480    |
| bulkAcceptOffers             | 359778          | 488537 | 486239 | 672621 | 3240    |
| bulkBuyListings              | 349913          | 476882 | 473722 | 679815 | 1440    |
| buyListing                   | 52132           | 98649  | 101690 | 136545 | 2160    |
| sweepCollection              | 280172          | 336205 | 333661 | 432636 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 64733           | 100076 | 101532 | 139550 | 3240    |
| bulkAcceptOffers             | 359778          | 471437 | 474615 | 638421 | 1620    |
| bulkBuyListings              | 349913          | 459782 | 458675 | 645615 | 720     |
| buyListing                   | 52132           | 87249  | 83050  | 133490 | 1080    |
| sweepCollection              | 280172          | 319105 | 315130 | 398436 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 98933           | 117176 | 116219 | 140129 | 3240    |
| bulkAcceptOffers             | 393978          | 505637 | 508815 | 672621 | 1620    |
| bulkBuyListings              | 384113          | 493982 | 492875 | 679815 | 720     |
| buyListing                   | 86332           | 110049 | 109274 | 136545 | 1080    |
| sweepCollection              | 314372          | 353305 | 349330 | 432636 | 720     |