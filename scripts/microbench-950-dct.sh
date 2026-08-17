#!/usr/bin/env bash
# 950 kernel-level microbench: CNTVCT paired direct-call comparison.
# Compares neon_bridge (emitter output) vs op895 (hand-written) vs
# upstream SVE/NEON dispatch, using preload_verify_dct.cpp.
#
# This is the P0/P3 gate infrastructure for docs/78:
#   - P0: positive control (op895 should be ~1.45x faster than SVE)
#   - P3: promo gate (neon_bridge ratio CI lower >=1.10 vs SVE dispatch)
#
# Prerequisites on 950:
#   - repo at /home/chiro/projects/a64-simd-dyn-optimizer with
#     build/x265-8-gcc (libx265.so.216)
#   - aarch64 g++ with -march=armv8.2-a+sve2 support
#
# Usage (from server-mini):
#   scripts/microbench-950-dct.sh user@host
#
# Output: prints CNTVCT cycles for each variant + ratio table.
set -euo pipefail

HOST="${1:?usage: scripts/microbench-950-dct.sh user@host}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "[microbench] building .so variants locally"

# 1. op895 (default, hand-written reference)
python3 tools/build_preload_so.py --isa sve2 --vl 32 \
  --kernels dct16 --opt=-O3 \
  --out build/microbench-op895.so 2>&1 | tail -1

# 2. neon_bridge (emitter output, AGO_WIDE_SVE2=1)
AGO_WIDE_SVE2=1 python3 tools/build_preload_so.py --isa sve2 --vl 32 \
  --kernels dct16 --opt=-O3 \
  --out build/microbench-neon-bridge.so 2>&1 | tail -1

# 3. sve16 (dual-group 16-lane, negative control)
AGO_IR_SVE16=1 python3 tools/build_preload_so.py --isa sve2 --vl 32 \
  --kernels dct16 --opt=-O3 \
  --out build/microbench-sve16.so 2>&1 | tail -1

echo "[microbench] packaging for 950"
PKG=$(mktemp -d /tmp/microbench-pack.XXXXXX)
cp build/microbench-op895.so "$PKG/"
cp build/microbench-neon-bridge.so "$PKG/"
cp build/microbench-sve16.so "$PKG/"
cp benchmarks/preload_verify_dct.cpp "$PKG/"
tar -C "$PKG" -czf /tmp/microbench-950.tar.gz .

echo "[microbench] pushing to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 \
  /tmp/microbench-950.tar.gz "$HOST:/tmp/"

echo "[microbench] compiling + running on 950"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" bash -s <<'REMOTE'
set -euo pipefail
REPO="/home/chiro/projects/a64-simd-dyn-optimizer"
cd "$REPO"

mkdir -p /tmp/microbench-work
cd /tmp/microbench-work
tar -xzf /tmp/microbench-950.tar.gz

# Compile preload_verify_dct
g++ -O2 -std=c++17 -I"$REPO/third_party/x265/source" \
  -L"$REPO/build/x265-8-gcc" preload_verify_dct.cpp \
  -ldl -lx265 -o preload_verify_dct 2>/dev/null || {
  echo "[microbench] compile failed, trying with explicit include path"
  g++ -O2 -std=c++17 \
    -I"$REPO/third_party/x265/source/common" \
    -I"$REPO/third_party/x265/source" \
    -L"$REPO/build/x265-8-gcc" \
    preload_verify_dct.cpp -ldl -lx265 -o preload_verify_dct
}

export LD_LIBRARY_PATH="$REPO/build/x265-8-gcc:$LD_LIBRARY_PATH"

echo ""
echo "=== op895 (positive control, expect ~1.45x faster than SVE) ==="
./preload_verify_dct microbench-op895.so

echo ""
echo "=== neon_bridge (emitter output, permute_ratio=12.0%) ==="
./preload_verify_dct microbench-neon-bridge.so

echo ""
echo "=== sve16 (negative control, expect slower) ==="
./preload_verify_dct microbench-sve16.so

echo ""
echo "=== Summary ==="
echo "Compare 'delta' values: negative = faster than upstream dispatch."
echo "op895 should be ~-45% (faster). neon_bridge target: <= op895."
echo "sve16 should be positive (slower)."
REMOTE

echo "[microbench] done"
