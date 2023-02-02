
set(CODE_COVERAGE CodeCoverage)
function(${CODE_COVERAGE})
    add_executable(${CODE_COVERAGE}
        ${EtnaSourceFiles}
        ${EtnaTestSourceFiles}
    )

    include_directories(${CODE_COVERAGE} PRIVATE
        ${EtnaHeaderFiles}
        ${EtnaTestHeaderFiles}
    )

    target_link_libraries(${CODE_COVERAGE} PRIVATE
        gcov
        ${EtnaTestLinkFiles}
    )

    add_test(NAME ${CODE_COVERAGE} COMMAND $<TARGET_FILE:${CODE_COVERAGE}>)
endfunction()




