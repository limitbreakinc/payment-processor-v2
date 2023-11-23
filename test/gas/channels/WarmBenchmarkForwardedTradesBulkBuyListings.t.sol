pragma solidity 0.8.19;

import "./BenchmarkForwardedTradesBase.t.sol";

contract BenchmarkForwardedTradesBulkBuyListings is BenchmarkForwardedTradesBaseTest {

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

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

        /****************************************/
    /*  BULK BUY LISTINGS FOR SELF WITH ETH */
    /****************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBulkBuyListings);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulk(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAllowAnyPaymentMethod(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    function testBenchmarkForwardedBulkBuyListingsForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkTokenLevelPricingConstraints(BulkBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBulkBuyListings);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBulkBuyListingsCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosigned(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }

    function testBenchmarkForwardedBulkBuyListingsEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBulkBuyListingsCosigned);
    }
}