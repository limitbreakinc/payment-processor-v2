// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

error cPort__AmountForERC721SalesMustEqualOne();
error cPort__AmountForERC1155SalesGreaterThanZero();
error cPort__BadPaymentMethod();
error cPort__CallerDoesNotOwnPaymentMethodWhitelist();
error cPort__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
error cPort__CeilingPriceMustBeGreaterThanFloorPrice();
error cPort__ChannelIsNotTrustedForwarder();
error cPort__CoinIsNotApproved();
error cPort__CosignatureHasExpired();
error cPort__DispensingTokenWasUnsuccessful();
error cPort__EIP1271SignatureInvalid();
error cPort__FailedToTransferProceeds();
error cPort__FeeOnTopCannotBeGreaterThanItemPrice();
error cPort__IncorrectTokenSetMerkleProof();
error cPort__InputArrayLengthCannotBeZero();
error cPort__InputArrayLengthMismatch();
error cPort__InvalidConstructorArguments();
error cPort__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
error cPort__NotAuthorizedByCoSigner();
error cPort__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
error cPort__OrderHasExpired();
error cPort__OrderIsEitherCancelledOrFilled();
error cPort__OrderProtocolERC1155FillPartialUnsupportedInSweeps();
error cPort__PartialFillsNotSupportedForNonDivisibleItems();
error cPort__PaymentCoinIsNotAnApprovedPaymentMethod();
error cPort__PaymentMethodIsAlreadyApproved();
error cPort__PaymentMethodWhitelistDoesNotExist();
error cPort__RanOutOfNativeFunds();
error cPort__RoyaltyBackfillNumeratorCannotExceedFeeDenominator();
error cPort__RoyaltyBountyNumeratorCannotExceedFeeDenominator();
error cPort__SalePriceAboveMaximumCeiling();
error cPort__SalePriceBelowMinimumFloor();
error cPort__SignatureAlreadyUsedOrRevoked();
error cPort__TradeOriginatedFromUntrustedChannel();
error cPort__UnableToFillMinimumRequestedQuantity();
error cPort__UnauthorizedOrder();
error cPort__UnauthorizedTaker();