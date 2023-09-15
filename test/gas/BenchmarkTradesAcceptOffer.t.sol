pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesBuySingleListing is BenchmarkTradesBaseTest {

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
}