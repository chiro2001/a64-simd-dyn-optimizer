#!/usr/bin/env bash
# Generate + compile the SVE2 SA8D 8x8 candidate and verify under QEMU
# with sve-max-vq=4 (VL=256 max).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

GEN="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8.cpp"
mkdir -p "$(dirname "$GEN")"
PYTHONPATH="$PWD" .venv/bin/python kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN" --backend sve2

g++ -O2 -DNDEBUG -std=c++11 -Wall -Wextra -march=armv8-a+sve2 \
  kernels/sa8d/sve_verify.cpp "$GEN" \
  -o build/sve_verify

echo "[sve-sa8d] running under qemu (sve-max-vq=4, VL<=256)"
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 20000
