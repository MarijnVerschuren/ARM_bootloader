cmake_minimum_required(VERSION 3.27.8)

# project name
project(STM32_bootloader)

# select linker script
set(LINKER_SCRIPT "lnk/bootloader.ld")

# toolchain
set(CMAKE_TOOLCHAIN_FILE "cmake/arm-none-eabi.cmake")

# optimizations (-O0 -O1 -O2 -O3 -Os -Ofast -Og -flto)
set(CMAKE_C_FLAGS_DEBUG "-Og -g -DDEBUG")
set(CMAKE_C_FLAGS_RELEASE "-Os -flto")

include("cmake/settings.cmake")

include_directories(
    ${CMAKE_SOURCE_DIR}
)

link_directories(
    ${CMAKE_SOURCE_DIR}
)

# sources
add_executable(${PROJECT_NAME}
    src/vector.asm
    src/handlers.asm
    src/main.c
)

# link
target_link_libraries(${PROJECT_NAME}
        ${CPU_OPTIONS}
        -T${LINKER_SCRIPT}
        -nostartfiles
        m
        # -nostdlib
)

set_property(TARGET ${PROJECT_NAME} PROPERTY LINK_DEPENDS ${CMAKE_SOURCE_DIR}/${LINKER_SCRIPT})

include("cmake/flash.cmake")