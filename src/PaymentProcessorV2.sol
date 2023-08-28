// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./IOwnable.sol";
import "./DataTypes.sol";
import "@openzeppelin/contracts/access/IAccessControl.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";
import "@openzeppelin/contracts/utils/Context.sol";

contract PaymentProcessorV2 is Context, EIP712 {

    error PaymentProcessor__AmountForERC721SalesMustEqualOne();
    error PaymentProcessor__AmountForERC1155SalesGreaterThanZero();
    error PaymentProcessor__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
    error PaymentProcessor__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
    error PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();
    error PaymentProcessor__CoinDoesNotImplementDecimalsAndLikelyIsNotAnERC20Token();
    error PaymentProcessor__CoinIsNotApproved();
    error PaymentProcessor__DispensingTokenWasUnsuccessful();
    error PaymentProcessor__FailedToTransferProceeds();
    error PaymentProcessor__InputArrayLengthCannotBeZero();
    error PaymentProcessor__InputArrayLengthMismatch();
    error PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
    error PaymentProcessor__OfferPriceMustEqualSalePrice();
    error PaymentProcessor__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
    error PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
    error PaymentProcessor__PricingBoundsAreImmutable();
    error PaymentProcessor__SalePriceAboveMaximumCeiling();
    error PaymentProcessor__SalePriceBelowMinimumFloor();
    error PaymentProcessor__PaymentMethodWhitelistDoesNotExist();
    error PaymentProcessor__SignatureAlreadyUsedOrRevoked();
    error PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist();
    error PaymentProcessor__PaymentMethodIsAlreadyApproved();
    error PaymentProcessor__BuyerMustBeCallerAndTransactionOrigin();
    error PaymentProcessor__OrderHasExpired();
    error PaymentProcessor__UnauthorizeSale();
    error PaymentProcessor__BadPaymentMethod();
    error PaymentProcessor__SellerMustBeCallerAndTransactionOrigin();

    error PaymentProcessor__RanOutOfNativeFunds();
    error PaymentProcessor__OverpaidNativeFunds();

    /// @dev Convenience to avoid magic number in bitmask get/set logic.
    uint256 private constant ONE = uint256(1);

    /// @notice The default admin role for NFT collections using Access Control.
    bytes32 private constant DEFAULT_ACCESS_CONTROL_ADMIN_ROLE = 0x00;

    /// @notice The denominator used when calculating the marketplace fee.
    /// @dev    0.5% fee numerator is 50, 1% fee numerator is 100, 10% fee numerator is 1,000 and so on.
    uint256 public constant FEE_DENOMINATOR = 10_000;

    /// @notice keccack256("OrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 tokenId,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
    bytes32 public constant ORDER_APPROVAL_HASH = 0x61718384c415a086091f6ee7779f499c089559dc5f0d8a00c21a2760ef58ac47;

    /// @notice keccack256("CollectionOrderApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 amount,uint256 itemPrice,uint256 nonce,uint256 expiration,uint256 marketplaceFeeNumerator,uint256 maxRoyaltyFeeNumerator,uint256 masterNonce)")
    bytes32 public constant COLLECTION_ORDER_APPROVAL_HASH = 0x61e6f7cf8f226da53a60071c56608b1b1f6d80644b1a566f2f26a786a550d9b4;

    /// @notice keccack256("BundledSaleApproval(uint8 protocol,address signer,address marketplace,address paymentMethod,address tokenAddress,uint256 expiration,uint256 nonce,uint256 marketplaceFeeNumerator,uint256 masterNonce,uint256[] tokenIds,uint256[] amounts,uint256[] maxRoyaltyFeeNumerators,uint256[] itemPrices)")
    bytes32 public constant BUNDLED_SALE_APPROVAL_HASH = 0x6ee338102e037f512a8d29ebe1eaa0b27e14cb37f4d8cbd347c71a55d5519c5b;

    uint256 private immutable pushPaymentGasLimit;

    address private immutable weth;
    address private immutable usdc;
    address private immutable usdt;
    address private immutable dai;

    /// @dev Tracks the most recently created security profile id
    uint88 private lastPaymentMethodWhitelistId;

    /**
     * @notice User-specific master nonce that allows buyers and sellers to efficiently cancel all listings or offers
     *         they made previously. The master nonce for a user only changes when they explicitly request to revoke all
     *         existing listings and offers.
     *
     * @dev    When prompting sellers to sign a listing or offer, marketplaces must query the current master nonce of
     *         the user and include it in the listing/offer signature data.
     */
    mapping(address => uint256) public masterNonces;

    /**
     * @dev The mapping key is the keccak256 hash of marketplace address and user address.
     *
     * @dev ```keccak256(abi.encodePacked(marketplace, user))```
     *
     * @dev The mapping value is another nested mapping of "slot" (key) to a bitmap (value) containing boolean flags
     *      indicating whether or not a nonce has been used or invalidated.
     *
     * @dev Marketplaces MUST track their own nonce by user, incrementing it for every signed listing or offer the user
     *      creates.  Listings and purchases may be executed out of order, and they may never be executed if orders
     *      are not matched prior to expriation.
     *
     * @dev The slot and the bit offset within the mapped value are computed as:
     *
     * @dev ```slot = nonce / 256;```
     * @dev ```offset = nonce % 256;```
     */
    mapping(address => mapping(uint256 => uint256)) private invalidatedSignatures;

    mapping (address => CollectionPaymentSettings) public collectionPaymentSettings;

    mapping (uint88 => address) public paymentMethodWhitelistOwners;

    mapping (uint88 => mapping (address => bool)) public collectionPaymentMethodWhitelists;

    /**
     * @dev Mapping of token contract addresses to the collection-level pricing boundaries (floor and ceiling price).
     */
    mapping (address => PricingBounds) private collectionPricingBounds;

    /**
     * @dev Mapping of token contract addresses to the token-level pricing boundaries (floor and ceiling price).
     */
    mapping (address => mapping (uint256 => PricingBounds)) private tokenPricingBounds;

    /// @notice Emitted when a bundle of ERC-721 tokens is successfully purchased using `buyBundledListing`
    event BuyBundledListingERC721(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
        bool[] unsuccessfulFills,
        uint256[] tokenIds,
        uint256[] salePrices);

    /// @notice Emitted when a bundle of ERC-1155 tokens is successfully purchased using `buyBundledListing`
    event BuyBundledListingERC1155(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
        bool[] unsuccessfulFills,
        uint256[] tokenIds,
        uint256[] amounts,
        uint256[] salePrices);

    /// @notice Emitted for each token successfully purchased using either `buySingleLising` or `buyBatchOfListings`
    event BuySingleListing(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        address seller,
        uint256 tokenId,
        uint256 amount,
        uint256 salePrice);

    event CreatedPaymentMethodWhitelist(
        uint88 indexed paymentMethodWhitelistId, 
        address whitelistOwner, 
        string whitelistName);

    /// @notice Emitted when a user revokes all of their existing listings or offers that share the master nonce.
    event MasterNonceInvalidated(uint256 indexed nonce, address indexed account);

    /// @notice Emitted when a user revokes a single listing or offer nonce for a specific marketplace.
    event NonceInvalidated(
        uint256 indexed nonce, 
        address indexed account, 
        bool wasCancellation);

    /// @notice Emitted when a coin is added to the approved coins mapping for a security policy
    event PaymentMethodAddedToWhitelist(uint88 indexed paymentMethodWhitelistId, address indexed paymentMethod);

    /// @notice Emitted when a coin is removed from the approved coins mapping for a security policy
    event PaymentMethodRemovedFromWhitelist(uint88 indexed paymentMethodWhitelistId, address indexed paymentMethod);

    /// @notice Emitted when a collection of ERC-721 tokens is successfully swept using `sweepCollection`
    event SweepCollectionERC721(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        bool[] unsuccessfulFills,
        address[] sellers,
        uint256[] tokenIds,
        uint256[] salePrices);

    /// @notice Emitted when a collection of ERC-1155 tokens is successfully swept using `sweepCollection`
    event SweepCollectionERC1155(
        address indexed marketplace,
        address indexed tokenAddress,
        address indexed paymentCoin,
        address buyer,
        bool[] unsuccessfulFills,
        address[] sellers,
        uint256[] tokenIds,
        uint256[] amounts,
        uint256[] salePrices);

    /// @notice Emitted whenever the supported ERC-20 payment is set for price-constrained collections.
    event UpdatedCollectionPaymentSettings(
                address indexed tokenAddress, 
                PaymentSettings paymentSettings, 
                uint88 paymentMethodWhitelistId, 
                address constrainedPricingPaymentMethod);

    /// @notice Emitted whenever pricing bounds change at a collection level for price-constrained collections.
    event UpdatedCollectionLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 floorPrice, 
        uint256 ceilingPrice);

    /// @notice Emitted whenever pricing bounds change at a token level for price-constrained collections.
    event UpdatedTokenLevelPricingBoundaries(
        address indexed tokenAddress, 
        uint256 indexed tokenId, 
        uint256 floorPrice, 
        uint256 ceilingPrice);

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) EIP712("PaymentProcessorLite", "1") {
        pushPaymentGasLimit = defaultPushPaymentGasLimit_;
        
        weth = weth_;
        usdc = usdc_;
        usdt = usdt_;
        dai = dai_;
    }

    function getDefaultPaymentMethods() external view returns (address[] memory) {
        address[] memory defaultPaymentMethods = new address[](5);
        defaultPaymentMethods[0] = address(0);
        defaultPaymentMethods[1] = weth;
        defaultPaymentMethods[2] = usdc;
        defaultPaymentMethods[3] = usdt;
        defaultPaymentMethods[4] = dai;
        return defaultPaymentMethods;
    }

    function isDefaultPaymentMethod(address paymentMethod) public view returns (bool) {
        if (paymentMethod == address(0)) {
            return true;
        } else if (paymentMethod == weth) {
            return true;
        } else if (paymentMethod == usdc) {
            return true;
        } else if (paymentMethod == usdt) {
            return true;
        } else if (paymentMethod == dai) {
            return true;
        } else {
            return false;
        }
    }

    function createPaymentMethodWhitelist(string calldata whitelistName) external returns (uint88 paymentMethodWhitelistId) {
        unchecked {
            paymentMethodWhitelistId = ++lastPaymentMethodWhitelistId;
        }

        paymentMethodWhitelistOwners[paymentMethodWhitelistId] = _msgSender();

        emit CreatedPaymentMethodWhitelist(paymentMethodWhitelistId, _msgSender(), whitelistName);
    }

    function whitelistPaymentMethod(uint88 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        if (paymentMethod != address(0)) {
            _requireCoinImplementsValidDecimals(paymentMethod);
        }

        mapping (address => bool) storage ptrPaymentMethodWhitelist = collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (ptrPaymentMethodWhitelist[paymentMethod]) {
            revert PaymentProcessor__PaymentMethodIsAlreadyApproved();
        }

        ptrPaymentMethodWhitelist[paymentMethod] = true;
        emit PaymentMethodAddedToWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    function unwhitelistPaymentMethod(uint88 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (!ptrPaymentMethodWhitelist[paymentMethod]) {
            revert PaymentProcessor__CoinIsNotApproved();
        }

        delete ptrPaymentMethodWhitelist[paymentMethod];
        emit PaymentMethodRemovedFromWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    function setCollectionPaymentSettings(
        address tokenAddress, 
        PaymentSettings paymentSettings,
        uint88 paymentMethodWhitelistId,
        address constrainedPricingPaymentMethod) external {
            _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

            if (
                paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist || 
                paymentSettings == PaymentSettings.AllowAnyPaymentMethod
            ) {
                paymentMethodWhitelistId = 0;
                constrainedPricingPaymentMethod = address(0);
            } else if (paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
                constrainedPricingPaymentMethod = address(0);
            } else if (paymentSettings == PaymentSettings.PricingConstraints) {
                paymentMethodWhitelistId = 0;
            }

            if (paymentMethodWhitelistId > lastPaymentMethodWhitelistId) {
                revert PaymentProcessor__PaymentMethodWhitelistDoesNotExist();
            }

            if (constrainedPricingPaymentMethod != address(0)) {
                _requireCoinImplementsValidDecimals(constrainedPricingPaymentMethod);
            }

            collectionPaymentSettings[tokenAddress] = CollectionPaymentSettings(
                paymentSettings,
                paymentMethodWhitelistId,
                constrainedPricingPaymentMethod);

            emit UpdatedCollectionPaymentSettings(
                tokenAddress, 
                paymentSettings, 
                paymentMethodWhitelistId, 
                constrainedPricingPaymentMethod);
    }

    function setCollectionPricingBounds(address tokenAddress, PricingBounds calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(collectionPricingBounds[tokenAddress].isImmutable) {
            revert PaymentProcessor__PricingBoundsAreImmutable();
        }

        if(pricingBounds.floorPrice > pricingBounds.ceilingPrice) {
            revert PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();
        }
        
        collectionPricingBounds[tokenAddress] = pricingBounds;
        
        emit UpdatedCollectionLevelPricingBoundaries(
            tokenAddress, 
            pricingBounds.floorPrice, 
            pricingBounds.ceilingPrice);
    }

    function setTokenPricingBounds(
        address tokenAddress, 
        uint256[] calldata tokenIds, 
        PricingBounds[] calldata pricingBounds) external {
        _requireCallerIsNFTOrContractOwnerOrAdmin(tokenAddress);

        if(tokenIds.length != pricingBounds.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if(tokenIds.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        mapping (uint256 => PricingBounds) storage ptrTokenPricingBounds = tokenPricingBounds[tokenAddress];

        uint256 tokenId;
        for(uint256 i = 0; i < tokenIds.length;) {
            tokenId = tokenIds[i];
            PricingBounds memory pricingBounds_ = pricingBounds[i];

            if(ptrTokenPricingBounds[tokenId].isImmutable) {
                revert PaymentProcessor__PricingBoundsAreImmutable();
            }

            if(pricingBounds_.floorPrice > pricingBounds_.ceilingPrice) {
                revert PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();
            }

            ptrTokenPricingBounds[tokenId] = pricingBounds_;

            emit UpdatedTokenLevelPricingBoundaries(
                tokenAddress, 
                tokenId, 
                pricingBounds_.floorPrice, 
                pricingBounds_.ceilingPrice);
            
            unchecked {
                ++i;
            }
        }
    }

    function revokeMasterNonce() external {
        emit MasterNonceInvalidated(masterNonces[_msgSender()], _msgSender());

        unchecked {
            ++masterNonces[_msgSender()];
        }
    }

    function revokeSingleNonce(uint256 nonce) external {
        _checkAndInvalidateNonce(_msgSender(), nonce, true);
    }

    function buyListing(Order memory saleDetails, SignatureECDSA memory signature) external payable {
        if (saleDetails.paymentMethod == address(0)) {
            if (saleDetails.itemPrice != msg.value) {
                revert PaymentProcessor__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert PaymentProcessor__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        _verifyCallerIsBuyerAndTxOrigin(saleDetails.buyer);

        bool tokenDispensedSuccessfully = _executeOrder(false, saleDetails.seller, saleDetails, signature);
        if (!tokenDispensedSuccessfully) {
            revert PaymentProcessor__DispensingTokenWasUnsuccessful();
        }
    }

    function acceptOffer(bool isCollectionLevelOffer, Order memory saleDetails, SignatureECDSA memory signature) external {
        _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
        _verifyCallerIsSellerAndTxOrigin(saleDetails.seller);

        bool tokenDispensedSuccessfully = _executeOrder(isCollectionLevelOffer, saleDetails.buyer, saleDetails, signature);
        if (!tokenDispensedSuccessfully) {
            revert PaymentProcessor__DispensingTokenWasUnsuccessful();
        }
    }

    function bulkBuyListings(
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) external payable {
        if (saleDetailsArray.length != signatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        uint256 runningBalanceNativeProceeds = msg.value;

        Order memory saleDetails;
        SignatureECDSA memory signature;
        uint256 msgValue;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            signature = signatures[i];
            msgValue = 0;

            _verifyCallerIsBuyerAndTxOrigin(saleDetails.buyer);

            if(saleDetails.paymentMethod == address(0)) {
                msgValue = saleDetails.itemPrice;

                if (runningBalanceNativeProceeds < msgValue) {
                    revert PaymentProcessor__RanOutOfNativeFunds();
                }

                unchecked {
                    runningBalanceNativeProceeds -= msgValue;
                }

                if (!_executeOrder(false, saleDetails.seller, saleDetails, signature)) {
                    revert PaymentProcessor__DispensingTokenWasUnsuccessful();
                }
            } else {
                _executeOrder(false, saleDetails.seller, saleDetails, signature);
            }

            unchecked {
                ++i;
            }
        }

        if (runningBalanceNativeProceeds > 0) {
            revert PaymentProcessor__OverpaidNativeFunds();
        }
    }

    function bulkAcceptOffers(
        bool areCollectionLevelOffers,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) external {
        if (saleDetailsArray.length != signatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        Order memory saleDetails;
        SignatureECDSA memory signature;

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            saleDetails = saleDetailsArray[i];
            signature = signatures[i];

            _verifyPaymentMethodIsNonNative(saleDetails.paymentMethod);
            _verifyCallerIsSellerAndTxOrigin(saleDetails.seller);

            _executeOrder(areCollectionLevelOffers, saleDetails.buyer, saleDetails, signature);

            unchecked {
                ++i;
            }
        }
    }

    function buyBundledListing(
        SignatureECDSA memory signature,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] calldata items) external payable {

        _verifyCallerIsBuyerAndTxOrigin(bundleDetails.bundleBase.buyer);

        if (items.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        SignatureECDSA[] memory signatureAsSingletonArray = new SignatureECDSA[](1);
        signatureAsSingletonArray[0] = signature;

        (Accumulator memory accumulator, Order[] memory saleDetailsBatch) = 
        _validateBundledItems(
            false,
            bundleDetails,
            items,
            signatureAsSingletonArray
        );

        if (bundleDetails.bundleBase.paymentMethod == address(0)) {
            if (accumulator.sumListingPrices != msg.value) {
                revert PaymentProcessor__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert PaymentProcessor__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds(
            bundleDetails.bundleBase.buyer, 
            IERC20(bundleDetails.bundleBase.paymentMethod),
            bundleDetails.bundleBase.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            bundleDetails.bundleBase.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetailsBatch);

        if (bundleDetails.bundleBase.protocol == TokenProtocols.ERC1155) {
            emit BuyBundledListingERC1155(
                    bundleDetails.bundleBase.marketplace,
                    bundleDetails.bundleBase.tokenAddress,
                    bundleDetails.bundleBase.paymentMethod,
                    bundleDetails.bundleBase.buyer,
                    bundleDetails.seller,
                    unsuccessfulFills,
                    accumulator.tokenIds,
                    accumulator.amounts,
                    accumulator.salePrices);
        } else {
            emit BuyBundledListingERC721(
                    bundleDetails.bundleBase.marketplace,
                    bundleDetails.bundleBase.tokenAddress,
                    bundleDetails.bundleBase.paymentMethod,
                    bundleDetails.bundleBase.buyer,
                    bundleDetails.seller,
                    unsuccessfulFills,
                    accumulator.tokenIds,
                    accumulator.salePrices);
        }
    }

    function sweepCollection(
        BundledOrderBase memory bundleDetails,
        BundledItem[] calldata items,
        SignatureECDSA[] calldata signatures) external payable {

        _verifyCallerIsBuyerAndTxOrigin(bundleDetails.buyer);

        if (items.length != signatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        (Accumulator memory accumulator, Order[] memory saleDetailsBatch) = 
        _validateBundledItems(
            true,
            BundledOrderExtended({
                bundleBase: bundleDetails,
                seller: address(0),
                nonce: 0,
                expiration: 0
            }),
            items,
            signatures
        );

        if (bundleDetails.paymentMethod == address(0)) {
            if (accumulator.sumListingPrices != msg.value) {
                revert PaymentProcessor__OfferPriceMustEqualSalePrice();
            }
        } else {
            if (msg.value > 0) {
                revert PaymentProcessor__CannotIncludeNativeFundsWhenPaymentMethodIsAnERC20Coin();
            }
        }

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds(
            bundleDetails.buyer, 
            IERC20(bundleDetails.paymentMethod),
            bundleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            bundleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetailsBatch);

        if (bundleDetails.protocol == TokenProtocols.ERC1155) {
            emit SweepCollectionERC1155(
                    bundleDetails.marketplace,
                    bundleDetails.tokenAddress,
                    bundleDetails.paymentMethod,
                    bundleDetails.buyer,
                    unsuccessfulFills,
                    accumulator.sellers,
                    accumulator.tokenIds,
                    accumulator.amounts,
                    accumulator.salePrices);
        } else {
            emit SweepCollectionERC721(
                    bundleDetails.marketplace,
                    bundleDetails.tokenAddress,
                    bundleDetails.paymentMethod,
                    bundleDetails.buyer,
                    unsuccessfulFills,
                    accumulator.sellers,
                    accumulator.tokenIds,
                    accumulator.salePrices);
        }
    }

    /**
     * @notice Returns the EIP-712 domain separator for this contract.
     */
    function getDomainSeparator() external view returns (bytes32) {
        return _domainSeparatorV4();
    }

    /**
     * @notice Returns whether or not the price of a collection is immutable.
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @return True if the floor and ceiling price for the specified token contract has been set immutably, false otherwise.
     */
    function isCollectionPricingImmutable(address tokenAddress) external view returns (bool) {
        return collectionPricingBounds[tokenAddress].isImmutable;
    }

    /**
     * @notice Returns whether or not the price of a specific token is immutable.
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  tokenId      The token id.
     * @return True if the floor and ceiling price for the specified token contract and tokenId has been set immutably, false otherwise.
     */
    function isTokenPricingImmutable(address tokenAddress, uint256 tokenId) external view returns (bool) {
        return tokenPricingBounds[tokenAddress][tokenId].isImmutable;
    }

    /**
     * @notice Gets the floor price for the specified nft contract address and token id.
     *
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  tokenId      The token id.
     * @return The floor price.
     */
    function getFloorPrice(address tokenAddress, uint256 tokenId) external view returns (uint256) {
        (uint256 floorPrice,) = _getFloorAndCeilingPrices(tokenAddress, tokenId);
        return floorPrice;
    }

    /**
     * @notice Gets the ceiling price for the specified nft contract address and token id.
     *
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  tokenId      The token id.
     * @return The ceiling price.
     */
    function getCeilingPrice(address tokenAddress, uint256 tokenId) external view returns (uint256) {
        (, uint256 ceilingPrice) = _getFloorAndCeilingPrices(tokenAddress, tokenId);
        return ceilingPrice;
    }

    function _payoutNativeCurrency(
        address payee, 
        address /*payer*/, 
        IERC20 /*paymentCoin*/, 
        uint256 proceeds, 
        uint256 gasLimit_) internal {
        _pushProceeds(payee, proceeds, gasLimit_);
    }

    function _payoutCoinCurrency(
        address payee, 
        address payer, 
        IERC20 paymentCoin, 
        uint256 proceeds, 
        uint256 /*gasLimit_*/) internal {
        SafeERC20.safeTransferFrom(paymentCoin, payer, payee, proceeds);
    }

    function _dispenseERC721Token(
        address from, 
        address to, 
        address tokenAddress, 
        uint256 tokenId, 
        uint256 /*amount*/) internal returns (bool) {
        try IERC721(tokenAddress).transferFrom(from, to, tokenId) {
            return true;
        } catch {
            return false;
        }
    }

    function _dispenseERC1155Token(
        address from, 
        address to, 
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount) internal returns (bool) {
        try IERC1155(tokenAddress).safeTransferFrom(from, to, tokenId, amount, "") {
            return true;
        } catch {
            return false;
        }
    }

    function _requireCallerIsNFTOrContractOwnerOrAdmin(address tokenAddress) internal view {
        bool callerHasPermissions = false;
        
        callerHasPermissions = _msgSender() == tokenAddress;
        if(!callerHasPermissions) {
            try IOwnable(tokenAddress).owner() returns (address contractOwner) {
                callerHasPermissions = _msgSender() == contractOwner;
            } catch {}

            if(!callerHasPermissions) {
                try IAccessControl(tokenAddress).hasRole(DEFAULT_ACCESS_CONTROL_ADMIN_ROLE, _msgSender()) 
                    returns (bool callerIsContractAdmin) {
                    callerHasPermissions = callerIsContractAdmin;
                } catch {}
            }
        }

        if(!callerHasPermissions) {
            revert PaymentProcessor__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
        }
    }

    function _executeOrder(
        bool isCollectionLevelOrder, 
        address signer, 
        Order memory saleDetails, 
        SignatureECDSA memory signature) private returns (bool tokenDispensedSuccessfully) {
        if (saleDetails.protocol == TokenProtocols.ERC1155) {
            if (saleDetails.amount == 0) {
                revert PaymentProcessor__AmountForERC1155SalesGreaterThanZero();
            }
        } else {
            if (saleDetails.amount != ONE) {
                revert PaymentProcessor__AmountForERC721SalesMustEqualOne();
            }
        }

        if (block.timestamp > saleDetails.expiration) {
            revert PaymentProcessor__OrderHasExpired();
        }

        if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
            revert PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
        }

        CollectionPaymentSettings memory paymentSettingsForCollection = collectionPaymentSettings[saleDetails.tokenAddress];
        
        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!isDefaultPaymentMethod(saleDetails.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId][saleDetails.paymentMethod]) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != saleDetails.paymentMethod) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }

            _verifySalePriceInRange(
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount, 
                saleDetails.itemPrice);
        }

        if (isCollectionLevelOrder) {
            _verifySignedCollectionOrder(signer, saleDetails, signature);
        } else {
            _verifySignedItemOrder(signer, saleDetails, signature);
        }

        Order[] memory saleDetailsSingletonBatch = new Order[](1);
        saleDetailsSingletonBatch[0] = saleDetails;

        bool[] memory unsuccessfulFills = _computeAndDistributeProceeds(
            saleDetails.buyer,
            IERC20(saleDetails.paymentMethod),
            saleDetails.paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            saleDetails.protocol == TokenProtocols.ERC1155 ? _dispenseERC1155Token : _dispenseERC721Token,
            saleDetailsSingletonBatch
        );

        tokenDispensedSuccessfully = !unsuccessfulFills[0];

        if (tokenDispensedSuccessfully) {
            emit BuySingleListing(
                saleDetails.marketplace,
                saleDetails.tokenAddress,
                saleDetails.paymentMethod,
                saleDetails.buyer,
                saleDetails.seller,
                saleDetails.tokenId,
                saleDetails.amount,
                saleDetails.itemPrice);
        }
    }

    function _validateBundledItems(
        bool individualListings,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] memory items,
        SignatureECDSA[] memory signatures) 
        private returns (Accumulator memory accumulator, Order[] memory saleDetailsBatch) {

        CollectionPaymentSettings memory paymentSettingsForCollection = collectionPaymentSettings[bundleDetails.bundleBase.tokenAddress];

        if (paymentSettingsForCollection.paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!isDefaultPaymentMethod(bundleDetails.bundleBase.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId][bundleDetails.bundleBase.paymentMethod]) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != bundleDetails.bundleBase.paymentMethod) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        }

        saleDetailsBatch = new Order[](items.length);
        accumulator = Accumulator({
            tokenIds: new uint256[](items.length),
            amounts: new uint256[](items.length),
            salePrices: new uint256[](items.length),
            maxRoyaltyFeeNumerators: new uint256[](items.length),
            sellers: new address[](items.length),
            sumListingPrices: 0
        });

        for (uint256 i = 0; i < items.length;) {

            address seller = bundleDetails.seller;
            uint256 nonce = bundleDetails.nonce;
            uint256 expiration = bundleDetails.expiration;

            if (individualListings) {
                seller = items[i].seller;
                nonce = items[i].nonce;
                expiration = items[i].expiration;
            }
            
            Order memory saleDetails = 
                Order({
                    protocol: bundleDetails.bundleBase.protocol,
                    seller: seller,
                    buyer: bundleDetails.bundleBase.buyer,
                    marketplace: bundleDetails.bundleBase.marketplace,
                    paymentMethod: bundleDetails.bundleBase.paymentMethod,
                    tokenAddress: bundleDetails.bundleBase.tokenAddress,
                    tokenId: items[i].tokenId,
                    amount: items[i].amount,
                    itemPrice: items[i].itemPrice,
                    nonce: nonce,
                    expiration: expiration,
                    marketplaceFeeNumerator: bundleDetails.bundleBase.marketplaceFeeNumerator,
                    maxRoyaltyFeeNumerator: items[i].maxRoyaltyFeeNumerator
                });

            saleDetailsBatch[i] = saleDetails;

            accumulator.tokenIds[i] = saleDetails.tokenId;
            accumulator.amounts[i] = saleDetails.amount;
            accumulator.salePrices[i] = saleDetails.itemPrice;
            accumulator.maxRoyaltyFeeNumerators[i] = saleDetails.maxRoyaltyFeeNumerator;
            accumulator.sellers[i] = saleDetails.seller;
            accumulator.sumListingPrices += saleDetails.itemPrice;

            if (saleDetails.protocol == TokenProtocols.ERC1155) {
                if (saleDetails.amount == 0) {
                    revert PaymentProcessor__AmountForERC1155SalesGreaterThanZero();
                }
            } else {
                if (saleDetails.amount != ONE) {
                    revert PaymentProcessor__AmountForERC721SalesMustEqualOne();
                }
            }

            if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
                revert PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
            }

            if (paymentSettingsForCollection.paymentSettings == PaymentSettings.PricingConstraints) {
                _verifySalePriceInRange(
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount, 
                    saleDetails.itemPrice);
            }
   
            if (individualListings) {
                if (block.timestamp > saleDetails.expiration) {
                    revert PaymentProcessor__OrderHasExpired();
                }

                _verifySignedItemOrder(saleDetails.seller, saleDetails, signatures[i]);
            }

            unchecked {
                ++i;
            }
        }

        if(!individualListings) {
            if (block.timestamp > bundleDetails.expiration) {
                revert PaymentProcessor__OrderHasExpired();
            }

            _verifySignedBundleListing(
                bundleDetails.seller,
                AccumulatorHashes({
                    tokenIdsKeccakHash: keccak256(abi.encodePacked(accumulator.tokenIds)),
                    amountsKeccakHash: keccak256(abi.encodePacked(accumulator.amounts)),
                    maxRoyaltyFeeNumeratorsKeccakHash: keccak256(abi.encodePacked(accumulator.maxRoyaltyFeeNumerators)),
                    itemPricesKeccakHash: keccak256(abi.encodePacked(accumulator.salePrices))
                }),
                bundleDetails, 
                signatures[0]);
        }
    }

    function _verifySignedItemOrder(
        address signer,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) private {
        bytes32 digest = 
            _hashTypedDataV4(keccak256(
                bytes.concat(
                    abi.encode(
                        ORDER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        signer,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.tokenId,
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.nonce,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            signer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert PaymentProcessor__UnauthorizeSale();
        }
    }

    function _verifySignedCollectionOrder(
        address signer,
        Order memory saleDetails,
        SignatureECDSA memory signedOrder) private {
        bytes32 digest = 
            _hashTypedDataV4(keccak256(
                bytes.concat(
                    abi.encode(
                        COLLECTION_ORDER_APPROVAL_HASH,
                        uint8(saleDetails.protocol),
                        signer,
                        saleDetails.marketplace,
                        saleDetails.paymentMethod,
                        saleDetails.tokenAddress
                    ),
                    abi.encode(
                        saleDetails.amount,
                        saleDetails.itemPrice,
                        saleDetails.nonce,
                        saleDetails.expiration,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        _checkAndInvalidateNonce(
                            signer,
                            saleDetails.nonce,
                            false
                        )
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedOrder.v, signedOrder.r, signedOrder.s)) {
            revert PaymentProcessor__UnauthorizeSale();
        }
    }

    function _verifySignedBundleListing(
        address signer,
        AccumulatorHashes memory accumulatorHashes,
        BundledOrderExtended memory bundleDetails,
        SignatureECDSA memory signedListing) private {

        bytes32 digest = 
            _hashTypedDataV4(keccak256(
                bytes.concat(
                    abi.encode(
                        BUNDLED_SALE_APPROVAL_HASH,
                        uint8(bundleDetails.bundleBase.protocol),
                        signer,
                        bundleDetails.bundleBase.marketplace,
                        bundleDetails.bundleBase.paymentMethod,
                        bundleDetails.bundleBase.tokenAddress
                    ),
                    abi.encode(
                        bundleDetails.expiration,
                        bundleDetails.nonce,
                        bundleDetails.bundleBase.marketplaceFeeNumerator,
                        _checkAndInvalidateNonce(
                            signer,
                            bundleDetails.nonce,
                            false
                        ),
                        accumulatorHashes.tokenIdsKeccakHash,
                        accumulatorHashes.amountsKeccakHash,
                        accumulatorHashes.maxRoyaltyFeeNumeratorsKeccakHash,
                        accumulatorHashes.itemPricesKeccakHash
                    )
                )
            )
        );

        if (signer != ECDSA.recover(digest, signedListing.v, signedListing.r, signedListing.s)) {
            revert PaymentProcessor__UnauthorizeSale();
        }
    }

    function _checkAndInvalidateNonce(
        address account, 
        uint256 nonce, 
        bool wasCancellation) private returns (uint256) {

        mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = invalidatedSignatures[account];

        unchecked {
            uint256 slot = nonce / 256;
            uint256 offset = nonce % 256;
            uint256 slotValue = ptrInvalidatedSignatureBitmap[slot];

            if (((slotValue >> offset) & ONE) == ONE) {
                revert PaymentProcessor__SignatureAlreadyUsedOrRevoked();
            }

            ptrInvalidatedSignatureBitmap[slot] = (slotValue | ONE << offset);
        }

        emit NonceInvalidated(nonce, account, wasCancellation);

        return masterNonces[account];
    }

    function _computeAndDistributeProceeds(
        address buyer,
        IERC20 paymentCoin,
        function(address,address,IERC20,uint256,uint256) funcPayout,
        function(address,address,address,uint256,uint256) returns (bool) funcDispenseToken,
        Order[] memory saleDetailsBatch) private returns (bool[] memory unsuccessfulFills) {

        unsuccessfulFills = new bool[](saleDetailsBatch.length);

        PayoutsAccumulator memory accumulator = PayoutsAccumulator({
            lastSeller: address(0),
            lastMarketplace: address(0),
            lastRoyaltyRecipient: address(0),
            accumulatedSellerProceeds: 0,
            accumulatedMarketplaceProceeds: 0,
            accumulatedRoyaltyProceeds: 0
        });

        for (uint256 i = 0; i < saleDetailsBatch.length;) {
            Order memory saleDetails = saleDetailsBatch[i];

            bool successfullyDispensedToken = 
                funcDispenseToken(
                    saleDetails.seller, 
                    buyer, 
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount);

            if (!successfullyDispensedToken) {
                if (address(paymentCoin) == address(0)) {
                    revert PaymentProcessor__DispensingTokenWasUnsuccessful();
                }

                unsuccessfulFills[i] = true;
            } else {
                SplitProceeds memory proceeds =
                    _computePaymentSplits(
                        saleDetails.itemPrice,
                        saleDetails.tokenAddress,
                        saleDetails.tokenId,
                        saleDetails.marketplace,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator
                    );
    
                if (proceeds.royaltyRecipient != accumulator.lastRoyaltyRecipient) {
                    if(accumulator.accumulatedRoyaltyProceeds > 0) {
                        funcPayout(accumulator.lastRoyaltyRecipient, buyer, paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        funcPayout(accumulator.lastMarketplace, buyer, paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.seller != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        funcPayout(accumulator.lastSeller, buyer, paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastSeller = saleDetails.seller;
                    accumulator.accumulatedSellerProceeds = 0;
                }

                unchecked {
                    accumulator.accumulatedRoyaltyProceeds += proceeds.royaltyProceeds;
                    accumulator.accumulatedMarketplaceProceeds += proceeds.marketplaceProceeds;
                    accumulator.accumulatedSellerProceeds += proceeds.sellerProceeds;
                }
            }

            unchecked {
                ++i;
            }
        }

        if(accumulator.accumulatedRoyaltyProceeds > 0) {
            funcPayout(accumulator.lastRoyaltyRecipient, buyer, paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            funcPayout(accumulator.lastMarketplace, buyer, paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            funcPayout(accumulator.lastSeller, buyer, paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
        }

        return unsuccessfulFills;
    }

    function _pushProceeds(address to, uint256 proceeds, uint256 pushPaymentGasLimit_) private {
        bool success;

        assembly {
            // Transfer the ETH and store if it succeeded or not.
            success := call(pushPaymentGasLimit_, to, proceeds, 0, 0, 0, 0)
        }

        if (!success) {
            revert PaymentProcessor__FailedToTransferProceeds();
        }
    }

    function _computePaymentSplits(
        uint256 salePrice,
        address tokenAddress,
        uint256 tokenId,
        address marketplaceFeeRecipient,
        uint256 marketplaceFeeNumerator,
        uint256 maxRoyaltyFeeNumerator) private view returns (SplitProceeds memory proceeds) {

        proceeds.sellerProceeds = salePrice;

        try IERC2981(tokenAddress).royaltyInfo(
            tokenId, 
            salePrice) 
            returns (address royaltyReceiver, uint256 royaltyAmount) {
            if (royaltyReceiver == address(0)) {
                royaltyAmount = 0;
            }

            if (royaltyAmount > 0) {
                if (royaltyAmount > (salePrice * maxRoyaltyFeeNumerator) / FEE_DENOMINATOR) {
                    revert PaymentProcessor__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
                }

                proceeds.royaltyRecipient = royaltyReceiver;
                proceeds.royaltyProceeds = royaltyAmount;

                unchecked {
                    proceeds.sellerProceeds -= royaltyAmount;
                }
            }
        } catch (bytes memory) {}

        proceeds.marketplaceProceeds =
            marketplaceFeeRecipient != address(0) ? (salePrice * marketplaceFeeNumerator) / FEE_DENOMINATOR : 0;
        if (proceeds.marketplaceProceeds > 0) {
            unchecked {
                proceeds.sellerProceeds -= proceeds.marketplaceProceeds;
            }
        }
    }

    function _getFloorAndCeilingPrices(
        address tokenAddress, 
        uint256 tokenId) private view returns (uint256, uint256) {

        PricingBounds memory tokenLevelPricingBounds = tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return (tokenLevelPricingBounds.floorPrice, tokenLevelPricingBounds.ceilingPrice);
        } else {
            PricingBounds memory collectionLevelPricingBounds = collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return (collectionLevelPricingBounds.floorPrice, collectionLevelPricingBounds.ceilingPrice);
            }
        }

        return (0, type(uint256).max);
    }

    function _requireCallerOwnsPaymentMethodWhitelist(uint88 paymentMethodWhitelistId) private view {
        if(_msgSender() != paymentMethodWhitelistOwners[paymentMethodWhitelistId]) {
            revert PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist();
        }
    }

    function _requireCoinImplementsValidDecimals(address coin) private view {
        bool validDecimals = false;
        
        try IERC20Metadata(coin).decimals() returns (uint8 coinDecimals) {
            validDecimals = coinDecimals > 0;
        } catch {}

        if(!validDecimals) {
            revert PaymentProcessor__CoinDoesNotImplementDecimalsAndLikelyIsNotAnERC20Token();
        }
    }

    function _verifySalePriceInRange(
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount, 
        uint256 salePrice) private view {
        (uint256 floorPrice, uint256 ceilingPrice) = _getFloorAndCeilingPrices(tokenAddress, tokenId);

        if(salePrice < amount * floorPrice) {
            revert PaymentProcessor__SalePriceBelowMinimumFloor();
        }

        if(ceilingPrice < type(uint120).max) {
            ceilingPrice *= amount;
        }

        if(salePrice > ceilingPrice) {
            revert PaymentProcessor__SalePriceAboveMaximumCeiling();
        }
    }

    function _verifyPaymentMethodIsNonNative(address paymentMethod) private pure {
        if (paymentMethod == address(0)) {
            revert PaymentProcessor__BadPaymentMethod();
        }
    }

    function _verifyCallerIsSellerAndTxOrigin(address seller) private view {
        if(seller != _msgSender() || _msgSender() != tx.origin) {
            revert PaymentProcessor__SellerMustBeCallerAndTransactionOrigin();
        }
    }

    function _verifyCallerIsBuyerAndTxOrigin(address buyer) private view {
        if(buyer != _msgSender() || _msgSender() != tx.origin) {
            revert PaymentProcessor__BuyerMustBeCallerAndTransactionOrigin();
        }
    }
}
