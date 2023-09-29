pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesSweepCollection is BenchmarkTradesBaseTest {

    /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }
}