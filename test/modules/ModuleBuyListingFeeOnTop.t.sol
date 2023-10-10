pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleBuyListingTest is cPortModuleTest {
    /******************************/
    /*    Buy Listing For Self   */
    /******************************/

    function testBuyListingForSelfFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
    }

    function testBuyListingForSelfFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /**************************************/
    /*    Buy Co-Signed Listing For Self  */
    /**************************************/

    function testBuyCosignedListingForSelfFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
    }

    function testBuyCosignedListingForSelfFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /**********************************/
    /* Buy Listing For Self With EOA */
    /**********************************/

    function testBuyListingForSelfWithEOAFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
    }

    function testBuyListingForSelfWithEOAFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs, 
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /*******************************************/
    /* Buy Co-Signed Listing For Self With EOA */
    /*******************************************/

    function testBuyCosignedListingForSelfWithEOAFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
    }

    function testBuyCosignedListingForSelfWithEOAFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = buyer;

        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));
        _allocateTokensAndApprovals(buyer, uint128(MAX_INT));

        test721.mint(saleDetails.maker, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListingWithFeeOnTop(
            buyer,
            uint128(0),
            fuzzedOrderInputs, 
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /*****************************/
    /*    Buy Listing For Anyone */
    /*****************************/

    function testBuyListingForAnyoneFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
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

        _buySignedListingWithFeeOnTop(
            purchaser,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
    }

    function testBuyListingForAnyoneFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
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

        _buySignedListingWithFeeOnTop(
            purchaser,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails,
            feeOnTop, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }


    /***************************************/
    /*    Buy Co-Signed Listing For Anyone */
    /***************************************/

    function testBuyCosignedListingForAnyoneFeeOnTop_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
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

        _buyCosignedListingWithFeeOnTop(
            purchaser,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
    }

    function testBuyCosignedListingForAnyoneFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
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

        _buyCosignedListingWithFeeOnTop(
            purchaser,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }
}