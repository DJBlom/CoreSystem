set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION Cotex-M4-STM32F411RE)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CROSS_GCC_PATH ${CMAKE_SOURCE_DIR}/toolchain)
find_program(CROSS_GCC_PATH/bin "arm-none-eabi-g++")
if (NOT CROSS_GCC_PATH)
  message(FATAL_ERROR "Cannot find ARM GCC compiler: arm-none-eabi-g++")
endif()

set(TOOLCHAIN ${CROSS_GCC_PATH})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/bin/arm-none-eabi-g++)
set(TOOLCHAIN_AS ${TOOLCHAIN}/bin/arm-none-eabi-as CACHE STRING "arm-none-eabi-as")
set(TOOLCHAIN_LD ${TOOLCHAIN}/bin/arm-none-eabi-ld CACHE STRING "arm-none-eabi-ld")
set(TOOLCHAIN_SIZE ${TOOLCHAIN}/bin/arm-none-eabi-size CACHE STRING "arm-none-eabi-size")


set(MACHINE_ARCHITECTURE cortex-m4)
set(ARM_OPTIONS 
    -mcpu=${MACHINE_ARCHITECTURE} 
    -mthumb
    -mlittle-endian
    -mfloat-abi=soft 
)

add_compile_options(
    ${ARM_OPTIONS}
    -fmessage-length=0
    -funsigned-char
    -ffunction-sections
    -fdata-sections
    -fno-exceptions
    -MMD
    -MP
)

add_compile_definitions(
    STM32F411xx
    USE_FULL_ASSERT
)

add_link_options(
    ${ARM_OPTIONS}
    $<$<CONFIG:RELEASE>:--specs=nosys.specs>
    $<$<CONFIG:RELEASE>:--specs=nano.specs>
    LINKER:--build-id
    LINKER:--gc-sections
)


set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
