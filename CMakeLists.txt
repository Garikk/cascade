cmake_minimum_required(VERSION 2.8)
set (projectName cascade)
project(cascade)
find_package(Qt5 COMPONENTS Core)

include_directories(${CMAKE_CURRENT_SOURCE_DIR} )

file(GLOB ${projectName}_SRC
    "*.h"
    "*.h"
    "*.cpp"
) 

set(CMAKE_AUTOMOC TRUE)
 
message(${${projectName}_SRC})
add_executable(${projectName} ${${projectName}_SRC})

qt5_use_modules(${projectName} Widgets)
target_link_libraries(${projectName} ftdi1)
