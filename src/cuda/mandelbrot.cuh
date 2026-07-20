#pragma once

#include <vector>

void GenerateMandelbrotCUDA(
    std::vector<unsigned char>& pixels,
    int width,
    int height,
    double centerX,
    double centerY,
    double zoom,
    int maxIterations
);