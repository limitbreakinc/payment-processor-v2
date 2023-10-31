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
| acceptOffer                  | 64673           | 108601 | 112284 | 140114 | 6480    |
| bulkAcceptOffers             | 359178          | 488237 | 486089 | 672471 | 3240    |
| bulkBuyListings              | 349413          | 476682 | 473672 | 679765 | 1440    |
| buyListing                   | 52082           | 98625  | 101676 | 136540 | 2160    |
| sweepCollection              | 280158          | 336491 | 333845 | 433072 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 64673           | 100051 | 101483 | 139546 | 3240    |
| bulkAcceptOffers             | 359178          | 471137 | 474015 | 638271 | 1620    |
| bulkBuyListings              | 349413          | 459582 | 458535 | 645565 | 720     |
| buyListing                   | 52082           | 87225  | 83045  | 133474 | 1080    |
| sweepCollection              | 280158          | 319391 | 315566 | 398872 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 98873           | 117151 | 116182 | 140114 | 3240    |
| bulkAcceptOffers             | 393378          | 505337 | 508215 | 672471 | 1620    |
| bulkBuyListings              | 383613          | 493782 | 492735 | 679765 | 720     |
| buyListing                   | 86282           | 110025 | 109256 | 136540 | 1080    |
| sweepCollection              | 314358          | 353591 | 349766 | 433072 | 720     |