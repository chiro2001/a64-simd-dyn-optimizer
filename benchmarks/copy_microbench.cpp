// CNTVCT A/B for blockcopy/copy family on 920B.
// Usage: copy_microbench <cu32|pu16|cu16|chroma16> <neon|cand> samples batch
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" void dynopt_cu_copy_pp_sve2(
    uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" void dynopt_pu_copy_pp_sve2(
    uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" void dynopt_chroma_copy_pp_sve2(
    uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    if (argc < 4)
        return 2;
    const char* op = argv[1];
    const int which = !strcmp(argv[2], "cand");
    const int samples = atoi(argv[3]);
    const int batch = argc > 4 ? atoi(argv[4]) : 16;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    copy_pp_t neon = nullptr, cand = nullptr;
    int size = 16;
    if (!strcmp(op, "cu32"))
    {
        neon = primitives.cu[BLOCK_32x32].copy_pp;
        cand = dynopt_cu_copy_pp_sve2;
        size = 32;
    }
    else if (!strcmp(op, "pu16"))
    {
        neon = primitives.pu[LUMA_16x16].copy_pp;
        cand = dynopt_pu_copy_pp_sve2;
        size = 16;
    }
    else if (!strcmp(op, "cu16"))
    {
        neon = primitives.cu[BLOCK_16x16].copy_pp;
        cand = dynopt_cu_copy_pp_sve2;
        size = 16;
    }
    else if (!strcmp(op, "chroma16"))
    {
        neon = primitives.chroma[X265_CSP_I420].pu[CHROMA_420_16x16].copy_pp;
        cand = dynopt_chroma_copy_pp_sve2;
        size = 16;
    }
    if (!neon || !cand)
        return 2;
    std::mt19937 rng(0xC0A7u);
    std::vector<uint8_t> src(64 * 64), dst(64 * 64);
    for (size_t i = 0; i < src.size(); i++)
        src[i] = (uint8_t)(rng() & 0xFF);
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                cand(dst.data(), 64, src.data(), 64);
            else
                neon(dst.data(), 64, src.data(), 64);
        }
        uint64_t t1 = rdtsc();
        times.push_back((t1 - t0) / (uint64_t)batch);
    }
    std::sort(times.begin(), times.end());
    printf("%s,%s,median=%llu\n", op, which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
