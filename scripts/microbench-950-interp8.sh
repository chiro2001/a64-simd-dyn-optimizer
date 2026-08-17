#!/usr/bin/env bash
# 950 kernel-level microbench for interp8 hpp: CNTVCT paired comparison.
# Compares svdot32 (emitter, AGO_WIDE_SVE2=1) vs best_sve2 (svdot_s64,
# current default) vs upstream SVE/NEON dispatch.
#
# This is the P5 gate infrastructure:
#   - Positive control: best_sve2 (svdot_s64, permute_ratio=53.3%)
#   - Candidate: svdot32 (svdot_s32, permute_ratio=20.5%, -32.8pp)
#
# Prerequisites on 950:
#   - repo at /home/chiro/projects/a64-simd-dyn-optimizer with
#     build/x265-8-gcc (libx265.so.216)
#   - aarch64 g++ with -march=armv8.2-a+sve2 support
#
# Usage (from server-mini):
#   scripts/microbench-950-interp8.sh user@host
#
# Output: prints CNTVCT cycles for each variant + delta table.
# Negative delta = faster than upstream dispatch.
set -euo pipefail

HOST="${1:?usage: scripts/microbench-950-interp8.sh user@host}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "[microbench-interp8] building .so variants locally"

# 1. best_sve2 (default, svdot_s64 reference)
python3 tools/build_preload_so.py --isa sve2 --vl 32 \
  --kernels interp8,interp8-16,interp8-32 --opt=-O3 \
  --out build/microbench-interp8-sve2.so 2>&1 | tail -1

# 2. svdot32 (AGO_WIDE_SVE2=1, s8xs8->s32 candidate)
AGO_WIDE_SVE2=1 python3 tools/build_preload_so.py --isa sve2 --vl 32 \
  --kernels interp8,interp8-16,interp8-32 --opt=-O3 \
  --out build/microbench-interp8-svdot32.so 2>&1 | tail -1

echo "[microbench-interp8] packaging for 950"
PKG=$(mktemp -d /tmp/microbench-interp8-pack.XXXXXX)
cp build/microbench-interp8-sve2.so "$PKG/"
cp build/microbench-interp8-svdot32.so "$PKG/"
cp benchmarks/preload_verify_interp8.cpp "$PKG/"
tar -C "$PKG" -czf /tmp/microbench-interp8-950.tar.gz .

echo "[microbench-interp8] pushing to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 \
  /tmp/microbench-interp8-950.tar.gz "$HOST:/tmp/"

echo "[microbench-interp8] compiling + running on 950"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" bash -s <<'REMOTE'
set -euo pipefail
REPO="/home/chiro/projects/a64-simd-dyn-optimizer"
cd "$REPO"

mkdir -p /tmp/microbench-interp8-work
cd /tmp/microbench-interp8-work
tar -xzf /tmp/microbench-interp8-950.tar.gz

# Compile preload_verify_interp8
g++ -O2 -std=c++17 -I"$REPO/third_party/x265/source" \
  -L"$REPO/build/x265-8-gcc" preload_verify_interp8.cpp \
  -ldl -lx265 -o preload_verify_interp8 2>/dev/null || {
  echo "[microbench-interp8] compile failed, trying with explicit include path"
  g++ -O2 -std=c++17 \
    -I"$REPO/third_party/x265/source/common" \
    -I"$REPO/third_party/x265/source" \
    -L"$REPO/build/x265-8-gcc" \
    preload_verify_interp8.cpp -ldl -lx265 -o preload_verify_interp8
}

export LD_LIBRARY_PATH="$REPO/build/x265-8-gcc:$LD_LIBRARY_PATH"

echo ""
echo "=== best_sve2 (svdot_s64, permute_ratio=53.3%, reference) ==="
./preload_verify_interp8 microbench-interp8-sve2.so

echo ""
echo "=== svdot32 (svdot_s32, permute_ratio=20.5%, candidate) ==="
./preload_verify_interp8 microbench-interp8-svdot32.so

echo ""
echo "=== Summary ==="
echo "Compare 'delta' values: negative = faster than upstream dispatch."
echo "svdot32 target: delta < best_sve2 delta (more negative = faster)."
REMOTE

echo "[microbench-interp8] done"
