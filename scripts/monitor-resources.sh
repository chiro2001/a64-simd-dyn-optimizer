#!/usr/bin/env bash
# Background resource monitor for long searches / compiles / consultations.
#
# Usage:
#   scripts/monitor-resources.sh [interval_seconds] [log_path]
#
# Defaults: interval 10s, log build/resource-monitor.log. Safe to run
# alongside searches; each sample is one timestamped block appended to
# the log (start with `: > log` or use a fresh path to reset).
#
# Records: free -h (incl. swap), top-8 processes by RSS, and rows for
# search/compile/consultation-related processes (python search driver,
# codex, qemu-aarch64, aarch64-linux-gnu-g++).
set -u

INTERVAL="${1:-10}"
LOG="${2:-$PWD/build/resource-monitor.log}"
mkdir -p "$(dirname "$LOG")"

echo "=== monitor start $(date '+%F %T') interval=${INTERVAL}s ===" >> "$LOG"
while true; do
    {
        echo "=== $(date '+%F %T') ==="
        free -h
        echo "-- top RSS --"
        ps -eo pid,ppid,user,rss,%mem,%cpu,etime,comm --sort=-rss | head -8
        echo "-- targets --"
        ps -eo pid,rss,%mem,etime,cmd |
            rg "search_sve2_layouts|codex|qemu-aarch64|aarch64-linux-gnu-g\+\+" |
            head -20
    } >> "$LOG"
    sleep "$INTERVAL"
done
