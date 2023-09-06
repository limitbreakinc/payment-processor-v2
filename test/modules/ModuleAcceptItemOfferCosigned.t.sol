pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleAcceptItemOfferTest is cPortModuleTest {

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

        _acceptItemOffer(
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function _acceptItemOffer(uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) private {
        SignatureECDSA memory buyerSignature = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = _getCosignedItemOffer(fuzzedOrderInputs.cosignerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                false, 
                saleDetails, 
                buyerSignature,
                cosignerSignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(saleDetails.seller, saleDetails.seller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }
}