#!/usr/bin/env bash
# One freeze-and-replicate A/B cycle for a custom kernel subset
# (entropy/remain/scan ablation, expert-advice round-0025 P2).
#
# Usage:
#   KERNELS="k1,k2" scripts/freeze-ablate.sh <label> [user@host]
#
# Same md5 gate + 5+5 timing + paired CI as scripts/freeze-best9.sh.
set -euo pipefail

LABEL="${1:?usage: KERNELS=... scripts/freeze-ablate.sh <label> [host]}"
HOST="${2:-chiro@124.70.206.229}"
KERNELS="${KERNELS:?set KERNELS=comma,list}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

EXPECT_MD5="${FREEZE_MD5:-ee5db7384df974ba25e4f1df8178dcb6}"
INPUT="${FREEZE_INPUT:-/tmp/real_1080p_30f.yuv}"
FRAMES="${FREEZE_FRAMES:-30}"
REPO="${REPO:-/home/chiro/projects/a64-simd-dyn-optimizer}"
INJECT_SCRIPT="${AGO_INJECT_SCRIPT:-cloud-e2e-inject.sh}"

echo "[ablate:$LABEL] building inject bundle"
python3 tools/build_preload_so.py --isa "${AGO_ISA:-sve1}" \
  --vl "${AGO_VL:-16}" \
  --kernels "$KERNELS" \
  --opt=-O3 \
  ${AGO_SKIP_SATD_SMALL:+--skip-satd-small} \
  --inject-outdir "build/ablate-${LABEL}-inject" \
  --workdir "build/ablate-${LABEL}-work" \
  --json "build/ablate-${LABEL}-inject/report.json"

PKG=$(mktemp -d /tmp/e2e-pack.XXXXXX)
mkdir -p "$PKG/out" "$PKG/work"
cp "build/ablate-${LABEL}-inject/"*.patch \
   "build/ablate-${LABEL}-inject/"*.cpp \
   "build/ablate-${LABEL}-inject/"*.o \
   "build/ablate-${LABEL}-inject/objects.txt" "$PKG/out/"
cp "build/ablate-${LABEL}-work/"*.o "$PKG/work/"
tar -C "$PKG" -czf "/tmp/e2e-${LABEL}.tar.gz" out work

echo "[ablate:$LABEL] pushing bundle to $HOST"
scp -o BatchMode=yes -o ServerAliveInterval=30 "/tmp/e2e-${LABEL}.tar.gz" \
  scripts/strip-dynopt-link.py "scripts/$INJECT_SCRIPT" \
  "$HOST":/tmp/

ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

echo "[ablate:$LABEL] injecting"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && git -C third_party/x265 checkout -- \
   source/common/primitives.cpp 2>/dev/null; \
   bash "/tmp/$INJECT_SCRIPT" >/tmp/ablate-${LABEL}-inject.log 2>&1"

echo "[ablate:$LABEL] optimized encode (md5)"
OPT_MD5=$(ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && $ENC -o /tmp/ablate-${LABEL}-opt.mp4 \
   >/dev/null 2>&1; md5sum /tmp/ablate-${LABEL}-opt.mp4 | cut -d' ' -f1")

echo "[ablate:$LABEL] 5 optimized timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > "/tmp/ablate-${LABEL}-opt-ms.txt"

echo "[ablate:$LABEL] restoring clean baseline"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && python3 /tmp/strip-dynopt-link.py && \
   git -C third_party/x265 checkout -- source/common/primitives.cpp && \
   touch third_party/x265/source/common/primitives.cpp && \
   ninja -C build/x265-8-gcc \
     common/CMakeFiles/common.dir/primitives.cpp.o libx265.so.216 \
     >/dev/null 2>&1"

echo "[ablate:$LABEL] baseline encode (md5) + 5 timing runs"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   $ENC -o /tmp/ablate-${LABEL}-base.mp4 >/dev/null 2>&1; \
   md5sum /tmp/ablate-${LABEL}-base.mp4 | cut -d' ' -f1; \
   for i in 1 2 3 4 5; do s=\$(date +%s%N); \
     $ENC -o /dev/null >/dev/null 2>&1; \
     e=\$(date +%s%N); echo \$(( (e-s)/1000000 )); done" \
  > "/tmp/ablate-${LABEL}-base-all.txt"
tail -5 "/tmp/ablate-${LABEL}-base-all.txt" > "/tmp/ablate-${LABEL}-base-ms.txt"
BASE_MD5=$(head -1 "/tmp/ablate-${LABEL}-base-all.txt")

echo "optimized md5: $OPT_MD5 (expect $EXPECT_MD5)"
echo "baseline md5: $BASE_MD5 (expect $EXPECT_MD5)"
if [ "$EXPECT_MD5" = "auto" ]; then
  EXPECT_MD5="$BASE_MD5"
fi
if [ "$OPT_MD5" != "$BASE_MD5" ]; then
  echo "FAIL: optimized != baseline (bitstream mismatch)" >&2
  exit 1
fi
if [ "$EXPECT_MD5" != "auto" ] && [ "$BASE_MD5" != "$EXPECT_MD5" ]; then
  echo "WARN: baseline md5 differs from expectation $EXPECT_MD5 (same-machine gate already passed)" >&2
fi

echo "[ablate:$LABEL] paired CI"
python3 scripts/paired_ci.py "/tmp/ablate-${LABEL}-base-ms.txt" \
  "/tmp/ablate-${LABEL}-opt-ms.txt"
echo "[ablate:$LABEL] OK"
