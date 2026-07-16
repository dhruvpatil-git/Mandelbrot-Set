#include <cuda_runtime.h>
#include <iostream>

__global__ void helloKernel()
{
    printf("Hello from CUDA! Thread %d\n", threadIdx.x);
}

void runHelloKernel()
{
    helloKernel<<<1, 8>>>();
    cudaDeviceSynchronize();
}