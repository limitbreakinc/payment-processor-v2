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

contract ModuleBulkAcceptOffers is cPortModule {

    constructor(
        uint32 defaultPushPaymentGasLimit_,
        address weth_,
        address usdc_,
        address usdt_,
        address dai_) 
    cPortModule(defaultPushPaymentGasLimit_, weth_, usdc_, usdt_, dai_) {}

    function bulkAcceptOffers(
        bytes32 domainSeparator, 
        bool[] calldata isCollectionLevelOfferArray,
        Order[] calldata saleDetailsArray,
        SignatureECDSA[] calldata buyerSignaturesArray,
        SignatureECDSA[] calldata cosignerSignaturesArray,
        TokenSetProof[] calldata tokenSetProofsArray
    ) public {
        if (saleDetailsArray.length != buyerSignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length != cosignerSignaturesArray.length) {
            revert cPort__InputArrayLengthMismatch();
        }

        if (saleDetailsArray.length == 0) {
            revert cPort__InputArrayLengthCannotBeZero();
        }

        for (uint256 i = 0; i < saleDetailsArray.length;) {
            _executeOrderSellSide(
                domainSeparator, 
                0, 
                isCollectionLevelOfferArray[i], 
                saleDetailsArray[i], 
                buyerSignaturesArray[i],
                cosignerSignaturesArray[i],
                tokenSetProofsArray[i]);

            unchecked {
                ++i;
            }
        }
    }
}
