#!/usr/bin/env bash
# Freeze-and-replicate best8 on a target 920B/950 (round-0022 P0).
#
# The 20-slot batch: cost-c1c2-flag (r29), cost-coeff-nxn (NEON),
# cost-coeff-remain (DFA), sa8d16, satd-8, scan-pos-last (r30).
# Gate: bitstream md5 must equal the frozen baseline ee5db7...; timing
# uses 5 baseline + 5 optimized runs; CI via scripts/paired_ci.py.
#
# Usage:
#   scripts/freeze-best8.sh [user@host]
# Run from the repo root. Target needs ~/projects/a64-simd-dyn-optimizer
# with a CLEAN build/x265-8-gcc, /tmp/real_1080p_30f.yuv, and
# /tmp/cloud-e2e-inject.sh (scp from scripts/ if absent).
set -euo pipefail

HOST="${1:-chiro@124.70.206.229}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

EXPECT_MD5="${FREEZE_MD5:-ee5db7384df974ba25e4f1df8178dcb6}"
INPUT="${FREEZE_INPUT:-/tmp/real_1080p_30f.yuv}"
FRAMES="${FREEZE_FRAMES:-30}"
REPO="/home/chiro/projects/a64-simd-dyn-optimizer"

echo "[freeze] building best8 inject bundle"
python3 tools/build_preload_so.py --isa sve1 \
  --kernels cost-c1c2-flag,cost-coeff-nxn,cost-coeff-remain,sa8d16,satd-8,scan-pos-last,interp8-vps-8x8,interp8-vps-8x16,interp8-vps-16x16,interp8-vps-16x32,interp8-vps-32x16,interp8-vps-32x32 \
  --opt=-O3 \
  --inject-outdir build/dynopt-inject-best8-freeze \
  --workdir build/preload-work-best8-freeze \
  --json build/dynopt-inject-best8-freeze/report.json

PKG=$(mktemp -d /tmp/e2e-pack.XXXXXX)
mkdir -p "$PKG/out" "$PKG/work"
cp build/dynopt-inject-best8-freeze/*.patch \
   build/dynopt-inject-best8-freeze/*.cpp \
   build/dynopt-inject-best8-freeze/*.o \
   build/dynopt-inject-best8-freeze/objects.txt "$PKG/out/"
cp build/preload-work-best8-freeze/*.o "$PKG/work/"
tar -C "$PKG" -czf /tmp/e2e-full.tar.gz out work

echo "[freeze] pushing bundle to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 /tmp/e2e-full.tar.gz \
  scripts/strip-dynopt-link.py scripts/cloud-e2e-inject.sh \
  "$HOST":/tmp/

ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

echo "[freeze] injecting"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && git -C third_party/x265 checkout -- \
   source/common/primitives.cpp 2>/dev/null; \
   bash /tmp/cloud-e2e-inject.sh >/tmp/freeze-inject.log 2>&1"

echo "[freeze] optimized encode (md5)"
OPT_MD5=$(ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && $ENC -o /tmp/freeze-opt.mp4 \
   >/dev/null 2>&1; md5sum /tmp/freeze-opt.mp4 | cut -d' ' -f1")

echo "[freeze] 5 optimized timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > /tmp/freeze-opt-ms.txt

echo "[freeze] restoring clean baseline"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && python3 /tmp/strip-dynopt-link.py && \
   git -C third_party/x265 checkout -- source/common/primitives.cpp && \
   touch third_party/x265/source/common/primitives.cpp && \
   ninja -C build/x265-8-gcc \
     common/CMakeFiles/common.dir/primitives.cpp.o libx265.so.216 \
     >/dev/null 2>&1"

echo "[freeze] baseline encode (md5) + 5 timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   $ENC -o /tmp/freeze-base.mp4 >/dev/null 2>&1; \
   md5sum /tmp/freeze-base.mp4 | cut -d' ' -f1; \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > /tmp/freeze-base-all.txt
tail -5 /tmp/freeze-base-all.txt > /tmp/freeze-base-ms.txt
BASE_MD5=$(head -1 /tmp/freeze-base-all.txt)

echo "optimized md5: $OPT_MD5 (expect $EXPECT_MD5)"
echo "baseline md5: $BASE_MD5 (expect $EXPECT_MD5)"
if [ "$EXPECT_MD5" = "auto" ]; then
  EXPECT_MD5="$BASE_MD5"
fi
if [ "$OPT_MD5" != "$EXPECT_MD5" ] || [ "$BASE_MD5" != "$EXPECT_MD5" ]; then
  echo "FAIL: bitstream mismatch" >&2
  exit 1
fi

echo "[freeze] paired CI"
python3 scripts/paired_ci.py /tmp/freeze-base-ms.txt /tmp/freeze-opt-ms.txt
echo "[freeze] OK"
