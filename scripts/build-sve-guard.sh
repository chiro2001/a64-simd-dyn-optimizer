#!/usr/bin/env bash
# Build and run the SA8D guard-page tests for the current tool-generated
# 8x8/16x16 candidates (kernels/*/candidates/best_sve2.cpp) at fixed VL=256.
#
# Usage: scripts/build-sve-guard.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

CXX=/usr/bin/aarch64-linux-gnu-g++

"$CXX" -O2 -march=armv8.2-a+sve2 -c \
    kernels/sa8d/candidates/best_sve2.cpp -o /tmp/guard-sa8d.o
"$CXX" -O2 -march=armv8.2-a+sve2 -c \
    kernels/sa8d16/candidates/best_sve2.cpp -o /tmp/guard-sa8d16.o
"$CXX" -O2 -march=armv8.2-a+sve2 -o /tmp/sve_guard \
    kernels/sa8d/sve_guard.cpp /tmp/guard-sa8d.o /tmp/guard-sa8d16.o

echo "== VL=256 (must pass) =="
qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 /tmp/sve_guard
echo "== VL=512 (must reject with exit 3) =="
set +e
qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=4 /tmp/sve_guard
rc=$?
set -e
[ "$rc" -eq 3 ] || { echo "expected VL rejection exit 3, got $rc" >&2; exit 1; }
echo "guard audit OK"
