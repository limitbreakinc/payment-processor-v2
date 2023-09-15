pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesBuySingleListing is BenchmarkTradesBaseTest {

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(100, 0, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(100, 500, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(100, 500, 1000, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, bob);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(100, 0, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(100, 500, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(100, 500, 1000, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, bob);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(100, 0, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(100, 500, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListing(100, 500, 1000, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, benchmarkBeneficiary);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(100, 0, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(100, 500, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListing(100, 500, 1000, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, benchmarkBeneficiary);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, bob, false);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, bob, false);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(0), bob, bob, true);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), bob, bob, true);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, bob);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, bob);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, benchmarkBeneficiary);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, benchmarkBeneficiary);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 0, address(0), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, bob);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, bob);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, bob);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 0, address(0), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, benchmarkBeneficiary);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 0, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListing(100, 500, 1000, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, benchmarkBeneficiary);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, benchmarkBeneficiary);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, bob, false);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, bob, false);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(0), bob, bob, true);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), bob, bob, true);
    }

    // TODO

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(0), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, bob, false);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, bob, false);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, bob, false);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(0), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(0), bob, bob, true);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 0, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosigned(100, 500, 1000, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), bob, bob, true);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBuyListingCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), bob, bob, true);
    }
}