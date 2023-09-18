pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesAcceptOffer is BenchmarkTradesBaseTest {

    /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob);
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, false);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), bob, true);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, type(uint96).max, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob);
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, false);
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), bob, true);
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    // TODO2

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob);
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, false);
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), bob, true);
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }
}