pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../CPortModule.t.sol";

contract ModuleForwardedBuyListingTest is cPortModuleTest {

    address channel;

    function setUp() public virtual override {
        super.setUp();

        channel = factory.cloneTrustedForwarder(address(this), address(0), bytes32(0));
    }

    function _runTestBuyListingViaUntrustedChannelFails(TestTradeSingleItemParams memory params) internal {
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
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(saleDetails.maker);
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

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, uint128(saleDetails.itemPrice));
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
            true);

        address trustedChannel = factory.cloneTrustedForwarder(address(this), address(0), bytes32(0x0000000000000000000000000000000000000000000000000000000000000001));
        address untrustedChannel = factory.cloneTrustedForwarder(address(this), address(0), bytes32(0x0000000000000000000000000000000000000000000000000000000000000002));

        _cPort.addTrustedChannelForCollection(_cPortEncoder.encodeAddTrustedChannelForCollectionCalldata(address(_cPort), token, trustedChannel));

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    untrustedChannel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    cPort__TradeOriginatedFromUntrustedChannel.selector);
            } else {
                _buyCosignedListing(
                    untrustedChannel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    cPort__TradeOriginatedFromUntrustedChannel.selector);
            }
            
        } else {
            _buySignedListing(
                untrustedChannel,
                buyer,
                uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                fuzzedOrderInputs,
                saleDetails, 
                cPort__TradeOriginatedFromUntrustedChannel.selector);
        }
    }

    function _runTestBuyListingViaTrustedChannelSucceeds(TestTradeSingleItemParams memory params) internal {
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
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(saleDetails.maker);
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

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, uint128(saleDetails.itemPrice));
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
            true);

        address trustedChannel = factory.cloneTrustedForwarder(address(this), address(0), bytes32(0x0000000000000000000000000000000000000000000000000000000000000001));
        address untrustedChannel = factory.cloneTrustedForwarder(address(this), address(0), bytes32(0x0000000000000000000000000000000000000000000000000000000000000002));

        _cPort.addTrustedChannelForCollection(_cPortEncoder.encodeAddTrustedChannelForCollectionCalldata(address(_cPort), token, trustedChannel));

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    trustedChannel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListing(
                    trustedChannel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
            
        } else {
            _buySignedListing(
                trustedChannel,
                buyer,
                uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                fuzzedOrderInputs,
                saleDetails, 
                EMPTY_SELECTOR);
        }
    }

    function _runTestBuyListing(TestTradeSingleItemParams memory params) internal {
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
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(saleDetails.maker);
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

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, uint128(saleDetails.itemPrice));
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
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListing(
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
            
        } else {
            _buySignedListing(
                channel,
                buyer,
                uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                fuzzedOrderInputs,
                saleDetails, 
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function _runTestBuyListingWithFeeOnTop(TestTradeSingleItemParams memory params, FuzzedFeeOnTop memory fuzzedFeeOnTop) internal {
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
            test721.setApprovalForAll(address(_cPort), true);
        } else {
            test1155.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(saleDetails.maker);
            test1155.setApprovalForAll(address(_cPort), true);

            if (params.orderProtocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
                vm.assume(params.amount > 0);
                vm.assume(params.fillAmount > 0);
                vm.assume(params.fillAmount < params.amount);
                vm.assume(fuzzedOrderInputs.itemPrice > params.amount);
                saleDetails.itemPrice = saleDetails.itemPrice - (saleDetails.itemPrice % saleDetails.amount);

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;

                feeOnTop = _getFeeOnTop(unitPrice * saleDetails.requestedFillAmount, fuzzedFeeOnTop);
            }
        }

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice + feeOnTop.amount));
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
                _buyEmptyCosignedListingWithFeeOnTop(
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    feeOnTop,
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListingWithFeeOnTop(
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    feeOnTop,
                    EMPTY_SELECTOR);
            }
            
        } else {
            _buySignedListingWithFeeOnTop(
                channel,
                buyer,
                uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                fuzzedOrderInputs,
                saleDetails, 
                feeOnTop,
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    function _runTestBuyListingBackfilledRoyalties(TestTradeSingleItemParams memory params) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721Without2981) : address(test1155Without2981);
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
            test721Without2981.mint(saleDetails.maker, saleDetails.tokenId);

            vm.prank(saleDetails.maker);
            test721Without2981.setApprovalForAll(address(_cPort), true);
        } else {
            test1155Without2981.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);

            vm.prank(saleDetails.maker);
            test1155Without2981.setApprovalForAll(address(_cPort), true);

            if (params.orderProtocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
                vm.assume(params.amount > 0);
                vm.assume(params.fillAmount > 0);
                vm.assume(params.fillAmount < params.amount);
                vm.assume(fuzzedOrderInputs.itemPrice > params.amount);

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;
            }
        }

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, uint128(saleDetails.itemPrice));
        } else {
            _allocateTokensAndApprovals(buyer, uint128(saleDetails.itemPrice));
        }

        _setPaymentSettings(
            params.paymentSettings,
            saleDetails.itemPrice,
            token,
            params.paymentMethod,
            uint16(fuzzedOrderInputs.royaltyFeeRate),
            fuzzedOrderInputs.royaltyReceiver,
            0,
            address(0),
            false);

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _buyEmptyCosignedListing(
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListing(
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
            
        } else {
            _buySignedListing(
                channel,
                buyer,
                uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                fuzzedOrderInputs,
                saleDetails, 
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function _runTestBuyListingOffchainFallbackRoyalties(TestTradeSingleItemParams memory params) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        vm.assume(params.amount > 0);

        address token = params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? address(test721Without2981) : address(test1155Without2981);
        address buyer = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: params.orderProtocol,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: fuzzedOrderInputs.royaltyReceiver,
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
            test721Without2981.mint(saleDetails.maker, saleDetails.tokenId);

            vm.prank(saleDetails.maker);
            test721Without2981.setApprovalForAll(address(_cPort), true);
        } else {
            test1155Without2981.mint(saleDetails.maker, saleDetails.tokenId, saleDetails.amount);

            vm.prank(saleDetails.maker);
            test1155Without2981.setApprovalForAll(address(_cPort), true);

            if (params.orderProtocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
                vm.assume(params.amount > 0);
                vm.assume(params.fillAmount > 0);
                vm.assume(params.fillAmount < params.amount);
                vm.assume(fuzzedOrderInputs.itemPrice > params.amount);

                paymentAmount = unitPrice * saleDetails.requestedFillAmount;
            }
        }

        if (params.paymentMethod == address(0)) {
            vm.deal(buyer, uint128(saleDetails.itemPrice));
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
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            } else {
                _buyCosignedListing(
                    channel,
                    buyer,
                    uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                    fuzzedOrderInputs,
                    saleDetails, 
                    EMPTY_SELECTOR);
            }
            
        } else {
            _buySignedListing(
                channel,
                buyer,
                uint128(params.paymentMethod == address(0) ? paymentAmount: 0),
                fuzzedOrderInputs,
                saleDetails, 
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    /***************************/
    /*       Standard ETH      */
    /***************************/

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_ETH_BackfilledRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListingBackfilledRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_ETH_BackfilledRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListingBackfilledRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_ETH_BackfilledRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingBackfilledRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_ETH_OffchainFallbackRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListingOffchainFallbackRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_ETH_OffchainFallbackRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListingOffchainFallbackRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_ETH_OffchainFallbackRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingOffchainFallbackRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************/
    /*      Standard WETH      */
    /***************************/

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_WETH_BackfilledRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListingBackfilledRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_WETH_BackfilledRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListingBackfilledRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_WETH_BackfilledRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingBackfilledRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_WETH_OffchainFallbackRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListingOffchainFallbackRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_WETH_OffchainFallbackRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListingOffchainFallbackRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_WETH_OffchainFallbackRoyalties(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingOffchainFallbackRoyalties(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /****************************/
    /* Standard ETH Fee On Top **/
    /****************************/

    function testForwardedBuyListing721FillOrKillStandardFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillOrKillStandardFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillPartialStandardFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    /****************************/
    /* Standard WETH Fee On Top */
    /****************************/

    function testForwardedBuyListing721FillOrKillStandardFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillOrKillStandardFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillPartialStandardFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    /***************************/
    /*       Cosigned ETH      */
    /***************************/

    function testForwardedBuyListing721FillOrKillCosignedNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillCosignedNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialCosignedNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************/
    /*      Cosigned WETH      */
    /***************************/

    function testForwardedBuyListing721FillOrKillCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************/
    /* Cosigned ETH Fee On Top */
    /***************************/

    function testForwardedBuyListing721FillOrKillCosignedFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillOrKillCosignedFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillPartialCosignedFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    /****************************/
    /* Cosigned WETH Fee On Top */
    /****************************/

    function testForwardedBuyListing721FillOrKillCosignedFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillOrKillCosignedFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    function testForwardedBuyListing1155FillPartialCosignedFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingWithFeeOnTop(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: true,
                isCosignatureEmpty: false,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }),
            fuzzedFeeOnTop);
    }

    /***************************/
    /*   Empty Cosigned ETH    */
    /***************************/

    function testForwardedBuyListing721FillOrKillEmptyCosignedNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: true,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillEmptyCosignedNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: true,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialEmptyCosignedNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: true,
                isCosignatureEmpty: true,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************/
    /*   Empty Cosigned WETH   */
    /***************************/

    function testForwardedBuyListing721FillOrKillEmptyCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: true,
                paymentMethod: address(weth),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillEmptyCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: true,
                isCosignatureEmpty: true,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialEmptyCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: true,
                isCosignatureEmpty: true,
                paymentMethod: address(weth),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************************************/
    /*      Fallback Default Payment Method Whitelist  */
    /***************************************************/

    function testForwardedBuyListing721FillOrKillStandardNoFeeOnTop_PostDeploymentDefaultPaymentMethod(
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(memecoin)));

        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: 0,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(memecoin),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillOrKillStandardNoFeeOnTop_PostDeploymentDefaultPaymentMethod(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(memecoin)));

        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: 0,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testForwardedBuyListing1155FillPartialStandardNoFeeOnTop_PostDeploymentDefaultPaymentMethod(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(memecoin)));

        _runTestBuyListing(
            TestTradeSingleItemParams({
                paymentSettings: 0,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(memecoin),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************************************/
    /*      Fails For Untrusted Channels               */
    /***************************************************/
    
    function testUntrustedForwarderFailsBuyListing721FillOrKillStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListingViaUntrustedChannelFails(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testUntrustedForwarderFailsBuyListing1155FillOrKillStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListingViaUntrustedChannelFails(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testUntrustedForwarderFailsBuyListing1155FillPartialStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingViaUntrustedChannelFails(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    /***************************************************/
    /*      Succeeds For Trusted Channels              */
    /***************************************************/

    function testTrustedForwarderSucceedsBuyListing721FillOrKillStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestBuyListingViaTrustedChannelSucceeds(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC721_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: 1, 
                fillAmount: 1, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testTrustedForwarderSucceedsBuyListing1155FillOrKillStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestBuyListingViaTrustedChannelSucceeds(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_OR_KILL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: amount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }

    function testTrustedForwarderSucceedsBuyListing1155FillPartialStandardNoFeeOnTop_ETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestBuyListingViaTrustedChannelSucceeds(
            TestTradeSingleItemParams({
                paymentSettings: paymentSettings,
                orderProtocol: OrderProtocols.ERC1155_FILL_PARTIAL, 
                cosigned: false,
                isCosignatureEmpty: false,
                paymentMethod: address(0),
                amount: amount, 
                fillAmount: fillAmount, 
                fuzzedOrderInputs: fuzzedOrderInputs
            }));
    }
}