project(blibrary)

add_library(${PROJECT_NAME} SHARED src/blibrary.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC include)
