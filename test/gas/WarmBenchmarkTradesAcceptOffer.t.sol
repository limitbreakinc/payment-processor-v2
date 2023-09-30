pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesAcceptOffer is BenchmarkTradesBaseTest {

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
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptItemOffer);
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptItemOffer);
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptCollectionOffer);
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptCollectionOffer);
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob), _runBenchmarkAcceptTokenSetOffer);
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmark(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAllowAnyPaymentMethod(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCustomPaymentMethodWhitelist(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCollectionLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkTokenLevelPricingConstraints(BenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary), _runBenchmarkAcceptTokenSetOffer);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptItemOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptItemOfferCosigned);
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptCollectionOfferCosigned);
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosigned(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(1, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true), _runBenchmarkAcceptTokenSetOfferCosigned);
    }
}