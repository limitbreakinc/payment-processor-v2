pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

import {Merkle} from "murky/Merkle.sol";

contract ModuleAcceptCollectionOfferTest is cPortModuleTest {

    function testAcceptCollectionTokenSetOffer_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
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
            tokenId: 1, // TODO
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

        uint256[] memory tokenSetIds = new uint256[](3);
        tokenSetIds[0] = 1;
        tokenSetIds[1] = 4;
        tokenSetIds[2] = 7;

        bytes32[] memory data = new bytes32[](3);
        data[0] = keccak256(abi.encode(tokenSetIds[0]));
        data[1] = keccak256(abi.encode(tokenSetIds[1]));
        data[2] = keccak256(abi.encode(tokenSetIds[2]));

        Merkle m = new Merkle();
        bytes32 root = m.getRoot(data);

        console.log("Merkle Root: ");
        console.log("------------");
        console.logBytes32(root);

        bytes32[] memory proof = m.getProof(data, 0);
        console.log("Merkle Proof: ");
        console.log("------------");
        for (uint256 i = 0; i < proof.length; i++) {
            console.logBytes32(proof[i]);
        }

        _acceptCollectionOfferOnTokenSet(
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            TokenSetProof({
                rootHash: root,
                proof: proof
            }),
            EMPTY_SELECTOR);
    }

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

        _acceptCollectionOffer(
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function _acceptCollectionOffer(uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) private {
        SignatureECDSA memory signedOffer = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true, 
                saleDetails, 
                signedOffer);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(saleDetails.seller, saleDetails.seller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptCollectionOfferOnTokenSet(uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) private {
        SignatureECDSA memory signedOffer = _getSignedCollectionOfferOnTokenSet(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferOnTokenSetCalldata(
                address(_cPort), 
                true, 
                saleDetails, 
                signedOffer,
                tokenSetProof);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(saleDetails.seller, saleDetails.seller);
        _cPort.acceptOfferOnTokenSet(fnCalldata);
    }
}