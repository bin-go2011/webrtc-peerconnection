add_executable(server "")
target_sources(server 
    PRIVATE
        main.cc
        data_socket.cc
        peer_channel.cc
        utils.cc
)
target_include_directories(server PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(server  ${LIBWEBRTC_LIBRARIES})