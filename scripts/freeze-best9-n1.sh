#!/usr/bin/env bash
# Freeze-and-replicate best9 on N1 (chiro@129.146.162.16), 30-frame
# 5+5 paired with same-machine bit-exact gate. Variant of
# freeze-best9.sh using the self-healing inject script and an
# overridable kernel list (for A/B regression bisection).
#
# Usage:
#   KERNELS="cost-c1c2-flag,cost-coeff-nxn,..." \
#     BUNDLE_DIR=build/dynopt-inject-best9-n1-a \
#     bash scripts/freeze-best9-n1.sh
set -euo pipefail

HOST="${1:-chiro@129.146.162.16}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

EXPECT_MD5="${FREEZE_MD5:-auto}"
INPUT="${FREEZE_INPUT:-/tmp/real_1080p_30f.yuv}"
FRAMES="${FREEZE_FRAMES:-30}"
REPO="/home/chiro/projects/a64-simd-dyn-optimizer"
KERNELS="${KERNELS:-cost-c1c2-flag,cost-coeff-nxn,cost-coeff-remain,sa8d16,satd-8,scan-pos-last,interp8-vps-8x8,interp8-vps-8x16,interp8-vps-16x16,interp8-vps-16x32,interp8-vps-32x16,interp8-vps-32x32,sao-stats-bo}"
BUNDLE_DIR="${BUNDLE_DIR:-build/dynopt-inject-best9-n1-freeze}"
WORK_DIR="${WORK_DIR:-build/preload-work-best9-n1-freeze}"

echo "[freeze-n1] building best9 inject bundle ($KERNELS)"
python3 tools/build_preload_so.py --isa sve1 \
  --kernels "$KERNELS" --opt=-O3 \
  --inject-outdir "$BUNDLE_DIR" --workdir "$WORK_DIR" \
  --json "$BUNDLE_DIR/report.json"

PKG=$(mktemp -d /tmp/e2e-pack.XXXXXX)
mkdir -p "$PKG/out" "$PKG/work"
cp "$BUNDLE_DIR"/*.patch "$BUNDLE_DIR"/*.cpp \
   "$BUNDLE_DIR"/*.o "$BUNDLE_DIR"/objects.txt "$PKG/out/"
cp "$WORK_DIR"/*.o "$PKG/work/"
tar -C "$PKG" -czf /tmp/e2e-full.tar.gz out work

echo "[freeze-n1] pushing bundle to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 /tmp/e2e-full.tar.gz \
  scripts/strip-dynopt-link.py scripts/cloud-e2e-inject-710.sh \
  "$HOST":/tmp/

ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

echo "[freeze-n1] injecting"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && AGO_REPO=$REPO bash /tmp/cloud-e2e-inject-710.sh \
   >/tmp/freeze-n1-inject.log 2>&1"

echo "[freeze-n1] optimized encode (md5) + 5 timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   $ENC -o /tmp/freeze-n1-opt.mp4 >/dev/null 2>&1; \
   md5sum /tmp/freeze-n1-opt.mp4 | cut -d' ' -f1; \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > /tmp/freeze-n1-opt-all.txt
OPT_MD5=$(head -1 /tmp/freeze-n1-opt-all.txt)
tail -5 /tmp/freeze-n1-opt-all.txt > /tmp/freeze-n1-opt-ms.txt

echo "[freeze-n1] restoring clean baseline"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && python3 /tmp/strip-dynopt-link.py >/dev/null && \
   cp /tmp/primitives.cpp.bak third_party/x265/source/common/primitives.cpp && \
   touch third_party/x265/source/common/primitives.cpp && \
   ninja -C build/x265-8-gcc \
     common/CMakeFiles/common.dir/primitives.cpp.o libx265.so.216 \
     >/dev/null 2>&1"

echo "[freeze-n1] baseline encode (md5) + 5 timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   $ENC -o /tmp/freeze-n1-base.mp4 >/dev/null 2>&1; \
   md5sum /tmp/freeze-n1-base.mp4 | cut -d' ' -f1; \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > /tmp/freeze-n1-base-all.txt
BASE_MD5=$(head -1 /tmp/freeze-n1-base-all.txt)
tail -5 /tmp/freeze-n1-base-all.txt > /tmp/freeze-n1-base-ms.txt

echo "optimized md5: $OPT_MD5 (expect $EXPECT_MD5)"
echo "baseline md5: $BASE_MD5 (expect $EXPECT_MD5)"
if [ "$OPT_MD5" != "$BASE_MD5" ]; then
  echo "FAIL: optimized != baseline (bitstream mismatch)" >&2
  exit 1
fi
if [ "$EXPECT_MD5" = "auto" ]; then
  EXPECT_MD5="$BASE_MD5"
fi
if [ "$EXPECT_MD5" != "auto" ] && [ "$BASE_MD5" != "$EXPECT_MD5" ]; then
  echo "WARN: baseline md5 differs from expectation $EXPECT_MD5" >&2
fi

echo "[freeze-n1] paired CI"
python3 scripts/paired_ci.py /tmp/freeze-n1-base-ms.txt /tmp/freeze-n1-opt-ms.txt
echo "[freeze-n1] OK"
