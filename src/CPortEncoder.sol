// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |     ______   | || |              | || |   ______     | || |     ____     | || |  _______     | || |  _________   | |
| |   .' ___  |  | || |              | || |  |_   __ \   | || |   .'    `.   | || | |_   __ \    | || | |  _   _  |  | |
| |  / .'   \_|  | || |    ______    | || |    | |__) |  | || |  /  .--.  \  | || |   | |__) |   | || | |_/ | | \_|  | |
| |  | |         | || |   |______|   | || |    |  ___/   | || |  | |    | |  | || |   |  __ /    | || |     | |      | |
| |  \ `.___.'\  | || |              | || |   _| |_      | || |  \  `--'  /  | || |  _| |  \ \_  | || |    _| |_     | |
| |   `._____.'  | || |              | || |  |_____|     | || |   `.____.'   | || | |____| |___| | || |   |_____|    | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
 
 By Limit Break, Inc.
*/ 

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

    function encodeWhitelistPaymentMethodCalldata(address /*cPortAddress*/, uint32 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "whitelistPaymentMethod(uint32,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    function encodeUnwhitelistPaymentMethodCalldata(address /*cPortAddress*/, uint32 paymentMethodWhitelistId, address paymentMethod) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "unwhitelistPaymentMethod(uint32,address)",
                paymentMethodWhitelistId,
                paymentMethod));
    }

    function encodeSetCollectionPaymentSettingsCalldata(
        address /*cPortAddress*/, 
        address tokenAddress, 
        PaymentSettings paymentSettings,
        uint32 paymentMethodWhitelistId,
        address constrainedPricingPaymentMethod,
        uint16 royaltyBackfillNumerator,
        address royaltyBackfillReceiver,
        uint16 royaltyBountyNumerator,
        address exclusiveBountyReceiver
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPaymentSettings(address,uint8,uint32,address,uint16,address,uint16,address)",
                tokenAddress,
                paymentSettings,
                paymentMethodWhitelistId,
                constrainedPricingPaymentMethod,
                royaltyBackfillNumerator,
                royaltyBackfillReceiver,
                royaltyBountyNumerator,
                exclusiveBountyReceiver));
    }

    function encodeSetCollectionPricingBoundsCalldata(
        address /*cPortAddress*/, 
        address tokenAddress, 
        PricingBounds calldata pricingBounds
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "setCollectionPricingBounds(address,(bool,uint120,uint120))",
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
                "setTokenPricingBounds(address,uint256[],(bool,uint120,uint120)[])",
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

    function encodeRevokeOrderDigestCalldata(address /*cPortAddress*/, bytes32 digest) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "revokeOrderDigest(bytes32)",
                digest));
    }

    /**************************************************************/
    /*                     TRADING OPERATIONS                     */
    /**************************************************************/

    function encodeBuyListingCalldata(
        address cPortAddress, 
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "buyListing(bytes32,(uint8,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248),(uint8,bytes32,bytes32),(address,address,uint256,uint8,bytes32,bytes32),(address,uint256))",
                IcPort(cPortAddress).getDomainSeparator(),
                saleDetails,
                signature,
                cosignature,
                feeOnTop));
    }

    function encodeAcceptOfferCalldata(
        address cPortAddress, 
        bool isCollectionLevelOffer,
        Order memory saleDetails, 
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "acceptOffer(bytes32,bool,(uint8,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248),(uint8,bytes32,bytes32),(bytes32,bytes32[]),(address,address,uint256,uint8,bytes32,bytes32),(address,uint256))",
                IcPort(cPortAddress).getDomainSeparator(),
                isCollectionLevelOffer,
                saleDetails,
                signature,
                tokenSetProof,
                cosignature,
                feeOnTop));
    }

    function encodeBulkBuyListingsCalldata(
        address cPortAddress, 
        Order[] calldata saleDetailsArray, 
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures,
        FeeOnTop[] calldata feesOnTop
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkBuyListings(bytes32,(uint8,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248)[],(uint8,bytes32,bytes32)[],(address,address,uint256,uint8,bytes32,bytes32)[],(address,uint256)[])",
                IcPort(cPortAddress).getDomainSeparator(),
                saleDetailsArray,
                signatures,
                cosignatures,
                feesOnTop));
    }

    function encodeBulkAcceptOffersCalldata(
        address cPortAddress, 
        bool[] memory isCollectionLevelOfferArray,
        Order[] memory saleDetailsArray,
        SignatureECDSA[] memory signatures,
        TokenSetProof[] memory tokenSetProofsArray,
        Cosignature[] memory cosignaturesArray,
        FeeOnTop[] memory feesOnTopArray
    ) external view returns (bytes memory) {
        BulkAcceptOffersParams memory params = BulkAcceptOffersParams({
            isCollectionLevelOfferArray: isCollectionLevelOfferArray,
            saleDetailsArray: saleDetailsArray,
            buyerSignaturesArray: signatures,
            tokenSetProofsArray: tokenSetProofsArray,
            cosignaturesArray: cosignaturesArray,
            feesOnTopArray: feesOnTopArray
        });

        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "bulkAcceptOffers(bytes32,(bool[],(uint8,address,address,address,address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256,uint248,uint248)[],(uint8,bytes32,bytes32)[],(bytes32,bytes32[])[],(address,address,uint256,uint8,bytes32,bytes32)[],(address,uint256)[]))",
                IcPort(cPortAddress).getDomainSeparator(),
                params));
    }

    function encodeSweepCollectionCalldata(
        address cPortAddress, 
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] calldata items,
        SignatureECDSA[] calldata signatures,
        Cosignature[] calldata cosignatures
    ) external view returns (bytes memory) {
        return _removeFirst4Bytes(
            abi.encodeWithSignature(
                "sweepCollection(bytes32,(address,uint256),(uint8,address,address,address),(address,address,uint256,uint248,uint256,uint256,uint256,uint256,uint256)[],(uint8,bytes32,bytes32)[],(address,address,uint256,uint8,bytes32,bytes32)[])",
                IcPort(cPortAddress).getDomainSeparator(),
                feeOnTop,
                sweepOrder,
                items,
                signatures,
                cosignatures));
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
            if iszero(staticcall(gas(), 0x04, add(data, 0x24), mload(result), add(result, 0x20), mload(result))){
              revert(0,0)
            }
        }
    }
}
