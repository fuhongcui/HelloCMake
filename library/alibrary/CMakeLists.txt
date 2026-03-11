project(alibrary)

add_library(${PROJECT_NAME} STATIC src/alibrary.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC include)
