#!/usr/bin/env bash
# 950 E2E one-shot A/B using the prebuilt 23-kernel SVE2 bundle
# (dct16=op895, dct32=opbase; docs/63). Run once per candidate variant
# to build the 5+5 paired CI table.
#
# Usage:
#   scripts/freeze-950-dct.sh [user@host]
#   AGO_IR_SVE16=1 scripts/freeze-950-dct.sh user@host  # dct16/32
#     use the 16-lane dual-group IR candidates (docs/72) instead of
#     op895/opbase; bundle/work dirs default to *-sve16-950.
#
# Target prerequisites (docs/63): repo at /home/chiro/... with clean
# build/x265-8-gcc (SVE2, I8MM=ON), /tmp/real_1080p_30f.yuv, and
# /tmp/cloud-e2e-inject.sh (scp from scripts/ if absent).
# Optional gate: GATE=1 runs native TestBenchLite for dct16/dct32 on
# the target (needs build/x265-8-testbench/libx265.a there).
set -euo pipefail

HOST="${1:?usage: scripts/freeze-950-dct.sh user@host}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

BUNDLE_DIR="${BUNDLE_DIR:-build/dynopt-best9-950-new}"
WORK_DIR="${WORK_DIR:-build/preload-work-best9-950-new}"
if [ "${AGO_IR_SVE16:-0}" = "1" ]; then
    BUNDLE_DIR="${BUNDLE_DIR:-build/dynopt-sve16-950}"
    WORK_DIR="${WORK_DIR:-build/preload-work-sve16-950}"
fi
INPUT="${FREEZE_INPUT:-/tmp/real_1080p_30f.yuv}"
FRAMES="${FREEZE_FRAMES:-30}"
REPO="/home/chiro/projects/a64-simd-dyn-optimizer"

if [ ! -d "$BUNDLE_DIR" ]; then
  echo "[950] bundle missing; building 23-kernel SVE2 bundle"
  python3 tools/build_preload_so.py --isa sve2 --vl 32 \
    --kernels cost-c1c2-flag,cost-coeff-nxn,cost-coeff-remain,sa8d16,\
satd-8,scan-pos-last,interp8-vps-8x8,interp8-vps-8x16,interp8-vps-16x16,\
interp8-vps-16x32,interp8-vps-32x16,interp8-vps-32x32,sao-stats-bo,\
sao-stats-e1,sao-stats-e2,sao-stats-e3,dct8,dct16,dct32,\
interp8vpp-16,interp8vpp-32,interp8-16,interp8-32 \
    --opt=-O3 --inject-outdir "$BUNDLE_DIR" --workdir "$WORK_DIR" \
    --json "$BUNDLE_DIR/report.json"
fi

PKG=$(mktemp -d /tmp/e2e-pack.XXXXXX)
mkdir -p "$PKG/out" "$PKG/work"
cp "$BUNDLE_DIR"/*.patch "$BUNDLE_DIR"/*.cpp \
   "$BUNDLE_DIR"/*.o "$BUNDLE_DIR"/objects.txt "$PKG/out/"
cp "$WORK_DIR"/*.o "$PKG/work/"
tar -C "$PKG" -czf /tmp/e2e-950-dct.tar.gz out work

echo "[950] pushing bundle to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 /tmp/e2e-950-dct.tar.gz \
  scripts/strip-dynopt-link.py scripts/cloud-e2e-inject.sh \
  "$HOST":/tmp/

if [ "${GATE:-0}" = 1 ]; then
  echo "[950] pushing dct candidates for native TestBenchLite"
  ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
    "mkdir -p /tmp/950-dct-work"
  scp -o BatchMode=yes "$WORK_DIR/dct16.o" "$WORK_DIR/dct32.o" \
    "$HOST:/tmp/950-dct-work/"
  ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
    "cd $REPO && \
     for g in dct16 dct32; do \
       echo \"[950] gate \$g\"; \
       RUN_MODE=native CXX=g++ scripts/build-testbench-lite.sh \
         /tmp/950-dct-work/\$g.o build/x265-8-testbench \
         --gate \$g --seed 1 2>&1 | grep -E 'PASS|FAIL' | tail -1 || \
         echo \"[950] gate \$g SKIP (missing testbench lib/build)\"; \
     done"
fi

ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

echo "[950] injecting"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && git -C third_party/x265 checkout -- \
   source/common/primitives.cpp 2>/dev/null; \
   bash /tmp/cloud-e2e-inject.sh >/tmp/950-inject.log 2>&1"

echo "[950] optimized encode (md5) + 5 timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   $ENC -o /tmp/950-opt.mp4 >/dev/null 2>&1; \
   md5sum /tmp/950-opt.mp4 | cut -d' ' -f1; \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > /tmp/950-opt-all.txt
OPT_MD5=$(head -1 /tmp/950-opt-all.txt)
tail -5 /tmp/950-opt-all.txt > /tmp/950-opt-ms.txt

echo "[950] restoring clean baseline"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && python3 /tmp/strip-dynopt-link.py && \
   git -C third_party/x265 checkout -- source/common/primitives.cpp && \
   touch third_party/x265/source/common/primitives.cpp && \
   ninja -C build/x265-8-gcc \
     common/CMakeFiles/common.dir/primitives.cpp.o libx265.so.216 \
     >/dev/null 2>&1"

echo "[950] baseline encode (md5) + 5 timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   $ENC -o /tmp/950-base.mp4 >/dev/null 2>&1; \
   md5sum /tmp/950-base.mp4 | cut -d' ' -f1; \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > /tmp/950-base-all.txt
BASE_MD5=$(head -1 /tmp/950-base-all.txt)
tail -5 /tmp/950-base-all.txt > /tmp/950-base-ms.txt

echo "optimized md5: $OPT_MD5"
echo "baseline md5: $BASE_MD5"
if [ "$OPT_MD5" != "$BASE_MD5" ]; then
  echo "FAIL: optimized != baseline (bitstream mismatch)" >&2
  exit 1
fi

echo "[950] paired CI"
python3 scripts/paired_ci.py /tmp/950-base-ms.txt /tmp/950-opt-ms.txt
echo "[950] OK"
