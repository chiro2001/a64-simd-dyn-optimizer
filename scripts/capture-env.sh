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
  git --version
  cmake --version | head -1
  ninja --version
  gcc --version | head -1
  clang --version | head -1
  llvm-mc --version | head -1
  llvm-objdump --version | head -1
  llvm-mca --version | head -1
  qemu-aarch64 --version | head -1
  z3 --version
  jq --version
  rg --version | head -1
  perf --version
  python3 --version
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

scripts/doctor.sh --json > "$OUT/environment.json"
echo "[capture-env] wrote $OUT/environment.txt and $OUT/environment.json"
