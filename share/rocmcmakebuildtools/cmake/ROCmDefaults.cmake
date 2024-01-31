# ######################################################################################################################
# Copyright (C) 2017-2024 Advanced Micro Devices, Inc.
# ######################################################################################################################

if(UNIX AND NOT APPLE)
    set(CMAKE_INSTALL_PREFIX "/opt/rocm" CACHE PATH "")
elseif(WIN32)
    set(CMAKE_INSTALL_PREFIX "C:\\Program Files\\AMD\\ROCm\\${ROCM_DIST_VERSION}" CACHE PATH "")
endif()

if(UNIX AND NOT APPLE)
    if(DEFINED ROCM_PATH)
        list(APPEND CMAKE_MODULE_PATH "${ROCM_PATH}")
        list(APPEND CMAKE_PREFIX_PATH "${ROCM_PATH}")
    elseif(DEFINED ENV{ROCM_PATH})
        list(APPEND CMAKE_MODULE_PATH "$ENV{ROCM_PATH}")
        list(APPEND CMAKE_PREFIX_PATH "$ENV{ROCM_PATH}")
    endif()
elseif(WIN32)
    if(DEFINED HIP_PATH)
        list(APPEND CMAKE_MODULE_PATH "${HIP_PATH}")
        list(APPEND CMAKE_PREFIX_PATH "${HIP_PATH}")
    elseif(DEFINED ENV{HIP_PATH})
        # Some built-in CMake functionality will not tolerate native paths
        # on CMAKE_ variables, such as try_compile().
        string(REPLACE "\\" "/" _hip_path "$ENV{HIP_PATH}")
        list(APPEND CMAKE_MODULE_PATH "${_hip_path}")
        list(APPEND CMAKE_PREFIX_PATH "${_hip_path}")
    endif()
endif()

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/Modules")
