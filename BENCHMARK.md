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
| acceptOffer                  | 65318           | 109344 | 112992 | 141073 | 6480    |
| bulkAcceptOffers             | 363783          | 493802 | 491783 | 680051 | 3240    |
| bulkBuyListings              | 352047          | 480206 | 476341 | 685284 | 1440    |
| buyListing                   | 52591           | 99324  | 102366 | 137418 | 2190    |
| sweepCollection              | 287186          | 343205 | 340773 | 439818 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 65318           | 100794 | 102245 | 140292 | 3240    |
| bulkAcceptOffers             | 363783          | 476702 | 479719 | 645851 | 1620    |
| bulkBuyListings              | 352047          | 463106 | 461991 | 651084 | 720     |
| buyListing                   | 52591           | 87870  | 83874  | 134147 | 1080    |
| sweepCollection              | 287186          | 326105 | 321825 | 405618 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 99518           | 117894 | 116827 | 141073 | 3240    |
| bulkAcceptOffers             | 397983          | 510902 | 513919 | 680051 | 1620    |
| bulkBuyListings              | 386247          | 497306 | 496191 | 685284 | 720     |
| buyListing                   | 85913           | 110468 | 109868 | 137418 | 1110    |
| sweepCollection              | 321386          | 360305 | 356025 | 439818 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68332           | 112857 | 116387 | 145805 | 6480    |
| bulkAcceptOffers             | 366800          | 497319 | 494964 | 683070 | 3240    |
| bulkBuyListings              | 355064          | 483723 | 480629 | 688301 | 1440    |
| buyListing                   | 55604           | 102830 | 106122 | 141459 | 2190    |
| sweepCollection              | 290174          | 346693 | 345767 | 442806 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68332           | 104307 | 105354 | 145805 | 3240    |
| bulkAcceptOffers             | 366800          | 480219 | 482737 | 648870 | 1620    |
| bulkBuyListings              | 355064          | 466623 | 465009 | 654101 | 720     |
| buyListing                   | 55604           | 91383  | 87756  | 139661 | 1080    |
| sweepCollection              | 290174          | 329593 | 325642 | 408606 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 102532          | 121407 | 120513 | 145805 | 3240    |
| bulkAcceptOffers             | 401000          | 514419 | 516937 | 683070 | 1620    |
| bulkBuyListings              | 389264          | 500823 | 499209 | 688301 | 720     |
| buyListing                   | 88926           | 113968 | 113481 | 141459 | 1110    |
| sweepCollection              | 324374          | 363793 | 359842 | 442806 | 720     |