// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
// | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
// | |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
// | |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
// | |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
// | |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
// | |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
// | |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
// | |              | || |              | || |              | || |              | || |              | || |              | |
// | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
//  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
// 
// By Limit Break, Inc.

import "./CPortModule.sol";

contract ModulePaymentSettings is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    function createPaymentMethodWhitelist(string calldata whitelistName) external returns (uint32 paymentMethodWhitelistId) {
        unchecked {
            paymentMethodWhitelistId = ++appStorage().lastPaymentMethodWhitelistId;
        }

        appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId] = msg.sender;

        emit CreatedPaymentMethodWhitelist(paymentMethodWhitelistId, msg.sender, whitelistName);
    }

    function whitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (ptrPaymentMethodWhitelist[paymentMethod]) {
            revert cPort__PaymentMethodIsAlreadyApproved();
        }

        ptrPaymentMethodWhitelist[paymentMethod] = true;
        emit PaymentMethodAddedToWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    function unwhitelistPaymentMethod(uint32 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (!ptrPaymentMethodWhitelist[paymentMethod]) {
            revert cPort__CoinIsNotApproved();
        }

        delete ptrPaymentMethodWhitelist[paymentMethod];
        emit PaymentMethodRemovedFromWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

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

            appStorage().collectionPaymentSettings[tokenAddress] = CollectionPaymentSettings(
                paymentSettings,
                paymentMethodWhitelistId,
                constrainedPricingPaymentMethod,
                royaltyBackfillNumerator,
                royaltyBountyNumerator,
                exclusiveBountyReceiver != address(0));

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

    function setCollectionPricingBounds(address tokenAddress, PricingBounds calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(appStorage().collectionPricingBounds[tokenAddress].isImmutable) {
            revert cPort__PricingBoundsAreImmutable();
        }

        if(pricingBounds.floorPrice > pricingBounds.ceilingPrice) {
            revert cPort__CeilingPriceMustBeGreaterThanFloorPrice();
        }
        
        appStorage().collectionPricingBounds[tokenAddress] = pricingBounds;
        
        emit UpdatedCollectionLevelPricingBoundaries(
            tokenAddress, 
            pricingBounds.floorPrice, 
            pricingBounds.ceilingPrice);
    }

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

        mapping (uint256 => PricingBounds) storage ptrTokenPricingBounds = appStorage().tokenPricingBounds[tokenAddress];

        uint256 tokenId;
        for(uint256 i = 0; i < tokenIds.length;) {
            tokenId = tokenIds[i];
            PricingBounds memory pricingBounds_ = pricingBounds[i];

            if(ptrTokenPricingBounds[tokenId].isImmutable) {
                revert cPort__PricingBoundsAreImmutable();
            }

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
