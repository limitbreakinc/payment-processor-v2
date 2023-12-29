pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../PaymentProcessorModule.t.sol";
import {Merkle} from "murky/Merkle.sol";

contract DestroyCosignerTest is PaymentProcessorModuleTest {

    function _runTestBuyListingWhenCosignerIsDestroyed(TestTradeSingleItemParams memory params) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);
        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
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
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        uint256 paymentAmount = saleDetails.itemPrice;

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(saleDetails.maker, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(saleDetails.maker);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(saleDetails.maker);
            test1155.setApprovalForAll(address(_paymentProcessor), true);

            if (params.orderProtocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
                vm.assume(params.amount > 0);
                vm.assume(params.fillAmount > 0);
                vm.assume(params.fillAmount < params.amount);
                vm.assume(fuzzedOrderInputs.itemPrice > params.amount);
                fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - (fuzzedOrderInputs.itemPrice % uint128(params.amount));

                uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
                paymentAmount = unitPrice * saleDetails.requestedFillAmount;
            }
        }

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, paymentAmount);
        } else {
            _allocateTokensAndApprovals(buyer, paymentAmount);
        }

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            params.paymentMethod,
            0,
            address(0),
            0,
            address(0),
            false,
            false);

        vm.prank(vm.addr(fuzzedOrderInputs.cosignerKey));
        _paymentProcessor.destroyCosigner();

        _buyCosignedListing(
            buyer,
            params.paymentMethod == address(0) ? paymentAmount: 0,
            fuzzedOrderInputs,
            saleDetails, 
            PaymentProcessor__CosignerHasSelfDestructed.selector);
    }

    function _runTestAcceptCollectionOfferWhenCosignerIsDestroyed(TestTradeSingleItemParams memory params) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);
        address seller = vm.addr(fuzzedOrderInputs.sellerKey);
        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
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
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        uint256 paymentAmount = saleDetails.itemPrice;

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
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

        _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            params.paymentMethod,
            0,
            address(0),
            0,
            address(0),
            false,
            false);

        vm.prank(vm.addr(fuzzedOrderInputs.cosignerKey));
        _paymentProcessor.destroyCosigner();

        _acceptCosignedCollectionOffer(
            seller, 
            fuzzedOrderInputs, 
            saleDetails, 
            PaymentProcessor__CosignerHasSelfDestructed.selector);
    }

    function _runTestAcceptItemOfferWhenCosignerIsDestroyed(TestTradeSingleItemParams memory params) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);
        address seller = vm.addr(fuzzedOrderInputs.sellerKey);
        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
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
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        uint256 paymentAmount = saleDetails.itemPrice;

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
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

        _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            params.paymentMethod,
            0,
            address(0),
            0,
            address(0),
            false,
            false);

        vm.prank(vm.addr(fuzzedOrderInputs.cosignerKey));
        _paymentProcessor.destroyCosigner();

        _acceptCosignedItemOffer(
            seller, 
            fuzzedOrderInputs, 
            saleDetails, 
            PaymentProcessor__CosignerHasSelfDestructed.selector);
    }

    function _runTestAcceptTokenSetOfferWhenCosignerIsDestroyed(TestTradeSingleItemParams memory params) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721) : address(test1155);
        address seller = vm.addr(fuzzedOrderInputs.sellerKey);
        address buyer = vm.addr(fuzzedOrderInputs.buyerKey);

        vm.assume(fuzzedOrderInputs.tokenId > 0);

        uint256[] memory tokenSetIds = new uint256[](2);
        bytes32[] memory data = new bytes32[](2);

        tokenSetIds[0] = 0;
        data[0] = keccak256(abi.encode(token, 0));

        tokenSetIds[1] = fuzzedOrderInputs.tokenId;
        data[1] = keccak256(abi.encode(token, fuzzedOrderInputs.tokenId));

        Merkle merkle = new Merkle();

        Order memory saleDetails = Order({
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
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: params.fillAmount,
            minimumFillAmount: params.fillAmount
        });

        uint256 paymentAmount = saleDetails.itemPrice;

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
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

        _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            params.paymentMethod,
            0,
            address(0),
            0,
            address(0),
            false,
            false);

        vm.prank(vm.addr(fuzzedOrderInputs.cosignerKey));
        _paymentProcessor.destroyCosigner();

        _acceptCosignedTokenSetOffer(
            seller, 
            fuzzedOrderInputs, 
            saleDetails, 
            TokenSetProof({
                rootHash: merkle.getRoot(data),
                proof: merkle.getProof(data, 1)
            }),
            PaymentProcessor__CosignerHasSelfDestructed.selector);
    }

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
            test721.setApprovalForAll(address(_paymentProcessor), true);

            test721.mint(saleDetailsArray[1].maker, saleDetailsArray[1].tokenId);
            test721.setTokenRoyalty(saleDetailsArray[1].tokenId, params2.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[1].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[1].maker);
            test721.setApprovalForAll(address(_paymentProcessor), true);
        } else {
            test1155.mint(saleDetailsArray[0].maker, saleDetailsArray[0].tokenId, saleDetailsArray[0].amount);
            test1155.setTokenRoyalty(saleDetailsArray[0].tokenId, params1.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[0].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[0].maker);
            test1155.setApprovalForAll(address(_paymentProcessor), true);

            test1155.mint(saleDetailsArray[1].maker, saleDetailsArray[1].tokenId, saleDetailsArray[1].amount);
            test1155.setTokenRoyalty(saleDetailsArray[1].tokenId, params2.fuzzedOrderInputs.royaltyReceiver, uint96(saleDetailsArray[1].maxRoyaltyFeeNumerator));

            vm.prank(saleDetailsArray[1].maker);
            test1155.setApprovalForAll(address(_paymentProcessor), true);
        }

        if (sweepOrder.paymentMethod == address(0)) {
            vm.deal(buyer, saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice + feeOnTop.amount);
        } else {
            SeaportTestERC20(sweepOrder.paymentMethod).mint(buyer, saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice + feeOnTop.amount);
            vm.prank(buyer);
            SeaportTestERC20(sweepOrder.paymentMethod).approve(address(_paymentProcessor), saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice + feeOnTop.amount);
        }

        if (sweepOrder.paymentMethod == address(0)) {
            nativePaymentAmount = saleDetailsArray[0].itemPrice + saleDetailsArray[1].itemPrice;
        }
    }

    function _runTestSweepCollectionWhenCosignerIsDestroyed(
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

        vm.prank(vm.addr(params1.fuzzedOrderInputs.cosignerKey));
        _paymentProcessor.destroyCosigner();

        vm.prank(vm.addr(params2.fuzzedOrderInputs.cosignerKey));
        _paymentProcessor.destroyCosigner();

        _sweepCosignedListings(
            buyer, 
            nativePaymentAmount, 
            sweepOrder,
            fuzzedOrderInputsArray, 
            saleDetailsArray, 
            PaymentProcessor__CosignerHasSelfDestructed.selector);
    }

    function testRevertsBuyListingWhenCosignerIsDestroyed(
        uint256 msgValue,
        uint8 paymentSettings, 
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        orderProtocol = orderProtocol % 3;

        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount = 1;
            fillAmount = 1;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            fillAmount = amount;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_PARTIAL) {
            vm.assume(amount > 0);
            vm.assume(fillAmount > 0);
            vm.assume(fillAmount < amount);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);
            fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - (fuzzedOrderInputs.itemPrice % uint128(amount));

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice < 1 ether);
        }

        _runTestBuyListingWhenCosignerIsDestroyed(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsAcceptItemOfferWhenCosignerIsDestroyed(
        uint256 msgValue,
        uint8 paymentSettings, 
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        orderProtocol = orderProtocol % 3;

        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount = 1;
            fillAmount = 1;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            fillAmount = amount;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_PARTIAL) {
            vm.assume(amount > 0);
            vm.assume(fillAmount > 0);
            vm.assume(fillAmount < amount);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);
            fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - (fuzzedOrderInputs.itemPrice % uint128(amount));

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice < 1 ether);
        }

        _runTestAcceptItemOfferWhenCosignerIsDestroyed(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsAcceptCollectionOfferWhenCosignerIsDestroyed(
        uint256 msgValue,
        uint8 paymentSettings, 
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        orderProtocol = orderProtocol % 3;

        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount = 1;
            fillAmount = 1;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            fillAmount = amount;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_PARTIAL) {
            vm.assume(amount > 0);
            vm.assume(fillAmount > 0);
            vm.assume(fillAmount < amount);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);
            fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - (fuzzedOrderInputs.itemPrice % uint128(amount));

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice < 1 ether);
        }

        _runTestAcceptCollectionOfferWhenCosignerIsDestroyed(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsAcceptTokenSetOfferWhenCosignerIsDestroyed(
        uint256 msgValue,
        uint8 paymentSettings, 
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        orderProtocol = orderProtocol % 3;

        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount = 1;
            fillAmount = 1;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            fillAmount = amount;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_PARTIAL) {
            vm.assume(amount > 0);
            vm.assume(fillAmount > 0);
            vm.assume(fillAmount < amount);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);
            fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - (fuzzedOrderInputs.itemPrice % uint128(amount));

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice < 1 ether);
        }

        _runTestAcceptTokenSetOfferWhenCosignerIsDestroyed(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsSweepCollectionWhenCosignerIsDestroyed(
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
                
        _runTestSweepCollectionWhenCosignerIsDestroyed(false, false, params1, params2);
    }
}