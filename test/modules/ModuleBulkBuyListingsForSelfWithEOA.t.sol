pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleBulkBuyListingsForSelfWithEOATest is cPortModuleTest {

    function testBulkBuyListingForSelfWithEOA_ETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        uint128 remainingTotalPrice = type(uint128).max;
        uint128 totalPrice = 0;

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);

            vm.assume(fuzzedOrderInputsArray[i].itemPrice < type(uint128).max / fuzzedOrderInputsArray.length);
            vm.assume(0 < remainingTotalPrice - fuzzedOrderInputsArray[i].itemPrice);

            remainingTotalPrice -= fuzzedOrderInputsArray[i].itemPrice;
            totalPrice += fuzzedOrderInputsArray[i].itemPrice;
        }

        address purchaser = vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: vm.addr(fuzzedOrderInputs.sellerKey),
                buyer: purchaser,
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(0),
                tokenAddress: address(test721),
                cosigner: address(0),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = saleDetails.buyer;

            _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyListingsForSelfWithEOA(
            purchaser,
            totalPrice,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function testBulkBuyListingForSelfWithEOA_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        address purchaser = vm.addr(fuzzedOrderInputsArray[0].buyerKey);
        uint256 tokenId = fuzzedOrderInputsArray[0].tokenId;

        vm.assume(type(uint256).max - 50 > tokenId);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: TokenProtocols.ERC721,
                seller: vm.addr(fuzzedOrderInputs.sellerKey),
                buyer: purchaser,
                beneficiary: fuzzedOrderInputs.beneficiary,
                marketplace: cal,
                paymentMethod: address(weth),
                tokenAddress: address(test721),
                cosigner: address(0),
                tokenId: tokenId + i,
                amount: 1,
                itemPrice: fuzzedOrderInputs.itemPrice,
                nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
                expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
                marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
                maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
            });

            saleDetails.beneficiary = saleDetails.buyer;

            _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
            _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

            test721.mint(saleDetails.seller, saleDetails.tokenId);
            test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkBuyListingsForSelfWithEOA(
            purchaser,
            0,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    function _bulkBuyListingsForSelfWithEOA(address purchaser, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) private {
        SignatureECDSA[] memory signedListingsArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            signedListingsArray[i] = _getSignedListing(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCalldata(
                address(_cPort), 
                saleDetailsArray, 
                signedListingsArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(purchaser, purchaser);
        _cPort.bulkBuyListingsForSelfWithEOA{value: nativePaymentValue}(fnCalldata);
    }
}