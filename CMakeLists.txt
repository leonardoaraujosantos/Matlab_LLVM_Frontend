# Minimum stuff to compile
cmake_minimum_required (VERSION 2.6)

# Name of the project
project (mat2llvm)

# Check if LLVM exist
find_package(LLVM)
if( NOT LLVM_FOUND )
  message(FATAL_ERROR "LLVM package can't be found.")
endif()

# Check if Flex and Bison exist
find_package(BISON)
find_package(FLEX)

if( NOT FLEX_FOUND )
  message(FATAL_ERROR "Flex cannot be found.")
endif()
if( NOT BISON_FOUND )
  message(FATAL_ERROR "Bison cannot be found.")
endif()


include_directories( src ${LLVM_INCLUDE_DIRS} )

# The version number.
set (MAT2LLVM_VERSION_MAJOR 0)
set (MAT2LLVM_VERSION_MINOR 0)

# Set the output folder where your program will be created
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})


# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")

#add_executable(mat2llvm mat2llvm_main.cpp)
