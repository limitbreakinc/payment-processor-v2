// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
// | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
// | |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
// | |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
// | |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
// | |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
// | |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
// | |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
// | |              | || |              | || |              | || |              | || |              | || |              | |
// | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
//  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
// 
// By Limit Break, Inc.

import "./IOwnable.sol";
import "./Constants.sol";
import "./DataTypes.sol";
import "./Errors.sol";

import "./interfaces/CPortEvents.sol";

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

import "./storage/CPortStorageAccess.sol";

import "forge-std/console.sol";

contract cPort is Context, EIP712, cPortStorageAccess, cPortEvents {

    address private immutable moduleOnChainCancellation;
    address private immutable moduleBuyListing;
    address private immutable moduleAcceptOffer;
    address private immutable moduleBulkBuyListings;
    address private immutable moduleBulkAcceptOffers;
    address private immutable moduleBuyBundledListing;
    address private immutable moduleSweepCollection;

    constructor(
        address moduleOnChainCancellation_,
        address moduleBuyListing_,
        address moduleAcceptOffer_,
        address moduleBulkBuyListings_,
        address moduleBulkAcceptOffers_,
        address moduleBuyBundledListing_,
        address moduleSweepCollection_) 
        EIP712("cPort", "1") {
        moduleOnChainCancellation = moduleOnChainCancellation_;
        moduleBuyListing = moduleBuyListing_;
        moduleAcceptOffer = moduleAcceptOffer_;
        moduleBulkBuyListings = moduleBulkBuyListings_;
        moduleBulkAcceptOffers = moduleBulkAcceptOffers_;
        moduleBuyBundledListing = moduleBuyBundledListing_;
        moduleSweepCollection = moduleSweepCollection_;
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

        mapping (address => bool) storage ptrPaymentMethodWhitelist = appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (ptrPaymentMethodWhitelist[paymentMethod]) {
            revert cPort__PaymentMethodIsAlreadyApproved();
        }

        ptrPaymentMethodWhitelist[paymentMethod] = true;
        emit PaymentMethodAddedToWhitelist(paymentMethodWhitelistId, paymentMethod);
    }

    function unwhitelistPaymentMethod(uint88 paymentMethodWhitelistId, address paymentMethod) external {
        _requireCallerOwnsPaymentMethodWhitelist(paymentMethodWhitelistId);

        mapping (address => bool) storage ptrPaymentMethodWhitelist = appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId];

        if (!ptrPaymentMethodWhitelist[paymentMethod]) {
            revert cPort__CoinIsNotApproved();
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
                revert cPort__PaymentMethodWhitelistDoesNotExist();
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
            revert cPort__PricingBoundsAreImmutable();
        }

        if(pricingBounds.floorPrice > pricingBounds.ceilingPrice) {
            revert cPort__CeilingPriceMustBeGreaterThanFloorPrice();
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
            revert cPort__InputArrayLengthMismatch();
        }

        if(tokenIds.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        mapping (uint256 => PricingBounds) storage ptrTokenPricingBounds = appStorage().tokenPricingBounds[tokenAddress];

        uint256 tokenId;
        for(uint256 i = 0; i < tokenIds.length;) {
            tokenId = tokenIds[i];
            PricingBounds memory pricingBounds_ = pricingBounds[i];

            if(ptrTokenPricingBounds[tokenId].isImmutable) {
                revert cPort__PricingBoundsAreImmutable();
            }

            if(pricingBounds_.floorPrice > pricingBounds_.ceilingPrice) {
                revert cPort__CeilingPriceMustBeGreaterThanFloorPrice();
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
        address module = moduleOnChainCancellation;
        assembly {
            mstore(0x00, hex"226d4adb")
            let result := delegatecall(gas(), module, 0, 4, 0, 0)
        }
    }

    function encodeRevokeSingleNonceCalldata(uint256 nonce) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "revokeSingleNonce(uint256)",
                nonce));
    }

    function revokeSingleNonce(bytes calldata data) external {
        address module = moduleOnChainCancellation;
        assembly {
            mstore(0x00, hex"b6d7dc33")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeBuyListingCalldata(
        Order memory saleDetails, 
        SignatureECDSA memory signature) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyListing(bytes32,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256),(uint8,bytes32,bytes32))",
                getDomainSeparator(),
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
                getDomainSeparator(),
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

    function encodeBulkBuyListingsCalldata(
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkBuyListings(bytes32,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                getDomainSeparator(),
                saleDetailsArray,
                signatures));
    }

    function bulkBuyListings(bytes calldata data) external payable {
        address module = moduleBulkBuyListings;
        assembly {
            mstore(0x00, hex"ec5b058f")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeBulkAcceptOffersCalldata(
        bool areCollectionLevelOffers,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkAcceptOffers(bytes32,bool,(uint8,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                getDomainSeparator(),
                areCollectionLevelOffers,
                saleDetailsArray,
                signatures));
    }

    function bulkAcceptOffers(bytes calldata data) external {
        address module = moduleBulkAcceptOffers;
        assembly {
            mstore(0x00, hex"50101c27")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeBuyBundledListingCalldata(
        SignatureECDSA memory signature,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] calldata items) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyBundledListing(bytes32,(uint8,bytes32,bytes32),((uint8,address,address,address,address,uint256),address,uint256,uint256),(address,uint256,uint256,uint256,uint256,uint256,uint256)[])",
                getDomainSeparator(),
                signature,
                bundleDetails,
                items));
    }

    function buyBundledListing(bytes calldata data) external payable {
        address module = moduleBuyBundledListing;
        assembly {
            mstore(0x00, hex"c22db4a4")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeSweepCollectionCalldata(
        BundledOrderBase memory bundleDetails,
        BundledItem[] calldata items,
        SignatureECDSA[] calldata signatures) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "sweepCollection(bytes32,(uint8,address,address,address,address,uint256),(address,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                getDomainSeparator(),
                bundleDetails,
                items,
                signatures));
    }

    function sweepCollection(bytes calldata data) external payable {
        address module = moduleSweepCollection;
        assembly {
            mstore(0x00, hex"482a6c6f")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function getDomainSeparator() public view returns (bytes32) {
        return _domainSeparatorV4();
    }

    function masterNonces(address account) public view returns (uint256) {
        return appStorage().masterNonces[account];
    }

    function collectionPaymentSettings(address tokenAddress) external view returns (CollectionPaymentSettings memory) {
        return appStorage().collectionPaymentSettings[tokenAddress];
    }

    function paymentMethodWhitelistOwners(uint88 paymentMethodWhitelistId) external view returns (address) {
        return appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId];
    }

    function isPaymentMethodWhitelisted(uint88 paymentMethodWhitelistId, address paymentMethod) external view returns (bool) {
        return appStorage().collectionPaymentMethodWhitelists[paymentMethodWhitelistId][paymentMethod];
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
            revert cPort__CallerDoesNotOwnPaymentMethodWhitelist();
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
            revert cPort__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
        }
    }

    function _removeFirst4Bytes(bytes memory data) private pure returns (bytes memory) {
        if (data.length < 4) {
            revert("cPort__DataLengthTooShort()");
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
}