// Constant-shape wrapper seed for vsp 16x4.
#include "filter-prim.cpp"

extern "C" void dynopt_interp8_vsp_16x4_seed(const int16_t* src, intptr_t srcStride, uint8_t* dst, intptr_t dstStride, int coeffIdx)
{
    x265::interp_vert_sp_neon<8, 16, 4>(src, srcStride, dst, dstStride, coeffIdx);
}
