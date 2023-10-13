pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../CPortModule.t.sol";

contract ModuleAcceptCollectionOfferTest is cPortModuleTest {

    /***************************/
    /*       Happy Path        */
    /***************************/

    /***************************/
    /*      Standard WETH      */
    /***************************/

    function testAcceptCollectionOffer721FillOrKillStandardNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        _acceptSignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    function testAcceptCollectionOffer1155FillOrKillStandardNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        _acceptSignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    function testAcceptCollectionOffer1155FillPartialStandardNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _acceptSignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }



    /****************************/
    /* Standard WETH Fee On Top */
    /****************************/

    function testAcceptCollectionOffer721FillOrKillStandardFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

        _acceptSignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testAcceptCollectionOffer1155FillOrKillStandardFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

        _acceptSignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testAcceptCollectionOffer1155FillPartialStandardFeeOnTop_WETH(
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

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

        _acceptSignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /***************************/
    /*      Cosigned WETH      */
    /***************************/

    function testAcceptCollectionOffer721FillOrKillCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        _acceptCosignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    function testAcceptCollectionOffer1155FillOrKillCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        _acceptCosignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    function testAcceptCollectionOffer1155FillPartialCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _acceptCosignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    /****************************/
    /* Cosigned WETH Fee On Top */
    /****************************/

    function testAcceptCollectionOffer721FillOrKillCosignedFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

        _acceptCosignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testAcceptCollectionOffer1155FillOrKillCosignedFeeOnTop_WETH(
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(amount > 0);

        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

        _acceptCosignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function testAcceptCollectionOffer1155FillPartialCosignedFeeOnTop_WETH(
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

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

        _acceptCosignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /***************************/
    /*   Empty Cosigned WETH   */
    /***************************/

    function testAcceptCollectionOffer721FillOrKillEmptyCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test721.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        _acceptEmptyCosignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    function testAcceptCollectionOffer1155FillOrKillEmptyCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        _acceptEmptyCosignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }

    function testAcceptCollectionOffer1155FillPartialEmptyCosignedNoFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount < amount);
        vm.assume(fuzzedOrderInputs.itemPrice > amount);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
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

        test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
        test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

        vm.prank(seller);
        test1155.setApprovalForAll(address(_cPort), true);

        _allocateTokensAndApprovals(saleDetails.maker, fuzzedOrderInputs.itemPrice);

        uint256 unitPrice = saleDetails.itemPrice / amount;

        _acceptEmptyCosignedCollectionOffer(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        _verifyExpectedTradeStateChanges(saleDetails.maker, saleDetails, fuzzedOrderInputs);
    }
}