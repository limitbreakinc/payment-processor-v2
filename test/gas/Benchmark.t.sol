pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/PaymentProcessorV2.sol";
import "src/modules/ModuleBuyListing.sol";
import "src/modules/ModuleAcceptOffer.sol";
import "src/modules/ModuleBulkBuyListings.sol";
import "src/modules/ModuleBulkAcceptOffers.sol";
import "src/modules/ModuleBuyBundledListing.sol";
import "src/modules/ModuleSweepCollection.sol";

import "../mocks/SeaportTestERC20.sol";
import "../mocks/SeaportTestERC721.sol";
import "../mocks/SeaportTestERC1155.sol";

contract Benchmark is Test {

    struct FuzzInputsCommon {
        uint256 tokenId;
        uint128 paymentAmount;
    }

    uint256 constant MAX_INT = ~uint256(0);

    uint256 internal alicePk = 0xa11ce;
    uint256 internal bobPk = 0xb0b;
    uint256 internal calPk = 0xca1;
    uint256 internal abePk = 0xabe;
    address payable internal alice = payable(vm.addr(alicePk));
    address payable internal bob = payable(vm.addr(bobPk));
    address payable internal cal = payable(vm.addr(calPk));
    address payable internal abe = payable(vm.addr(abePk));

    PaymentProcessorV2 public paymentProcessor;

    SeaportTestERC20 public weth;
    SeaportTestERC20 public usdc;
    SeaportTestERC20 public usdt;
    SeaportTestERC20 public dai;

    SeaportTestERC721 public test721;

    SeaportTestERC20[] erc20s;
    SeaportTestERC721[] erc721s;

    PaymentProcessorModule public moduleBuyListing;
    PaymentProcessorModule public moduleAcceptOffer;
    PaymentProcessorModule public moduleBulkBuyListings;
    PaymentProcessorModule public moduleBulkAcceptOffers;
    PaymentProcessorModule public moduleBuyBundledListing;
    PaymentProcessorModule public moduleSweepCollection;

    uint88 public customPaymentMethodWhitelistId;

    mapping (address => uint256) internal _nextAvailableTokenId;
    mapping (address => uint256) internal _nonces;

    function setUp() public {
        weth = new SeaportTestERC20();
        usdc = new SeaportTestERC20();
        usdt = new SeaportTestERC20();
        dai = new SeaportTestERC20();

        erc20s = [weth, usdc, usdt, dai];

        test721 = new SeaportTestERC721();

        erc721s = [test721];

        moduleBuyListing = new ModuleBuyListing(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleAcceptOffer = new ModuleAcceptOffer(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleBulkBuyListings = new ModuleBulkBuyListings(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleBulkAcceptOffers = new ModuleBulkAcceptOffers(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleBuyBundledListing = new ModuleBuyBundledListing(
            2300,
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleSweepCollection = new ModuleSweepCollection(
            2300,
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        console.logBytes4(ModuleBuyListing.buyListing.selector);
        console.logBytes4(ModuleAcceptOffer.acceptOffer.selector);
        console.logBytes4(ModuleBulkBuyListings.bulkBuyListings.selector);
        console.logBytes4(ModuleBulkAcceptOffers.bulkAcceptOffers.selector);
        console.logBytes4(ModuleBuyBundledListing.buyBundledListing.selector);
        console.logBytes4(ModuleSweepCollection.sweepCollection.selector);

        /*
        paymentProcessor = 
            new PaymentProcessorV2(
                2300, 
                address(weth), 
                address(usdc), 
                address(usdt), 
                address(dai));
        */

        paymentProcessor = 
            new PaymentProcessorV2(
                address(moduleBuyListing),
                address(moduleAcceptOffer),
                address(moduleBulkBuyListings),
                address(moduleBulkAcceptOffers),
                address(moduleBuyBundledListing),
                address(moduleSweepCollection)
            );

        vm.label(alice, "alice");
        vm.label(bob, "bob");
        vm.label(cal, "cal");
        vm.label(abe, "abe");
        vm.label(address(this), "testContract");

        _allocateTokensAndApprovals(address(this), uint128(MAX_INT));
        _allocateTokensAndApprovals(alice, uint128(MAX_INT));
        _allocateTokensAndApprovals(bob, uint128(MAX_INT));
        _allocateTokensAndApprovals(cal, uint128(MAX_INT));
        _allocateTokensAndApprovals(abe, uint128(MAX_INT));

        customPaymentMethodWhitelistId = paymentProcessor.createPaymentMethodWhitelist("Test Whitelist");

        paymentProcessor.whitelistPaymentMethod(customPaymentMethodWhitelistId, address(0));
        paymentProcessor.whitelistPaymentMethod(customPaymentMethodWhitelistId, address(weth));
        paymentProcessor.whitelistPaymentMethod(customPaymentMethodWhitelistId, address(usdc));
        paymentProcessor.whitelistPaymentMethod(customPaymentMethodWhitelistId, address(usdt));
        paymentProcessor.whitelistPaymentMethod(customPaymentMethodWhitelistId, address(dai));
    }

    /**
     * @dev allocate amount of each token, 1 of each 721, and 1, 5, and 10 of respective 1155s
     */
    function _allocateTokensAndApprovals(address _to, uint128 _amount) internal {
        vm.deal(_to, _amount);
        for (uint256 i = 0; i < erc20s.length; ++i) {
            erc20s[i].mint(_to, _amount);
        }
        _setApprovals(_to);
    }

    function _setApprovals(address _owner) internal virtual {
        vm.startPrank(_owner);
        for (uint256 i = 0; i < erc20s.length; ++i) {
            erc20s[i].approve(address(paymentProcessor), MAX_INT);
        }
        for (uint256 i = 0; i < erc721s.length; ++i) {
            erc721s[i].setApprovalForAll(address(paymentProcessor), true);
        }
        vm.stopPrank();
    }

    function _getNextNonce(address account) internal returns (uint256) {
        uint256 nextUnusedNonce = _nonces[account];
        ++_nonces[account];
        return nextUnusedNonce;
    }
    
    function _getNextAvailableTokenId(address collection) internal returns (uint256) {
        uint256 nextTokenId = _nextAvailableTokenId[collection];
        ++_nextAvailableTokenId[collection];
        return nextTokenId;
    }

    function _getSignedListing(uint256 sellerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 listingDigest = 
            ECDSA.toTypedDataHash(
                paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            paymentProcessor.ORDER_APPROVAL_HASH(),
                            uint8(saleDetails.protocol),
                            saleDetails.seller,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.tokenId,
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.nonce,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            paymentProcessor.masterNonces(saleDetails.seller)
                        )
                    )
                )
            );
    
        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(sellerKey_, listingDigest);
        SignatureECDSA memory signedListing = SignatureECDSA({v: listingV, r: listingR, s: listingS});
    
        return signedListing;
    }

    function _getSignedOffer(uint256 buyerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            paymentProcessor.ORDER_APPROVAL_HASH(),
                            uint8(saleDetails.protocol),
                            saleDetails.buyer,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.tokenId,
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.nonce,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            paymentProcessor.masterNonces(saleDetails.buyer)
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getSignedCollectionOffer(uint256 buyerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            paymentProcessor.COLLECTION_ORDER_APPROVAL_HASH(),
                            uint8(saleDetails.protocol),
                            saleDetails.buyer,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.nonce,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            paymentProcessor.masterNonces(saleDetails.buyer)
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getSignedBundledListing(
        uint256 sellerKey_, 
        AccumulatorHashes memory accumulatorHashes,
        BundledOrderExtended memory bundleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 listingDigest = 
            ECDSA.toTypedDataHash(
                paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            paymentProcessor.BUNDLED_SALE_APPROVAL_HASH(),
                            uint8(bundleDetails.bundleBase.protocol),
                            bundleDetails.seller,
                            bundleDetails.bundleBase.marketplace,
                            bundleDetails.bundleBase.paymentMethod,
                            bundleDetails.bundleBase.tokenAddress
                        ),
                        abi.encode(
                            bundleDetails.expiration,
                            bundleDetails.nonce,
                            bundleDetails.bundleBase.marketplaceFeeNumerator,
                            paymentProcessor.masterNonces(bundleDetails.seller),
                            accumulatorHashes.tokenIdsKeccakHash,
                            accumulatorHashes.amountsKeccakHash,
                            accumulatorHashes.maxRoyaltyFeeNumeratorsKeccakHash,
                            accumulatorHashes.itemPricesKeccakHash
                        )
                    )
                )
            );

        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(sellerKey_, listingDigest);
        SignatureECDSA memory signedListing = SignatureECDSA({v: listingV, r: listingR, s: listingS});

        return signedListing;
    }

    function testBenchmarkBulkAcceptOffersNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkAcceptOffers(100, 0, 0);
    }

    function testBenchmarkBulkBuyListingNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBulkBuyListing(100, 0, 0);
    }

    function testBenchmarkBuyListingNoFeesDefaultPaymentMethods() public {
        _runBenchmarkBuyListing(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkBuyListing(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkBuyListing(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkBuyListingAllowAnyPaymentMethod(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkBuyListingCustomPaymentMethodWhitelist(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesCollectionLevelPricingConstraints() public {
        _runBenchmarkBuyListingCollectionLevelPricingConstraints(100, 500, 1000);
    }

    function testBenchmarkBuyListingNoFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 0, 0);
    }

    function testBenchmarkBuyListingMarketplaceFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 0);
    }

    function testBenchmarkBuyListingMarketplaceAndRoyaltyFeesTokenLevelPricingConstraints() public {
        _runBenchmarkBuyListingTokenLevelPricingConstraints(100, 500, 1000);
    }

    function _runBenchmarkBuyListingAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0));
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListingCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0));
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListingCollectionLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.PricingConstraints, 0, address(0));
        paymentProcessor.setCollectionPricingBounds(address(test721), PricingBounds({
            isSet: true,
            isImmutable: true,
            floorPrice: 1 ether,
            ceilingPrice: 500 ether
        }));
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListingTokenLevelPricingConstraints(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.PricingConstraints, 0, address(0));

        uint256[] memory tokenIds = new uint256[](numRuns);
        PricingBounds[] memory pricingBoundsArray = new PricingBounds[](numRuns);

        for (uint256 i = 1; i <= numRuns; i++) {
            tokenIds[i - 1] = i;
            pricingBoundsArray[i - 1] = PricingBounds({
                isSet: true,
                isImmutable: true,
                floorPrice: 1 ether,
                ceilingPrice: 500 ether
            });
        }
        
        paymentProcessor.setTokenPricingBounds(address(test721), tokenIds, pricingBoundsArray);
        _runBenchmarkBuyListing(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkBuyListing(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) private {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedListing = _getSignedListing(alicePk, saleDetails);
            bytes memory data = paymentProcessor.encodeBuyListingCalldata(saleDetails, signedListing);
    
            vm.prank(bob, bob);
            paymentProcessor.buyListing{value: saleDetails.itemPrice}(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function _runBenchmarkBulkBuyListing(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) private {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedListing = _getSignedListing(alicePk, saleDetails);

            Order[] memory saleDetailsSingleton = new Order[](1);
            saleDetailsSingleton[0] = saleDetails;

            SignatureECDSA[] memory signedListingSingleton = new SignatureECDSA[](1);
            signedListingSingleton[0] = signedListing;

            bytes memory data = paymentProcessor.encodeBulkBuyListingsCalldata(saleDetailsSingleton, signedListingSingleton);

            vm.prank(bob, bob);
            paymentProcessor.bulkBuyListings{value: saleDetails.itemPrice}(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function _runBenchmarkBulkAcceptOffers(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) private {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedOffer = _getSignedCollectionOffer(bobPk, saleDetails);

            Order[] memory saleDetailsSingleton = new Order[](1);
            saleDetailsSingleton[0] = saleDetails;

            SignatureECDSA[] memory signedOfferSingleton = new SignatureECDSA[](1);
            signedOfferSingleton[0] = signedOffer;

            bytes memory data = paymentProcessor.encodeBulkAcceptOffersCalldata(true, saleDetailsSingleton, signedOfferSingleton);

            vm.prank(alice, alice);
            paymentProcessor.bulkAcceptOffers(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function testBenchmarkAcceptItemOfferNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 0, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptItemOffer(100, 500, 1000);
    }

    function testBenchmarkAcceptItemOfferNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 0, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(100, 500, 1000);
    }

    function testBenchmarkAcceptItemOfferNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 0, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 0);
    }

    function testBenchmarkAcceptItemOfferMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(100, 500, 1000);
    }

    function _runBenchmarkAcceptItemOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0));
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptItemOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0));
        _runBenchmarkAcceptItemOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptItemOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) private {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(bob),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedOffer = _getSignedOffer(bobPk, saleDetails);

            bytes memory data = paymentProcessor.encodeAcceptOfferCalldata(false, saleDetails, signedOffer);
    
            vm.prank(alice, alice);
            paymentProcessor.acceptOffer(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }
    }

    function testBenchmarkAcceptCollectionOfferNoFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 0, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceAndRoyaltyFeesDefaultPaymentMethods() public {
        _runBenchmarkAcceptCollectionOffer(100, 500, 1000);
    }

    function testBenchmarkAcceptCollectionOfferNoFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 0, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceAndRoyaltyFeesAllowAnyPaymentMethod() public {
        _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(100, 500, 1000);
    }

    function testBenchmarkAcceptCollectionOfferNoFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 0, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 0);
    }

    function testBenchmarkAcceptCollectionOfferMarketplaceAndRoyaltyFeesCustomPaymentMethodWhitelist() public {
        _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(100, 500, 1000);
    }

    function _runBenchmarkAcceptCollectionOfferAllowAnyPaymentMethod(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.AllowAnyPaymentMethod, 0, address(0));
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptCollectionOfferCustomPaymentMethodWhitelist(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate
    ) private {
        paymentProcessor.setCollectionPaymentSettings(address(test721), PaymentSettings.CustomPaymentMethodWhitelist, customPaymentMethodWhitelistId, address(0));
        _runBenchmarkAcceptCollectionOffer(numRuns, marketplaceFeeRate, royaltyFeeRate);
    }

    function _runBenchmarkAcceptCollectionOffer(
        uint256 numRuns,
        uint256 marketplaceFeeRate, 
        uint96 royaltyFeeRate) private {

        uint256 paymentAmount = 100 ether;
    
        for (uint256 tokenId = 1; tokenId <= numRuns; tokenId++) {
            test721.mint(alice, tokenId);
            test721.setTokenRoyalty(tokenId, abe, royaltyFeeRate);
    
            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: alice,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId,
                amount: 1,
                itemPrice: paymentAmount,
                nonce: _getNextNonce(bob),
                expiration: type(uint256).max,
                marketplaceFeeNumerator: marketplaceFeeRate,
                maxRoyaltyFeeNumerator: royaltyFeeRate
            });
    
            SignatureECDSA memory signedOffer = _getSignedCollectionOffer(bobPk, saleDetails);

            bytes memory data = paymentProcessor.encodeAcceptOfferCalldata(true, saleDetails, signedOffer);
    
            vm.prank(alice, alice);
            paymentProcessor.acceptOffer(data);
    
            assertEq(test721.ownerOf(tokenId), bob);
        }    
    }

    function testBenchmarkBuyBundledListingNoFees() public {
        uint256 numRuns = 100;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            BundledOrderBase memory bundledOfferDetails = BundledOrderBase({
                protocol: TokenProtocols.ERC721,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                marketplaceFeeNumerator: 0
            });
    
            BundledOrderExtended memory bundleOfferDetailsExtended = BundledOrderExtended({
                bundleBase: bundledOfferDetails,
                seller: alice,
                nonce: _getNextNonce(alice),
                expiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
    
            Accumulator memory accumulator = Accumulator({
                tokenIds: new uint256[](numItemsInBundle),
                amounts: new uint256[](numItemsInBundle),
                salePrices: new uint256[](numItemsInBundle),
                maxRoyaltyFeeNumerators: new uint256[](numItemsInBundle),
                sellers: new address[](numItemsInBundle),
                sumListingPrices: 0
            });
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].nonce = 0;
                bundledOfferItems[i].expiration = 0;
                bundledOfferItems[i].seller = alice;
    
                Order memory saleDetails = 
                    Order({
                        protocol: bundledOfferDetails.protocol,
                        seller: bundledOfferItems[i].seller,
                        buyer: bundledOfferDetails.buyer,
                        marketplace: bundledOfferDetails.marketplace,
                        paymentMethod: bundledOfferDetails.paymentMethod,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount,
                        itemPrice: bundledOfferItems[i].itemPrice,
                        nonce: bundledOfferItems[i].nonce,
                        expiration: bundledOfferItems[i].expiration,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator
                    });
    
                accumulator.tokenIds[i] = saleDetails.tokenId;
                accumulator.amounts[i] = saleDetails.amount;
                accumulator.salePrices[i] = saleDetails.itemPrice;
                accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
                accumulator.sellers[i] = saleDetails.seller;
                accumulator.sumListingPrices += saleDetails.itemPrice;
    
                test721.mint(alice, saleDetails.tokenId);
                test721.setTokenRoyalty(saleDetails.tokenId, abe, 0);
            }
    
            AccumulatorHashes memory accumulatorHashes = 
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                });
    
            SignatureECDSA memory signedBundledListing = _getSignedBundledListing(alicePk, accumulatorHashes, bundleOfferDetailsExtended);

            bytes memory data = paymentProcessor.encodeBuyBundledListingCalldata(signedBundledListing, bundleOfferDetailsExtended, bundledOfferItems);    

            vm.prank(bob, bob);
            paymentProcessor.buyBundledListing{value: accumulator.sumListingPrices}(data);
        }
    }

    function testBenchmarkSweepCollectionNoFees() public {
        uint256 numRuns = 50;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            BundledOrderBase memory bundledOfferDetails = BundledOrderBase({
                protocol: TokenProtocols.ERC721,
                buyer: bob,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                marketplaceFeeNumerator: 0
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
            SignatureECDSA[] memory signedListings = new SignatureECDSA[](numItemsInBundle);
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                uint256 fakeAddressPk = 1000000 + i;
                address fakeAddress = payable(vm.addr(fakeAddressPk));
    
                bundledOfferItems[i].seller = fakeAddress;
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].nonce = _getNextNonce(fakeAddress);
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].expiration = type(uint256).max;

                Order memory saleDetails = 
                    Order({
                        protocol: bundledOfferDetails.protocol,
                        seller: bundledOfferItems[i].seller,
                        buyer: bundledOfferDetails.buyer,
                        marketplace: bundledOfferDetails.marketplace,
                        paymentMethod: bundledOfferDetails.paymentMethod,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount,
                        itemPrice: bundledOfferItems[i].itemPrice,
                        nonce: bundledOfferItems[i].nonce,
                        expiration: bundledOfferItems[i].expiration,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator
                    });
    
                signedListings[i] = _getSignedListing(fakeAddressPk, saleDetails);
    
                test721.mint(fakeAddress, saleDetails.tokenId);
                test721.setTokenRoyalty(saleDetails.tokenId, abe, 0);
    
                vm.prank(fakeAddress);
                test721.setApprovalForAll(address(paymentProcessor), true);
            }

            bytes memory data = paymentProcessor.encodeSweepCollectionCalldata(bundledOfferDetails, bundledOfferItems, signedListings);
    
            vm.prank(bob, bob);
            paymentProcessor.sweepCollection{value: paymentAmount * numItemsInBundle}(data);
        }
    }

    /*
    function test_benchmarkBuySingleListingMarketplaceFees() public {
        uint256 paymentAmount = 100 ether;

        for (uint256 tokenId = 1; tokenId <= 100; tokenId++) {
            test721_1.mint(alice, tokenId);
            test721_1.setTokenRoyalty(tokenId, abe, 0);
    
            MatchedOrder memory saleDetails = MatchedOrder({
                sellerAcceptedOffer: false,
                collectionLevelOffer: false,
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                seller: alice,
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 500,
                maxRoyaltyFeeNumerator: 0,
                listingNonce: _getNextNonce(alice),
                offerNonce: _getNextNonce(bob),
                listingMinPrice: paymentAmount,
                offerPrice: paymentAmount,
                listingExpiration: type(uint256).max,
                offerExpiration: type(uint256).max,
                tokenId: tokenId,
                amount: 1
            });
    
            SignatureECDSA memory signedListing = _getSignedListing(alicePk, saleDetails);
            SignatureECDSA memory signedOffer = _getSignedOffer(bobPk, saleDetails);
    
            vm.prank(bob, bob);
            paymentProcessor.buySingleListing{value: saleDetails.offerPrice}(
                saleDetails, 
                signedListing, 
                signedOffer);
        }
    }

    function test_benchmarkBuySingleListingMarketplaceAndRoyaltyFees() public {
        uint256 paymentAmount = 100 ether;

        for (uint256 tokenId = 1; tokenId <= 100; tokenId++) {
            test721_1.mint(alice, tokenId);
            test721_1.setTokenRoyalty(tokenId, abe, 1000);
    
            MatchedOrder memory saleDetails = MatchedOrder({
                sellerAcceptedOffer: false,
                collectionLevelOffer: false,
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                seller: alice,
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 500,
                maxRoyaltyFeeNumerator: 1000,
                listingNonce: _getNextNonce(alice),
                offerNonce: _getNextNonce(bob),
                listingMinPrice: paymentAmount,
                offerPrice: paymentAmount,
                listingExpiration: type(uint256).max,
                offerExpiration: type(uint256).max,
                tokenId: tokenId,
                amount: 1
            });
    
            SignatureECDSA memory signedListing = _getSignedListing(alicePk, saleDetails);
            SignatureECDSA memory signedOffer = _getSignedOffer(bobPk, saleDetails);
    
            vm.prank(bob, bob);
            paymentProcessor.buySingleListing{value: saleDetails.offerPrice}(
                saleDetails, 
                signedListing, 
                signedOffer);
        }
    }

    function test_benchmarkBuyBundledListingNoFees() public {
        uint256 numRuns = 100;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            MatchedOrderBundleBase memory bundledOfferDetails = MatchedOrderBundleBase({
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 0,
                offerNonce: _getNextNonce(bob),
                offerPrice: paymentAmount * numItemsInBundle,
                offerExpiration: type(uint256).max
            });
    
            MatchedOrderBundleExtended memory bundleOfferDetailsExtended = MatchedOrderBundleExtended({
                bundleBase: bundledOfferDetails,
                seller: alice,
                listingNonce: _getNextNonce(alice),
                listingExpiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
    
            Accumulator memory accumulator = Accumulator({
                tokenIds: new uint256[](numItemsInBundle),
                amounts: new uint256[](numItemsInBundle),
                salePrices: new uint256[](numItemsInBundle),
                maxRoyaltyFeeNumerators: new uint256[](numItemsInBundle),
                sellers: new address[](numItemsInBundle),
                sumListingPrices: 0
            });
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721_1));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].listingNonce = 0;
                bundledOfferItems[i].listingExpiration = 0;
                bundledOfferItems[i].seller = alice;
    
                MatchedOrder memory saleDetails = 
                    MatchedOrder({
                        sellerAcceptedOffer: false,
                        collectionLevelOffer: false,
                        protocol: bundledOfferDetails.protocol,
                        paymentCoin: bundledOfferDetails.paymentCoin,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        seller: bundledOfferItems[i].seller,
                        privateBuyer: address(0),
                        buyer: bundledOfferDetails.buyer,
                        delegatedPurchaser: bundledOfferDetails.delegatedPurchaser,
                        marketplace: bundledOfferDetails.marketplace,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator,
                        listingNonce: bundledOfferItems[i].listingNonce,
                        offerNonce: bundledOfferDetails.offerNonce,
                        listingMinPrice: bundledOfferItems[i].itemPrice,
                        offerPrice: bundledOfferItems[i].itemPrice,
                        listingExpiration: bundledOfferItems[i].listingExpiration,
                        offerExpiration: bundledOfferDetails.offerExpiration,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount
                    });
    
                accumulator.tokenIds[i] = saleDetails.tokenId;
                accumulator.amounts[i] = saleDetails.amount;
                accumulator.salePrices[i] = saleDetails.listingMinPrice;
                accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
                accumulator.sellers[i] = sellerEOA;
                accumulator.sumListingPrices += saleDetails.listingMinPrice;
    
                test721_1.mint(alice, saleDetails.tokenId);
                test721_1.setTokenRoyalty(saleDetails.tokenId, abe, 0);
            }
    
            AccumulatorHashes memory accumulatorHashes = 
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                });
    
            SignatureECDSA memory signedBundledOffer = _getSignedOfferForBundledItems(bobPk, bundledOfferDetails, bundledOfferItems);
            SignatureECDSA memory signedBundledListing = _getSignedBundledListing(alicePk, accumulatorHashes, bundleOfferDetailsExtended);
    
            vm.prank(bob, bob);
            paymentProcessor.buyBundledListing{value: bundledOfferDetails.offerPrice}(
                signedBundledListing,
                signedBundledOffer, 
                bundleOfferDetailsExtended, 
            bundledOfferItems);
        }
    }

    function test_benchmarkBuyBundledListingMarketplaceFees() public {
        uint256 numRuns = 100;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            MatchedOrderBundleBase memory bundledOfferDetails = MatchedOrderBundleBase({
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 500,
                offerNonce: _getNextNonce(bob),
                offerPrice: paymentAmount * numItemsInBundle,
                offerExpiration: type(uint256).max
            });
    
            MatchedOrderBundleExtended memory bundleOfferDetailsExtended = MatchedOrderBundleExtended({
                bundleBase: bundledOfferDetails,
                seller: alice,
                listingNonce: _getNextNonce(alice),
                listingExpiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
    
            Accumulator memory accumulator = Accumulator({
                tokenIds: new uint256[](numItemsInBundle),
                amounts: new uint256[](numItemsInBundle),
                salePrices: new uint256[](numItemsInBundle),
                maxRoyaltyFeeNumerators: new uint256[](numItemsInBundle),
                sellers: new address[](numItemsInBundle),
                sumListingPrices: 0
            });
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721_1));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].listingNonce = 0;
                bundledOfferItems[i].listingExpiration = 0;
                bundledOfferItems[i].seller = alice;
    
                MatchedOrder memory saleDetails = 
                    MatchedOrder({
                        sellerAcceptedOffer: false,
                        collectionLevelOffer: false,
                        protocol: bundledOfferDetails.protocol,
                        paymentCoin: bundledOfferDetails.paymentCoin,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        seller: bundledOfferItems[i].seller,
                        privateBuyer: address(0),
                        buyer: bundledOfferDetails.buyer,
                        delegatedPurchaser: bundledOfferDetails.delegatedPurchaser,
                        marketplace: bundledOfferDetails.marketplace,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator,
                        listingNonce: bundledOfferItems[i].listingNonce,
                        offerNonce: bundledOfferDetails.offerNonce,
                        listingMinPrice: bundledOfferItems[i].itemPrice,
                        offerPrice: bundledOfferItems[i].itemPrice,
                        listingExpiration: bundledOfferItems[i].listingExpiration,
                        offerExpiration: bundledOfferDetails.offerExpiration,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount
                    });
    
                accumulator.tokenIds[i] = saleDetails.tokenId;
                accumulator.amounts[i] = saleDetails.amount;
                accumulator.salePrices[i] = saleDetails.listingMinPrice;
                accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
                accumulator.sellers[i] = sellerEOA;
                accumulator.sumListingPrices += saleDetails.listingMinPrice;
    
                test721_1.mint(alice, saleDetails.tokenId);
                test721_1.setTokenRoyalty(saleDetails.tokenId, abe, 0);
            }
    
            AccumulatorHashes memory accumulatorHashes = 
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                });
    
            SignatureECDSA memory signedBundledOffer = _getSignedOfferForBundledItems(bobPk, bundledOfferDetails, bundledOfferItems);
            SignatureECDSA memory signedBundledListing = _getSignedBundledListing(alicePk, accumulatorHashes, bundleOfferDetailsExtended);
    
            vm.prank(bob, bob);
            paymentProcessor.buyBundledListing{value: bundledOfferDetails.offerPrice}(
                signedBundledListing,
                signedBundledOffer, 
                bundleOfferDetailsExtended, 
            bundledOfferItems);
        }
    }

    function test_benchmarkBuyBundledListingMarketplaceAndRoyaltyFees() public {
        uint256 numRuns = 100;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            MatchedOrderBundleBase memory bundledOfferDetails = MatchedOrderBundleBase({
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 500,
                offerNonce: _getNextNonce(bob),
                offerPrice: paymentAmount * numItemsInBundle,
                offerExpiration: type(uint256).max
            });
    
            MatchedOrderBundleExtended memory bundleOfferDetailsExtended = MatchedOrderBundleExtended({
                bundleBase: bundledOfferDetails,
                seller: alice,
                listingNonce: _getNextNonce(alice),
                listingExpiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
    
            Accumulator memory accumulator = Accumulator({
                tokenIds: new uint256[](numItemsInBundle),
                amounts: new uint256[](numItemsInBundle),
                salePrices: new uint256[](numItemsInBundle),
                maxRoyaltyFeeNumerators: new uint256[](numItemsInBundle),
                sellers: new address[](numItemsInBundle),
                sumListingPrices: 0
            });
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721_1));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 1000;
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].listingNonce = 0;
                bundledOfferItems[i].listingExpiration = 0;
                bundledOfferItems[i].seller = alice;
    
                MatchedOrder memory saleDetails = 
                    MatchedOrder({
                        sellerAcceptedOffer: false,
                        collectionLevelOffer: false,
                        protocol: bundledOfferDetails.protocol,
                        paymentCoin: bundledOfferDetails.paymentCoin,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        seller: bundledOfferItems[i].seller,
                        privateBuyer: address(0),
                        buyer: bundledOfferDetails.buyer,
                        delegatedPurchaser: bundledOfferDetails.delegatedPurchaser,
                        marketplace: bundledOfferDetails.marketplace,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator,
                        listingNonce: bundledOfferItems[i].listingNonce,
                        offerNonce: bundledOfferDetails.offerNonce,
                        listingMinPrice: bundledOfferItems[i].itemPrice,
                        offerPrice: bundledOfferItems[i].itemPrice,
                        listingExpiration: bundledOfferItems[i].listingExpiration,
                        offerExpiration: bundledOfferDetails.offerExpiration,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount
                    });
    
                accumulator.tokenIds[i] = saleDetails.tokenId;
                accumulator.amounts[i] = saleDetails.amount;
                accumulator.salePrices[i] = saleDetails.listingMinPrice;
                accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
                accumulator.sellers[i] = sellerEOA;
                accumulator.sumListingPrices += saleDetails.listingMinPrice;
    
                test721_1.mint(alice, saleDetails.tokenId);
                test721_1.setTokenRoyalty(saleDetails.tokenId, abe, 1000);
            }
    
            AccumulatorHashes memory accumulatorHashes = 
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                });
    
            SignatureECDSA memory signedBundledOffer = _getSignedOfferForBundledItems(bobPk, bundledOfferDetails, bundledOfferItems);
            SignatureECDSA memory signedBundledListing = _getSignedBundledListing(alicePk, accumulatorHashes, bundleOfferDetailsExtended);
    
            vm.prank(bob, bob);
            paymentProcessor.buyBundledListing{value: bundledOfferDetails.offerPrice}(
                signedBundledListing,
                signedBundledOffer, 
                bundleOfferDetailsExtended, 
            bundledOfferItems);
        }
    }

    function test_benchmarkSweepCollectionNoFees() public {
        uint256 numRuns = 50;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            MatchedOrderBundleBase memory bundledOfferDetails = MatchedOrderBundleBase({
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 0,
                offerNonce: _getNextNonce(bob),
                offerPrice: paymentAmount * numItemsInBundle,
                offerExpiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
            SignatureECDSA[] memory signedListings = new SignatureECDSA[](numItemsInBundle);
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                uint256 fakeAddressPk = 1000000 + i;
                address fakeAddress = payable(vm.addr(fakeAddressPk));
    
                bundledOfferItems[i].seller = fakeAddress;
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721_1));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].listingNonce = _getNextNonce(fakeAddress);
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].listingExpiration = type(uint256).max;
    
                MatchedOrder memory saleDetails = 
                    MatchedOrder({
                        sellerAcceptedOffer: false,
                        collectionLevelOffer: false,
                        protocol: bundledOfferDetails.protocol,
                        paymentCoin: bundledOfferDetails.paymentCoin,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        seller: bundledOfferItems[i].seller,
                        privateBuyer: address(0),
                        buyer: bundledOfferDetails.buyer,
                        delegatedPurchaser: bundledOfferDetails.delegatedPurchaser,
                        marketplace: bundledOfferDetails.marketplace,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator,
                        listingNonce: bundledOfferItems[i].listingNonce,
                        offerNonce: bundledOfferDetails.offerNonce,
                        listingMinPrice: bundledOfferItems[i].itemPrice,
                        offerPrice: bundledOfferItems[i].itemPrice,
                        listingExpiration: bundledOfferItems[i].listingExpiration,
                        offerExpiration: bundledOfferDetails.offerExpiration,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount
                    });
    
                signedListings[i] = _getSignedListing(fakeAddressPk, saleDetails);
    
                test721_1.mint(fakeAddress, saleDetails.tokenId);
                test721_1.setTokenRoyalty(saleDetails.tokenId, abe, 0);
    
                vm.prank(fakeAddress);
                test721_1.setApprovalForAll(address(paymentProcessor), true);
            }
    
            SignatureECDSA memory signedOffer = _getSignedOfferForBundledItems(bobPk, bundledOfferDetails, bundledOfferItems);
    
            vm.prank(bob, bob);
            paymentProcessor.sweepCollection{value: bundledOfferDetails.offerPrice}(
                signedOffer, 
                bundledOfferDetails, 
                bundledOfferItems, 
                signedListings);
        }
    }

    function test_benchmarkSweepCollectionMarketplaceFees() public {
        uint256 numRuns = 50;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            MatchedOrderBundleBase memory bundledOfferDetails = MatchedOrderBundleBase({
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 500,
                offerNonce: _getNextNonce(bob),
                offerPrice: paymentAmount * numItemsInBundle,
                offerExpiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
            SignatureECDSA[] memory signedListings = new SignatureECDSA[](numItemsInBundle);
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                uint256 fakeAddressPk = 1000000 + i;
                address fakeAddress = payable(vm.addr(fakeAddressPk));
    
                bundledOfferItems[i].seller = fakeAddress;
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721_1));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 0;
                bundledOfferItems[i].listingNonce = _getNextNonce(fakeAddress);
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].listingExpiration = type(uint256).max;
    
                MatchedOrder memory saleDetails = 
                    MatchedOrder({
                        sellerAcceptedOffer: false,
                        collectionLevelOffer: false,
                        protocol: bundledOfferDetails.protocol,
                        paymentCoin: bundledOfferDetails.paymentCoin,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        seller: bundledOfferItems[i].seller,
                        privateBuyer: address(0),
                        buyer: bundledOfferDetails.buyer,
                        delegatedPurchaser: bundledOfferDetails.delegatedPurchaser,
                        marketplace: bundledOfferDetails.marketplace,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator,
                        listingNonce: bundledOfferItems[i].listingNonce,
                        offerNonce: bundledOfferDetails.offerNonce,
                        listingMinPrice: bundledOfferItems[i].itemPrice,
                        offerPrice: bundledOfferItems[i].itemPrice,
                        listingExpiration: bundledOfferItems[i].listingExpiration,
                        offerExpiration: bundledOfferDetails.offerExpiration,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount
                    });
    
                signedListings[i] = _getSignedListing(fakeAddressPk, saleDetails);
    
                test721_1.mint(fakeAddress, saleDetails.tokenId);
                test721_1.setTokenRoyalty(saleDetails.tokenId, abe, 0);
    
                vm.prank(fakeAddress);
                test721_1.setApprovalForAll(address(paymentProcessor), true);
            }
    
            SignatureECDSA memory signedOffer = _getSignedOfferForBundledItems(bobPk, bundledOfferDetails, bundledOfferItems);
    
            vm.prank(bob, bob);
            paymentProcessor.sweepCollection{value: bundledOfferDetails.offerPrice}(
                signedOffer, 
                bundledOfferDetails, 
                bundledOfferItems, 
                signedListings);
        }
    }

    function test_benchmarkSweepCollectionMarketplaceAndRoyaltyFees() public {
        uint256 numRuns = 45;
        uint256 numItemsInBundle = 100;
        uint256 paymentAmount = 100 ether;

        for (uint256 run = 1; run <= numRuns; run++) {
            MatchedOrderBundleBase memory bundledOfferDetails = MatchedOrderBundleBase({
                protocol: TokenProtocols.ERC721,
                paymentCoin: address(0),
                tokenAddress: address(test721_1),
                privateBuyer: address(0),
                buyer: bob,
                delegatedPurchaser: address(0),
                marketplace: cal,
                marketplaceFeeNumerator: 500,
                offerNonce: _getNextNonce(bob),
                offerPrice: paymentAmount * numItemsInBundle,
                offerExpiration: type(uint256).max
            });
    
            BundledItem[] memory bundledOfferItems = new BundledItem[](numItemsInBundle);
            SignatureECDSA[] memory signedListings = new SignatureECDSA[](numItemsInBundle);
    
            for (uint256 i = 0; i < numItemsInBundle; ++i) {
                uint256 fakeAddressPk = 1000000 + i;
                address fakeAddress = payable(vm.addr(fakeAddressPk));
    
                bundledOfferItems[i].seller = fakeAddress;
                bundledOfferItems[i].tokenId = _getNextAvailableTokenId(address(test721_1));
                bundledOfferItems[i].amount = 1;
                bundledOfferItems[i].maxRoyaltyFeeNumerator = 1000;
                bundledOfferItems[i].listingNonce = _getNextNonce(fakeAddress);
                bundledOfferItems[i].itemPrice = paymentAmount;
                bundledOfferItems[i].listingExpiration = type(uint256).max;
    
                MatchedOrder memory saleDetails = 
                    MatchedOrder({
                        sellerAcceptedOffer: false,
                        collectionLevelOffer: false,
                        protocol: bundledOfferDetails.protocol,
                        paymentCoin: bundledOfferDetails.paymentCoin,
                        tokenAddress: bundledOfferDetails.tokenAddress,
                        seller: bundledOfferItems[i].seller,
                        privateBuyer: address(0),
                        buyer: bundledOfferDetails.buyer,
                        delegatedPurchaser: bundledOfferDetails.delegatedPurchaser,
                        marketplace: bundledOfferDetails.marketplace,
                        marketplaceFeeNumerator: bundledOfferDetails.marketplaceFeeNumerator,
                        maxRoyaltyFeeNumerator: bundledOfferItems[i].maxRoyaltyFeeNumerator,
                        listingNonce: bundledOfferItems[i].listingNonce,
                        offerNonce: bundledOfferDetails.offerNonce,
                        listingMinPrice: bundledOfferItems[i].itemPrice,
                        offerPrice: bundledOfferItems[i].itemPrice,
                        listingExpiration: bundledOfferItems[i].listingExpiration,
                        offerExpiration: bundledOfferDetails.offerExpiration,
                        tokenId: bundledOfferItems[i].tokenId,
                        amount: bundledOfferItems[i].amount
                    });
    
                signedListings[i] = _getSignedListing(fakeAddressPk, saleDetails);
    
                test721_1.mint(fakeAddress, saleDetails.tokenId);
                test721_1.setTokenRoyalty(saleDetails.tokenId, abe, 1000);
    
                vm.prank(fakeAddress);
                test721_1.setApprovalForAll(address(paymentProcessor), true);
            }
    
            SignatureECDSA memory signedOffer = _getSignedOfferForBundledItems(bobPk, bundledOfferDetails, bundledOfferItems);
    
            vm.prank(bob, bob);
            paymentProcessor.sweepCollection{value: bundledOfferDetails.offerPrice}(
                signedOffer, 
                bundledOfferDetails, 
                bundledOfferItems, 
                signedListings);
        }
    }
    */
}