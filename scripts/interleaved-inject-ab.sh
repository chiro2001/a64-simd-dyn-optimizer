#!/usr/bin/env bash
# Interleaved inject A/B on a target host by swapping libx265.so.216.
#
# Two compile-in bundles (label A/B) are injected once each, their
# libx265.so.216 snapshots saved, then base/A/B runs are interleaved in
# random order per round (same method as the 950 E2E report). md5 gate
# (one encode per arm) + paired CI.
#
# Usage:
#   scripts/interleaved-inject-ab.sh <host> <labelA> <labelB> [pairs]
#
# Env: FRAMES (default 100), FREEZE_INPUT (default 100f yuv),
# REPO (default /home/chiro/...), AGO_INJECT_SCRIPT (default
# cloud-e2e-inject.sh). Bundles must exist locally at
# build/ablate-<label>-inject and build/ablate-<label>-work.
set -euo pipefail

HOST="${1:?usage: interleaved-inject-ab.sh host labelA labelB [pairs]}"
LABEL_A="${2:?}"
LABEL_B="${3:?}"
PAIRS="${4:-8}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

FRAMES="${FRAMES:-100}"
INPUT="${FREEZE_INPUT:-/tmp/real_1080p_100f_b.yuv}"
REPO="${REPO:-/home/chiro/projects/a64-simd-dyn-optimizer}"
INJECT_SCRIPT="${AGO_INJECT_SCRIPT:-cloud-e2e-inject.sh}"

package() { # package <label>
  local label="$1"
  local pkg="/tmp/e2e-${label}.tar.gz"
  local p=$(mktemp -d /tmp/e2e-pack.XXXXXX)
  mkdir -p "$p/out" "$p/work"
  cp "build/ablate-${label}-inject/"*.patch \
     "build/ablate-${label}-inject/"*.cpp \
     "build/ablate-${label}-inject/"*.o \
     "build/ablate-${label}-inject/objects.txt" "$p/out/"
  cp "build/ablate-${label}-work/"*.o "$p/work/"
  tar -C "$p" -czf "$pkg" out work
  echo "$pkg"
}

PKG_A=$(package "$LABEL_A")
PKG_B=$(package "$LABEL_B")
scp -o BatchMode=yes -o ServerAliveInterval=30 "$PKG_A" "$PKG_B" \
  scripts/strip-dynopt-link.py "scripts/$INJECT_SCRIPT" "$HOST":/tmp/

ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "set -e; cd $REPO/build/x265-8-gcc && \
   cp libx265.so.216 /tmp/lib-base.so.216; \
   for label in $LABEL_A $LABEL_B; do \
     cp /tmp/e2e-\$label.tar.gz /tmp/e2e-full.tar.gz; \
     bash /tmp/$INJECT_SCRIPT >/tmp/inject-\$label.log 2>&1; \
     cp libx265.so.216 /tmp/lib-\$label.so.216; \
     cd $REPO; \
     python3 /tmp/strip-dynopt-link.py; \
     (git -C $REPO/third_party/x265 checkout -- \
       source/common/primitives.cpp 2>/dev/null || true); \
     touch $REPO/third_party/x265/source/common/primitives.cpp; \
     ninja -C build/x265-8-gcc \
       common/CMakeFiles/common.dir/primitives.cpp.o libx265.so.216 \
       >/dev/null 2>&1; \
     cd $REPO/build/x265-8-gcc; \
   done; \
   echo INJECT_READY"

echo "[iab] md5 gate (one encode per arm)"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   for arm in base $LABEL_A $LABEL_B; do \
     cp /tmp/lib-\$arm.so.216 libx265.so.216; \
     $ENC -o /tmp/iab-\$arm.mp4 >/dev/null 2>&1 && \
       md5sum /tmp/iab-\$arm.mp4 | cut -d' ' -f1 || echo FAIL-\$arm; \
   done"

echo "[iab] $PAIRS interleaved rounds"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   for p in \$(seq 1 $PAIRS); do \
     for arm in \$(shuf -e base $LABEL_A $LABEL_B); do \
       cp /tmp/lib-\$arm.so.216 libx265.so.216; \
       s=\$(date +%s%N); $ENC -o /dev/null >/dev/null 2>&1; \
       e=\$(date +%s%N); echo \"\$arm,\$(( (e-s)/1000000 ))\"; \
     done; \
   done" > /tmp/iab-ms.txt

ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && cp /tmp/lib-base.so.216 libx265.so.216"

python3 - /tmp/iab-ms.txt "$LABEL_A" "$LABEL_B" <<'PY'
import csv, random, statistics, sys
rows = list(csv.reader(open(sys.argv[1])))
a, b = sys.argv[2], sys.argv[3]
by = {}
for arm, ms in rows:
    by.setdefault(arm, []).append(int(ms))
rounds = len(by["base"])
print("rounds:", rounds)
def ci(x, y, label):
    d = [x[i] - y[i] for i in range(rounds)]
    md = statistics.median(d)
    rng = random.Random(0xB057)
    bs = sorted(statistics.median([d[rng.randrange(rounds)] for _ in d])
                for _ in range(10000))
    print("%s: diff_med=%+.1f ms (%+.2f%%) CI=[%.1f, %.1f]"
          % (label, md, 100 * md / statistics.median(x), bs[250], bs[9750]))
base = by["base"]
ci(base, by[a], "%s vs base (pos=faster)" % a)
ci(base, by[b], "%s vs base (pos=faster)" % b)
ci(by[a], by[b], "%s vs %s (pos=%s faster)" % (b, a, b))
PY
echo "[iab] OK"
