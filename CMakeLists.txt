https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
cmake_minimum_required(VERSION 3.10)

project(Lab5_CBI)

if(POLICY CMP0077)
  cmake_policy(SET CMP0077 OLD)
endif()

find_package(LLVM 8 REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(HandleLLVMOptions)
include(AddLLVM)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS} include)
link_directories(${LLVM_LIBRARY_DIRS} ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/reference)

add_llvm_library(CBIInstrumentPass MODULE
  src/CBIInstrument.cpp
  )

add_executable(cbi
  src/CBI.cpp
  )

add_library(runtime MODULE
  lib/runtime.c
  )

add_custom_target(reference ALL
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/reference/* ${CMAKE_CURRENT_BINARY_DIR}/
)
