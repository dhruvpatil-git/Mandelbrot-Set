#include "mandelbrot.cuh"

#include <cuda_runtime.h>
#include <vector>
#include <cmath>

__global__
void MandelbrotKernel(
    unsigned char* pixels,
    int width,
    int height,
    double centerX,
    double centerY,
    double zoom,
    int maxIterations)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height)
        return;

    double aspect = (double)width / (double)height;

    double viewHeight = 3.0 / zoom;
    double viewWidth  = viewHeight * aspect;

    double real = centerX +
        ((double)x / width - 0.5) * viewWidth;

    double imag = centerY -
        ((double)y / height - 0.5) * viewHeight;

    double zr = 0.0;
    double zi = 0.0;

    int iter = 0;

    while (zr * zr + zi * zi <= 4.0 &&
           iter < maxIterations)
    {
        double temp = zr * zr - zi * zi + real;
        zi = 2.0 * zr * zi + imag;
        zr = temp;
        iter++;
    }

    int idx = (y * width + x) * 4;

    unsigned char color;

    if (iter == maxIterations)
        color = 0;
    else
        color = (unsigned char)(255.0 * iter / maxIterations);

    pixels[idx + 0] = color;
    pixels[idx + 1] = color;
    pixels[idx + 2] = color;
    pixels[idx + 3] = 255;
}

void GenerateMandelbrotCUDA(
    std::vector<unsigned char>& pixels,
    int width,
    int height,
    double centerX,
    double centerY,
    double zoom,
    int maxIterations)
{
    pixels.resize(width * height * 4);

    unsigned char* devicePixels = nullptr;

    cudaMalloc(
        &devicePixels,
        pixels.size());

    dim3 block(16,16);

    dim3 grid(
        (width + block.x - 1) / block.x,
        (height + block.y - 1) / block.y);

    MandelbrotKernel<<<grid, block>>>(
        devicePixels,
        width,
        height,
        centerX,
        centerY,
        zoom,
        maxIterations);

    cudaMemcpy(
        pixels.data(),
        devicePixels,
        pixels.size(),
        cudaMemcpyDeviceToHost);

    cudaFree(devicePixels);
}