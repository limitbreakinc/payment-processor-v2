pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../CPortModule.t.sol";
import {Merkle} from "murky/Merkle.sol";

contract ModuleAcceptTokenSetOfferTest is cPortModuleTest {

    function _runTestAcceptOffer(TestTradeSingleItemParams memory params) internal {
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
            false);

        if (params.cosigned) {
            if (params.isCosignatureEmpty) {
                _acceptEmptyCosignedTokenSetOffer(
                    seller, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    TokenSetProof({
                        rootHash: merkle.getRoot(data),
                        proof: merkle.getProof(data, 1)
                    }),
                    EMPTY_SELECTOR);
            } else {
                _acceptCosignedTokenSetOffer(
                    seller, 
                    fuzzedOrderInputs, 
                    saleDetails, 
                    TokenSetProof({
                        rootHash: merkle.getRoot(data),
                        proof: merkle.getProof(data, 1)
                    }),
                    EMPTY_SELECTOR);
            }
            
        } else {
            _acceptSignedTokenSetOffer(
                seller, 
                fuzzedOrderInputs, 
                saleDetails, 
                TokenSetProof({
                    rootHash: merkle.getRoot(data),
                    proof: merkle.getProof(data, 1)
                }),
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs);
    }

    function _runTestAcceptOfferWithFeeOnTop(TestTradeSingleItemParams memory params, FuzzedFeeOnTop memory fuzzedFeeOnTop) internal {
        FuzzedOrder721 memory fuzzedOrderInputs = params.fuzzedOrderInputs;
        _scrubFuzzedOrderInputs(fuzzedOrderInputs, fuzzedFeeOnTop);
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
        FeeOnTop memory feeOnTop = _getFeeOnTop(fuzzedOrderInputs.itemPrice, fuzzedFeeOnTop);

        if (params.orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            test721.mint(seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test721.setApprovalForAll(address(_paymentProcessor), true);

            uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
            if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
                vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
            }
        } else {
            test1155.mint(seller, saleDetails.tokenId, saleDetails.amount);
            test1155.setTokenRoyalty(saleDetails.tokenId, fuzzedOrderInputs.royaltyReceiver, uint96(saleDetails.maxRoyaltyFeeNumerator));

            vm.prank(seller);
            test1155.setApprovalForAll(address(_paymentProcessor), true);

            uint256 unitPrice = saleDetails.itemPrice / saleDetails.amount;
            if (params.paymentSettings % 4 == uint8(PaymentSettings.PricingConstraints)) {
                vm.assume(unitPrice >= 1 ether && unitPrice <= 500 ether);
            }

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

        _allocateTokensAndApprovals(buyer, fuzzedOrderInputs.itemPrice);
        _allocateTokensAndApprovals(seller, uint128(feeOnTop.amount));

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
                _acceptEmptyCosignedTokenSetOfferWithFeeOnTop(
                    seller,
                    fuzzedOrderInputs,
                    saleDetails, 
                    TokenSetProof({
                        rootHash: merkle.getRoot(data),
                        proof: merkle.getProof(data, 1)
                    }),
                    feeOnTop,
                    EMPTY_SELECTOR);
            } else {
                _acceptCosignedTokenSetOfferWithFeeOnTop(
                    seller,
                    fuzzedOrderInputs,
                    saleDetails, 
                    TokenSetProof({
                        rootHash: merkle.getRoot(data),
                        proof: merkle.getProof(data, 1)
                    }),
                    feeOnTop,
                    EMPTY_SELECTOR);
            }
            
        } else {
            _acceptSignedTokenSetOfferWithFeeOnTop(
                seller,
                fuzzedOrderInputs,
                saleDetails, 
                TokenSetProof({
                    rootHash: merkle.getRoot(data),
                    proof: merkle.getProof(data, 1)
                }),
                feeOnTop,
                EMPTY_SELECTOR);
        }

        _verifyExpectedTradeStateChanges(buyer, saleDetails, fuzzedOrderInputs, feeOnTop);
    }

    /***************************/
    /*      Standard WETH      */
    /***************************/

    function testAcceptTokenSetOffer721FillOrKillStandardNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestAcceptOffer(
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

    function testAcceptTokenSetOffer1155FillOrKillStandardNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestAcceptOffer(
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

    function testAcceptTokenSetOffer1155FillPartialStandardNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestAcceptOffer(
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
    /* Standard WETH Fee On Top */
    /****************************/

    function testAcceptTokenSetOffer721FillOrKillStandardFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _runTestAcceptOfferWithFeeOnTop(
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

    function testAcceptTokenSetOffer1155FillOrKillStandardFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _runTestAcceptOfferWithFeeOnTop(
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

    function testAcceptTokenSetOffer1155FillPartialStandardFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestAcceptOfferWithFeeOnTop(
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
    /*      Cosigned WETH      */
    /***************************/

    function testAcceptTokenSetOffer721FillOrKillCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestAcceptOffer(
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

    function testAcceptTokenSetOffer1155FillOrKillCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestAcceptOffer(
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

    function testAcceptTokenSetOffer1155FillPartialCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestAcceptOffer(
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

    /****************************/
    /* Cosigned WETH Fee On Top */
    /****************************/

    function testAcceptTokenSetOffer721FillOrKillCosignedFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) public {
        _runTestAcceptOfferWithFeeOnTop(
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

    function testAcceptTokenSetOffer1155FillOrKillCosignedFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount
    ) public {
        _runTestAcceptOfferWithFeeOnTop(
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

    function testAcceptTokenSetOffer1155FillPartialCosignedFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs,
        FuzzedFeeOnTop memory fuzzedFeeOnTop,
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestAcceptOfferWithFeeOnTop(
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
    /*   Empty Cosigned WETH   */
    /***************************/

    function testAcceptTokenSetOffer721FillOrKillEmptyCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs
    ) public {
        _runTestAcceptOffer(
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

    function testAcceptTokenSetOffer1155FillOrKillEmptyCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount
    ) public {
        _runTestAcceptOffer(
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

    function testAcceptTokenSetOffer1155FillPartialEmptyCosignedNoFeeOnTop_WETH(
        uint8 paymentSettings, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        uint248 amount, 
        uint248 fillAmount
    ) public {
        _runTestAcceptOffer(
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
}