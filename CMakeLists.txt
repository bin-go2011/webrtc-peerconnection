cmake_minimum_required(VERSION 3.5)
project(peerconnection)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
    ${CMAKE_SOURCE_DIR}/CMakeModules)

add_definitions(-g)

include(FindLibraries)
include_directories(${WEBRTC_INCLUDE_DIR}
    ${WEBRTC_INCLUDE_DIR}/webrtc
    ${WEBRTC_INCLUDE_DIR}/webrtc/third_party/abseil-cpp
)

add_subdirectory(server)