#!/usr/bin/env bash
# Generate + compile the SVE2 SA8D 8x8 candidates (single-tile and
# two-tile 16-lane pack) and verify both under QEMU with sve-max-vq=4
# (VL=256 max), then report static instruction counts.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

PY="${PYTHON:-python3}"
mkdir -p "$ROOT/generated/sa8d" "$ROOT/build"
GEN1="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8.cpp"
GEN2="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp"

PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN1" --backend sve2
PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN2" --backend sve2 \
  --pack x2

g++ -O2 -DNDEBUG -std=c++11 -Wall -Wextra -march=armv8-a+sve2 \
  kernels/sa8d/sve_verify.cpp "$GEN1" "$GEN2" \
  -o build/sve_verify

echo "[sve-sa8d] static instruction counts (single-tile vs 2-tile pack)"
g++ -O2 -DNDEBUG -march=armv8-a+sve2 -c "$GEN1" -o build/sve1.o
g++ -O2 -DNDEBUG -march=armv8-a+sve2 -c "$GEN2" -o build/sve2.o
python3 tools/count_asm_insns.py build/sve1.o > build/sve1-insns.txt
python3 tools/count_asm_insns.py build/sve2.o > build/sve2-insns.txt
echo "--- single-tile ---"; cat build/sve1-insns.txt
echo "--- two-tile pack ---"; cat build/sve2-insns.txt

echo "[sve-sa8d] running under qemu (sve-max-vq=4, VL<=256)"
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 20000
