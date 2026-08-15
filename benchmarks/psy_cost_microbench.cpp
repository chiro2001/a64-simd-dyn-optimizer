// CNTVCT per-shape A/B for psyCost_pp (round-0036): upstream near peak.
// Usage: psy_cost_microbench <4x4|8x8|16x16|32x32|64x64> [samples] [batch]
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>
#include "common/primitives.h"
using namespace X265_NS;
static inline uint64_t rdtsc() { uint64_t t; __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t)); return t; }
int main(int argc, char** argv) {
    const char* shape = argc > 1 ? argv[1] : "16x16";
    const int samples = argc > 2 ? atoi(argv[2]) : 50;
    const int batch = argc > 3 ? atoi(argv[3]) : 16;
    int blk;
    if (!strcmp(shape, "8x8")) blk = BLOCK_8x8;
    else if (!strcmp(shape, "16x16")) blk = BLOCK_16x16;
    else if (!strcmp(shape, "32x32")) blk = BLOCK_32x32;
    else if (!strcmp(shape, "64x64")) blk = BLOCK_64x64;
    else if (!strcmp(shape, "4x4")) blk = BLOCK_4x4;
    else return 2;
    x265_param p; memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8; p.cpuid = cpu_detect(false);
    x265_setup_primitives(&p);
    pixelcmp_t fn = primitives.cu[blk].psy_cost_pp;
    if (!fn) { printf("no psy_cost_pp for %s\n", shape); return 3; }
    const int dim = blk == BLOCK_4x4 ? 4 : blk == BLOCK_8x8 ? 8 :
                    blk == BLOCK_16x16 ? 16 : blk == BLOCK_32x32 ? 32 : 64;
    std::mt19937 rng(0x5059u);
    std::vector<uint8_t> a((dim+8)*dim), b((dim+8)*dim);
    for (size_t i = 0; i < a.size(); i++) a[i] = (uint8_t)rng();
    for (size_t i = 0; i < b.size(); i++) b[i] = (uint8_t)rng();
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++) {
        uint64_t t0 = rdtsc();
        int acc = 0;
        for (int i = 0; i < batch; i++)
            acc += fn(a.data() + (s & 7) * dim, dim + 8, b.data() + (s & 7) * dim, dim + 8);
        uint64_t t1 = rdtsc();
        times.push_back((t1 - t0) / (uint64_t)batch);
    }
    std::sort(times.begin(), times.end());
    printf("psy,%s,median=%llu\n", shape, (unsigned long long)times[times.size()/2]);
    return 0;
}
