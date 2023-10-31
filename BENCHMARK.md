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
| acceptOffer                  | 64737           | 108660 | 112348 | 140178 | 6480    |
| bulkAcceptOffers             | 359818          | 488877 | 486729 | 673111 | 3240    |
| bulkBuyListings              | 349953          | 477222 | 474212 | 680305 | 1440    |
| buyListing                   | 52136           | 98683  | 101730 | 136594 | 2160    |
| sweepCollection              | 280212          | 336545 | 333899 | 433126 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 64737           | 100110 | 101536 | 139599 | 3240    |
| bulkAcceptOffers             | 359818          | 471777 | 474655 | 638911 | 1620    |
| bulkBuyListings              | 349953          | 460122 | 459075 | 646105 | 720     |
| buyListing                   | 52136           | 87283  | 83099  | 133539 | 1080    |
| sweepCollection              | 280212          | 319445 | 315620 | 398926 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 98937           | 117210 | 116246 | 140178 | 3240    |
| bulkAcceptOffers             | 394018          | 505977 | 508855 | 673111 | 1620    |
| bulkBuyListings              | 384153          | 494322 | 493275 | 680305 | 720     |
| buyListing                   | 86336           | 110083 | 109310 | 136594 | 1080    |
| sweepCollection              | 314412          | 353645 | 349820 | 433126 | 720     |