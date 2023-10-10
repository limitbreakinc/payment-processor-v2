pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleBulkBuyListingsTest is cPortModuleTest {
    /***********************************/
    /*    Bulk Buy Listings For Self   */
    /***********************************/

    function testBulkBuyListingsForSelf_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuySignedListings(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyListingsForSelf_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuySignedListings(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /********************************************/
    /*    Bulk Buy Co-Signed Listings For Self  */
    /********************************************/

    function testBulkBuyCosignedListingsForSelf_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyCosignedListings(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyCosignedListingsForSelf_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyCosignedListings(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /***************************************/
    /* Bulk Buy Listings For Self With EOA */
    /***************************************/

    function testBulkBuyListingsForSelfWithEOA_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuySignedListings(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyListingsForSelfWithEOA_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuySignedListings(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /*************************************************/
    /* Bulk Buy Co-Signed Listings For Self With EOA */
    /*************************************************/

    function testBulkBuyCosignedListingsForSelfWithEOA_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyCosignedListings(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyCosignedListingsForSelfWithEOA_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = purchaser;

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyCosignedListings(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /***********************************/
    /*    Bulk Buy Listings For Anyone */
    /***********************************/

    function testBulkBuyListingsForAnyone_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuySignedListings(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyListingsForAnyone_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuySignedListings(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }


    /*********************************************/
    /*    Bulk Buy Co-Signed Listings For Anyone */
    /*********************************************/

    function testBulkBuyCosignedListingsForAnyone_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyCosignedListings(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyCosignedListingsForAnyone_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = fuzzedOrderInputsArray[0].buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
                maker: vm.addr(fuzzedOrderInputs.sellerKey),
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyCosignedListings(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }
}