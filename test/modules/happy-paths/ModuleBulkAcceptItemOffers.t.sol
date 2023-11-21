pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../CPortModule.t.sol";

contract ModuleBulkAcceptItemOffersTest is cPortModuleTest {
    struct FuzzedOrderAndFee {
        FuzzedOrder721 fuzzedOrderInputs;
        FuzzedFeeOnTop fuzzedFeeOnTop;
    }

    function _getBulkAcceptItemOffersInput(
        address seller, 
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

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);
        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        saleDetails = Order({
            protocol: params.orderProtocol,
            maker: buyer,
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: params.paymentMethod,
            tokenAddress: token,
            tokenId: fuzzedOrderInputs.tokenId,
            amount: params.amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(buyer),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        paymentAmount = saleDetails.itemPrice;

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test1155.setApprovalForAll(address(_cPort), true);

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

    function _getBulkAcceptItemOffersInputWithFeeOnTop(
        address seller, 
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
        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        saleDetails = Order({
            protocol: params.orderProtocol,
            maker: buyer,
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: params.paymentMethod,
            tokenAddress: token,
            tokenId: fuzzedOrderInputs.tokenId,
            amount: params.amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(buyer),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
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
            test721.mint(seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test1155.setApprovalForAll(address(_cPort), true);

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

    function _getBulkAcceptItemOffersInputs(
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2
    ) private returns (
        address seller,
        uint256[] memory paymentAmountsArray,
        FuzzedOrder721[] memory fuzzedOrderInputsArray,
        Order[] memory saleDetailsArray, 
        FeeOnTop[] memory feesOnTop
    ) {
        seller = vm.addr(params1.fuzzedOrderInputs.sellerKey);

        paymentAmountsArray = new uint256[](2);
        fuzzedOrderInputsArray = new FuzzedOrder721[](2); 
        saleDetailsArray = new Order[](2);
        feesOnTop = new FeeOnTop[](2);

        (paymentAmountsArray[0], fuzzedOrderInputsArray[0], saleDetailsArray[0], feesOnTop[0]) = _getBulkAcceptItemOffersInput(seller, params1);
        (paymentAmountsArray[1], fuzzedOrderInputsArray[1], saleDetailsArray[1], feesOnTop[1]) = _getBulkAcceptItemOffersInput(seller, params2);
    }

    function _getBulkAcceptItemOffersInputsWithFeesOnTop(
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop1,
        FuzzedFeeOnTop memory fuzzedFeeOnTop2
    ) private returns (
        address seller,
        uint256[] memory paymentAmountsArray,
        FuzzedOrder721[] memory fuzzedOrderInputsArray,
        Order[] memory saleDetailsArray, 
        FeeOnTop[] memory feesOnTop
    ) {
        seller = vm.addr(params1.fuzzedOrderInputs.sellerKey);

        paymentAmountsArray = new uint256[](2);
        fuzzedOrderInputsArray = new FuzzedOrder721[](2); 
        saleDetailsArray = new Order[](2);
        feesOnTop = new FeeOnTop[](2);

        (paymentAmountsArray[0], fuzzedOrderInputsArray[0], saleDetailsArray[0], feesOnTop[0]) = _getBulkAcceptItemOffersInputWithFeeOnTop(seller, params1, fuzzedFeeOnTop1);
        (paymentAmountsArray[1], fuzzedOrderInputsArray[1], saleDetailsArray[1], feesOnTop[1]) = _getBulkAcceptItemOffersInputWithFeeOnTop(seller, params2, fuzzedFeeOnTop2);
    }

    function _runTestBulkAcceptItemOffers(
        bool cosigned,
        bool isCosignatureEmpty,
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2
    ) internal {
        vm.assume(params1.fuzzedOrderInputs.tokenId != params2.fuzzedOrderInputs.tokenId);

        (
            address seller,
            uint256[] memory paymentAmountsArray,
            FuzzedOrder721[] memory fuzzedOrderInputsArray,
            Order[] memory saleDetailsArray, 
            FeeOnTop[] memory feesOnTop
        ) = _getBulkAcceptItemOffersInputs(params1, params2);

        if (saleDetailsArray[0].maker == saleDetailsArray[1].maker) {
            weth.mint(saleDetailsArray[0].maker, saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice);
            vm.prank(saleDetailsArray[0].maker);
            weth.approve(address(_cPort), saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice);
        } else {
            for (uint256 i = 0; i < paymentAmountsArray.length; i++) {
                weth.mint(saleDetailsArray[i].maker, saleDetailsArray[i].itemPrice);
                vm.prank(saleDetailsArray[i].maker);
                weth.approve(address(_cPort), saleDetailsArray[i].itemPrice);
            }
        }

        if (cosigned) {
            if (isCosignatureEmpty) {
                _bulkAcceptEmptyCosignedItemOffers(
                    seller, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            } else {
                _bulkAcceptCosignedItemOffers(
                    seller, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    EMPTY_SELECTOR);
            }
        } else {
            _bulkAcceptSignedItemOffers(
                seller, 
                fuzzedOrderInputsArray, 
                saleDetailsArray, 
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(
            saleDetailsArray[0],
            saleDetailsArray[1],
            fuzzedOrderInputsArray[0],
            fuzzedOrderInputsArray[1]);
    }

    function _runTestBulkAcceptItemOffersWithFeesOnTop(
        bool cosigned,
        bool isCosignatureEmpty,
        TestTradeSingleItemParams memory params1,
        TestTradeSingleItemParams memory params2,
        FuzzedFeeOnTop memory fuzzedFeeOnTop1,
        FuzzedFeeOnTop memory fuzzedFeeOnTop2
    ) internal {
        vm.assume(params1.fuzzedOrderInputs.tokenId != params2.fuzzedOrderInputs.tokenId);

        (
            address seller,
            uint256[] memory paymentAmountsArray,
            FuzzedOrder721[] memory fuzzedOrderInputsArray,
            Order[] memory saleDetailsArray, 
            FeeOnTop[] memory feesOnTop
        ) = _getBulkAcceptItemOffersInputsWithFeesOnTop(params1, params2, fuzzedFeeOnTop1, fuzzedFeeOnTop2);

        if (saleDetailsArray[0].maker == saleDetailsArray[1].maker) {
            weth.mint(saleDetailsArray[0].maker, saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice);
            vm.prank(saleDetailsArray[0].maker);
            weth.approve(address(_cPort), saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice);
        } else {
            for (uint256 i = 0; i < paymentAmountsArray.length; i++) {
                weth.mint(saleDetailsArray[i].maker, saleDetailsArray[i].itemPrice);
                vm.prank(saleDetailsArray[i].maker);
                weth.approve(address(_cPort), saleDetailsArray[i].itemPrice);
            }
        }

        weth.mint(seller, feesOnTop[0].amount + feesOnTop[1].amount);
        vm.prank(seller);
        weth.approve(address(_cPort), feesOnTop[0].amount + feesOnTop[1].amount);


        if (cosigned) {
            if (isCosignatureEmpty) {
                _bulkAcceptEmptyCosignedItemOffersWithFeesOnTop(
                    seller, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop,
                    EMPTY_SELECTOR);
            } else {
                _bulkAcceptCosignedItemOffersWithFeesOnTop(
                    seller, 
                    fuzzedOrderInputsArray, 
                    saleDetailsArray, 
                    feesOnTop,
                    EMPTY_SELECTOR);
            }
        } else {
            _bulkAcceptSignedItemOffersWithFeesOnTop(
                seller, 
                fuzzedOrderInputsArray, 
                saleDetailsArray, 
                feesOnTop,
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(
            saleDetailsArray[0],
            saleDetailsArray[1],
            fuzzedOrderInputsArray[0],
            fuzzedOrderInputsArray[1],
            feesOnTop[0],
            feesOnTop[1]);
    }

    function testBulkAcceptItemOffersStandardNoFeeOnTop(
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

        fuzzedOrderInputs2.sellerKey = fuzzedOrderInputs1.sellerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod1 = address(weth);
        address paymentMethod2 = address(weth);

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
                
        _runTestBulkAcceptItemOffers(false, false, params1, params2);
    }

    function testBulkAcceptItemOffersStandardFeesOnTop(
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

        address paymentMethod1 = address(weth);
        address paymentMethod2 = address(weth);

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
                
        _runTestBulkAcceptItemOffersWithFeesOnTop(false, false, params1, params2, fuzzedOrderAndFee1.fuzzedFeeOnTop, fuzzedOrderAndFee2.fuzzedFeeOnTop);
    }

        function testBulkAcceptItemOffersStandardNoFeeOnTopCosigned(
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

        fuzzedOrderInputs2.sellerKey = fuzzedOrderInputs1.sellerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod1 = address(weth);
        address paymentMethod2 = address(weth);

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
                    cosigned: true,
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
                    cosigned: true,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestBulkAcceptItemOffers(true, false, params1, params2);
    }

    function testBulkAcceptItemOffersStandardFeesOnTopCosigned(
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

        address paymentMethod1 = address(weth);
        address paymentMethod2 = address(weth);

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
                    cosigned: true,
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
                    cosigned: true,
                    isCosignatureEmpty: false,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderAndFee2.fuzzedOrderInputs
                });
                
        _runTestBulkAcceptItemOffersWithFeesOnTop(true, false, params1, params2, fuzzedOrderAndFee1.fuzzedFeeOnTop, fuzzedOrderAndFee2.fuzzedFeeOnTop);
    }

        function testBulkAcceptItemOffersStandardNoFeeOnTopEmptyCosigned(
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

        fuzzedOrderInputs2.sellerKey = fuzzedOrderInputs1.sellerKey;
        fuzzedOrderInputs2.buyerIsContract = fuzzedOrderInputs1.buyerIsContract;

        vm.assume(fuzzedOrderInputs1.buyerKey != 0);
        vm.assume(fuzzedOrderInputs2.buyerKey != 0);
        vm.assume(fuzzedOrderInputs1.sellerKey != 0);
        vm.assume(fuzzedOrderInputs2.sellerKey != 0);
        vm.assume(fuzzedOrderInputs1.cosignerKey != 0);
        vm.assume(fuzzedOrderInputs2.cosignerKey != 0);

        address paymentMethod1 = address(weth);
        address paymentMethod2 = address(weth);

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
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderInputs1
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderInputs2
                });
                
        _runTestBulkAcceptItemOffers(true, true, params1, params2);
    }

    function testBulkAcceptItemOffersStandardFeesOnTopEmptyCosigned(
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

        address paymentMethod1 = address(weth);
        address paymentMethod2 = address(weth);

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
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod1,
                    amount: amount1, 
                    fillAmount: fillAmount1, 
                    fuzzedOrderInputs: fuzzedOrderAndFee1.fuzzedOrderInputs
                });

        TestTradeSingleItemParams memory params2 = 
            TestTradeSingleItemParams({
                    paymentSettings: paymentSettings,
                    orderProtocol: OrderProtocols(orderProtocol2), 
                    cosigned: true,
                    isCosignatureEmpty: true,
                    paymentMethod: paymentMethod2,
                    amount: amount2, 
                    fillAmount: fillAmount2, 
                    fuzzedOrderInputs: fuzzedOrderAndFee2.fuzzedOrderInputs
                });
                
        _runTestBulkAcceptItemOffersWithFeesOnTop(true, true, params1, params2, fuzzedOrderAndFee1.fuzzedFeeOnTop, fuzzedOrderAndFee2.fuzzedFeeOnTop);
    }
}