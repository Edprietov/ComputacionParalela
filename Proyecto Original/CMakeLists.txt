cmake_minimum_required(VERSION 2.8)
project( life )
find_package( OpenCV REQUIRED )
FIND_PACKAGE(Threads REQUIRED)
SET(Boost_USE_MULTITHREADED ON)
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( life life.cpp )
target_link_libraries( life ${OpenCV_LIBS} ${CMAKE_THREAD_LIBS_INIT})
