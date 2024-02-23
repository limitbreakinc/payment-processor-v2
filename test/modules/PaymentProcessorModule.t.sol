pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/interfaces/IPaymentProcessorEvents.sol";
import "src/Constants.sol";
import "src/PaymentProcessor.sol";
import "src/PaymentProcessorConfiguration.sol";
import "src/PaymentProcessorEncoder.sol";
import "src/modules/ModulePaymentSettings.sol";
import "src/modules/ModuleOnChainCancellation.sol";
import "src/modules/ModuleTrades.sol";
import "src/modules/ModuleTradesAdvanced.sol";

import "../mocks/ContractMock.sol";
import "../mocks/SeaportTestERC20.sol";
import "../mocks/SeaportTestERC721.sol";
import "../mocks/SeaportTestERC721Without2981.sol";
import "../mocks/SeaportTestERC1155.sol";
import "../mocks/SeaportTestERC1155Without2981.sol";
import "../mocks/WNative.sol";

import {TrustedForwarder} from "@limitbreak/trusted-forwarder/TrustedForwarder.sol";
import {TrustedForwarderFactory} from "@limitbreak/trusted-forwarder/TrustedForwarderFactory.sol";

contract PaymentProcessorModuleTest is Test, IPaymentProcessorEvents {

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

    struct TestTradeSingleItemParams {
        uint8 paymentSettings;
        OrderProtocols orderProtocol;
        bool cosigned;
        bool isCosignatureEmpty;
        address paymentMethod;
        uint248 amount;
        uint248 fillAmount;
        FuzzedOrder721 fuzzedOrderInputs;
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

    PaymentProcessorConfiguration public _paymentProcessorConfiguration;
    PaymentProcessor public _paymentProcessor;
    PaymentProcessorEncoder public _paymentProcessorEncoder;

    WNative public nativeWrapper;

    SeaportTestERC20 public weth;
    SeaportTestERC20 public usdc;
    SeaportTestERC20 public usdt;
    SeaportTestERC20 public dai;
    SeaportTestERC20 public memecoin;

    SeaportTestERC721 public test721;
    SeaportTestERC1155 public test1155;
    SeaportTestERC721Without2981 public test721Without2981;
    SeaportTestERC1155Without2981 public test1155Without2981;

    SeaportTestERC20[] erc20s;
    SeaportTestERC721[] erc721s;
    SeaportTestERC1155[] erc1155s;

    TrustedForwarderFactory public factory;
    address public forwarderImplementation;
    TrustedForwarder public forwarder;

    PaymentProcessorModule public modulePaymentSettings;
    PaymentProcessorModule public moduleOnChainCancellation;
    PaymentProcessorModule public moduleTrades;
    PaymentProcessorModule public moduleTradesAdvanced;

    uint32 public customPaymentMethodWhitelistId;

    mapping (address => uint256) internal _nextAvailableTokenId;
    mapping (address => uint256) internal _nonces;

    function setUp() public virtual {
        nativeWrapper = new WNative();
        weth = new SeaportTestERC20();
        usdc = new SeaportTestERC20();
        usdt = new SeaportTestERC20();
        dai = new SeaportTestERC20();
        memecoin = new SeaportTestERC20();

        erc20s = [weth, usdc, usdt, dai, memecoin];

        test721 = new SeaportTestERC721();
        test721Without2981 = new SeaportTestERC721Without2981();

        erc721s = [test721];

        test1155 = new SeaportTestERC1155();
        test1155Without2981 = new SeaportTestERC1155Without2981();

        erc1155s = [test1155];

        _paymentProcessorConfiguration = new PaymentProcessorConfiguration(address(this));

        forwarderImplementation = address(new TrustedForwarder());
        TrustedForwarder(forwarderImplementation).__TrustedForwarder_init(address(this), address(this));

        factory = new TrustedForwarderFactory(forwarderImplementation);

        _paymentProcessorEncoder = new PaymentProcessorEncoder();

        _paymentProcessorConfiguration.setPaymentProcessorModuleConfiguration(
            8000,
            address(factory),
            address(nativeWrapper),
            address(weth),
            address(usdc),
            address(usdt),
            address(dai)
        );

        modulePaymentSettings = new ModulePaymentSettings(address(_paymentProcessorConfiguration));
        moduleOnChainCancellation = new ModuleOnChainCancellation(address(_paymentProcessorConfiguration));
        moduleTrades = new ModuleTrades(address(_paymentProcessorConfiguration));
        moduleTradesAdvanced = new ModuleTradesAdvanced(address(_paymentProcessorConfiguration));

        _paymentProcessorConfiguration.setPaymentProcessorConfiguration(
            address(this),
            address(modulePaymentSettings),
            address(moduleOnChainCancellation),
            address(moduleTrades),
            address(moduleTradesAdvanced)
        );

        _paymentProcessor = new PaymentProcessor(address(_paymentProcessorConfiguration));

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

        bytes memory createWhitelistData = _paymentProcessorEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_paymentProcessor), "Test Whitelist");
        customPaymentMethodWhitelistId = _paymentProcessor.createPaymentMethodWhitelist(createWhitelistData);

        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), customPaymentMethodWhitelistId, address(0)));
        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), customPaymentMethodWhitelistId, address(weth)));
        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), customPaymentMethodWhitelistId, address(usdc)));
        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), customPaymentMethodWhitelistId, address(usdt)));
        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), customPaymentMethodWhitelistId, address(dai)));
    }

    /**
     * @dev allocate amount of each token, 1 of each 721, and 1, 5, and 10 of respective 1155s
     */
    function _allocateTokensAndApprovals(address _to, uint256 _amount) internal {
        vm.deal(_to, _amount);
        for (uint256 i = 0; i < erc20s.length; ++i) {
            erc20s[i].mint(_to, _amount);
        }
        _setApprovals(_to);
    }

    function _setApprovals(address _owner) internal virtual {
        vm.startPrank(_owner);
        for (uint256 i = 0; i < erc20s.length; ++i) {
            erc20s[i].approve(address(_paymentProcessor), MAX_INT);
        }
        for (uint256 i = 0; i < erc721s.length; ++i) {
            erc721s[i].setApprovalForAll(address(_paymentProcessor), true);
        }
        for (uint256 i = 0; i < erc1155s.length; ++i) {
            erc1155s[i].setApprovalForAll(address(_paymentProcessor), true);
        }
        test721Without2981.setApprovalForAll(address(_paymentProcessor), true);
        test1155Without2981.setApprovalForAll(address(_paymentProcessor), true);
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
        (SignatureECDSA memory signedListing,) = _getSignedSaleApprovalAndDigest(sellerKey_, saleDetails);
        return signedListing;
    }

    function _getSignedSaleApprovalAndDigest(uint256 sellerKey_, Order memory saleDetails) internal view returns (SignatureECDSA memory, bytes32 digest) {
        digest = 
            ECDSA.toTypedDataHash(
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            SALE_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            address(0),
                            saleDetails.maker,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress,
                            saleDetails.tokenId
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            saleDetails.nonce,
                            _paymentProcessor.masterNonces(saleDetails.maker)
                        )
                    )
                )
            );
    
        (uint8 listingV, bytes32 listingR, bytes32 listingS) = vm.sign(sellerKey_, digest);
        SignatureECDSA memory signedListing = SignatureECDSA({v: listingV, r: listingR, s: listingS});
    
        return (signedListing, digest);
    }

    function _getCosignature(uint256 cosignerKey_, SignatureECDSA memory signature, uint256 cosignatureExpiration, address cosignatureTaker) internal view returns (Cosignature memory) {
        bytes32 cosignatureDigest = 
            ECDSA.toTypedDataHash(
                _paymentProcessor.getDomainSeparator(), 
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            SALE_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress,
                            saleDetails.tokenId
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.maxRoyaltyFeeNumerator,
                            saleDetails.nonce,
                            _paymentProcessor.masterNonces(saleDetails.maker)
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            ITEM_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
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
                            _paymentProcessor.masterNonces(saleDetails.maker)
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            COLLECTION_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.nonce,
                            _paymentProcessor.masterNonces(saleDetails.maker)
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            TOKEN_SET_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            vm.addr(cosignerKey_),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.nonce,
                            _paymentProcessor.masterNonces(saleDetails.maker),
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            ITEM_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            address(0),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
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
                            _paymentProcessor.masterNonces(saleDetails.maker)
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            COLLECTION_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            address(0),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.nonce,
                            _paymentProcessor.masterNonces(saleDetails.maker)
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
                _paymentProcessor.getDomainSeparator(), 
                keccak256(
                    bytes.concat(
                        abi.encode(
                            TOKEN_SET_OFFER_APPROVAL_HASH,
                            uint8(saleDetails.protocol),
                            address(0),
                            saleDetails.maker,
                            saleDetails.beneficiary,
                            saleDetails.marketplace,
                            saleDetails.fallbackRoyaltyRecipient,
                            saleDetails.paymentMethod,
                            saleDetails.tokenAddress
                        ),
                        abi.encode(
                            saleDetails.amount,
                            saleDetails.itemPrice,
                            saleDetails.expiration,
                            saleDetails.marketplaceFeeNumerator,
                            saleDetails.nonce,
                            _paymentProcessor.masterNonces(saleDetails.maker),
                            tokenSetProof.rootHash
                        )
                    )
                )
            );
    
        (uint8 offerV, bytes32 offerR, bytes32 offerS) = vm.sign(buyerKey_, offerDigest);
        SignatureECDSA memory signedOffer = SignatureECDSA({v: offerV, r: offerR, s: offerS});
    
        return signedOffer;
    }

    function _reassignOwnershipOfPaymentMethodWhitelist(address caller, uint32 id, address newOwner, bytes4 expectedRevertSelector) internal {
        bytes memory data = _paymentProcessorEncoder.encodeReassignOwnershipOfPaymentMethodWhitelistCalldata(address(_paymentProcessor), id, newOwner);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        } else {
            vm.expectEmit(true, true, false, false);
            emit ReassignedPaymentMethodWhitelistOwnership(id, newOwner);
        }

        vm.startPrank(caller, caller);
        _paymentProcessor.reassignOwnershipOfPaymentMethodWhitelist(data);
        vm.stopPrank();
    }

    function _renounceOwnershipOfPaymentMethodWhitelist(address caller, uint32 id, bytes4 expectedRevertSelector) internal {
        bytes memory data = _paymentProcessorEncoder.encodeRenounceOwnershipOfPaymentMethodWhitelistCalldata(address(_paymentProcessor), id);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        } else {
            vm.expectEmit(true, true, false, false);
            emit ReassignedPaymentMethodWhitelistOwnership(id, address(0));
        }

        vm.startPrank(caller, caller);
        _paymentProcessor.renounceOwnershipOfPaymentMethodWhitelist(data);
        vm.stopPrank();
    }

    function _destroyCosigner(address caller, uint160 cosignerKey, bytes4 expectedRevertSelector) internal {
        vm.assume(cosignerKey > 0 && cosignerKey < type(uint160).max);
        address cosignerAddr = vm.addr(cosignerKey);
        (uint8 v, bytes32 r, bytes32 s) =
            vm.sign(cosignerKey, ECDSA.toEthSignedMessageHash(bytes(COSIGNER_SELF_DESTRUCT_MESSAGE_TO_SIGN)));

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeDestroyCosignerCalldata(
                address(_paymentProcessor), 
                cosignerAddr,
                SignatureECDSA({v: v, r: r, s: s}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        } else {
            vm.expectEmit(true, false, false, false);
            emit DestroyedCosigner(cosignerAddr);
        }

        vm.prank(caller, caller);
        _paymentProcessor.destroyCosigner(fnCalldata);
    }

    function _revokeMasterNonce(address caller, uint256 previousMasterNonce, bytes4 expectedRevertSelector) internal {
        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        } else {
            vm.expectEmit(true, false, false, true);
            emit MasterNonceInvalidated(caller, previousMasterNonce);
        }

        vm.prank(caller, caller);
        _paymentProcessor.revokeMasterNonce();
    }

    function _revokeMasterNonce(address channel, address caller, uint256 previousMasterNonce, bytes4 expectedRevertSelector) internal {
        if(expectedRevertSelector == bytes4(0x00000000)) {
            vm.expectEmit(true, false, false, true);
            emit MasterNonceInvalidated(caller, previousMasterNonce);
        }

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.revokeMasterNonce.selector, "", expectedRevertSelector);
    }

    function _revokeSingleNonce(address caller, uint256 nonce, bytes4 expectedRevertSelector) internal {
        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeRevokeSingleNonceCalldata(
                address(_paymentProcessor), 
                nonce);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        } else {
            vm.expectEmit(true, true, false, true);
            emit NonceInvalidated(nonce, caller, true);
        }

        vm.prank(caller, caller);
        _paymentProcessor.revokeSingleNonce(fnCalldata);
    }

    function _revokeSingleNonce(address channel, address caller, uint256 nonce, bytes4 expectedRevertSelector) internal {
        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeRevokeSingleNonceCalldata(
                address(_paymentProcessor), 
                nonce);

        if(expectedRevertSelector == bytes4(0x00000000)) {
            vm.expectEmit(true, true, false, true);
            emit NonceInvalidated(nonce, caller, true);
        }

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.revokeSingleNonce.selector, fnCalldata, expectedRevertSelector);
    }

    function _revokeOrderDigest(address caller, bytes32 digest, bytes4 expectedRevertSelector) internal {
        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeRevokeOrderDigestCalldata(
                address(_paymentProcessor), 
                digest);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.revokeOrderDigest(fnCalldata);
    }

    function _revokeOrderDigest(address channel, address caller, bytes32 digest, bytes4 expectedRevertSelector) internal {
        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeRevokeOrderDigestCalldata(
                address(_paymentProcessor), 
                digest);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.revokeOrderDigest.selector, fnCalldata, expectedRevertSelector);
    }

    // TODO: Start

    function _buyCosignedListing(address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory sellerSignature, Cosignature memory cosignature) = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buyEmptyCosignedListing(address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buySignedListing(address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buyCosignedListingWithFeeOnTop(address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory sellerSignature, Cosignature memory cosignature) = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + feeOnTop.amount;
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buyEmptyCosignedListingWithFeeOnTop(address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + feeOnTop.amount;
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _buySignedListingWithFeeOnTop(address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + feeOnTop.amount;
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.buyListing{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyCosignedListings(address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignatureArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyCosignedListingsWithFeesOnTop(address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignatureArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + feesOnTop[i].amount;
            }
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyEmptyCosignedListingsWithFeesOnTop(address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatureArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + feesOnTop[i].amount;
            }
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuyEmptyCosignedListings(address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatureArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepSignedListings(address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop memory feeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignatures);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepSignedListingsWithFeeOnTop(address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        if (saleDetailsArray[0].paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignatures);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepCosignedListings(address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        FeeOnTop memory feeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignaturesArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepEmptyCosignedListings(address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        FeeOnTop memory feeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepCosignedListingsWithFeeOnTop(address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
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
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _sweepEmptyCosignedListingsWithFeeOnTop(address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
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
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.sweepCollection{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuySignedListings(address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _bulkBuySignedListingsWithFeeOnTop(address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + feesOnTop[i].amount;
            }
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkBuyListings{value: nativePaymentValue}(fnCalldata);
    }

    function _acceptCosignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptEmptyCosignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptEmptyCosignedItemOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptSignedItemOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptCosignedItemOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptSignedItemOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptCosignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptEmptyCosignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptEmptyCosignedCollectionOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptSignedCollectionOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptCosignedCollectionOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptSignedCollectionOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptCosignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptEmptyCosignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptEmptyCosignedTokenSetOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptSignedTokenSetOffer(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptCosignedTokenSetOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _acceptSignedTokenSetOfferWithFeeOnTop(address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }
    
        vm.prank(caller, caller);
        _paymentProcessor.acceptOffer(fnCalldata);
    }

    function _bulkAcceptCosignedItemOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedItemOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedItemOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedItemOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptCosignedCollectionOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedCollectionOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedCollectionOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedCollectionOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptCosignedTokenSetOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], tokenSetProofsArray[i], caller);
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptEmptyCosignedTokenSetOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
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
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedTokenSetOffers(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    function _bulkAcceptSignedTokenSetOffersWithFeesOnTop(address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        _paymentProcessor.bulkAcceptOffers(fnCalldata);
    }

    // TODO: End

    // TODO: Start - Forwarded

    function _forwardCall(address channel, address caller, address target, uint256 value, bytes4 selector, bytes memory message, bytes4 expectedRevertSelector) internal {
        bytes memory messageData = abi.encodeWithSelector(selector, message);

        if(expectedRevertSelector != bytes4(0x00000000)) {
            vm.expectRevert(expectedRevertSelector);
        }

        vm.prank(caller, caller);
        TrustedForwarder(channel).forwardCall{value: value}(target, messageData);
    }

    function _buyCosignedListing(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory sellerSignature, Cosignature memory cosignature) = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.buyListing.selector, fnCalldata, expectedRevertSelector);
    }

    function _buyEmptyCosignedListing(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.buyListing.selector, fnCalldata, expectedRevertSelector);
    }

    function _buySignedListing(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.buyListing.selector, fnCalldata, expectedRevertSelector);
    }

    function _buyCosignedListingWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory sellerSignature, Cosignature memory cosignature) = _getCosignedSaleApproval(fuzzedOrderInputs.sellerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + feeOnTop.amount;
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.buyListing.selector, fnCalldata, expectedRevertSelector);
    }

    function _buyEmptyCosignedListingWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + feeOnTop.amount;
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.buyListing.selector, fnCalldata, expectedRevertSelector);
    }

    function _buySignedListingWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory sellerSignature = _getSignedSaleApproval(fuzzedOrderInputs.sellerKey, saleDetails);

        if (saleDetails.paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + feeOnTop.amount;
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBuyListingCalldata(
                address(_paymentProcessor), 
                saleDetails, 
                sellerSignature,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.buyListing.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkBuyCosignedListings(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignatureArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.bulkBuyListings.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkBuyCosignedListingsWithFeesOnTop(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignatureArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + feesOnTop[i].amount;
            }
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.bulkBuyListings.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkBuyEmptyCosignedListingsWithFeesOnTop(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatureArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + feesOnTop[i].amount;
            }
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.bulkBuyListings.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkBuyEmptyCosignedListings(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatureArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatureArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatureArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.bulkBuyListings.selector, fnCalldata, expectedRevertSelector);
    }

    function _sweepSignedListings(address channel, address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop memory feeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignatures);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.sweepCollection.selector, fnCalldata, expectedRevertSelector);
    }

    function _sweepSignedListingsWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        if (saleDetailsArray[0].paymentMethod == address(0)) {
            nativePaymentValue = nativePaymentValue + uint128(feeOnTop.amount);
        }

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
                tokenId: saleDetailsArray[i].tokenId,
                amount: saleDetailsArray[i].amount,
                itemPrice: saleDetailsArray[i].itemPrice,
                nonce: saleDetailsArray[i].nonce,
                expiration: saleDetailsArray[i].expiration,
                marketplaceFeeNumerator: saleDetailsArray[i].marketplaceFeeNumerator,
                maxRoyaltyFeeNumerator: saleDetailsArray[i].maxRoyaltyFeeNumerator
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignatures);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.sweepCollection.selector, fnCalldata, expectedRevertSelector);
    }

    function _sweepCosignedListings(address channel, address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        FeeOnTop memory feeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            (sellerSignaturesArray[i], cosignaturesArray[i]) = _getCosignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.sweepCollection.selector, fnCalldata, expectedRevertSelector);
    }

    function _sweepEmptyCosignedListings(address channel, address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignaturesArray = new Cosignature[](saleDetailsArray.length);
        SweepItem[] memory sweepItems = new SweepItem[](saleDetailsArray.length);
        FeeOnTop memory feeOnTop = FeeOnTop({recipient: address(0), amount: 0});

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            sweepItems[i] = SweepItem({
                maker: saleDetailsArray[i].maker,
                marketplace: saleDetailsArray[i].marketplace,
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.sweepCollection.selector, fnCalldata, expectedRevertSelector);
    }

    function _sweepCosignedListingsWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
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
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.sweepCollection.selector, fnCalldata, expectedRevertSelector);
    }

    function _sweepEmptyCosignedListingsWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, SweepOrder memory sweepOrder, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
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
                fallbackRoyaltyRecipient: saleDetailsArray[i].fallbackRoyaltyRecipient,
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
            _paymentProcessorEncoder.encodeSweepCollectionCalldata(
                address(_paymentProcessor), 
                feeOnTop,
                sweepOrder,
                sweepItems, 
                sellerSignaturesArray,
                cosignaturesArray);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.sweepCollection.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkBuySignedListings(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.bulkBuyListings.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkBuySignedListingsWithFeeOnTop(address channel, address caller, uint256 nativePaymentValue, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA[] memory sellerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            sellerSignaturesArray[i] = _getSignedSaleApproval(fuzzedOrderInputsArray[i].sellerKey, saleDetailsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

            if (saleDetailsArray[i].paymentMethod == address(0)) {
                nativePaymentValue = nativePaymentValue + feesOnTop[i].amount;
            }
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkBuyListingsCalldata(
                address(_paymentProcessor), 
                saleDetailsArray, 
                sellerSignaturesArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), nativePaymentValue, _paymentProcessor.bulkBuyListings.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptCosignedItemOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptEmptyCosignedItemOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptEmptyCosignedItemOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptSignedItemOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptCosignedItemOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedItemOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptSignedItemOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedItemOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                false,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptCosignedCollectionOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptEmptyCosignedCollectionOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptEmptyCosignedCollectionOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptSignedCollectionOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptCosignedCollectionOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedCollectionOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptSignedCollectionOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedCollectionOffer(fuzzedOrderInputs.buyerKey, saleDetails);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                TokenSetProof({
                    rootHash: bytes32(0),
                    proof: new bytes32[](0)
                }),
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptCosignedTokenSetOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptEmptyCosignedTokenSetOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptEmptyCosignedTokenSetOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);
        Cosignature memory cosignature = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptSignedTokenSetOffer(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                FeeOnTop({recipient: address(0), amount: 0}));

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptCosignedTokenSetOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        (SignatureECDSA memory buyerSignature, Cosignature memory cosignature) = _getCosignedTokenSetOffer(fuzzedOrderInputs.buyerKey, fuzzedOrderInputs.cosignerKey, saleDetails, tokenSetProof, caller);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                cosignature,
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _acceptSignedTokenSetOfferWithFeeOnTop(address channel, address caller, FuzzedOrder721 memory fuzzedOrderInputs, Order memory saleDetails, TokenSetProof memory tokenSetProof, FeeOnTop memory feeOnTop, bytes4 expectedRevertSelector) internal {
        SignatureECDSA memory buyerSignature = _getSignedTokenSetOffer(fuzzedOrderInputs.buyerKey, saleDetails, tokenSetProof);

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeAcceptOfferCalldata(
                address(_paymentProcessor), 
                true,
                saleDetails, 
                buyerSignature,
                tokenSetProof,
                Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)}),
                feeOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.acceptOffer.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptCosignedItemOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptEmptyCosignedItemOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptCosignedItemOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptEmptyCosignedItemOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptSignedItemOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptSignedItemOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = false;
            buyerSignaturesArray[i] = _getSignedItemOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptCosignedCollectionOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], caller);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptCosignedCollectionOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptEmptyCosignedCollectionOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptEmptyCosignedCollectionOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
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
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptSignedCollectionOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptSignedCollectionOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        TokenSetProof[] memory tokenSetProofsArray = new TokenSetProof[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedCollectionOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i]);
            tokenSetProofsArray[i] = TokenSetProof({
                rootHash: bytes32(0),
                proof: new bytes32[](0)
            });
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptCosignedTokenSetOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], tokenSetProofsArray[i], caller);
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptCosignedTokenSetOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            (buyerSignaturesArray[i], cosignerSignaturesArray[i]) = _getCosignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, fuzzedOrderInputsArray[i].cosignerKey, saleDetailsArray[i], tokenSetProofsArray[i], caller);
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptEmptyCosignedTokenSetOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptEmptyCosignedTokenSetOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignerSignaturesArray = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignerSignaturesArray[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignerSignaturesArray,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptSignedTokenSetOffers(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);
        FeeOnTop[] memory feesOnTop = new FeeOnTop[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
            feesOnTop[i] = FeeOnTop({recipient: address(0), amount: 0});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    function _bulkAcceptSignedTokenSetOffersWithFeesOnTop(address channel, address caller, FuzzedOrder721[] memory fuzzedOrderInputsArray, Order[] memory saleDetailsArray, TokenSetProof[] memory tokenSetProofsArray, FeeOnTop[] memory feesOnTop, bytes4 expectedRevertSelector) internal {
        bool[] memory isCollectionOfferArray = new bool[](saleDetailsArray.length);
        SignatureECDSA[] memory buyerSignaturesArray = new SignatureECDSA[](saleDetailsArray.length);
        Cosignature[] memory cosignatures = new Cosignature[](saleDetailsArray.length);

        for (uint256 i = 0; i < saleDetailsArray.length; ++i) {
            isCollectionOfferArray[i] = true;
            buyerSignaturesArray[i] = _getSignedTokenSetOffer(fuzzedOrderInputsArray[i].buyerKey, saleDetailsArray[i], tokenSetProofsArray[i]);
            cosignatures[i] = Cosignature({signer: address(0), taker: address(0), expiration: 0, v: 0, r: bytes32(0), s: bytes32(0)});
        }

        bytes memory fnCalldata = 
            _paymentProcessorEncoder.encodeBulkAcceptOffersCalldata(
                address(_paymentProcessor), 
                isCollectionOfferArray,
                saleDetailsArray, 
                buyerSignaturesArray,
                tokenSetProofsArray,
                cosignatures,
                feesOnTop);

        _forwardCall(channel, caller, address(_paymentProcessor), 0, _paymentProcessor.bulkAcceptOffers.selector, fnCalldata, expectedRevertSelector);
    }

    // TODO: End - Forwarded

    function _sanitizeAddress(address addr, address[] memory exclusionList) internal view {
        vm.assume(uint160(addr) > 0xFF);
        vm.assume(addr != address(0));
        vm.assume(addr != address(0x000000000000000000636F6e736F6c652e6c6f67));
        vm.assume(addr != address(0xDDc10602782af652bB913f7bdE1fD82981Db7dd9));
        vm.assume(addr != address(_paymentProcessor));
        vm.assume(addr != address(_paymentProcessorEncoder));
        vm.assume(addr != address(nativeWrapper));
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

        address[] memory exclusionList = new address[](8);
        exclusionList[0] = alice;
        exclusionList[1] = bob;
        exclusionList[2] = cal;
        exclusionList[3] = abe;
        exclusionList[4] = benchmarkBeneficiary;
        exclusionList[5] = cosigner;
        exclusionList[6] = benchmarkFeeRecipient;
        exclusionList[7] = address(nativeWrapper);

        _sanitizeAddress(vm.addr(fuzzedOrderInputs.sellerKey), exclusionList);
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.buyerKey), exclusionList);
        _sanitizeAddress(vm.addr(fuzzedOrderInputs.cosignerKey), exclusionList);
        _sanitizeAddress(fuzzedOrderInputs.beneficiary, exclusionList);
        _sanitizeAddress(fuzzedOrderInputs.marketplace, exclusionList);
        _sanitizeAddress(fuzzedOrderInputs.royaltyReceiver, exclusionList);

        vm.assume(fuzzedOrderInputs.beneficiary != fuzzedOrderInputs.marketplace);
        vm.assume(fuzzedOrderInputs.beneficiary != fuzzedOrderInputs.royaltyReceiver);
        vm.assume(fuzzedOrderInputs.marketplace != fuzzedOrderInputs.royaltyReceiver);
        vm.assume(fuzzedOrderInputs.royaltyReceiver != vm.addr(fuzzedOrderInputs.sellerKey));
        vm.assume(fuzzedOrderInputs.royaltyReceiver != vm.addr(fuzzedOrderInputs.buyerKey));
        vm.assume(fuzzedOrderInputs.marketplace != vm.addr(fuzzedOrderInputs.sellerKey));
        vm.assume(fuzzedOrderInputs.marketplace != vm.addr(fuzzedOrderInputs.buyerKey));
        vm.assume(fuzzedOrderInputs.beneficiary != vm.addr(fuzzedOrderInputs.sellerKey));
        vm.assume(fuzzedOrderInputs.beneficiary != vm.addr(fuzzedOrderInputs.buyerKey));
        
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

        address[] memory exclusionList = new address[](14);
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
        exclusionList[13] = address(nativeWrapper);

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
            assertEq(IERC721(order.tokenAddress).ownerOf(fuzzedOrderInputs.tokenId), fuzzedOrderInputs.beneficiary);
        } else if (order.protocol == OrderProtocols.ERC1155_FILL_OR_KILL) {
            assertEq(IERC1155(order.tokenAddress).balanceOf(fuzzedOrderInputs.beneficiary, fuzzedOrderInputs.tokenId), order.amount);
        } else if (order.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            assertEq(IERC1155(order.tokenAddress).balanceOf(fuzzedOrderInputs.beneficiary, fuzzedOrderInputs.tokenId), order.requestedFillAmount);

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

    function _getExpectedBeneficiaryBalance1155(Order memory order) private returns (uint256 expectedBalance1155) {
        if (order.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            return 0;
        } else if (order.protocol == OrderProtocols.ERC1155_FILL_OR_KILL) {
            return order.amount;
        } else if (order.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            return order.requestedFillAmount;
        }
        return 0;
    }

    function _verifyExpectedTradeStateChanges(
        address buyer, 
        Order memory order1, 
        Order memory order2, 
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2) internal {
        if (order1.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            assertEq(test721.ownerOf(order1.tokenId), order1.beneficiary);
        }

        if (order2.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            assertEq(test721.ownerOf(order2.tokenId), order2.beneficiary);
        }

        assertEq(test1155.balanceOf(order1.beneficiary, order1.tokenId), _getExpectedBeneficiaryBalance1155(order1));
        assertEq(test1155.balanceOf(order2.beneficiary, order2.tokenId), _getExpectedBeneficiaryBalance1155(order2));

        uint256 expectedRoyalty1 = order1.itemPrice * order1.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedMarketplaceFee1 = order1.itemPrice * order1.marketplaceFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedSellerProceeds1 = order1.itemPrice - expectedRoyalty1 - expectedMarketplaceFee1;

        if (order1.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            uint256 unitPrice = order1.itemPrice / order1.amount;
            uint256 adjustedPrice = unitPrice * order1.requestedFillAmount;
    
            expectedRoyalty1 = adjustedPrice * order1.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
            expectedMarketplaceFee1 = adjustedPrice * order1.marketplaceFeeNumerator / FEE_DENOMINATOR;
            expectedSellerProceeds1 = adjustedPrice - expectedRoyalty1 - expectedMarketplaceFee1;
        }

        uint256 expectedRoyalty2 = order2.itemPrice * order2.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedMarketplaceFee2 = order2.itemPrice * order2.marketplaceFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedSellerProceeds2 = order2.itemPrice - expectedRoyalty2 - expectedMarketplaceFee2;

        if (order2.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            uint256 unitPrice = order2.itemPrice / order2.amount;
            uint256 adjustedPrice = unitPrice * order2.requestedFillAmount;
    
            expectedRoyalty2 = adjustedPrice * order2.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
            expectedMarketplaceFee2 = adjustedPrice * order2.marketplaceFeeNumerator / FEE_DENOMINATOR;
            expectedSellerProceeds2 = adjustedPrice - expectedRoyalty2 - expectedMarketplaceFee2;
        }

        if (fuzzedOrderInputs1.royaltyReceiver != fuzzedOrderInputs2.royaltyReceiver) {
            if (order1.paymentMethod == address(0)) {
                assertEq(fuzzedOrderInputs1.royaltyReceiver.balance, expectedRoyalty1);
            } else {
                 assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.royaltyReceiver), expectedRoyalty1);
            }

            if (order2.paymentMethod == address(0)) {
                assertEq(fuzzedOrderInputs2.royaltyReceiver.balance, expectedRoyalty2);
            } else {
                 assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.royaltyReceiver), expectedRoyalty2);
            }
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                if (order1.paymentMethod == address(0)) {
                    assertEq(fuzzedOrderInputs1.royaltyReceiver.balance, expectedRoyalty1 + expectedRoyalty2);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.royaltyReceiver), expectedRoyalty1 + expectedRoyalty2);
                }
            } else {
                if (order1.paymentMethod == address(0)) {
                    assertEq(fuzzedOrderInputs1.royaltyReceiver.balance, expectedRoyalty1);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.royaltyReceiver), expectedRoyalty1);
                }

                if (order2.paymentMethod == address(0)) {
                    assertEq(fuzzedOrderInputs2.royaltyReceiver.balance, expectedRoyalty2);
                } else {
                    assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.royaltyReceiver), expectedRoyalty2);
                }
            }
        }

        if (fuzzedOrderInputs1.marketplace != fuzzedOrderInputs2.marketplace) {
            if (order1.paymentMethod == address(0)) {
                assertEq(fuzzedOrderInputs1.marketplace.balance, expectedMarketplaceFee1);
            } else {
                 assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.marketplace), expectedMarketplaceFee1);
            }

            if (order2.paymentMethod == address(0)) {
                assertEq(fuzzedOrderInputs2.marketplace.balance, expectedMarketplaceFee2);
            } else {
                 assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.marketplace), expectedMarketplaceFee2);
            }
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                if (order1.paymentMethod == address(0)) {
                    assertEq(fuzzedOrderInputs1.marketplace.balance, expectedMarketplaceFee1 + expectedMarketplaceFee2);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.marketplace), expectedMarketplaceFee1 + expectedMarketplaceFee2);
                }
            } else {
                if (order1.paymentMethod == address(0)) {
                    assertEq(fuzzedOrderInputs1.marketplace.balance, expectedMarketplaceFee1);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.marketplace), expectedMarketplaceFee1);
                }

                if (order2.paymentMethod == address(0)) {
                    assertEq(fuzzedOrderInputs2.marketplace.balance, expectedMarketplaceFee2);
                } else {
                    assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.marketplace), expectedMarketplaceFee2);
                }
            }
        }

        if (fuzzedOrderInputs1.sellerKey != fuzzedOrderInputs2.sellerKey) {
            if (order1.paymentMethod == address(0)) {
                assertEq(vm.addr(fuzzedOrderInputs1.sellerKey).balance, expectedSellerProceeds1);
            } else {
                 assertEq(IERC20(order1.paymentMethod).balanceOf(vm.addr(fuzzedOrderInputs1.sellerKey)), expectedSellerProceeds1);
            }

            if (order2.paymentMethod == address(0)) {
                assertEq(vm.addr(fuzzedOrderInputs2.sellerKey).balance, expectedSellerProceeds2);
            } else {
                 assertEq(IERC20(order2.paymentMethod).balanceOf(vm.addr(fuzzedOrderInputs2.sellerKey)), expectedSellerProceeds2);
            }
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                if (order1.paymentMethod == address(0)) {
                    assertEq(vm.addr(fuzzedOrderInputs1.sellerKey).balance, expectedSellerProceeds1 + expectedSellerProceeds2);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(vm.addr(fuzzedOrderInputs1.sellerKey)), expectedSellerProceeds1 + expectedSellerProceeds2);
                }
            } else {
                if (order1.paymentMethod == address(0)) {
                    assertEq(vm.addr(fuzzedOrderInputs1.sellerKey).balance, expectedSellerProceeds1);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(vm.addr(fuzzedOrderInputs1.sellerKey)), expectedSellerProceeds1);
                }

                if (order2.paymentMethod == address(0)) {
                    assertEq(vm.addr(fuzzedOrderInputs2.sellerKey).balance, expectedSellerProceeds2);
                } else {
                    assertEq(IERC20(order2.paymentMethod).balanceOf(vm.addr(fuzzedOrderInputs2.sellerKey)), expectedSellerProceeds2);
                }
            }
        }
    }

    function _verifyExpectedTradeStateChanges(
        address buyer, 
        Order memory order1, 
        Order memory order2, 
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2,
        FeeOnTop memory feeOnTop1,
        FeeOnTop memory feeOnTop2) internal {
        _verifyExpectedTradeStateChanges(buyer, order1, order2, fuzzedOrderInputs1, fuzzedOrderInputs2);

        if (feeOnTop1.recipient != feeOnTop2.recipient) {
            if (order1.paymentMethod == address(0)) {
                assertEq(feeOnTop1.recipient.balance, feeOnTop1.amount);
            } else {
                 assertEq(IERC20(order1.paymentMethod).balanceOf(feeOnTop1.recipient), feeOnTop1.amount);
            }

            if (order2.paymentMethod == address(0)) {
                assertEq(feeOnTop2.recipient.balance, feeOnTop2.amount);
            } else {
                 assertEq(IERC20(order2.paymentMethod).balanceOf(feeOnTop2.recipient), feeOnTop2.amount);
            }
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                if (order1.paymentMethod == address(0)) {
                    assertEq(feeOnTop1.recipient.balance, feeOnTop1.amount + feeOnTop2.amount);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(feeOnTop1.recipient), feeOnTop1.amount + feeOnTop2.amount);
                }
            } else {
                if (order1.paymentMethod == address(0)) {
                    assertEq(feeOnTop1.recipient.balance, feeOnTop1.amount);
                } else {
                    assertEq(IERC20(order1.paymentMethod).balanceOf(feeOnTop1.recipient), feeOnTop1.amount);
                }

                if (order2.paymentMethod == address(0)) {
                    assertEq(feeOnTop2.recipient.balance, feeOnTop2.amount);
                } else {
                    assertEq(IERC20(order2.paymentMethod).balanceOf(feeOnTop2.recipient), feeOnTop2.amount);
                }
            }
        }
    }

    function _verifyExpectedTradeStateChanges(
        Order memory order1, 
        Order memory order2, 
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2) internal {
        if (order1.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            assertEq(test721.ownerOf(order1.tokenId), order1.beneficiary);
        }

        if (order2.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            assertEq(test721.ownerOf(order2.tokenId), order2.beneficiary);
        }

        assertEq(test1155.balanceOf(order1.beneficiary, order1.tokenId), _getExpectedBeneficiaryBalance1155(order1));
        assertEq(test1155.balanceOf(order2.beneficiary, order2.tokenId), _getExpectedBeneficiaryBalance1155(order2));

        uint256 expectedRoyalty1 = order1.itemPrice * order1.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedMarketplaceFee1 = order1.itemPrice * order1.marketplaceFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedSellerProceeds1 = order1.itemPrice - expectedRoyalty1 - expectedMarketplaceFee1;

        if (order1.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            uint256 unitPrice = order1.itemPrice / order1.amount;
            uint256 adjustedPrice = unitPrice * order1.requestedFillAmount;
    
            expectedRoyalty1 = adjustedPrice * order1.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
            expectedMarketplaceFee1 = adjustedPrice * order1.marketplaceFeeNumerator / FEE_DENOMINATOR;
            expectedSellerProceeds1 = adjustedPrice - expectedRoyalty1 - expectedMarketplaceFee1;
        }

        uint256 expectedRoyalty2 = order2.itemPrice * order2.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedMarketplaceFee2 = order2.itemPrice * order2.marketplaceFeeNumerator / FEE_DENOMINATOR;
        uint256 expectedSellerProceeds2 = order2.itemPrice - expectedRoyalty2 - expectedMarketplaceFee2;

        if (order2.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            uint256 unitPrice = order2.itemPrice / order2.amount;
            uint256 adjustedPrice = unitPrice * order2.requestedFillAmount;
    
            expectedRoyalty2 = adjustedPrice * order2.maxRoyaltyFeeNumerator / FEE_DENOMINATOR;
            expectedMarketplaceFee2 = adjustedPrice * order2.marketplaceFeeNumerator / FEE_DENOMINATOR;
            expectedSellerProceeds2 = adjustedPrice - expectedRoyalty2 - expectedMarketplaceFee2;
        }

        if (fuzzedOrderInputs1.royaltyReceiver != fuzzedOrderInputs2.royaltyReceiver) {
            assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.royaltyReceiver), expectedRoyalty1);
            assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.royaltyReceiver), expectedRoyalty2);
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.royaltyReceiver), expectedRoyalty1 + expectedRoyalty2);
            } else {
                assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.royaltyReceiver), expectedRoyalty1);
                assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.royaltyReceiver), expectedRoyalty2);
            }
        }

        if (fuzzedOrderInputs1.marketplace != fuzzedOrderInputs2.marketplace) {
            assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.marketplace), expectedMarketplaceFee1);
            assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.marketplace), expectedMarketplaceFee2);
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.marketplace), expectedMarketplaceFee1 + expectedMarketplaceFee2);
            } else {
                assertEq(IERC20(order1.paymentMethod).balanceOf(fuzzedOrderInputs1.marketplace), expectedMarketplaceFee1);
                assertEq(IERC20(order2.paymentMethod).balanceOf(fuzzedOrderInputs2.marketplace), expectedMarketplaceFee2);
            }
        }

        assertEq(IERC20(order1.paymentMethod).balanceOf(vm.addr(fuzzedOrderInputs1.sellerKey)), expectedSellerProceeds1 + expectedSellerProceeds2);
    }

    function _verifyExpectedTradeStateChanges(
        Order memory order1, 
        Order memory order2, 
        FuzzedOrder721 memory fuzzedOrderInputs1, 
        FuzzedOrder721 memory fuzzedOrderInputs2,
        FeeOnTop memory feeOnTop1,
        FeeOnTop memory feeOnTop2) internal {
        _verifyExpectedTradeStateChanges(order1, order2, fuzzedOrderInputs1, fuzzedOrderInputs2);

        if (feeOnTop1.recipient != feeOnTop2.recipient) {
            assertEq(IERC20(order1.paymentMethod).balanceOf(feeOnTop1.recipient), feeOnTop1.amount);
            assertEq(IERC20(order2.paymentMethod).balanceOf(feeOnTop2.recipient), feeOnTop2.amount);
        } else {
            if (order1.paymentMethod == order2.paymentMethod) {
                assertEq(IERC20(order1.paymentMethod).balanceOf(feeOnTop1.recipient), feeOnTop1.amount + feeOnTop2.amount);
            } else {
                assertEq(IERC20(order1.paymentMethod).balanceOf(feeOnTop1.recipient), feeOnTop1.amount);
                assertEq(IERC20(order2.paymentMethod).balanceOf(feeOnTop2.recipient), feeOnTop2.amount);
            }
        }
    }

    function _getFeeOnTop(
        uint256 totalSalePrice, 
        FuzzedFeeOnTop memory fuzzedFeeOnTop
    ) internal pure returns (FeeOnTop memory feeOnTop) {
        feeOnTop = FeeOnTop({
            amount: totalSalePrice * fuzzedFeeOnTop.rate / 100_00,
            recipient: fuzzedFeeOnTop.receiver
        });

        if (feeOnTop.recipient == address(0)) {
            feeOnTop.amount = 0;
        }

        if (feeOnTop.amount == 0) {
            feeOnTop.recipient = address(0);
        }
    }

    function _banAccount(address token, address account) internal {
        bytes memory data = _paymentProcessorEncoder.encodeAddBannedAccountForCollectionCalldata(
                address(_paymentProcessor), 
                token, 
                account);

        _paymentProcessor.addBannedAccountForCollection(data);
    }

    function _getSetCoollectionPaymentSettingsCalldata(
        address tokenAddress,
        address exclusiveBountyReceiver,
        address royaltyBackfillReceiver,
        CollectionPaymentSettings memory collectionPaymentSettings
    ) internal view returns (bytes memory data) {
        data = _paymentProcessorEncoder.encodeSetCollectionPaymentSettingsCalldata(
            address(_paymentProcessor), 
            tokenAddress, 
            collectionPaymentSettings.paymentSettings, 
            collectionPaymentSettings.paymentMethodWhitelistId, 
            collectionPaymentSettings.constrainedPricingPaymentMethod, 
            collectionPaymentSettings.royaltyBackfillNumerator, 
            royaltyBackfillReceiver, 
            collectionPaymentSettings.royaltyBountyNumerator, 
            exclusiveBountyReceiver,
            _isFlagSet(collectionPaymentSettings.flags, FLAG_BLOCK_TRADES_FROM_UNTRUSTED_CHANNELS),
            _isFlagSet(collectionPaymentSettings.flags, FLAG_BLOCK_BANNED_ACCOUNTS));
    }

    function _pauseCollectionTrading(address tokenAddress) internal {
        CollectionPaymentSettings memory collectionPaymentSettings = 
            _paymentProcessor.collectionPaymentSettings(tokenAddress);

        collectionPaymentSettings.paymentSettings = PaymentSettings.Paused;

        (, address exclusiveBountyReceiver) = 
            _paymentProcessor.collectionBountySettings(tokenAddress);

        (, address royaltyBackfillReceiver) = 
            _paymentProcessor.collectionRoyaltyBackfillSettings(tokenAddress);
        
        vm.startPrank(tokenAddress);
        _paymentProcessor.setCollectionPaymentSettings(
            _getSetCoollectionPaymentSettingsCalldata(
                tokenAddress,
                exclusiveBountyReceiver,
                royaltyBackfillReceiver,
                collectionPaymentSettings
            )
        );
        vm.stopPrank();
    }

    function _setPaymentSettings(
        uint8 paymentSettings,
        uint256 itemPrice,
        address token, 
        address paymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver,
        bool blockTradesFromUntrustedChannels,
        bool blockBannedAccounts
    ) internal {
        paymentSettings = paymentSettings % 4;
        PaymentSettings paymentSettingsEnum = PaymentSettings(paymentSettings);

        if (paymentSettingsEnum == PaymentSettings.DefaultPaymentMethodWhitelist) {
            bytes memory data = _paymentProcessorEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_paymentProcessor), 
                token, 
                PaymentSettings.DefaultPaymentMethodWhitelist, 
                0, 
                paymentMethod, 
                royaltyBackfillNumerator, 
                royaltyBackfillReceiver, 
                royaltyBountyNumerator, 
                exclusiveBountyReceiver,
                blockTradesFromUntrustedChannels,
                blockBannedAccounts);

            _paymentProcessor.setCollectionPaymentSettings(data);
        } else if (paymentSettingsEnum == PaymentSettings.AllowAnyPaymentMethod) {
            bytes memory data = _paymentProcessorEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_paymentProcessor), 
                token, 
                PaymentSettings.AllowAnyPaymentMethod, 
                0, 
                paymentMethod, 
                royaltyBackfillNumerator, 
                royaltyBackfillReceiver, 
                royaltyBountyNumerator, 
                exclusiveBountyReceiver,
                blockTradesFromUntrustedChannels,
                blockBannedAccounts);

            _paymentProcessor.setCollectionPaymentSettings(data);
        } else if (paymentSettingsEnum == PaymentSettings.CustomPaymentMethodWhitelist) {
            bytes memory data = _paymentProcessorEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_paymentProcessor), 
                token, 
                PaymentSettings.CustomPaymentMethodWhitelist, 
                customPaymentMethodWhitelistId, 
                paymentMethod, 
                royaltyBackfillNumerator, 
                royaltyBackfillReceiver, 
                royaltyBountyNumerator, 
                exclusiveBountyReceiver,
                blockTradesFromUntrustedChannels,
                blockBannedAccounts);

            _paymentProcessor.setCollectionPaymentSettings(data);
        } else if (paymentSettingsEnum == PaymentSettings.PricingConstraints) {
            bytes memory data1 = _paymentProcessorEncoder.encodeSetCollectionPaymentSettingsCalldata(
                address(_paymentProcessor), 
                token, 
                PaymentSettings.PricingConstraints, 
                0, 
                paymentMethod, 
                royaltyBackfillNumerator, 
                royaltyBackfillReceiver, 
                royaltyBountyNumerator, 
                exclusiveBountyReceiver,
                blockTradesFromUntrustedChannels,
                blockBannedAccounts);

            bytes memory data2 = _paymentProcessorEncoder.encodeSetCollectionPricingBoundsCalldata(
                address(_paymentProcessor), 
                token, 
                PricingBounds({
                    isSet: true,
                    floorPrice: 1 ether,
                    ceilingPrice: 500 ether
                }));
    
            _paymentProcessor.setCollectionPaymentSettings(data1);
            _paymentProcessor.setCollectionPricingBounds(data2);
        }
    }

    function _isFlagSet(uint8 flagValue, uint8 flag) internal pure returns (bool flagSet) {
        flagSet = ((flagValue & flag) != 0);
    }

    function _setFlag(uint8 flagValue, uint8 flag, bool flagSet) internal pure returns (uint8) {
        if(flagSet) {
            return (flagValue | flag);
        } else {
            return (flagValue & (255 - flag));
        }
    }
}