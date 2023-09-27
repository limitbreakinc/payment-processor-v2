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
}