/***********************************************************************
 * Contents : Contains the template/example of how to write tests with
 *            CppUTest.
 *
 * Author   : Dawid Blom.
 *
 * Date     : 13/09/2022
 *
 * NOTE     : This file should be used as a template on how to write
 *            starter code for CppUTest and how to place includes to
 *            prevent issues regarding the operator new oveloaded 
 *            version of CppUTest and the STL library from C++
 ***********************************************************************/





/*************************************
 * INCLUDE STL LIBRARY INCLUDES HERE
 *
 * EXAMPLE BELOW
 *************************************/
//#include <array>






/*************************************
 * INCLUDE CPPUTEST HEADER FILES HERE
 *
 * EXAMPLE BELOW
 *************************************/
#include "CppUTest/TestHarness.h"

#include "CppUTestExt/MockSupport.h"

#include "CppUTestExt/MockSupport_c.h"






/*************************************
 * INCLUDE SELF DEFINEDHEADER FILES 
 * HERE, IF THEY DO NOT CONTAIN ANY
 * STL LIBRARY INCLUDES
 *
 * EXAMPLE BELOW
 *************************************/
//#include "exmpale_include.hpp"






/*************************************
 * INCLUDE C HEADER FILES HERE
 *
 * EXAMPLE BELOW
 *
 *
 * extern "C" 
 * {
 *    #include "example_include.h";
 * }
 * ***********************************/











/*************************************
 * CREATING THE TEST GROUP, WHICH IS 
 * THE STARTING POINT OF THE TEST
 *
 * EXAMPLE BELOW
 *************************************/

TEST_GROUP(example_test)
{
    void setup()
    {
        // Initialization code go here. 
    }

    void teardown()
    {
        // Uninitialization code go here.
    }
};




/*******************************************************
 * DESCRIPTION OF A TEST 
 *
 * TEST(TEST_GROUP_DEFINED_ABOVE, TEST_DESCRIPTION/NAME)
 * {
 *      TEST_CODE GO HERE
 * }
 *******************************************************/




TEST(example_test, example_fail)
{ 
    FAIL("Demo Fail.");
}

