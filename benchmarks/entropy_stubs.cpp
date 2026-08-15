// Link-time stubs for entropy_microbench's non-target dynopt symbols.
// The microbench references all four candidates in one binary; when only
// one kernel is under test, the other three symbols come from this file.
// The stubs are never timed (only the scan/cost/flag/remain mode selected
// on the command line is called).
#include <cstdint>
#include <cstddef>

extern "C" uint32_t dynopt_cost_coeff_nxn_sve2(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int)
{
    return 0;
}

extern "C" uint32_t dynopt_cost_c1c2_flag_sve2(
    uint16_t*, intptr_t, uint8_t*, intptr_t)
{
    return 0;
}

extern "C" uint32_t dynopt_cost_coeff_remain_sve2(
    uint16_t*, int, int)
{
    return 0;
}
