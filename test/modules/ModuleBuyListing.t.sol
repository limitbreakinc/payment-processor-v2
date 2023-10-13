pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleBuyListingTest is cPortModuleTest {

    /***************************/
    /*       Happy Path        */
    /***************************/

    /***************************/
    /*       Standard ETH      */
    /***************************/

    function testBuyListing721FillOrKillStandardNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        _buySignedListing(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillOrKillStandardNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        _buySignedListing(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillPartialStandardNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _buySignedListing(
            buyer,
            uint128(unitPrice * saleDetails.requestedFillAmount),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    /***************************/
    /*      Standard WETH      */
    /***************************/

    function testBuyListing721FillOrKillStandardNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        _buySignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillOrKillStandardNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        _buySignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillPartialStandardNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _buySignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    /****************************/
    /* Standard ETH Fee On Top **/
    /****************************/

    function testBuyListing721FillOrKillStandardFeeOnTop_ETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillOrKillStandardFeeOnTop_ETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillPartialStandardFeeOnTop_ETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        uint256 unitPrice = saleDetails.itemPrice / amount;
        FeeOnTop memory feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(unitPrice * saleDetails.requestedFillAmount),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /****************************/
    /* Standard WETH Fee On Top */
    /****************************/

    function testBuyListing721FillOrKillStandardFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice + uint128(feeOnTop.amount));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillOrKillStandardFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice + uint128(feeOnTop.amount));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillPartialStandardFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        uint256 unitPrice = saleDetails.itemPrice / amount;
        FeeOnTop memory feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice + uint128(feeOnTop.amount));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /***************************/
    /*       Cosigned ETH      */
    /***************************/

    function testBuyListing721FillOrKillCosignedNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        _buyCosignedListing(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillOrKillCosignedNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        _buyCosignedListing(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillPartialCosignedNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _buyCosignedListing(
            buyer,
            uint128(unitPrice * saleDetails.requestedFillAmount),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    /***************************/
    /*      Cosigned WETH      */
    /***************************/

    function testBuyListing721FillOrKillCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        _buyCosignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillOrKillCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        _buyCosignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillPartialCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _buyCosignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    // TODO

    /***************************/
    /* Cosigned ETH Fee On Top */
    /***************************/

    function testBuyListing721FillOrKillCosignedFeeOnTop_ETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillOrKillCosignedFeeOnTop_ETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillPartialCosignedFeeOnTop_ETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        uint256 unitPrice = saleDetails.itemPrice / amount;
        FeeOnTop memory feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(unitPrice * saleDetails.requestedFillAmount),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /****************************/
    /* Cosigned WETH Fee On Top */
    /****************************/

    function testBuyListing721FillOrKillCosignedFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice + uint128(feeOnTop.amount));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillOrKillCosignedFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice + uint128(feeOnTop.amount));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testBuyListing1155FillPartialCosignedFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        uint256 unitPrice = saleDetails.itemPrice / amount;
        FeeOnTop memory feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice + uint128(feeOnTop.amount));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /***************************/
    /*   Empty Cosigned ETH    */
    /***************************/

    function testBuyListing721FillOrKillEmptyCosignedNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        _buyEmptyCosignedListing(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillOrKillEmptyCosignedNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        _buyEmptyCosignedListing(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillPartialEmptyCosignedNoFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        vm.deal(buyer, uint128(saleDetails.itemPrice));

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _buyEmptyCosignedListing(
            buyer,
            uint128(unitPrice * saleDetails.requestedFillAmount),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    /***************************/
    /*   Empty Cosigned WETH   */
    /***************************/

    function testBuyListing721FillOrKillEmptyCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        _buyEmptyCosignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillOrKillEmptyCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: amount,
            minimumFillAmount: amount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        _buyEmptyCosignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function testBuyListing1155FillPartialEmptyCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(saleDetails.maker);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _buyEmptyCosignedListing(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }
}