cmake_minimum_required(VERSION 2.8)
set (projectName com_test)

if(DIST_WIN32VS05)
set(QT_QMAKE_EXECUTABLE "c:/Qt/4.8.1-win32vs05/bin/qmake.exe")

find_package(Qt4 REQUIRED)
include(${QT_USE_FILE})
endif()

if(DIST_WIN32VS13)
set(CMAKE_PREFIX_PATH "c:/Qt_5/5.5/msvc2013")

find_package (Qt5Widgets REQUIRED) 
endif()




if(DIST_WINDOWS)
add_definitions(-DDIST_WINDOWS)
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR} )
if(DIST_WIN32VS05)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/vs2005)
endif()

file(GLOB ${projectName}_SRC
    "*.h"
    "*.h"
    "*.c"
    "*.cpp"
) 

set(CMAKE_AUTOMOC TRUE)
 
if(DIST_WINDOWS)
list(REMOVE_ITEM ${projectName}_SRC ${CMAKE_CURRENT_SOURCE_DIR}/freebsd.c)
list(REMOVE_ITEM ${projectName}_SRC ${CMAKE_CURRENT_SOURCE_DIR}/linux.c)
list(REMOVE_ITEM ${projectName}_SRC ${CMAKE_CURRENT_SOURCE_DIR}/linux_termios.c)
list(REMOVE_ITEM ${projectName}_SRC ${CMAKE_CURRENT_SOURCE_DIR}/macosx.c)
endif()


message(${${projectName}_SRC})
add_executable(${projectName} ${${projectName}_SRC})
if(DIST_WINDOWS)
#target_link_libraries(${projectName} ${CMAKE_CURRENT_SOURCE_DIR}/ftd2xx_win32/ftd2xx.lib )
target_link_libraries(${projectName} Setupapi.lib) 
if(DIST_WIN32VS05)
target_link_libraries(${projectName} Qt4::QtGui )
else()
qt5_use_modules(${projectName} Widgets)
endif()
endif()

