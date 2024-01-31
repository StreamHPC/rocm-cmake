# ######################################################################################################################
# Copyright (C) 2017-2024 Advanced Micro Devices, Inc.
# ######################################################################################################################

set(ROCM_DIST_VERSION "6.0.1" CACHE STRING "ROCm distribution version being packaged")

option(ROCM_BUILD_TESTING "Default value of ROCm projects building unit tests." ON)
option(ROCM_BUILD_EXAMPLES "Default value of ROCm projects building examples." ON)
option(ROCM_BUILD_DOCS "Default value of ROCm projects building documentation." ON)
option(ROCM_BUILD_TOOLS "Default value of ROCm projects building auxiliary executables." ON)
option(ROCM_BUILD_FILE_REORG_BACKWARD_COMPAT "Default value of ROCm projects building with file/folder reorg with backward compatibility enabled" OFF)

include(CMakeDependentOption)
