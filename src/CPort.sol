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

    address private immutable modulePaymentSettings;
    address private immutable moduleOnChainCancellation;
    address private immutable moduleBuyListing;
    address private immutable moduleAcceptOffer;
    address private immutable moduleBulkBuyListings;
    address private immutable moduleBulkAcceptOffers;
    address private immutable moduleBuyBundledListing;
    address private immutable moduleSweepCollection;

    constructor(
        address modulePaymentSettings_,
        address moduleOnChainCancellation_,
        address moduleBuyListing_,
        address moduleAcceptOffer_,
        address moduleBulkBuyListings_,
        address moduleBulkAcceptOffers_,
        address moduleBuyBundledListing_,
        address moduleSweepCollection_) 
        EIP712("cPort", "1") {
        modulePaymentSettings = modulePaymentSettings_;
        moduleOnChainCancellation = moduleOnChainCancellation_;
        moduleBuyListing = moduleBuyListing_;
        moduleAcceptOffer = moduleAcceptOffer_;
        moduleBulkBuyListings = moduleBulkBuyListings_;
        moduleBulkAcceptOffers = moduleBulkAcceptOffers_;
        moduleBuyBundledListing = moduleBuyBundledListing_;
        moduleSweepCollection = moduleSweepCollection_;
    }

    function encodeCreatePaymentMethodWhitelistCalldata(string calldata whitelistName) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "createPaymentMethodWhitelist(string)",
                whitelistName));
    }

    function createPaymentMethodWhitelist(bytes calldata data) external returns (uint88 paymentMethodWhitelistId) {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"f83116c9")
            calldatacopy(0x04, data.offset, data.length)

            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0x00, 0x20)

            returndatacopy(0x00, 0x00, 0x20)
            switch result case 0 {
                revert(0, 0)
            } default {
                return (0x00, 0x20)
            }
        }
    }

    function encodeWhitelistPaymentMethodCalldata(uint88 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "whitelistPaymentMethod(uint88,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    function whitelistPaymentMethod(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"c14f3818")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeUnwhitelistPaymentMethodCalldata(uint88 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "unwhitelistPaymentMethod(uint88,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    function unwhitelistPaymentMethod(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"0c7c1d0f")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeSetCollectionPaymentSettingsCalldata(
        address tokenAddress, 
        PaymentSettings paymentSettings,
        uint88 paymentMethodWhitelistId,
        address constrainedPricingPaymentMethod
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPaymentSettings(address,uint8,uint88,address)",
                tokenAddress,
                paymentSettings,
                paymentMethodWhitelistId,
                constrainedPricingPaymentMethod));
    }

    function setCollectionPaymentSettings(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"56559a52")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeSetCollectionPricingBoundsCalldata(address tokenAddress, PricingBounds calldata pricingBounds) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPricingBounds(address,(bool,bool,uint120,uint120))",
                tokenAddress,
                pricingBounds));
    }

    function setCollectionPricingBounds(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"5e2180e7")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
        }
    }

    function encodeSetTokenPricingBoundsCalldata(
        address tokenAddress, 
        uint256[] calldata tokenIds, 
        PricingBounds[] calldata pricingBounds) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setTokenPricingBounds(address,uint256[],(bool,bool,uint120,uint120)[])",
                tokenAddress,
                pricingBounds));
    }

    function setTokenPricingBounds(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"b0c88721")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
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
        PricingBounds memory tokenLevelPricingBounds = appStorage().tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return tokenLevelPricingBounds.floorPrice;
        } else {
            PricingBounds memory collectionLevelPricingBounds = appStorage().collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return collectionLevelPricingBounds.floorPrice;
            }
        }

        return 0;
    }

    /**
     * @notice Gets the ceiling price for the specified nft contract address and token id.
     *
     * @param  tokenAddress The smart contract address of the NFT collection.
     * @param  tokenId      The token id.
     * @return The ceiling price.
     */
    function getCeilingPrice(address tokenAddress, uint256 tokenId) external view returns (uint256) {
        PricingBounds memory tokenLevelPricingBounds = appStorage().tokenPricingBounds[tokenAddress][tokenId];
        if (tokenLevelPricingBounds.isSet) {
            return tokenLevelPricingBounds.ceilingPrice;
        } else {
            PricingBounds memory collectionLevelPricingBounds = appStorage().collectionPricingBounds[tokenAddress];
            if (collectionLevelPricingBounds.isSet) {
                return collectionLevelPricingBounds.ceilingPrice;
            }
        }

        return type(uint256).max;
    }

    function _removeFirst4Bytes(bytes memory data) private view returns (bytes memory result) {
        assembly {
            if lt(mload(data), 0x04) {
                revert(0,0)
            }
            mstore(result, sub(mload(data), 0x04))
            let a := staticcall(gas(), 0x04, add(data, 0x24), sub(mload(data), 0x04), add(result, 0x20), mload(result))
        }
    }
}
