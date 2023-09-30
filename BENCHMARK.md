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

| Warm Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 62790           | 75194  | 75182  | 87872  | 180     |
| acceptOfferCosigned                   | 59869           | 74005  | 73669  | 88412  | 360     |
| acceptOfferCosignedWithFeeOnTop       | 60324           | 80593  | 80699  | 101133 | 720     |
| acceptOfferWithFeeOnTop               | 63193           | 81729  | 81837  | 100539 | 360     |
| bulkAcceptOffers                      | 334073          | 412191 | 404657 | 511734 | 180     |
| bulkAcceptOffersCosigned              | 343164          | 425671 | 422067 | 529520 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 348992          | 462438 | 471446 | 597311 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 338706          | 447690 | 458006 | 578164 | 360     |
| bulkBuyListings                       | 323941          | 402053 | 399694 | 507669 | 120     |
| bulkBuyListingsCosigned               | 333871          | 417023 | 413403 | 527664 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 338532          | 455156 | 458134 | 605568 | 240     |
| bulkBuyListingsWithFeesOnTop          | 329217          | 441445 | 444414 | 587506 | 240     |
| buyListing                            | 49861           | 67581  | 67181  | 86115  | 120     |
| buyListingCosigned                    | 47226           | 66616  | 66216  | 86820  | 120     |
| buyListingCosignedWithFeeOnTop        | 47472           | 71800  | 71818  | 97330  | 240     |
| buyListingWithFeeOnTop                | 50449           | 73041  | 72738  | 96835  | 240     |
| sweepCollection                       | 262431          | 288902 | 286422 | 331850 | 120     |
| sweepCollectionCosigned               | 265825          | 296858 | 296572 | 344381 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 266026          | 302016 | 299483 | 354886 | 240     |
| sweepCollectionWithFeeOnTop           | 262719          | 294147 | 294258 | 342440 | 240     |

| Cold Benchmark                        | Min             | Avg    | Median | Max    | # calls |
|---------------------------------------|-----------------|--------|--------|--------|---------|
| acceptOffer                           | 96990           | 109394 | 109382 | 122072 | 180     |
| acceptOfferCosigned                   | 76969           | 99655  | 99773  | 122612 | 360     |
| acceptOfferCosignedWithFeeOnTop       | 77424           | 106243 | 106249 | 135333 | 720     |
| acceptOfferWithFeeOnTop               | 97393           | 115929 | 116037 | 134739 | 360     |
| bulkAcceptOffers                      | 368273          | 446391 | 438857 | 545934 | 180     |
| bulkAcceptOffersCosigned              | 368991          | 451321 | 447604 | 555098 | 360     |
| bulkAcceptOffersCosignedWithFeesOnTop | 374837          | 488088 | 497235 | 622856 | 720     |
| bulkAcceptOffersWithFeesOnTop         | 372906          | 481890 | 492206 | 612364 | 360     |
| bulkBuyListings                       | 358141          | 436253 | 433894 | 541869 | 120     |
| bulkBuyListingsCosigned               | 359706          | 442673 | 439034 | 553129 | 120     |
| bulkBuyListingsCosignedWithFeesOnTop  | 364381          | 480806 | 483800 | 631019 | 240     |
| bulkBuyListingsWithFeesOnTop          | 363417          | 475645 | 478614 | 621706 | 240     |
| buyListing                            | 84061           | 101781 | 101381 | 120315 | 120     |
| buyListingCosigned                    | 64326           | 92266  | 92158  | 121020 | 120     |
| buyListingCosignedWithFeeOnTop        | 64572           | 97450  | 97172  | 131530 | 240     |
| buyListingWithFeeOnTop                | 84649           | 107241 | 106938 | 131035 | 240     |
| sweepCollection                       | 296631          | 323102 | 320622 | 366050 | 120     |
| sweepCollectionCosigned               | 292042          | 322508 | 321650 | 369444 | 120     |
| sweepCollectionCosignedWithFeeOnTop   | 292243          | 327666 | 325034 | 379947 | 240     |
| sweepCollectionWithFeeOnTop           | 296919          | 328347 | 328458 | 376640 | 240     |


| Warmed Slots Benchmark (Misleading)   | Min             | Avg     | Median  | Max     | # calls |
|---------------------------------------|-----------------|---------|---------|---------|---------|
| acceptOffer                           | 24472           | 36404   | 36072   | 124506  | 18000   |
| acceptOfferCosigned                   | 24913           | 37426   | 36653   | 125048  | 36000   |
| acceptOfferCosignedWithFeeOnTop       | 25278           | 40438   | 39440   | 137769  | 72000   |
| acceptOfferWithFeeOnTop               | 24795           | 39366   | 38117   | 137175  | 36000   |
| bulkAcceptOffers                      | 281973          | 379725  | 373195  | 558265  | 1800    |
| bulkAcceptOffersCosigned              | 291064          | 394515  | 393282  | 567440  | 3600    |
| bulkAcceptOffersCosignedWithFeesOnTop | 296892          | 428228  | 428092  | 635221  | 7200    |
| bulkAcceptOffersWithFeesOnTop         | 286606          | 412168  | 409416  | 624709  | 3600    |
| bulkBuyListings                       | 271841          | 372638  | 377569  | 541869  | 1200    |
| bulkBuyListingsCosigned               | 281771          | 388913  | 388810  | 553129  | 1200    |
| bulkBuyListingsCosignedWithFeesOnTop  | 286432          | 425403  | 419021  | 631019  | 2400    |
| bulkBuyListingsWithFeesOnTop          | 277117          | 410387  | 407242  | 621706  | 2400    |
| buyListing                            | 23783           | 35881   | 35210   | 120315  | 12000   |
| buyListingCosigned                    | 24347           | 37112   | 36016   | 121020  | 12000   |
| buyListingCosignedWithFeeOnTop        | 24544           | 40267   | 39348   | 131530  | 24000   |
| buyListingWithFeeOnTop                | 24148           | 39294   | 38835   | 131035  | 24000   |
| sweepCollection                       | 222304          | 259487  | 252424  | 366050  | 1200    |
| sweepCollectionCosigned               | 225698          | 268748  | 264090  | 369444  | 1200    |
| sweepCollectionCosignedWithFeeOnTop   | 225899          | 272264  | 266605  | 379947  | 2400    |
| sweepCollectionWithFeeOnTop           | 222592          | 263090  | 257260  | 376640  | 2400    |