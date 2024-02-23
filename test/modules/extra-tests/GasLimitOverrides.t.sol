pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../../mocks/GasGuzzlingNativeReceiverMock.sol";
import "../PaymentProcessorModule.t.sol";

contract GasLimitOverridesTest is PaymentProcessorModuleTest {

    GasGuzzlingNativeReceiverMock gasGuzzlingRoyaltyReceiver;

    function setUp() public override {
        super.setUp();
        gasGuzzlingRoyaltyReceiver = new GasGuzzlingNativeReceiverMock();
        test721.setDefaultRoyaltyInfo(address(gasGuzzlingRoyaltyReceiver), uint96(500));
        test1155.setDefaultRoyaltyInfo(address(gasGuzzlingRoyaltyReceiver), uint96(500));
    }

    function testRevertsWhenOverrideGasLimitCalledWithZeroAddress(uint256 gasLimitOverride) public {
        vm.assume(gasLimitOverride >= 8_000);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeOverridePushPaymentGasLimitCalldata(
                address(_paymentProcessor),
                address(0),
                gasLimitOverride
            );

        vm.expectRevert();
        _paymentProcessor.overridePushPaymentGasLimit(fnCalldata);
    }

    function testRevertsWhenOverrideGasLimitSetBelowDefault(uint256 gasLimitOverride) public {
        vm.assume(gasLimitOverride < 8_000);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeOverridePushPaymentGasLimitCalldata(
                address(_paymentProcessor),
                address(test721),
                gasLimitOverride
            );

        vm.expectRevert(PaymentProcessor__PushPaymentGasLimitTooLow.selector);
        _paymentProcessor.overridePushPaymentGasLimit(fnCalldata);
    }

    function testRevertsWhenOverrideGasLimitCalledByUnauthorizedUser(address unauthorized, uint256 gasLimitOverride) public {
        vm.assume(gasLimitOverride >= 8_000);

        address[] memory exclusionList = new address[](2);
        exclusionList[0] = address(this);
        exclusionList[1] = address(test721);
        _sanitizeAddress(unauthorized, exclusionList);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeOverridePushPaymentGasLimitCalldata(
                address(_paymentProcessor),
                address(test721),
                gasLimitOverride
            );

        vm.expectRevert(PaymentProcessor__CallerMustHaveElevatedPermissionsForSpecifiedNFT.selector);
        vm.prank(unauthorized);
        _paymentProcessor.overridePushPaymentGasLimit(fnCalldata);
    }

    function testGetCollectionPushPaymentGasLimitOverrideReturnsZeroWhenOverrideIsUnsetOrCleared(
        uint256 gasLimitOverride
    ) public {
        vm.assume(gasLimitOverride > 8_000);

        assertEq(
            _paymentProcessor.getCollectionPushPaymentGasLimitOverride(address(test721)), 
            0
        );

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeOverridePushPaymentGasLimitCalldata(
                address(_paymentProcessor),
                address(test721),
                gasLimitOverride
            );

        vm.expectEmit(true, false, false, false);
        emit PushPaymentGasLimitOverriddenByCollection(address(test721), gasLimitOverride);
        _paymentProcessor.overridePushPaymentGasLimit(fnCalldata);

        assertEq(
            _paymentProcessor.getCollectionPushPaymentGasLimitOverride(address(test721)), 
            gasLimitOverride
        );

        fnCalldata = 
            _paymentProcessorEncoder.encodeOverridePushPaymentGasLimitCalldata(
                address(_paymentProcessor),
                address(test721),
                8_000
            );

        vm.expectEmit(true, false, false, false);
        emit PushPaymentGasLimitOverriddenByCollection(address(test721), 8000);
        _paymentProcessor.overridePushPaymentGasLimit(fnCalldata);

        assertEq(
            _paymentProcessor.getCollectionPushPaymentGasLimitOverride(address(test721)), 
            0
        );
    }

    function testOverrideGasLimit(uint256 gasLimitOverride) public {
        vm.assume(gasLimitOverride > 8_000);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeOverridePushPaymentGasLimitCalldata(
                address(_paymentProcessor),
                address(test721),
                gasLimitOverride
            );

        vm.expectEmit(true, false, false, false);
        emit PushPaymentGasLimitOverriddenByCollection(address(test721), gasLimitOverride);
        _paymentProcessor.overridePushPaymentGasLimit(fnCalldata);

        assertEq(
            _paymentProcessor.getCollectionPushPaymentGasLimitOverride(address(test721)), 
            gasLimitOverride
        );
    }

    function _getBulkBuyListingsInput(
        address buyer, 
        TestTradeSingleItemParams memory params
    ) private returns (
        uint256 paymentAmount,
        FuzzedOrder721 memory fuzzedOrderInputs,
        Order memory saleDetails, 
        FeeOnTop memory feeOnTop
    ) {
        feeOnTop = FeeOnTop({amount: 0, recipient: address(0)});

        fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        vm.assume(fuzzedOrderInputs.marketplaceFeeRate < 5000);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);

        saleDetails = Order({
            protocol: params.orderProtocol,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: params.paymentMethod,
            tokenAddress: token,
            tokenId: fuzzedOrderInputs.tokenId,
            amount: params.amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        paymentAmount = saleDetails.itemPrice;

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(saleDetails.maker, saleDetails.tokenId);

            vm.prank(saleDetails.maker);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);

            vm.prank(saleDetails.maker);
            test1155.setApprovalForAll(address(_paymentProcessor), true);

            if (params.orderProtocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
                vm.assume(params.amount > 0);
                vm.assume(params.fillAmount > 0);
                vm.assume(params.fillAmount < params.amount);
                vm.assume(fuzzedOrderInputs.itemPrice > params.amount);
                saleDetails.itemPrice = saleDetails.itemPrice - (saleDetails.itemPrice % saleDetails.amount);

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;
            }
        }
    }

    function _getBulkBuyListingsInputWithFeeOnTop(
        address buyer, 
        TestTradeSingleItemParams memory params,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) private returns (
        uint256 paymentAmount,
        FuzzedOrder721 memory fuzzedOrderInputs,
        Order memory saleDetails, 
        FeeOnTop memory feeOnTop
    ) {
        fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);

        vm.assume(fuzzedOrderInputs.marketplaceFeeRate < 5000);

        saleDetails = Order({
            protocol: params.orderProtocol,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: params.paymentMethod,
            tokenAddress: token,
            tokenId: fuzzedOrderInputs.tokenId,
            amount: params.amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: 1000,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        paymentAmount = saleDetails.itemPrice;
        feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(saleDetails.maker, saleDetails.tokenId);

            vm.prank(saleDetails.maker);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);

            vm.prank(saleDetails.maker);
            test1155.setApprovalForAll(address(_paymentProcessor), true);

            if (params.orderProtocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
                vm.assume(params.amount > 0);
                vm.assume(params.fillAmount > 0);
                vm.assume(params.fillAmount < params.amount);
                vm.assume(fuzzedOrderInputs.itemPrice > params.amount);
                saleDetails.itemPrice = saleDetails.itemPrice - (saleDetails.itemPrice % saleDetails.amount);

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;

                feeOnTop = _getFeeOnTop(paymentAmount, fuzzedFeeOnTop);
            }
        }
    }

    function _getBulkBuyListingsInputs(
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2
    ) private returns (
        address buyer,
        uint256[] memory paymentAmountsArray,
        FuzzedOrder721[] memory fuzzedOrderInputsArray,
        Order[] memory saleDetailsArray, 
        FeeOnTop[] memory feesOnTop
    ) {
        buyer = params1.fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(params1.fuzzedOrderInputs.buyerKey);

        paymentAmountsArray = new uint256[](2);
        fuzzedOrderInputsArray = new FuzzedOrder721[](2); 
        saleDetailsArray = new Order[](2);
        feesOnTop = new FeeOnTop[](2);

        (paymentAmountsArray[0], fuzzedOrderInputsArray[0], saleDetailsArray[0], feesOnTop[0]) = _getBulkBuyListingsInput(buyer, params1);
        (paymentAmountsArray[1], fuzzedOrderInputsArray[1], saleDetailsArray[1], feesOnTop[1]) = _getBulkBuyListingsInput(buyer, params2);
    }

    function _getBulkBuyListingsInputsWithFeesOnTop(
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop1,
        FuzzedFeeOnTop memory fuzzedFeeOnTop2
    ) private returns (
        address buyer,
        uint256[] memory paymentAmountsArray,
        FuzzedOrder721[] memory fuzzedOrderInputsArray,
        Order[] memory saleDetailsArray, 
        FeeOnTop[] memory feesOnTop
    ) {
        buyer = params1.fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(params1.fuzzedOrderInputs.buyerKey);

        paymentAmountsArray = new uint256[](2);
        fuzzedOrderInputsArray = new FuzzedOrder721[](2); 
        saleDetailsArray = new Order[](2);
        feesOnTop = new FeeOnTop[](2);

        (paymentAmountsArray[0], fuzzedOrderInputsArray[0], saleDetailsArray[0], feesOnTop[0]) = _getBulkBuyListingsInputWithFeeOnTop(buyer, params1, fuzzedFeeOnTop1);
        (paymentAmountsArray[1], fuzzedOrderInputsArray[1], saleDetailsArray[1], feesOnTop[1]) = _getBulkBuyListingsInputWithFeeOnTop(buyer, params2, fuzzedFeeOnTop2);
    }

    function _runTestBulkBuyListingsInsufficientGasLimit(
        bool cosigned,
        bool isCosignatureEmpty,
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2
    ) internal {
        vm.assume(params1.fuzzedOrderInputs.tokenId != params2.fuzzedOrderInputs.tokenId);

        (
            address buyer,
            uint256[] memory paymentAmountsArray,
            FuzzedOrder721[] memory fuzzedOrderInputsArray,
            Order[] memory saleDetailsArray, 
            FeeOnTop[] memory feesOnTop
        ) = _getBulkBuyListingsInputs(params1, params2);

        uint256 nativePaymentAmount = 0;
        uint256 nonNativePaymentAmount = 0;

        for (uint256 i = 0; i < paymentAmountsArray.length; i++) {
            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentAmount += paymentAmountsArray[i];
            } else {
                nonNativePaymentAmount += saleDetailsArray[i].itemPrice;
            }

            vm.assume(saleDetailsArray[i].itemPrice / saleDetailsArray[i].amount > 1000000);
            vm.assume(saleDetailsArray[i].itemPrice >= feesOnTop[i].amount);
        }

        if (nonNativePaymentAmount > 0) {
            weth.mint(buyer, nonNativePaymentAmount);
            vm.prank(buyer);
            weth.approve(address(_paymentProcessor), nonNativePaymentAmount);
        }

        vm.deal(buyer, nativePaymentAmount);

        if (cosigned) {
            if (isCosignatureEmpty) {
                _bulkBuyEmptyCosignedListings(
                    buyer, 
                    nativePaymentAmount, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    PaymentProcessor__FailedToTransferProceeds.selector);
            } else {
                _bulkBuyCosignedListings(
                    buyer, 
                    nativePaymentAmount, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    PaymentProcessor__FailedToTransferProceeds.selector);
            }
        } else {
            _bulkBuySignedListings(
                buyer, 
                nativePaymentAmount, 
                fuzzedOrderInputsArray, 
                saleDetailsArray, 
                PaymentProcessor__FailedToTransferProceeds.selector);
        }

        /*
        _verifyExpectedTradeStateChanges(
            buyer, 
            saleDetailsArray[0],
            saleDetailsArray[1],
            fuzzedOrderInputsArray[0],
            fuzzedOrderInputsArray[1]);
        */
    }

    function _runTestBulkBuyListingsWithFeesOnTopInsufficientGasLimit(
        bool cosigned,
        bool isCosignatureEmpty,
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop1,
        FuzzedFeeOnTop memory fuzzedFeeOnTop2
    ) internal {
        vm.assume(params1.fuzzedOrderInputs.tokenId != params2.fuzzedOrderInputs.tokenId);

        (
            address buyer,
            uint256[] memory paymentAmountsArray,
            FuzzedOrder721[] memory fuzzedOrderInputsArray,
            Order[] memory saleDetailsArray, 
            FeeOnTop[] memory feesOnTop
        ) = _getBulkBuyListingsInputsWithFeesOnTop(params1, params2, fuzzedFeeOnTop1, fuzzedFeeOnTop2);

        uint256 nativePaymentAmount = 0;
        uint256 nonNativePaymentAmount = 0;
        uint256 nativeFeeOnTop = 0;
        uint256 nonNativeFeeOnTop = 0;

        for (uint256 i = 0; i < paymentAmountsArray.length; i++) {
            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentAmount += paymentAmountsArray[i];
                nativeFeeOnTop += feesOnTop[i].amount;
            } else {
                nonNativePaymentAmount += saleDetailsArray[i].itemPrice;
                nonNativeFeeOnTop += feesOnTop[i].amount;
            }

            vm.assume(saleDetailsArray[i].itemPrice / saleDetailsArray[i].amount > 1000000);
            vm.assume(saleDetailsArray[i].itemPrice >= feesOnTop[i].amount);
        }

        if (nonNativePaymentAmount > 0) {
            weth.mint(buyer, nonNativePaymentAmount + nonNativeFeeOnTop);
            vm.prank(buyer);
            weth.approve(address(_paymentProcessor), nonNativePaymentAmount + nonNativeFeeOnTop);
        }

        vm.deal(buyer, nativePaymentAmount + nativeFeeOnTop);

        if (cosigned) {
            if (isCosignatureEmpty) {
                _bulkBuyEmptyCosignedListingsWithFeesOnTop(
                    buyer, 
                    nativePaymentAmount, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop,
                    PaymentProcessor__FailedToTransferProceeds.selector);
            } else {
                _bulkBuyCosignedListingsWithFeesOnTop(
                    buyer, 
                    nativePaymentAmount, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop,
                    PaymentProcessor__FailedToTransferProceeds.selector);
            }
        } else {
            _bulkBuySignedListingsWithFeeOnTop(
                buyer, 
                nativePaymentAmount, 
                fuzzedOrderInputsArray, 
                saleDetailsArray, 
                feesOnTop,
                PaymentProcessor__FailedToTransferProceeds.selector);
        }

        /*
        _verifyExpectedTradeStateChanges(
            buyer, 
            saleDetailsArray[0],
            saleDetailsArray[1],
            fuzzedOrderInputsArray[0],
            fuzzedOrderInputsArray[1],
            feesOnTop[0],
            feesOnTop[1]);
        */
    }

    function testBulkBuyListingsStandardNoFeeOnTopRevertsWhenGasLimitIsNotOverriddenGasGuzzler(
        uint8 paymentSettings, 
        uint8 orderProtocol1,
        uint8 orderProtocol2,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1, 
        uint248 fillAmount1,
        uint248 amount2, 
        uint248 fillAmount2
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

        address paymentMethod1 = address(0);
        address paymentMethod2 = address(0);

        orderProtocol1 = orderProtocol1 % 3;
        if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            fillAmount1 = 1;
        } else if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount1 = amount1;
            fillAmount1 = amount1;
        }

        orderProtocol2 = orderProtocol2 % 3;
        if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount2 = 1;
            fillAmount2 = 1;
        } else if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount2 = amount1;
            fillAmount2 = amount1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol1), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestBulkBuyListingsInsufficientGasLimit(false, false, params1, params2);
    }

    struct FuzzedOrderAndFee {
        FuzzedOrder721 fuzzedOrderInputs;
        FuzzedFeeOnTop fuzzedFeeOnTop;
    }

    function testBulkBuyListingsStandardFeesOnTopRevertsWhenGasLimitIsNotOverriddenGasGuzzler(
        uint8 paymentSettings, 
        uint8 orderProtocol1,
        uint8 orderProtocol2,
        FuzzedOrderAndFee memory fuzzedOrderAndFee1, 
        FuzzedOrderAndFee memory fuzzedOrderAndFee2, 
        uint248 amount1,
        uint248 fillAmount1,
       uint248 amount2, 
        uint248 fillAmount2
    ) public {
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice < type(uint96).max);

        fuzzedOrderAndFee2.fuzzedOrderInputs.buyerKey = fuzzedOrderAndFee1.fuzzedOrderInputs.buyerKey;
        fuzzedOrderAndFee2.fuzzedOrderInputs.buyerIsContract = fuzzedOrderAndFee1.fuzzedOrderInputs.buyerIsContract;

        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.buyerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.buyerKey != 0);
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.sellerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.sellerKey != 0);
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.cosignerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.cosignerKey != 0);
        fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice = uint128(bound(fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice, 10000, type(uint64).max));
        fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice = uint128(bound(fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice, 10000, type(uint64).max));
        vm.assume(amount1 > 0 && fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice / amount1 > 10000);
        vm.assume(amount2 > 0 && fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice / amount2 > 10000);

        address paymentMethod1 = address(0);
        address paymentMethod2 = address(0);

        orderProtocol1 = orderProtocol1 % 3;
        if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            fillAmount1 = 1;
        } else if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount1 = amount1;
            fillAmount1 = amount1;
        }

        orderProtocol2 = orderProtocol2 % 3;
        if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount2 = 1;
            fillAmount2 = 1;
        } else if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount2 = amount1;
            fillAmount2 = amount1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol1), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderAndFee1.fuzzedOrderInputs
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderAndFee2.fuzzedOrderInputs
                });
                
        _runTestBulkBuyListingsWithFeesOnTopInsufficientGasLimit(false, false, params1, params2, fuzzedOrderAndFee1.fuzzedFeeOnTop, fuzzedOrderAndFee2.fuzzedFeeOnTop);
    }

    function testBulkBuyListingsStandardNoFeeOnTopCosignedRevertsWhenGasLimitIsNotOverriddenGasGuzzler(
        uint8 paymentSettings, 
        uint8 orderProtocol1,
        uint8 orderProtocol2,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1, 
        uint248 fillAmount1,
        uint248 amount2, 
        uint248 fillAmount2
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
        fuzzedOrderInputs1.itemPrice = uint128(bound(fuzzedOrderInputs1.itemPrice, 10000, type(uint64).max));
        fuzzedOrderInputs2.itemPrice = uint128(bound(fuzzedOrderInputs2.itemPrice, 10000, type(uint64).max));
        vm.assume(amount1 > 0 && fuzzedOrderInputs1.itemPrice / amount1 > 10000);
        vm.assume(amount2 > 0 && fuzzedOrderInputs2.itemPrice / amount2 > 10000);

        address paymentMethod1 = address(0);
        address paymentMethod2 = address(0);

        orderProtocol1 = orderProtocol1 % 3;
        if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            fillAmount1 = 1;
        } else if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount1 = amount1;
            fillAmount1 = amount1;
        }

        orderProtocol2 = orderProtocol2 % 3;
        if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount2 = 1;
            fillAmount2 = 1;
        } else if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount2 = amount1;
            fillAmount2 = amount1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol1), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestBulkBuyListingsInsufficientGasLimit(true, false, params1, params2);
    }

    function testBulkBuyListingsStandardFeesOnTopCosignedRevertsWhenGasLimitIsNotOverriddenGasGuzzler(
        uint8 paymentSettings, 
        uint8 orderProtocol1,
        uint8 orderProtocol2,
        FuzzedOrderAndFee memory fuzzedOrderAndFee1, 
        FuzzedOrderAndFee memory fuzzedOrderAndFee2, 
        uint248 amount1,
        uint248 fillAmount1,
       uint248 amount2, 
        uint248 fillAmount2
    ) public {
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice < type(uint96).max);

        fuzzedOrderAndFee2.fuzzedOrderInputs.buyerKey = fuzzedOrderAndFee1.fuzzedOrderInputs.buyerKey;
        fuzzedOrderAndFee2.fuzzedOrderInputs.buyerIsContract = fuzzedOrderAndFee1.fuzzedOrderInputs.buyerIsContract;

        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.buyerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.buyerKey != 0);
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.sellerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.sellerKey != 0);
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.cosignerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.cosignerKey != 0);
        fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice = uint128(bound(fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice, 10000, type(uint64).max));
        fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice = uint128(bound(fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice, 10000, type(uint64).max));
        vm.assume(amount1 > 0 && fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice / amount1 > 10000);
        vm.assume(amount2 > 0 && fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice / amount2 > 10000);


        address paymentMethod1 = address(0);
        address paymentMethod2 = address(0);

        orderProtocol1 = orderProtocol1 % 3;
        if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            fillAmount1 = 1;
        } else if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount1 = amount1;
            fillAmount1 = amount1;
        }

        orderProtocol2 = orderProtocol2 % 3;
        if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount2 = 1;
            fillAmount2 = 1;
        } else if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount2 = amount1;
            fillAmount2 = amount1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol1), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderAndFee1.fuzzedOrderInputs
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderAndFee2.fuzzedOrderInputs
                });
                
        _runTestBulkBuyListingsWithFeesOnTopInsufficientGasLimit(true, false, params1, params2, fuzzedOrderAndFee1.fuzzedFeeOnTop, fuzzedOrderAndFee2.fuzzedFeeOnTop);
    }

    function testBulkBuyListingsStandardNoFeeOnTopEmptyCosignedRevertsWhenGasLimitIsNotOverriddenGasGuzzler(
        uint8 paymentSettings, 
        uint8 orderProtocol1,
        uint8 orderProtocol2,
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2, 
        uint248 amount1, 
        uint248 fillAmount1,
        uint248 amount2, 
        uint248 fillAmount2
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
        fuzzedOrderInputs1.itemPrice = uint128(bound(fuzzedOrderInputs1.itemPrice, 10000, type(uint64).max));
        fuzzedOrderInputs2.itemPrice = uint128(bound(fuzzedOrderInputs2.itemPrice, 10000, type(uint64).max));
        vm.assume(amount1 > 0 && fuzzedOrderInputs1.itemPrice / amount1 > 10000);
        vm.assume(amount2 > 0 && fuzzedOrderInputs2.itemPrice / amount2 > 10000);

        address paymentMethod1 = address(0);
        address paymentMethod2 = address(0); 

        orderProtocol1 = orderProtocol1 % 3;
        if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            fillAmount1 = 1;
        } else if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount1 = amount1;
            fillAmount1 = amount1;
        }

        orderProtocol2 = orderProtocol2 % 3;
        if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount2 = 1;
            fillAmount2 = 1;
        } else if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount2 = amount1;
            fillAmount2 = amount1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol1), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestBulkBuyListingsInsufficientGasLimit(true, true, params1, params2);
    }

    function testBulkBuyListingsStandardFeesOnTopEmptyCosignedRevertsWhenGasLimitIsNotOverriddenGasGuzzler(
        uint8 paymentSettings, 
        uint8 orderProtocol1,
        uint8 orderProtocol2,
        FuzzedOrderAndFee memory fuzzedOrderAndFee1, 
        FuzzedOrderAndFee memory fuzzedOrderAndFee2, 
        uint248 amount1,
        uint248 fillAmount1,
       uint248 amount2, 
        uint248 fillAmount2
    ) public {
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice < type(uint96).max);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice < type(uint96).max);

        fuzzedOrderAndFee2.fuzzedOrderInputs.buyerKey = fuzzedOrderAndFee1.fuzzedOrderInputs.buyerKey;
        fuzzedOrderAndFee2.fuzzedOrderInputs.buyerIsContract = fuzzedOrderAndFee1.fuzzedOrderInputs.buyerIsContract;

        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.buyerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.buyerKey != 0);
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.sellerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.sellerKey != 0);
        vm.assume(fuzzedOrderAndFee1.fuzzedOrderInputs.cosignerKey != 0);
        vm.assume(fuzzedOrderAndFee2.fuzzedOrderInputs.cosignerKey != 0);
        fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice = uint128(bound(fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice, 10000, type(uint64).max));
        fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice = uint128(bound(fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice, 10000, type(uint64).max));
        vm.assume(amount1 > 0 && fuzzedOrderAndFee1.fuzzedOrderInputs.itemPrice / amount1 > 10000);
        vm.assume(amount2 > 0 && fuzzedOrderAndFee2.fuzzedOrderInputs.itemPrice / amount2 > 10000);

        address paymentMethod1 = address(0);
        address paymentMethod2 = address(0);

        orderProtocol1 = orderProtocol1 % 3;
        if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount1 = 1;
            fillAmount1 = 1;
        } else if (OrderProtocols(orderProtocol1) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount1 = amount1;
            fillAmount1 = amount1;
        }

        orderProtocol2 = orderProtocol2 % 3;
        if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount2 = 1;
            fillAmount2 = 1;
        } else if (OrderProtocols(orderProtocol2) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            amount2 = amount1;
            fillAmount2 = amount1;
        }

        TestTradeSingleItemParams memory params1 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol1), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderAndFee1.fuzzedOrderInputs
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: false,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderAndFee2.fuzzedOrderInputs
                });
                
        _runTestBulkBuyListingsWithFeesOnTopInsufficientGasLimit(true, true, params1, params2, fuzzedOrderAndFee1.fuzzedFeeOnTop, fuzzedOrderAndFee2.fuzzedFeeOnTop);
    }
}