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
| acceptOffer                  | 68267           | 112751 | 116317 | 145735 | 6480    |
| bulkAcceptOffers             | 365815          | 495605 | 493315 | 680713 | 3240    |
| bulkBuyListings              | 355499          | 483397 | 480146 | 687270 | 1440    |
| buyListing                   | 55516           | 102689 | 106028 | 141366 | 2190    |
| sweepCollection              | 289882          | 346322 | 345317 | 442348 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68267           | 104201 | 105283 | 145735 | 3240    |
| bulkAcceptOffers             | 365815          | 478505 | 480725 | 646513 | 1620    |
| bulkBuyListings              | 355499          | 466297 | 464408 | 653070 | 720     |
| buyListing                   | 55516           | 91242  | 87520  | 139567 | 1080    |
| sweepCollection              | 289882          | 329222 | 325363 | 408148 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 102467          | 121301 | 120443 | 145735 | 3240    |
| bulkAcceptOffers             | 400015          | 512705 | 514925 | 680713 | 1620    |
| bulkBuyListings              | 389699          | 500497 | 498608 | 687270 | 720     |
| buyListing                   | 88833           | 113826 | 113387 | 141366 | 1110    |
| sweepCollection              | 324082          | 363422 | 359563 | 442348 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68305           | 112789 | 116355 | 145773 | 6480    |
| bulkAcceptOffers             | 365853          | 495643 | 493353 | 680751 | 3240    |
| bulkBuyListings              | 355537          | 483435 | 480184 | 687308 | 1440    |
| buyListing                   | 55554           | 102727 | 106066 | 141404 | 2190    |
| sweepCollection              | 289920          | 346360 | 345355 | 442386 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 68305           | 104239 | 105321 | 145773 | 3240    |
| bulkAcceptOffers             | 365853          | 478543 | 480763 | 646551 | 1620    |
| bulkBuyListings              | 355537          | 466335 | 464446 | 653108 | 720     |
| buyListing                   | 55554           | 91280  | 87558  | 139605 | 1080    |
| sweepCollection              | 289920          | 329260 | 325401 | 408186 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 102505          | 121339 | 120481 | 145773 | 3240    |
| bulkAcceptOffers             | 400053          | 512743 | 514963 | 680751 | 1620    |
| bulkBuyListings              | 389737          | 500535 | 498646 | 687308 | 720     |
| buyListing                   | 88871           | 113864 | 113425 | 141404 | 1110    |
| sweepCollection              | 324120          | 363460 | 359601 | 442386 | 720     |