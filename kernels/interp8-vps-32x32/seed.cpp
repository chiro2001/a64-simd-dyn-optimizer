// Constant-shape wrapper seed for vps 32x32: include filter-prim.cpp so
// clang can fully unroll the vertical row loop after inlining.
#include "filter-prim.cpp"

extern "C" void dynopt_interp8_vps_32x32_seed(
    const uint8_t* src, intptr_t srcStride,
    int16_t* dst, intptr_t dstStride, int coeffIdx)
{
    x265::interp_vert_ps_neon<8, 32, 32>(src, srcStride, dst, dstStride,
                                           coeffIdx);
}
