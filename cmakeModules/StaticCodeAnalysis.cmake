

function(StaticCodeAnalysis)
    set(STATIC_ANALYSIS ${PROJECT_NAME}StaticAnalysis)
    set(CMAKE_CXX_CPPCHECK "cppcheck")
    list(APPEND CMAKE_CXX_CPPCHECK "--enable=all" "--std=c++20" "--error-exitcode=1" "--platform=mips32" "--suppress=missingInclude")

    add_executable(${STATIC_ANALYSIS}
        ${CMAKE_SOURCE_DIR}/source/src/etna/Main.cpp
        ${EtnaSourceFiles}
    )

    include_directories(${STATIC_ANALYSIS} PRIVATE
        ${EtnaHeaderFiles}
    )

    target_link_libraries(${STATIC_ANALYSIS} PRIVATE)
endfunction()
