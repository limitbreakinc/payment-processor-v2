pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

import {Merkle} from "murky/Merkle.sol";

contract ModuleAcceptOfferFeeOnTopTest is cPortModuleTest {
    /******************************/
    /*    Accept Item Offer       */
    /******************************/

    function testAcceptItemOfferFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptSignedItemOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /**********************************/
    /*    Accept Co-Signed Item Offer */
    /**********************************/

    function testAcceptCosignedItemOfferFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptCosignedItemOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /******************************/
    /*    Accept Collection Offer */
    /******************************/

    function testAcceptCollectionOfferFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptSignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /***************************************/
    /*    Accept Cosigned Collection Offer */
    /***************************************/

    function testAcceptCosignedCollectionOfferFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address seller = vm.addr(fuzzedOrderInputs.sellerKey);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

        test721.mint(seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptCosignedCollectionOfferWithFeeOnTop(
            seller,
            fuzzedOrderInputs,
            saleDetails, 
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /******************************/
    /*    Accept Token Set Offer  */
    /******************************/

    function testAcceptTokenSetOfferFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint8 dataIndex) public {
        Merkle m = new Merkle();
        dataIndex = dataIndex % 3;

        uint256[] memory tokenSetIds = new uint256[](3);
        tokenSetIds[0] = 1;
        tokenSetIds[1] = 4;
        tokenSetIds[2] = 7;

        bytes32[] memory data = new bytes32[](3);
        data[0] = keccak256(abi.encode(address(test721), tokenSetIds[0]));
        data[1] = keccak256(abi.encode(address(test721), tokenSetIds[1]));
        data[2] = keccak256(abi.encode(address(test721), tokenSetIds[2]));

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: tokenSetIds[dataIndex], 
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(vm.addr(fuzzedOrderInputs.sellerKey), uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

        for (uint256 tokenId = 1; tokenId <= 10; tokenId++) {
            test721.mint(vm.addr(fuzzedOrderInputs.sellerKey), tokenId);
            test721.setTokenRoyalty(tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));
        }

        _acceptSignedTokenSetOfferWithFeeOnTop(
            vm.addr(fuzzedOrderInputs.sellerKey),
            fuzzedOrderInputs,
            saleDetails, 
            TokenSetProof({
                rootHash: m.getRoot(data),
                proof: m.getProof(data, dataIndex)
            }),
            feeOnTop,
            EMPTY_SELECTOR);
        
        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }

    /***************************************/
    /*    Accept Cosigned Token Set Offer  */
    /***************************************/

    function testAcceptCosignedTokenSetOfferFeeOnTop_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint8 dataIndex) public {
        Merkle m = new Merkle();
        dataIndex = dataIndex % 3;

        uint256[] memory tokenSetIds = new uint256[](3);
        tokenSetIds[0] = 1;
        tokenSetIds[1] = 4;
        tokenSetIds[2] = 7;

        bytes32[] memory data = new bytes32[](3);
        data[0] = keccak256(abi.encode(address(test721), tokenSetIds[0]));
        data[1] = keccak256(abi.encode(address(test721), tokenSetIds[1]));
        data[2] = keccak256(abi.encode(address(test721), tokenSetIds[2]));

        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        uint256 feeOnTopAmount = uint256(fuzzedOrderInputs.itemPrice) * 10 / 100;
        fuzzedOrderInputs.itemPrice = fuzzedOrderInputs.itemPrice - uint128(feeOnTopAmount);

        FeeOnTop memory feeOnTop = FeeOnTop({
            recipient: vm.addr(0xdeadbeef),
            amount: feeOnTopAmount
        });

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            maker: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: tokenSetIds[dataIndex], 
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(vm.addr(fuzzedOrderInputs.sellerKey), uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

        for (uint256 tokenId = 1; tokenId <= 10; tokenId++) {
            test721.mint(vm.addr(fuzzedOrderInputs.sellerKey), tokenId);
            test721.setTokenRoyalty(tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));
        }

        _acceptCosignedTokenSetOfferWithFeeOnTop(
            vm.addr(fuzzedOrderInputs.sellerKey),
            fuzzedOrderInputs,
            saleDetails, 
            TokenSetProof({
                rootHash: m.getRoot(data),
                proof: m.getProof(data, dataIndex)
            }),
            feeOnTop,
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
        assertEq(weth.balanceOf(feeOnTop.recipient), feeOnTop.amount);
    }
}