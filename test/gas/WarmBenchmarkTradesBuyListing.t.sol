pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesBuyListing is BenchmarkTradesBaseTest {

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
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH ETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************/
    /*  BUY LISTING FOR SELF WITH WETH */
    /**********************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /*****************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH */
    /*****************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH */
    /******************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*******************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH */
    /*******************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /********************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH */
    /********************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH */
    /*************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /**************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH */
    /**************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*********************************************/
    /*  BUY LISTING FOR SELF WITH ETH FEE ON TOP */
    /*********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************/
    /*  BUY LISTING FOR SELF WITH WETH FEE ON TOP */
    /**********************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /*****************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH FEE ON TOP */
    /*****************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***************************************************/
    /*  BUY LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /****************************************************/
    /*  BUY LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBuyListingForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkBuyListing);
    }

    /**********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH ETH EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /***********************************************************/
    /*  BUY LISTING FOR BENEFICIARY WITH WETH EMPTY FEE ON TOP */
    /***********************************************************/

    function testBenchmarkBuyListingForBeneficiaryNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    function testBenchmarkBuyListingForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkBuyListing);
    }

    /******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /*************************************************************/
    /*  BUY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBuyListingCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkBuyListingCosigned);
    }

    /******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH ETH EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_ETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(0), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    /*******************************************************************/
    /*  BUY EMPTY COSIGNED LISTING FOR SELF WITH WETH EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }

    function testBenchmarkBuyListingEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WETH_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkBuyListingCosigned);
    }
}