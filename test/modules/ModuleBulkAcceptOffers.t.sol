pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

import {Merkle} from "murky/Merkle.sol";

contract ModuleBulkAcceptOffersTest is cPortModuleTest {
    /******************************/
    /*    Bulk Accept Item Offers */
    /******************************/

    function testBulkAcceptItemOffers_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        vm.assume(fuzzedOrderInputsArray[0].tokenId != fuzzedOrderInputsArray[1].tokenId);

        address seller = vm.addr(fuzzedOrderInputsArray[0].sellerKey);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
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

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkAcceptSignedItemOffers(
            seller,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /****************************************/
    /*    Bulk Accept Co-Signed Item Offers */
    /****************************************/

    function testBulkAcceptCosignedItemOffers_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        vm.assume(fuzzedOrderInputsArray[0].tokenId != fuzzedOrderInputsArray[1].tokenId);

        address seller = vm.addr(fuzzedOrderInputsArray[0].sellerKey);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
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

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkAcceptCosignedItemOffers(
            seller,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /************************************/
    /*    Bulk Accept Collection Offers */
    /************************************/

    function testBulkAcceptCollectionOffers_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        vm.assume(fuzzedOrderInputsArray[0].tokenId != fuzzedOrderInputsArray[1].tokenId);

        address seller = vm.addr(fuzzedOrderInputsArray[0].sellerKey);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
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

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkAcceptSignedCollectionOffers(
            seller,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /********************************************/
    /*   Bulk Accept Cosigned Collection Offers */
    /********************************************/

    function testBulkAcceptCosignedCollectionOffers_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray) public {
        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        vm.assume(fuzzedOrderInputsArray[0].tokenId != fuzzedOrderInputsArray[1].tokenId);

        address seller = vm.addr(fuzzedOrderInputsArray[0].sellerKey);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
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

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
        }

        _bulkAcceptCosignedCollectionOffers(
            seller,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /**********************************/
    /*   Bulk Accept Token Set Offers */
    /**********************************/

    function testBulkAcceptTokenSetOffers_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray, uint8[2] memory dataIndexes) public {
        uint256[] memory tokenSetIds = new uint256[](3);
        tokenSetIds[0] = 1;
        tokenSetIds[1] = 4;
        tokenSetIds[2] = 7;

        bytes32[] memory data = new bytes32[](3);
        data[0] = keccak256(abi.encode(address(test721), tokenSetIds[0]));
        data[1] = keccak256(abi.encode(address(test721), tokenSetIds[1]));
        data[2] = keccak256(abi.encode(address(test721), tokenSetIds[2]));

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        Merkle[] memory merkles = new Merkle[](fuzzedOrderInputsArray.length);
        for (uint256 i = 0; i < dataIndexes.length; ++i) {
            merkles[i] = new Merkle();
            dataIndexes[i] = dataIndexes[i] % 3;
        }

        vm.assume(dataIndexes[0] != dataIndexes[1]);

        address seller = vm.addr(fuzzedOrderInputsArray[0].sellerKey);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];
            uint8 dataIndex = dataIndexes[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
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

            _allocateTokensAndApprovals(seller, uint128(MAX_INT));
            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: merkles[i].getRoot(data),
                proof: merkles[i].getProof(data, dataIndex)
            });
        }

        for (uint256 tokenId = 1; tokenId <= 10; tokenId++) {
            test721.mint(seller, tokenId);
            test721.setTokenRoyalty(tokenId, abe, uint96(0));
        }

        _bulkAcceptSignedTokenSetOffers(
            seller,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray,
            tokenSetProofsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

    /********************************************/
    /*   Bulk Accept Cosigned Token Set Offers  */
    /********************************************/

    function testBulkAcceptCosignedTokenSetOffers_WETH(FuzzedOrder721[2] memory fuzzedOrderInputsArray, uint8[2] memory dataIndexes) public {
        uint256[] memory tokenSetIds = new uint256[](3);
        tokenSetIds[0] = 1;
        tokenSetIds[1] = 4;
        tokenSetIds[2] = 7;

        bytes32[] memory data = new bytes32[](3);
        data[0] = keccak256(abi.encode(address(test721), tokenSetIds[0]));
        data[1] = keccak256(abi.encode(address(test721), tokenSetIds[1]));
        data[2] = keccak256(abi.encode(address(test721), tokenSetIds[2]));

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            _scrubFuzzedOrderInputs(fuzzedOrderInputsArray[i]);
        }

        Merkle[] memory merkles = new Merkle[](fuzzedOrderInputsArray.length);
        for (uint256 i = 0; i < dataIndexes.length; ++i) {
            merkles[i] = new Merkle();
            dataIndexes[i] = dataIndexes[i] % 3;
        }

        vm.assume(dataIndexes[0] != dataIndexes[1]);

        address seller = vm.addr(fuzzedOrderInputsArray[0].sellerKey);

        Order[] memory saleDetailsArray = new Order[](fuzzedOrderInputsArray.length);
        FuzzedOrder721[] memory dynamicFuzzedOrderInputsArray = new FuzzedOrder721[](fuzzedOrderInputsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](fuzzedOrderInputsArray.length);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            FuzzedOrder721 memory fuzzedOrderInputs = fuzzedOrderInputsArray[i];
            uint8 dataIndex = dataIndexes[i];

            Order memory saleDetails = Order({
                protocol: OrderProtocols.ERC721_FILL_OR_KILL,
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

            _allocateTokensAndApprovals(seller, uint128(MAX_INT));
            _allocateTokensAndApprovals(saleDetails.maker, uint128(MAX_INT));

            saleDetailsArray[i] = saleDetails;
            dynamicFuzzedOrderInputsArray[i] = fuzzedOrderInputs;
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: merkles[i].getRoot(data),
                proof: merkles[i].getProof(data, dataIndex)
            });
        }

        for (uint256 tokenId = 1; tokenId <= 10; tokenId++) {
            test721.mint(seller, tokenId);
            test721.setTokenRoyalty(tokenId, abe, uint96(0));
        }

        _bulkAcceptCosignedTokenSetOffers(
            seller,
            dynamicFuzzedOrderInputsArray, 
            saleDetailsArray,
            tokenSetProofsArray, 
            EMPTY_SELECTOR);

        for (uint256 i = 0; i < fuzzedOrderInputsArray.length; ++i) {
            assertEq(test721.ownerOf(saleDetailsArray[i].tokenId), saleDetailsArray[i].beneficiary);
        }
    }

}