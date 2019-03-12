FIND_PACKAGE(PkgConfig REQUIRED)
PKG_CHECK_MODULES(GTK3 REQUIRED gtk+-3.0)

add_executable(client "")
target_sources(client PRIVATE linux/main.cc
            linux/main_wnd.cc
            conductor.cc
            defaults.cc
            peer_connection_client.cc
)
target_include_directories(client PRIVATE ${GTK3_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR})
target_link_directories(client PRIVATE /usr/local/opt/gettext/lib)
target_link_libraries(client ${GTK3_LIBRARIES} ${LIBWEBRTC_LIBRARIES})