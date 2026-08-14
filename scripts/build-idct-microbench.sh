#!/usr/bin/env bash
# Build the IDCT real-machine microbenchmark (950/960 验收准备).
#   scripts/build-idct-microbench.sh <idct16|idct32> [out]
#
# 本地交叉编译即可用 QEMU 验证；950/960 实机上用同一脚本（或手工
# 等价命令）原生编译后 paired。候选 = kernels/<idct>/candidates/
# best_sve2.o（SVE2p1，实机需 950 以上）。
set -euo pipefail
KERNEL="${1:?usage: build-idct-microbench.sh <idct16|idct32> [out]}"
OUT="${2:-build/${KERNEL}_microbench}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

case "$KERNEL" in
  idct16|idct32) ;;
  *) echo "kernel must be idct16 or idct32" >&2; exit 2 ;;
esac

CC="${CXX:-aarch64-linux-gnu-g++}"
$CC -O2 -static -std=c++11 -march=armv9.4-a+sve2p1 \
  "$ROOT/benchmarks/${KERNEL}_microbench.cpp" \
  "$ROOT/kernels/${KERNEL}/candidates/best_sve2.o" \
  -Wl,--start-group "$ROOT/build/x265-8-clang-sve/libx265.a" \
  -Wl,--end-group -lpthread -ldl \
  -o "$OUT"
echo "built $OUT"
