# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Set the project name
project(XiangShanRTL)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include directories


# Add subdirectories
include(obj_dir_fst_t16/VXSTop.cmake)

set(CMAKE_C_COMPILER   clang-18)
set(CMAKE_CXX_COMPILER clang++-18)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)



# Set the RPATH for the installation to the origin directory, allowing the executable to find its dependencies relative to its own location.
set(CMAKE_INSTALL_RPATH $ORIGIN)

# Add ${VERILATOR_ROOT}/include as an include folder for xs2core_exe target
include_directories(${VERILATOR_ROOT}/include
                    obj_dir_fst_t16
)


# Define compile-time definitions for tracing options
# Enable VCD tracing if the VXSTop_TRACE_VCD variable is set
add_compile_definitions(TRACE_VCD=${VXSTop_TRACE_VCD})
# Enable FST tracing if the VXSTop_TRACE_FST variable is set
add_compile_definitions(TRACE_FST=${VXSTop_TRACE_FST})
# Enable general tracing by setting TRACE to 1
add_compile_definitions(TRACE=1)


# Create an executable
add_executable(xs2core_exe ${VXSTop_USER_CLASSES}
                           ${VXSTop_GLOBAL}
          )

add_library(xs2core_support_slow  SHARED ${VXSTop_SUPPORT_SLOW})
add_library(xs2core_support_fast  SHARED ${VXSTop_SUPPORT_FAST})
add_library(xs2core_class_fast  SHARED ${VXSTop_CLASSES_FAST})
add_library(xs2core_class_slow  SHARED ${VXSTop_CLASSES_SLOW})
                                
# Link libraries if needed
target_link_libraries( xs2core_exe PRIVATE z pthread atomic 
                        xs2core_support_slow 
                        xs2core_support_fast 
                        xs2core_class_fast
                        xs2core_class_slow
                        )

