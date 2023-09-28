pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesAcceptOffer is BenchmarkTradesBaseTest {

    /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    // TODO

        /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOffer(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOffer(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOffer(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(BenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(CosignedBenchmarkParams(100, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }
}