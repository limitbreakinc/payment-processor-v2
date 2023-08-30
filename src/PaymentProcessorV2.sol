// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./IOwnable.sol";
import "./DataTypes.sol";
import "./Errors.sol";

import "./interfaces/IPaymentProcessorEvents.sol";

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

import "./modules/ModuleBuyListing.sol";
import "./storage/PaymentProcessorStorageAccess.sol";

import "forge-std/console.sol";

contract PaymentProcessorV2 is Context, EIP712, PaymentProcessorStorageAccess, IPaymentProcessorEvents {

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

    bytes32 private immutable DOMAIN_SEPARATOR;

    address private immutable moduleBuyListing;
    address private immutable moduleAcceptOffer;
    address private immutable moduleBulkBuyListings;
    address private immutable moduleBulkAcceptOffers;
    address private immutable moduleBuyBundledListing;
    address private immutable moduleSweepCollection;

    constructor(
        address moduleBuyListing_,
        address moduleAcceptOffer_,
        address moduleBulkBuyListings_,
        address moduleBulkAcceptOffers_,
        address moduleBuyBundledListing_,
        address moduleSweepCollection_) 
        EIP712("PaymentProcessorLite", "1") {
        moduleBuyListing = moduleBuyListing_;
        moduleAcceptOffer = moduleAcceptOffer_;
        moduleBulkBuyListings = moduleBulkBuyListings_;
        moduleBulkAcceptOffers = moduleBulkAcceptOffers_;
        moduleBuyBundledListing = moduleBuyBundledListing_;
        moduleSweepCollection = moduleSweepCollection_;

        DOMAIN_SEPARATOR = getDomainSeparator();
    }

    function masterNonces(address account) public view returns (uint256) {
        return appStorage().masterNonces[account];
    }

    function createPaymentMethodWhitelist(string calldata whitelistName) external returns (uint88 paymentMethodWhitelistId) {
        unchecked {
            paymentMethodWhitelistId = ++appStorage().lastPaymentMethodWhitelistId;
        }

        appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId] = _msgSender();

        emit CreatedPaymentMethodWhitelist(paymentMethodWhitelistId, _msgSender(), whitelistName);
    }

    function whitelistPaymentMethod(uint88 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        if (paymentMethod != address(0)) {
            _requireCoinImplementsValidDecimals(paymentMethod);
        }

        mapping (address => bool) storage ptrPaymentMethodWhitelist = appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (ptrPaymentMethodWhitelist[paymentMethod]) {
            revert PaymentProcessor__PaymentMethodIsAlreadyApproved();
        }

        ptrPaymentMethodWhitelist[paymentMethod] = true;
        emit PaymentMethodAddedToWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    function unwhitelistPaymentMethod(uint88 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

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

            if (paymentMethodWhitelistId > appStorage().lastPaymentMethodWhitelistId) {
                revert PaymentProcessor__PaymentMethodWhitelistDoesNotExist();
            }

            if (constrainedPricingPaymentMethod != address(0)) {
                _requireCoinImplementsValidDecimals(constrainedPricingPaymentMethod);
            }

            appStorage().collectionPaymentSettings[tokenAddress] = CollectionPaymentSettings(
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

        if(appStorage().collectionPricingBounds[tokenAddress].isImmutable) {
            revert PaymentProcessor__PricingBoundsAreImmutable();
        }

        if(pricingBounds.floorPrice > pricingBounds.ceilingPrice) {
            revert PaymentProcessor__CeilingPriceMustBeGreaterThanFloorPrice();
        }
        
        appStorage().collectionPricingBounds[tokenAddress] = pricingBounds;
        
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

        mapping (uint256 => PricingBounds) storage ptrTokenPricingBounds = appStorage().tokenPricingBounds[tokenAddress];

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
        emit MasterNonceInvalidated(appStorage().masterNonces[_msgSender()], _msgSender());

        unchecked {
            ++appStorage().masterNonces[_msgSender()];
        }
    }

    function revokeSingleNonce(uint256 nonce) external {
        _checkAndInvalidateNonce(_msgSender(), nonce, true);
    }

    function _removeFirst4Bytes(bytes memory data) private pure returns (bytes memory) {
        if (data.length < 4) {
            revert("PaymentProcessor__DataLengthTooShort()");
        }

        bytes memory result = new bytes(data.length - 4);
        
        assembly {
            // Start positions of the data
            let src := add(data, 0x24) // data starts 0x20 bytes in, skip another 0x04 bytes
            let dest := add(result, 0x20) // result starts 0x20 bytes in
            
            // Copy data from source to destination
            for { let end := add(src, mload(data)) } lt(src, end) {
                src := add(src, 0x20)
                dest := add(dest, 0x20)
            } {
                mstore(dest, mload(src))
            }
        }
        
        return result;
    }

    function encodeBuyListingCalldata(
        Order memory saleDetails, 
        SignatureECDSA memory signature) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyListing(bytes32,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256),(uint8,bytes32,bytes32))",
                DOMAIN_SEPARATOR,
                saleDetails,
                signature));
    }

    function buyListing(bytes calldata data) external payable {
        address module = moduleBuyListing;
        assembly {
            mstore(0x00, hex"be0af963")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeAcceptOfferCalldata(
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "acceptOffer(bytes32,bool,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256),(uint8,bytes32,bytes32))",
                DOMAIN_SEPARATOR,
                isCollectionLevelOffer,
                saleDetails,
                signature));
    }

    function acceptOffer(bytes calldata data) external {
        address module = moduleAcceptOffer;
        assembly {
            mstore(0x00, hex"8f48f433")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function bulkBuyListings(Order[] calldata saleDetailsArray, SignatureECDSA[] calldata signatures) external payable {
        bytes memory data = abi.encodeWithSignature(
                "bulkBuyListings(bytes32,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                getDomainSeparator(),
                saleDetailsArray,
                signatures);

        address module = moduleBulkBuyListings;

        assembly {
            let result := delegatecall(gas(), module, add(data, 32), mload(data), 0, 0)
        }
    }

    function bulkAcceptOffers(
        bool areCollectionLevelOffers,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) external {
        bytes memory data = abi.encodeWithSignature(
                "bulkAcceptOffers(bytes32,bool,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                getDomainSeparator(),
                areCollectionLevelOffers,
                saleDetailsArray,
                signatures);

        address module = moduleBulkAcceptOffers;

        assembly {
            let result := delegatecall(gas(), module, add(data, 32), mload(data), 0, 0)
        }
    }

    function buyBundledListing(
        SignatureECDSA memory signature,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] calldata items) external payable {
        bytes memory data = abi.encodeWithSignature(
            "buyBundledListing(bytes32,(uint8,bytes32,bytes32),((uint8,address,address,address,address,uint256),address,uint256,uint256),(address,uint256,uint256,uint256,uint256,uint256,uint256)[])",
            getDomainSeparator(),
            signature,
            bundleDetails,
            items);
        
        address module = moduleBuyBundledListing;

        assembly {
            let result := delegatecall(gas(), module, add(data, 32), mload(data), 0, 0)
        }
    }

    function sweepCollection(
        BundledOrderBase memory bundleDetails,
        BundledItem[] calldata items,
        SignatureECDSA[] calldata signatures) external payable {

        bytes memory data = abi.encodeWithSignature(
            "sweepCollection(bytes32,(uint8,address,address,address,address,uint256),(address,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
            getDomainSeparator(),
            bundleDetails,
            items,
            signatures);

        address module = moduleSweepCollection;

        assembly {
            let result := delegatecall(gas(), module, add(data, 32), mload(data), 0, 0)
        }
    }

    /**
     * @notice Returns the EIP-712 domain separator for this contract.
     */
    function getDomainSeparator() public view returns (bytes32) {
        return _domainSeparatorV4();
    }

    /**
     * @notice Returns whether or not the price of a collection is immutable.
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @return True if the floor and ceiling price for the specified token contract has been set immutably, false otherwise.
     */
    function isCollectionPricingImmutable(address tokenAddress) external view returns (bool) {
        return appStorage().collectionPricingBounds[tokenAddress].isImmutable;
    }

    /**
     * @notice Returns whether or not the price of a specific token is immutable.
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  tokenId      The token id.
     * @return True if the floor and ceiling price for the specified token contract and tokenId has been set immutably, false otherwise.
     */
    function isTokenPricingImmutable(address tokenAddress, uint256 tokenId) external view returns (bool) {
        return appStorage().tokenPricingBounds[tokenAddress][tokenId].isImmutable;
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

    function _requireCallerOwnsPaymentMethodWhitelist(uint88 paymentMethodWhitelistId) internal view {
        if(_msgSender() != appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId]) {
            revert PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist();
        }
    }

    function _getFloorAndCeilingPrices(
        address tokenAddress, 
        uint256 tokenId) internal view returns (uint256, uint256) {

        PricingBounds memory tokenLevelPricingBounds = appStorage().tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return (tokenLevelPricingBounds.floorPrice, tokenLevelPricingBounds.ceilingPrice);
        } else {
            PricingBounds memory collectionLevelPricingBounds = appStorage().collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return (collectionLevelPricingBounds.floorPrice, collectionLevelPricingBounds.ceilingPrice);
            }
        }

        return (0, type(uint256).max);
    }

    function _checkAndInvalidateNonce(
        address account, 
        uint256 nonce, 
        bool wasCancellation) internal returns (uint256) {

        mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = appStorage().invalidatedSignatures[account];

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

        return appStorage().masterNonces[account];
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

    function _requireCoinImplementsValidDecimals(address coin) internal view {
        bool validDecimals = false;
        
        try IERC20Metadata(coin).decimals() returns (uint8 coinDecimals) {
            validDecimals = coinDecimals > 0;
        } catch {}

        if(!validDecimals) {
            revert PaymentProcessor__CoinDoesNotImplementDecimalsAndLikelyIsNotAnERC20Token();
        }
    }
}
