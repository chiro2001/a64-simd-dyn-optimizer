// Link-time stubs for pixelcmp_microbench's non-target dynopt symbols.
// Only the op selected on the command line is called.
#include <cstdint>

extern "C" int dynopt_satd_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t)
{
    return 0;
}

extern "C" int dynopt_sad_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t)
{
    return 0;
}

extern "C" int dynopt_sa8d_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t)
{
    return 0;
}
