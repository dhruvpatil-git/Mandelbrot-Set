#include "mandelbrot.cuh"

#include <cuda_runtime.h>
#include <iostream>

__global__
void FillKernel(unsigned char* pixels,
                int width,
                int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height)
        return;

    int idx = (y * width + x) * 4;

    pixels[idx + 0] = (unsigned char)(255.0f * x / width);   // R
    pixels[idx + 1] = (unsigned char)(255.0f * y / height);  // G
    pixels[idx + 2] = 128;                                   // B
    pixels[idx + 3] = 255;                                   // A
}

void GenerateMandelbrotCUDA(
    std::vector<unsigned char>& pixels,
    int width,
    int height,
    double,
    double,
    double,
    int)
{
    pixels.resize(width * height * 4);

    unsigned char* devicePixels;

    cudaMalloc(&devicePixels,
               pixels.size());

    dim3 block(16,16);

    dim3 grid(
        (width + block.x - 1) / block.x,
        (height + block.y - 1) / block.y
    );

    FillKernel<<<grid,block>>>(devicePixels,
                               width,
                               height);

    cudaMemcpy(
        pixels.data(),
        devicePixels,
        pixels.size(),
        cudaMemcpyDeviceToHost);

    cudaFree(devicePixels);
}