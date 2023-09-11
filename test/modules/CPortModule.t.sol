pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/interfaces/CPortEvents.sol";
import "src/Constants.sol";
import "src/CPort.sol";
import "src/CPortEncoder.sol";
import "src/modules/ModulePaymentSettings.sol";
import "src/modules/ModuleOnChainCancellation.sol";
import "src/modules/ModuleBuyListing.sol";
import "src/modules/ModuleAcceptOffer.sol";
import "src/modules/ModuleBulkBuyListings.sol";
import "src/modules/ModuleBulkAcceptOffers.sol";
import "src/modules/ModuleSweepCollection.sol";

import "../mocks/ContractMock.sol";
import "../mocks/SeaportTestERC20.sol";
import "../mocks/SeaportTestERC721.sol";
import "../mocks/SeaportTestERC1155.sol";

contract cPortModuleTest is Test, cPortEvents {

    struct FuzzedOrder721 {
        bool buyerIsContract;
        uint24  marketplaceFeeRate;
        uint24  royaltyFeeRate;
        uint160 sellerKey;
        uint32  expirationSeconds;
        uint160 buyerKey;
        uint256 tokenId;
        uint128 itemPrice;
        address beneficiary;
        uint160 cosignerKey;
    }

    bytes4 internal constant EMPTY_SELECTOR = bytes4(0x00000000);

    uint256 constant MAX_INT = ~uint256(0);

    uint256 internal alicePk = 0xa11ce;
    uint256 internal bobPk = 0xb0b;
    uint256 internal calPk = 0xca1;
    uint256 internal abePk = 0xabe;
    address payable internal alice = payable(vm.addr(alicePk));
    address payable internal bob = payable(vm.addr(bobPk));
    address payable internal cal = payable(vm.addr(calPk));
    address payable internal abe = payable(vm.addr(abePk));

    cPort public _cPort;
    cPortEncoder public _cPortEncoder;

    SeaportTestERC20 public weth;
    SeaportTestERC20 public usdc;
    SeaportTestERC20 public usdt;
    SeaportTestERC20 public dai;

    SeaportTestERC721 public test721;

    SeaportTestERC20[] erc20s;
    SeaportTestERC721[] erc721s;

    cPortModule public modulePaymentSettings;
    cPortModule public moduleOnChainCancellation;
    cPortModule public moduleBuyListing;
    cPortModule public moduleAcceptOffer;
    cPortModule public moduleBulkBuyListings;
    cPortModule public moduleBulkAcceptOffers;
    cPortModule public moduleSweepCollection;

    uint88 public customPaymentMethodWhitelistId;

    mapping (address => uint256) internal _nextAvailableTokenId;
    mapping (address => uint256) internal _nonces;

    function setUp() public {
        weth = new SeaportTestERC20();
        usdc = new SeaportTestERC20();
        usdt = new SeaportTestERC20();
        dai = new SeaportTestERC20();

        erc20s = [weth, usdc, usdt, dai];

        test721 = new SeaportTestERC721();

        erc721s = [test721];

        _cPortEncoder = new cPortEncoder();

        modulePaymentSettings = new ModulePaymentSettings(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleOnChainCancellation = new ModuleOnChainCancellation(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleBuyListing = new ModuleBuyListing(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleAcceptOffer = new ModuleAcceptOffer(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleBulkBuyListings = new ModuleBulkBuyListings(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleBulkAcceptOffers = new ModuleBulkAcceptOffers(
            2300, 
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        moduleSweepCollection = new ModuleSweepCollection(
            2300,
            address(weth), 
            address(usdc), 
            address(usdt), 
            address(dai));

        _cPort = 
            new cPort(
                address(modulePaymentSettings),
                address(moduleOnChainCancellation),
                address(moduleBuyListing),
                address(moduleAcceptOffer),
                address(moduleBulkBuyListings),
                address(moduleBulkAcceptOffers),
                address(moduleSweepCollection)
            );

        vm.label(alice, "alice");
        vm.label(bob, "bob");
        vm.label(cal, "cal");
        vm.label(abe, "abe");
        vm.label(address(this), "testContract");

        _allocateTokensAndApprovals(address(this), uint128(MAX_INT));
        _allocateTokensAndApprovals(alice, uint128(MAX_INT));
        _allocateTokensAndApprovals(bob, uint128(MAX_INT));
        _allocateTokensAndApprovals(cal, uint128(MAX_INT));
        _allocateTokensAndApprovals(abe, uint128(MAX_INT));

        bytes memory createWhitelistData = _cPortEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_cPort), "Test Whitelist");
        customPaymentMethodWhitelistId = _cPort.createPaymentMethodWhitelist(createWhitelistData);

        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), customPaymentMethodWhitelistId, address(0)));
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), customPaymentMethodWhitelistId, address(weth)));
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), customPaymentMethodWhitelistId, address(usdc)));
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), customPaymentMethodWhitelistId, address(usdt)));
        _cPort.whitelistPaymentMethod(_cPortEncoder.encodeWhitelistPaymentMethodCalldata(address(_cPort), customPaymentMethodWhitelistId, address(dai)));
    }

    /**
     * @dev allocate amount of each token, 1 of each 721, and 1, 5, and 10 of respective 1155s
     */
    function _allocateTokensAndApprovals(address _to, uint128 _amount) internal {
        vm.deal(_to, _amount);
        for (uint256 i = 0; i < erc20s.length; ++i) {
            erc20s[i].mint(_to, _amount);
        }
        _setApprovals(_to);
    }

    function _setApprovals(address _owner) internal virtual {
        vm.startPrank(_owner);
        for (uint256 i = 0; i < erc20s.length; ++i) {
            erc20s[i].approve(address(_cPort), MAX_INT);
        }
        for (uint256 i = 0; i < erc721s.length; ++i) {
            erc721s[i].setApprovalForAll(address(_cPort), true);
        }
        vm.stopPrank();
    }

    function _getNextNonce(address account) internal returns (uint256) {
        uint256 nextUnusedNonce = _nonces[account];
        ++_nonces[account];
        return nextUnusedNonce;
    }
    
    function _getNextAvailableTokenId(address collection) internal returns (uint256) {
        uint256 nextTokenId = _nextAvailableTokenId[collection];
        ++_nextAvailableTokenId[collection];
        return nextTokenId;
    }

    function _getSignedSaleApproval(uint256 sellerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 listingDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            SALE_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.seller,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.tokenId,
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.seller)
                        )
                    )
                )
            );
    
        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(sellerKey_, listingDigest);
        SignatureECDSA memory signedListing = SignatureECDSA({v: listingV, r: listingR, s: listingS});
    
        return signedListing;
    }

    function _getCosignedSaleApproval(uint256 signerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 listingDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            SALE_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.cosigner,
                            saleDetails.seller,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.tokenId,
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator
                        )
                    )
                )
            );
    
        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(signerKey_, listingDigest);
        SignatureECDSA memory signedSaleApproval = SignatureECDSA({v: listingV, r: listingR, s: listingS});
    
        return signedSaleApproval;
    }

    function _getCosignedItemOffer(uint256 signerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            ITEM_OFFER_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.cosigner,
                            saleDetails.buyer,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.tokenId,
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(signerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getCosignedCollectionOffer(uint256 signerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            COLLECTION_OFFER_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.cosigner,
                            saleDetails.buyer,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(signerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getCosignedTokenSetOffer(uint256 signerKey_, Order memory saleDetails, TokenSetProof memory tokenSetProof) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            TOKEN_SET_OFFER_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.cosigner,
                            saleDetails.buyer,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            tokenSetProof.rootHash
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(signerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getSignedItemOffer(uint256 buyerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            ITEM_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.buyer,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.tokenId,
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.buyer)
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getSignedCollectionOffer(uint256 buyerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            COLLECTION_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.buyer,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.buyer)
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _getSignedTokenSetOffer(uint256 buyerKey_, Order memory saleDetails, TokenSetProof memory tokenSetProof) internal view returns (SignatureECDSA memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            TOKEN_SET_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            saleDetails.buyer,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.buyer),
                            tokenSetProof.rootHash
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }


    function _getSignedBundledListing(
        uint256 sellerKey_, 
        AccumulatorHashes memory accumulatorHashes,
        BundledOrderExtended memory bundleDetails) internal view returns (SignatureECDSA memory) {
        bytes32 listingDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            BUNDLED_SALE_APPROVAL_HASH,
                            uint8(bundleDetails.bundleBase.protocol),
                            bundleDetails.seller,
                            bundleDetails.bundleBase.marketplace,
                            bundleDetails.bundleBase.paymentMethod,
                            bundleDetails.bundleBase.tokenAddress
                        ),
                        abi.encode(
                            bundleDetails.expiration,
                            bundleDetails.nonce,
                            bundleDetails.bundleBase.marketplaceFeeNumerator,
                            _cPort.masterNonces(bundleDetails.seller),
                            accumulatorHashes.tokenIdsKeccakHash,
                            accumulatorHashes.amountsKeccakHash,
                            accumulatorHashes.maxRoyaltyFeeNumeratorsKeccakHash,
                            accumulatorHashes.itemPricesKeccakHash
                        )
                    )
                )
            );

        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(sellerKey_, listingDigest);
        SignatureECDSA memory signedListing = SignatureECDSA({v: listingV, r: listingR, s: listingS});

        return signedListing;
    }

    function _buyCosignedListing(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = _getCosignedSaleApproval(fuzzedOrderInputs.cosignerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                cosignerSignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buySignedListing(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = SignatureECDSA({v: 0, r: 0, s: 0});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                cosignerSignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyCosignedListings(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SignatureECDSA[] memory cosignerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i]);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuySignedListings(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SignatureECDSA[] memory cosignerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = SignatureECDSA({v: 0, r: 0, s: 0});
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _acceptCosignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = _getCosignedItemOffer(fuzzedOrderInputs.cosignerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                cosignerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptSignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = SignatureECDSA({v: 0, r: 0, s: 0});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                cosignerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptCosignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = _getCosignedCollectionOffer(fuzzedOrderInputs.cosignerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                cosignerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptSignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        SignatureECDSA memory cosignerSignature = SignatureECDSA({v: 0, r: 0, s: 0});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                cosignerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptCosignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        SignatureECDSA memory cosignerSignature = _getCosignedTokenSetOffer(fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                cosignerSignature,
                tokenSetProof);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptSignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        SignatureECDSA memory cosignerSignature = SignatureECDSA({v: 0, r: 0, s: 0});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                cosignerSignature,
                tokenSetProof);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _sanitizeAddress(address addr, address[] memory exclusionList) internal view {
        vm.assume(uint160(addr) > 0xFF);
        vm.assume(addr != address(0));
        vm.assume(addr != address(0x000000000000000000636F6e736F6c652e6c6f67));
        vm.assume(addr != address(0xDDc10602782af652bB913f7bdE1fD82981Db7dd9));
        vm.assume(addr != address(_cPort));
        vm.assume(addr != address(_cPortEncoder));
        vm.assume(addr.code.length == 0);

        for (uint256 i = 0; i < exclusionList.length; ++i) {
            vm.assume(addr != exclusionList[i]);
        }
    }

    function _scrubFuzzedOrderInputs(FuzzedOrder721 memory fuzzedOrderInputs) internal view {
        vm.assume(10000 >= fuzzedOrderInputs.marketplaceFeeRate);
        vm.assume(10000 >= fuzzedOrderInputs.royaltyFeeRate);
        vm.assume(10000 >= fuzzedOrderInputs.marketplaceFeeRate + fuzzedOrderInputs.royaltyFeeRate);

        vm.assume(0 < fuzzedOrderInputs.sellerKey);
        vm.assume(0 < fuzzedOrderInputs.buyerKey);
        vm.assume(0 < fuzzedOrderInputs.cosignerKey);

        vm.assume(fuzzedOrderInputs.sellerKey != fuzzedOrderInputs.buyerKey);
        vm.assume(fuzzedOrderInputs.sellerKey != fuzzedOrderInputs.cosignerKey);
        vm.assume(fuzzedOrderInputs.buyerKey != fuzzedOrderInputs.cosignerKey);
        
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.sellerKey), new address[](0));
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.buyerKey), new address[](0));
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.cosignerKey), new address[](0));
        _sanitizeAddress(fuzzedOrderInputs.beneficiary, new address[](0));
        
        vm.assume(0 < fuzzedOrderInputs.expirationSeconds);
    }
}