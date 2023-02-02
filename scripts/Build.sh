#!/bin/bash

CMAKE=cmake
RELEASE=Release
BUILD_DIR=$(pwd)/build/Release
TESTING_DIR=Testing
TOOLCHAIN=cmakeModules/EtnaToolchain.cmake

rm -rf $BUILD_DIR/*
rm -rf $TESTING_DIR
mkdir $BUILD_DIR
$CMAKE -S . -B $BUILD_DIR --warn-uninitialized -DBUILD_ETNA:TYPE=ON -DCMAKE_BUILD_TYPE=$RELEASE -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN
$CMAKE --build $BUILD_DIR 
