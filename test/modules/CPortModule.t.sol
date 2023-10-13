pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/interfaces/CPortEvents.sol";
import "src/Constants.sol";
import "src/CPort.sol";
import "src/CPortEncoder.sol";
import "src/modules/ModulePaymentSettings.sol";
import "src/modules/ModuleOnChainCancellation.sol";
import "src/modules/ModuleSingleTrades.sol";
import "src/modules/ModuleSingleTradesCosigned.sol";
import "src/modules/ModuleBulkTrades.sol";
import "src/modules/ModuleBulkTradesCosigned.sol";
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
        address marketplace;
        address royaltyReceiver;
    }

    struct FuzzedFeeOnTop {
        uint24 rate;
        address receiver;
    }

    bytes4 internal constant EMPTY_SELECTOR = bytes4(0x00000000);

    uint256 constant MAX_INT = ~uint256(0);

    uint256 internal alicePk = 0xa11ce;
    uint256 internal bobPk = 0xb0b;
    uint256 internal calPk = 0xca1;
    uint256 internal abePk = 0xabe;
    uint256 internal benchmarkBeneficiaryPk = 0xbe2ef;
    uint256 internal cosignerPk = 0xc0519;
    uint256 internal feePk = 0xfee3;
    address payable internal alice = payable(vm.addr(alicePk));
    address payable internal bob = payable(vm.addr(bobPk));
    address payable internal cal = payable(vm.addr(calPk));
    address payable internal abe = payable(vm.addr(abePk));
    address payable internal benchmarkBeneficiary = payable(vm.addr(benchmarkBeneficiaryPk));
    address payable internal cosigner = payable(vm.addr(cosignerPk));
    address payable internal benchmarkFeeRecipient = payable(vm.addr(feePk));

    cPort public _cPort;
    cPortEncoder public _cPortEncoder;

    SeaportTestERC20 public weth;
    SeaportTestERC20 public usdc;
    SeaportTestERC20 public usdt;
    SeaportTestERC20 public dai;

    SeaportTestERC721 public test721;
    SeaportTestERC1155 public test1155;

    SeaportTestERC20[] erc20s;
    SeaportTestERC721[] erc721s;
    SeaportTestERC1155[] erc1155s;

    cPortModule public modulePaymentSettings;
    cPortModule public moduleOnChainCancellation;
    cPortModule public moduleSingleTrades;
    cPortModule public moduleSingleTradesCosigned;
    cPortModule public moduleBulkTrades;
    cPortModule public moduleBulkTradesCosigned;
    cPortModule public moduleSweepCollection;

    uint32 public customPaymentMethodWhitelistId;

    mapping (address => uint256) internal _nextAvailableTokenId;
    mapping (address => uint256) internal _nonces;

    function setUp() public virtual {
        weth = new SeaportTestERC20();
        usdc = new SeaportTestERC20();
        usdt = new SeaportTestERC20();
        dai = new SeaportTestERC20();

        erc20s = [weth, usdc, usdt, dai];

        test721 = new SeaportTestERC721();

        erc721s = [test721];

        test1155 = new SeaportTestERC1155();

        erc1155s = [test1155];

        _cPortEncoder = new cPortEncoder();

        DefaultPaymentMethods memory defaultPaymentMethods = DefaultPaymentMethods({
            defaultPaymentMethod1: address(weth),
            defaultPaymentMethod2: address(usdc),
            defaultPaymentMethod3: address(usdt),
            defaultPaymentMethod4: address(dai),
            defaultPaymentMethod5: address(0),
            defaultPaymentMethod6: address(0),
            defaultPaymentMethod7: address(0),
            defaultPaymentMethod8: address(0)
        });

        modulePaymentSettings = new ModulePaymentSettings(
            2300, 
            defaultPaymentMethods);

        moduleOnChainCancellation = new ModuleOnChainCancellation(
            2300, 
            defaultPaymentMethods);

        moduleSingleTrades = new ModuleSingleTrades(
            2300, 
            defaultPaymentMethods);

        moduleSingleTradesCosigned = new ModuleSingleTradesCosigned(
            2300, 
            defaultPaymentMethods);

        moduleBulkTrades = new ModuleBulkTrades(
            2300, 
            defaultPaymentMethods);

        moduleBulkTradesCosigned = new ModuleBulkTradesCosigned(
            2300, 
            defaultPaymentMethods);

        moduleSweepCollection = new ModuleSweepCollection(
            2300,
            defaultPaymentMethods);

        _cPort = 
            new cPort(
                address(this),
                address(modulePaymentSettings),
                address(moduleOnChainCancellation),
                address(moduleSingleTrades),
                address(moduleSingleTradesCosigned),
                address(moduleBulkTrades),
                address(moduleBulkTradesCosigned),
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
        _allocateTokensAndApprovals(benchmarkFeeRecipient, uint128(MAX_INT));

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
        for (uint256 i = 0; i < erc1155s.length; ++i) {
            erc1155s[i].setApprovalForAll(address(_cPort), true);
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
                            saleDetails.maker,
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
                            _cPort.masterNonces(saleDetails.maker)
                        )
                    )
                )
            );
    
        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(sellerKey_, listingDigest);
        SignatureECDSA memory signedListing = SignatureECDSA({v: listingV, r: listingR, s: listingS});
    
        return signedListing;
    }

    function _getCosignature(uint256 cosignerKey_, SignatureECDSA memory signature, uint256 cosignatureExpiration, address cosignatureTaker) internal view returns (Cosignature memory) {
        bytes32 cosignatureDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    abi.encode(
                        COSIGNATURE_HASH,
                        signature.v,
                        signature.r,
                        signature.s,
                        cosignatureExpiration,
                        cosignatureTaker
                    )
                )
            );

        (uint8 cosignatureV, bytes32 cosignatureR, bytes32 cosignatureS) = vm.sign(cosignerKey_, cosignatureDigest);
        Cosignature memory cosignature = 
            Cosignature({
                signer: vm.addr(cosignerKey_), 
                taker: cosignatureTaker,
                expiration: cosignatureExpiration, 
                v: cosignatureV, 
                r: cosignatureR, 
                s: cosignatureS
            });

        return cosignature;
    }

    function _getCosignedSaleApproval(uint256 signerKey_, uint256 cosignerKey_, Order memory saleDetails, address taker) internal view returns (SignatureECDSA memory, Cosignature memory) {
        
        bytes32 listingDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            SALE_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
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
    
        return (
            signedSaleApproval, 
            _getCosignature(cosignerKey_, signedSaleApproval, block.timestamp + 10 minutes, taker));
    }

    function _getCosignedItemOffer(uint256 signerKey_, uint256 cosignerKey_, Order memory saleDetails, address taker) internal view returns (SignatureECDSA memory, Cosignature memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            ITEM_OFFER_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
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
                            saleDetails.marketplaceFeeNumerator
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(signerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});

        return (
            signedOffer, 
            _getCosignature(cosignerKey_, signedOffer, block.timestamp + 10 minutes, taker));
    }

    function _getCosignedCollectionOffer(uint256 signerKey_, uint256 cosignerKey_, Order memory saleDetails, address taker) internal view returns (SignatureECDSA memory, Cosignature memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            COLLECTION_OFFER_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(signerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});

        return (
            signedOffer, 
            _getCosignature(cosignerKey_, signedOffer, block.timestamp + 10 minutes, taker));
    }

    function _getCosignedTokenSetOffer(uint256 signerKey_, uint256 cosignerKey_, Order memory saleDetails, TokenSetProof memory tokenSetProof, address taker) internal view returns (SignatureECDSA memory, Cosignature memory) {
        bytes32 offerDigest = 
            ECDSA.toTypedDataHash(
                _cPort.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            TOKEN_SET_OFFER_APPROVAL_COSIGNED_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
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
                            tokenSetProof.rootHash
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(signerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});

        return (
            signedOffer, 
            _getCosignature(cosignerKey_, signedOffer, block.timestamp + 10 minutes, taker));
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
                            saleDetails.maker,
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
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.maker)
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
                            saleDetails.maker,
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
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.maker)
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
                            saleDetails.maker,
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
                            saleDetails.nonce,
                            _cPort.masterNonces(saleDetails.maker),
                            tokenSetProof.rootHash
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }



    function _buyCosignedListing(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory sellerSignature, Cosignature memory cosignature) = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCosignedCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.buyListingCosigned{value: nativePaymentValue}(fnCalldata);
    }

    function _buyEmptyCosignedListing(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCosignedCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.buyListingCosigned{value: nativePaymentValue}(fnCalldata);
    }

    function _buySignedListing(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buyCosignedListingWithFeeOnTop(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory sellerSignature, Cosignature memory cosignature) = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.buyListingCosignedWithFeeOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _buyEmptyCosignedListingWithFeeOnTop(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.buyListingCosignedWithFeeOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _buySignedListingWithFeeOnTop(address caller, uint128 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBuyListingWithFeeOnTopCalldata(
                address(_cPort), 
                saleDetails, 
                sellerSignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.buyListingWithFeeOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyCosignedListings(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignatureArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCosignedCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListingsCosigned{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyCosignedListingsWithFeesOnTop(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignatureArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + uint128(feesOnTop[i].amount);
            }
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListingsCosignedWithFeesOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyEmptyCosignedListingsWithFeesOnTop(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatureArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + uint128(feesOnTop[i].amount);
            }
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListingsCosignedWithFeesOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyEmptyCosignedListings(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatureArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCosignedCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListingsCosigned{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepSignedListings(address caller, uint128 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeSweepCollectionCalldata(
                address(_cPort), 
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepSignedListingsWithFeeOnTop(address caller, uint128 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);

        if (saleDetailsArray[0].paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeSweepCollectionWithFeeOnTopCalldata(
                address(_cPort), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.sweepCollectionWithFeeOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepCosignedListings(address caller, uint128 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignaturesArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeSweepCollectionCosignedCalldata(
                address(_cPort), 
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.sweepCollectionCosigned{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepEmptyCosignedListings(address caller, uint128 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeSweepCollectionCosignedCalldata(
                address(_cPort), 
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.sweepCollectionCosigned{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepCosignedListingsWithFeeOnTop(address caller, uint128 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);

        if (saleDetailsArray[0].paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignaturesArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeSweepCollectionCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.sweepCollectionCosignedWithFeeOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepEmptyCosignedListingsWithFeeOnTop(address caller, uint128 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);

        if (saleDetailsArray[0].paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeSweepCollectionCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.sweepCollectionCosignedWithFeeOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuySignedListings(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuySignedListingsWithFeeOnTop(address caller, uint128 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + uint128(feesOnTop[i].amount);
            }
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkBuyListingsWithFeesOnTopCalldata(
                address(_cPort), 
                saleDetailsArray, 
                sellerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkBuyListingsWithFeesOnTop{value: nativePaymentValue}(fnCalldata);
    }

    function _acceptCosignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }

    function _acceptEmptyCosignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }

    function _acceptEmptyCosignedItemOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosignedWithFeeOnTop(fnCalldata);
    }

    function _acceptSignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
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

    function _acceptCosignedItemOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosignedWithFeeOnTop(fnCalldata);
    }

    function _acceptSignedItemOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferWithFeeOnTopCalldata(
                address(_cPort), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOfferWithFeeOnTop(fnCalldata);
    }

    function _acceptCosignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }

    function _acceptEmptyCosignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }

    function _acceptEmptyCosignedCollectionOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosignedWithFeeOnTop(fnCalldata);
    }

    function _acceptSignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
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

    function _acceptCosignedCollectionOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosignedWithFeeOnTop(fnCalldata);
    }

    function _acceptSignedCollectionOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferWithFeeOnTopCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOfferWithFeeOnTop(fnCalldata);
    }

    function _acceptCosignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }

    function _acceptEmptyCosignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosigned(fnCalldata);
    }

    function _acceptEmptyCosignedTokenSetOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosignedWithFeeOnTop(fnCalldata);
    }

    function _acceptSignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOffer(fnCalldata);
    }

    function _acceptCosignedTokenSetOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof, caller);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferCosignedWithFeeOnTopCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.acceptOfferCosignedWithFeeOnTop(fnCalldata);
    }

    function _acceptSignedTokenSetOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _cPortEncoder.encodeAcceptOfferWithFeeOnTopCalldata(
                address(_cPort), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _cPort.acceptOfferWithFeeOnTop(fnCalldata);
    }

    function _bulkAcceptCosignedItemOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosigned(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedItemOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosigned(fnCalldata);
    }

    function _bulkAcceptCosignedItemOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosignedWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedItemOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosignedWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptSignedItemOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedItemOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptCosignedCollectionOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosigned(fnCalldata);
    }

    function _bulkAcceptCosignedCollectionOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosignedWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedCollectionOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosigned(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedCollectionOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosignedWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptSignedCollectionOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedCollectionOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptCosignedTokenSetOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], tokenSetProofsArray[i], caller);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosigned(fnCalldata);
    }

    function _bulkAcceptCosignedTokenSetOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], tokenSetProofsArray[i], caller);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosignedWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedTokenSetOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosignedWithFeesOnTop(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedTokenSetOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCosignedCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersCosigned(fnCalldata);
    }

    function _bulkAcceptSignedTokenSetOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedTokenSetOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
        }

        bytes memory fnCalldata = 
            _cPortEncoder.encodeBulkAcceptOffersWithFeesOnTopCalldata(
                address(_cPort), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _cPort.bulkAcceptOffersWithFeesOnTop(fnCalldata);
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

        address[] memory exclusionList = new address[](7);
        exclusionList[0] = alice;
        exclusionList[1] = bob;
        exclusionList[2] = cal;
        exclusionList[3] = abe;
        exclusionList[4] = benchmarkBeneficiary;
        exclusionList[5] = cosigner;
        exclusionList[6] = benchmarkFeeRecipient;

        _sanitizeAddress(vm.addr(fuzzedOrderInputs.sellerKey), exclusionList);
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.buyerKey), exclusionList);
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.cosignerKey), exclusionList);
        _sanitizeAddress(fuzzedOrderInputs.beneficiary, exclusionList);
        _sanitizeAddress(fuzzedOrderInputs.marketplace, exclusionList);
        _sanitizeAddress(fuzzedOrderInputs.royaltyReceiver, exclusionList);

        vm.assume(fuzzedOrderInputs.beneficiary != fuzzedOrderInputs.marketplace);
        vm.assume(fuzzedOrderInputs.beneficiary != fuzzedOrderInputs.royaltyReceiver);
        vm.assume(fuzzedOrderInputs.marketplace != fuzzedOrderInputs.royaltyReceiver);
        
        vm.assume(0 < fuzzedOrderInputs.expirationSeconds);

        vm.assume(fuzzedOrderInputs.marketplace.balance == 0);
        vm.assume(fuzzedOrderInputs.royaltyReceiver.balance == 0);
        vm.assume(vm.addr(fuzzedOrderInputs.sellerKey).balance == 0);
        vm.assume(vm.addr(fuzzedOrderInputs.buyerKey).balance == 0);
    }

    function _scrubFuzzedOrderInputs(
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) internal view {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);

        address[] memory exclusionList = new address[](13);
        exclusionList[0] = alice;
        exclusionList[1] = bob;
        exclusionList[2] = cal;
        exclusionList[3] = abe;
        exclusionList[4] = benchmarkBeneficiary;
        exclusionList[5] = cosigner;
        exclusionList[6] = benchmarkFeeRecipient;
        exclusionList[7] = vm.addr(fuzzedOrderInputs.sellerKey);
        exclusionList[8] = vm.addr(fuzzedOrderInputs.buyerKey);
        exclusionList[9] = vm.addr(fuzzedOrderInputs.cosignerKey);
        exclusionList[10] = fuzzedOrderInputs.beneficiary;
        exclusionList[11] = fuzzedOrderInputs.marketplace;
        exclusionList[12] = fuzzedOrderInputs.royaltyReceiver;

        _sanitizeAddress(fuzzedFeeOnTop.receiver, exclusionList);
        vm.assume(fuzzedFeeOnTop.receiver.balance == 0);

        vm.assume(10000 >= fuzzedFeeOnTop.rate);

        uint256 feeAmount = uint256(fuzzedOrderInputs.itemPrice) * fuzzedFeeOnTop.rate / 10000;

        vm.assume(uint256(fuzzedOrderInputs.itemPrice) + feeAmount < type(uint128).max);
    }

    function _verifyExpectedTradeStateChanges(address buyer, Order memory order, FuzzedOrder721 memory fuzzedOrderInputs) internal {
        address seller = vm.addr(fuzzedOrderInputs.sellerKey);
        uint256 expectedRoyalty = uint256(fuzzedOrderInputs.itemPrice) * fuzzedOrderInputs.royaltyFeeRate / FEE_DENOMINATOR;
        uint256 expectedMarketplaceFee = uint256(fuzzedOrderInputs.itemPrice) * fuzzedOrderInputs.marketplaceFeeRate / FEE_DENOMINATOR;
        uint256 expectedSellerProceeds = fuzzedOrderInputs.itemPrice - expectedRoyalty - expectedMarketplaceFee;
        uint256 expectedBuyerBalance = 0;

        if (order.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            assertEq(test721.ownerOf(fuzzedOrderInputs.tokenId), fuzzedOrderInputs.beneficiary);
        } else if (order.protocol == OrderProtocols.ERC1155_FILL_OR_KILL) {
            assertEq(test1155.balanceOf(fuzzedOrderInputs.beneficiary, fuzzedOrderInputs.tokenId), order.amount);
        } else if (order.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            assertEq(test1155.balanceOf(fuzzedOrderInputs.beneficiary, fuzzedOrderInputs.tokenId), order.requestedFillAmount);

            uint256 unitPrice = order.itemPrice / order.amount;
            uint256 adjustedPrice = unitPrice * order.requestedFillAmount;

            expectedRoyalty = uint256(adjustedPrice) * fuzzedOrderInputs.royaltyFeeRate / FEE_DENOMINATOR;
            expectedMarketplaceFee = uint256(adjustedPrice) * fuzzedOrderInputs.marketplaceFeeRate / FEE_DENOMINATOR;
            expectedSellerProceeds = adjustedPrice - expectedRoyalty - expectedMarketplaceFee;
            expectedBuyerBalance = order.itemPrice - adjustedPrice;
        } 

        if (order.paymentMethod == address(0)) {
            assertEq(buyer.balance, expectedBuyerBalance);
            assertEq(seller.balance, expectedSellerProceeds);
            assertEq(fuzzedOrderInputs.royaltyReceiver.balance, expectedRoyalty);
            assertEq(fuzzedOrderInputs.marketplace.balance, expectedMarketplaceFee);
        } else {
            assertEq(IERC20(order.paymentMethod).balanceOf(buyer), expectedBuyerBalance);
            assertEq(IERC20(order.paymentMethod).balanceOf(seller), expectedSellerProceeds);
            assertEq(IERC20(order.paymentMethod).balanceOf(fuzzedOrderInputs.royaltyReceiver), expectedRoyalty);
            assertEq(IERC20(order.paymentMethod).balanceOf(fuzzedOrderInputs.marketplace), expectedMarketplaceFee);
        }
    }

    function _verifyExpectedTradeStateChanges(
        address buyer, 
        Order memory order, 
        FuzzedOrder721 memory fuzzedOrderInputs, 
        FeeOnTop memory feeOnTop
    ) internal {
        _verifyExpectedTradeStateChanges(buyer, order, fuzzedOrderInputs);

        if (feeOnTop.recipient != address(0)) {
            if (order.paymentMethod == address(0)) {
                assertEq(feeOnTop.recipient.balance, feeOnTop.amount);
            } else {
                assertEq(IERC20(order.paymentMethod).balanceOf(feeOnTop.recipient), feeOnTop.amount);
            }
        }
    }

    function _getFeeOnTop(
        uint256 totalSalePrice, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) internal pure returns (FeeOnTop memory feeOnTop) {
        feeOnTop = FeeOnTop({
            amount: totalSalePrice * fuzzedFeeOnTop.rate / 10_000,
            recipient: fuzzedFeeOnTop.receiver
        });

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    }
}