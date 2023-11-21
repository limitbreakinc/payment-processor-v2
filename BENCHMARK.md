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
| acceptOffer                  | 65035           | 108960 | 112602 | 140625 | 6480    |
| bulkAcceptOffers             | 362406          | 491677 | 489477 | 677247 | 3240    |
| bulkBuyListings              | 352291          | 479629 | 476220 | 683851 | 1440    |
| buyListing                   | 52337           | 98975  | 102017 | 136996 | 2190    |
| sweepCollection              | 285061          | 340938 | 338379 | 437301 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 65035           | 100410 | 101849 | 139878 | 3240    |
| bulkAcceptOffers             | 362406          | 474577 | 477382 | 643047 | 1620    |
| bulkBuyListings              | 352291          | 462529 | 461087 | 649651 | 720     |
| buyListing                   | 52337           | 87521  | 83459  | 133759 | 1080    |
| sweepCollection              | 285061          | 323838 | 319653 | 403101 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 99235           | 117510 | 116511 | 140625 | 3240    |
| bulkAcceptOffers             | 396606          | 508777 | 511582 | 677247 | 1620    |
| bulkBuyListings              | 386491          | 496729 | 495287 | 683851 | 720     |
| buyListing                   | 85655           | 110120 | 109507 | 136996 | 1110    |
| sweepCollection              | 319261          | 358038 | 353853 | 437301 | 720     |