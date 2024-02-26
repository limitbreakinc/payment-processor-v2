pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../PaymentProcessorModule.t.sol";

contract RestoreUndispensedItemOrdersTest is PaymentProcessorModuleTest {

    function setUp() public override {
        super.setUp();
        _allocateTokensAndApprovals(benchmarkBeneficiary, uint128(MAX_INT));
    }

    // Buy Listing

    function testBuyListingSingleRevertsWhenOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(orders[1].maker, orders[1].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                orders[0], 
                signatures[0],
                cosignatures[0],
                feesOnTop[0]);


        vm.expectRevert(PaymentProcessor__DispensingTokenWasUnsuccessful.selector);
        vm.prank(alice, alice);
        _paymentProcessor.buyListing{value: orders[0].itemPrice}(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    // Bulk Buy Listings

    function testPartialFillBulkBuy721UniqueSellersFirstOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(orders[1].maker, orders[1].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);
        
        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[0].nonce, orders[0].maker);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertTrue(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkBuy721UniqueSellersSecondOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(orders[0].maker, orders[0].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[0].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);
        
        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[1].nonce, orders[1].maker);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertTrue(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkBuy1155UniqueSellersFirstOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 2,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(orders[1].maker, orders[1].tokenId, orders[1].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[0].nonce, orders[0].maker);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertTrue(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkBuy1155UniqueSellersSecondOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 2,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(orders[0].maker, orders[0].tokenId, orders[0].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[0].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);
        
        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[1].nonce, orders[1].maker);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertTrue(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkBuy1155PartialFillRecovery() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);
        bytes32[] memory orderDigests = new bytes32[](2);
        PartiallyFillableOrderStatus[] memory onchainOrderStatuses = new PartiallyFillableOrderStatus[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 7,
            minimumFillAmount: 7
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 5,
            minimumFillAmount: 5
        });

        (signatures[0], orderDigests[0]) = _getSignedSaleApprovalAndDigest(alicePk, orders[0]);
        (signatures[1], orderDigests[1]) = _getSignedSaleApprovalAndDigest(alicePk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(alice, orders[1].tokenId, orders[1].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[1]);

        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 0);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 0);

        orders[0].requestedFillAmount = 2;
        orders[0].minimumFillAmount = 2;
        orders[1].requestedFillAmount = 3;
        orders[1].minimumFillAmount = 3;

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 8);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 7);

        orders[0].requestedFillAmount = 4;
        orders[0].minimumFillAmount = 4;
        orders[1].requestedFillAmount = 2;
        orders[1].minimumFillAmount = 2;

        fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 4);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 7);
    }

    function testPartialFillBulkBuy1155PartialFillRecoveryWhenOrderClosedButCannotFill() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);
        bytes32[] memory orderDigests = new bytes32[](2);
        PartiallyFillableOrderStatus[] memory onchainOrderStatuses = new PartiallyFillableOrderStatus[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 9,
            itemPrice: 18 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 7,
            minimumFillAmount: 7
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 7,
            itemPrice: 14 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 5,
            minimumFillAmount: 5
        });

        (signatures[0], orderDigests[0]) = _getSignedSaleApprovalAndDigest(alicePk, orders[0]);
        (signatures[1], orderDigests[1]) = _getSignedSaleApprovalAndDigest(alicePk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(alice, orders[1].tokenId, 10);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[1]);

        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 0);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 0);

        orders[0].requestedFillAmount = 4;
        orders[0].minimumFillAmount = 4;
        orders[1].requestedFillAmount = 1;
        orders[1].minimumFillAmount = 1;

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 5);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 6);

        orders[0].requestedFillAmount = 5;
        orders[0].minimumFillAmount = 5;
        orders[1].requestedFillAmount = 6;
        orders[1].minimumFillAmount = 6;

        fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                orders, 
                signatures,
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, true);
        emit OrderDigestInvalidated(orderDigests[0], orders[0].maker, false);

        vm.expectEmit(true, true, false, true);
        emit OrderDigestInvalidated(orderDigests[1], orders[1].maker, false);

        vm.expectEmit(true, true, false, true);
        emit OrderDigestItemsRestored(orderDigests[1], orders[1].maker, orders[1].requestedFillAmount);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.bulkBuyListings{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(alice, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Filled));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 0);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 6);
    }

    // Item Offers

    function testPartialFillBulkAcceptOffers721UniqueSellersFirstOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 2,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });



        signatures[0] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[0]);
        signatures[1] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(bob, orders[1].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);
        
        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[0].nonce, orders[0].maker);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.prank(bob, bob);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertTrue(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkAcceptOffers721UniqueSellersSecondOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 2,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });



        signatures[0] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[0]);
        signatures[1] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(bob, orders[0].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[0].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[1].nonce, orders[1].maker);

        vm.prank(bob, bob);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        assertTrue(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkAcceptOffers1155UniqueSellersFirstOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 2,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 2,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        signatures[0] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[0]);
        signatures[1] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(bob, orders[1].tokenId, orders[1].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);
        
        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[0].nonce, orders[0].maker);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.prank(bob, bob);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertTrue(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkAcceptOffers1155UniqueSellersSecondOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 2,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 2,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        signatures[0] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[0]);
        signatures[1] = _getSignedItemOffer(benchmarkBeneficiaryPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(bob, orders[0].tokenId, orders[0].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[0].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[1].nonce, orders[1].maker);

        vm.prank(bob, bob);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        assertTrue(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillBulkAcceptOffers1155PartialFillRecovery() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);
        bytes32[] memory orderDigests = new bytes32[](2);
        PartiallyFillableOrderStatus[] memory onchainOrderStatuses = new PartiallyFillableOrderStatus[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 7,
            minimumFillAmount: 7
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 5,
            minimumFillAmount: 5
        });

        (signatures[0], orderDigests[0]) = _getSignedItemOfferAndDigest(benchmarkBeneficiaryPk, orders[0]);
        (signatures[1], orderDigests[1]) = _getSignedItemOfferAndDigest(benchmarkBeneficiaryPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(alice, orders[1].tokenId, orders[1].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[1]);

        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 0);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 0);

        orders[0].requestedFillAmount = 2;
        orders[0].minimumFillAmount = 2;
        orders[1].requestedFillAmount = 3;
        orders[1].minimumFillAmount = 3;

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.prank(alice, alice);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 8);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 7);

        orders[0].requestedFillAmount = 4;
        orders[0].minimumFillAmount = 4;
        orders[1].requestedFillAmount = 2;
        orders[1].minimumFillAmount = 2;

        fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.prank(alice, alice);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 4);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 7);
    }

    function testPartialFillBulkAcceptOffers1155PartialFillRecoveryWhenOrderClosedButCannotFill() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);
        bytes32[] memory orderDigests = new bytes32[](2);
        PartiallyFillableOrderStatus[] memory onchainOrderStatuses = new PartiallyFillableOrderStatus[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 9,
            itemPrice: 18 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 7,
            minimumFillAmount: 7
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: benchmarkBeneficiary,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 7,
            itemPrice: 14 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 5,
            minimumFillAmount: 5
        });

        (signatures[0], orderDigests[0]) = _getSignedItemOfferAndDigest(benchmarkBeneficiaryPk, orders[0]);
        (signatures[1], orderDigests[1]) = _getSignedItemOfferAndDigest(benchmarkBeneficiaryPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(alice, orders[1].tokenId, 10);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[1]);

        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 0);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 0);

        orders[0].requestedFillAmount = 4;
        orders[0].minimumFillAmount = 4;
        orders[1].requestedFillAmount = 1;
        orders[1].minimumFillAmount = 1;

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.prank(alice, alice);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 5);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 6);

        orders[0].requestedFillAmount = 5;
        orders[0].minimumFillAmount = 5;
        orders[1].requestedFillAmount = 6;
        orders[1].minimumFillAmount = 6;

        fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                new bool[](2),
                orders, 
                signatures,
                new TokenSetProof[](2),
                cosignatures,
                feesOnTop);

        vm.expectEmit(true, true, false, true);
        emit OrderDigestInvalidated(orderDigests[0], orders[0].maker, false);

        vm.expectEmit(true, true, false, true);
        emit OrderDigestInvalidated(orderDigests[1], orders[1].maker, false);

        vm.expectEmit(true, true, false, true);
        emit OrderDigestItemsRestored(orderDigests[1], orders[1].maker, orders[1].requestedFillAmount);

        vm.prank(alice, alice);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);

        onchainOrderStatuses[0] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[0]);
        onchainOrderStatuses[1] = _paymentProcessor.remainingFillableQuantity(benchmarkBeneficiary, orderDigests[1]);
        assertEq(uint8(onchainOrderStatuses[0].state), uint8(PartiallyFillableOrderState.Filled));
        assertEq(uint8(onchainOrderStatuses[1].state), uint8(PartiallyFillableOrderState.Open));
        assertEq(onchainOrderStatuses[0].remainingFillableQuantity, 0);
        assertEq(onchainOrderStatuses[1].remainingFillableQuantity, 6);
    }

    // Sweeps

    function testPartialFillSweep721UniqueSellersFirstOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(orders[1].maker, orders[1].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        SweepItem[] memory sweepItems = new SweepItem[](2);
        for (uint i = 0; i < orders.length; i++) {
            sweepItems[i] = SweepItem({
                maker: orders[i].maker,
                marketplace: orders[i].marketplace,
                fallbackRoyaltyRecipient: orders[i].fallbackRoyaltyRecipient,
                tokenId: orders[i].tokenId,
                amount: orders[i].amount,
                itemPrice: orders[i].itemPrice,
                nonce: orders[i].nonce,
                expiration: orders[i].expiration,
                marketplaceFeeNumerator: orders[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: orders[i].maxRoyaltyFeeNumerator
            });
        }

        SweepOrder memory sweepOrder = SweepOrder({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            tokenAddress: address(test721),
            paymentMethod: address(0),
            beneficiary: benchmarkBeneficiary
        });

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                FeeOnTop({recipient: address(0), amount: 0}),
                sweepOrder, 
                sweepItems,
                signatures,
                cosignatures);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[0].nonce, orders[0].maker);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.sweepCollection{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertTrue(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillSweep721UniqueSellersSecondOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 1,
            amount: 1,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: 2,
            amount: 1,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 1,
            minimumFillAmount: 1
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test721.mint(orders[0].maker, orders[0].tokenId);
        test721.setDefaultRoyaltyInfo(cal, uint96(orders[0].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        SweepItem[] memory sweepItems = new SweepItem[](2);
        for (uint i = 0; i < orders.length; i++) {
            sweepItems[i] = SweepItem({
                maker: orders[i].maker,
                marketplace: orders[i].marketplace,
                fallbackRoyaltyRecipient: orders[i].fallbackRoyaltyRecipient,
                tokenId: orders[i].tokenId,
                amount: orders[i].amount,
                itemPrice: orders[i].itemPrice,
                nonce: orders[i].nonce,
                expiration: orders[i].expiration,
                marketplaceFeeNumerator: orders[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: orders[i].maxRoyaltyFeeNumerator
            });
        }

        SweepOrder memory sweepOrder = SweepOrder({
            protocol: OrderProtocols.ERC721_FILL_OR_KILL,
            tokenAddress: address(test721),
            paymentMethod: address(0),
            beneficiary: benchmarkBeneficiary
        });

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                FeeOnTop({recipient: address(0), amount: 0}),
                sweepOrder, 
                sweepItems,
                signatures,
                cosignatures);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[1].nonce, orders[1].maker);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.sweepCollection{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertTrue(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillSweep1155UniqueSellersFirstOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 2,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(orders[1].maker, orders[1].tokenId, orders[1].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        SweepItem[] memory sweepItems = new SweepItem[](2);
        for (uint i = 0; i < orders.length; i++) {
            sweepItems[i] = SweepItem({
                maker: orders[i].maker,
                marketplace: orders[i].marketplace,
                fallbackRoyaltyRecipient: orders[i].fallbackRoyaltyRecipient,
                tokenId: orders[i].tokenId,
                amount: orders[i].amount,
                itemPrice: orders[i].itemPrice,
                nonce: orders[i].nonce,
                expiration: orders[i].expiration,
                marketplaceFeeNumerator: orders[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: orders[i].maxRoyaltyFeeNumerator
            });
        }

        SweepOrder memory sweepOrder = SweepOrder({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            tokenAddress: address(test1155),
            paymentMethod: address(0),
            beneficiary: benchmarkBeneficiary
        });

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                FeeOnTop({recipient: address(0), amount: 0}),
                sweepOrder, 
                sweepItems,
                signatures,
                cosignatures);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[0].nonce, orders[0].maker);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.sweepCollection{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertTrue(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }

    function testPartialFillSweep1155UniqueSellersSecondOrderUnfillable() public {
        Order[] memory orders = new Order[](2);
        SignatureECDSA[] memory signatures = new SignatureECDSA[](2);
        Cosignature[] memory cosignatures = new Cosignature[](2);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](2);

        orders[0] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: alice,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 1,
            amount: 10,
            itemPrice: 1 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        orders[1] = Order({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            maker: bob,
            beneficiary: benchmarkBeneficiary,
            marketplace: abe,
            fallbackRoyaltyRecipient: cal,
            paymentMethod: address(0),
            tokenAddress: address(test1155),
            tokenId: 2,
            amount: 10,
            itemPrice: 2 ether,
            nonce: 1,
            expiration: type(uint256).max,
            marketplaceFeeNumerator: 500,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: 10,
            minimumFillAmount: 10
        });

        signatures[0] = _getSignedSaleApproval(alicePk, orders[0]);
        signatures[1] = _getSignedSaleApproval(bobPk, orders[1]);

        cosignatures[0] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        cosignatures[1] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        feesOnTop[0] = FeeOnTop({recipient: address(0), amount: 0});
        feesOnTop[1] = FeeOnTop({recipient: address(0), amount: 0});

        test1155.mint(orders[0].maker, orders[0].tokenId, orders[0].amount);
        test1155.setDefaultRoyaltyInfo(cal, uint96(orders[1].maxRoyaltyFeeNumerator));

        assertFalse(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));

        SweepItem[] memory sweepItems = new SweepItem[](2);
        for (uint i = 0; i < orders.length; i++) {
            sweepItems[i] = SweepItem({
                maker: orders[i].maker,
                marketplace: orders[i].marketplace,
                fallbackRoyaltyRecipient: orders[i].fallbackRoyaltyRecipient,
                tokenId: orders[i].tokenId,
                amount: orders[i].amount,
                itemPrice: orders[i].itemPrice,
                nonce: orders[i].nonce,
                expiration: orders[i].expiration,
                marketplaceFeeNumerator: orders[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: orders[i].maxRoyaltyFeeNumerator
            });
        }

        SweepOrder memory sweepOrder = SweepOrder({
            protocol: OrderProtocols.ERC1155_FILL_OR_KILL,
            tokenAddress: address(test1155),
            paymentMethod: address(0),
            beneficiary: benchmarkBeneficiary
        });

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                FeeOnTop({recipient: address(0), amount: 0}),
                sweepOrder, 
                sweepItems,
                signatures,
                cosignatures);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[0].nonce, orders[0].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceInvalidated(orders[1].nonce, orders[1].maker, false);

        vm.expectEmit(true, true, false, false);
        emit NonceRestored(orders[1].nonce, orders[1].maker);

        vm.prank(benchmarkBeneficiary, benchmarkBeneficiary);
        _paymentProcessor.sweepCollection{value: orders[0].itemPrice + orders[1].itemPrice}(fnCalldata);

        assertTrue(_paymentProcessor.isNonceUsed(orders[0].maker, orders[0].nonce));
        assertFalse(_paymentProcessor.isNonceUsed(orders[1].maker, orders[1].nonce));
    }
}