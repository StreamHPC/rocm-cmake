# ######################################################################################################################
# Copyright (C) 2017-2024 Advanced Micro Devices, Inc.
# ######################################################################################################################

option(ROCM_BUILD_TESTING "Default value of ROCm projects building unit tests." ON)
option(ROCM_BUILD_EXAMPLES "Default value of ROCm projects building examples." ON)
option(ROCM_BUILD_DOCS "Default value of ROCm projects building documentation." ON)
option(ROCM_BUILD_TOOLS "Default value of ROCm projects building auxiliary executables." ON)

set(ROCM_DIST_VERSION "6.0.1" CACHE STRING "ROCm distribution version being packaged")

if(UNIX AND NOT APPLE)
    set(CMAKE_INSTALL_PREFIX "/opt/rocm/${ROCM_DIST_VERSION}" CACHE PATH "")
elseif(WIN32)
    set(CMAKE_INSTALL_PREFIX "C:\\Program Files\\AMD\\ROCm\\${ROCM_DIST_VERSION}" CACHE PATH "")
endif()
