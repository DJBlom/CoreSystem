
function(Compile${PROJECT_NAME})
    add_compile_options(
        -Wall
        -Werror
        -Wextra
        -Wconversion
        -Wsign-conversion
        $<$<CONFIG:RELEASE>:-O2>
    )

    add_compile_definitions(
        $<$<CONFIG:RELEASE>:RELEASE>
    )

    add_executable(${PROJECT_NAME}
        $<$<CONFIG:RELEASE>:${EtnaMain}>
        $<$<CONFIG:RELEASE>:${EtnaStartupFiles}>
        $<$<CONFIG:RELEASE>:${EtnaSourceFiles}>
    )

    target_include_directories(${PROJECT_NAME} PRIVATE
        ${EtnaHeaderFiles}
    )

    set(LINKER_SCRIPTS
        ${CMAKE_SOURCE_DIR}/startup/Flash.ld
    )

    set_target_properties(${PROJECT_NAME} PROPERTIES 
        SUFFIX .elf
        LINK_DEPENDS "${LINKER_SCRIPTS}"
    )

    target_link_options(${PROJECT_NAME} PRIVATE
        -T${CMAKE_SOURCE_DIR}/startup/Flash.ld
        LINKER:--print-memory-usage
        LINKER:-Map,${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map
    )

    if (EXISTS ${CMAKE_OBJCOPY})
        add_custom_command(
            TARGET ${PROJECT_NAME}
            POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${PROJECT_NAME}>
                    ${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${PROJECT_NAME}>.hex
    )
    else ()
        message(STATUS "'objcopy' not found: cannot generate .hex file")
    endif()

    if (EXISTS "${TOOLCHAIN_SIZE}")
      add_custom_command(
        TARGET ${PROJECT_NAME} 
        POST_BUILD
        COMMAND ${TOOLCHAIN_SIZE} --format=berkeley $<TARGET_FILE:${PROJECT_NAME}>
                >${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${PROJECT_NAME}>.bsz
      )
      add_custom_command(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMAND ${TOOLCHAIN_SIZE} --format=sysv -x $<TARGET_FILE:${PROJECT_NAME}>
                >${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${PROJECT_NAME}>.ssz
        )
    else()
        message(STATUS "'size' not found: cannot generate .[bs]sz files")
    endif()
endfunction()
