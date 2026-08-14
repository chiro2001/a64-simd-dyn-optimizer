// SAO stats BO (band offset), 64x1 NEON seed (ACLE, docs/45 §9).
// Mirrors saoCuStatsBO_neon: reads 8 pixels as u64, shifts right by
// (X265_DEPTH - SAO_BO_BITS - 2), masks 0x7c, then byte-addressed
// scalar scatter-adds into stats/count (off = 4*class).
#include <stddef.h>
#include <stdint.h>

#define BO_BLOCK(x)                                                       \
    do {                                                                  \
        uint64_t v = *(const uint64_t*)(const void*)(rec + (x));          \
        v >>= 1;                                                          \
        *((int32_t*)((uint8_t*)stats + ((v >> 0) & 0x7c))) += diff[x + 0];\
        *((int32_t*)((uint8_t*)count + ((v >> 0) & 0x7c))) += 1;          \
        *((int32_t*)((uint8_t*)stats + ((v >> 8) & 0x7c))) += diff[x + 1];\
        *((int32_t*)((uint8_t*)count + ((v >> 8) & 0x7c))) += 1;          \
        *((int32_t*)((uint8_t*)stats + ((v >> 16) & 0x7c))) += diff[x + 2];\
        *((int32_t*)((uint8_t*)count + ((v >> 16) & 0x7c))) += 1;         \
        *((int32_t*)((uint8_t*)stats + ((v >> 24) & 0x7c))) += diff[x + 3];\
        *((int32_t*)((uint8_t*)count + ((v >> 24) & 0x7c))) += 1;         \
        *((int32_t*)((uint8_t*)stats + ((v >> 32) & 0x7c))) += diff[x + 4];\
        *((int32_t*)((uint8_t*)count + ((v >> 32) & 0x7c))) += 1;         \
        *((int32_t*)((uint8_t*)stats + ((v >> 40) & 0x7c))) += diff[x + 5];\
        *((int32_t*)((uint8_t*)count + ((v >> 40) & 0x7c))) += 1;         \
        *((int32_t*)((uint8_t*)stats + ((v >> 48) & 0x7c))) += diff[x + 6];\
        *((int32_t*)((uint8_t*)count + ((v >> 48) & 0x7c))) += 1;         \
        *((int32_t*)((uint8_t*)stats + ((v >> 56) & 0x7c))) += diff[x + 7];\
        *((int32_t*)((uint8_t*)count + ((v >> 56) & 0x7c))) += 1;         \
    } while (0)

extern "C" void dynopt_sao_stats_bo_64(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int32_t* stats, int32_t* count)
{
    BO_BLOCK(0);
    BO_BLOCK(8);
    BO_BLOCK(16);
    BO_BLOCK(24);
    BO_BLOCK(32);
    BO_BLOCK(40);
    BO_BLOCK(48);
    BO_BLOCK(56);
}
