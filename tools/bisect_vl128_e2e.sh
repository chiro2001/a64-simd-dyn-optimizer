#!/usr/bin/env bash
# Bisect helper: inject a kernel subset into Yitian 710 and report whether
# the 30-frame encode stays bit-exact vs the known clean baseline md5.
#
# Usage: tools/bisect_vl128_e2e.sh 'kernel-a,kernel-b,...'
set -euo pipefail

K="$1"
BASE_MD5="${BASE_MD5:-2ce69750c8c2f29cfdfbd3c9ac208cf4}"
HOST=root@47.96.166.168
REPO=/root/projects/a64-simd-dyn-optimizer
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

TAG=$(date +%s)
OUT=build/dynopt-inject-bisect-$TAG
WORK=build/preload-work-best9-128
mkdir -p "$OUT"

echo "[bisect] building bundle: $K"
python3 tools/build_preload_so.py --isa sve2 --vl 128 \
  --kernels "$K" --opt=-O3 \
  --inject-outdir "$OUT" --workdir "$WORK" \
  --json "$OUT/report.json" >/dev/null

PKG=$(mktemp -d /tmp/e2e-pack.XXXXXX)
mkdir -p "$PKG/out" "$PKG/work"
cp "$OUT"/*.patch "$OUT"/*.cpp "$OUT"/*.o \
   "$OUT"/objects.txt "$PKG/out/"
for k in $(echo "$K" | tr ',' ' '); do
  cp "$WORK/$k.o" "$PKG/work/"
done
tar -C "$PKG" -czf /tmp/e2e-full.tar.gz out work

echo "[bisect] pushing and injecting"
scp -o BatchMode=yes -o ServerAliveInterval=30 /tmp/e2e-full.tar.gz \
  scripts/cloud-e2e-inject-710.sh \
  "$HOST":/tmp/
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && bash /tmp/cloud-e2e-inject-710.sh \
   >/tmp/bisect-inject.log 2>&1" || true
if ! ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "grep -q CLOUD_INJECT_OK /tmp/bisect-inject.log"; then
  echo "[bisect] INJECT FAILED:" >&2
  ssh -o BatchMode=yes "$HOST" "tail -8 /tmp/bisect-inject.log" >&2
  exit 1
fi
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "rm -f /tmp/bisect-$TAG.mp4 && cd $REPO/build/x265-8-gcc && \
   taskset -c 0 ./x265 --input /tmp/real_1080p_30f.yuv \
     --input-res 1920x1080 --fps 30 --frames 30 \
     --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 \
     --b-adapt 0 -o /tmp/bisect-$TAG.mp4 >/dev/null 2>&1 && \
   md5sum /tmp/bisect-$TAG.mp4 | cut -d' ' -f1" > /tmp/bisect-md5.txt
M=$(cat /tmp/bisect-md5.txt)
if [ -z "$M" ]; then
  echo "[bisect] encode produced no md5" >&2
  exit 1
fi

echo "[bisect] restoring clean baseline"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO && python3 /tmp/strip-dynopt-link.py >/dev/null && \
   cp /tmp/primitives.cpp.bak third_party/x265/source/common/primitives.cpp && \
   touch third_party/x265/source/common/primitives.cpp && \
   ninja -C build/x265-8-gcc \
     common/CMakeFiles/common.dir/primitives.cpp.o libx265.so.216 \
     >/dev/null 2>&1"

rm -rf "$OUT"
if [ "$M" = "$BASE_MD5" ]; then
  echo "PASS: $K"
else
  echo "FAIL: $K md5=$M"
fi
