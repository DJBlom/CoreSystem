#!/bin/bash

cd test
make clean
make -s -f Makefile EtnaUnitTests
./EtnaUnitTests -c -v

