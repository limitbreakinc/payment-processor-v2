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
| acceptOffer                  | 65214           | 109243 | 112888 | 140980 | 6480    |
| bulkAcceptOffers             | 362589          | 492644 | 490699 | 678967 | 3240    |
| bulkBuyListings              | 350808          | 478995 | 475102 | 684155 | 1440    |
| buyListing                   | 52442           | 99177  | 102228 | 137280 | 2190    |
| sweepCollection              | 286858          | 342897 | 340445 | 439558 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 65214           | 100693 | 102141 | 140199 | 3240    |
| bulkAcceptOffers             | 362589          | 475544 | 478525 | 644767 | 1620    |
| bulkBuyListings              | 350808          | 461895 | 460862 | 649955 | 720     |
| buyListing                   | 52442           | 87724  | 83725  | 134009 | 1080    |
| sweepCollection              | 286858          | 325797 | 321548 | 405358 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 99414           | 117793 | 116734 | 140980 | 3240    |
| bulkAcceptOffers             | 396789          | 509744 | 512725 | 678967 | 1620    |
| bulkBuyListings              | 385008          | 496095 | 495062 | 684155 | 720     |
| buyListing                   | 85764           | 110322 | 109719 | 137280 | 1110    |
| sweepCollection              | 321058          | 359997 | 355748 | 439558 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68228           | 112757 | 116283 | 145712 | 6480    |
| bulkAcceptOffers             | 365606          | 496162 | 493825 | 681986 | 3240    |
| bulkBuyListings              | 353825          | 482511 | 479500 | 687172 | 1440    |
| buyListing                   | 55455           | 102684 | 105984 | 141321 | 2190    |
| sweepCollection              | 289875          | 346414 | 345477 | 442575 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68228           | 104207 | 105250 | 145712 | 3240    |
| bulkAcceptOffers             | 365606          | 479062 | 481543 | 647786 | 1620    |
| bulkBuyListings              | 353825          | 465411 | 463880 | 652972 | 720     |
| buyListing                   | 55455           | 91237  | 87607  | 139523 | 1080    |
| sweepCollection              | 289875          | 329314 | 325369 | 408375 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 102428          | 121307 | 120420 | 145712 | 3240    |
| bulkAcceptOffers             | 399806          | 513262 | 515743 | 681986 | 1620    |
| bulkBuyListings              | 388025          | 499611 | 498080 | 687172 | 720     |
| buyListing                   | 88777           | 113822 | 113332 | 141321 | 1110    |
| sweepCollection              | 324075          | 363514 | 359569 | 442575 | 720     |