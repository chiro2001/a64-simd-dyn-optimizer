#!/usr/bin/env bash
# Freeze-and-replicate best9-128 on the Yitian 710 SVE2-128 host.
#
# 19-kernel / 35-slot bundle: best9-950 filtered to VL=128 (interp8vpp
# 16/32 skipped as VL=256-only; satd-8 switched to pure-NEON). See
# reports/vl128-best9-950-correctness-20260816.txt.
#
# Usage:
#   scripts/freeze-best9-128.sh [user@host]
# Run from the repo root. Target needs a git-synced repo at
# /root/projects/a64-simd-dyn-optimizer with a clean SVE2 build/x265-8-gcc
# (shared lib), /tmp/real_1080p_30f.yuv, and /tmp/cloud-e2e-inject-710.sh.
set -euo pipefail

HOST="${1:-root@47.96.166.168}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

EXPECT_MD5="${FREEZE_MD5:-auto}"
INPUT="${FREEZE_INPUT:-/tmp/real_1080p_30f.yuv}"
FRAMES="${FREEZE_FRAMES:-30}"
REPO="/root/projects/a64-simd-dyn-optimizer"

echo "[freeze] packaging best9-128 inject bundle"
PKG=$(mktemp -d /tmp/e2e-pack.XXXXXX)
mkdir -p "$PKG/out" "$PKG/work"
cp build/dynopt-inject-best9-128/*.patch \
   build/dynopt-inject-best9-128/*.cpp \
   build/dynopt-inject-best9-128/*.o \
   build/dynopt-inject-best9-128/objects.txt "$PKG/out/"
cp build/preload-work-best9-128/*.o "$PKG/work/"
tar -C "$PKG" -czf /tmp/e2e-full.tar.gz out work

echo "[freeze] pushing bundle to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 /tmp/e2e-full.tar.gz \
  scripts/strip-dynopt-link.py scripts/cloud-e2e-inject-710.sh \
  "$HOST":/tmp/

echo "[freeze] preflight on $HOST"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "test -x $REPO/build/x265-8-gcc/x265 && \
   test -f $REPO/build/x265-8-gcc/build.ninja && \
   test -f $INPUT && echo PREFLIGHT_OK"

ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

echo "[freeze] injecting"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && bash /tmp/cloud-e2e-inject-710.sh >/tmp/freeze-inject.log 2>&1"

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
   cp /tmp/primitives.cpp.bak third_party/x265/source/common/primitives.cpp && \
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
# Gate: same-machine bit-exactness (both sides equal). Cross-machine
# hashes legitimately differ, so a non-auto EXPECT_MD5 only warns.
if [ "$EXPECT_MD5" = "auto" ]; then
  EXPECT_MD5="$BASE_MD5"
fi
if [ "$OPT_MD5" != "$BASE_MD5" ]; then
  echo "FAIL: optimized != baseline (bitstream mismatch)" >&2
  exit 1
fi
if [ "$EXPECT_MD5" != "auto" ] && [ "$BASE_MD5" != "$EXPECT_MD5" ]; then
  echo "WARN: baseline md5 differs from expectation $EXPECT_MD5 (cross-machine hash is not bit-exact; same-machine gate already passed)" >&2
fi
if [ "$OPT_MD5" != "$BASE_MD5" ]; then
  exit 1
fi

echo "[freeze] paired CI"
python3 scripts/paired_ci.py /tmp/freeze-base-ms.txt /tmp/freeze-opt-ms.txt
echo "[freeze] OK"
