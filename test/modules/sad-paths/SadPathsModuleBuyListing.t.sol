pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../PaymentProcessorModule.t.sol";

contract SadPathsModuleBuyListingTest is PaymentProcessorModuleTest {

    function _runTestBuyListingWithUnderpayment(uint256 msgValue, TestTradeSingleItemParams memory params) internal {
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

        vm.assume(msgValue < paymentAmount);

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, msgValue);
        } else {
            _allocateTokensAndApprovals(buyer, msgValue);
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
            false);

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            if (params.orderProtocol != OrderProtocols.ERC721_FILL_OR_KILL) {
                uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
                vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
            } else {
                vm.assume(saleDetails.itemPrice >= 1 ether && saleDetails.itemPrice <= 500 ether);
            }
        }

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    PaymentProcessor__RanOutOfNativeFunds.selector);
            } else {
                _buyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    PaymentProcessor__RanOutOfNativeFunds.selector);
            }
            
        } else {
            _buySignedListing(
                buyer,
                params.paymentMethod == address(0) ? msgValue: 0,
                fuzzedOrderInputs,
                saleDetails, 
                PaymentProcessor__RanOutOfNativeFunds.selector);
        }
    }

    function _runTestBuyListingWithFeeOnTopWithUnderpayment(uint256 msgValue, TestTradeSingleItemParams memory params, FuzzedFeeOnTop memory fuzzedFeeOnTop) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
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
        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

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

                feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);
            }
        }

        vm.assume(msgValue < paymentAmount);

        if (params.paymentMethod == address(0)) {
            vm.assume(msgValue < paymentAmount + feeOnTop.amount);
            vm.deal(buyer, msgValue + feeOnTop.amount);
        } else {
            _allocateTokensAndApprovals(buyer, saleDetails.itemPrice + feeOnTop.amount);
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
            false);

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            if (params.orderProtocol != OrderProtocols.ERC721_FILL_OR_KILL) {
                uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
                vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
            } else {
                vm.assume(saleDetails.itemPrice >= 1 ether && saleDetails.itemPrice <= 500 ether);
            }
        }

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListingWithFeeOnTop(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    feeOnTop,
                    PaymentProcessor__RanOutOfNativeFunds.selector);
            } else {
                _buyCosignedListingWithFeeOnTop(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    feeOnTop,
                    PaymentProcessor__RanOutOfNativeFunds.selector);
            }
            
        } else {
            _buySignedListingWithFeeOnTop(
                buyer,
                params.paymentMethod == address(0) ? msgValue: 0,
                fuzzedOrderInputs,
                saleDetails, 
                feeOnTop,
                PaymentProcessor__RanOutOfNativeFunds.selector);
        }
    }

    function _runTestBuyListingWithOverpayment(uint256 msgValue, TestTradeSingleItemParams memory params) internal {
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

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

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

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;
            }
        }

        vm.assume(msgValue > paymentAmount);

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, msgValue);
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));
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
            false);

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
        } else {
            _buySignedListing(
                buyer,
                params.paymentMethod == address(0) ? msgValue: 0,
                fuzzedOrderInputs,
                saleDetails, 
                EMPTY_SELECTOR);
        }

        if (params.paymentMethod == address(0)) {
            assertEq(nativeWrapper.balanceOf(buyer), msgValue - paymentAmount);
        }
    }

    function _runTestBuyListingWithFeeOnTopWithOverpayment(uint256 msgValue, TestTradeSingleItemParams memory params, FuzzedFeeOnTop memory fuzzedFeeOnTop) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
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
        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
        }

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

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;

                feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);
            }
        }

        if (params.paymentMethod == address(0)) {
            vm.assume(type(uint256).max - msgValue > paymentAmount + feeOnTop.amount);
            vm.assume(msgValue > paymentAmount + feeOnTop.amount);
            vm.deal(buyer, msgValue + feeOnTop.amount);
        } else {
            vm.assume(type(uint256).max - saleDetails.itemPrice > feeOnTop.amount);
            _allocateTokensAndApprovals(buyer, saleDetails.itemPrice + feeOnTop.amount);
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
            false);

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(saleDetails.itemPrice >= 1 ether && saleDetails.itemPrice <= 500 ether);
        }

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListingWithFeeOnTop(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    feeOnTop,
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListingWithFeeOnTop(
                    buyer,
                    params.paymentMethod == address(0) ? msgValue: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    feeOnTop,
                    EMPTY_SELECTOR);
            }
            
        } else {
            _buySignedListingWithFeeOnTop(
                buyer,
                params.paymentMethod == address(0) ? msgValue: 0,
                fuzzedOrderInputs,
                saleDetails, 
                feeOnTop,
                EMPTY_SELECTOR);
        }

        if (params.paymentMethod == address(0)) {
            //assertEq(nativeWrapper.balanceOf(buyer), msgValue - (paymentAmount + feeOnTop.amount));
            assertEq(nativeWrapper.balanceOf(buyer), msgValue - paymentAmount);
        }
    }

    function _runTestBuyExpiredListing(uint256 secondsInPast, TestTradeSingleItemParams memory params) internal {
        vm.assume(secondsInPast > 0);
        vm.assume(secondsInPast <= block.timestamp);

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
            expiration: block.timestamp - secondsInPast,
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
            vm.deal(buyer, saleDetails.itemPrice);
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));
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
            false);

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(saleDetails.itemPrice >= 1 ether && saleDetails.itemPrice <= 500 ether);
        }

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    PaymentProcessor__OrderHasExpired.selector);
            } else {
                _buyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    PaymentProcessor__OrderHasExpired.selector);
            }
            
        } else {
            _buySignedListing(
                buyer,
                params.paymentMethod == address(0) ? paymentAmount: 0,
                fuzzedOrderInputs,
                saleDetails, 
                PaymentProcessor__OrderHasExpired.selector);
        }
    }

    function _runTestBuyListingInvalidAmount(TestTradeSingleItemParams memory params) internal {
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
            vm.deal(buyer, saleDetails.itemPrice);
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));
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
            false);

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(saleDetails.itemPrice >= 1 ether && saleDetails.itemPrice <= 500 ether);
        }

        bytes4 errorSelector = saleDetails.protocol == OrderProtocols.ERC721_FILL_OR_KILL ? PaymentProcessor__AmountForERC721SalesMustEqualOne.selector : PaymentProcessor__AmountForERC1155SalesGreaterThanZero.selector;

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    errorSelector);
            } else {
                _buyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    errorSelector);
            }
            
        } else {
            _buySignedListing(
                buyer,
                params.paymentMethod == address(0) ? paymentAmount: 0,
                fuzzedOrderInputs,
                saleDetails, 
                errorSelector);
        }
    }

    function _runTestBuyListingBadPaymentMethod(address constrainedPricingPaymentMethod, TestTradeSingleItemParams memory params) internal {
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
            vm.deal(buyer, saleDetails.itemPrice);
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));
        }

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            constrainedPricingPaymentMethod,
            0,
            address(0),
            0,
            address(0),
            false);

        if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
            vm.assume(saleDetails.itemPrice >= 1 ether && saleDetails.itemPrice <= 500 ether);
        }

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod.selector);
            } else {
                _buyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod.selector);
            }
            
        } else {
            _buySignedListing(
                buyer,
                params.paymentMethod == address(0) ? paymentAmount: 0,
                fuzzedOrderInputs,
                saleDetails, 
                PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod.selector);
        }
    }

    function _runTestBuyListingViolatesPricingConstraints(address constrainedPricingPaymentMethod, TestTradeSingleItemParams memory params) internal {
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
            vm.deal(buyer, saleDetails.itemPrice);
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));
        }

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            constrainedPricingPaymentMethod,
            0,
            address(0),
            0,
            address(0),
            false);

        bytes4 errorSelector;
        if (saleDetails.itemPrice < 1 ether) {
            errorSelector = PaymentProcessor__SalePriceBelowMinimumFloor.selector;
        } else if (saleDetails.itemPrice > 500 ether) {
            errorSelector = PaymentProcessor__SalePriceAboveMaximumCeiling.selector;
        } else {
            errorSelector = EMPTY_SELECTOR;
        }

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    errorSelector);
            } else {
                _buyCosignedListing(
                    buyer,
                    params.paymentMethod == address(0) ? paymentAmount: 0,
                    fuzzedOrderInputs,
                    saleDetails, 
                    errorSelector);
            }
            
        } else {
            _buySignedListing(
                buyer,
                params.paymentMethod == address(0) ? paymentAmount: 0,
                fuzzedOrderInputs,
                saleDetails, 
                errorSelector);
        }
    }

    function testRevertsWhenNativePaymentIsInsufficient(
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

        _runTestBuyListingWithUnderpayment(
            msgValue,
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

    function testRevertsWhenNativePaymentIsInsufficientWithFeeOnTop(
        uint256 msgValue,
        uint8 paymentSettings, 
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
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

        _runTestBuyListingWithFeeOnTopWithUnderpayment(
            msgValue,
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testRevertsWhenNativePaymentIsOverpaid(
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

        _runTestBuyListingWithOverpayment(
            msgValue,
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

    function testRevertsWhenNativePaymentIsOverpaidWithFeeOnTop(
        uint256 msgValue,
        uint8 paymentSettings, 
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
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

        _runTestBuyListingWithFeeOnTopWithOverpayment(
            msgValue,
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testRevertsWhenOrderIsExpired(
        uint256 secondsInPast,
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

        _runTestBuyExpiredListing(
            secondsInPast,
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

    function testRevertsWhenAmountsAreInvalid(
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
            vm.assume(amount != 1);
            fillAmount = amount;
        } else {
            amount = 0;
            fillAmount = 0;
        }

        _runTestBuyListingInvalidAmount(
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

    function testRevertsWhenPaymentMethodNotInDefaultPaymentList(
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

        _runTestBuyListingBadPaymentMethod(
            address(weth),
            TestTradeSingleItemParams({
                paymentSettings: uint8(PaymentSettings.DefaultPaymentMethodWhitelist),
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsWhenPaymentMethodNotInCustomPaymentList(
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

        _runTestBuyListingBadPaymentMethod(
            address(weth),
            TestTradeSingleItemParams({
                paymentSettings: uint8(PaymentSettings.CustomPaymentMethodWhitelist),
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsWhenPaymentMethodNotConstrainedPaymentCoin(
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

        _runTestBuyListingBadPaymentMethod(
            address(weth),
            TestTradeSingleItemParams({
                paymentSettings: uint8(PaymentSettings.PricingConstraints),
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsWhenPriceIsBelowMinimumFloor(
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        vm.assume(fuzzedOrderInputs.itemPrice < 1 ether);

        orderProtocol = orderProtocol % 3;

        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount = 1;
            fillAmount = 1;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            vm.assume(amount > 0);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice < 1 ether);

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

        _runTestBuyListingViolatesPricingConstraints(
            address(memecoin),
            TestTradeSingleItemParams({
                paymentSettings: uint8(PaymentSettings.PricingConstraints),
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testRevertsWhenPriceIsAboveMaximumCeiling(
        uint8 orderProtocol,
        bool isCosigned,
        bool isCosignatureEmpty,
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        vm.assume(fuzzedOrderInputs.itemPrice > 500 ether);
        
        orderProtocol = orderProtocol % 3;

        if (OrderProtocols(orderProtocol) == OrderProtocols.ERC721_FILL_OR_KILL) {
            amount = 1;
            fillAmount = 1;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_OR_KILL) {
            vm.assume(amount > 0);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice > 500 ether);

            fillAmount = amount;
        } else if (OrderProtocols(orderProtocol) == OrderProtocols.ERC1155_FILL_PARTIAL) {
            vm.assume(amount > 0);
            vm.assume(fillAmount > 0);
            vm.assume(fillAmount < amount);
            vm.assume(fuzzedOrderInputs.itemPrice > amount);
            fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - (fuzzedOrderInputs.itemPrice % uint128(amount));

            uint256 unitPrice = fuzzedOrderInputs.itemPrice / amount;
            vm.assume(unitPrice > 500 ether);
        }

        _runTestBuyListingViolatesPricingConstraints(
            address(memecoin),
            TestTradeSingleItemParams({
                paymentSettings: uint8(PaymentSettings.PricingConstraints),
                orderProtocol: OrderProtocols(orderProtocol), 
                cosigned: isCosigned,
                isCosignatureEmpty: isCosignatureEmpty,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }
}