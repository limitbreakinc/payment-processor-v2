// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../IOwnable.sol";
import "../interfaces/IPaymentProcessorConfiguration.sol";
import "../interfaces/IPaymentProcessorEvents.sol";
import "../storage/PaymentProcessorStorageAccess.sol";
import "../Constants.sol";
import "../Errors.sol";

import "@openzeppelin/contracts/access/IAccessControl.sol";
import "@openzeppelin/contracts/interfaces/IERC1271.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

import {TrustedForwarderERC2771Context} from "@limitbreak/trusted-forwarder/TrustedForwarderERC2771Context.sol";

/*
                                                     @@@@@@@@@@@@@@             
                                                    @@@@@@@@@@@@@@@@@@(         
                                                   @@@@@@@@@@@@@@@@@@@@@        
                                                  @@@@@@@@@@@@@@@@@@@@@@@@      
                                                           #@@@@@@@@@@@@@@      
                                                               @@@@@@@@@@@@     
                            @@@@@@@@@@@@@@*                    @@@@@@@@@@@@     
                           @@@@@@@@@@@@@@@     @               @@@@@@@@@@@@     
                          @@@@@@@@@@@@@@@     @                @@@@@@@@@@@      
                         @@@@@@@@@@@@@@@     @@               @@@@@@@@@@@@      
                        @@@@@@@@@@@@@@@     #@@             @@@@@@@@@@@@/       
                        @@@@@@@@@@@@@@.     @@@@@@@@@@@@@@@@@@@@@@@@@@@         
                       @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@            
                      @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@             
                     @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@           
                    @@@@@@@@@@@@@@@     @@@@@&%%%%%%%%&&@@@@@@@@@@@@@@          
                    @@@@@@@@@@@@@@      @@@@@               @@@@@@@@@@@         
                   @@@@@@@@@@@@@@@     @@@@@                 @@@@@@@@@@@        
                  @@@@@@@@@@@@@@@     @@@@@@                 @@@@@@@@@@@        
                 @@@@@@@@@@@@@@@     @@@@@@@                 @@@@@@@@@@@        
                @@@@@@@@@@@@@@@     @@@@@@@                 @@@@@@@@@@@&        
                @@@@@@@@@@@@@@     *@@@@@@@               (@@@@@@@@@@@@         
               @@@@@@@@@@@@@@@     @@@@@@@@             @@@@@@@@@@@@@@          
              @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           
             @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
            @@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@              
           .@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                 
           @@@@@@@@@@@@@@%     @@@@@@@@@@@@@@@@@@@@@@@@(                        
          @@@@@@@@@@@@@@@                                                       
         @@@@@@@@@@@@@@@                                                        
        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                         
       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                          
       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&                                          
      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                           
 
* @title Payment Processor
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 

abstract contract PaymentProcessorModule is 
    TrustedForwarderERC2771Context, 
    PaymentProcessorStorageAccess, 
    IPaymentProcessorEvents {

    using EnumerableSet for EnumerableSet.AddressSet;

    // Recommendations For Default Immutable Payment Methods Per Chain
    // Default Payment Method 1: Wrapped Native Coin
    // Default Payment Method 2: Wrapped ETH
    // Default Payment Method 3: USDC (Native)
    // Default Payment Method 4: USDC (Bridged)

    /// @dev The amount of gas units to be supplied with native token transfers.
    uint256 private immutable pushPaymentGasLimit;

    /// @dev The address of the ERC20 contract used for wrapped native token.
    address public immutable wrappedNativeCoinAddress;

    /// @dev The first default payment method defined at contract deployment. Immutable to save SLOAD cost.
    address private immutable defaultPaymentMethod1;

    /// @dev The second default payment method defined at contract deployment. Immutable to save SLOAD cost.
    address private immutable defaultPaymentMethod2;

    /// @dev The third default payment method defined at contract deployment. Immutable to save SLOAD cost.
    address private immutable defaultPaymentMethod3;

    /// @dev The fourth default payment method defined at contract deployment. Immutable to save SLOAD cost.
    address private immutable defaultPaymentMethod4;

    constructor(address configurationContract)
    TrustedForwarderERC2771Context(
        IPaymentProcessorConfiguration(configurationContract).getPaymentProcessorModuleERC2771ContextParams()
    ) {
        (
            uint32 pushPaymentGasLimit_,
            address wrappedNativeCoinAddress_,
            DefaultPaymentMethods memory defaultPaymentMethods
        ) = IPaymentProcessorConfiguration(configurationContract).getPaymentProcessorModuleDeploymentParams();
        
        if (pushPaymentGasLimit_ == 0 || wrappedNativeCoinAddress_ == address(0)) {
            revert PaymentProcessor__InvalidConstructorArguments();
        }

        pushPaymentGasLimit = pushPaymentGasLimit_;
        wrappedNativeCoinAddress = wrappedNativeCoinAddress_;
        defaultPaymentMethod1 = defaultPaymentMethods.defaultPaymentMethod1;
        defaultPaymentMethod2 = defaultPaymentMethods.defaultPaymentMethod2;
        defaultPaymentMethod3 = defaultPaymentMethods.defaultPaymentMethod3;
        defaultPaymentMethod4 = defaultPaymentMethods.defaultPaymentMethod4;
    }

    /*************************************************************************/
    /*                        Default Payment Methods                        */
    /*************************************************************************/

    /**
     * @notice Returns true if `paymentMethod` is a default payment method.
     * 
     * @dev    This function will return true if the default payment method was added after contract deployment.
     */
    function _isDefaultPaymentMethod(address paymentMethod) internal view returns (bool) {
        if (paymentMethod == address(0)) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod1) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod2) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod3) {
            return true;
        } else if (paymentMethod == defaultPaymentMethod4) {
            return true;
        } else {
            // If it isn't one of the gas efficient immutable default payment methods,
            // it may have bee added to the fallback default payment method whitelist,
            // but there are SLOAD costs.
            return appStorage().collectionPaymentMethodWhitelists[DEFAULT_PAYMENT_METHOD_WHITELIST_ID].contains(paymentMethod);
        }
    }

    /**
     * @notice Returns an array of the default payment methods defined at contract deployment.
     * 
     * @dev    This array will **NOT** include default payment methods added after contract deployment.
     */
    function _getDefaultPaymentMethods() internal view returns (address[] memory) {
        address[] memory defaultPaymentMethods = new address[](5);
        defaultPaymentMethods[0] = address(0);
        defaultPaymentMethods[1] = defaultPaymentMethod1;
        defaultPaymentMethods[2] = defaultPaymentMethod2;
        defaultPaymentMethods[3] = defaultPaymentMethod3;
        defaultPaymentMethods[4] = defaultPaymentMethod4;
        return defaultPaymentMethods;
    }

    /*************************************************************************/
    /*                            Order Execution                            */
    /*************************************************************************/

    /**
     * @notice Checks order validation and fulfills a buy listing order.
     * 
     * @dev    This function may be called multiple times during a bulk execution.
     * @dev    Throws when a partial fill order is not equally divisible by the number of items in the order.
     * 
     * @param context             The current execution context to determine the taker.
     * @param startingNativeFunds The amount of native funds available at the beginning of the order execution.
     * @param saleDetails         The order execution details.
     * @param signedSellOrder     The maker's signature authorizing the order execution.
     * @param cosignature         The additional cosignature for a cosigned order, if applicable.
     * @param feeOnTop            The additional fee to add on top of the order, paid by taker.
     * 
     * @return endingNativeFunds  The amount of native funds available at the end of the order execution.
     */
    function _executeOrderBuySide(
        TradeContext memory context,
        uint256 startingNativeFunds,
        Order memory saleDetails,
        SignatureECDSA memory signedSellOrder,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) internal returns (uint256 endingNativeFunds) {
        uint248 quantityToFill = _verifySaleApproval(
            context, 
            saleDetails, 
            signedSellOrder, 
            cosignature);

        if (quantityToFill != saleDetails.amount) {
            if (saleDetails.itemPrice % saleDetails.amount != 0) {
                revert PaymentProcessor__PartialFillsNotSupportedForNonDivisibleItems();
            }

            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty = _validateBasicOrderDetails(context, saleDetails);

        endingNativeFunds = _fulfillSingleOrderWithFeeOnTop(
            startingNativeFunds,
            context,
            context.taker,
            saleDetails.maker,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(Sides.Buy, saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            royaltyBackfillAndBounty,
            feeOnTop);
    }

    /**
     * @notice Checks order validation and fulfills an offer acceptance.
     * 
     * @dev    This function may be called multiple times during a bulk execution.
     * @dev    Throws when the payment method is the chain native token.
     * @dev    Throws when the supplied token for a token set offer cannot be validated with the root hash and proof.
     * @dev    Throws when a partial fill order is not equally divisible by the number of items in the order.
     * 
     * @param context                The current execution context to determine the taker.
     * @param  isCollectionLevelOrder The flag to indicate if an offer is for any token in the collection.
     * @param  saleDetails            The order execution details.
     * @param  buyerSignature         The maker's signature authorizing the order execution.
     * @param  tokenSetProof          The root hash and merkle proofs for an offer that is a subset of tokens in a collection.
     * @param  cosignature            The additional cosignature for a cosigned order, if applicable.
     * @param  feeOnTop               The additional fee to add on top of the order, paid by taker.
     */
    function _executeOrderSellSide(
        TradeContext memory context,
        bool isCollectionLevelOrder, 
        Order memory saleDetails,
        SignatureECDSA memory buyerSignature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature,
        FeeOnTop memory feeOnTop
    ) internal {
        if (saleDetails.paymentMethod == address(0)) {
            revert PaymentProcessor__BadPaymentMethod();
        }

        uint248 quantityToFill;

        if (isCollectionLevelOrder) {
            if (tokenSetProof.rootHash == bytes32(0)) {
                quantityToFill = _verifyCollectionOffer(
                    context, 
                    saleDetails, 
                    buyerSignature, 
                    cosignature);
            } else {
                if(!MerkleProof.verify(
                    tokenSetProof.proof, 
                    tokenSetProof.rootHash, 
                    keccak256(abi.encode(saleDetails.tokenAddress, saleDetails.tokenId)))) {
                    revert PaymentProcessor__IncorrectTokenSetMerkleProof();
                }

                quantityToFill = _verifyTokenSetOffer(
                    context, 
                    saleDetails, 
                    buyerSignature, 
                    tokenSetProof, 
                    cosignature);
            }
        } else {
            quantityToFill = _verifyItemOffer(
                context,
                saleDetails, 
                buyerSignature, 
                cosignature);
        }

        if (quantityToFill != saleDetails.amount) {
            if (saleDetails.itemPrice % saleDetails.amount != 0) {
                revert PaymentProcessor__PartialFillsNotSupportedForNonDivisibleItems();
            }
            
            saleDetails.itemPrice = saleDetails.itemPrice / saleDetails.amount * quantityToFill;
            saleDetails.amount = quantityToFill;
        }

        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty = _validateBasicOrderDetails(context, saleDetails);

        _fulfillSingleOrderWithFeeOnTop(
            0,
            context,
            saleDetails.maker,
            context.taker,
            IERC20(saleDetails.paymentMethod),
            _getOrderFulfillmentFunctionPointers(Sides.Sell, saleDetails.paymentMethod, saleDetails.protocol),
            saleDetails,
            royaltyBackfillAndBounty,
            feeOnTop);
    }

    /**
     * @notice Checks order validation and fulfills a sweep order.
     * 
     * @dev    Throws when the order protocol is for ERC1155 partial fills.
     * @dev    Throws when the `items`, `signedSellOrders` and `cosignatures` arrays have different lengths.
     * @dev    Throws when the `items` array length is zero.
     * 
     * @param context             The current execution context to determine the taker.
     * @param startingNativeFunds The amount of native funds available at the beginning of the order execution.
     * @param feeOnTop            The additional fee to add on top of the orders, paid by taker.
     * @param sweepOrder          The order information that is common to all items in the sweep.
     * @param items               An array of items that contains the order information unique to each item.
     * @param signedSellOrders    An array of maker signatures authorizing the order execution.
     * @param cosignatures        An array of additional cosignatures for cosigned orders, if applicable.
     * 
     * @return endingNativeFunds  The amount of native funds available at the end of the order execution.
     */
    function _executeSweepOrder(
        TradeContext memory context,
        uint256 startingNativeFunds,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] memory items,
        SignatureECDSA[] memory signedSellOrders,
        Cosignature[] memory cosignatures
    ) internal returns (uint256 endingNativeFunds) {

        if (sweepOrder.protocol == OrderProtocols.ERC1155_FILL_PARTIAL) {
            revert PaymentProcessor__OrderProtocolERC1155FillPartialUnsupportedInSweeps();
        }

        if (items.length != signedSellOrders.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (items.length != cosignatures.length) {
            revert PaymentProcessor__InputArrayLengthMismatch();
        }

        if (items.length == 0) {
            revert PaymentProcessor__InputArrayLengthCannotBeZero();
        }

        (Order[] memory saleDetailsBatch, RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) = 
            _validateSweepOrder(
                context,
                feeOnTop,
                sweepOrder,
                items,
                signedSellOrders,
                cosignatures
            );

        endingNativeFunds = _fulfillSweepOrderWithFeeOnTop(
            context,
            startingNativeFunds,
            SweepCollectionComputeAndDistributeProceedsParams({
                paymentCoin: IERC20(sweepOrder.paymentMethod),
                fnPointers: _getOrderFulfillmentFunctionPointers(
                    Sides.Buy, 
                    sweepOrder.paymentMethod, 
                    sweepOrder.protocol),
                feeOnTop: feeOnTop,
                royaltyBackfillAndBounty: royaltyBackfillAndBounty,
                saleDetailsBatch: saleDetailsBatch
            })
        );
    }

    /*************************************************************************/
    /*                           Order Validation                            */
    /*************************************************************************/

    /**
     * @notice Loads collection payment settings to validate a single item order.
     * 
     * @dev    This function may be called multiple times during a bulk execution.
     * @dev    Throws when a collection is set to block untrusted channels and the transaction originates 
     * @dev    from an untrusted channel.
     * @dev    Throws when the maker or taker is a banned account for the collection.
     * @dev    Throws when the payment method is not an allowed payment method.
     * @dev    Throws when the sweep order is for ERC721 tokens and the amount is set to a value other than one.
     * @dev    Throws when the sweep order is for ERC1155 tokens and the amount is set to zero.
     * @dev    Throws when the marketplace fee and maximum royalty fee will exceed the sales price of an item.
     * @dev    Throws when the current block time is greater than the order expiration.
     * 
     * @param context     The current execution context to determine the taker.
     * @param saleDetails The order execution details.
     * 
     * @return royaltyBackfillAndBounty The on-chain royalty backfill and bounty information defined by the creator.
     */
    function _validateBasicOrderDetails(
        TradeContext memory context,
        Order memory saleDetails
    ) private view returns (RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) {
        if (saleDetails.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
            if (saleDetails.amount != ONE) {
                revert PaymentProcessor__AmountForERC721SalesMustEqualOne();
            }
        } else {
            if (saleDetails.amount == 0) {
                revert PaymentProcessor__AmountForERC1155SalesGreaterThanZero();
            }
        }

        if (block.timestamp > saleDetails.expiration) {
            revert PaymentProcessor__OrderHasExpired();
        }

        if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
            revert PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
        }

        CollectionPaymentSettings storage paymentSettingsForCollection = 
            appStorage().collectionPaymentSettings[saleDetails.tokenAddress];

        PaymentSettings paymentSettings = paymentSettingsForCollection.paymentSettings;
        royaltyBackfillAndBounty.backfillNumerator = paymentSettingsForCollection.royaltyBackfillNumerator;
        royaltyBackfillAndBounty.bountyNumerator = paymentSettingsForCollection.royaltyBountyNumerator;

        if (paymentSettingsForCollection.blockBannedAccounts) {
            EnumerableSet.AddressSet storage bannedAccounts = 
                appStorage().collectionBannedAccounts[saleDetails.tokenAddress];

            if (bannedAccounts.contains(saleDetails.maker)) {
                revert PaymentProcessor__MakerOrTakerIsBannedAccount();
            }

            if (bannedAccounts.contains(context.taker)) {
                revert PaymentProcessor__MakerOrTakerIsBannedAccount();
            }
        }

        if (paymentSettingsForCollection.blockTradesFromUntrustedChannels) {
            EnumerableSet.AddressSet storage trustedChannels = 
                appStorage().collectionTrustedChannels[saleDetails.tokenAddress];

            if (trustedChannels.length() > 0) {
                if (!trustedChannels.contains(context.channel)) {
                    revert PaymentProcessor__TradeOriginatedFromUntrustedChannel();
                }
            }
        }

        if (paymentSettingsForCollection.royaltyBackfillNumerator > 0) {
            royaltyBackfillAndBounty.backfillReceiver = 
                appStorage().collectionRoyaltyBackfillReceivers[saleDetails.tokenAddress];
        }

        if (paymentSettingsForCollection.isRoyaltyBountyExclusive) {
            royaltyBackfillAndBounty.exclusiveMarketplace = 
                appStorage().collectionExclusiveBountyReceivers[saleDetails.tokenAddress];
        }
        
        if (paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!_isDefaultPaymentMethod(saleDetails.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!appStorage().collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId].contains(saleDetails.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != saleDetails.paymentMethod) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }

            _validateSalePriceInRange(
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount, 
                saleDetails.itemPrice);
        }
    }

    /**
     * @notice Loads collection payment settings to validate a sweep order.
     * 
     * @dev    Throws when a collection is set to block untrusted channels and the transaction originates 
     * @dev    from an untrusted channel.
     * @dev    Throws when the payment method is not an allowed payment method.
     * @dev    Throws when the sweep order is for ERC721 tokens and the amount is set to a value other than one.
     * @dev    Throws when the sweep order is for ERC1155 tokens and the amount is set to zero.
     * @dev    Throws when the marketplace fee and maximum royalty fee will exceed the sales price of an item.
     * @dev    Throws when the current block time is greater than the order expiration.
     * @dev    Throws when the fee on top amount exceeds the sum of all items.
     * 
     * @param context          The current execution context to determine the taker.
     * @param feeOnTop         The additional fee to add on top of the orders, paid by taker.
     * @param sweepOrder       The order information that is common to all items in the sweep.
     * @param items            An array of items that contains the order information unique to each item.
     * @param signedSellOrders An array of maker signatures authorizing the order execution.
     * @param cosignatures     An array of additional cosignatures for cosigned orders, if applicable.
     * 
     * @return saleDetailsBatch         An array of order execution details.
     * @return royaltyBackfillAndBounty The on-chain royalty backfill and bounty information defined by the creator.
     */
    function _validateSweepOrder(
        TradeContext memory context,
        FeeOnTop memory feeOnTop,
        SweepOrder memory sweepOrder,
        SweepItem[] memory items,
        SignatureECDSA[] memory signedSellOrders,
        Cosignature[] memory cosignatures
    ) private returns (Order[] memory saleDetailsBatch, RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty) {
        CollectionPaymentSettings storage paymentSettingsForCollection = 
            appStorage().collectionPaymentSettings[sweepOrder.tokenAddress];

        PaymentSettings paymentSettings = paymentSettingsForCollection.paymentSettings;
        royaltyBackfillAndBounty.backfillNumerator = paymentSettingsForCollection.royaltyBackfillNumerator;
        royaltyBackfillAndBounty.bountyNumerator = paymentSettingsForCollection.royaltyBountyNumerator;

        if (paymentSettingsForCollection.blockTradesFromUntrustedChannels) {
            EnumerableSet.AddressSet storage trustedChannels = 
                appStorage().collectionTrustedChannels[sweepOrder.tokenAddress];

            if (trustedChannels.length() > 0) {
                if (!trustedChannels.contains(context.channel)) {
                    revert PaymentProcessor__TradeOriginatedFromUntrustedChannel();
                }
            }
        }

        if (paymentSettingsForCollection.royaltyBackfillNumerator > 0) {
            royaltyBackfillAndBounty.backfillReceiver = 
                appStorage().collectionRoyaltyBackfillReceivers[sweepOrder.tokenAddress];
        }

        if (paymentSettingsForCollection.isRoyaltyBountyExclusive) {
            royaltyBackfillAndBounty.exclusiveMarketplace = 
                appStorage().collectionExclusiveBountyReceivers[sweepOrder.tokenAddress];
        }

        if (paymentSettings == PaymentSettings.DefaultPaymentMethodWhitelist) {
            if (!_isDefaultPaymentMethod(sweepOrder.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettings == PaymentSettings.CustomPaymentMethodWhitelist) {
            if (!appStorage().collectionPaymentMethodWhitelists[paymentSettingsForCollection.paymentMethodWhitelistId].contains(sweepOrder.paymentMethod)) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        } else if (paymentSettings == PaymentSettings.PricingConstraints) {
            if (paymentSettingsForCollection.constrainedPricingPaymentMethod != sweepOrder.paymentMethod) {
                revert PaymentProcessor__PaymentCoinIsNotAnApprovedPaymentMethod();
            }
        }

        EnumerableSet.AddressSet storage bannedAccounts = 
            appStorage().collectionBannedAccounts[sweepOrder.tokenAddress];

        if (paymentSettingsForCollection.blockBannedAccounts) {
            if (bannedAccounts.contains(context.taker)) {
                revert PaymentProcessor__MakerOrTakerIsBannedAccount();
            }
        }

        uint256 itemsLength = items.length;

        saleDetailsBatch = new Order[](itemsLength);
        uint256 sumListingPrices;

        for (uint256 i = 0; i < itemsLength;) {
            Order memory saleDetails = 
                Order({
                    protocol: sweepOrder.protocol,
                    maker: items[i].maker,
                    beneficiary: sweepOrder.beneficiary,
                    marketplace: items[i].marketplace,
                    fallbackRoyaltyRecipient: items[i].fallbackRoyaltyRecipient,
                    paymentMethod: sweepOrder.paymentMethod,
                    tokenAddress: sweepOrder.tokenAddress,
                    tokenId: items[i].tokenId,
                    amount: items[i].amount,
                    itemPrice: items[i].itemPrice,
                    nonce: items[i].nonce,
                    expiration: items[i].expiration,
                    marketplaceFeeNumerator: items[i].marketplaceFeeNumerator,
                    maxRoyaltyFeeNumerator: items[i].maxRoyaltyFeeNumerator,
                    requestedFillAmount: items[i].amount,
                    minimumFillAmount: items[i].amount
                });

            saleDetailsBatch[i] = saleDetails;
            sumListingPrices += saleDetails.itemPrice;

            if (paymentSettingsForCollection.blockBannedAccounts) {
                if (bannedAccounts.contains(saleDetails.maker)) {
                    revert PaymentProcessor__MakerOrTakerIsBannedAccount();
                }
            }

            if (saleDetails.protocol == OrderProtocols.ERC721_FILL_OR_KILL) {
                if (saleDetails.amount != ONE) {
                    revert PaymentProcessor__AmountForERC721SalesMustEqualOne();
                }
            } else {
                if (saleDetails.amount == 0) {
                    revert PaymentProcessor__AmountForERC1155SalesGreaterThanZero();
                }
            }

            if (saleDetails.marketplaceFeeNumerator + saleDetails.maxRoyaltyFeeNumerator > FEE_DENOMINATOR) {
                revert PaymentProcessor__MarketplaceAndRoyaltyFeesWillExceedSalePrice();
            }

            if (paymentSettings == PaymentSettings.PricingConstraints) {
                _validateSalePriceInRange(
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount, 
                    saleDetails.itemPrice);
            }

            if (block.timestamp > saleDetails.expiration) {
                    revert PaymentProcessor__OrderHasExpired();
            }

            _verifySaleApproval(context, saleDetails, signedSellOrders[i], cosignatures[i]);

            unchecked {
                ++i;
            }
        }

        if (feeOnTop.amount > sumListingPrices) {
            revert PaymentProcessor__FeeOnTopCannotBeGreaterThanItemPrice();
        }
    }

    /**
     * @notice Validates the sales price for a token is within the bounds set.
     * 
     * @dev    Throws when the unit price is above the ceiling bound.
     * @dev    Throws when the unit price is below the floor bound.
     * 
     * @param tokenAddress The contract address for the token.
     * @param tokenId      The token id.
     * @param amount       The quantity of the token being transacted.
     * @param salePrice    The total price for the token quantity.
     */
    function _validateSalePriceInRange(
        address tokenAddress, 
        uint256 tokenId, 
        uint256 amount, 
        uint256 salePrice
    ) private view {
        (uint256 floorPrice, uint256 ceilingPrice) = _getFloorAndCeilingPrices(tokenAddress, tokenId);

        unchecked {
            uint256 unitPrice = salePrice / amount;

            if (unitPrice > ceilingPrice) {
                revert PaymentProcessor__SalePriceAboveMaximumCeiling();
            }

            if (unitPrice < floorPrice) {
                revert PaymentProcessor__SalePriceBelowMinimumFloor();
            }
        }
    }

    /**
     * @notice Returns the floor and ceiling price for a token for collections set to use pricing constraints.
     * 
     * @dev    Returns token pricing bounds if token bounds are set. 
     * @dev    If token bounds are not set then returns collection pricing bounds if they are set.
     * @dev    If collection bounds are not set, returns zero floor bound and uint256 max ceiling bound.
     * 
     * @param tokenAddress The contract address for the token.
     * @param tokenId      The token id.
     */
    function _getFloorAndCeilingPrices(
        address tokenAddress, 
        uint256 tokenId
    ) internal view returns (uint256, uint256) {
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

    /*************************************************************************/
    /*                           Order Fulfillment                           */
    /*************************************************************************/

    /**
     * @notice Dispenses tokens and proceeds for a single order.
     * 
     * @dev    This function may be called multiple times during a bulk execution.
     * @dev    Throws when a token false to dispense AND partial fills are disabled.
     * @dev    Throws when the taker did not supply enough native funds.
     * @dev    Throws when the fee on top amount is greater than the item price.
     * 
     * @param startingNativeFunds      The amount of native funds remaining at the beginning of the function call.
     * @param context                  The current execution context to determine the taker.
     * @param purchaser                The user that is buying the token.
     * @param seller                   The user that is selling the token.
     * @param paymentCoin              The ERC20 token used for payment, will be zero values for chain native token.
     * @param fnPointers               Struct containing the function pointers for dispensing tokens, sending payments
     *                                 and emitting events.
     * @param saleDetails              The order execution details.
     * @param royaltyBackfillAndBounty Struct containing the royalty backfill and bounty information.
     * @param feeOnTop                 The additional fee on top of the item sales price to be paid by the taker.
     *
     * @return endingNativeFunds       The amount of native funds remaining at the end of the function call.
     */
    function _fulfillSingleOrderWithFeeOnTop(
        uint256 startingNativeFunds,
        TradeContext memory context,
        address purchaser,
        address seller,
        IERC20 paymentCoin,
        FulfillOrderFunctionPointers memory fnPointers,
        Order memory saleDetails,
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty,
        FeeOnTop memory feeOnTop
    ) private returns (uint256 endingNativeFunds) {
        endingNativeFunds = startingNativeFunds;

        if (!fnPointers.funcDispenseToken(
                seller, 
                saleDetails.beneficiary, 
                saleDetails.tokenAddress, 
                saleDetails.tokenId, 
                saleDetails.amount)) {
            if (context.disablePartialFill) {
                revert PaymentProcessor__DispensingTokenWasUnsuccessful();
            }
        } else {
            SplitProceeds memory proceeds =
                _computePaymentSplits(
                    saleDetails.itemPrice,
                    saleDetails.tokenAddress,
                    saleDetails.tokenId,
                    saleDetails.marketplace,
                    saleDetails.marketplaceFeeNumerator,
                    saleDetails.maxRoyaltyFeeNumerator,
                    saleDetails.fallbackRoyaltyRecipient,
                    royaltyBackfillAndBounty
                );

            uint256 feeOnTopAmount;
            if (feeOnTop.recipient != address(0)) {
                feeOnTopAmount = feeOnTop.amount;
            }

            if (saleDetails.paymentMethod == address(0)) {
                uint256 nativeProceedsToSpend = saleDetails.itemPrice + feeOnTopAmount;
                if (endingNativeFunds < nativeProceedsToSpend) {
                    revert PaymentProcessor__RanOutOfNativeFunds();
                }

                unchecked {
                    endingNativeFunds -= nativeProceedsToSpend;
                }
            }

            if (proceeds.royaltyProceeds > 0) {
                fnPointers.funcPayout(proceeds.royaltyRecipient, purchaser, paymentCoin, proceeds.royaltyProceeds, pushPaymentGasLimit);
            }

            if (proceeds.marketplaceProceeds > 0) {
                fnPointers.funcPayout(saleDetails.marketplace, purchaser, paymentCoin, proceeds.marketplaceProceeds, pushPaymentGasLimit);
            }

            if (proceeds.sellerProceeds > 0) {
                fnPointers.funcPayout(seller, purchaser, paymentCoin, proceeds.sellerProceeds, pushPaymentGasLimit);
            }

            if (feeOnTopAmount > 0) {
                if (feeOnTopAmount > saleDetails.itemPrice) {
                    revert PaymentProcessor__FeeOnTopCannotBeGreaterThanItemPrice();
                }

                fnPointers.funcPayout(feeOnTop.recipient, context.taker, paymentCoin, feeOnTop.amount, pushPaymentGasLimit);
            }

            fnPointers.funcEmitOrderExecutionEvent(context, saleDetails);
        }
    }

    /**
     * @notice Dispenses tokens and proceeds for a sweep order.
     * 
     * @dev    This function will **NOT** throw if a token fails to dispense.
     * @dev    Throws when the taker did not supply enough native funds.
     * 
     * @param context             The current execution context to determine the taker.
     * @param startingNativeFunds The amount of native funds remaining at the beginning of the function call.
     * @param params              Struct containing the order execution details, backfilled royalty information 
     *                            and fulfillment function pointers.
     *
     * @return endingNativeFunds  The amount of native funds remaining at the end of the function call.
     */
    function _fulfillSweepOrderWithFeeOnTop(
        TradeContext memory context,
        uint256 startingNativeFunds,
        SweepCollectionComputeAndDistributeProceedsParams memory params
    ) private returns (uint256 endingNativeFunds) {
        endingNativeFunds = startingNativeFunds;

        PayoutsAccumulator memory accumulator = PayoutsAccumulator({
            lastSeller: address(0),
            lastMarketplace: address(0),
            lastRoyaltyRecipient: address(0),
            accumulatedSellerProceeds: 0,
            accumulatedMarketplaceProceeds: 0,
            accumulatedRoyaltyProceeds: 0
        });

        for (uint256 i = 0; i < params.saleDetailsBatch.length;) {
            Order memory saleDetails = params.saleDetailsBatch[i];

            if (!params.fnPointers.funcDispenseToken(
                    saleDetails.maker, 
                    saleDetails.beneficiary, 
                    saleDetails.tokenAddress, 
                    saleDetails.tokenId, 
                    saleDetails.amount)) {
            } else {
                SplitProceeds memory proceeds =
                    _computePaymentSplits(
                        saleDetails.itemPrice,
                        saleDetails.tokenAddress,
                        saleDetails.tokenId,
                        saleDetails.marketplace,
                        saleDetails.marketplaceFeeNumerator,
                        saleDetails.maxRoyaltyFeeNumerator,
                        saleDetails.fallbackRoyaltyRecipient,
                        params.royaltyBackfillAndBounty
                    );

                if (saleDetails.paymentMethod == address(0)) {
                    if (endingNativeFunds < saleDetails.itemPrice) {
                        revert PaymentProcessor__RanOutOfNativeFunds();
                    }
    
                    unchecked {
                        endingNativeFunds -= saleDetails.itemPrice;
                    }
                }
    
                if (proceeds.royaltyRecipient != accumulator.lastRoyaltyRecipient) {
                    if(accumulator.accumulatedRoyaltyProceeds > 0) {
                        params.fnPointers.funcPayout(accumulator.lastRoyaltyRecipient, context.taker, params.paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastRoyaltyRecipient = proceeds.royaltyRecipient;
                    accumulator.accumulatedRoyaltyProceeds = 0;
                }
    
                if (saleDetails.marketplace != accumulator.lastMarketplace) {
                    if(accumulator.accumulatedMarketplaceProceeds > 0) {
                        params.fnPointers.funcPayout(accumulator.lastMarketplace, context.taker, params.paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastMarketplace = saleDetails.marketplace;
                    accumulator.accumulatedMarketplaceProceeds = 0;
                }
    
                if (saleDetails.maker != accumulator.lastSeller) {
                    if(accumulator.accumulatedSellerProceeds > 0) {
                        params.fnPointers.funcPayout(accumulator.lastSeller, context.taker, params.paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
                    }
    
                    accumulator.lastSeller = saleDetails.maker;
                    accumulator.accumulatedSellerProceeds = 0;
                }

                unchecked {
                    accumulator.accumulatedRoyaltyProceeds += proceeds.royaltyProceeds;
                    accumulator.accumulatedMarketplaceProceeds += proceeds.marketplaceProceeds;
                    accumulator.accumulatedSellerProceeds += proceeds.sellerProceeds;
                }

                params.fnPointers.funcEmitOrderExecutionEvent(context, saleDetails);
            }

            unchecked {
                ++i;
            }
        }

        if(accumulator.accumulatedRoyaltyProceeds > 0) {
            params.fnPointers.funcPayout(accumulator.lastRoyaltyRecipient, context.taker, params.paymentCoin, accumulator.accumulatedRoyaltyProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedMarketplaceProceeds > 0) {
            params.fnPointers.funcPayout(accumulator.lastMarketplace, context.taker, params.paymentCoin, accumulator.accumulatedMarketplaceProceeds, pushPaymentGasLimit);
        }

        if(accumulator.accumulatedSellerProceeds > 0) {
            params.fnPointers.funcPayout(accumulator.lastSeller, context.taker, params.paymentCoin, accumulator.accumulatedSellerProceeds, pushPaymentGasLimit);
        }

        if (params.feeOnTop.recipient != address(0)) {
            if (params.feeOnTop.amount > 0) {
                if (address(params.paymentCoin) == address(0)) {
                    if (endingNativeFunds < params.feeOnTop.amount) {
                        revert PaymentProcessor__RanOutOfNativeFunds();
                    }
    
                    unchecked {
                        endingNativeFunds -= params.feeOnTop.amount;
                    }
                }

                params.fnPointers.funcPayout(params.feeOnTop.recipient, context.taker, params.paymentCoin, params.feeOnTop.amount, pushPaymentGasLimit);
            }
        }
    }

    /**
     * @notice Calculates the payment splits between seller, creator and marketplace based
     * @notice on on-chain royalty information or backfilled royalty information if on-chain
     * @notice data is unavailable.
     * 
     * @dev    Throws when ERC2981 on-chain royalties are set to an amount greater than the 
     * @dev    maker signed maximum.
     * 
     * @param salePrice                The sale price for the token being sold.
     * @param tokenAddress             The contract address for the token being sold.
     * @param tokenId                  The token id for the token being sold.
     * @param marketplaceFeeRecipient  The address that will receive the marketplace fee. 
     *                                 If zero, no marketplace fee will be applied.
     * @param marketplaceFeeNumerator  The fee numerator for calculating marketplace fees.
     * @param maxRoyaltyFeeNumerator  The maximum royalty fee authorized by the order maker.
     * @param fallbackRoyaltyRecipient The address that will receive royalties if not defined onchain.
     * @param royaltyBackfillAndBounty The royalty backfill and bounty information set onchain by the creator.
     *
     * @return proceeds A struct containing the split of payment and receiving addresses for the
     *                  seller, creator and marketplace.
     */
    function _computePaymentSplits(
        uint256 salePrice,
        address tokenAddress,
        uint256 tokenId,
        address marketplaceFeeRecipient,
        uint256 marketplaceFeeNumerator,
        uint256 maxRoyaltyFeeNumerator,
        address fallbackRoyaltyRecipient,
        RoyaltyBackfillAndBounty memory royaltyBackfillAndBounty
    ) private view returns (SplitProceeds memory proceeds) {

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
        } catch (bytes memory) {
            // If the token doesn't implement the royaltyInfo function, then check if there are backfilled royalties.
            if (royaltyBackfillAndBounty.backfillReceiver != address(0)) {
                if (royaltyBackfillAndBounty.backfillNumerator > maxRoyaltyFeeNumerator) {
                    revert PaymentProcessor__OnchainRoyaltiesExceedMaximumApprovedRoyaltyFee();
                }

                proceeds.royaltyRecipient = royaltyBackfillAndBounty.backfillReceiver;
                proceeds.royaltyProceeds = 
                    (salePrice * royaltyBackfillAndBounty.backfillNumerator) / FEE_DENOMINATOR;

                unchecked {
                    proceeds.sellerProceeds -= proceeds.royaltyProceeds;
                }
            } else if (fallbackRoyaltyRecipient != address(0)) {
                proceeds.royaltyRecipient = fallbackRoyaltyRecipient;
                proceeds.royaltyProceeds = (salePrice * maxRoyaltyFeeNumerator) / FEE_DENOMINATOR;

                unchecked {
                    proceeds.sellerProceeds -= proceeds.royaltyProceeds;
                }
            }
        }

        if (marketplaceFeeRecipient != address(0)) {
            proceeds.marketplaceProceeds = (salePrice * marketplaceFeeNumerator) / FEE_DENOMINATOR;
            unchecked {
                proceeds.sellerProceeds -= proceeds.marketplaceProceeds;
            }

            if (royaltyBackfillAndBounty.exclusiveMarketplace == address(0) || 
                royaltyBackfillAndBounty.exclusiveMarketplace == marketplaceFeeRecipient) {
                uint256 royaltyBountyProceeds = 
                    proceeds.royaltyProceeds * royaltyBackfillAndBounty.bountyNumerator / FEE_DENOMINATOR;
            
                if (royaltyBountyProceeds > 0) {
                    unchecked {
                        proceeds.royaltyProceeds -= royaltyBountyProceeds;
                        proceeds.marketplaceProceeds += royaltyBountyProceeds;
                    }
                }
            }
        }
    }

    /**
     * @notice Transfers chain native token to `to`.
     * 
     * @dev    Throws when the native token transfer call reverts.
     * @dev    Throws when the payee uses more gas than `gasLimit_`.
     *
     * @param to                   The address that will receive chain native tokens.
     * @param proceeds             The amount of chain native token value to transfer.
     * @param pushPaymentGasLimit_ The amount of gas units to allow the payee to use.
     */
    function _pushProceeds(address to, uint256 proceeds, uint256 pushPaymentGasLimit_) internal {
        bool success;

        assembly {
            // Transfer the ETH and store if it succeeded or not.
            success := call(pushPaymentGasLimit_, to, proceeds, 0, 0, 0, 0)
        }

        if (!success) {
            revert PaymentProcessor__FailedToTransferProceeds();
        }
    }

    /**
     * @notice Transfers chain native token to `payee`.
     * 
     * @dev    Throws when the native token transfer call reverts.
     * @dev    Throws when the payee uses more gas than `gasLimit_`.
     *
     * @param payee     The address that will receive chain native tokens.
     * @param proceeds  The amount of chain native token value to transfer.
     * @param gasLimit_ The amount of gas units to allow the payee to use.
     */
    function _payoutNativeCurrency(
        address payee, 
        address /*payer*/, 
        IERC20 /*paymentCoin*/, 
        uint256 proceeds, 
        uint256 gasLimit_) internal {
        _pushProceeds(payee, proceeds, gasLimit_);
    }

    /**
     * @notice Transfers ERC20 tokens to from `payer` to `payee`.
     * 
     * @dev    Throws when the ERC20 transfer call reverts.
     *
     * @param payee The address that will receive ERC20 tokens.
     * @param payer The address the ERC20 tokens will be sent from.
     * @param paymentCoin The ERC20 token being transferred.
     * @param proceeds The amount of token value to transfer.
     */
    function _payoutCoinCurrency(
        address payee, 
        address payer, 
        IERC20 paymentCoin, 
        uint256 proceeds, 
        uint256 /*gasLimit_*/) internal {
        SafeERC20.safeTransferFrom(paymentCoin, payer, payee, proceeds);
    }

    /**
     * @notice Calls the token contract to transfer an ERC721 token from the seller to the buyer.
     * 
     * @dev    This will **NOT** throw if the transfer fails. It will instead return false
     * @dev    so that the calling function can handle the failed transfer.
     * @dev    Returns true if the transfer does not revert.
     * 
     * @param from         The seller of the token.
     * @param to           The beneficiary of the order execution.
     * @param tokenAddress The contract address for the token being transferred.
     * @param tokenId      The token id for the order.
     */
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

    /**
     * @notice Calls the token contract to transfer an ERC1155 token from the seller to the buyer.
     * 
     * @dev    This will **NOT** throw if the transfer fails. It will instead return false
     * @dev    so that the calling function can handle the failed transfer.
     * @dev    Returns true if the transfer does not revert.
     * 
     * @param from         The seller of the token.
     * @param to           The beneficiary of the order execution.
     * @param tokenAddress The contract address for the token being transferred.
     * @param tokenId      The token id for the order.
     * @param amount       The quantity of the token to transfer.
     */
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

    /**
     * @notice Emits a a BuyListingERC721 event.
     * 
     * @param context The current execution context to determine the taker.
     * @param saleDetails The order execution details.
     */
    function _emitBuyListingERC721Event(TradeContext memory context, Order memory saleDetails) internal {
        emit BuyListingERC721(
                context.taker,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.itemPrice);
    }

    /**
     * @notice Emits a BuyListingERC1155 event.
     * 
     * @param context The current execution context to determine the taker.
     * @param saleDetails The order execution details.
     */
    function _emitBuyListingERC1155Event(TradeContext memory context, Order memory saleDetails) internal {
        emit BuyListingERC1155(
                context.taker,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.amount,
                saleDetails.itemPrice);
    }

    /**
     * @notice Emits an AcceptOfferERC721 event.
     * 
     * @param context The current execution context to determine the taker.
     * @param saleDetails The order execution details.
     */
    function _emitAcceptOfferERC721Event(TradeContext memory context, Order memory saleDetails) internal {
        emit AcceptOfferERC721(
                context.taker,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.itemPrice);
    }

    /**
     * @notice Emits an AcceptOfferERC1155 event.
     * 
     * @param context The current execution context to determine the taker.
     * @param saleDetails The order execution details.
     */
    function _emitAcceptOfferERC1155Event(TradeContext memory context, Order memory saleDetails) internal {
        emit AcceptOfferERC1155(
                context.taker,
                saleDetails.maker,
                saleDetails.tokenAddress,
                saleDetails.beneficiary,
                saleDetails.paymentMethod,
                saleDetails.tokenId,
                saleDetails.amount,
                saleDetails.itemPrice);
    }

    /**
     * @notice Returns the appropriate function pointers for payouts, dispensing tokens and event emissions.
     *
     * @param side The taker's side of the order.
     * @param paymentMethod The payment method for the order. If address zero, the chain native token.
     * @param orderProtocol The type of token and fill method for the order.
     */
    function _getOrderFulfillmentFunctionPointers(
        Sides side,
        address paymentMethod,
        OrderProtocols orderProtocol
    ) private view returns (FulfillOrderFunctionPointers memory orderFulfillmentFunctionPointers) {
        orderFulfillmentFunctionPointers = FulfillOrderFunctionPointers({
            funcPayout: paymentMethod == address(0) ? _payoutNativeCurrency : _payoutCoinCurrency,
            funcDispenseToken: orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? _dispenseERC721Token : _dispenseERC1155Token,
            funcEmitOrderExecutionEvent: orderProtocol == OrderProtocols.ERC721_FILL_OR_KILL ? 
                (side == Sides.Buy ? _emitBuyListingERC721Event : _emitAcceptOfferERC721Event) : 
                (side == Sides.Buy ?_emitBuyListingERC1155Event : _emitAcceptOfferERC1155Event)
        });
    }

    /*************************************************************************/
    /*                        Signature Verification                         */
    /*************************************************************************/

    /**
     * @notice Updates the remaining fillable amount and order status for partially fillable orders.
     * @notice Performs checks for minimum fillable amount and order status.
     *
     * @dev    Throws when the remaining fillable amount is less than the minimum fillable amount requested.
     * @dev    Throws when the order status is not open.
     *
     * @param account             The maker account for the order.
     * @param orderDigest         The hash digest of the order execution details.
     * @param orderStartAmount    The original amount for the partially fillable order.
     * @param requestedFillAmount The amount the taker is requesting to fill.
     * @param minimumFillAmount   The minimum amount the taker is willing to fill.
     *
     * @return quantityToFill     Lesser of remainingFillableAmount and requestedFillAmount.
     */
    function _checkAndUpdateRemainingFillableItems(
        address account,
        bytes32 orderDigest, 
        uint248 orderStartAmount,
        uint248 requestedFillAmount,
        uint248 minimumFillAmount
    ) private returns (uint248 quantityToFill) {
        quantityToFill = requestedFillAmount;
        PartiallyFillableOrderStatus storage partialFillStatus = 
            appStorage().partiallyFillableOrderStatuses[account][orderDigest];
    
        if (partialFillStatus.state == PartiallyFillableOrderState.Open) {
            if (partialFillStatus.remainingFillableQuantity == 0) {
                partialFillStatus.remainingFillableQuantity = uint248(orderStartAmount);
            }

            if (quantityToFill > partialFillStatus.remainingFillableQuantity) {
                quantityToFill = partialFillStatus.remainingFillableQuantity;
            }

            if (quantityToFill < minimumFillAmount) {
                revert PaymentProcessor__UnableToFillMinimumRequestedQuantity();
            }

            unchecked {
                partialFillStatus.remainingFillableQuantity -= quantityToFill;
            }

            if (partialFillStatus.remainingFillableQuantity == 0) {
                partialFillStatus.state = PartiallyFillableOrderState.Filled;
                emit OrderDigestInvalidated(orderDigest, account, false);
            }
        } else {
            revert PaymentProcessor__OrderIsEitherCancelledOrFilled();
        }
    }

    /**
     * @notice Invalidates a maker's nonce and emits a NonceInvalidated event.
     * 
     * @dev    Throws when the nonce has already been invalidated.
     * 
     * @param account         The maker account to invalidate `nonce` of.
     * @param nonce           The nonce to invalidate.
     * @param wasCancellation If true, the invalidation is the maker cancelling the nonce. 
     *                        If false, from the nonce being used to execute an order.
     */
    function _checkAndInvalidateNonce(
        address account, 
        uint256 nonce, 
        bool wasCancellation) internal returns (uint256) {

        // The following code is equivalent to, but saves 115 gas units:
        // 
        // mapping(uint256 => uint256) storage ptrInvalidatedSignatureBitmap = 
        //     appStorage().invalidatedSignatures[account];

        // unchecked {
        //     uint256 slot = nonce / 256;
        //     uint256 offset = nonce % 256;
        //     uint256 slotValue = ptrInvalidatedSignatureBitmap[slot];
        // 
        //     if (((slotValue >> offset) & ONE) == ONE) {
        //         revert PaymentProcessor__SignatureAlreadyUsedOrRevoked();
        //     }
        // 
        //     ptrInvalidatedSignatureBitmap[slot] = (slotValue | ONE << offset);
        // }

        unchecked {
            if (uint256(appStorage().invalidatedSignatures[account][uint248(nonce >> 8)] ^= (ONE << uint8(nonce))) & 
                (ONE << uint8(nonce)) == ZERO) {
                revert PaymentProcessor__SignatureAlreadyUsedOrRevoked();
            }
        }

        emit NonceInvalidated(nonce, account, wasCancellation);

        return appStorage().masterNonces[account];
    }

    /**
     * @notice Updates the state of a maker's order to cancelled and remaining fillable quantity to zero.
     *
     * @dev    Throws when the current order state is not open.
     *
     * @param account     The maker account to invalid the order for.
     * @param orderDigest The hash digest of the order to invalidate.
     */
    function _revokeOrderDigest(address account, bytes32 orderDigest) internal {
        PartiallyFillableOrderStatus storage partialFillStatus = 
            appStorage().partiallyFillableOrderStatuses[account][orderDigest];
    
        if (partialFillStatus.state == PartiallyFillableOrderState.Open) {
            partialFillStatus.state = PartiallyFillableOrderState.Cancelled;
            partialFillStatus.remainingFillableQuantity = 0;
            emit OrderDigestInvalidated(orderDigest, account, true);
        } else {
            revert PaymentProcessor__OrderIsEitherCancelledOrFilled();
        }
    }

    /**
     * @notice Verifies a token offer is approved by the maker.
     *
     * @dev    Throws when a cosignature is required and the cosignature is invalid.
     * @dev    Throws when the maker signature is invalid.
     * @dev    Throws when the maker's order nonce has already been used or was cancelled.
     * @dev    Throws when a partially fillable order has already been filled, cancelled or 
     * @dev    cannot be filled with the minimum fillable amount.
     *
     * @param context       The current execution context to determine the taker.
     * @param saleDetails   The order execution details.
     * @param signature     The order maker's signature.
     * @param cosignature   The cosignature from the order cosigner, if applicable.
     * 
     * @return quantityToFill The amount of the token that will be filled for this order.
     */
    function _verifyItemOffer(
        TradeContext memory context, 
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(context, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(context.domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    ITEM_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
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
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false)
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    /**
     * @notice Verifies a collection offer is approved by the maker.
     *
     * @dev    Throws when a cosignature is required and the cosignature is invalid.
     * @dev    Throws when the maker signature is invalid.
     * @dev    Throws when the maker's order nonce has already been used or was cancelled.
     * @dev    Throws when a partially fillable order has already been filled, cancelled or 
     * @dev    cannot be filled with the minimum fillable amount.
     *
     * @param context       The current execution context to determine the taker.
     * @param saleDetails   The order execution details.
     * @param signature     The order maker's signature.
     * @param cosignature   The cosignature from the order cosigner, if applicable.
     * 
     * @return quantityToFill The amount of the token that will be filled for this order.
     */
    function _verifyCollectionOffer(
        TradeContext memory context, 
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(context, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(context.domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    COLLECTION_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
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
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false)
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    /**
     * @notice Verifies a token set offer is approved by the maker.
     *
     * @dev    Throws when a cosignature is required and the cosignature is invalid.
     * @dev    Throws when the maker signature is invalid.
     * @dev    Throws when the maker's order nonce has already been used or was cancelled.
     * @dev    Throws when a partially fillable order has already been filled, cancelled or 
     * @dev    cannot be filled with the minimum fillable amount.
     *
     * @param context       The current execution context to determine the taker.
     * @param saleDetails   The order execution details.
     * @param signature     The order maker's signature.
     * @param tokenSetProof The token set proof that contains the root hash for the merkle  
     *                      tree of allowed tokens for accepting the maker's offer.
     * @param cosignature   The cosignature from the order cosigner, if applicable.
     * 
     * @return quantityToFill The amount of the token that will be filled for this order.
     */
    function _verifyTokenSetOffer(
        TradeContext memory context, 
        Order memory saleDetails,
        SignatureECDSA memory signature,
        TokenSetProof memory tokenSetProof,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(context, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(context.domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    TOKEN_SET_OFFER_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
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
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false),
                    tokenSetProof.rootHash
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    /**
     * @notice Verifies a listing is approved by the maker.
     *
     * @dev    Throws when a cosignature is required and the cosignature is invalid.
     * @dev    Throws when the maker signature is invalid.
     * @dev    Throws when the maker's order nonce has already been used or was cancelled.
     * @dev    Throws when a partially fillable order has already been filled, cancelled or 
     * @dev    cannot be filled with the minimum fillable amount.
     *
     * @param context     The current execution context to determine the taker.
     * @param saleDetails The order execution details.
     * @param signature   The order maker's signature.
     * @param cosignature The cosignature from the order cosigner, if applicable.
     * 
     * @return quantityToFill The amount of the token that will be filled for this order.
     */
    function _verifySaleApproval(
        TradeContext memory context, 
        Order memory saleDetails,
        SignatureECDSA memory signature,
        Cosignature memory cosignature
    ) private returns (uint248 quantityToFill) {
        if (cosignature.signer != address(0)) {
            _verifyCosignature(context, signature, cosignature);
        }

        bytes32 orderDigest = _hashTypedDataV4(context.domainSeparator, keccak256(
            bytes.concat(
                abi.encode(
                    SALE_APPROVAL_HASH,
                    uint8(saleDetails.protocol),
                    cosignature.signer,
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
                    saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
                        appStorage().masterNonces[saleDetails.maker] :
                        _checkAndInvalidateNonce(saleDetails.maker, saleDetails.nonce, false)
                )
            )
        ));

        _verifyMakerSignature(saleDetails.maker, signature, orderDigest);

        quantityToFill = saleDetails.protocol == OrderProtocols.ERC1155_FILL_PARTIAL ? 
            _checkAndUpdateRemainingFillableItems(
                saleDetails.maker, 
                orderDigest, 
                saleDetails.amount, 
                saleDetails.requestedFillAmount,
                saleDetails.minimumFillAmount) :
            saleDetails.amount;
    }

    /**
     * @notice Reverts a transaction when the recovered signer is not the order maker.
     *
     * @dev Throws when the recovered signer for the `signature` and `digest` does not match the order maker AND
     * @dev - The maker address does not have deployed code, OR 
     * @dev - The maker contract does not return the correct ERC1271 value to validate the signature.
     *
     * @param maker The adress for the order maker.
     * @param signature The order maker's signature.
     * @param digest The hash digest of the order.
     */
    function _verifyMakerSignature(address maker, SignatureECDSA memory signature, bytes32 digest ) private view {
        if (maker != _ecdsaRecover(digest, signature.v, signature.r, signature.s)) {
            if (maker.code.length > 0) {
                _verifyEIP1271Signature(maker, digest, signature);
            } else {
                revert PaymentProcessor__UnauthorizedOrder();
            }
        }
    }

    /**
     * @notice Reverts the transaction when a supplied cosignature is not valid.
     *
     * @dev    Throws when the current block timestamp is greater than the cosignature expiration.
     * @dev    Throws when the order taker does not match the cosignature taker.
     * @dev    Throws when the recovered address for the cosignature does not match the cosigner address.
     * 
     * @param context     The current execution context to determine the order taker.
     * @param signature   The order maker's signature.
     * @param cosignature The cosignature from the order cosigner.
     */
    function _verifyCosignature(
        TradeContext memory context, 
        SignatureECDSA memory signature, 
        Cosignature memory cosignature
    ) private view {
        if (block.timestamp > cosignature.expiration) {
            revert PaymentProcessor__CosignatureHasExpired();
        }

        if (context.taker != cosignature.taker) {
            revert PaymentProcessor__UnauthorizedTaker();
        }

        if (cosignature.signer != _ecdsaRecover(
            _hashTypedDataV4(context.domainSeparator, keccak256(
                abi.encode(
                    COSIGNATURE_HASH,
                    signature.v,
                    signature.r,
                    signature.s,
                    cosignature.expiration,
                    cosignature.taker
                )
            )), 
            cosignature.v, 
            cosignature.r, 
            cosignature.s)) {
            revert PaymentProcessor__NotAuthorizedByCoSigner();
        }
    }

    /**
     * @notice Reverts the transaction if the contract at `signer` does not return the ERC1271
     * @notice isValidSignature selector when called with `hash`.
     * 
     * @dev    Throws when attempting to verify a signature from an address that has deployed
     * @dev    contract code using ERC1271 and the contract does not return the isValidSignature
     * @dev    function selector as its return value.
     *
     * @param signer The signer address for a maker order that has deployed contract code.
     * @param hash The ERC712 hash value of the order.
     * @param signature The signature for the order hash.
     */
    function _verifyEIP1271Signature(
        address signer, 
        bytes32 hash, 
        SignatureECDSA memory signature) private view {
        bool isValidSignatureNow;
        
        try IERC1271(signer).isValidSignature(
            hash, 
            abi.encodePacked(signature.r, signature.s, signature.v)) 
            returns (bytes4 magicValue) {
            isValidSignatureNow = magicValue == IERC1271.isValidSignature.selector;
        } catch {}

        if (!isValidSignatureNow) {
            revert PaymentProcessor__EIP1271SignatureInvalid();
        }
    }

    /**
     * @notice Recovers the signer address from a hash and signature.
     * 
     * @dev Throws when `s` is greater than 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0 to
     * @dev prevent malleable signatures from being utilized. 
     * @dev Throws when the recovered address is zero.
     *
     * @param digest The hash digest that was signed.
     * @param v The v-value of the signature.
     * @param r The r-value of the signature.
     * @param s The s-value of the signature.
     *
     * @return signer The recovered signer address from the signature.
     */
    function _ecdsaRecover(
        bytes32 digest, 
        uint8 v, 
        bytes32 r, 
        bytes32 s
    ) private pure returns (address signer) {
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            revert PaymentProcessor__UnauthorizedOrder();
        }

        signer = ecrecover(digest, v, r, s);
        if (signer == address(0)) {
            revert PaymentProcessor__UnauthorizedOrder();
        }
    }

    /**
     * @notice Returns the EIP-712 hash digest for `domainSeparator` and `structHash`.
     * 
     * @param domainSeparator The domain separator for the EIP-712 hash.
     * @param structHash The hash of the EIP-712 struct.
     */
    function _hashTypedDataV4(bytes32 domainSeparator, bytes32 structHash) private pure returns (bytes32) {
        return ECDSA.toTypedDataHash(domainSeparator, structHash);
    }

    /*************************************************************************/
    /*                             Miscellaneous                             */
    /*************************************************************************/

    /**
     * @notice Reverts the transaction if the caller is not the owner of the payment method whitelist.
     *
     * @dev    Throws when the caller is not the owner of the payment method whitelist.
     *
     * @param paymentMethodWhitelistId The payment method whitelist id to check ownership for.
     */
    function _requireCallerOwnsPaymentMethodWhitelist(uint32 paymentMethodWhitelistId) internal view {
        if(_msgSender() != appStorage().paymentMethodWhitelistOwners[paymentMethodWhitelistId]) {
            revert PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist();
        }
    }

    /**
     * @notice Reverts the transaction if the caller is not the owner or assigned the default
     * @notice admin role of the contract at `tokenAddress`.
     *
     * @dev    Throws when the caller is neither owner nor assigned the default admin role.
     * 
     * @param tokenAddress The contract address of the token to check permissions for.
     */
    function _requireCallerIsNFTOrContractOwnerOrAdmin(address tokenAddress) internal view {
        bool callerHasPermissions = false;

        address caller = _msgSender();
        
        callerHasPermissions = caller == tokenAddress;
        if(!callerHasPermissions) {
            try IOwnable(tokenAddress).owner() returns (address contractOwner) {
                callerHasPermissions = caller == contractOwner;
            } catch {}

            if(!callerHasPermissions) {
                try IAccessControl(tokenAddress).hasRole(DEFAULT_ACCESS_CONTROL_ADMIN_ROLE, caller) 
                    returns (bool callerIsContractAdmin) {
                    callerHasPermissions = callerIsContractAdmin;
                } catch {}
            }
        }

        if(!callerHasPermissions) {
            revert PaymentProcessor__CallerMustHaveElevatedPermissionsForSpecifiedNFT();
        }
    }
}