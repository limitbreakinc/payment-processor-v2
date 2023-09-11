pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract ModuleBuyListingTest is cPortModuleTest {
    /******************************/
    /*    Buy Listing For Self   */
    /******************************/

    function testBuyListingForSelf_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListing(
            saleDetails.buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function testBuyListingForSelf_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListing(
            saleDetails.buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /**************************************/
    /*    Buy Co-Signed Listing For Self  */
    /**************************************/

    function testBuyCosignedListingForSelf_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListing(
            saleDetails.buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function testBuyCosignedListingForSelf_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListing(
            saleDetails.buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /**********************************/
    /* Buy Listing For Self With EOA */
    /**********************************/

    function testBuyListingForSelfWithEOA_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListing(
            saleDetails.buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function testBuyListingForSelfWithEOA_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListing(
            saleDetails.buyer,
            uint128(0),
            fuzzedOrderInputs, 
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /*******************************************/
    /* Buy Co-Signed Listing For Self With EOA */
    /*******************************************/

    function testBuyCosignedListingForSelfWithEOA_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListing(
            saleDetails.buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function testBuyCosignedListingForSelfWithEOA_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: vm.addr(fuzzedOrderInputs.buyerKey),
            beneficiary: address(0),
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        saleDetails.beneficiary = saleDetails.buyer;

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(saleDetails.buyer, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListing(
            saleDetails.buyer,
            uint128(0),
            fuzzedOrderInputs, 
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    /*****************************/
    /*    Buy Listing For Anyone */
    /*****************************/

    function testBuyListingForAnyone_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: purchaser,
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListing(
            saleDetails.buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function testBuyListingForAnyone_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: purchaser,
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: address(0),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buySignedListing(
            saleDetails.buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }


    /***************************************/
    /*    Buy Co-Signed Listing For Anyone */
    /***************************************/

    function testBuyCosignedListingForAnyone_ETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: purchaser,
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(0),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListing(
            saleDetails.buyer,
            uint128(saleDetails.itemPrice),
            fuzzedOrderInputs, 
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }

    function testBuyCosignedListingForAnyone_WETH(FuzzedOrder721 memory fuzzedOrderInputs) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address purchaser = fuzzedOrderInputs.buyerIsContract ? address(new ContractMock()) : vm.addr(fuzzedOrderInputs.buyerKey);

        Order memory saleDetails = Order({
            protocol: TokenProtocols.ERC721,
            seller: vm.addr(fuzzedOrderInputs.sellerKey),
            buyer: purchaser,
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: cal,
            paymentMethod: address(weth),
            tokenAddress: address(test721),
            cosigner: vm.addr(fuzzedOrderInputs.cosignerKey),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: 1,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate
        });

        _allocateTokensAndApprovals(saleDetails.seller, uint128(MAX_INT));
        _allocateTokensAndApprovals(purchaser, uint128(MAX_INT));

        test721.mint(saleDetails.seller, saleDetails.tokenId);
        test721.setTokenRoyalty(saleDetails.tokenId, abe, uint96(saleDetails.maxRoyaltyFeeNumerator));

        _buyCosignedListing(
            saleDetails.buyer,
            uint128(0),
            fuzzedOrderInputs,
            saleDetails, 
            EMPTY_SELECTOR);

        assertEq(test721.ownerOf(saleDetails.tokenId), saleDetails.beneficiary);
    }
}