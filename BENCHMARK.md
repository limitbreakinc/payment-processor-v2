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
| acceptOffer                  | 65366           | 109350 | 112933 | 140973 | 6480    |
| bulkAcceptOffers             | 364489          | 493778 | 491592 | 679385 | 3240    |
| bulkBuyListings              | 352574          | 479972 | 476505 | 684345 | 1440    |
| buyListing                   | 52586           | 99265  | 102283 | 137265 | 2190    |
| sweepCollection              | 286962          | 342902 | 340354 | 439428 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 65366           | 100800 | 102287 | 140335 | 3240    |
| bulkAcceptOffers             | 364489          | 476678 | 479398 | 645185 | 1620    |
| bulkBuyListings              | 352574          | 462872 | 461482 | 650145 | 720     |
| buyListing                   | 52586           | 87812  | 83718  | 134137 | 1080    |
| sweepCollection              | 286962          | 325802 | 321587 | 405228 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 99566           | 117900 | 116855 | 140973 | 3240    |
| bulkAcceptOffers             | 398689          | 510878 | 513598 | 679385 | 1620    |
| bulkBuyListings              | 386774          | 497072 | 495682 | 684345 | 720     |
| buyListing                   | 85903           | 110409 | 109755 | 137265 | 1110    |
| sweepCollection              | 321162          | 360002 | 355787 | 439428 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68380           | 112864 | 116430 | 145848 | 6480    |
| bulkAcceptOffers             | 367506          | 497296 | 495006 | 682404 | 3240    |
| bulkBuyListings              | 355591          | 483489 | 480238 | 687362 | 1440    |
| buyListing                   | 55599           | 102772 | 106111 | 141449 | 2190    |
| sweepCollection              | 289979          | 346419 | 345414 | 442445 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68380           | 104314 | 105396 | 145848 | 3240    |
| bulkAcceptOffers             | 367506          | 480196 | 482416 | 648204 | 1620    |
| bulkBuyListings              | 355591          | 466389 | 464500 | 653162 | 720     |
| buyListing                   | 55599           | 91325  | 87603  | 139650 | 1080    |
| sweepCollection              | 289979          | 329319 | 325460 | 408245 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 102580          | 121414 | 120556 | 145848 | 3240    |
| bulkAcceptOffers             | 401706          | 514396 | 516616 | 682404 | 1620    |
| bulkBuyListings              | 389791          | 500589 | 498700 | 687362 | 720     |
| buyListing                   | 88916           | 113909 | 113470 | 141449 | 1110    |
| sweepCollection              | 324179          | 363519 | 359660 | 442445 | 720     |