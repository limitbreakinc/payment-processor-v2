pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesSweepCollection is BenchmarkTradesBaseTest {

    /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob));
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false));
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true));
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob));
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob));
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary));
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollection(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false));
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true));
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkSweepCollectionCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }
}