// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
| |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
| |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
| |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
| |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
| |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
 
 By Limit Break, Inc.
*/ 

import "./CPortModule.sol";

contract ModulePaymentSettings is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address wrappedNativeCoinAddress_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, wrappedNativeCoinAddress_, defaultPaymentMethods) {}

    /**
     * @notice Returns an array of the immutable default payment methods specified at deploy time.  
     *         However, if any post-deployment default payment methods have been added, they are
     *         not returned here because using an enumerable payment method whitelist would make trades
     *         less gas efficient.  For post-deployment default payment methods, exchanges should index
     *         the `PaymentMethodAddedToWhitelist` and `PaymentMethodRemovedFromWhitelist` events.
     */
    function getDefaultPaymentMethods() external view returns (address[] memory) {
        return _getDefaultPaymentMethods();
    }

    /**
     * @notice Allows any user to create a new custom payment method whitelist.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The payment method whitelist id tracker has been incremented by `1`.
     * @dev    2. The caller has been assigned as the owner of the payment method whitelist.
     * @dev    3. A `CreatedPaymentMethodWhitelist` event has been emitted.
     *
     * @param  whitelistName             The name of the payment method whitelist.
     * @return paymentMethodWhitelistId  The id of the newly created payment method whitelist.
     */
    function createPaymentMethodWhitelist(
        string calldata whitelistName
    ) external returns (uint32 paymentMethodWhitelistId) {
        paymentMethodWhitelistId = appStorage().lastPaymentMethodWhitelistId++;
        appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId] = msg.sender;
        emit CreatedPaymentMethodWhitelist(paymentMethodWhitelistId, msg.sender, whitelistName);
    }

    /**
     * @notice Allows custom payment method whitelist owners to approve a new coin for use as a payment currency.
     *
     * @dev    Throws when caller is not the owner of the specified payment method whitelist.
     * @dev    Throws when the specified coin is already whitelisted under the specified whitelist id.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `paymentMethod` has been approved in `paymentMethodWhitelist` mapping.
     * @dev    2. A `PaymentMethodAddedToWhitelist` event has been emitted.
     *
     * @param  paymentMethodWhitelistId The id of the payment method whitelist to update.
     * @param  paymentMethod            The address of the payment method to whitelist.
     */
    function whitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = 
            appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (ptrPaymentMethodWhitelist[paymentMethod]) {
            revert cPort__PaymentMethodIsAlreadyApproved();
        }

        ptrPaymentMethodWhitelist[paymentMethod] = true;
        emit PaymentMethodAddedToWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    /**
     * @notice Allows custom payment method whitelist owners to remove a coin from the list of approved payment 
     *         currencies.
     *
     * @dev    Throws when caller is not the owner of the specified payment method whitelist.
     * @dev    Throws when the specified coin is not currently whitelisted under the specified whitelist id.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. `paymentMethod` has been removed from the `paymentMethodWhitelist` mapping.
     * @dev    2. A `PaymentMethodRemovedFromWhitelist` event has been emitted.
     *
     * @param  paymentMethodWhitelistId The id of the payment method whitelist to update.
     * @param  paymentMethod                     The address of the payment method to unwhitelist.
     */
    function unwhitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = 
            appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (!ptrPaymentMethodWhitelist[paymentMethod]) {
            revert cPort__CoinIsNotApproved();
        }

        delete ptrPaymentMethodWhitelist[paymentMethod];
        emit PaymentMethodRemovedFromWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    /**
     * @notice Allows the smart contract, the contract owner, or the contract admin of any NFT collection to 
     *         specify the payment settings for their collections.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the royalty backfill numerator is greater than 10,000.
     * @dev    Throws when the royalty bounty numerator is greater than 10,000.
     * @dev    Throws when the specified payment method whitelist id does not exist.
     * 
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The `PaymentSettings` type for the collection has been set.
     * @dev    2. The `paymentMethodWhitelistId` for the collection has been set, if applicable.
     * @dev    3. The `constrainedPricingPaymentMethod` for the collection has been set, if applicable.
     * @dev    4. The `royaltyBackfillNumerator` for the collection has been set.
     * @dev    5. The `royaltyBackfillReceiver` for the collection has been set.
     * @dev    6. The `royaltyBountyNumerator` for the collection has been set.
     * @dev    7. The `exclusiveBountyReceiver` for the collection has been set.
     * @dev    8. An `UpdatedCollectionPaymentSettings` event has been emitted.
     *
     * @param  tokenAddress                    The smart contract address of the NFT collection.
     * @param  paymentSettings                 The payment settings for the collection.
     * @param  paymentMethodWhitelistId        The id of the payment method whitelist to use for the collection.
     * @param  constrainedPricingPaymentMethod The payment method to use for min/max pricing.
     * @param  royaltyBackfillNumerator        The royalty backfill numerator for the collection.
     * @param  royaltyBackfillReceiver         The royalty backfill receiver for the collection.
     * @param  royaltyBountyNumerator          The royalty bounty numerator for the collection.
     * @param  exclusiveBountyReceiver         The exclusive bounty receiver for the collection.
     */
    function setCollectionPaymentSettings(
        address tokenAddress, 
        PaymentSettings paymentSettings,
        uint32 paymentMethodWhitelistId,
        address constrainedPricingPaymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver) external {
            _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

            if (royaltyBackfillNumerator > FEE_DENOMINATOR) {
                revert cPort__RoyaltyBackfillNumeratorCannotExceedFeeDenominator();
            }

            if (royaltyBountyNumerator > FEE_DENOMINATOR) {
                revert cPort__RoyaltyBountyNumeratorCannotExceedFeeDenominator();
            }

            if (
                paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist || 
                paymentSettings == PaymentSettings.AllowAnyPaymentMethod
            ) {
                paymentMethodWhitelistId = 0;
                constrainedPricingPaymentMethod = address(0);
            } else if (paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
                constrainedPricingPaymentMethod = address(0);
            } else if (paymentSettings == PaymentSettings.PricingConstraints) {
                paymentMethodWhitelistId = 0;
            }

            if (paymentMethodWhitelistId > appStorage().lastPaymentMethodWhitelistId) {
                revert cPort__PaymentMethodWhitelistDoesNotExist();
            }

            appStorage().collectionRoyaltyBackfillReceivers[tokenAddress] = royaltyBackfillReceiver;
            appStorage().collectionExclusiveBountyReceivers[tokenAddress] = exclusiveBountyReceiver;

            appStorage().collectionPaymentSettings[tokenAddress] = CollectionPaymentSettings({
                paymentSettings: paymentSettings,
                paymentMethodWhitelistId: paymentMethodWhitelistId,
                constrainedPricingPaymentMethod: constrainedPricingPaymentMethod,
                royaltyBackfillNumerator: royaltyBackfillNumerator,
                royaltyBountyNumerator: royaltyBountyNumerator,
                isRoyaltyBountyExclusive: exclusiveBountyReceiver != address(0)});

            emit UpdatedCollectionPaymentSettings(
                tokenAddress, 
                paymentSettings, 
                paymentMethodWhitelistId, 
                constrainedPricingPaymentMethod,
                royaltyBackfillNumerator,
                royaltyBackfillReceiver,
                royaltyBountyNumerator,
                exclusiveBountyReceiver);
    }

    /**
     * @notice Allows the smart contract, the contract owner, or the contract admin of any NFT collection to 
     *         specify their own bounded price at the collection level.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the specified floor price is greater than the ceiling price.
     * 
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The collection-level pricing bounds for the specified tokenAddress has been set.
     * @dev    2. An `UpdatedCollectionLevelPricingBoundaries` event has been emitted.
     *
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  pricingBounds Includes the floor price and ceiling price.
     */
    function setCollectionPricingBounds(address tokenAddress, PricingBounds calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(pricingBounds.floorPrice > pricingBounds.ceilingPrice) {
            revert cPort__CeilingPriceMustBeGreaterThanFloorPrice();
        }
        
        appStorage().collectionPricingBounds[tokenAddress] = pricingBounds;
        
        emit UpdatedCollectionLevelPricingBoundaries(
            tokenAddress, 
            pricingBounds.floorPrice, 
            pricingBounds.ceilingPrice);
    }

    /**
     * @notice Allows the smart contract, the contract owner, or the contract admin of any NFT collection to 
     *         specify their own bounded price at the individual token level.
     *
     * @dev    Throws when the specified tokenAddress is address(0).
     * @dev    Throws when the caller is not the contract, the owner or the administrator of the specified tokenAddress.
     * @dev    Throws when the lengths of the tokenIds and pricingBounds array don't match.
     * @dev    Throws when the tokenIds or pricingBounds array length is zero. 
     * @dev    Throws when the any of the specified floor prices is greater than the ceiling price for that token id.
     * 
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The token-level pricing bounds for the specified tokenAddress and token ids has been set.
     * @dev    2. An `UpdatedTokenLevelPricingBoundaries` event has been emitted.
     *
     * @param  tokenAddress  The smart contract address of the NFT collection.
     * @param  tokenIds      An array of token ids for which pricing bounds are being set.
     * @param  pricingBounds An array of pricing bounds used to set the floor and ceiling per token.
     */
    function setTokenPricingBounds(
        address tokenAddress, 
        uint256[] calldata tokenIds, 
        PricingBounds[] calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(tokenIds.length != pricingBounds.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if(tokenIds.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        mapping (uint256 => PricingBounds) storage ptrTokenPricingBounds = 
            appStorage().tokenPricingBounds[tokenAddress];

        uint256 tokenId;
        for(uint256 i = 0; i < tokenIds.length;) {
            tokenId = tokenIds[i];
            PricingBounds memory pricingBounds_ = pricingBounds[i];

            if(pricingBounds_.floorPrice > pricingBounds_.ceilingPrice) {
                revert cPort__CeilingPriceMustBeGreaterThanFloorPrice();
            }

            ptrTokenPricingBounds[tokenId] = pricingBounds_;

            emit UpdatedTokenLevelPricingBoundaries(
                tokenAddress, 
                tokenId, 
                pricingBounds_.floorPrice, 
                pricingBounds_.ceilingPrice);
            
            unchecked {
                ++i;
            }
        }
    }
}
