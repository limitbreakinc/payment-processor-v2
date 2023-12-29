// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./PaymentProcessorModule.sol";

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

contract ModuleOnChainCancellation is PaymentProcessorModule {
    using EnumerableSet for EnumerableSet.AddressSet;

    constructor(address configurationContract) PaymentProcessorModule(configurationContract){}

    /**
     * @notice Allows a cosigner to destroy itself, never to be used again.  This is a fail-safe in case of a failure
     *         to secure the co-signer private key in a Web2 co-signing service.  In case of suspected cosigner key
     *         compromise, or when a co-signer key is rotated, the cosigner MUST destroy itself to prevent past listings 
     *         that were cancelled off-chain from being used by a malicious actor.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The _msgSender() can never be used to co-sign orders again.
     * @dev    2. A `DestroyedCosigner` event has been emitted.  If cosigner previously destroyed, no event is emitted.
     */
    function destroyCosigner() external {
        address cosigner = _msgSender();
        if (appStorage().destroyedCosigners.add(cosigner)) {
            emit DestroyedCosigner(cosigner);
        }
    }

    /**
     * @notice Allows a maker to revoke/cancel all prior signatures of their listings and offers.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The maker's master nonce has been incremented by `1` in contract storage, rendering all signed
     *            approvals using the prior nonce unusable.
     * @dev    2. A `MasterNonceInvalidated` event has been emitted.
     */
    function revokeMasterNonce() external {
        address caller = _msgSender();
        unchecked {
            emit MasterNonceInvalidated(caller, appStorage().masterNonces[caller]++);
        }
    }

    /**
     * @notice Allows a maker to revoke/cancel a single, previously signed listing or offer by specifying the
     *         nonce of the listing or offer.
     *
     * @dev    Throws when the maker has already revoked the nonce.
     * @dev    Throws when the nonce was already used by the maker to successfully buy or sell an NFT.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The specified `nonce` for the `_msgSender()` has been revoked and can
     *            no longer be used to execute a sale or purchase.
     * @dev    2. A `NonceInvalidated` event has been emitted.
     *
     * @param  nonce The nonce that was signed in the revoked listing or offer.
     */
    function revokeSingleNonce(uint256 nonce) external {
        _checkAndInvalidateNonce(_msgSender(), nonce, true);
    }

    /**
     * @notice Allows a maker to revoke/cancel a partially fillable order by specifying the order digest hash.
     *
     * @dev    Throws when the maker has already revoked the order digest.
     * @dev    Throws when the order digest was already used by the maker and has been fully filled.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The specified `orderDigest` for the `_msgSender()` has been revoked and can
     *            no longer be used to execute a sale or purchase.
     * @dev    2. An `OrderDigestInvalidated` event has been emitted.
     *
     * @param  orderDigest The order digest that was signed in the revoked listing or offer.
     */
    function revokeOrderDigest(bytes32 orderDigest) external {
        _revokeOrderDigest(_msgSender(), orderDigest);
    }
}
