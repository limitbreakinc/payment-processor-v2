pragma solidity 0.8.19;

import "../modules/CPortModule.t.sol";
import {Merkle} from "murky/Merkle.sol";

contract BenchmarkTradesBaseTest is cPortModuleTest {

    struct BenchmarkParams {
        uint256 numRuns;
        uint256 marketplaceFeeRate;
        uint96 royaltyFeeRate;
        uint96 feeOnTopRate;
        uint16 royaltyBountyRate;
        address currency;
        uint160 buyerKey;
        address beneficiary;
    }

    struct CosignedBenchmarkParams {
        uint256 numRuns;
        uint256 marketplaceFeeRate;
        uint96 royaltyFeeRate;
        uint96 feeOnTopRate;
        uint16 royaltyBountyRate;
        address currency;
        uint160 buyerKey;
        address beneficiary;
        bool emptyCosignature;
    }

    struct BulkBenchmarkParams {
        uint256 batchSize;
        uint256 numRuns;
        uint256 marketplaceFeeRate;
        uint96 royaltyFeeRate;
        uint96 feeOnTopRate;
        uint16 royaltyBountyRate;
        address currency;
        uint160 buyerKey;
        address beneficiary;
    }

    struct BulkCosignedBenchmarkParams {
        uint256 batchSize;
        uint256 numRuns;
        uint256 marketplaceFeeRate;
        uint96 royaltyFeeRate;
        uint96 feeOnTopRate;
        uint16 royaltyBountyRate;
        address currency;
        uint160 buyerKey;
        address beneficiary;
        bool emptyCosignature;
    }

    /**********************/
    /*     Buy Listing    */
    /**********************/

    function _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListing(params);
    }

    function _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListing(params);
    }

    function _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBuyListing(params);
    }

    function _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkBuyListing(params);
    }

    function _runBenchmarkBuyListing(BenchmarkParams memory params) internal {

        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: 0,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: params.beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                _buySignedListing(
                    saleDetails.buyer, 
                    params.currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buySignedListingWithFeeOnTop(
                    saleDetails.buyer, 
                    params.currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    feeOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /*******************************/
    /*     Buy Cosigned Listing    */
    /*******************************/

    function _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListingCosigned(params);
    }

    function _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBuyListingCosigned(params);
    }

    function _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBuyListingCosigned(params);
    }

    function _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkBuyListingCosigned(params);
    }

    function _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams memory params) internal {

        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: 0,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: params.beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _buyEmptyCosignedListing(
                        saleDetails.buyer, 
                        params.currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        EMPTY_SELECTOR);
                } else {
                    _buyCosignedListing(
                        saleDetails.buyer, 
                        params.currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _buyEmptyCosignedListingWithFeeOnTop(
                        saleDetails.buyer, 
                        params.currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _buyCosignedListingWithFeeOnTop(
                        saleDetails.buyer, 
                        params.currency == address(0) ? uint128(saleDetails.itemPrice) : 0, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }

    /**********************/
    /* Accept Item Offers */
    /**********************/

    function _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOffer(params);
    }

    function _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOffer(params);
    }

    function _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkAcceptItemOffer(params);
    }

    function _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkAcceptItemOffer(params);
    }

    function _runBenchmarkAcceptItemOffer(BenchmarkParams memory params) internal {

        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: params.buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: params.beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(params.buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                _acceptSignedItemOffer(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _acceptSignedItemOfferWithFeeOnTop(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    feeOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /*******************************/
    /* Accept Cosigned Item Offers */
    /*******************************/

    function _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOfferCosigned(params);
    }

    function _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency, 
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptItemOfferCosigned(params);
    }

    function _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkAcceptItemOfferCosigned(params);
    }

    function _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkAcceptItemOfferCosigned(params);
    }

    function _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams memory params) internal {

        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: params.buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: params.beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(params.buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
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
            } else {
                if (params.emptyCosignature) {
                    _acceptEmptyCosignedItemOfferWithFeeOnTop(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _acceptCosignedItemOfferWithFeeOnTop(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }

    /****************************/
    /* Accept Collection Offers */
    /****************************/

    function _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOffer(params);
    }

    function _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOffer(params);
    }

    function _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkAcceptCollectionOffer(params);
    }

    function _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkAcceptCollectionOffer(params);
    }

    function _runBenchmarkAcceptCollectionOffer(BenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: params.buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: params.beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(params.buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                _acceptSignedCollectionOffer(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _acceptSignedCollectionOfferWithFeeOnTop(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    feeOnTop, 
                    EMPTY_SELECTOR);
            }
        }    
    }

    /*************************************/
    /* Accept Cosigned Collection Offers */
    /*************************************/

    function _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency, 
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOfferCosigned(params);
    }

    function _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency, 
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptCollectionOfferCosigned(params);
    }

    function _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkAcceptCollectionOfferCosigned(params);
    }

    function _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkAcceptCollectionOfferCosigned(params);
    }

    function _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: params.buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(paymentAmount),
                beneficiary: params.beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(vm.addr(params.buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
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
            } else {
                if (params.emptyCosignature) {
                    _acceptEmptyCosignedCollectionOfferWithFeeOnTop(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _acceptCosignedCollectionOfferWithFeeOnTop(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }    
    }

    /****************************/
    /* Accept Token Set Offers  */
    /****************************/

    function _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOffer(params);
    }

    function _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency, 
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOffer(params);
    }

    function _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkAcceptTokenSetOffer(params);
    }

    function _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkAcceptTokenSetOffer(params);
    }

    function _runBenchmarkAcceptTokenSetOffer(BenchmarkParams memory params) internal {
        uint256[] memory tokenSetIds = new uint256[](params.numRuns);
        bytes32[] memory data = new bytes32[](params.numRuns);
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            tokenSetIds[tokenId - 1] = tokenId;
            data[tokenId - 1] = keccak256(abi.encode(address(test721), tokenId));
        }

        Merkle merkle = new Merkle();

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : 100 ether * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: params.buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(100 ether),
                beneficiary: params.beneficiary,
                cosignerKey: 0
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: 100 ether,
                nonce: _getNextNonce(vm.addr(params.buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                _acceptSignedTokenSetOffer(
                    alice,
                    fuzzedOrderInputs,
                    saleDetails, 
                    TokenSetProof({
                        rootHash: merkle.getRoot(data),
                        proof: merkle.getProof(data, tokenId - 1)
                    }),
                    EMPTY_SELECTOR);
            } else {
                _acceptSignedTokenSetOfferWithFeeOnTop(
                    alice, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    TokenSetProof({
                        rootHash: merkle.getRoot(data),
                        proof: merkle.getProof(data, tokenId - 1)
                    }),
                    feeOnTop, 
                    EMPTY_SELECTOR);
            }
        }    
    }

    /*************************************/
    /* Accept Cosigned Token Set Offers  */
    /*************************************/

    function _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOfferCosigned(params);
    }

    function _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkAcceptTokenSetOfferCosigned(params);
    }

    function _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkAcceptTokenSetOfferCosigned(params);
    }

    function _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](params.numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](params.numRuns);

        for (uint256 i = 1; i <= params.numRuns; i++) {
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
        _runBenchmarkAcceptTokenSetOfferCosigned(params);
    }

    function _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams memory params) internal {
        uint256[] memory tokenSetIds = new uint256[](params.numRuns);
        bytes32[] memory data = new bytes32[](params.numRuns);
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            tokenSetIds[tokenId - 1] = tokenId;
            data[tokenId - 1] = keccak256(abi.encode(address(test721), tokenId));
        }

        Merkle merkle = new Merkle();

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : 100 ether * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 tokenId = 1; tokenId <= params.numRuns; tokenId++) {
            if ((tokenId - 1) % 3 == 0) {
                for (uint256 i = 0; i < 3; i++) {
                    test721.mint(alice, tokenId + i);
                    test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                }
            }

            FuzzedOrder721 memory fuzzedOrderInputs = FuzzedOrder721({
                buyerIsContract: false,
                marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                royaltyFeeRate: uint24(params.royaltyFeeRate),
                sellerKey: uint160(alicePk),
                expirationSeconds: 0, 
                buyerKey: params.buyerKey,
                tokenId: tokenId,
                itemPrice: uint128(100 ether),
                beneficiary: params.beneficiary,
                cosignerKey: uint160(cosignerPk)
            });
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: vm.addr(params.buyerKey),
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: 100 ether,
                nonce: _getNextNonce(vm.addr(params.buyerKey)),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: params.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: params.royaltyFeeRate
            });

            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _acceptEmptyCosignedTokenSetOffer(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        TokenSetProof({
                            rootHash: merkle.getRoot(data),
                            proof: merkle.getProof(data, tokenId - 1)
                        }),
                        EMPTY_SELECTOR);
                } else {
                    _acceptCosignedTokenSetOffer(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        TokenSetProof({
                            rootHash: merkle.getRoot(data),
                            proof: merkle.getProof(data, tokenId - 1)
                        }),
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _acceptEmptyCosignedTokenSetOfferWithFeeOnTop(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        TokenSetProof({
                            rootHash: merkle.getRoot(data),
                            proof: merkle.getProof(data, tokenId - 1)
                        }),
                        feeOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _acceptCosignedTokenSetOfferWithFeeOnTop(
                        alice, 
                        fuzzedOrderInputs, 
                        saleDetails, 
                        TokenSetProof({
                            rootHash: merkle.getRoot(data),
                            proof: merkle.getProof(data, tokenId - 1)
                        }),
                        feeOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }    
    }

    /**********************/
    /* Bulk Buy Listings  */
    /**********************/

    function _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkBuyListings(params);
    }

    function _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkBuyListings(params);
    }

    function _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkBuyListings(params);
    }

    function _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkBuyListings(params);
    }

    function _runBenchmarkBulkBuyListings(BulkBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: 0,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: 0
                });

                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(alice),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                _bulkBuySignedListings(
                    vm.addr(params.buyerKey), 
                    params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            } else {
                _bulkBuySignedListingsWithFeeOnTop(
                    vm.addr(params.buyerKey), 
                    params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /*******************************/
    /* Cosigned Bulk Buy Listings  */
    /*******************************/

    function _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkBuyListingsCosigned(params);
    }

    function _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkBuyListingsCosigned(params);
    }

    function _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkBuyListingsCosigned(params);
    }

    function _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkBuyListingsCosigned(params);
    }

    function _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: 0,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: uint160(cosignerPk)
                });

                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(alice),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                feesOnTop[batchIndex] = feeOnTop;
            }

            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _bulkBuyEmptyCosignedListings(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                } else {
                    _bulkBuyCosignedListings(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _bulkBuyEmptyCosignedListingsWithFeesOnTop(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feesOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _bulkBuyCosignedListingsWithFeesOnTop(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feesOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }

    /***************************/
    /* Bulk Accept Item Offers */
    /***************************/

    function _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptItemOffers(params);
    }

    function _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptItemOffers(params);
    }

    function _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkAcceptItemOffers(params);
    }

    function _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkAcceptItemOffers(params);
    }

    function _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }

        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: params.buyerKey,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: 0
                });
    
                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(vm.addr(params.buyerKey)),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                _bulkAcceptSignedItemOffers(
                    alice,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            } else {
                _bulkAcceptSignedItemOffersWithFeesOnTop(
                    alice,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /************************************/
    /* Bulk Accept Cosigned Item Offers */
    /************************************/

    function _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptItemOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptItemOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkAcceptItemOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkAcceptItemOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }

        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: params.buyerKey,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: uint160(cosignerPk)
                });
    
                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(vm.addr(params.buyerKey)),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _bulkAcceptEmptyCosignedItemOffers(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                } else {
                    _bulkAcceptCosignedItemOffers(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _bulkAcceptEmptyCosignedItemOffersWithFeesOnTop(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feesOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _bulkAcceptCosignedItemOffersWithFeesOnTop(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feesOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }

    /*********************************/
    /* Bulk Accept Collection Offers */
    /*********************************/

    function _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptCollectionOffers(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptCollectionOffers(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkAcceptCollectionOffers(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkAcceptCollectionOffers(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }

        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: params.buyerKey,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: 0
                });
    
                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(vm.addr(params.buyerKey)),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                _bulkAcceptSignedCollectionOffers(
                    alice,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            } else {
                _bulkAcceptSignedCollectionOffersWithFeesOnTop(
                    alice,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /******************************************/
    /* Bulk Accept Cosigned Collection Offers */
    /******************************************/

    function _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptCollectionOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptCollectionOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkAcceptCollectionOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkAcceptCollectionOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }

        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: params.buyerKey,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: uint160(cosignerPk)
                });
    
                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(vm.addr(params.buyerKey)),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _bulkAcceptEmptyCosignedCollectionOffers(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                } else {
                    _bulkAcceptCosignedCollectionOffers(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _bulkAcceptEmptyCosignedCollectionOffersWithFeesOnTop(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feesOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _bulkAcceptCosignedCollectionOffersWithFeesOnTop(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feesOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }

    /*********************************/
    /* Bulk Accept Token Set Offers  */
    /*********************************/

    function _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptTokenSetOffers(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptTokenSetOffers(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkAcceptTokenSetOffers(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkAcceptTokenSetOffers(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams memory params) internal {
        uint256[] memory tokenSetIds = new uint256[](params.numRuns * params.batchSize);
        bytes32[] memory data = new bytes32[](params.numRuns * params.batchSize);
        for (uint256 tokenId = 1; tokenId <= params.numRuns * params.batchSize; tokenId++) {
            tokenSetIds[tokenId - 1] = tokenId;
            data[tokenId - 1] = keccak256(abi.encode(address(test721), tokenId));
        }

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : 100 ether * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }

        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: params.buyerKey,
                    tokenId: tokenId,
                    itemPrice: uint128(100 ether),
                    beneficiary: params.beneficiary,
                    cosignerKey: 0
                });
    
                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: 100 ether,
                    nonce: _getNextNonce(vm.addr(params.buyerKey)),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                tokenSetProofsArray[batchIndex] = TokenSetProof({
                    rootHash: new Merkle().getRoot(data),
                    proof: new Merkle().getProof(data, tokenId - 1)
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                _bulkAcceptSignedTokenSetOffers(
                    alice,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    tokenSetProofsArray,
                    EMPTY_SELECTOR);
            } else {
                _bulkAcceptSignedTokenSetOffersWithFeesOnTop(
                    alice,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    tokenSetProofsArray,
                    feesOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /******************************************/
    /* Bulk Accept Cosigned Token Set Offers  */
    /******************************************/

    function _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_cPort),
            address(test721), 
            PaymentSettings.AllowAnyPaymentMethod, 
            0, 
            params.currency,
            params.royaltyBountyRate, 
            address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = 
            _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_cPort),
                address(test721), 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                params.currency,
                params.royaltyBountyRate, 
                address(0));

        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(params);
    }

    function _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams memory params) internal {
        uint256[] memory tokenSetIds = new uint256[](params.numRuns * params.batchSize);
        bytes32[] memory data = new bytes32[](params.numRuns * params.batchSize);
        for (uint256 tokenId = 1; tokenId <= params.numRuns * params.batchSize; tokenId++) {
            tokenSetIds[tokenId - 1] = tokenId;
            data[tokenId - 1] = keccak256(abi.encode(address(test721), tokenId));
        }

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : 100 ether * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }

        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);
            TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](params.batchSize);
            FeeOnTop[] memory feesOnTop = new FeeOnTop[](params.batchSize);

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: params.buyerKey,
                    tokenId: tokenId,
                    itemPrice: uint128(100 ether),
                    beneficiary: params.beneficiary,
                    cosignerKey: uint160(cosignerPk)
                });
    
                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: 100 ether,
                    nonce: _getNextNonce(vm.addr(params.buyerKey)),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });

                tokenSetProofsArray[batchIndex] = TokenSetProof({
                    rootHash: new Merkle().getRoot(data),
                    proof: new Merkle().getProof(data, tokenId - 1)
                });

                feesOnTop[batchIndex] = feeOnTop;
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _bulkAcceptEmptyCosignedTokenSetOffers(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        tokenSetProofsArray,
                        EMPTY_SELECTOR);
                } else {
                    _bulkAcceptCosignedTokenSetOffers(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        tokenSetProofsArray,
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _bulkAcceptEmptyCosignedTokenSetOffersWithFeesOnTop(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        tokenSetProofsArray,
                        feesOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _bulkAcceptCosignedTokenSetOffersWithFeesOnTop(
                        alice, 
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        tokenSetProofsArray,
                        feesOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }

    /*********************/
    /* Sweep Collection  */
    /*********************/

    function _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkSweepCollection(params);
    }

    function _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkSweepCollection(params);
    }

    function _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkSweepCollection(params);
    }

    function _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkSweepCollection(params);
    }

    function _runBenchmarkSweepCollection(BulkBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : params.batchSize * paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);

            SweepOrder memory sweepOrder = SweepOrder({
                protocol: TokenProtocols.ERC721,
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                marketplaceFeeNumerator: params.marketplaceFeeRate
            });

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: 0,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: 0
                });

                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(alice),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });
            }
    
            if (params.feeOnTopRate == type(uint96).max) {
                _sweepSignedListings(
                    vm.addr(params.buyerKey), 
                    params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                    sweepOrder,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            } else {
                _sweepSignedListingsWithFeeOnTop(
                    vm.addr(params.buyerKey), 
                    params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                    sweepOrder,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feeOnTop, 
                    EMPTY_SELECTOR);
            }
        }
    }

    /***************************************/
    /* Cosigned Sweep Collection Listings  */
    /***************************************/

    function _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkSweepCollectionCosigned(params);
    }

    function _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0), params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);
        _runBenchmarkSweepCollectionCosigned(params);
    }

    function _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data1 = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        bytes memory data2 = _cPortEncoder.encodeSetCollectionPricingBoundsCalldata(address(_cPort), address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));

        _cPort.setCollectionPaymentSettings(data1);
        _cPort.setCollectionPricingBounds(data2);
        _runBenchmarkSweepCollectionCosigned(params);
    }

    function _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams memory params) internal {
        bytes memory data = _cPortEncoder.encodeSetCollectionPaymentSettingsCalldata(address(_cPort), address(test721), PaymentSettings.PricingConstraints, 0, params.currency, params.royaltyBountyRate, address(0));
        _cPort.setCollectionPaymentSettings(data);

        uint256[] memory tokenIds = new uint256[](2 * params.numRuns * params.batchSize);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](2 * params.numRuns * params.batchSize);

        for (uint256 i = 1; i <= 2 * params.numRuns * params.batchSize; i++) {
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
        _runBenchmarkSweepCollectionCosigned(params);
    }

    function _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams memory params) internal {
        uint256 paymentAmount = 100 ether;

        FeeOnTop memory feeOnTop = FeeOnTop({
            amount: params.feeOnTopRate == type(uint96).max ? 0 : params.batchSize * paymentAmount * params.feeOnTopRate / 10_000,
            recipient: benchmarkFeeRecipient
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    
        for (uint256 run = 0; run < params.numRuns; run++) {
            FuzzedOrder721[] memory fuzzedOrderInputsArray = new FuzzedOrder721[](params.batchSize); 
            Order[] memory saleDetailsArray = new Order[](params.batchSize);

            SweepOrder memory sweepOrder = SweepOrder({
                protocol: TokenProtocols.ERC721,
                beneficiary: params.beneficiary,
                marketplace: cal,
                paymentMethod: params.currency,
                tokenAddress: address(test721),
                marketplaceFeeNumerator: params.marketplaceFeeRate
            });

            for (uint256 batchIndex = 0; batchIndex < params.batchSize; batchIndex++) {
                uint256 tokenId = run * params.batchSize + batchIndex + 1;

                if ((tokenId - 1) % (3 * params.batchSize) == 0) {
                    for (uint256 i = 0; i < (3 * params.batchSize); i++) {
                        test721.mint(alice, tokenId + i);
                        test721.setTokenRoyalty(tokenId + i, abe, params.royaltyFeeRate);
                    }
                }

                fuzzedOrderInputsArray[batchIndex] = FuzzedOrder721({
                    buyerIsContract: false,
                    marketplaceFeeRate: uint24(params.marketplaceFeeRate),
                    royaltyFeeRate: uint24(params.royaltyFeeRate),
                    sellerKey: uint160(alicePk),
                    expirationSeconds: 0, 
                    buyerKey: 0,
                    tokenId: tokenId,
                    itemPrice: uint128(paymentAmount),
                    beneficiary: params.beneficiary,
                    cosignerKey: uint160(cosignerPk)
                });

                saleDetailsArray[batchIndex] = Order({
                    protocol: TokenProtocols.ERC721,
                    seller: alice,
                    buyer: vm.addr(params.buyerKey),
                    beneficiary: params.beneficiary,
                    marketplace: cal,
                    paymentMethod: params.currency,
                    tokenAddress: address(test721),
                    tokenId: tokenId,
                    amount: 1,
                    itemPrice: paymentAmount,
                    nonce: _getNextNonce(alice),
                    expiration: type(uint256).max,
                    marketplaceFeeNumerator: params.marketplaceFeeRate,
                    maxRoyaltyFeeNumerator: params.royaltyFeeRate
                });
            }

            if (params.feeOnTopRate == type(uint96).max) {
                if (params.emptyCosignature) {
                    _sweepEmptyCosignedListings(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        sweepOrder,
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                } else {
                    _sweepCosignedListings(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        sweepOrder,
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        EMPTY_SELECTOR);
                }
            } else {
                if (params.emptyCosignature) {
                    _sweepEmptyCosignedListingsWithFeeOnTop(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        sweepOrder,
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                } else {
                    _sweepCosignedListingsWithFeeOnTop(
                        vm.addr(params.buyerKey), 
                        params.currency == address(0) ? uint128(paymentAmount * params.batchSize) : 0, 
                        sweepOrder,
                        fuzzedOrderInputsArray, 
                        saleDetailsArray, 
                        feeOnTop,
                        EMPTY_SELECTOR);
                }
            }
        }
    }
}