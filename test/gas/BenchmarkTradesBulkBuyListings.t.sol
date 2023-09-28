pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesBulkBuyListings is BenchmarkTradesBaseTest {

    /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

        /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob));
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false));
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true));
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob));
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListings(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false));
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true));
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkBuyListingsCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }
}