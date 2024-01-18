#!/bin/bash
cast create2 --starts-with 6ABE00 --case-sensitive --init-code $(forge inspect src/PaymentProcessorEncoder.sol:PaymentProcessorEncoder bytecode)