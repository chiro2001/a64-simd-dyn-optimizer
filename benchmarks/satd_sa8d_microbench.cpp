// SATD/SA8D real-machine microbenchmark (Yitian710 VL=128): upstream
// x265 SVE2/NEON vs AGO NEON candidates, CNTVCT ticks.
//
// Usage: satd_sa8d_microbench <impl> <latency|throughput> <samples>
//                             <batch>
//   impl: usatd8 | csatd8 | usatd16 | csatd16 | usatd32 | csatd32
//         usa8d16 | csa8d16 | usa8d32 | csa8d32
// Verify mode: satd_sa8d_microbench verify <cases>
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <string>
#include <vector>

namespace x265 {
template <int W, int H> int satd8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
template <int W, int H> int sa8d16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
template <int W, int H> int sa8d16x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
}

extern "C" int dynopt_satd_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_v_vpadal_seq(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_v_vpadal_pair(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_v_vaddlv_seq(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_v_vaddlv_pair(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_v_vaddv_seq(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_v_vaddv_pair(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_m_vaddlv(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_m_vpadal(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_m_vaddv(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

typedef int (*fn_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static const char* IMPLS[] = {
    "usatd8", "csatd8", "usatd16", "csatd16", "usatd32", "csatd32",
    "usa8d16", "csa8d16", "usa8d32", "csa8d32",
    "vpadal_seq", "vpadal_pair", "vaddlv_seq", "vaddlv_pair",
    "vaddv_seq", "vaddv_pair", "m_vaddlv", "m_vpadal", "m_vaddv"
};

static fn_t pick(const char* impl)
{
    if (!strcmp(impl, "usatd8"))  return x265::satd8_sve2<8, 8>;
    if (!strcmp(impl, "csatd8"))  return dynopt_satd_8x8_sve2;
    if (!strcmp(impl, "usatd16")) return x265::satd8_sve2<16, 16>;
    if (!strcmp(impl, "csatd16")) return dynopt_satd_16x16_sve2;
    if (!strcmp(impl, "usatd32")) return x265::satd8_sve2<32, 32>;
    if (!strcmp(impl, "csatd32")) return dynopt_satd_32x32_sve2;
    if (!strcmp(impl, "usa8d16")) return x265::sa8d16_sve2<16, 16>;
    if (!strcmp(impl, "csa8d16")) return dynopt_sa8d_16x16_sve2;
    if (!strcmp(impl, "usa8d32")) return x265::sa8d16x32_sve2<32, 32>;
    if (!strcmp(impl, "csa8d32")) return dynopt_sa8d_32x32_sve2;
    if (!strcmp(impl, "vpadal_seq"))  return dynopt_sa8d_16x16_v_vpadal_seq;
    if (!strcmp(impl, "vpadal_pair")) return dynopt_sa8d_16x16_v_vpadal_pair;
    if (!strcmp(impl, "vaddlv_seq"))  return dynopt_sa8d_16x16_v_vaddlv_seq;
    if (!strcmp(impl, "vaddlv_pair")) return dynopt_sa8d_16x16_v_vaddlv_pair;
    if (!strcmp(impl, "vaddv_seq"))   return dynopt_sa8d_16x16_v_vaddv_seq;
    if (!strcmp(impl, "vaddv_pair"))  return dynopt_sa8d_16x16_v_vaddv_pair;
    if (!strcmp(impl, "m_vaddlv"))    return dynopt_sa8d_16x16_m_vaddlv;
    if (!strcmp(impl, "m_vpadal"))    return dynopt_sa8d_16x16_m_vpadal;
    if (!strcmp(impl, "m_vaddv"))     return dynopt_sa8d_16x16_m_vaddv;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static fn_t upstream_of(const char* impl)
{
    if (strstr(impl, "satd8"))  return x265::satd8_sve2<8, 8>;
    if (strstr(impl, "satd16")) return x265::satd8_sve2<16, 16>;
    if (strstr(impl, "satd32")) return x265::satd8_sve2<32, 32>;
    if (strstr(impl, "sa8d16")) return x265::sa8d16_sve2<16, 16>;
    if (strstr(impl, "vpadal") || strstr(impl, "vaddlv") ||
        strstr(impl, "vaddv") || impl[0] == 'm')
        return x265::sa8d16_sve2<16, 16>;
    return x265::sa8d16x32_sve2<32, 32>;
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0xD16Cu);
    fn_t fn = pick(impl);
    fn_t ref = upstream_of(impl);
    long mism = 0;
    for (int t = 0; t < cases; t++)
    {
        static uint8_t a[64 * 64 + 32], b[64 * 64 + 32];
        for (int i = 0; i < 64 * 64; i++)
        {
            a[i] = (uint8_t)(rng() & 255);
            b[i] = (uint8_t)(rng() & 255);
        }
        int wa = ref(a, 64, b, 64);
        int wb = fn(a, 64, b, 64);
        if (wa != wb)
            mism++;
    }
    printf("verify,%s,%d,%ld\n", impl, cases, mism);
    return mism != 0;
}

static int bench(const char* impl, const char* mode, int samples, int batch)
{
    fn_t fn = pick(impl);
    std::mt19937 rng(0xD16Cu);
    static uint8_t a[1024 * 64 + 32], b[1024 * 64 + 32];
    for (int i = 0; i < 1024 * 64; i++)
    {
        a[i] = (uint8_t)(rng() & 255);
        b[i] = (uint8_t)(rng() & 255);
    }
    std::vector<uint64_t> ts(samples);
    volatile int sink = 0;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int blk = 0; blk < batch; blk++)
        {
            int idx = ((s * 7 + blk * 13) % 1024) * 64;
            sink += fn(a + idx, 64, b + idx, 64);
        }
        ts[s] = read_cntvct() - t0;
    }
    (void)sink;
    std::sort(ts.begin(), ts.end());
    printf("%s,%s,%d,%d,%.2f\n", impl, mode, samples, batch,
           (double)ts[samples / 2] / batch);
    return 0;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <impl> <latency|throughput> "
                        "<samples> <batch> | verify [cases]\n", argv[0]);
        return 2;
    }
    if (!strcmp(argv[1], "verify"))
    {
        int rc = 0;
        for (size_t i = 0; i < sizeof(IMPLS) / sizeof(IMPLS[0]); i++)
            rc |= verify(IMPLS[i], argc > 2 ? atoi(argv[2]) : 20000);
        return rc;
    }
    return bench(argv[1], argv[2], atoi(argv[3]), atoi(argv[4]));
}
