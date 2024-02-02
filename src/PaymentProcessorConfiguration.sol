// SPDX-License-Identifier: BSL-1.1 - Copyright 2024 Limit Break, Inc.
pragma solidity 0.8.19;

import "./DataTypes.sol";
import "./Errors.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

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
 
* @title Payment Processor Configuration
* @custom:version 2.0.0
* @author Limit Break, Inc.
*/ 

contract PaymentProcessorConfiguration is Ownable {
    /// @dev Track Parameter Initialization
    bool private _initializedPaymentProcessorModuleConfiguration;
    bool private _initializedPaymentProcessorConfiguration;

    ///@dev Configuration Values For Payment Processor Modules
    uint32 private _defaultPushPaymentGasLimit;
    address private _trustedForwarderFactory;
    address private _wrappedNativeCoin;
    DefaultPaymentMethods private _defaultPaymentMethods;

    /// @dev Configuration Values For Payment Processor Main Contract
    address private _defaultContractOwner;
    PaymentProcessorModules private _paymentProcessorModules;

    constructor(address defaultContractOwner_) {
        if (defaultContractOwner_ == address(0)) {
            revert PaymentProcessor__InvalidConstructorArguments();
        }

        _transferOwnership(defaultContractOwner_);
    }

    /**
     * @notice Sets the configuration for payment processor modules.
     */
    function setPaymentProcessorModuleConfiguration(
        uint32 defaultPushPaymentGasLimit_,
        address trustedForwarderFactory_,
        address wrappedNativeCoin_,
        address defaultPaymentMethod1_,
        address defaultPaymentMethod2_,
        address defaultPaymentMethod3_,
        address defaultPaymentMethod4_
    ) external onlyOwner {
        if (defaultPushPaymentGasLimit_ == 0 || 
            trustedForwarderFactory_ == address(0) || 
            wrappedNativeCoin_ == address(0)) {
            revert PaymentProcessor__InvalidConstructorArguments();
        }

        _defaultPushPaymentGasLimit = defaultPushPaymentGasLimit_;
        _trustedForwarderFactory = trustedForwarderFactory_;
        _wrappedNativeCoin = wrappedNativeCoin_;
        _defaultPaymentMethods.defaultPaymentMethod1 = defaultPaymentMethod1_;
        _defaultPaymentMethods.defaultPaymentMethod2 = defaultPaymentMethod2_;
        _defaultPaymentMethods.defaultPaymentMethod3 = defaultPaymentMethod3_;
        _defaultPaymentMethods.defaultPaymentMethod4 = defaultPaymentMethod4_;

        _initializedPaymentProcessorModuleConfiguration = true;
    }

    /**
     * @notice Sets the configuration for the payment processor.
     */
    function setPaymentProcessorConfiguration(
        address defaultContractOwner_,
        address modulePaymentSettings_,
        address moduleOnChainCancellation_,
        address moduleTrades_,
        address moduleTradesAdvanced_
    ) external onlyOwner {
        if (defaultContractOwner_ == address(0)) {
            revert PaymentProcessor__InvalidConstructorArguments();
        }

        _defaultContractOwner = defaultContractOwner_;
        _paymentProcessorModules.modulePaymentSettings = modulePaymentSettings_;
        _paymentProcessorModules.moduleOnChainCancellation = moduleOnChainCancellation_;
        _paymentProcessorModules.moduleTrades = moduleTrades_;
        _paymentProcessorModules.moduleTradesAdvanced = moduleTradesAdvanced_;

        _initializedPaymentProcessorConfiguration = true;
    }

    /**
     * @notice Returns the ERC2771 context setup params for payment processor modules.
     */
    function getPaymentProcessorModuleERC2771ContextParams() external view returns (address trustedForwarderFactory) {
        if (!_initializedPaymentProcessorModuleConfiguration) {
            revert PaymentProcessor__UninitializedConfiguration();
        }

        trustedForwarderFactory = _trustedForwarderFactory;
    }

    /**
     * @notice Returns the setup params for payment processor modules.
     */
    function getPaymentProcessorModuleDeploymentParams() 
        external 
        view 
        returns (
            uint32 defaultPushPaymentGasLimit,
            address wrappedNativeCoin,
            DefaultPaymentMethods memory defaultPaymentMethods
        ) 
    {
        if (!_initializedPaymentProcessorModuleConfiguration) {
            revert PaymentProcessor__UninitializedConfiguration();
        }

        defaultPushPaymentGasLimit = _defaultPushPaymentGasLimit;
        wrappedNativeCoin = _wrappedNativeCoin;
        defaultPaymentMethods = _defaultPaymentMethods;
    }

    /**
     * @notice Returns the setup params for payment processor.
     */
    function getPaymentProcessorDeploymentParams()
        external
        view
        returns (
            address defaultContractOwner,
            PaymentProcessorModules memory paymentProcessorModules
        )
    {
        if (!_initializedPaymentProcessorConfiguration) {
            revert PaymentProcessor__UninitializedConfiguration();
        }

        defaultContractOwner = _defaultContractOwner;
        paymentProcessorModules = _paymentProcessorModules;
    }
}