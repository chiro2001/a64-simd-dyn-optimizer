#!/usr/bin/env bash
# AGO M2 SATD 8x8 correctness gate (round-0023): graph -> cover -> C
# source -> 20k differential vs the C SWAR reference (satd_8x4 x two
# bands), plus a Python-level C-vs-NEON identity precheck.
#
# Usage: scripts/verify-ago-satd8.sh [--cxx CXX] [--qemu QEMU]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${AGO_CXX:-aarch64-linux-gnu-g++}"
QEMU="${AGO_QEMU:-build/qemu-build/qemu-aarch64}"
WORK="$(mktemp -d /tmp/ago-satd8.XXXXXX)"
trap 'rm -rf "$WORK"' EXIT

python3 - "$WORK/cover.cpp" <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.frontend import SATD8_DSL, parse_dsl
from ago.cover_neon import build_c_source
open(sys.argv[1], "w").write(build_c_source(parse_dsl(SATD8_DSL)))
PY

# oracle (C SWAR reference satd_8x4 x two bands) + AGO cover differential
cat > "$WORK/verify.cpp" <<'EOF'
#include <cstdint>
#include <cstdio>
#include <random>
typedef uint16_t sum_t;
typedef uint32_t sum2_t;
#define BITS_PER_SUM (8 * sizeof(sum_t))
#define HADAMARD4(d0, d1, d2, d3, s0, s1, s2, s3) { \
        sum2_t t0 = s0 + s1; sum2_t t1 = s0 - s1; \
        sum2_t t2 = s2 + s3; sum2_t t3 = s2 - s3; \
        d0 = t0 + t2; d2 = t0 - t2; d1 = t1 + t3; d3 = t1 - t3; }
inline sum2_t abs2(sum2_t a) {
    sum2_t s = ((a >> (BITS_PER_SUM - 1)) & (((sum2_t)1 << BITS_PER_SUM) + 1)) * ((sum_t)-1);
    return (a + s) ^ s;
}
// x265 satd_8x4 (pixel.cpp): one 4-row band, two 4x4 blocks packed SWAR.
static int oracle_satd_8x4(const uint8_t* p1, intptr_t s1,
                           const uint8_t* p2, intptr_t s2)
{
    sum2_t tmp[4][4], a0, a1, a2, a3, sum = 0;
    for (int i = 0; i < 4; i++, p1 += s1, p2 += s2)
    {
        a0 = (p1[0] - p2[0]) + ((sum2_t)(p1[4] - p2[4]) << BITS_PER_SUM);
        a1 = (p1[1] - p2[1]) + ((sum2_t)(p1[5] - p2[5]) << BITS_PER_SUM);
        a2 = (p1[2] - p2[2]) + ((sum2_t)(p1[6] - p2[6]) << BITS_PER_SUM);
        a3 = (p1[3] - p2[3]) + ((sum2_t)(p1[7] - p2[7]) << BITS_PER_SUM);
        HADAMARD4(tmp[i][0], tmp[i][1], tmp[i][2], tmp[i][3],
                  a0, a1, a2, a3);
    }
    for (int i = 0; i < 4; i++)
    {
        HADAMARD4(a0, a1, a2, a3, tmp[0][i], tmp[1][i], tmp[2][i], tmp[3][i]);
        sum += abs2(a0) + abs2(a1) + abs2(a2) + abs2(a3);
    }
    return (((sum_t)sum) + (sum >> BITS_PER_SUM)) >> 1;
}
// x265 satd8<8,8>: two 4-row bands.
static int oracle_satd8(const uint8_t* p1, intptr_t s1,
                        const uint8_t* p2, intptr_t s2)
{
    return oracle_satd_8x4(p1, s1, p2, s2)
         + oracle_satd_8x4(p1 + 4 * s1, s1, p2 + 4 * s2, s2);
}
extern "C" int dynopt_ago_satd8(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
int main() {
    std::mt19937 rng(0x5A8Du);
    int bad = 0;
    for (int t = 0; t < 20000; t++) {
        uint8_t a[64], b[64];
        for (int i = 0; i < 64; i++) { a[i] = (uint8_t)rng(); b[i] = (uint8_t)rng(); }
        int want = oracle_satd8(a, 8, b, 8);
        int got = dynopt_ago_satd8(a, 8, b, 8);
        if (want != got) { if (bad < 5) printf("mismatch t=%d want=%d got=%d\n", t, want, got); bad++; }
    }
    printf("ago satd8 verify bad=%d\n", bad);
    return bad != 0;
}
EOF

"$CXX" -O2 -static -std=c++11 "$WORK/verify.cpp" "$WORK/cover.cpp" \
  -o "$WORK/verify" 2>&1 | head -5
"$QEMU" -L /usr/aarch64-linux-gnu "$WORK/verify"
