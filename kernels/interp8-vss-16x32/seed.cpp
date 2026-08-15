// Constant-shape wrapper seed for vss 16x32.
#include "filter-prim.cpp"

extern "C" void dynopt_interp8_vss_16x32_seed(const int16_t* src, intptr_t srcStride, int16_t* dst, intptr_t dstStride, int coeffIdx)
{
    x265::interp_vert_ss_neon<8, 16, 32>(src, srcStride, dst, dstStride, coeffIdx);
}
