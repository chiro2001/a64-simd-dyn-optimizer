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
    printf("nop_total=%llu iters=%llu samples=%d\n",
           (unsigned long long)nop, (unsigned long long)iters, samples);
    for (const Op& op : OPS)
    {
        const uint64_t ticks = median_ticks(op.fn, iters, samples);
        const double per = (double)(ticks - nop) / iters / op.divisor;
        printf("%-7s ticks=%.2f\n", op.name, per);
    }
    return 0;
}
