// Constant-shape wrapper seed for planecopy_cp 64x32 (8-bit memcpy).
#include "pixel-prim.cpp"

extern "C" void dynopt_planecopy_cp_64x32_seed(
    const uint8_t* src, intptr_t srcStride,
    uint8_t* dst, intptr_t dstStride)
{
    planecopy_cp_neon(src, srcStride, dst, dstStride, 64, 32, 0);
}
