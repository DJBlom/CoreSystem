project(Etna VERSION 0.0.1 LANGUAGES CXX)
include(EtnaFiles)

if(CMAKE_TOOLCHAIN_FILE AND BUILD_ETNA)
    include(CompileEtna)
    CompileEtna()
endif()

find_program(CPPCHECK cppcheck)
if(CPPCHECK AND BUILD_STATIC)
    include(StaticCodeAnalysis)
    StaticCodeAnalysis()
endif()
