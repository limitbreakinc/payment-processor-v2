pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesBuyListing is BenchmarkTradesBaseTest {

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListing(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }
}