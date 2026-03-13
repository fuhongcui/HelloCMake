cmake_minimum_required(VERSION 3.28)

project(HelloCMake)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(__POJECT_VERSION__ 1.0)
configure_file(version.h.in ${PROJECT_BINARY_DIR}/version.h @ONLY)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake-modules")

find_package(OpenGL REQUIRED)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer -fno-sanitize-recover=all -fsanitize=address " CACHE STRING "Set C++ Compiler Flags" FORCE)

set(CMAKE_BUILD_RPATH_USE_ORIGIN TRUE)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

add_subdirectory(library/alibrary)
add_subdirectory(library/blibrary)
add_subdirectory(external/thirdA)
add_subdirectory(external/thirdB)
add_subdirectory(main)



