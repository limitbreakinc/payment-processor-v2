pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "./CPortModule.t.sol";

contract cPortTest is cPortModuleTest {
    function testGetDefaultPaymentMethods() public {
        address[] memory defaultPaymentMethods = _paymentProcessor.getDefaultPaymentMethods();
        assertEq(defaultPaymentMethods.length, 5);
        assertEq(defaultPaymentMethods[0], address(0));
        assertEq(defaultPaymentMethods[1], address(weth));
        assertEq(defaultPaymentMethods[2], address(usdc));
        assertEq(defaultPaymentMethods[3], address(usdt));
        assertEq(defaultPaymentMethods[4], address(dai));
    }

    function testIsDefaultPaymentMethod(address postDeployMethod1, address postDeployMethod2, address nonDefault) public {
        address[] memory exclusionList = new address[](4);
        exclusionList[0] = address(weth);
        exclusionList[1] = address(usdc);
        exclusionList[2] = address(usdt);
        exclusionList[3] = address(dai);

        _sanitizeAddress(postDeployMethod1, exclusionList);
        _sanitizeAddress(postDeployMethod2, exclusionList);
        _sanitizeAddress(nonDefault, exclusionList);

        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(postDeployMethod1)));
        _paymentProcessor.whitelistPaymentMethod(_paymentProcessorEncoder.encodeWhitelistPaymentMethodCalldata(address(_paymentProcessor), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(postDeployMethod2)));
        
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(0)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(weth)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(usdc)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(usdt)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(dai)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(postDeployMethod1));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(postDeployMethod2));
        assertFalse(_paymentProcessor.isDefaultPaymentMethod(nonDefault));

        _paymentProcessor.unwhitelistPaymentMethod(_paymentProcessorEncoder.encodeUnwhitelistPaymentMethodCalldata(address(_paymentProcessor), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(postDeployMethod1)));
        _paymentProcessor.unwhitelistPaymentMethod(_paymentProcessorEncoder.encodeUnwhitelistPaymentMethodCalldata(address(_paymentProcessor), DEFAULT_PAYMENT_METHOD_WHITELIST_ID, address(postDeployMethod2)));

        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(0)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(weth)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(usdc)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(usdt)));
        assertTrue(_paymentProcessor.isDefaultPaymentMethod(address(dai)));
        assertFalse(_paymentProcessor.isDefaultPaymentMethod(postDeployMethod1));
        assertFalse(_paymentProcessor.isDefaultPaymentMethod(postDeployMethod2));
        assertFalse(_paymentProcessor.isDefaultPaymentMethod(nonDefault));
    }
}