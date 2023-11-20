pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../CPortModule.t.sol";

contract ModuleSweepCollectionTest is cPortModuleTest {

    function _generateSweepOrder(
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2,
        FeeOnTop memory feeOnTop
    ) private returns (
        address buyer,
        uint256 nativePaymentAmount,
        SweepOrder memory sweepOrder,
        Order[] memory saleDetailsArray,
        FuzzedOrder721[] memory fuzzedOrderInputsArray
    ) {
        _scrubFuzzedOrderInputs(params1.fuzzedOrderInputs);
        vm.assume(params1.amount > 0);

        _scrubFuzzedOrderInputs(params2.fuzzedOrderInputs);
        vm.assume(params2.amount > 0);

        vm.assume(feeOnTop.amount <= params1.fuzzedOrderInputs.itemPrice + params2.fuzzedOrderInputs.itemPrice);

        nativePaymentAmount = 0;

        params1.orderProtocol = params2.orderProtocol;
        params1.paymentMethod = params2.paymentMethod;
        params1.fuzzedOrderInputs.beneficiary = params2.fuzzedOrderInputs.beneficiary;
        params1.fuzzedOrderInputs.buyerKey = params2.fuzzedOrderInputs.buyerKey;

        buyer = params1.fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(params1.fuzzedOrderInputs.buyerKey);
        
        sweepOrder = SweepOrder({
            protocol: params1.orderProtocol,
            tokenAddress: params1.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155),
            paymentMethod: params1.paymentMethod,
            beneficiary: params1.fuzzedOrderInputs.beneficiary
        });

        fuzzedOrderInputsArray = new FuzzedOrder721[](2); 
        saleDetailsArray = new Order[](2);

        fuzzedOrderInputsArray[0] = params1.fuzzedOrderInputs;
        fuzzedOrderInputsArray[1] = params2.fuzzedOrderInputs;

        saleDetailsArray[0] = Order({
            protocol: params1.orderProtocol,
            maker: vm.addr(params1.fuzzedOrderInputs.sellerKey),
            beneficiary: params1.fuzzedOrderInputs.beneficiary,
            marketplace: params1.fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: sweepOrder.paymentMethod,
            tokenAddress: sweepOrder.tokenAddress,
            tokenId: params1.fuzzedOrderInputs.tokenId,
            amount: params1.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 1 : params1.amount,
            itemPrice: params1.fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(params1.fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + params1.fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: params1.fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: params1.fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params1.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 1 : params1.amount,
            minimumFillAmount: params1.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 1 : params1.amount
        });

        saleDetailsArray[1] = Order({
            protocol: params2.orderProtocol,
            maker: vm.addr(params2.fuzzedOrderInputs.sellerKey),
            beneficiary: params2.fuzzedOrderInputs.beneficiary,
            marketplace: params2.fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: sweepOrder.paymentMethod,
            tokenAddress: sweepOrder.tokenAddress,
            tokenId: params2.fuzzedOrderInputs.tokenId,
            amount: params2.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 1 : params2.amount,
            itemPrice: params2.fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(params2.fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + params2.fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: params2.fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: params2.fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params2.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 1 : params2.amount,
            minimumFillAmount: params2.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 1 : params2.amount
        });

        if (params1.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(saleDetailsArray[0].maker, saleDetailsArray[0].tokenId);
            test721.setTokenRoyalty(saleDetailsArray[0].tokenId, params1.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[0].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[0].maker);
            test721.setApprovalForAll(address(_cPort), true);

            test721.mint(saleDetailsArray[1].maker, saleDetailsArray[1].tokenId);
            test721.setTokenRoyalty(saleDetailsArray[1].tokenId, params2.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[1].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[1].maker);
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(saleDetailsArray[0].maker, saleDetailsArray[0].tokenId, saleDetailsArray[0].amount);
            test1155.setTokenRoyalty(saleDetailsArray[0].tokenId, params1.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[0].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[0].maker);
            test1155.setApprovalForAll(address(_cPort), true);

            test1155.mint(saleDetailsArray[1].maker, saleDetailsArray[1].tokenId, saleDetailsArray[1].amount);
            test1155.setTokenRoyalty(saleDetailsArray[1].tokenId, params2.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[1].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[1].maker);
            test1155.setApprovalForAll(address(_cPort), true);
        }

        if (sweepOrder.paymentMethod == address(0)) {
            vm.deal(buyer, saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice + feeOnTop.amount);
        } else {
            SeaportTestERC20(sweepOrder.paymentMethod).mint(buyer, saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice + feeOnTop.amount);
            vm.prank(buyer);
            SeaportTestERC20(sweepOrder.paymentMethod).approve(address(_cPort), saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice + feeOnTop.amount);
        }

        if (sweepOrder.paymentMethod == address(0)) {
            nativePaymentAmount = saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice;
        }
    }

    function _runTestSweepCollection(
        bool cosigned,
        bool isCosignatureEmpty,
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2
    ) internal {
        vm.assume(params1.fuzzedOrderInputs.tokenId != params2.fuzzedOrderInputs.tokenId);

        (
            address buyer,
            uint256 nativePaymentAmount,
            SweepOrder memory sweepOrder,
            Order[] memory saleDetailsArray, 
            FuzzedOrder721[] memory fuzzedOrderInputsArray
        ) = _generateSweepOrder(params1, params2, FeeOnTop({recipient: address(0), amount: 0}));

        if (cosigned) {
            if (isCosignatureEmpty) {
                _sweepEmptyCosignedListings(
                    buyer, 
                    nativePaymentAmount, 
                    sweepOrder,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            } else {
                _sweepCosignedListings(
                    buyer, 
                    nativePaymentAmount, 
                    sweepOrder,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            }
        } else {
            _sweepSignedListings(
                buyer, 
                nativePaymentAmount, 
                sweepOrder,
                fuzzedOrderInputsArray, 
                saleDetailsArray, 
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(
            buyer, 
            saleDetailsArray[0],
            saleDetailsArray[1],
            fuzzedOrderInputsArray[0],
            fuzzedOrderInputsArray[1]);
    }

    function _runTestSweepCollectionWithFeeOnTop(
        bool cosigned,
        bool isCosignatureEmpty,
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) internal {
        vm.assume(params1.fuzzedOrderInputs.tokenId != params2.fuzzedOrderInputs.tokenId);

        FeeOnTop memory feeOnTop = _getFeeOnTop(params1.fuzzedOrderInputs.itemPrice + params2.fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        (
            address buyer,
            uint256 nativePaymentAmount,
            SweepOrder memory sweepOrder,
            Order[] memory saleDetailsArray, 
            FuzzedOrder721[] memory fuzzedOrderInputsArray
        ) = _generateSweepOrder(params1, params2, feeOnTop);

        if (cosigned) {
            if (isCosignatureEmpty) {
                _sweepEmptyCosignedListingsWithFeeOnTop(
                    buyer, 
                    nativePaymentAmount, 
                    sweepOrder,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feeOnTop,
                    EMPTY_SELECTOR);
            } else {
                _sweepCosignedListingsWithFeeOnTop(
                    buyer, 
                    nativePaymentAmount, 
                    sweepOrder,
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feeOnTop,
                    EMPTY_SELECTOR);
            }
        } else {
            _sweepSignedListingsWithFeeOnTop(
                buyer, 
                nativePaymentAmount, 
                sweepOrder,
                fuzzedOrderInputsArray, 
                saleDetailsArray, 
                feeOnTop,
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(
            buyer, 
            saleDetailsArray[0],
            saleDetailsArray[1],
            fuzzedOrderInputsArray[0],
            fuzzedOrderInputsArray[1]);
    }

    function testSweepCollectionStandardNoFeeOnTop(
        uint8 paymentSettings, 
        uint8 orderProtocol,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1,
        uint248 amount2
    ) public {
        vm.assume(fuzzedOrderInputs1.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderInputs2.itemPrice < type(uint96).max);

        fuzzedOrderInputs2.buyerKey = fuzzedOrderInputs1.buyerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod = orderProtocol % 2 == 0 ? address(0) : address(weth);

        orderProtocol = orderProtocol % 2;
        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            amount2 = 1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount1, 
                    fillAmount: amount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount2, 
                    fillAmount: amount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestSweepCollection(false, false, params1, params2);
    }

    function testSweepCollectionStandardFeeOnTop(
        uint8 paymentSettings, 
        uint8 orderProtocol,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1,
        uint248 amount2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        vm.assume(fuzzedOrderInputs1.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderInputs2.itemPrice < type(uint96).max);

        fuzzedOrderInputs2.buyerKey = fuzzedOrderInputs1.buyerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod = orderProtocol % 2 == 0 ? address(0) : address(weth);

        orderProtocol = orderProtocol % 2;
        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            amount2 = 1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount1, 
                    fillAmount: amount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount2, 
                    fillAmount: amount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestSweepCollectionWithFeeOnTop(false, false, params1, params2, fuzzedFeeOnTop);
    }

    function testSweepCollectionStandardNoFeeOnTopCosigned(
        uint8 paymentSettings, 
        uint8 orderProtocol,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1,
        uint248 amount2
    ) public {
        vm.assume(fuzzedOrderInputs1.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderInputs2.itemPrice < type(uint96).max);

        fuzzedOrderInputs2.buyerKey = fuzzedOrderInputs1.buyerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod = orderProtocol % 2 == 0 ? address(0) : address(weth);

        orderProtocol = orderProtocol % 2;
        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            amount2 = 1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount1, 
                    fillAmount: amount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount2, 
                    fillAmount: amount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestSweepCollection(true, false, params1, params2);
    }

    function testSweepCollectionStandardFeeOnTopCosigned(
        uint8 paymentSettings, 
        uint8 orderProtocol,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1,
        uint248 amount2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        vm.assume(fuzzedOrderInputs1.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderInputs2.itemPrice < type(uint96).max);

        fuzzedOrderInputs2.buyerKey = fuzzedOrderInputs1.buyerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod = orderProtocol % 2 == 0 ? address(0) : address(weth);

        orderProtocol = orderProtocol % 2;
        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            amount2 = 1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount1, 
                    fillAmount: amount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod,
                    amount: amount2, 
                    fillAmount: amount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestSweepCollectionWithFeeOnTop(true, false, params1, params2, fuzzedFeeOnTop);
    }

    function testSweepCollectionStandardNoFeeOnTopEmptyCosigned(
        uint8 paymentSettings, 
        uint8 orderProtocol,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1,
        uint248 amount2
    ) public {
        vm.assume(fuzzedOrderInputs1.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderInputs2.itemPrice < type(uint96).max);

        fuzzedOrderInputs2.buyerKey = fuzzedOrderInputs1.buyerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod = orderProtocol % 2 == 0 ? address(0) : address(weth);

        orderProtocol = orderProtocol % 2;
        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            amount2 = 1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod,
                    amount: amount1, 
                    fillAmount: amount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod,
                    amount: amount2, 
                    fillAmount: amount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestSweepCollection(true, true, params1, params2);
    }

    function testSweepCollectionStandardFeeOnTopEmptyCosigned(
        uint8 paymentSettings, 
        uint8 orderProtocol,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1,
        uint248 amount2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        vm.assume(fuzzedOrderInputs1.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderInputs2.itemPrice < type(uint96).max);

        fuzzedOrderInputs2.buyerKey = fuzzedOrderInputs1.buyerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod = orderProtocol % 2 == 0 ? address(0) : address(weth);

        orderProtocol = orderProtocol % 2;
        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            amount2 = 1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod,
                    amount: amount1, 
                    fillAmount: amount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol), 
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod,
                    amount: amount2, 
                    fillAmount: amount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestSweepCollectionWithFeeOnTop(true, true, params1, params2, fuzzedFeeOnTop);
    }
}