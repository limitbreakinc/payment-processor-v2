pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../PaymentProcessorModule.t.sol";

contract ModulePaymentSettingsTest is PaymentProcessorModuleTest {

    function testReassignOwnershipOfDefaultPaymentMethodWhitelist(address newOwner) public {
        _sanitizeAddress(newOwner, new address[](0));
        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(DEFAULT_PAYMENT_METHOD_WHITELIST_ID), address(this));
        _reassignOwnershipOfPaymentMethodWhitelist(address(this), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, newOwner, EMPTY_SELECTOR);
        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(DEFAULT_PAYMENT_METHOD_WHITELIST_ID), newOwner);
    }

    function testRenounceOwnershipOfDefaultPaymentMethodWhitelist() public {
        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(DEFAULT_PAYMENT_METHOD_WHITELIST_ID), address(this));
        _renounceOwnershipOfPaymentMethodWhitelist(address(this), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, EMPTY_SELECTOR);
        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(DEFAULT_PAYMENT_METHOD_WHITELIST_ID), address(0));
    }

    function testReassignOwnershipOfPaymentMethodWhitelist(address listCreator, address newOwner) public {
        _sanitizeAddress(listCreator, new address[](0));
        _sanitizeAddress(newOwner, new address[](0));
        vm.assume(listCreator != newOwner);

        vm.startPrank(listCreator);
        uint32 listId = _paymentProcessor.createPaymentMethodWhitelist(_paymentProcessorEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_paymentProcessor), ""));
        vm.stopPrank();

        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(listId), listCreator);
        _reassignOwnershipOfPaymentMethodWhitelist(listCreator, listId, newOwner, EMPTY_SELECTOR);
        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(listId), newOwner);
    }

    function testRenounceOwnershipOfPaymentMethodWhitelist(address listCreator) public {
        _sanitizeAddress(listCreator, new address[](0));
        vm.startPrank(listCreator);
        uint32 listId = _paymentProcessor.createPaymentMethodWhitelist(_paymentProcessorEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_paymentProcessor), ""));
        vm.stopPrank();

        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(listId), listCreator);
        _renounceOwnershipOfPaymentMethodWhitelist(listCreator, listId, EMPTY_SELECTOR);
        assertEq(_paymentProcessor.paymentMethodWhitelistOwners(listId), address(0));
    }

    function testRevertsWhenUnauthorizedUserReassignsOwnershipOfPaymentMethodWhitelist(address listCreator, address unauthorized, address newOwner) public {
        _sanitizeAddress(listCreator, new address[](0));
        _sanitizeAddress(newOwner, new address[](0));
        _sanitizeAddress(unauthorized, new address[](0));
        vm.assume(listCreator != newOwner);
        vm.assume(listCreator != unauthorized);
        vm.assume(newOwner != unauthorized);

        vm.startPrank(listCreator);
        uint32 listId = _paymentProcessor.createPaymentMethodWhitelist(_paymentProcessorEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_paymentProcessor), ""));
        vm.stopPrank();

        _reassignOwnershipOfPaymentMethodWhitelist(unauthorized, listId, newOwner, PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist.selector);
    }

    function testRevertsWhenListOwnerReassignsOwnershipOfPaymentMethodWhitelistToZeroAddress(address listCreator) public {
        _sanitizeAddress(listCreator, new address[](0));

        vm.startPrank(listCreator);
        uint32 listId = _paymentProcessor.createPaymentMethodWhitelist(_paymentProcessorEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_paymentProcessor), ""));
        vm.stopPrank();

        _reassignOwnershipOfPaymentMethodWhitelist(listCreator, listId, address(0), PaymentProcessor__PaymentMethodWhitelistOwnershipCannotBeTransferredToZeroAddress.selector);
    }

    function testRevertsWhenUnauthorizedUserRenouncesOwnershipOfPaymentMethodWhitelist(address listCreator, address unauthorized) public {
        _sanitizeAddress(listCreator, new address[](0));
        _sanitizeAddress(unauthorized, new address[](0));
        vm.assume(listCreator != unauthorized);

        vm.startPrank(listCreator);
        uint32 listId = _paymentProcessor.createPaymentMethodWhitelist(_paymentProcessorEncoder.encodeCreatePaymentMethodWhitelistCalldata(address(_paymentProcessor), ""));
        vm.stopPrank();

        _renounceOwnershipOfPaymentMethodWhitelist(unauthorized, listId, PaymentProcessor__CallerDoesNotOwnPaymentMethodWhitelist.selector);
    }
}