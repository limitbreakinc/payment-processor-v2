// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

error cPort__AmountForERC721SalesMustEqualOne();
error cPort__AmountForERC1155SalesGreaterThanZero();
error cPort__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
error cPort__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
error cPort__CeilingPriceMustBeGreaterThanFloorPrice();
error cPort__CoinDoesNotImplementDecimalsAndLikelyIsNotAnERC20Token();
error cPort__CoinIsNotApproved();
error cPort__DispensingTokenWasUnsuccessful();
error cPort__FailedToTransferProceeds();
error cPort__InputArrayLengthCannotBeZero();
error cPort__InputArrayLengthMismatch();
error cPort__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
error cPort__OfferPriceMustEqualSalePrice();
error cPort__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
error cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
error cPort__PricingBoundsAreImmutable();
error cPort__SalePriceAboveMaximumCeiling();
error cPort__SalePriceBelowMinimumFloor();
error cPort__PaymentMethodWhitelistDoesNotExist();
error cPort__SignatureAlreadyUsedOrRevoked();
error cPort__CallerDoesNotOwnPaymentMethodWhitelist();
error cPort__PaymentMethodIsAlreadyApproved();
error cPort__BuyerMustBeCallerAndTransactionOrigin();
error cPort__OrderHasExpired();
error cPort__UnauthorizeSale();
error cPort__BadPaymentMethod();
error cPort__SellerMustBeCallerAndTransactionOrigin();
error cPort__RanOutOfNativeFunds();
error cPort__OverpaidNativeFunds();

error cPort__EIP1271SignatureInvalid();
error cPort__BuyerMustBeCaller();
error cPort__NotAuthorizedByCoSigner();
error cPort__SellerDidNotAuthorizeSale();
error cPort__BuyerDidNotAuthorizePurchase();
error cPort__IncorrectTokenSetMerkleProof();