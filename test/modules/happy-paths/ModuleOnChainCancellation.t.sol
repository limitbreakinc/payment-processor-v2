pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../CPortModule.t.sol";

contract ModuleOnChainCancellationTest is cPortModuleTest {

    function testRevokeMasterNonce(address account) public {
        _sanitizeAddress(account, new address[](0));
        for (uint256 i = 0; i < 100; i++) {
            uint256 previousMasterNonce = _cPort.masterNonces(account);
            _revokeMasterNonce(account, previousMasterNonce, EMPTY_SELECTOR);
            uint256 updatedMasterNonce = _cPort.masterNonces(account);
            assertEq(updatedMasterNonce - previousMasterNonce, 1);
        }
    }

    function testRevokeSingleNonce(address account, uint256 nonce) public {
        vm.assume(!_cPort.isNonceUsed(account, nonce));
        _sanitizeAddress(account, new address[](0));
        _revokeSingleNonce(account, nonce, EMPTY_SELECTOR);
        assertTrue(_cPort.isNonceUsed(account, nonce));
    }

    function testRevokeConsecutiveNonces(address account) public {
        _sanitizeAddress(account, new address[](0));

        for (uint256 nonce = 0; nonce < 512; nonce++) {
            vm.assume(!_cPort.isNonceUsed(account, nonce));
            _revokeSingleNonce(account, nonce, EMPTY_SELECTOR);
            assertTrue(_cPort.isNonceUsed(account, nonce));
        }

        for (uint256 nonce = type(uint256).max - 512; nonce < type(uint256).max; nonce++) {
            vm.assume(!_cPort.isNonceUsed(account, nonce));
            _revokeSingleNonce(account, nonce, EMPTY_SELECTOR);
            assertTrue(_cPort.isNonceUsed(account, nonce));
        }
    }

    function testRevokeOrderDigest(address account, FuzzedOrder721 memory fuzzedOrderInputs, uint248 amount, uint248 fillAmount) public {
        _scrubFuzzedOrderInputs(fuzzedOrderInputs);
        _sanitizeAddress(account, new address[](0));
        vm.assume(amount > 0);
        vm.assume(fillAmount > 0);
        vm.assume(fillAmount <= amount);

        Order memory order = Order({
            protocol: OrderProtocols.ERC1155_FILL_PARTIAL,
            maker: vm.addr(fuzzedOrderInputs.sellerKey),
            beneficiary: fuzzedOrderInputs.beneficiary,
            marketplace: fuzzedOrderInputs.marketplace,
            fallbackRoyaltyRecipient: address(0),
            paymentMethod: amount % 2 == 0 ? address(0) : address(weth),
            tokenAddress: address(test1155),
            tokenId: fuzzedOrderInputs.tokenId,
            amount: amount,
            itemPrice: fuzzedOrderInputs.itemPrice,
            nonce: _getNextNonce(vm.addr(fuzzedOrderInputs.sellerKey)),
            expiration: block.timestamp + fuzzedOrderInputs.expirationSeconds,
            marketplaceFeeNumerator: fuzzedOrderInputs.marketplaceFeeRate,
            maxRoyaltyFeeNumerator: fuzzedOrderInputs.royaltyFeeRate,
            requestedFillAmount: fillAmount,
            minimumFillAmount: fillAmount
        });

        (, bytes32 digest) = _getSignedSaleApprovalAndDigest(fuzzedOrderInputs.sellerKey, order);

        // Assume this hasn't been seen on chain yet
        PartiallyFillableOrderStatus memory orderStatus = _cPort.remainingFillableQuantity(account, digest);
        vm.assume(orderStatus.state == PartiallyFillableOrderState.Open);
        vm.assume(orderStatus.remainingFillableQuantity == 0);

        _revokeOrderDigest(account, digest, EMPTY_SELECTOR);

        orderStatus = _cPort.remainingFillableQuantity(account, digest);
        assertTrue(orderStatus.state == PartiallyFillableOrderState.Cancelled);
        assertEq(orderStatus.remainingFillableQuantity, 0);
    }
}