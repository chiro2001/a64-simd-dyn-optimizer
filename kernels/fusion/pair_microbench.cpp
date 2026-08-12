// Instruction-pair fusion microbenchmark (P5', weak evidence only).
//
// For each structurally eligible pair from the m11-fusion inventory, two
// variants run an identical instruction mix in an unrolled throughput loop:
//   chained : the second instruction of each pair reuses the first's dest
//   control : identical mix, destination chaining broken
// If the target uarch fuses the pair, `chained` should retire fewer slots
// and show fewer ticks than `control`. This is weak evidence: retired
// instructions would still count two, and on hosts without a PMU only
// CNTVCT timing is available (QEMU does not model fusion).
//
// Usage: pair_microbench <pair> <iterations> [chained|control]
//        pair_microbench list
#include <arm_neon.h>

#include <cstdint>
#include <cstdlib>
#include <cstdio>
#include <cstring>

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

// NEON zip2 -> rev64 (permute+permute dest chain)
static void ne_ziprev(uint64_t iters, bool chained)
{
    for (uint64_t i = 0; i < iters; i++)
    {
        if (chained)
        {
            __asm__ __volatile__(
                "zip2 v0.2d, v1.2d, v2.2d\n\t"
                "rev64 v0.4s, v0.4s\n\t"
                "zip2 v4.2d, v5.2d, v6.2d\n\t"
                "rev64 v4.4s, v4.4s\n\t"
                "zip2 v8.2d, v9.2d, v10.2d\n\t"
                "rev64 v8.4s, v8.4s\n\t"
                "zip2 v12.2d, v13.2d, v14.2d\n\t"
                "rev64 v12.4s, v12.4s\n\t"
                :
                :
                : "v0", "v1", "v2", "v4", "v5", "v6", "v8", "v9",
                  "v10", "v12", "v13", "v14", "memory");
        }
        else
        {
            __asm__ __volatile__(
                "zip2 v0.2d, v1.2d, v2.2d\n\t"
                "rev64 v3.4s, v3.4s\n\t"
                "zip2 v4.2d, v5.2d, v6.2d\n\t"
                "rev64 v7.4s, v7.4s\n\t"
                "zip2 v8.2d, v9.2d, v10.2d\n\t"
                "rev64 v11.4s, v11.4s\n\t"
                "zip2 v12.2d, v13.2d, v14.2d\n\t"
                "rev64 v15.4s, v15.4s\n\t"
                :
                :
                : "v0", "v1", "v2", "v3", "v4", "v5", "v6", "v7",
                  "v8", "v9", "v10", "v11", "v12", "v13", "v14",
                  "v15", "memory");
        }
    }
}

// NEON mul -> addp (3 read ports after fusion, dest chained)
static void ne_muladdp(uint64_t iters, bool chained)
{
    for (uint64_t i = 0; i < iters; i++)
    {
        if (chained)
        {
            __asm__ __volatile__(
                "mul v0.4s, v1.4s, v2.4s\n\t"
                "addp v0.4s, v0.4s, v3.4s\n\t"
                "mul v4.4s, v5.4s, v6.4s\n\t"
                "addp v4.4s, v4.4s, v7.4s\n\t"
                "mul v8.4s, v9.4s, v10.4s\n\t"
                "addp v8.4s, v8.4s, v11.4s\n\t"
                "mul v12.4s, v13.4s, v14.4s\n\t"
                "addp v12.4s, v12.4s, v15.4s\n\t"
                :
                :
                : "v0", "v1", "v2", "v3", "v4", "v5", "v6", "v7",
                  "v8", "v9", "v10", "v11", "v12", "v13", "v14",
                  "v15", "memory");
        }
        else
        {
            __asm__ __volatile__(
                "mul v0.4s, v1.4s, v2.4s\n\t"
                "addp v16.4s, v16.4s, v3.4s\n\t"
                "mul v4.4s, v5.4s, v6.4s\n\t"
                "addp v17.4s, v17.4s, v7.4s\n\t"
                "mul v8.4s, v9.4s, v10.4s\n\t"
                "addp v18.4s, v18.4s, v11.4s\n\t"
                "mul v12.4s, v13.4s, v14.4s\n\t"
                "addp v19.4s, v19.4s, v15.4s\n\t"
                :
                :
                : "v0", "v1", "v2", "v3", "v4", "v5", "v6", "v7",
                  "v8", "v9", "v10", "v11", "v12", "v13", "v14",
                  "v15", "v16", "v17", "v18", "v19", "memory");
        }
    }
}

// SVE add -> add accumulation (m11-fusion sve-x2raw pair; SVE1/VL=256)
#ifdef __ARM_FEATURE_SVE
static void sve_addchain(uint64_t iters, bool chained)
{
    for (uint64_t i = 0; i < iters; i++)
    {
        if (chained)
        {
            __asm__ __volatile__(
                "add z0.h, z0.h, z1.h\n\t"
                "add z0.h, z0.h, z2.h\n\t"
                "add z4.h, z4.h, z5.h\n\t"
                "add z4.h, z4.h, z6.h\n\t"
                "add z8.h, z8.h, z9.h\n\t"
                "add z8.h, z8.h, z10.h\n\t"
                "add z12.h, z12.h, z13.h\n\t"
                "add z12.h, z12.h, z14.h\n\t"
                :
                :
                : "z0", "z1", "z2", "z4", "z5", "z6", "z8", "z9",
                  "z10", "z12", "z13", "z14", "memory");
        }
        else
        {
            __asm__ __volatile__(
                "add z0.h, z0.h, z1.h\n\t"
                "add z3.h, z3.h, z2.h\n\t"
                "add z4.h, z4.h, z5.h\n\t"
                "add z7.h, z7.h, z6.h\n\t"
                "add z8.h, z8.h, z9.h\n\t"
                "add z11.h, z11.h, z10.h\n\t"
                "add z12.h, z12.h, z13.h\n\t"
                "add z15.h, z15.h, z14.h\n\t"
                :
                :
                : "z0", "z1", "z2", "z3", "z4", "z5", "z6", "z7",
                  "z8", "z9", "z10", "z11", "z12", "z13", "z14",
                  "z15", "memory");
        }
    }
}
#endif

int main(int argc, char** argv)
{
    if (argc > 1 && strcmp(argv[1], "list") == 0)
    {
        printf("ziprev\nmuladdp\nsve_addchain\n");
        return 0;
    }
    if (argc < 4)
    {
        fprintf(stderr, "usage: %s <pair> <iters> [chained|control]\n",
                argv[0]);
        return 2;
    }
    const char* pair = argv[1];
    const uint64_t iters = strtoull(argv[2], nullptr, 10);
    const bool chained = strcmp(argv[3], "chained") == 0;

    const uint64_t t0 = read_cntvct();
    if (strcmp(pair, "ziprev") == 0)
        ne_ziprev(iters, chained);
    else if (strcmp(pair, "muladdp") == 0)
        ne_muladdp(iters, chained);
#ifdef __ARM_FEATURE_SVE
    else if (strcmp(pair, "sve_addchain") == 0)
        sve_addchain(iters, chained);
#endif
    else
    {
        fprintf(stderr, "unknown pair %s\n", pair);
        return 2;
    }
    const uint64_t ticks = read_cntvct() - t0;
    printf("%s,%s,%llu,%llu\n", pair, chained ? "chained" : "control",
           (unsigned long long)iters, (unsigned long long)ticks);
    return 0;
}
