cmake_minimum_required(VERSION 3.28)

project(HelloCMake)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(__POJECT_VERSION__ 1.0)

configure_file(version.h.in ${PROJECT_BINARY_DIR}/version.h @ONLY)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules")

find_package(thirdA REQUIRED)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer -fno-sanitize-recover=all -fsanitize=address " CACHE STRING "Set C++ Compiler Flags" FORCE)

add_subdirectory(library/alibrary)
add_subdirectory(library/blibrary)

message(STATUS "alibrary: ${alibrary_SOURCE_DIR}")
message(STATUS "blibrary: ${blibrary_SOURCE_DIR}")

add_executable(${PROJECT_NAME} src/Hello.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE include)
target_link_libraries(${PROJECT_NAME} PRIVATE alibrary blibrary thirdA)


