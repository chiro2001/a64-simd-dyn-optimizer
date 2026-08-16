#!/usr/bin/env bash
# N1 four-arm 100f interleaved A/B (expert-advice round-0025 P3):
# base / best9 / IR-DCT / best9+IR-DCT, same-machine bit-exact gate,
# random-order rounds, per-round paired timing.
#
# Usage: scripts/freeze-four-arm-n1.sh [user@host] [rounds]
set -euo pipefail

HOST="${1:-chiro@129.146.162.16}"
ROUNDS="${2:-5}"
TAG="${TAG:-run$$}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

INPUT="${FREEZE_INPUT:-/tmp/real_1080p_30f.yuv}"
FRAMES="${FREEZE_FRAMES:-100}"
REPO="${REPO:-/home/chiro/projects/a64-simd-dyn-optimizer}"
ARMS="${ARMS:-base best9 ir-dct best9-ir-dct}"
ENC="taskset -c 0 ./x265 --input $INPUT \
  --input-res 1920x1080 --fps 30 --frames $FRAMES \
  --pools 0 --frame-threads 1 --no-wpp --lookahead-threads 0 --b-adapt 0"

so_for() {
  case "$1" in
    base) echo "" ;;
    best9) echo "${SO_BEST9:-build/n1-best9.so}" ;;
    ir-dct) echo "${SO_IR_DCT:-build/n1-ir-dct.so}" ;;
    best9-ir-dct) echo "${SO_BEST9_IR_DCT:-build/n1-best9-ir-dct.so}" ;;
    best9-ir-hpp) echo "${SO_BEST9_IR_HPP:-build/n1-best9-ir-dct.so}" ;;
    *) echo "" ;;
  esac
}

echo "[four-arm] uploading bundles"
for arm in $ARMS; do
  so=$(so_for "$arm")
  [ -n "$so" ] || continue
  scp -o BatchMode=yes -o ServerAliveInterval=30 "$so" \
    "$HOST:/tmp/n1-arm-${arm}.so"
done

if [ "${SKIP_MD5:-0}" != 1 ]; then
  echo "[four-arm] bit-exact gate (one encode per arm)"
  MD5S=""
  for arm in $ARMS; do
    pre=""
    so=$(so_for "$arm")
    [ -n "$so" ] && pre="LD_PRELOAD=/tmp/n1-arm-${arm}.so"
    md=$(ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
      "cd $REPO/build/x265-8-gcc && $pre $ENC -o /tmp/four-arm-${arm}.mp4 \
       >/dev/null 2>&1; md5sum /tmp/four-arm-${arm}.mp4 | cut -d' ' -f1")
    echo "  $arm md5=$md"
    MD5S="$MD5S $md"
  done
  base_md=$(printf '%s' "$MD5S" | awk '{$1=$1; print $1}')
  for md in $MD5S; do
    if [ "$md" != "$base_md" ]; then
      echo "FAIL: bit-exact mismatch (base=$base_md)" >&2
      exit 1
    fi
  done
  echo "[four-arm] all arms bit-exact: $base_md"
fi

echo "[four-arm] $ROUNDS interleaved rounds"
ssh -o BatchMode=yes -o ServerAliveInterval=30 "$HOST" \
  "cd $REPO/build/x265-8-gcc && \
   : > /tmp/n1-four-arm-ms-${TAG}.txt && \
   for r in \$(seq 1 $ROUNDS); do \
     for arm in \$(shuf -e $ARMS); do \
       pre=''; [ \"\$arm\" != base ] && pre=\"LD_PRELOAD=/tmp/n1-arm-\${arm}.so\"; \
       s=\$(date +%s%N); eval \$pre $ENC -o /dev/null >/dev/null 2>&1; \
       e=\$(date +%s%N); echo \"\$arm,\$(( (e-s)/1000000 ))\"; \
     done; \
   done | tee /tmp/n1-four-arm-ms-${TAG}.txt"

scp -o BatchMode=yes "$HOST:/tmp/n1-four-arm-ms-${TAG}.txt" \
  "/tmp/n1-four-arm-ms-${TAG}.txt"
python3 - "/tmp/n1-four-arm-ms-${TAG}.txt" "$ARMS" <<'PY'
import sys, csv, statistics
rows = list(csv.reader(open(sys.argv[1])))
arms = sys.argv[2].split()
by = {}
for arm, ms in rows:
    by.setdefault(arm, []).append(int(ms))
base = by["base"]
print("arm           median_ms   diff_vs_base   pct")
for arm in arms:
    v = by[arm]
    med = statistics.median(v)
    d = med - statistics.median(base)
    print(f"{arm:13s} {med:9.0f} {d:+10.1f} {d/statistics.median(base)*100:+7.2f}%")
print("rounds:", len(base))
PY
echo "[four-arm] OK"
