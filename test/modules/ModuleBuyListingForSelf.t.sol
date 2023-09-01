pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleBuyListingForSelfTest is cPortModuleTest {

    function testBuyListingForSelf_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyListingForSelf(
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.buyer);
    }

    function testBuyListingForSelf_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyListingForSelf(
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.buyer);
    }

    function _buyListingForSelf(uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) private {
        SignatureECDSA memory signedListing = _getSignedListing(fuzzedOrderInputs.sellerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCalldata(
                address(_cPort), 
                saleDetails, 
                signedListing);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(saleDetails.buyer, fuzzedOrderInputs.buyerIsContract ? vm.addr(fuzzedOrderInputs.buyerKey) : saleDetails.buyer);
        _cPort.buyListingForSelf{value: nativePaymentValue}(fnCalldata);
    }
}