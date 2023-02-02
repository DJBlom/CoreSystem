########################################################
# Contents	: 	A template Makefile for CppUTest.
#
# Author	: 	Dawid Blom.
#
# Date		: 	13/09/2022.
#
#
#
# NOTE		: 	This Makefile is a template for how to
# 				use CppUTest in a project. It's set up
# 				for a default folder structure, but it 
# 				can be changed as per the programmers
# 				specifications.
########################################################


# Convenient variable to hold the path to the project directory.
PROJECT_DIR		:=$(realpath ../)

# Convenient variable to holdthe path to the test directory.
TESTS_DIR		:=$(realpath .)



# Convenient variable to hold the test targets name.
COMPONENT_NAME	:=    

TEST_TARGET		:=$(COMPONENT_NAME)_test


# Specify the compile to be used by the tests
CPP_PLATFORM	:=

# Specify the name of the source folders here, it can take more than one.
SRC_DIRS		:=\
				  $(PROJECT_DIR)/

# Add all include directories here. Project includes and test includes.
INCLUDE_DIRS	:=\
				  $(CPPUTEST_HOME)/include\
				  $(PROJECT_DIR)/ \
				  $(TESTS_DIR)/mocks


# The location of all the test source files
TEST_SRC_DIRS	:=\
				  $(TESTS_DIR)\
				  $(TESTS_DIR)/tests\
				  $(TESTS_DIR)/mocks



include $(CPPUTEST_HOME)/build/MakefileWorker.mk
