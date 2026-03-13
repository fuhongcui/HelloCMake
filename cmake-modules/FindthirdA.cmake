include(FindPackageHandleStandardArgs)

find_path(thirdA_INCLUDE_DIR NAMES thirdA/thirdA.h HINTS ${CMAKE_SOURCE_DIR}/external/thirdA PATH_SUFFIXES include)
find_library(thirdA_LIBRARY NAMES thirdA HINTS ${CMAKE_SOURCE_DIR}/external/thirdA/lib)

find_package_handle_standard_args(thirdA REQUIRED_VARS thirdA_INCLUDE_DIR thirdA_LIBRARY)
mark_as_advanced(thirdA_INCLUDE_DIR thirdA_LIBRARY)

if(thirdA_FOUND AND NOT TARGET thirdA)
    add_library(thirdA SHARED IMPORTED)
    set_target_properties(thirdA PROPERTIES 
        IMPORTED_LOCATION "${thirdA_LIBRARY}"
        IMPORTED_NO_SONAME TRUE
        INTERFACE_INCLUDE_DIRECTORIES "${thirdA_INCLUDE_DIR}"
    )
    message(STATUS "Found thirdA: ${thirdA_LIBRARY}")
endif()
