#!/usr/bin/env bash
# Build an SVE2 binary on the N1 and run it under qemu-aarch64 with
# sve-max-vq=4 (VL=256) to validate the SVE functional path.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
g++ -O2 -march=armv8-a+sve2 \
  "$ROOT/kernels/sa8d/sve_smoke.cpp" -o /tmp/sve_smoke
qemu-aarch64 -cpu max,sve-max-vq=4 /tmp/sve_smoke
echo "[qemu-sve-smoke] OK (SVE2, VL=256 max)"
