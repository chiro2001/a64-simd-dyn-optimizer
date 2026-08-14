#!/usr/bin/env bash
# Automated quick-test report for 950 (920G, SVE2) and 920B (SVE1).
# Usage: scripts/quick-test-real-machine.sh <950|920b> [report.txt]
#
# Produces a copy-paste-ready text report: machine info, lite gates, and
# paired CNTVCT benches for every candidate that can run on that machine
# (native or shape-substituted; substituted rows are marked "sub" and are
# cycle estimates only, docs/29).
set -uo pipefail

MACHINE="${1:?usage: quick-test-real-machine.sh <950|920b> [report]}"
REPORT="${2:-reports/quick-test-${MACHINE}-$(date +%Y%m%d-%H%M).txt}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
mkdir -p reports "$(dirname "$REPORT")"

if [ "$MACHINE" = 950 ]; then
    ISA="SVE2 2x256 / NEON 4x128 (no SVE2p1+)"
    TARGET=sve2
    ASMARCH="armv8.2-a+sve2"
    GATES="interp8 sa8d16 dct16 dct32 idct16 idct32"
elif [ "$MACHINE" = 920b ]; then
    ISA="SVE1 2x256 / NEON 4x128 (no SVE2, no PMU)"
    TARGET=sve1
    ASMARCH="armv8.2-a+sve"
    GATES="sa8d"
else
    echo "machine must be 950 or 920b" >&2
    exit 2
fi

# Native aarch64 prefers g++/as, but sve2p3 source generation needs a
# modern compiler (clang >= 19 or GCC >= 16). Probe the native compiler;
# if it cannot assemble `sdot z.h,z.b,z.b`, fall back to the cross
# toolchain (docs/32 §2 compiler requirements).
if [ "$(uname -m)" = aarch64 ]; then
    if printf 'sdot z0.h, z1.b, z2.b\n' | \
            g++ -march=armv9.5-a+sve2p3 -x assembler -c - -o /tmp/ccprobe.o \
            >/dev/null 2>&1; then
        export CXX="${CXX:-g++}"
    else
        say "  WARN: native g++ lacks SVE2p3; falling back to cross"
        say "  CXX=${CXX:-aarch64-linux-gnu-g++} (or build .S locally, docs/32 §2)"
        export CXX="${CXX:-aarch64-linux-gnu-g++}"
    fi
    export AS="${AS:-as}"
    NATIVE_CC=g++
    NATIVE_AS=as
else
    NATIVE_CC=aarch64-linux-gnu-g++
    NATIVE_AS=aarch64-linux-gnu-as
fi

say() { printf '%s\n' "$*" | tee -a "$REPORT"; }
run_cap() { # run_cap <outvar> <cmd...>
    local var="$1"; shift
    local out
    out="$("$@" 2>&1)" || true
    printf -v "$var" '%s' "$out"
}

: > "$REPORT"
say "=== $MACHINE quick test $(date '+%F %T') ==="
say "git: $(git log -1 --oneline 2>/dev/null || echo unknown)"
say "uname: $(uname -a)"
say "nproc: $(nproc)"
say "ISA: $ISA"
say ""

# ---- gates (native; SVE2-only gates SIGILL on 920B, recorded) ----
say "[gates]"
BUILD_DIR="build/x265-8-950"
[ "$MACHINE" = 920b ] && BUILD_DIR="build/x265-8-920b"
if [ -f "$BUILD_DIR/libx265.a" ]; then
    say "  x265 lib: $BUILD_DIR/libx265.a"
    # One lite build now auto-links every committed candidate (incl.
    # idct16/32, docs/32 §3), so build once and run all gates.
    CAND="kernels/interp8/candidates/best_sve2_sdoth.o"
    if [ ! -f "$CAND" ]; then
        CAND="kernels/dct16/candidates/best_sve2.o"
    fi
    out=$(scripts/build-testbench-lite.sh "$CAND" "$BUILD_DIR" \
              -- --gate interp8 --seed 1 2>&1) || true
    line=$(printf '%s\n' "$out" | grep -E 'PASS|FAIL' | tail -1)
    say "  lite build: ${line:-no gate line}"
    for g in $GATES; do
        out=$(build/testbench-lite/TestBenchLite --gate "$g" 1 2>&1) || true
        line=$(printf '%s\n' "$out" | grep -E 'PASS|FAIL|refusing' | tail -1)
        say "  $g: ${line:-no gate line}"
    done
else
    say "  x265 lib missing at $BUILD_DIR; gates SKIPPED (build first, docs/32 §2)"
fi
say ""

# ---- paired benches ----
say "[paired] (neon/cand median; substituted rows are estimates)"
say "kernel          fused  MCA  p50_neon p50_cand ratio"

bench_row() { # bench_row <label> <bin> <shape> <implA> <implB> <samples> <batch>
    local label="$1" bin="$2" shape="$3" ia="$4" ib="$5" smp="$6" bch="$7"
    if [ ! -x "$bin" ]; then
        say "  $label: SKIP (no $bin)"
        return
    fi
    local out
    out=$(scripts/bench-generic-paired.sh "$bin" "$shape" "$ia" "$ib" \
              "$smp" "$bch" "/tmp/qt-${label}.csv" 2>&1) || true
    local medA medB ratio
    medA=$(printf '%s\n' "$out" | grep -oP 'A\(=\S+\) median=\K[0-9.]+' | head -1)
    medB=$(printf '%s\n' "$out" | grep -oP 'B\(=\S+\) median=\K[0-9.]+' | head -1)
    ratio=$(printf '%s\n' "$out" | grep -oP 'median=\K[0-9.]+' | head -1)
    say "  $label ${medA:-?} ${medB:-?} ${ratio:-?}"
}

bench_row_noshape() { # for idct/dct32-style microbenches (no shape arg)
    local label="$1" bin="$2" ia="$3" ib="$4" smp="$5" bch="$6"
    if [ ! -x "$bin" ]; then
        say "  $label: SKIP (no $bin)"
        return
    fi
    local out
    out=$(scripts/bench-dct32-paired.sh "$bin" "$ia" "$ib" "$smp" 1 \
              "/tmp/qt-${label}" latency "$bch" 50 2>&1) || true
    local ratio
    ratio=$(printf '%s\n' "$out" | grep -oP 'median=\K[0-9.]+' | head -1)
    say "  $label ratio=${ratio:-?} (median, see /tmp/qt-${label}/paired-raw.csv)"
}

# idct16/idct32 substituted (both machines)
if scripts/build-substituted-microbench.sh idct16 "$TARGET" \
        build/qt_idct16 >/dev/null 2>&1; then
    bench_row_noshape idct16_sub build/qt_idct16 neon cand 20 8
else
    say "  idct16_sub: SKIP (build failed)"
fi
if scripts/build-substituted-microbench.sh idct32 "$TARGET" \
        build/qt_idct32 >/dev/null 2>&1; then
    bench_row_noshape idct32_sub build/qt_idct32 neon cand 20 8
else
    say "  idct32_sub: SKIP (build failed)"
fi

# interp8 path-B substituted (sve2 on 950 keeps addp; sve1 on 920B
# regenerates the uzp pair-sum source, docs/22 §5.7)
for shape in 8 16 32; do
    if scripts/build-interp8-substituted-microbench.sh "$shape" "$TARGET" \
            "build/qt_ipb${shape}" >/dev/null 2>&1; then
        bench_row "ipb${shape}_sub" "build/qt_ipb${shape}" \
            "${shape}x${shape}" neon cand 20 8
    else
        say "  ipb${shape}_sub: SKIP (build failed)"
    fi
done

# dct8 native (SVE1+NEON bridge; runs on both)
if "$NATIVE_CC" -O3 -static -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
        -DX265_DEPTH=8 -DX265_NS=x265 \
        -DDYNOPT_CANDIDATE=dynopt_dct8_neon_candidate \
        -I third_party/x265/source -I third_party/x265/source/common \
        -I "$BUILD_DIR" benchmarks/dct8_microbench.cpp \
        kernels/dct8/candidates/best_sve2.cpp \
        "$BUILD_DIR/libx265.a" -lpthread -ldl -o build/qt_dct8 \
        >/dev/null 2>&1; then
    say "  dct8 (native): run 'build/qt_dct8 neon|can latency 1 64 --noverify'"
else
    say "  dct8: SKIP (build failed; needs x265 lib)"
fi

if [ "$MACHINE" = 950 ]; then
    # sa8d16 native (SVE2)
    if "$NATIVE_CC" -O3 -static -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
            -DX265_DEPTH=8 -DX265_NS=x265 \
            -DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_sve2 \
            -DDYNOPT_CANDIDATE16=dynopt_sa8d_16x16_sve2 \
            -I third_party/x265/source -I third_party/x265/source/common \
            -I "$BUILD_DIR" benchmarks/sa8d_microbench.cpp \
            kernels/sa8d/candidates/best_sve2.o \
            kernels/sa8d16/candidates/best_sve2.o \
            "$BUILD_DIR/libx265.a" -lpthread -ldl -o build/qt_sa8d16 \
            >/dev/null 2>&1; then
        bench_row sa8d16 build/qt_sa8d16 16x16 neon cand 20 8
    else
        say "  sa8d16: SKIP (build failed)"
    fi
    # interp8 vpp16 native
    if "$NATIVE_CC" -O3 -static -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
            -DX265_DEPTH=8 -DX265_NS=x265 \
            -DDYNOPT_CANDIDATE=dynopt_interp8_8x8_sve2 \
            -DDYNOPT_CANDIDATE_VPP=dynopt_interp8_16x16_sve2_vpp \
            -I third_party/x265/source -I third_party/x265/source/common \
            -I "$BUILD_DIR" benchmarks/interp8_microbench.cpp \
            kernels/interp8/candidates/best_sve2.o \
            kernels/interp8vpp-16/candidates/best_sve2.o \
            "$BUILD_DIR/libx265.a" -lpthread -ldl -o build/qt_ivpp16 \
            >/dev/null 2>&1; then
        bench_row ivpp16 build/qt_ivpp16 16x16v neon vcand 20 8
    else
        say "  ivpp16: SKIP (build failed)"
    fi
fi

say ""
say "[done] copy this file back: $REPORT"
