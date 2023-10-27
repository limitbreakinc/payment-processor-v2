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
| acceptOffer                           | 63641           | 102041 | 104995 | 122693 | 720     |
| acceptOfferCosigned                   | 60807           | 100599 | 103732 | 126379 | 1440    |
| acceptOfferCosignedWithFeeOnTop       | 61257           | 107186 | 111791 | 139103 | 2880    |
| acceptOfferWithFeeOnTop               | 64069           | 108605 | 111953 | 135396 | 1440    |
| bulkAcceptOffers                      | 342246          | 436675 | 436836 | 551843 | 360     |
| bulkAcceptOffersCosigned              | 352481          | 447168 | 445721 | 562162 | 720     |
| bulkAcceptOffersCosignedWithFeesOnTop | 358377          | 484062 | 483875 | 630095 | 1440    |
| bulkAcceptOffersWithFeesOnTop         | 346911          | 472264 | 471924 | 618416 | 720     |
| bulkBuyListings                       | 333903          | 428267 | 429210 | 549426 | 240     |
| bulkBuyListingsCosigned               | 344699          | 439723 | 437774 | 561206 | 240     |
| bulkBuyListingsCosignedWithFeesOnTop  | 349417          | 477532 | 474949 | 638369 | 480     |
| bulkBuyListingsWithFeesOnTop          | 338745          | 466672 | 462970 | 627707 | 480     |
| buyListing                            | 50990           | 93402  | 97513  | 121158 | 360     |
| buyListingCosigned                    | 48342           | 90350  | 93138  | 122444 | 360     |
| buyListingCosignedWithFeeOnTop        | 48591           | 95606  | 98154  | 132967 | 720     |
| buyListingWithFeeOnTop                | 51461           | 98814  | 102682 | 131803 | 720     |
| sweepCollection                       | 273412          | 316056 | 316283 | 374489 | 240     |
| sweepCollectionCosigned               | 277573          | 320616 | 319659 | 378650 | 240     |
| sweepCollectionCosignedWithFeeOnTop   | 277818          | 325820 | 325640 | 389201 | 480     |
| sweepCollectionWithFeeOnTop           | 273636          | 321239 | 320698 | 385019 | 480     |

| Warm Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 63641           | 93491  | 94415  | 122010 | 360     |
| acceptOfferCosigned                   | 60807           | 94187  | 95031  | 126379 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 61257           | 100773 | 101408 | 139103 | 1440    |
| acceptOfferWithFeeOnTop               | 64069           | 100055 | 100764 | 134713 | 720     |
| bulkAcceptOffers                      | 342246          | 419575 | 410842 | 517643 | 180     |
| bulkAcceptOffersCosigned              | 352481          | 434343 | 429670 | 536868 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 358377          | 471237 | 480322 | 604842 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 346911          | 455164 | 465140 | 584216 | 360     |
| bulkBuyListings                       | 333903          | 411167 | 409699 | 515226 | 120     |
| bulkBuyListingsCosigned               | 344699          | 426898 | 423699 | 535868 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 349417          | 464707 | 467355 | 613046 | 240     |
| bulkBuyListingsWithFeesOnTop          | 338745          | 449572 | 452213 | 593507 | 240     |
| buyListing                            | 50990           | 82002  | 75325  | 120476 | 180     |
| buyListingCosigned                    | 48342           | 81800  | 74068  | 122444 | 180     |
| buyListingCosignedWithFeeOnTop        | 48591           | 87056  | 81945  | 132967 | 360     |
| buyListingWithFeeOnTop                | 51461           | 87414  | 83646  | 131122 | 360     |
| sweepCollection                       | 273412          | 298956 | 297421 | 340289 | 120     |
| sweepCollectionCosigned               | 277573          | 307791 | 306461 | 353812 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 277818          | 312995 | 311472 | 364365 | 240     |
| sweepCollectionWithFeeOnTop           | 273636          | 304139 | 303197 | 350819 | 240     |

| Cold Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 97841           | 110591 | 110668 | 122693 | 360     |
| acceptOfferCosigned                   | 77907           | 107012 | 107177 | 126379 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 78357           | 113598 | 113951 | 139103 | 1440    |
| acceptOfferWithFeeOnTop               | 98269           | 117155 | 116803 | 135396 | 720     |
| bulkAcceptOffers                      | 376446          | 453775 | 445042 | 551843 | 180     |
| bulkAcceptOffersCosigned              | 378524          | 459993 | 454924 | 562162 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 384442          | 496887 | 506397 | 630095 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 381111          | 489364 | 499340 | 618416 | 360     |
| bulkBuyListings                       | 368103          | 445367 | 443899 | 549426 | 120     |
| bulkBuyListingsCosigned               | 370666          | 452548 | 449646 | 561206 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 375400          | 490357 | 493027 | 638369 | 240     |
| bulkBuyListingsWithFeesOnTop          | 372945          | 483772 | 486413 | 627707 | 240     |
| buyListing                            | 85190           | 104802 | 106406 | 121158 | 180     |
| buyListingCosigned                    | 65442           | 98900  | 100048 | 122444 | 180     |
| buyListingCosignedWithFeeOnTop        | 65691           | 104156 | 107353 | 132967 | 360     |
| buyListingWithFeeOnTop                | 85661           | 110214 | 109888 | 131803 | 360     |
| sweepCollection                       | 307612          | 333156 | 331621 | 374489 | 120     |
| sweepCollectionCosigned               | 304015          | 333441 | 332110 | 378650 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 304260          | 338645 | 336726 | 389201 | 240     |
| sweepCollectionWithFeeOnTop           | 307836          | 338339 | 337397 | 385019 | 240     |