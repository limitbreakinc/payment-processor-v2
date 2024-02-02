#!/bin/bash
cast create2 --starts-with 9A1D00 --case-sensitive --init-code $(forge inspect src/PaymentProcessorEncoder.sol:PaymentProcessorEncoder bytecode)