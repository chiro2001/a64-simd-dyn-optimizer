#!/usr/bin/env bash
# Generate + compile the SVE2 SA8D candidates (single-tile, two-tile pack,
# raw half-R8 pack, and 16x16 two-wave wrapper) and verify all under QEMU
# with sve-max-vq=2/4, then report static instruction counts, guard-page
# result and build identity.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

PY="${PYTHON:-python3}"
mkdir -p "$ROOT/generated/sa8d" "$ROOT/build"
GEN1="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8.cpp"
GEN2="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp"
GEN3="$ROOT/generated/sa8d/sve_roundtrip_sa8d_8x8x2raw.cpp"
GEN4="$ROOT/generated/sa8d/sve_roundtrip_sa8d_16x16.cpp"

PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN1" --backend sve2
PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN2" --backend sve2 \
  --pack x2
PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN3" --backend sve2 \
  --pack x2 --raw
PYTHONPATH="$PWD" "$PY" kernels/sa8d/gen_roundtrip.py \
  experiments/m2-seed/imported/machine-ir.json "$GEN4" --backend sve2 \
  --pack x2 --raw --shape 16x16

g++ -O2 -DNDEBUG -std=c++11 -Wall -Wextra -march=armv8-a+sve2 \
  kernels/sa8d/sve_verify.cpp "$GEN1" "$GEN2" "$GEN3" "$GEN4" \
  -o build/sve_verify

g++ -O2 -DNDEBUG -std=c++11 -Wall -Wextra -march=armv8-a+sve2 \
  kernels/sa8d/sve_guard.cpp "$GEN3" "$GEN4" \
  -o build/sve_guard

echo "[sve-sa8d] static instruction counts (single / x2 / x2raw / 16x16)"
g++ -O2 -DNDEBUG -march=armv8-a+sve2 -c "$GEN1" -o build/sve1.o
g++ -O2 -DNDEBUG -march=armv8-a+sve2 -c "$GEN2" -o build/sve2.o
g++ -O2 -DNDEBUG -march=armv8-a+sve2 -c "$GEN3" -o build/sve3.o
g++ -O2 -DNDEBUG -march=armv8-a+sve2 -c "$GEN4" -o build/sve4.o
python3 tools/count_asm_insns.py build/sve1.o > build/sve1-insns.txt
python3 tools/count_asm_insns.py build/sve2.o > build/sve2-insns.txt
python3 tools/count_asm_insns.py build/sve3.o > build/sve3-insns.txt
python3 tools/count_asm_insns.py build/sve4.o > build/sve4-insns.txt
echo "--- single-tile ---"; cat build/sve1-insns.txt
echo "--- two-tile pack ---"; cat build/sve2-insns.txt
echo "--- two-tile raw ---"; cat build/sve3-insns.txt
echo "--- 16x16 wrapper ---"; cat build/sve4-insns.txt

echo "[sve-sa8d] identity"
g++ --version | head -1
sha256sum build/sve1.o build/sve2.o build/sve3.o build/sve4.o \
  build/sve_verify build/sve_guard

echo "[sve-sa8d] running under qemu (sve-max-vq=4 = VL=512)"
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 20000
echo "[sve-sa8d] running under qemu (sve-max-vq=2 = VL=256)"
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_verify 20000
echo "[sve-sa8d] guard-page under qemu (VL=256)"
qemu-aarch64 -cpu max,sve-max-vq=2 build/sve_guard
