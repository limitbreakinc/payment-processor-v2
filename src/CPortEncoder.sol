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

import "./DataTypes.sol";
import "./interfaces/ICPort.sol";

contract cPortEncoder {

    /**************************************************************/
    /*           PAYMENT SETTINGS MANAGEMENT OPERATIONS           */
    /**************************************************************/

    function encodeCreatePaymentMethodWhitelistCalldata(address /*cPortAddress*/, string calldata whitelistName) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "createPaymentMethodWhitelist(string)",
                whitelistName));
    }

    function encodeWhitelistPaymentMethodCalldata(address /*cPortAddress*/, uint88 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "whitelistPaymentMethod(uint88,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    function encodeUnwhitelistPaymentMethodCalldata(address /*cPortAddress*/, uint88 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "unwhitelistPaymentMethod(uint88,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    function encodeSetCollectionPaymentSettingsCalldata(
        address /*cPortAddress*/, 
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

    function encodeSetCollectionPricingBoundsCalldata(
        address /*cPortAddress*/, 
        address tokenAddress, 
        PricingBounds calldata pricingBounds
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPricingBounds(address,(bool,bool,uint120,uint120))",
                tokenAddress,
                pricingBounds));
    }

    function encodeSetTokenPricingBoundsCalldata(
        address /*cPortAddress*/, 
        address tokenAddress, 
        uint256[] calldata tokenIds, 
        PricingBounds[] calldata pricingBounds
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setTokenPricingBounds(address,uint256[],(bool,bool,uint120,uint120)[])",
                tokenAddress,
                tokenIds,
                pricingBounds));
    }

    /**************************************************************/
    /*              ON-CHAIN CANCELLATION OPERATIONS              */
    /**************************************************************/

    function encodeRevokeSingleNonceCalldata(address /*cPortAddress*/, uint256 nonce) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "revokeSingleNonce(uint256)",
                nonce));
    }

    /**************************************************************/
    /*                     TRADING OPERATIONS                     */
    /**************************************************************/

    function encodeBuyListingCalldata(
        address cPortAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        SignatureECDSA memory cosignerSignature
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyListing(bytes32,(uint8,address,address,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256),(uint8,bytes32,bytes32),(uint8,bytes32,bytes32))",
                IcPort(cPortAddress).getDomainSeparator(),
                saleDetails,
                signature,
                cosignerSignature));
    }

    function encodeBulkBuyListingsCalldata(
        address cPortAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        SignatureECDSA[] calldata cosignerSignatures
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkBuyListings(bytes32,(uint8,address,address,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[],(uint8,bytes32,bytes32)[])",
                IcPort(cPortAddress).getDomainSeparator(),
                saleDetailsArray,
                signatures,
                cosignerSignatures));
    }

    function encodeAcceptOfferCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        SignatureECDSA memory cosignerSignature,
        TokenSetProof memory tokenSetProof
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "acceptOffer(bytes32,bool,(uint8,address,address,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256),(uint8,bytes32,bytes32),(uint8,bytes32,bytes32),(bytes32,bytes32[]))",
                IcPort(cPortAddress).getDomainSeparator(),
                isCollectionLevelOffer,
                saleDetails,
                signature,
                cosignerSignature,
                tokenSetProof));
    }

    function encodeBulkAcceptOffersCalldata(
        address cPortAddress, 
        bool areCollectionLevelOffers,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata signatures
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkAcceptOffers(bytes32,bool,(uint8,address,address,address,address,address,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                IcPort(cPortAddress).getDomainSeparator(),
                areCollectionLevelOffers,
                saleDetailsArray,
                signatures));
    }

    function encodeBuyBundledListingCalldata(
        address cPortAddress, 
        SignatureECDSA memory signature,
        BundledOrderExtended memory bundleDetails,
        BundledItem[] calldata items
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyBundledListing(bytes32,(uint8,bytes32,bytes32),((uint8,address,address,address,address,uint256),address,uint256,uint256),(address,uint256,uint256,uint256,uint256,uint256,uint256)[])",
                IcPort(cPortAddress).getDomainSeparator(),
                signature,
                bundleDetails,
                items));
    }

    function encodeSweepCollectionCalldata(
        address cPortAddress, 
        BundledOrderBase memory bundleDetails,
        BundledItem[] calldata items,
        SignatureECDSA[] calldata signatures
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "sweepCollection(bytes32,(uint8,address,address,address,address,uint256),(address,uint256,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[])",
                IcPort(cPortAddress).getDomainSeparator(),
                bundleDetails,
                items,
                signatures));
    }

    /**************************************************************/
    /*                      HELPER FUNCTIONS                      */
    /**************************************************************/

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
