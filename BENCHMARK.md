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
| acceptOffer                           | 64113           | 102521 | 105467 | 123166 | 720     |
| acceptOfferCosigned                   | 64548           | 105006 | 107953 | 127704 | 1440    |
| acceptOfferCosignedWithFeeOnTop       | 64842           | 111437 | 114696 | 140272 | 2880    |
| acceptOfferWithFeeOnTop               | 64398           | 108944 | 112282 | 135726 | 1440    |
| bulkAcceptOffers                      | 345088          | 439619 | 439818 | 554720 | 360     |
| bulkAcceptOffersCosigned              | 354870          | 470150 | 469188 | 606069 | 720     |
| bulkAcceptOffersCosignedWithFeesOnTop | 359744          | 506030 | 505560 | 673037 | 1440    |
| bulkAcceptOffersWithFeesOnTop         | 348853          | 474311 | 474105 | 620398 | 720     |
| bulkBuyListings                       | 336556          | 431417 | 431872 | 553067 | 240     |
| bulkBuyListingsCosigned               | 345889          | 461457 | 459083 | 603787 | 240     |
| bulkBuyListingsCosignedWithFeesOnTop  | 350613          | 499276 | 501853 | 680976 | 480     |
| bulkBuyListingsWithFeesOnTop          | 340498          | 468430 | 464740 | 629458 | 480     |
| buyListing                            | 51540           | 93887  | 98014  | 121610 | 360     |
| buyListingCosigned                    | 51896           | 95883  | 100374 | 126080 | 360     |
| buyListingCosignedWithFeeOnTop        | 52145           | 101139 | 105423 | 136603 | 720     |
| buyListingWithFeeOnTop                | 51770           | 99124  | 102991 | 132114 | 720     |
| sweepCollection                       | 274378          | 317024 | 317254 | 375462 | 240     |
| sweepCollectionCosigned               | 278539          | 341879 | 342143 | 421028 | 240     |
| sweepCollectionCosignedWithFeeOnTop   | 278784          | 347083 | 345098 | 431582 | 480     |
| sweepCollectionWithFeeOnTop           | 274602          | 322207 | 321665 | 385992 | 480     |

| Warm Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 64113           | 93971  | 94887  | 122483 | 360     |
| acceptOfferCosigned                   | 64548           | 96456  | 97373  | 127021 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 64842           | 102887 | 102423 | 139589 | 1440    |
| acceptOfferWithFeeOnTop               | 64398           | 100394 | 101093 | 135043 | 720     |
| bulkAcceptOffers                      | 345088          | 422519 | 413958 | 520520 | 180     |
| bulkAcceptOffersCosigned              | 354870          | 453050 | 456842 | 571869 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 359744          | 488930 | 487068 | 638837 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 348853          | 457211 | 467103 | 586198 | 360     |
| bulkBuyListings                       | 336556          | 414317 | 413334 | 518867 | 120     |
| bulkBuyListingsCosigned               | 345889          | 444357 | 448449 | 569587 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 350613          | 482176 | 475456 | 646776 | 240     |
| bulkBuyListingsWithFeesOnTop          | 340498          | 451330 | 453974 | 595258 | 240     |
| buyListing                            | 51540           | 82487  | 75777  | 120929 | 180     |
| buyListingCosigned                    | 51896           | 84483  | 78283  | 122899 | 180     |
| buyListingCosignedWithFeeOnTop        | 52145           | 89739  | 85702  | 133422 | 360     |
| buyListingWithFeeOnTop                | 51770           | 87724  | 83956  | 131433 | 360     |
| sweepCollection                       | 274378          | 299924 | 298387 | 341262 | 120     |
| sweepCollectionCosigned               | 278539          | 324779 | 324688 | 386828 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 278784          | 329983 | 331863 | 397382 | 240     |
| sweepCollectionWithFeeOnTop           | 274602          | 305107 | 304167 | 351792 | 240     |

| Cold Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 98313           | 111071 | 111153 | 123166 | 360     |
| acceptOfferCosigned                   | 98748           | 113556 | 113099 | 127704 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 99042           | 119987 | 119628 | 140272 | 1440    |
| acceptOfferWithFeeOnTop               | 98598           | 117494 | 117133 | 135726 | 720     |
| bulkAcceptOffers                      | 379288          | 456719 | 448158 | 554720 | 180     |
| bulkAcceptOffersCosigned              | 389070          | 487250 | 491042 | 606069 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 393944          | 523130 | 521268 | 673037 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 383053          | 491411 | 501303 | 620398 | 360     |
| bulkBuyListings                       | 370756          | 448517 | 447534 | 553067 | 120     |
| bulkBuyListingsCosigned               | 380089          | 478557 | 482649 | 603787 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 384813          | 516376 | 509656 | 680976 | 240     |
| bulkBuyListingsWithFeesOnTop          | 374698          | 485530 | 488174 | 629458 | 240     |
| buyListing                            | 85740           | 105287 | 106956 | 121610 | 180     |
| buyListingCosigned                    | 86096           | 107283 | 108298 | 126080 | 180     |
| buyListingCosignedWithFeeOnTop        | 86345           | 112539 | 112643 | 136603 | 360     |
| buyListingWithFeeOnTop                | 85970           | 110524 | 110198 | 132114 | 360     |
| sweepCollection                       | 308578          | 334124 | 332587 | 375462 | 120     |
| sweepCollectionCosigned               | 312739          | 358979 | 358888 | 421028 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 312984          | 364183 | 366063 | 431582 | 240     |
| sweepCollectionWithFeeOnTop           | 308802          | 339307 | 338367 | 385992 | 240     |