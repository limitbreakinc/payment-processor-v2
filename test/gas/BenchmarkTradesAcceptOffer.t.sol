pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesAcceptOffer is BenchmarkTradesBaseTest {

    /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkAcceptItemOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptItemOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptItemOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptCollectionOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptCollectionOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob);
    }

    function testBenchmarkAcceptTokenSetOfferForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob);
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOffer(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    function testBenchmarkAcceptTokenSetOfferForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary);
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptItemOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptCollectionOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, false);
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    function testBenchmarkAcceptTokenSetOfferCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, false);
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptItemOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptItemOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptCollectionOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptCollectionOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), bob, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), bob, true);
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptTokenSetOfferCosigned(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptTokenSetOfferCosignedAllowAnyPaymentMethod(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCustomPaymentMethodWhitelist(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedCollectionLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }

    function testBenchmarkAcceptTokenSetOfferEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkAcceptTokenSetOfferCosignedTokenLevelPricingConstraints(100, 500, 1000, address(weth), uint160(bobPk), benchmarkBeneficiary, true);
    }
}