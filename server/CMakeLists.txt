include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_executable(server "")
target_sources(server 
    PRIVATE
        main.cc
        data_socket.cc
        utils.cc
        peer_channel.cc
)
target_link_libraries(server  ${LIBWEBRTC_LIBRARIES})