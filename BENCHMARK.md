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

| Combined Benchmark                    | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 63600           | 102000 | 104954 | 122652 | 720     |
| acceptOfferCosigned                   | 60765           | 100558 | 103690 | 126338 | 1440    |
| acceptOfferCosignedWithFeeOnTop       | 61216           | 107145 | 111750 | 139062 | 2880    |
| acceptOfferWithFeeOnTop               | 64028           | 108564 | 111911 | 135354 | 1440    |
| bulkAcceptOffers                      | 342201          | 436630 | 436791 | 551798 | 360     |
| bulkAcceptOffersCosigned              | 352436          | 447122 | 445676 | 562116 | 720     |
| bulkAcceptOffersCosignedWithFeesOnTop | 358331          | 484016 | 483829 | 630049 | 1440    |
| bulkAcceptOffersWithFeesOnTop         | 346866          | 472219 | 471879 | 618371 | 720     |
| bulkBuyListings                       | 333835          | 428199 | 429142 | 549358 | 240     |
| bulkBuyListingsCosigned               | 344630          | 439654 | 437705 | 561137 | 240     |
| bulkBuyListingsCosignedWithFeesOnTop  | 349348          | 477463 | 474880 | 638300 | 480     |
| bulkBuyListingsWithFeesOnTop          | 338677          | 466604 | 462902 | 627639 | 480     |
| buyListing                            | 50924           | 93336  | 97447  | 121092 | 360     |
| buyListingCosigned                    | 48277           | 90285  | 93073  | 122379 | 360     |
| buyListingCosignedWithFeeOnTop        | 48525           | 95540  | 98088  | 132901 | 720     |
| buyListingWithFeeOnTop                | 51395           | 98748  | 102616 | 131737 | 720     |
| sweepCollection                       | 273345          | 315989 | 316216 | 374422 | 240     |
| sweepCollectionCosigned               | 277505          | 320548 | 319591 | 378582 | 240     |
| sweepCollectionCosignedWithFeeOnTop   | 277750          | 325752 | 325572 | 389133 | 480     |
| sweepCollectionWithFeeOnTop           | 273569          | 321172 | 320631 | 384952 | 480     |

| Warm Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 63600           | 93450  | 94374  | 121969 | 360     |
| acceptOfferCosigned                   | 60765           | 94145  | 94989  | 126338 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 61216           | 100732 | 101367 | 139062 | 1440    |
| acceptOfferWithFeeOnTop               | 64028           | 100014 | 100723 | 134671 | 720     |
| bulkAcceptOffers                      | 342201          | 419530 | 410797 | 517598 | 180     |
| bulkAcceptOffersCosigned              | 352436          | 434297 | 429625 | 536822 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 358331          | 471191 | 480276 | 604796 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 346866          | 455119 | 465095 | 584171 | 360     |
| bulkBuyListings                       | 333835          | 411099 | 409631 | 515158 | 120     |
| bulkBuyListingsCosigned               | 344630          | 426829 | 423630 | 535799 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 349348          | 464638 | 467286 | 612977 | 240     |
| bulkBuyListingsWithFeesOnTop          | 338677          | 449504 | 452145 | 593439 | 240     |
| buyListing                            | 50924           | 81936  | 75259  | 120410 | 180     |
| buyListingCosigned                    | 48277           | 81735  | 74003  | 122379 | 180     |
| buyListingCosignedWithFeeOnTop        | 48525           | 86990  | 81879  | 132901 | 360     |
| buyListingWithFeeOnTop                | 51395           | 87348  | 83580  | 131056 | 360     |
| sweepCollection                       | 273345          | 298889 | 297354 | 340222 | 120     |
| sweepCollectionCosigned               | 277505          | 307723 | 306393 | 353744 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 277750          | 312927 | 311404 | 364297 | 240     |
| sweepCollectionWithFeeOnTop           | 273569          | 304072 | 303130 | 350752 | 240     |

| Cold Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 97800           | 110550 | 110627 | 122652 | 360     |
| acceptOfferCosigned                   | 77865           | 106970 | 107136 | 126338 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 78316           | 113557 | 113910 | 139062 | 1440    |
| acceptOfferWithFeeOnTop               | 98228           | 117114 | 116761 | 135354 | 720     |
| bulkAcceptOffers                      | 376401          | 453730 | 444997 | 551798 | 180     |
| bulkAcceptOffersCosigned              | 378479          | 459947 | 454879 | 562116 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 384396          | 496841 | 506351 | 630049 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 381066          | 489319 | 499295 | 618371 | 360     |
| bulkBuyListings                       | 368035          | 445299 | 443831 | 549358 | 120     |
| bulkBuyListingsCosigned               | 370597          | 452479 | 449577 | 561137 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 375331          | 490288 | 492958 | 638300 | 240     |
| bulkBuyListingsWithFeesOnTop          | 372877          | 483704 | 486345 | 627639 | 240     |
| buyListing                            | 85124           | 104736 | 106340 | 121092 | 180     |
| buyListingCosigned                    | 65377           | 98835  | 99983  | 122379 | 180     |
| buyListingCosignedWithFeeOnTop        | 65625           | 104090 | 107287 | 132901 | 360     |
| buyListingWithFeeOnTop                | 85595           | 110148 | 109822 | 131737 | 360     |
| sweepCollection                       | 307545          | 333089 | 331554 | 374422 | 120     |
| sweepCollectionCosigned               | 303947          | 333373 | 332042 | 378582 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 304192          | 338577 | 336658 | 389133 | 240     |
| sweepCollectionWithFeeOnTop           | 307769          | 338272 | 337330 | 384952 | 240     |