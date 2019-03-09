# The following variables will be defined:
#
#  WEBRTC_FOUND
#  WEBRTC_DEFINES
#  WEBRTC_INCLUDE_DIR
#  WEBRTC_LIBRARIES_DEBUG
#  WEBRTC_LIBRARIES_RELEASE
#

# ============================================================================
# WebRTC root and default library directory
# ============================================================================

set(WEBRTC_ROOT_DIR "" CACHE PATH "Where is the WebRTC root directory located?")

if (DEFINED ENV{WEBRTC_ROOT_DIR})
  set(WEBRTC_ROOT_DIR $ENV{WEBRTC_ROOT_DIR})
  message("WEBRTC_ROOT_DIR = '${WEBRTC_ROOT_DIR}' from environment variable")
else() 
  set(WEBRTC_ROOT_DIR
    ""
    CACHE PATH
    "WebRTC root directory."
    )
endif()

if ( "${WEBRTC_ROOT_DIR}" STREQUAL "")
    message(FATAL_ERROR "A WEBRTC_ROOT_DIR is requred. \n"
                        " ex) cmake .. -DWEBRTC_ROOT_DIR=/dir/webrtc-build/build -DCMAKE_BUILD_TYPE=Debug|Release \n")
endif()

# ============================================================================
# Find WebRTC header directory
# ============================================================================

find_path(WEBRTC_INCLUDE_DIR
  NAMES
      webrtc/pc/peer_connection.h
  PATHS
  	${WEBRTC_ROOT_DIR}
  	${WEBRTC_ROOT_DIR}/include
  	${WEBRTC_ROOT_DIR}/include/webrtc
  )

# ============================================================================
# Find WebRTC libries
#   webrtc -> webrtc.lib or libwebrtc.a
# ============================================================================
find_library(WEBRTC_LIBRARIES_DEBUG
  NAMES webrtc libwebrtc webrtc_full libwebrtc_full
  PATHS ${WEBRTC_ROOT_DIR}/lib/Debug
)

find_library(WEBRTC_LIBRARIES_RELEASE
  NAMES webrtc libwebrtc webrtc_full libwebrtc_full
  PATHS ${WEBRTC_ROOT_DIR}/lib/Release
)

# ----------------------------------------------------------------------
# Display status
# ----------------------------------------------------------------------
include(FindPackageHandleStandardArgs)

set(WEBRTC_FOUND TRUE)
find_package_handle_standard_args(WEBRTC 
    FOUND_VAR WEBRTC_FOUND
    REQUIRED_VARS WEBRTC_LIBRARIES_DEBUG WEBRTC_LIBRARIES_RELEASE WEBRTC_INCLUDE_DIR
)
