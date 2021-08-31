cmake_minimum_required(VERSION 2.7)
project( EfectoImagen )

find_package(MPI REQUIRED)
find_package( OpenCV REQUIRED )

include_directories(${MPI_INCLUDE_PATH})
include_directories( ${OpenCV_INCLUDE_DIRS} )

add_executable(EfectoImagen example.cpp)
target_link_libraries(EfectoImagen ${MPI_LIBRARIES} ${OpenCV_LIBS})

if(MPI_COMPILE_FLAGS)
  set_target_properties(EfectoImagen PROPERTIES
    COMPILE_FLAGS "${MPI_COMPILE_FLAGS}")
endif()

if(MPI_LINK_FLAGS)
  set_target_properties(EfectoImagen PROPERTIES
    LINK_FLAGS "${MPI_LINK_FLAGS}")
endif()