// Constant-shape wrapper seed for weight_pp 64x32 branch-0.
#include "pixel-prim.cpp"

extern "C" void dynopt_weight_pp_64x32_seed(
    const uint8_t* src, uint8_t* dst, intptr_t stride)
{
    weight_pp_neon(src, dst, stride, 64, 32, 64, 32, 6, 0);
}
