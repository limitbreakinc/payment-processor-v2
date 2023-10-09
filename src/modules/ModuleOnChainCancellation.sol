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

import "./CPortModule.sol";

contract ModuleOnChainCancellation is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        DefaultPaymentMethods memory defaultPaymentMethods) 
    cPortModule(defaultPushPaymentGasLimit_, defaultPaymentMethods) {}

    /**
     * @notice Allows a maker to revoke/cancel all prior signatures of their listings and offers.
     *
     * @dev    <h4>Postconditions:</h4>
     * @dev    1. The maker's master nonce has been incremented by `1` in contract storage, rendering all signed
     *            approvals using the prior nonce unusable.
     * @dev    2. A `MasterNonceInvalidated` event has been emitted.
     */
    function revokeMasterNonce() external {
        emit MasterNonceInvalidated(appStorage().masterNonces[msg.sender], msg.sender);

        unchecked {
            ++appStorage().masterNonces[msg.sender];
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
     * @dev    1. The specified `nonce` for the `msg.sender` has been revoked and can
     *            no longer be used to execute a sale or purchase.
     * @dev    2. A `NonceInvalidated` event has been emitted.
     *
     * @param  nonce The nonce that was signed in the revoked listing or offer.
     */
    function revokeSingleNonce(uint256 nonce) external {
        _checkAndInvalidateNonce(msg.sender, nonce, true);
    }
}
