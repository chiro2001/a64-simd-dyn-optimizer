// Direct dependency-chain latency probe for the DCT8 mnemonic family.
//
// Each function runs N iterations of a register-to-register dependency chain
// (`asm volatile`, result feeds the next op). A nop chain with the same
// loop shape is subtracted, so the output is latency per op in CNTVCT_EL0
// ticks. Pair functions execute two alternating ops per iteration (e.g.
// rshrn+sshll) and the printed value is divided by two.
//
// Usage: insn_latency [iterations=1024] [samples=41]
#include <cstdint>
#include <cstdio>
#include <cstdlib>

static inline uint64_t cntvct()
{
    uint64_t t;
    asm volatile("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static inline uint64_t cntfrq()
{
    uint64_t f;
    asm volatile("mrs %0, cntfrq_el0" : "=r"(f));
    return f;
}

static void chain_nop(uint64_t n)
{
    asm volatile(
        "1: nop\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc");
}

static void chain_mul(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: mul v0.4s, v0.4s, v1.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void chain_mla(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v2.4s, #2\n"
        "1: mla v0.4s, v0.4s, v2.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v2");
}

static void chain_addp(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: addp v0.4s, v0.4s, v1.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void chain_trn1(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: trn1 v0.4s, v0.4s, v1.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void chain_trn2(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: trn2 v0.4s, v0.4s, v1.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void chain_zip1(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: zip1 v0.4s, v0.4s, v1.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void chain_zip2(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: zip2 v0.4s, v0.4s, v1.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void chain_shl(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "1: shl v0.4s, v0.4s, #6\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0");
}

static void chain_rev64(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "1: rev64 v0.4s, v0.4s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0");
}

static void pair_rshrn(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "1: rshrn v0.4h, v0.4s, #9\n"
        "   sshll v0.4s, v0.4h, #0\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0");
}

static void pair_saddl(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: saddl v0.2d, v0.2s, v1.2s\n"
        "   shrn v0.2s, v0.2d, #1\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void pair_ssubl(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: ssubl v0.2d, v0.2s, v1.2s\n"
        "   shrn v0.2s, v0.2d, #1\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

static void pair_smull(uint64_t n)
{
    asm volatile(
        "movi v0.4s, #1\n"
        "movi v1.4s, #2\n"
        "1: smull v0.2d, v0.2s, v1.2s\n"
        "   shrn v0.2s, v0.2d, #1\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "v0", "v1");
}

// --- SVE2 latency chains (compiled with -march=armv8.2-a+sve2) ---

static void chain_sdot_d(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.d, #0\n"
        "mov z1.h, #1\n"
        "mov z2.h, #1\n"
        "1: sdot z0.d, z1.h, z2.h\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1", "z2");
}

static void chain_sdot_s(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.s, #0\n"
        "mov z1.b, #1\n"
        "mov z2.b, #1\n"
        "1: sdot z0.s, z1.b, z2.b\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1", "z2");
}

static void chain_uzp1_s(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.s, #1\n"
        "mov z1.s, #2\n"
        "1: uzp1 z0.s, z0.s, z1.s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1");
}

static void chain_tbl_s16(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.h, #1\n"
        "mov z1.h, #0\n"
        "1: tbl z0.h, z0.h, z1.h\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1");
}

static void chain_tbl2_s16(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.h, #1\n"
        "mov z1.h, #2\n"
        "mov z2.h, #0\n"
        "1: tbl z0.h, {z0.h - z1.h}, z2.h\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1", "z2");
}

static void pair_rshrnb_sunpklo(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.s, #100\n"
        "1: rshrnb z0.h, z0.s, #4\n"
        "   sunpklo z0.s, z0.h\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0");
}

static void chain_asr_s(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.s, #100\n"
        "1: asr z0.s, z0.s, #4\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0");
}

static void chain_orr_h(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.h, #1\n"
        "mov z1.h, #2\n"
        "1: orr z0.d, z0.d, z1.d\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1");
}

static void pair_movprfx_add(uint64_t n)
{
    asm volatile(
        "ptrue p0.b\n"
        "mov z0.s, #1\n"
        "mov z1.s, #2\n"
        "1: movprfx z0, z0\n"
        "   add z0.s, p0/m, z0.s, z1.s\n"
        "   subs %[n], %[n], #1\n"
        "   b.ne 1b\n"
        : [n] "+r"(n) : : "cc", "p0", "z0", "z1");
}

struct Op
{
    const char* name;
    void (*fn)(uint64_t);
    int divisor;   // 2 for two-op pairs
};

static const Op OPS[] =
{
    { "mul", chain_mul, 1 },
    { "mla", chain_mla, 1 },
    { "addp", chain_addp, 1 },
    { "trn1", chain_trn1, 1 },
    { "trn2", chain_trn2, 1 },
    { "zip1", chain_zip1, 1 },
    { "zip2", chain_zip2, 1 },
    { "shl", chain_shl, 1 },
    { "rev64", chain_rev64, 1 },
    { "rshrn", pair_rshrn, 2 },
    { "saddl", pair_saddl, 2 },
    { "ssubl", pair_ssubl, 2 },
    { "smull", pair_smull, 2 },
    { "sdot.d", chain_sdot_d, 1 },
    { "sdot.s", chain_sdot_s, 1 },
    { "uzp1.s", chain_uzp1_s, 1 },
    { "tbl.h", chain_tbl_s16, 1 },
    { "tbl2.h", chain_tbl2_s16, 1 },
    { "rshrnb", pair_rshrnb_sunpklo, 2 },
    { "asr.s", chain_asr_s, 1 },
    { "orr.h", chain_orr_h, 1 },
    { "movprfx+add", pair_movprfx_add, 2 },
};

static uint64_t median_ticks(void (*fn)(uint64_t), uint64_t iters, int samples)
{
    for (int i = 0; i < 16; i++)
        fn(iters);
    uint64_t vals[64];
    if (samples > 64)
        samples = 64;
    for (int i = 0; i < samples; i++)
    {
        const uint64_t t0 = cntvct();
        fn(iters);
        vals[i] = cntvct() - t0;
    }
    for (int i = 0; i < samples; i++)
        for (int j = i + 1; j < samples; j++)
            if (vals[j] < vals[i])
            {
                const uint64_t t = vals[i];
                vals[i] = vals[j];
                vals[j] = t;
            }
    return vals[samples / 2];
}

int main(int argc, char** argv)
{
    const uint64_t iters = argc > 1 ? strtoull(argv[1], nullptr, 0) : 1024;
    const int samples = argc > 2 ? atoi(argv[2]) : 41;
    const uint64_t nop = median_ticks(chain_nop, iters, samples);
    printf("cntfrq=%llu\n", (unsigned long long)cntfrq());
    printf("nop_total=%llu iters=%llu samples=%d\n",
           (unsigned long long)nop, (unsigned long long)iters, samples);
    for (const Op& op : OPS)
    {
        const uint64_t ticks = median_ticks(op.fn, iters, samples);
        const long long diff = (long long)ticks - (long long)nop;
        const double per = (double)diff / iters / op.divisor;
        const double ns = per / (double)cntfrq() * 1e9;
        printf("%-14s ticks=%.4f ns=%.1f\n", op.name, per, ns);
    }
    return 0;
}
