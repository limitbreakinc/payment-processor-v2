// SPDX-License-Identifier: BSL-1.1
pragma solidity 0.8.19;

/// @dev Thrown when an order is an ERC721 order and the amount is not one.
error PaymentProcessor__AmountForERC721SalesMustEqualOne();

/// @dev Thrown when an order is an ERC1155 order and the amount is zero.
error PaymentProcessor__AmountForERC1155SalesGreaterThanZero();

/// @dev Thrown when an offer is being accepted and the payment method is the chain native token.
error PaymentProcessor__BadPaymentMethod();

/// @dev Thrown when adding or removing a payment method from a whitelist that the caller does not own.
error PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist();

/**
 * @dev Thrown when modifying collection payment settings, pricing bounds, or trusted channels on a collection
 * @dev that the caller is not the owner of or a member of the default admin role for.
 */
error PaymentProcessor__CallerMustHaveElevatedPermissionsForSpecifiedNFT();

/// @dev Thrown when setting a collection or token pricing constraint with a floor price greater than ceiling price.
error PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();

/// @dev Thrown when adding a trusted channel that is not a trusted forwarder deployed by the trusted forwarder factory.
error PaymentProcessor__ChannelIsNotTrustedForwarder();

/// @dev Thrown when removing a payment method from a whitelist when that payment method is not on the whitelist.
error PaymentProcessor__CoinIsNotApproved();

/// @dev Thrown when the current block time is greater than the expiration time for the cosignature.
error PaymentProcessor__CosignatureHasExpired();

/// @dev Thrown when the cosigner has self destructed.
error PaymentProcessor__CosignerHasSelfDestructed();

/// @dev Thrown when a token failed to transfer to the beneficiary and partial fills are disabled.
error PaymentProcessor__DispensingTokenWasUnsuccessful();

/// @dev Thrown when a maker is a contract and the contract does not return the correct EIP1271 response to validate the signature.
error PaymentProcessor__EIP1271SignatureInvalid();

/// @dev Thrown when a native token transfer call fails to transfer the tokens.
error PaymentProcessor__FailedToTransferProceeds();

/// @dev Thrown when the additional fee on top exceeds the item price.
error PaymentProcessor__FeeOnTopCannotBeGreaterThanItemPrice();

/// @dev Thrown when the supplied root hash, token and proof do not match.
error PaymentProcessor__IncorrectTokenSetMerkleProof();

/// @dev Thrown when an input array has zero items in a location where it must have items.
error PaymentProcessor__InputArrayLengthCannotBeZero();

/// @dev Thrown when multiple input arrays have different lengths but are required to be the same length.
error PaymentProcessor__InputArrayLengthMismatch();

/// @dev Thrown when Payment Processor or a module is being deployed with invalid constructor arguments.
error PaymentProcessor__InvalidConstructorArguments();

/// @dev Thrown when the maker or taker is a banned account on the collection being traded.
error PaymentProcessor__MakerOrTakerIsBannedAccount();

/// @dev Thrown when the combined marketplace and royalty fees will exceed the item price.
error PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();

/// @dev Thrown when the recovered address from a cosignature does not match the order cosigner.
error PaymentProcessor__NotAuthorizedByCosigner();

/// @dev Thrown when the ERC2981 or backfilled royalties exceed the maximum fee specified by the order maker.
error PaymentProcessor__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();

/// @dev Thrown when the current block timestamp is greater than the order expiration time.
error PaymentProcessor__OrderHasExpired();

/// @dev Thrown when attempting to fill a partially fillable order that has already been filled or cancelled.
error PaymentProcessor__OrderIsEitherCancelledOrFilled();

/// @dev Thrown when attempting to execute a sweep order for partially fillable orders.
error PaymentProcessor__OrderProtocolERC1155FillPartialUnsupportedInSweeps();

/// @dev Thrown when attempting to partially fill an order where the item price is not equally divisible by the amount of tokens.
error PaymentProcessor__PartialFillsNotSupportedForNonDivisibleItems();

/// @dev Thrown when attempting to execute an order with a payment method that is not allowed by the collection payment settings.
error PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();

/// @dev Thrown when adding a payment method to a whitelist when that payment method is already on the list.
error PaymentProcessor__PaymentMethodIsAlreadyApproved();

/// @dev Thrown when setting collection payment settings with a whitelist id that does not exist.
error PaymentProcessor__PaymentMethodWhitelistDoesNotExist();

/// @dev Thrown when attempting to transfer ownership of a payment method whitelist to the zero address.
error PaymentProcessor__PaymentMethodWhitelistOwnershipCannotBeTransferredToZeroAddress();

/// @dev Thrown when attempting to override the default push payment gas limit below the default value.
error PaymentProcessor__PushPaymentGasLimitTooLow();

/// @dev Thrown when distributing payments and fees in native token and the amount remaining is less than the amount to distribute.
error PaymentProcessor__RanOutOfNativeFunds();

/// @dev Thrown when attempting to set a royalty backfill numerator that would result in royalties greater than 100%.
error PaymentProcessor__RoyaltyBackfillNumeratorCannotExceedFeeDenominator();

/// @dev Thrown when attempting to set a royalty bounty numerator that would result in royalty bounties greater than 100%.
error PaymentProcessor__RoyaltyBountyNumeratorCannotExceedFeeDenominator();

/// @dev Thrown when a collection is set to pricing constraints and the item price exceeds the defined maximum price.
error PaymentProcessor__SalePriceAboveMaximumCeiling();

/// @dev Thrown when a collection is set to pricing constraints and the item price is below the defined minimum price.
error PaymentProcessor__SalePriceBelowMinimumFloor();

/// @dev Thrown when a maker's nonce has already been used for an executed order or cancelled by the maker.
error PaymentProcessor__SignatureAlreadyUsedOrRevoked();

/// @dev Thrown when a maker's nonce has not already been used for an executed order but an item with that nonce fails to fill.
error PaymentProcessor__SignatureNotUsedOrRevoked();

/**
 * @dev Thrown when a collection is set to block untrusted channels and the order execution originates from a channel 
 * @dev that is not in the collection's trusted channel list.
 */ 
error PaymentProcessor__TradeOriginatedFromUntrustedChannel();

/// @dev Thrown when a trading of a specific collection has been paused by the collection owner or admin.
error PaymentProcessor__TradingIsPausedForCollection();

/**
 * @dev Thrown when attempting to fill a partially fillable order and the amount available to fill 
 * @dev is less than the specified minimum to fill.
 */
error PaymentProcessor__UnableToFillMinimumRequestedQuantity();

/// @dev Thrown when the recovered signer for an order does not match the order maker.
error PaymentProcessor__UnauthorizedOrder();

/// @dev Thrown when the taker on a cosigned order does not match the taker on the cosignature.
error PaymentProcessor__UnauthorizedTaker();

/// @dev Thrown when the Payment Processor or a module is being deployed with uninitialized configuration values.
error PaymentProcessor__UninitializedConfiguration();