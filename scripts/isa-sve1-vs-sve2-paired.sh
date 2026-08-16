#!/usr/bin/env bash
# SVE1 vs SVE2 instruction-set paired experiment on a VL=128 SVE2 host.
#
# Usage: scripts/isa-sve1-vs-sve2-paired.sh <host> [samples=20] [batch=4096]
# Host needs: repo checkout, build/x265-8-gcc/libx265.a, g++ with
# -march=armv8.5-a+sve2, taskset.
set -euo pipefail

HOST="${1:?usage: isa-sve1-vs-sve2-paired.sh <host> [samples] [batch]}"
SAMPLES="${2:-20}"
BATCH="${3:-4096}"

rsync -az --relative \
  experiments/isa-sve1-satd8-20260816/pack-2_compute-sve.cpp \
  experiments/isa-sve2-satd8-128/compute-sve_pack-2.cpp \
  benchmarks/pixelcmp_microbench.cpp \
  benchmarks/pixelcmp_stub_all3.cpp \
  "$HOST":projects/a64-simd-dyn-optimizer/ 2>/dev/null

timeout 600 ssh -o BatchMode=yes -o ConnectTimeout=10 "$HOST" \
  "cd ~/projects/a64-simd-dyn-optimizer && \
   g++ -O3 -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
     -march=armv8.2-a+sve \
     -I third_party/x265/source -I third_party/x265/source/common -I build/x265-8-gcc \
     benchmarks/pixelcmp_microbench.cpp \
     experiments/isa-sve1-satd8-20260816/pack-2_compute-sve.cpp \
     benchmarks/pixelcmp_stub_all3.cpp build/x265-8-gcc/libx265.a \
     -lpthread -ldl -lnuma -o /tmp/pc_sve1 && \
   g++ -O3 -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
     -march=armv8.5-a+sve2 \
     -I third_party/x265/source -I third_party/x265/source/common -I build/x265-8-gcc \
     benchmarks/pixelcmp_microbench.cpp \
     experiments/isa-sve2-satd8-128/compute-sve_pack-2.cpp \
     benchmarks/pixelcmp_stub_all3.cpp build/x265-8-gcc/libx265.a \
     -lpthread -ldl -lnuma -o /tmp/pc_sve2 && \
   echo '== NEON baseline ==' && \
   for i in 1 2 3; do taskset -c 0 /tmp/pc_sve1 satd8 neon $SAMPLES $BATCH; done && \
   echo '== SVE1 (CADD90 emulation) ==' && \
   for i in 1 2 3; do taskset -c 0 /tmp/pc_sve1 satd8 cand $SAMPLES $BATCH; done && \
   echo '== SVE2 (native cadd) ==' && \
   for i in 1 2 3; do taskset -c 0 /tmp/pc_sve2 satd8 cand $SAMPLES $BATCH; done" 2>&1 | tail -16
