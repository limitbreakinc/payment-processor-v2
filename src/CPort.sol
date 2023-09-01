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

import "./interfaces/CPortEvents.sol";
import "./storage/CPortStorageAccess.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";


contract cPort is EIP712, cPortStorageAccess, cPortEvents {

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

    /**************************************************************/
    /*                    READ ONLY ACCESSORS                     */
    /**************************************************************/

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

    function isCollectionPricingImmutable(address tokenAddress) external view returns (bool) {
        return appStorage().collectionPricingBounds[tokenAddress].isImmutable;
    }

    function isTokenPricingImmutable(address tokenAddress, uint256 tokenId) external view returns (bool) {
        return appStorage().tokenPricingBounds[tokenAddress][tokenId].isImmutable;
    }

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

    /**************************************************************/
    /*           PAYMENT SETTINGS MANAGEMENT OPERATIONS           */
    /**************************************************************/

    function createPaymentMethodWhitelist(bytes calldata data) external returns (uint88 paymentMethodWhitelistId) {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"f83116c9")
            calldatacopy(0x04, data.offset, data.length)

            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0x00, 0x20)

            switch result case 0 {
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            } default {
                returndatacopy(0x00, 0x00, 0x20)
                return (0x00, 0x20)
            }
        }
    }

    function whitelistPaymentMethod(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"c14f3818")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function unwhitelistPaymentMethod(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"0c7c1d0f")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function setCollectionPaymentSettings(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"56559a52")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function setCollectionPricingBounds(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"5e2180e7")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function setTokenPricingBounds(bytes calldata data) external {
        address module = modulePaymentSettings;
        assembly {
            mstore(0x00, hex"b0c88721")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    /**************************************************************/
    /*              ON-CHAIN CANCELLATION OPERATIONS              */
    /**************************************************************/

    function revokeMasterNonce() external {
        address module = moduleOnChainCancellation;
        assembly {
            mstore(0x00, hex"226d4adb")
            let result := delegatecall(gas(), module, 0, 4, 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function revokeSingleNonce(bytes calldata data) external {
        address module = moduleOnChainCancellation;
        assembly {
            mstore(0x00, hex"b6d7dc33")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    /**************************************************************/
    /*                     TRADING OPERATIONS                     */
    /**************************************************************/

    function buyListingForAnyone(bytes calldata data) external payable {
        address module = moduleBuyListing;
        assembly {
            mstore(0x00, hex"3478385d")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function buyListingForSelf(bytes calldata data) external payable {
        address module = moduleBuyListing;
        assembly {
            mstore(0x00, hex"e7445a44")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function buyListingForSelfWithEOA(bytes calldata data) external payable {
        address module = moduleBuyListing;
        assembly {
            mstore(0x00, hex"428b4a34")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function acceptOffer(bytes calldata data) external {
        address module = moduleAcceptOffer;
        assembly {
            mstore(0x00, hex"8f48f433")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function bulkBuyListings(bytes calldata data) external payable {
        address module = moduleBulkBuyListings;
        assembly {
            mstore(0x00, hex"ec5b058f")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function bulkAcceptOffers(bytes calldata data) external {
        address module = moduleBulkAcceptOffers;
        assembly {
            mstore(0x00, hex"50101c27")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function buyBundledListing(bytes calldata data) external payable {
        address module = moduleBuyBundledListing;
        assembly {
            mstore(0x00, hex"c22db4a4")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }

    function sweepCollection(bytes calldata data) external payable {
        address module = moduleSweepCollection;
        assembly {
            mstore(0x00, hex"482a6c6f")
            calldatacopy(0x04, data.offset, data.length)
            let result := delegatecall(gas(), module, 0, add(data.length, 4), 0, 0)
            if iszero(result) {
                // Call has failed, retrieve the error message and revert
                let size := returndatasize()
                returndatacopy(0, 0, size)
                revert(0, size)
            }
        }
    }
}
