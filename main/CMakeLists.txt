project(main)

file(GLOB_RECURSE HEADER_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.h"
)

file(GLOB_RECURSE SOURCE_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/main)

set(main_targets_external_libs thirdA thirdB)
set(main_targets_internal_libs alibrary blibrary)

set(main_targets ${main_targets_internal_libs} ${main_targets_external_libs})

target_link_libraries(${PROJECT_NAME} PRIVATE ${main_targets})

set_target_properties(${PROJECT_NAME} PROPERTIES
BUILD_RPATH "$ORIGIN"
INSTALL_RPATH "$ORIGIN"
BUILD_WITH_INSTALL_RPATH TRUE
)

foreach(_imported_lib ${main_targets_external_libs})
    get_target_property(_loc ${_imported_lib} IMPORTED_LOCATION)
    if(_loc)
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${_loc}" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"
        )
    endif()
endforeach()
