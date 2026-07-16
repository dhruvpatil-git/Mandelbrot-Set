<div align="center">

# Mandelbrot Explorer (OpenGL)

A real-time Mandelbrot fractal explorer built with **C++**, **OpenGL**, **GLFW**, and **GLAD**.

Interactive rendering with smooth zooming and GPU-accelerated visualization.

> 🚀 This branch contains the **OpenGL implementation**.
> The **CUDA accelerated version** is currently under development.

</div>

---

## Preview

> *(Add screenshots or GIFs here)*

---

## Features

- ⚡ GPU rendering using OpenGL Fragment Shaders
- 🔍 Interactive Zoom
- 🖱️ Mouse Panning
- 🎨 Smooth Fractal Coloring
- 🖥️ Fullscreen Quad Rendering
- 📈 High Performance GPU Rendering
- 🧩 Modular C++ Project Structure
- 📦 CMake Build System

---

## Tech Stack

- **Language:** C++17
- **Graphics API:** OpenGL 4.6
- **Windowing:** GLFW
- **OpenGL Loader:** GLAD
- **Build System:** CMake

---

## Project Structure

```
Mandelbrot Set/
│
├── external/
│   └── glad/
│
├── shaders/
│   ├── mandelbrot.vert
│   └── mandelbrot.frag
│
├── src/
│   └── main.cpp
│
├── CMakeLists.txt
└── README.md
```

---

## Build Instructions

### Requirements

- C++17 Compiler
- CMake 3.20+
- OpenGL 4.6
- GLFW
- GLAD

### Clone Repository

```bash
git clone https://github.com/<YOUR_USERNAME>/Mandelbrot-Explorer.git
cd Mandelbrot-Explorer
```

### Build

```bash
mkdir build
cd build

cmake ..
cmake --build .
```

Run the generated executable.

---

## Controls

| Key / Mouse | Action |
|-------------|--------|
| Mouse Wheel | Zoom In / Out |
| Left Mouse Drag | Pan |
| ESC | Exit |

---

## Rendering Pipeline

```
CPU
 │
 ▼
Camera Parameters
 │
 ▼
OpenGL Fragment Shader
 │
 ▼
Mandelbrot Iteration
 │
 ▼
Smooth Coloring
 │
 ▼
Framebuffer
 │
 ▼
Window
```

---

## Future Improvements

- ✅ CUDA Acceleration
- ✅ CUDA/OpenGL Interoperability
- ✅ Performance HUD
- ✅ Julia Set
- ✅ Multiple Color Palettes
- ✅ Image Export
- ✅ Deep Zoom Optimization

---

## Future Branch

The next major milestone of this project is a complete CUDA-powered renderer.

The CUDA implementation will feature:

- CUDA Kernels
- CUDA/OpenGL Shared Texture
- Massive Parallel Fractal Computation
- Higher Performance
- Real-time Performance HUD

---

## License

This project is licensed under the MIT License.

---

<div align="center">

Built with ❤️ using C++ and OpenGL.

</div>
