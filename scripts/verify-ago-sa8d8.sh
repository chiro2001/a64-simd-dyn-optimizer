#!/usr/bin/env bash
# AGO M0 SA8D 8x8 correctness gate (round-0023): graph -> cover -> C
# source -> 20k differential vs the C reference oracle, plus a C-vs-NEON
# oracle consistency check.
#
# Usage: scripts/verify-ago-sa8d8.sh [--cover A|B|C] [--cxx CXX]
#                                    [--qemu QEMU]
#   --cover NAME  verify a specific cover from covers_sa8d8.py instead
#                 of the default cover_neon.py output
#   AGO_NATIVE=1  run the built binary directly (native aarch64)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${AGO_CXX:-aarch64-linux-gnu-g++}"
QEMU="${AGO_QEMU:-build/qemu-build/qemu-aarch64}"
LIB="${AGO_LIB:-build/x265-8-cross-make/libx265.a}"
COVER=""
if [ "${1:-}" = "--cover" ]; then
    COVER="$2"
    shift 2
fi
WORK="$(mktemp -d /tmp/ago-sa8d8.XXXXXX)"
trap 'rm -rf "$WORK"' EXIT

python3 - "$WORK/cover.cpp" "$COVER" <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.graphs.sa8d8_graph import build_sa8d8_graph
from ago.cover_neon import build_c_source
from ago.covers_sa8d8 import emit_cover
cover = sys.argv[2]
if cover:
    src = emit_cover(cover, "dynopt_ago_sa8d8")
else:
    src = build_c_source(build_sa8d8_graph())
open(sys.argv[1], "w").write(src)
PY

# oracle (C reference) + AGO cover differential
cat > "$WORK/verify.cpp" <<'EOF'
#include <cstdint>
#include <cstdio>
#include <cstring>
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
static int oracle_sa8d(const uint8_t* p1, intptr_t i1, const uint8_t* p2, intptr_t i2) {
    sum2_t tmp[8][4], a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, sum = 0;
    for (int i = 0; i < 8; i++, p1 += i1, p2 += i2) {
        a0 = p1[0]-p2[0]; a1 = p1[1]-p2[1]; b0 = (a0+a1)+((a0-a1)<<BITS_PER_SUM);
        a2 = p1[2]-p2[2]; a3 = p1[3]-p2[3]; b1 = (a2+a3)+((a2-a3)<<BITS_PER_SUM);
        a4 = p1[4]-p2[4]; a5 = p1[5]-p2[5]; b2 = (a4+a5)+((a4-a5)<<BITS_PER_SUM);
        a6 = p1[6]-p2[6]; a7 = p1[7]-p2[7]; b3 = (a6+a7)+((a6-a7)<<BITS_PER_SUM);
        HADAMARD4(tmp[i][0], tmp[i][1], tmp[i][2], tmp[i][3], b0, b1, b2, b3);
    }
    for (int i = 0; i < 4; i++) {
        HADAMARD4(a0, a1, a2, a3, tmp[0][i], tmp[1][i], tmp[2][i], tmp[3][i]);
        HADAMARD4(a4, a5, a6, a7, tmp[4][i], tmp[5][i], tmp[6][i], tmp[7][i]);
        b0 = abs2(a0+a4)+abs2(a0-a4)+abs2(a1+a5)+abs2(a1-a5)
           + abs2(a2+a6)+abs2(a2-a6)+abs2(a3+a7)+abs2(a3-a7);
        sum += (sum_t)b0 + (b0 >> BITS_PER_SUM);
    }
    return (int)((sum + 2) >> 2);
}
extern "C" int dynopt_ago_sa8d8(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
int main() {
    std::mt19937 rng(0x5A8Du);
    int bad = 0;
    for (int t = 0; t < 20000; t++) {
        uint8_t a[64], b[64];
        for (int i = 0; i < 64; i++) { a[i] = (uint8_t)rng(); b[i] = (uint8_t)rng(); }
        int want = oracle_sa8d(a, 8, b, 8);
        int got = dynopt_ago_sa8d8(a, 8, b, 8);
        if (want != got) { if (bad < 5) printf("mismatch t=%d want=%d got=%d\n", t, want, got); bad++; }
    }
    printf("ago sa8d8 verify bad=%d\n", bad);
    return bad != 0;
}
EOF

STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-${AGO_STATIC:-1}}" = "0" ]; then
    STATIC_FLAG=""
fi
"$CXX" -O2 $STATIC_FLAG -std=c++11 "$WORK/verify.cpp" "$WORK/cover.cpp" \
  -o "$WORK/verify" 2>&1 | head -5
if [ "${AGO_NATIVE:-0}" = "1" ]; then
    "$WORK/verify"
else
    "$QEMU" -L /usr/aarch64-linux-gnu "$WORK/verify"
fi
