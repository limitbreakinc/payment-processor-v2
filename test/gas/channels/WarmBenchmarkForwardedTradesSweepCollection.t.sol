pragma solidity 0.8.19;

import "./BenchmarkForwardedTradesBase.t.sol";

contract BenchmarkForwardedTradesSweepCollection is BenchmarkForwardedTradesBaseTest {

    function setUp() public virtual override {
        super.setUp();

        vm.startPrank(alice);
        _paymentProcessor.revokeSingleNonce(_paymentProcessorEncoder.encodeRevokeSingleNonceCalldata(address(_paymentProcessor), _getNextNonce(alice)));
        vm.stopPrank();

        vm.startPrank(bob);
        _paymentProcessor.revokeSingleNonce(_paymentProcessorEncoder.encodeRevokeSingleNonceCalldata(address(_paymentProcessor), _getNextNonce(bob)));
        vm.stopPrank();

        test721.mint(alice, 10000001);
        test721.mint(bob, 10000002);
        test721.mint(benchmarkBeneficiary, 10000003);
    }

    /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkSweepCollection);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    function testBenchmarkForwardedSweepCollectionForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkSweepCollection);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkSweepCollectionCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }

    function testBenchmarkForwardedSweepCollectionEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkSweepCollectionCosigned);
    }
}