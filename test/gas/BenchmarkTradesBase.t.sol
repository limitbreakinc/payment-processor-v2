pragma solidity 0.8.19;

import "../modules/CPortModule.t.sol";
import {Merkle} from "murky/Merkle.sol";

contract BenchmarkTradesBaseTest is cPortModuleTest {

    /**********************/
    /*     Buy Listing    */
    /**********************/

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
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

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

    /*******************************/
    /*     Buy Cosigned Listing    */
    /*******************************/

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
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

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

    /**********************/
    /* Accept Item Offers */
    /**********************/

    function _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptItemOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(buyerKey),
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            _acceptSignedItemOffer(
                alice, 
                fuzzedOrderInputs, 
                saleDetails, 
                EMPTY_SELECTOR);
        }
    }

    /*******************************/
    /* Accept Cosigned Item Offers */
    /*******************************/

    function _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
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
        _runBenchmarkAcceptItemOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptItemOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptItemOfferCosigned(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature) internal {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(buyerKey),
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            if (emptyCosignature) {
                _acceptEmptyCosignedItemOffer(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _acceptCosignedItemOffer(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /****************************/
    /* Accept Collection Offers */
    /****************************/

    function _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptCollectionOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(buyerKey),
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            _acceptSignedCollectionOffer(
                alice, 
                fuzzedOrderInputs, 
                saleDetails, 
                EMPTY_SELECTOR);
        }    
    }

    /*************************************/
    /* Accept Cosigned Collection Offers */
    /*************************************/

    function _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
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
        _runBenchmarkAcceptCollectionOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptCollectionOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptCollectionOfferCosigned(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(buyerKey),
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            if (emptyCosignature) {
                _acceptEmptyCosignedCollectionOffer(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _acceptCosignedCollectionOffer(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
        }    
    }

    /****************************/
    /* Accept Token Set Offers  */
    /****************************/

    function _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptTokenSetOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptTokenSetOffer(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary);
    }

    function _runBenchmarkAcceptTokenSetOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary
    ) internal {
        uint256[] memory tokenSetIds = new uint256[](numRuns);
        bytes32[] memory data = new bytes32[](numRuns);
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            tokenSetIds[tokenId - 1] = tokenId;
            data[tokenId - 1] = keccak256(abi.encode(address(test721), tokenId));
        }

        Merkle merkle = new Merkle();
        bytes32 root = merkle.getRoot(data);

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(buyerKey),
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            _acceptSignedTokenSetOffer(
                alice,
                fuzzedOrderInputs,
                saleDetails, 
                TokenSetProof({
                    rootHash: root,
                    proof: merkle.getProof(data, tokenId - 1)
                }),
                EMPTY_SELECTOR);
        }    
    }

    /*************************************/
    /* Accept Cosigned Token Set Offers  */
    /*************************************/

    function _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                currency);

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
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
        _runBenchmarkAcceptTokenSetOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
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
        _runBenchmarkAcceptTokenSetOfferCosigned(numRuns, marketplaceFeeRate, royaltyFeeRate, currency, buyerKey, beneficiary, emptyCosignature);
    }

    function _runBenchmarkAcceptTokenSetOfferCosigned(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate,
        address currency,
        uint160 buyerKey,
        address beneficiary,
        bool emptyCosignature
    ) internal {
        uint256[] memory tokenSetIds = new uint256[](numRuns);
        bytes32[] memory data = new bytes32[](numRuns);
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            tokenSetIds[tokenId - 1] = tokenId;
            data[tokenId - 1] = keccak256(abi.encode(address(test721), tokenId));
        }

        Merkle merkle = new Merkle();
        bytes32 root = merkle.getRoot(data);

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(marketplaceFeeRate),
                royaltyFeeRate: uint24(royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(buyerKey),
                beneficiary: beneficiary,
                marketplace: cal,
                paymentMethod: currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });

            if (emptyCosignature) {
                _acceptEmptyCosignedTokenSetOffer(
                    alice,
                    fuzzedOrderInputs,
                    saleDetails, 
                    TokenSetProof({
                        rootHash: root,
                        proof: merkle.getProof(data, tokenId - 1)
                    }),
                    EMPTY_SELECTOR);
            } else {
                _acceptCosignedTokenSetOffer(
                    alice,
                    fuzzedOrderInputs,
                    saleDetails, 
                    TokenSetProof({
                        rootHash: root,
                        proof: merkle.getProof(data, tokenId - 1)
                    }),
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