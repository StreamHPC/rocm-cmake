################################################################################
# Copyright (C) 2017 Advanced Micro Devices, Inc.
################################################################################

cmake_minimum_required(VERSION 3.6)
cmake_policy(VERSION 3.6...3.28)
enable_testing()

project(rocm-cmake LANGUAGES NONE)

find_package(ROCmCMakeBuildTools REQUIRED NO_DEFAULT_PATH PATHS "${PROJECT_SOURCE_DIR}")
include(ROCmDefaults)
include(ROCmOptions)
include(${PROJECT_NAME}Options)

include(ROCMSetupVersion)
rocm_setup_version(VERSION 0.11.0)

install(DIRECTORY share DESTINATION .)
install(
    FILES "${CMAKE_CURRENT_BINARY_DIR}/ROCmCMakeBuildToolsConfigVersion.cmake"
    DESTINATION share/rocmcmakebuildtools/cmake
)

set(CPACK_RPM_PACKAGE_LICENSE "MIT")
include(CMakePackageConfigHelpers)
include(ROCMCreatePackage)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/ROCmCMakeBuildToolsConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)
rocm_create_package(
    NAME rocm-cmake
    MAINTAINER "Paul Fultz II pfultz@amd.com"
)

set(CONFIGURE_DEPENDS)
if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.12)
    set(CONFIGURE_DEPENDS CONFIGURE_DEPENDS)
endif()
file(GLOB_RECURSE CMAKE_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${CONFIGURE_DEPENDS} share/*.cmake test/*.cmake)

add_custom_target(analyze COMMAND cmake-lint ${CMAKE_FILES} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
add_custom_target(format COMMAND cmake-format -i ${CMAKE_FILES} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

if(ROCM_CMAKE_BUILD_TESTING)
    add_custom_target(check COMMAND "${CMAKE_CTEST_COMMAND}" --output-on-failure -C ${CMAKE_CFG_INTDIR})
    add_subdirectory(test)
endif()
if(ROCM_CMAKE_BUILD_DOCS)
    add_subdirectory(doc)
endif()
