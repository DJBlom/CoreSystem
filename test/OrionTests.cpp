/***********************************************************************
 * Contents : Contains the main function executed automatically by
 *            CppUTest.
 *
 * Author   : Dawid Blom.
 *
 * Date     : 13/09/2022
 *
 * NOTE     : This file is exclusively to be used by CppUTest since it
 *            will automatically execute it.
 ***********************************************************************/

#include "CppUTest/CommandLineTestRunner.h"








int main(int argc, char **argv)
{
    return CommandLineTestRunner::RunAllTests(argc, argv);
}
