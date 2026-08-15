// Constant-shape wrapper seed for hps 16x16 isRowExt=1.
#include "filter-prim.cpp"

extern "C" void dynopt_interp8_hps_16x16_ext_seed(
    const uint8_t* src, intptr_t srcStride,
    int16_t* dst, intptr_t dstStride, int coeffIdx)
{
    x265::interp_horiz_ps_neon<8, 16, 16>(src, srcStride, dst, dstStride,
                                            coeffIdx, 1);
}
