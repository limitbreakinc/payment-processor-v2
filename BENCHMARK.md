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
| acceptOffer                  | 63228           | 107222 | 110865 | 138946 | 6480    |
| bulkAcceptOffers             | 362090          | 491975 | 490554 | 677988 | 3240    |
| bulkBuyListings              | 350396          | 478421 | 474690 | 683263 | 1440    |
| buyListing                   | 50479           | 97187  | 100224 | 135269 | 2190    |
| sweepCollection              | 285096          | 341099 | 338728 | 437691 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 63228           | 98672  | 100106 | 138153 | 3240    |
| bulkAcceptOffers             | 362090          | 474875 | 477656 | 643788 | 1620    |
| bulkBuyListings              | 350396          | 461321 | 459970 | 649063 | 720     |
| buyListing                   | 50479           | 85733  | 81818  | 131986 | 1080    |
| sweepCollection              | 285096          | 323999 | 319757 | 403491 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 97428           | 115772 | 114718 | 138946 | 3240    |
| bulkAcceptOffers             | 396290          | 509075 | 511856 | 677988 | 1620    |
| bulkBuyListings              | 384596          | 495521 | 494170 | 683263 | 720     |
| buyListing                   | 83753           | 108331 | 107719 | 135269 | 1110    |
| sweepCollection              | 319296          | 358199 | 353957 | 437691 | 720     |

## Calls Via Trusted Forwarder

| Combined Benchmark           | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 66242           | 110736 | 114248 | 143666 | 6480    |
| bulkAcceptOffers             | 365107          | 495492 | 493619 | 681007 | 3240    |
| bulkBuyListings              | 353413          | 481938 | 479227 | 686280 | 1440    |
| buyListing                   | 53492           | 100693 | 103961 | 139298 | 2190    |
| sweepCollection              | 288084          | 344587 | 343675 | 440679 | 1440    |

| Warm Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 66242           | 102186 | 103215 | 143666 | 3240    |
| bulkAcceptOffers             | 365107          | 478392 | 480674 | 646807 | 1620    |
| bulkBuyListings              | 353413          | 464838 | 462988 | 652080 | 720     |
| buyListing                   | 53492           | 89246  | 85607  | 137500 | 1080    |
| sweepCollection              | 288084          | 327487 | 323528 | 406479 | 720     |

| Cold Benchmark               | Min             | Avg    | Median | Max    | # calls |
|------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                  | 100442          | 119286 | 118374 | 143666 | 3240    |
| bulkAcceptOffers             | 399307          | 512592 | 514874 | 681007 | 1620    |
| bulkBuyListings              | 387613          | 499038 | 497188 | 686280 | 720     |
| buyListing                   | 86766           | 111831 | 111320 | 139298 | 1110    |
| sweepCollection              | 322284          | 361687 | 357728 | 440679 | 720     |