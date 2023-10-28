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
| acceptOffer                           | 63951           | 102360 | 105305 | 123004 | 720     |
| acceptOfferCosigned                   | 64391           | 104849 | 107796 | 127547 | 1440    |
| acceptOfferCosignedWithFeeOnTop       | 64841           | 111436 | 114695 | 140271 | 2880    |
| acceptOfferWithFeeOnTop               | 64379           | 108925 | 112263 | 135707 | 1440    |
| bulkAcceptOffers                      | 345585          | 440143 | 440334 | 555280 | 360     |
| bulkAcceptOffersCosigned              | 353831          | 469110 | 468148 | 605027 | 720     |
| bulkAcceptOffersCosignedWithFeesOnTop | 359734          | 506020 | 505550 | 673027 | 1440    |
| bulkAcceptOffersWithFeesOnTop         | 350256          | 475750 | 475547 | 621884 | 720     |
| bulkBuyListings                       | 337164          | 431534 | 432497 | 552681 | 240     |
| bulkBuyListingsCosigned               | 345879          | 461447 | 459073 | 603777 | 240     |
| bulkBuyListingsCosignedWithFeesOnTop  | 350603          | 499266 | 501843 | 680966 | 480     |
| bulkBuyListingsWithFeesOnTop          | 342013          | 469952 | 466289 | 630968 | 480     |
| buyListing                            | 51292           | 93704  | 97815  | 121460 | 360     |
| buyListingCosigned                    | 51895           | 95882  | 100373 | 126079 | 360     |
| buyListingCosignedWithFeeOnTop        | 52144           | 101138 | 105422 | 136602 | 720     |
| buyListingWithFeeOnTop                | 51762           | 99116  | 102983 | 132106 | 720     |
| sweepCollection                       | 274378          | 317024 | 317254 | 375462 | 240     |
| sweepCollectionCosigned               | 278539          | 341879 | 342143 | 421028 | 240     |
| sweepCollectionCosignedWithFeeOnTop   | 278784          | 347083 | 345098 | 431582 | 480     |
| sweepCollectionWithFeeOnTop           | 274602          | 322207 | 321665 | 385992 | 480     |

| Warm Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 63951           | 93810  | 94725  | 122321 | 360     |
| acceptOfferCosigned                   | 64391           | 96299  | 97217  | 126864 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 64841           | 102886 | 102422 | 139588 | 1440    |
| acceptOfferWithFeeOnTop               | 64379           | 100375 | 101074 | 135024 | 720     |
| bulkAcceptOffers                      | 345585          | 423043 | 414482 | 521080 | 180     |
| bulkAcceptOffersCosigned              | 353831          | 452010 | 455802 | 570827 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 359734          | 488920 | 487058 | 638827 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 350256          | 458650 | 468546 | 587684 | 360     |
| bulkBuyListings                       | 337164          | 414434 | 412935 | 518481 | 120     |
| bulkBuyListingsCosigned               | 345879          | 444347 | 448439 | 569577 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 350603          | 482166 | 475446 | 646766 | 240     |
| bulkBuyListingsWithFeesOnTop          | 342013          | 452852 | 455503 | 596768 | 240     |
| buyListing                            | 51292           | 82304  | 75627  | 120779 | 180     |
| buyListingCosigned                    | 51895           | 84482  | 78282  | 122898 | 180     |
| buyListingCosignedWithFeeOnTop        | 52144           | 89738  | 85701  | 133421 | 360     |
| buyListingWithFeeOnTop                | 51762           | 87716  | 83948  | 131425 | 360     |
| sweepCollection                       | 274378          | 299924 | 298387 | 341262 | 120     |
| sweepCollectionCosigned               | 278539          | 324779 | 324688 | 386828 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 278784          | 329983 | 331863 | 397382 | 240     |
| sweepCollectionWithFeeOnTop           | 274602          | 305107 | 304167 | 351792 | 240     |

| Cold Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 98151           | 110910 | 110991 | 123004 | 360     |
| acceptOfferCosigned                   | 98591           | 113399 | 112942 | 127547 | 720     |
| acceptOfferCosignedWithFeeOnTop       | 99041           | 119986 | 119627 | 140271 | 1440    |
| acceptOfferWithFeeOnTop               | 98579           | 117475 | 117114 | 135707 | 720     |
| bulkAcceptOffers                      | 379785          | 457243 | 448682 | 555280 | 180     |
| bulkAcceptOffersCosigned              | 388031          | 486210 | 490002 | 605027 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 393934          | 523120 | 521258 | 673027 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 384456          | 492850 | 502746 | 621884 | 360     |
| bulkBuyListings                       | 371364          | 448634 | 447135 | 552681 | 120     |
| bulkBuyListingsCosigned               | 380079          | 478547 | 482639 | 603777 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 384803          | 516366 | 509646 | 680966 | 240     |
| bulkBuyListingsWithFeesOnTop          | 376213          | 487052 | 489703 | 630968 | 240     |
| buyListing                            | 85492           | 105104 | 106708 | 121460 | 180     |
| buyListingCosigned                    | 86095           | 107282 | 108297 | 126079 | 180     |
| buyListingCosignedWithFeeOnTop        | 86344           | 112538 | 112642 | 136602 | 360     |
| buyListingWithFeeOnTop                | 85962           | 110516 | 110190 | 132106 | 360     |
| sweepCollection                       | 308578          | 334124 | 332587 | 375462 | 120     |
| sweepCollectionCosigned               | 312739          | 358979 | 358888 | 421028 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 312984          | 364183 | 366063 | 431582 | 240     |
| sweepCollectionWithFeeOnTop           | 308802          | 339307 | 338367 | 385992 | 240     |