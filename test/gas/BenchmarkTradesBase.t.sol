pragma solidity 0.8.19;

import "../modules/CPortModule.t.sol";

contract BenchmarkTradesBaseTest is cPortModuleTest {

    function _runBenchmarkBuyListingAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary);
    }

    function _runBenchmarkBuyListingCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary);
    }

    function _runBenchmarkBuyListingCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary
    ) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, currency);
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary);
    }

    function _runBenchmarkBuyListingTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, currency);
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](numRuns);

        for (uint256 i = 1; i <= numRuns; i++) {
            tokenIds[i - 1] = i;
            pricingBoundsArray[i - 1] = PricingBounds({
                isSet: true,
                isImmutable: true,
                floorPrice: 1 ether,
                ceilingPrice: 500 ether
            });
        }

        bytes memory data2 = _cPortEncoder.encodeSetTokenPricingBoundsCalldata(address(_cPort), address(test721), tokenIds, pricingBoundsArray);
        
        _cPort.setTokenPricingBounds(data2);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary);
    }

    function _runBenchmarkBuyListing(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: 0,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: buyer,
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            _buySignedListing(
                saleDetails.buyer, 
                currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                fuzzedOrderInputs, 
                saleDetails, 
                EMPTY_SELECTOR);
        }
    }

    function _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListingCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary, emptyCosignature);
    }

    function _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListingCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary, emptyCosignature);
    }

    function _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary, bool emptyCosignature
    ) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, currency);
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBuyListingCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary, emptyCosignature);
    }

    function _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, currency);
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](numRuns);

        for (uint256 i = 1; i <= numRuns; i++) {
            tokenIds[i - 1] = i;
            pricingBoundsArray[i - 1] = PricingBounds({
                isSet: true,
                isImmutable: true,
                floorPrice: 1 ether,
                ceilingPrice: 500 ether
            });
        }

        bytes memory data2 = _cPortEncoder.encodeSetTokenPricingBoundsCalldata(address(_cPort), address(test721), tokenIds, pricingBoundsArray);
        
        _cPort.setTokenPricingBounds(data2);
        _runBenchmarkBuyListingCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyer, beneficiary, emptyCosignature);
    }

    function _runBenchmarkBuyListingCosigned(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        address buyer,
        address beneficiary,
        bool emptyCosignature) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: 0,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: buyer,
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            if (emptyCosignature) {
                _buyEmptyCosignedListing(
                    saleDetails.buyer, 
                    currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListing(
                    saleDetails.buyer, 
                    currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /*
    function testBenchmarkBulkAcceptOffersNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptOffers(100, 0, 0);
    }

    function testBenchmarkBulkBuyListingNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkBuyListing(100, 0, 0);
    }

    function testBenchmarkBuyListingNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBuyListing(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBuyListing(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBuyListing(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000);
    }

    function _runBenchmarkBuyListingAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListingCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListingCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListingTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](numRuns);

        for (uint256 i = 1; i <= numRuns; i++) {
            tokenIds[i - 1] = i;
            pricingBoundsArray[i - 1] = PricingBounds({
                isSet: true,
                isImmutable: true,
                floorPrice: 1 ether,
                ceilingPrice: 500 ether
            });
        }

        bytes memory data2 = _cPortEncoder.encodeSetTokenPricingBoundsCalldata(address(_cPort), address(test721), tokenIds, pricingBoundsArray);
        
        _cPort.setTokenPricingBounds(data2);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListing(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedListing = _getSignedListing(alicePk, saleDetails);
            bytes memory data = _cPortEncoder.encodeBuyListingCalldata(address(_cPort), saleDetails, signedListing);
    
            vm.prank(bob, bob);
            _cPort.buyListingForAnyone{value: saleDetails.itemPrice}(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function _runBenchmarkBulkBuyListing(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedListing = _getSignedListing(alicePk, saleDetails);

            Order[] memory saleDetailsSingleton = new Order[](1);
            saleDetailsSingleton[0] = saleDetails;

            SignatureECDSA[] memory signedListingSingleton = new SignatureECDSA[](1);
            signedListingSingleton[0] = signedListing;

            bytes memory data = _cPortEncoder.encodeBulkBuyListingsCalldata(address(_cPort), saleDetailsSingleton, signedListingSingleton);

            vm.prank(bob, bob);
            _cPort.bulkBuyListings{value: saleDetails.itemPrice}(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function _runBenchmarkBulkAcceptOffers(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedOffer = _getSignedCollectionOffer(bobPk, saleDetails);

            Order[] memory saleDetailsSingleton = new Order[](1);
            saleDetailsSingleton[0] = saleDetails;

            SignatureECDSA[] memory signedOfferSingleton = new SignatureECDSA[](1);
            signedOfferSingleton[0] = signedOffer;

            bytes memory data = _cPortEncoder.encodeBulkAcceptOffersCalldata(address(_cPort), true, saleDetailsSingleton, signedOfferSingleton);

            vm.prank(alice, alice);
            _cPort.bulkAcceptOffers(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function testBenchmarkAcceptItemOfferNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000);
    }

    function testBenchmarkAcceptItemOfferNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000);
    }

    function testBenchmarkAcceptItemOfferNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000);
    }

    function _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptItemOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(bob),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedOffer = _getSignedOffer(bobPk, saleDetails);

            bytes memory data = _cPortEncoder.encodeAcceptOfferCalldata(address(_cPort), false, saleDetails, signedOffer);
    
            vm.prank(alice, alice);
            _cPort.acceptOffer(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function testBenchmarkAcceptCollectionOfferNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000);
    }

    function testBenchmarkAcceptCollectionOfferNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000);
    }

    function testBenchmarkAcceptCollectionOfferNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000);
    }

    function _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptCollectionOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(bob),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedOffer = _getSignedCollectionOffer(bobPk, saleDetails);

            bytes memory data = _cPortEncoder.encodeAcceptOfferCalldata(address(_cPort), true, saleDetails, signedOffer);
    
            vm.prank(alice, alice);
            _cPort.acceptOffer(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }    
    }

    function testBenchmarkBuyBundledListingNoFees() public {
        uint256 numRuns = 100;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            BundledOrderBase memory bundledOfferDetails = BundledOrderBase({
                protocol: TokenProtocols.ERC721,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                marketplaceFeeNumerator: 0
            });
    
            BundledOrderExtended memory bundleOfferDetailsExtended = BundledOrderExtended({
                bundleBase: bundledOfferDetails,
                seller: alice,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
    
            Accumulator memory accumulator = Accumulator({
                tokenIds: new uint256[](numItemsInBundle),
                amounts: new uint256[](numItemsInBundle),
                salePrices: new uint256[](numItemsInBundle),
                maxRoyaltyFeeNumerators: new uint256[](numItemsInBundle),
                sellers: new address[](numItemsInBundle),
                sumListingPrices: 0
            });
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].nonce = 0;
                bundledOfferItems[i].expiration = 0;
                bundledOfferItems[i].seller = alice;
    
                Order memory saleDetails = 
                    Order({
                        protocol: bundledOfferDetails.protocol,
                        seller: bundledOfferItems[i].seller,
                        buyer: bundledOfferDetails.buyer,
                        marketplace: bundledOfferDetails.marketplace,
                        paymentMethod: bundledOfferDetails.paymentMethod,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount,
                        itemPrice: bundledOfferItems[i].itemPrice,
                        nonce: bundledOfferItems[i].nonce,
                        expiration: bundledOfferItems[i].expiration,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator
                    });
    
                accumulator.tokenIds[i] = saleDetails.tokenId;
                accumulator.amounts[i] = saleDetails.amount;
                accumulator.salePrices[i] = saleDetails.itemPrice;
                accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
                accumulator.sellers[i] = saleDetails.seller;
                accumulator.sumListingPrices += saleDetails.itemPrice;
    
                test721.mint(alice, saleDetails.tokenId);
                test721.setTokenRoyalty(saleDetails.tokenId, abe, 0);
            }
    
            AccumulatorHashes memory accumulatorHashes = 
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                });
    
            SignatureECDSA memory signedBundledListing = _getSignedBundledListing(alicePk, accumulatorHashes, bundleOfferDetailsExtended);

            bytes memory data = _cPortEncoder.encodeBuyBundledListingCalldata(address(_cPort), signedBundledListing, bundleOfferDetailsExtended, bundledOfferItems);    

            vm.prank(bob, bob);
            _cPort.buyBundledListing{value: accumulator.sumListingPrices}(data);
        }
    }

    function testBenchmarkSweepCollectionNoFees() public {
        uint256 numRuns = 50;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            BundledOrderBase memory bundledOfferDetails = BundledOrderBase({
                protocol: TokenProtocols.ERC721,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                marketplaceFeeNumerator: 0
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
            SignatureECDSA[] memory signedListings = new SignatureECDSA[](numItemsInBundle);
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                uint256 fakeAddressPk = 1000000 + i;
                address fakeAddress = payable(vm.addr(fakeAddressPk));
    
                bundledOfferItems[i].seller = fakeAddress;
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].nonce = _getNextNonce(fakeAddress);
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].expiration = type(uint256).max;

                Order memory saleDetails = 
                    Order({
                        protocol: bundledOfferDetails.protocol,
                        seller: bundledOfferItems[i].seller,
                        buyer: bundledOfferDetails.buyer,
                        marketplace: bundledOfferDetails.marketplace,
                        paymentMethod: bundledOfferDetails.paymentMethod,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount,
                        itemPrice: bundledOfferItems[i].itemPrice,
                        nonce: bundledOfferItems[i].nonce,
                        expiration: bundledOfferItems[i].expiration,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator
                    });
    
                signedListings[i] = _getSignedListing(fakeAddressPk, saleDetails);
    
                test721.mint(fakeAddress, saleDetails.tokenId);
                test721.setTokenRoyalty(saleDetails.tokenId, abe, 0);
    
                vm.prank(fakeAddress);
                test721.setApprovalForAll(address(_cPort), true);
            }

            bytes memory data = _cPortEncoder.encodeSweepCollectionCalldata(address(_cPort), bundledOfferDetails, bundledOfferItems, signedListings);
    
            vm.prank(bob, bob);
            _cPort.sweepCollection{value: paymentAmount * numItemsInBundle}(data);
        }
    }

    function testBenchmarkRevokeMasterNonce() public {
        uint256 numRuns = 100;

        for (uint256 run = 1; run <= numRuns; run++) {
            assertEq(_cPort.masterNonces(bob), run - 1);

            vm.prank(bob, bob);
            _cPort.revokeMasterNonce();

            assertEq(_cPort.masterNonces(bob), run);
        }
    }

    function testBenchmarkRevokeSingleNonce() public {
        uint256 numRuns = 5;
        for (uint256 run = 1; run <= numRuns; run++) {
            for (uint256 i = 0; i <= 255; i++) {
                uint256 nonce = (run - 1) * 256 + i;
                
                bytes memory data = _cPortEncoder.encodeRevokeSingleNonceCalldata(address(_cPort), nonce);

                vm.prank(bob, bob);
                vm.expectEmit(true, true, false, true);
                emit NonceInvalidated(nonce, bob, true);
                _cPort.revokeSingleNonce(data);
            }
        }
    }
    */
}