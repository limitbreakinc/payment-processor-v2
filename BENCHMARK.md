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

## Direct Calls (Non-Forwarded)

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 63228           | 107957 | 110865 | 141150 | 6480    |
| bulkAcceptOffers             | 362113          | 493344 | 491001 | 682051 | 3240    |
| bulkBuyListings              | 350396          | 479431 | 476210 | 687303 | 1440    |
| buyListing                   | 50502           | 97753  | 102451 | 137496 | 2190    |
| sweepCollection              | 285074          | 342087 | 340943 | 441709 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 63228           | 99407  | 100106 | 140357 | 3240    |
| bulkAcceptOffers             | 362113          | 476244 | 478348 | 647851 | 1620    |
| bulkBuyListings              | 350396          | 462331 | 464010 | 653103 | 720     |
| buyListing                   | 50502           | 86307  | 82224  | 134213 | 1080    |
| sweepCollection              | 285074          | 324987 | 319735 | 407509 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 97428           | 116507 | 116922 | 141150 | 3240    |
| bulkAcceptOffers             | 396313          | 510444 | 512548 | 682051 | 1620    |
| bulkBuyListings              | 384596          | 496531 | 498210 | 687303 | 720     |
| buyListing                   | 83776           | 108890 | 107742 | 137496 | 1110    |
| sweepCollection              | 319274          | 359187 | 353935 | 441709 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 66242           | 111471 | 114248 | 145870 | 6480    |
| bulkAcceptOffers             | 365130          | 496862 | 494401 | 685070 | 3240    |
| bulkBuyListings              | 353413          | 482948 | 479267 | 690320 | 1440    |
| buyListing                   | 53515           | 101260 | 105926 | 141525 | 2190    |
| sweepCollection              | 288062          | 345575 | 344060 | 444697 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 66242           | 102921 | 103215 | 145870 | 3240    |
| bulkAcceptOffers             | 365130          | 479762 | 481366 | 650870 | 1620    |
| bulkBuyListings              | 353413          | 465848 | 467028 | 656120 | 720     |
| buyListing                   | 53515           | 89820  | 86021  | 139727 | 1080    |
| sweepCollection              | 288062          | 328475 | 323506 | 410497 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 100442          | 120021 | 120578 | 145870 | 3240    |
| bulkAcceptOffers             | 399330          | 513962 | 515566 | 685070 | 1620    |
| bulkBuyListings              | 387613          | 500048 | 501228 | 690320 | 720     |
| buyListing                   | 86789           | 112390 | 111343 | 141525 | 1110    |
| sweepCollection              | 322262          | 362675 | 357706 | 444697 | 720     |