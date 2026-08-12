#!/usr/bin/env bash
# Save a full environment snapshot into <dir>/environment.txt and <dir>/environment.json.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

OUT="${1:-experiments/m0-foundation}"
mkdir -p "$OUT"

{
  echo "=== uname -a ==="
  uname -a
  echo
  echo "=== /etc/os-release ==="
  cat /etc/os-release
  echo
  echo "=== lscpu ==="
  lscpu
  echo
  echo "=== /proc/cpuinfo features ==="
  grep -m1 -o "Features.*" /proc/cpuinfo
  echo
  echo "=== perf_event_paranoid ==="
  cat /proc/sys/kernel/perf_event_paranoid
  echo
  echo "=== tool versions ==="
  for t in git cmake ninja gcc clang llvm-mc llvm-objdump llvm-mca \
           qemu-aarch64 z3 jq rg perf python3 objdump; do
    if command -v "$t" >/dev/null 2>&1; then
      echo "$t: $($t --version 2>/dev/null | head -1)"
    else
      echo "$t: MISSING"
    fi
  done
  echo
  echo "=== SVE probe ==="
  grep -m1 -o "sve" /proc/cpuinfo || echo "sve: absent"
  echo
  echo "=== disk ==="
  df -h "$ROOT" | tail -1
  echo
  echo "=== git status ==="
  git -C "$ROOT" status --short 2>/dev/null || true
  git -C "$ROOT" rev-parse HEAD 2>/dev/null || true
  git -C "$ROOT/third_party/x265" rev-parse HEAD 2>/dev/null || true
} > "$OUT/environment.txt"

if command -v jq >/dev/null 2>&1; then
  scripts/doctor.sh --json > "$OUT/environment.json"
else
  echo '{"note":"doctor.sh skipped: jq not installed on this host"}' \
    > "$OUT/environment.json"
fi
echo "[capture-env] wrote $OUT/environment.txt and $OUT/environment.json"
