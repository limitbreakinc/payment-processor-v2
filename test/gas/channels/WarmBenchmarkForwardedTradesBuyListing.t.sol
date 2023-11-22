pragma solidity 0.8.19;

import "./BenchmarkForwardedTradesBase.t.sol";

contract BenchmarkForwardedTradesBuyListing is BenchmarkForwardedTradesBaseTest {

    function setUp() public virtual override {
        super.setUp();

        vm.startPrank(alice);
        _cPort.revokeSingleNonce(_cPortEncoder.encodeRevokeSingleNonceCalldata(address(_cPort), _getNextNonce(alice)));
        vm.stopPrank();

        vm.startPrank(bob);
        _cPort.revokeSingleNonce(_cPortEncoder.encodeRevokeSingleNonceCalldata(address(_cPort), _getNextNonce(bob)));
        vm.stopPrank();

        test721.mint(alice, 10000001);
        test721.mint(bob, 10000002);
        test721.mint(benchmarkBeneficiary, 10000003);

        test1155.mint(alice, 10000001, 10000);
        test1155.mint(bob, 10000002, 10000);
        test1155.mint(benchmarkBeneficiary, 10000003, 10000);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************************/
    /*  PARTIAL FILL ERC1155 */
    /*******************************************************************/

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkForwardedBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListingPartialFill);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    function testBenchmarkForwardedBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListingPartialFill);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosignedPartialFill);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }

    function testBenchmarkForwardedBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty_PartialFill() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosignedPartialFill);
    }
}