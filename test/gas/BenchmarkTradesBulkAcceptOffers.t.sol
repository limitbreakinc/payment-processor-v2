pragma solidity 0.8.19;

import "./BenchmarkTradesBase.t.sol";

contract BenchmarkTradesBulkAcceptOffers is BenchmarkTradesBaseTest {

    /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob));
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob));
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), bob, true));
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 0, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /**********************************/
    /*     ACCEPT ITEM OFFER FOR SELF */
    /**********************************/

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /*****************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY */
    /*****************************************/

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF */
    /*************************************/

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /********************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY */
    /********************************************/

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /***************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF */
    /***************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob));
    }

    /**********************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY */
    /**********************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /*******************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF */
    /*******************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /**************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY */
    /**************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  */
    /*************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, false));
    }

    /********************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /********************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF */
    /*************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /********************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY */
    /********************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF */
    /*******************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY */
    /**************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*******************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF  */
    /*******************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), bob, true));
    }

    /**************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY  */
    /**************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, type(uint96).max, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*********************************************/
    /*     ACCEPT ITEM OFFER FOR SELF FEE ON TOP */
    /*********************************************/

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /****************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /****************************************************/

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /*******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /**************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF FEE ON TOP */
    /**************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob));
    }

    /*********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /*********************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /******************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF  FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /*****************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), bob, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_FeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 1000, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***************************************************/
    /*     ACCEPT ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /***************************************************/

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptItemOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /**********************************************************/
    /*     ACCEPT ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /**********************************************************/

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptItemOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /******************************************************/
    /*  ACCEPT COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptCollectionOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /*************************************************************/
    /*  ACCEPT COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptCollectionOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /********************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /********************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob));
    }

    /***************************************************************/
    /*     ACCEPT TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /***************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffers(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersAllowAnyPaymentMethod(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCustomPaymentMethodWhitelist(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCollectionLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    function testBenchmarkBulkAcceptTokenSetOffersForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersTokenLevelPricingConstraints(BulkBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary));
    }

    /************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*******************************************************************/
    /*     ACCEPT COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************/

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptItemOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /*************************************************************************/
    /*     ACCEPT COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptCollectionOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /*****************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /*****************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, false));
    }

    /************************************************************************/
    /*     ACCEPT COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    function testBenchmarkBulkAcceptTokenSetOffersCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, false));
    }

    /******************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR SELF EMPTY FEE ON TOP */
    /******************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*************************************************************************/
    /*     ACCEPT EMPTY COSIGNED ITEM OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*************************************************************************/

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptItemOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptItemOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR SELF EMPTY FEE ON TOP */
    /************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    /*******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED COLLECTION OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /*******************************************************************************/

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptCollectionOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptCollectionOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    /***********************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR SELF EMPTY FEE ON TOP */
    /***********************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForSelfMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), bob, true));
    }

    /******************************************************************************/
    /*     ACCEPT EMPTY COSIGNED TOKEN SET OFFER FOR BENEFICIARY EMPTY FEE ON TOP */
    /******************************************************************************/

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesDefaultPaymentMethods_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosigned(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedAllowAnyPaymentMethod(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCustomPaymentMethodWhitelist(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedCollectionLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryNoFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 0, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 0, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }

    function testBenchmarkBulkAcceptTokenSetOffersEmptyCosignedForBeneficiaryMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints_EmptyFeeOnTop_WithRoyaltyBounty() public {
        _runBenchmarkBulkAcceptTokenSetOffersCosignedTokenLevelPricingConstraints(BulkCosignedBenchmarkParams(10, 10, 500, 1000, 0, 300, address(weth), uint160(bobPk), benchmarkBeneficiary, true));
    }
}