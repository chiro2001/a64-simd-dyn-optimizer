// Constant-shape wrapper seed for hps 32x8.
#include "filter-prim.cpp"

extern "C" void dynopt_interp8_hps_32x8_seed(
    const uint8_t* src, intptr_t srcStride,
    int16_t* dst, intptr_t dstStride, int coeffIdx)
{
    x265::interp_horiz_ps_neon<8, 32, 8>(src, srcStride, dst, dstStride,
                                          coeffIdx, 0);
}
