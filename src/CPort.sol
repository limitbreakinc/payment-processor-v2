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
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";

contract cPort is EIP712, Ownable, Pausable, cPortStorageAccess, cPortEvents {

    address private immutable modulePaymentSettings;
    address private immutable moduleOnChainCancellation;
    address private immutable moduleSingleTrades;
    address private immutable moduleSingleTradesCosigned;
    address private immutable moduleBulkTrades;
    address private immutable moduleBulkTradesCosigned;
    address private immutable moduleSweepCollection;

    constructor(
        address defaultContractOwner_,
        address modulePaymentSettings_,
        address moduleOnChainCancellation_,
        address moduleSingleTrades_,
        address moduleSingleTradesCosigned_,
        address moduleBulkTrades_,
        address moduleBulkTradesCosigned_,
        address moduleSweepCollection_) 
        EIP712("cPort", "1") {
        modulePaymentSettings = modulePaymentSettings_;
        moduleOnChainCancellation = moduleOnChainCancellation_;
        moduleSingleTrades = moduleSingleTrades_;
        moduleSingleTradesCosigned = moduleSingleTradesCosigned_;
        moduleBulkTrades = moduleBulkTrades_;
        moduleBulkTradesCosigned = moduleBulkTradesCosigned_;
        moduleSweepCollection = moduleSweepCollection_;

        _transferOwnership(defaultContractOwner_);
    }

    /**************************************************************/
    /*                  CONTRACT OWNER FUNCTIONS                  */
    /**************************************************************/

    /**
     * @notice Allows cPort contract owner to pause trading on this contract.  This is only to be used
     *         in case a future vulnerability emerges to allow a migration to an updated contract.
     *
     * @dev    Throws when caller is not the contract owner.
     * @dev    Throws when contract is already paused.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The contract has been placed in the `paused` state.
     * @dev    2. Trading is frozen.
     */
    function pause() external {
        _checkOwner();
        _pause();
    }

    /**
     * @notice Allows cPort contract owner to resume trading on this contract.  This is only to be used
     *         in case a pause was not necessary and trading can safely resume.
     *
     * @dev    Throws when caller is not the contract owner.
     * @dev    Throws when contract is not currently paused.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The contract has been placed in the `unpaused` state.
     * @dev    2. Trading is resumed.
     */
    function unpause() external {
        _checkOwner();
        _unpause();
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

    function collectionBountySettings(address tokenAddress) external view returns (uint16 royaltyBountyNumerator, address exclusiveBountyReceiver) {
        CollectionPaymentSettings memory collectionPaymentSettings = appStorage().collectionPaymentSettings[tokenAddress];
        return (
            collectionPaymentSettings.royaltyBountyNumerator, 
            collectionPaymentSettings.isRoyaltyBountyExclusive ? 
                appStorage().collectionExclusiveBountyReceivers[tokenAddress] : 
                address(0));
    }

    function collectionRoyaltyBackfillSettings(address tokenAddress) external view returns (uint16 royaltyBackfillNumerator, address royaltyBackfillReceiver) {
        CollectionPaymentSettings memory collectionPaymentSettings = appStorage().collectionPaymentSettings[tokenAddress];
        return (
            collectionPaymentSettings.royaltyBackfillNumerator, 
            collectionPaymentSettings.royaltyBackfillNumerator > 0 ?
                appStorage().collectionRoyaltyBackfillReceivers[tokenAddress] : 
                address(0));
    }

    function paymentMethodWhitelistOwners(uint32 paymentMethodWhitelistId) external view returns (address) {
        return appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId];
    }

    function isPaymentMethodWhitelisted(uint32 paymentMethodWhitelistId, address paymentMethod) external view returns (bool) {
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

    function createPaymentMethodWhitelist(bytes calldata data) external returns (uint32 paymentMethodWhitelistId) {
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
            mstore(0x00, hex"bb39ce91")
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
            mstore(0x00, hex"e9d4c14e")
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
            mstore(0x00, hex"eeabfa03")
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
    /*                      TAKER OPERATIONS                      */
    /**************************************************************/

    function buyListing(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSingleTrades;
        assembly {
            mstore(0x00, hex"be0af963")
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

    function buyListingWithFeeOnTop(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSingleTrades;
        assembly {
            mstore(0x00, hex"a59eda2d")
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

    function buyListingCosigned(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSingleTradesCosigned;
        assembly {
            mstore(0x00, hex"ddb75e64")
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

    function buyListingCosignedWithFeeOnTop(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSingleTradesCosigned;
        assembly {
            mstore(0x00, hex"4f2c9506")
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
        _requireNotPaused();
        address module = moduleSingleTrades;
        assembly {
            mstore(0x00, hex"208cad1a")
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

    function acceptOfferWithFeeOnTop(bytes calldata data) external {
        _requireNotPaused();
        address module = moduleSingleTrades;
        assembly {
            mstore(0x00, hex"a9427fc4")
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

    function acceptOfferCosigned(bytes calldata data) external {
        _requireNotPaused();
        address module = moduleSingleTradesCosigned;
        assembly {
            mstore(0x00, hex"ef050907")
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

    function acceptOfferCosignedWithFeeOnTop(bytes calldata data) external {
        _requireNotPaused();
        address module = moduleSingleTradesCosigned;
        assembly {
            mstore(0x00, hex"84bbfbff")
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
        _requireNotPaused();
        address module = moduleBulkTrades;
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

    function bulkBuyListingsWithFeesOnTop(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleBulkTrades;
        assembly {
            mstore(0x00, hex"fcf3e6f5")
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

    function bulkBuyListingsCosigned(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleBulkTradesCosigned;
        assembly {
            mstore(0x00, hex"196281be")
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

    function bulkBuyListingsCosignedWithFeesOnTop(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleBulkTradesCosigned;
        assembly {
            mstore(0x00, hex"fa2d3368")
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
        _requireNotPaused();
        address module = moduleBulkTrades;
        assembly {
            mstore(0x00, hex"babbda57")
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

    function bulkAcceptOffersWithFeesOnTop(bytes calldata data) external {
        _requireNotPaused();
        address module = moduleBulkTrades;
        assembly {
            mstore(0x00, hex"54eccc1d")
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

    function bulkAcceptOffersCosigned(bytes calldata data) external {
        _requireNotPaused();
        address module = moduleBulkTradesCosigned;
        assembly {
            mstore(0x00, hex"7359eaed")
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

    function bulkAcceptOffersCosignedWithFeesOnTop(bytes calldata data) external {
        _requireNotPaused();
        address module = moduleBulkTradesCosigned;
        assembly {
            mstore(0x00, hex"53b8ecae")
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
        _requireNotPaused();
        address module = moduleSweepCollection;
        assembly {
            mstore(0x00, hex"2daa77c7")
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

    function sweepCollectionWithFeeOnTop(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSweepCollection;
        assembly {
            mstore(0x00, hex"6eef207c")
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

    function sweepCollectionCosigned(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSweepCollection;
        assembly {
            mstore(0x00, hex"3c085444")
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

    function sweepCollectionCosignedWithFeeOnTop(bytes calldata data) external payable {
        _requireNotPaused();
        address module = moduleSweepCollection;
        assembly {
            mstore(0x00, hex"d2ec183f")
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
