pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

import {Merkle} from "murky/Merkle.sol";

contract ModuleAcceptOfferTest is cPortModuleTest {
    /******************************/
    /*    Accept Item Offer       */
    /******************************/

    function testAcceptItemOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptSignedItemOffer(
            saleDetails.seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /**********************************/
    /*    Accept Co-Signed Item Offer */
    /**********************************/

    function testAcceptCosignedItemOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptCosignedItemOffer(
            saleDetails.seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /******************************/
    /*    Accept Collection Offer */
    /******************************/

    function testAcceptCollectionOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptSignedCollectionOffer(
            saleDetails.seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /***************************************/
    /*    Accept Cosigned Collection Offer */
    /***************************************/

    function testAcceptCosignedCollectionOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _acceptCosignedCollectionOffer(
            saleDetails.seller,
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /******************************/
    /*    Accept Token Set Offer  */
    /******************************/

    function testAcceptTokenSetOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint8 dataIndex) public {
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

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: tokenSetIds[dataIndex], 
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        for (uint256 tokenId = 1; tokenId <= 10; tokenId++) {
            test721.mint(saleDetails.seller, tokenId);
            test721.setTokenRoyalty(tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));
        }

        _acceptSignedTokenSetOffer(
            saleDetails.seller,
            fuzzedOrderInputs,
            saleDetails, 
            TokenSetProof({
                rootHash: m.getRoot(data),
                proof: m.getProof(data, dataIndex)
            }),
            EMPTY_SELECTOR);
    }

    /***************************************/
    /*    Accept Cosigned Token Set Offer  */
    /***************************************/

    function testAcceptCosignedTokenSetOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs, uint8 dataIndex) public {
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

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: tokenSetIds[dataIndex], 
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.buyerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        for (uint256 tokenId = 1; tokenId <= 10; tokenId++) {
            test721.mint(saleDetails.seller, tokenId);
            test721.setTokenRoyalty(tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));
        }

        _acceptCosignedTokenSetOffer(
            saleDetails.seller,
            fuzzedOrderInputs,
            saleDetails, 
            TokenSetProof({
                rootHash: m.getRoot(data),
                proof: m.getProof(data, dataIndex)
            }),
            EMPTY_SELECTOR);
    }

}