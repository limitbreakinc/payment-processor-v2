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
| acceptOffer                  | 63228           | 107979 | 110865 | 141216 | 6480    |
| bulkAcceptOffers             | 362113          | 493564 | 491103 | 682711 | 3240    |
| bulkBuyListings              | 350396          | 479596 | 476210 | 687963 | 1440    |
| buyListing                   | 50502           | 97769  | 102517 | 137562 | 2190    |
| sweepCollection              | 285074          | 342225 | 340943 | 442259 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 63228           | 99429  | 100106 | 140423 | 3240    |
| bulkAcceptOffers             | 362113          | 476464 | 479008 | 648511 | 1620    |
| bulkBuyListings              | 350396          | 462496 | 464670 | 653763 | 720     |
| buyListing                   | 50502           | 86323  | 82290  | 134279 | 1080    |
| sweepCollection              | 285074          | 325125 | 319735 | 408059 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 97428           | 116529 | 116988 | 141216 | 3240    |
| bulkAcceptOffers             | 396313          | 510664 | 513208 | 682711 | 1620    |
| bulkBuyListings              | 384596          | 496696 | 498870 | 687963 | 720     |
| buyListing                   | 83776           | 108906 | 107742 | 137562 | 1110    |
| sweepCollection              | 319274          | 359325 | 353935 | 442259 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 66242           | 111493 | 114248 | 145936 | 6480    |
| bulkAcceptOffers             | 365130          | 497082 | 494632 | 685730 | 3240    |
| bulkBuyListings              | 353413          | 483113 | 479267 | 690980 | 1440    |
| buyListing                   | 53515           | 101276 | 105992 | 141591 | 2190    |
| sweepCollection              | 288062          | 345713 | 344060 | 445247 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 66242           | 102943 | 103215 | 145936 | 3240    |
| bulkAcceptOffers             | 365130          | 479982 | 482026 | 651530 | 1620    |
| bulkBuyListings              | 353413          | 466013 | 467688 | 656780 | 720     |
| buyListing                   | 53515           | 89836  | 86021  | 139793 | 1080    |
| sweepCollection              | 288062          | 328613 | 323506 | 411047 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 100442          | 120043 | 120644 | 145936 | 3240    |
| bulkAcceptOffers             | 399330          | 514182 | 516226 | 685730 | 1620    |
| bulkBuyListings              | 387613          | 500213 | 501888 | 690980 | 720     |
| buyListing                   | 86789           | 112406 | 111343 | 141591 | 1110    |
| sweepCollection              | 322262          | 362813 | 357706 | 445247 | 720     |