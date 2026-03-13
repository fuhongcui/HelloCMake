project(blibrary)

add_library(${PROJECT_NAME} SHARED src/blibrary.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC include)
set_target_properties(${PROJECT_NAME} PROPERTIES
        BUILD_RPATH          "$ORIGIN"
        INSTALL_RPATH        "$ORIGIN"
        BUILD_WITH_INSTALL_RPATH TRUE
    )
