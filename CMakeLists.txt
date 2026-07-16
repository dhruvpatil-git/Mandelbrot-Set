cmake_minimum_required(VERSION 3.20)

project(MandelbrotExplorer LANGUAGES C CXX CUDA)

# ===========================
# C++ Standard
# ===========================
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ===========================
# CUDA Standard
# ===========================
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

# RTX 4060 (Ada Lovelace)
set(CMAKE_CUDA_ARCHITECTURES 89)

# ===========================
# Find Packages
# ===========================
find_package(OpenGL REQUIRED)
find_package(CUDAToolkit REQUIRED)

# ===========================
# GLFW (Build from source)
# ===========================
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)

add_subdirectory(external/glfw)

# ===========================
# Executable
# ===========================
add_executable(MandelbrotExplorer

    # Main
    src/main.cpp

    # CUDA
    src/cuda/mandelbrot.cu

    # GLAD
    external/glad/src/glad.c
)

# ===========================
# Include Directories
# ===========================
target_include_directories(MandelbrotExplorer PRIVATE

    src

    external/glad/include
)

# ===========================
# CUDA Properties
# ===========================
set_target_properties(MandelbrotExplorer PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
)

# ===========================
# Link Libraries
# ===========================
target_link_libraries(MandelbrotExplorer PRIVATE

    glfw

    OpenGL::GL

    CUDA::cudart
)