#!/usr/bin/env bash
# Environment doctor for the benchmark host.
# Usage: scripts/doctor.sh [--json|--short]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

MODE="${1:-text}"

json_escape() {
  printf '%s' "$1" | jq -Rsa .
}

check_tool() {
  local tool="$1"
  if command -v "$tool" >/dev/null 2>&1; then
    echo "OK: $tool -> $(command -v "$tool")"
  else
    echo "MISSING: $tool"
  fi
}

emit_text() {
  echo "== host =="
  uname -a
  grep -E "^(NAME|VERSION_ID)=" /etc/os-release || true
  echo "== cpu =="
  lscpu | grep -E "^(Architecture|CPU\(s\)|Model name|Flags|CPU op-mode)" || true
  grep -m1 -o "Features.*" /proc/cpuinfo || true
  echo "== perf =="
  echo "perf_event_paranoid=$(cat /proc/sys/kernel/perf_event_paranoid 2>/dev/null || echo n/a)"
  echo "== tools =="
  for t in git cmake ninja clang clang++ llvm-mc llvm-objdump llvm-mca qemu-aarch64 z3 jq rg perf python3; do
    check_tool "$t"
  done
  echo "== versions =="
  cmake --version | head -1 || true
  ninja --version || true
  clang --version | head -1 || true
  llvm-mc --version | head -1 || true
  qemu-aarch64 --version | head -1 || true
  z3 --version || true
  python3 --version || true
  gcc --version | head -1 || true
}

emit_json() {
  jq -n \
    --arg uname "$(uname -a)" \
    --arg os "$(grep -E '^(NAME|VERSION_ID)=' /etc/os-release | tr '\n' ' ')" \
    --arg cpu "$(lscpu | grep -E 'Model name' | sed 's/^[^:]*:[[:space:]]*//')" \
    --arg features "$(grep -m1 -o 'Features.*' /proc/cpuinfo)" \
    --arg paranoid "$(cat /proc/sys/kernel/perf_event_paranoid 2>/dev/null || echo n/a)" \
    --arg git "$(git --version 2>/dev/null || echo missing)" \
    --arg cmake "$(cmake --version 2>/dev/null | head -1 || echo missing)" \
    --arg ninja "$(ninja --version 2>/dev/null || echo missing)" \
    --arg clang "$(clang --version 2>/dev/null | head -1 || echo missing)" \
    --arg llvm "$(llvm-mc --version 2>/dev/null | head -1 || echo missing)" \
    --arg qemu "$(qemu-aarch64 --version 2>/dev/null | head -1 || echo missing)" \
    --arg z3 "$(z3 --version 2>/dev/null || echo missing)" \
    --arg python "$(python3 --version 2>/dev/null || echo missing)" \
    --arg gcc "$(gcc --version 2>/dev/null | head -1 || echo missing)" \
    '{uname:$uname, os:$os, cpu:$cpu, features:$features, perf_event_paranoid:$paranoid,
      tools:{git:$git, cmake:$cmake, ninja:$ninja, clang:$clang, llvm:$llvm, qemu_aarch64:$qemu, z3:$z3, python:$python, gcc:$gcc}}'
}

case "$MODE" in
  --json) emit_json ;;
  --short) emit_text | grep -E "^(OK|MISSING)" || true ;;
  *) emit_text ;;
esac
