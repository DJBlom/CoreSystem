cmake_minimum_required(VERSION 3.25)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
project(Etna VERSION 0.0.1 LANGUAGES CXX)

set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmakeModules)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(BUILD_ETNA CACHE BOOL OFF)
if(BUILD_ETNA)
    add_subdirectory(source)
endif()

set(BUILD_STATIC CACHE BOOL OFF)
if(BUILD_STATIC)
    add_subdirectory(source)
endif()

set(BUILD_COVERAGE CACHE BOOL OFF)
if(BUILD_COVERAGE)
    enable_testing()
    add_subdirectory(test)
endif()

include (CTest)
