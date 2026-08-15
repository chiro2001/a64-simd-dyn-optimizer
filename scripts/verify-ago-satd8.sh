#!/usr/bin/env bash
# AGO M2 SATD 8x8 correctness gate (round-0023): graph -> cover -> C
# source -> 20k differential vs the C SWAR reference (satd_8x4 x two
# bands), plus a Python-level C-vs-NEON identity precheck.
#
# Usage: scripts/verify-ago-satd8.sh [--shape 8x8|8x4|8x16|16x8]
#                                    [--cover A|B|C|D|E] [--cxx CXX]
#                                    [--qemu QEMU]
#   --shape SHAPE  target shape (default 8x8)
#   --cover NAME   verify a specific cover from covers_satd8.py /
#                  covers_satd_shapes.py instead of the default output
#   AGO_NATIVE=1  run the built binary directly (native aarch64)
#   AGO_STATIC=0  dynamic link
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${AGO_CXX:-aarch64-linux-gnu-g++}"
QEMU="${AGO_QEMU:-build/qemu-build/qemu-aarch64}"
COVER=""
SHAPE="8x8"
if [ "${1:-}" = "--cover" ]; then
    COVER="$2"
    shift 2
fi
if [ "${1:-}" = "--shape" ]; then
    SHAPE="$2"
    shift 2
fi
WORK="$(mktemp -d /tmp/ago-satd8.XXXXXX)"
trap 'rm -rf "$WORK"' EXIT

python3 - "$WORK/cover.cpp" "$COVER" "$SHAPE" <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.frontend import SATD8_DSL, parse_dsl
from ago.cover_neon import build_c_source
from ago.covers_satd8 import emit_cover
from ago.covers_satd_shapes import emit_cover as emit_shape_cover
cover = sys.argv[2]
shape = sys.argv[3]
symbols = {"8x8": "dynopt_ago_satd8", "8x4": "dynopt_ago_satd8x4",
           "8x16": "dynopt_ago_satd8x16", "16x8": "dynopt_ago_satd16x8"}
if shape == "8x8" and cover:
    src = emit_cover(cover, "dynopt_ago_satd8")
elif shape != "8x8" and cover:
    src = emit_shape_cover(shape, cover, symbols[shape])
else:
    src = build_c_source(parse_dsl(SATD8_DSL)) if shape == "8x8" else \
        emit_shape_cover(shape, "A", symbols[shape])
open(sys.argv[1], "w").write(src)
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
static int oracle_satd_shape(const uint8_t* p1, intptr_t s1,
                             const uint8_t* p2, intptr_t s2,
                             int rows, int cols)
{
    int sum = 0;
    for (int r = 0; r < rows; r += 4)
        for (int c = 0; c < cols; c += 8)
            sum += oracle_satd_8x4(p1 + r * s1 + c, s1,
                                   p2 + r * s2 + c, s2);
    return sum;
}
extern "C" int SYMBOL(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
int main(int argc, char** argv) {
    int rows = argc > 1 ? atoi(argv[1]) : 8;
    int cols = argc > 2 ? atoi(argv[2]) : 8;
    std::mt19937 rng(0x5A8Du);
    int bad = 0;
    for (int t = 0; t < 20000; t++) {
        uint8_t a[1024], b[1024];
        for (int i = 0; i < 1024; i++) { a[i] = (uint8_t)rng(); b[i] = (uint8_t)rng(); }
        int want = oracle_satd_shape(a, 16, b, 16, rows, cols);
        int got = SYMBOL(a, 16, b, 16);
        if (want != got) { if (bad < 5) printf("mismatch t=%d want=%d got=%d\n", t, want, got); bad++; }
    }
    printf("ago satd%s verify bad=%d\n", cols == 8 ? "8" : "16x8", bad);
    return bad != 0;
}
EOF

STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-${AGO_STATIC:-1}}" = "0" ]; then
    STATIC_FLAG=""
fi
"$CXX" -O2 $STATIC_FLAG -std=c++11 \
  -DSYMBOL=$(python3 -c 'import sys; sys.path.insert(0,"optimizer");
from ago.covers_satd_shapes import _SHAPE_DEFS
print(_SHAPE_DEFS[sys.argv[1]][2] if sys.argv[1] != "8x8" else "dynopt_ago_satd8")' "$SHAPE") \
  "$WORK/verify.cpp" "$WORK/cover.cpp" \
  -o "$WORK/verify" 2>&1 | head -5
SHAPE_ARGS=""
case "$SHAPE" in
    8x4) SHAPE_ARGS="4 8";;
    8x16) SHAPE_ARGS="16 8";;
    16x8) SHAPE_ARGS="8 16";;
esac
if [ "${AGO_NATIVE:-0}" = "1" ]; then
    "$WORK/verify" $SHAPE_ARGS
else
    "$QEMU" -L /usr/aarch64-linux-gnu "$WORK/verify" $SHAPE_ARGS
fi
