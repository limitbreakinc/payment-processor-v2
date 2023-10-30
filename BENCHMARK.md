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
| acceptOffer                  | 64788           | 108659 | 112399 | 140229 | 6480    |
| bulkAcceptOffers             | 360328          | 489387 | 487239 | 673621 | 3240    |
| bulkBuyListings              | 350563          | 477832 | 474822 | 680915 | 1440    |
| buyListing                   | 52197           | 98702  | 101791 | 136655 | 2160    |
| sweepCollection              | 281308          | 337641 | 334995 | 434222 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 64788           | 100109 | 101483 | 139546 | 3240    |
| bulkAcceptOffers             | 360328          | 472287 | 475165 | 639421 | 1620    |
| bulkBuyListings              | 350563          | 460732 | 459685 | 646715 | 720     |
| buyListing                   | 52197           | 87302  | 83160  | 133474 | 1080    |
| sweepCollection              | 281308          | 320541 | 316716 | 400022 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 98988           | 117209 | 116297 | 140229 | 3240    |
| bulkAcceptOffers             | 394528          | 506487 | 509365 | 673621 | 1620    |
| bulkBuyListings              | 384763          | 494932 | 493885 | 680915 | 720     |
| buyListing                   | 86397           | 110102 | 109371 | 136655 | 1080    |
| sweepCollection              | 315508          | 354741 | 350916 | 434222 | 720     |