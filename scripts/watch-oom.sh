#!/usr/bin/env bash
# Background OOM / cgroup-kill watcher for the dev host.
#
# Records kernel OOM-killer events (and the killed process) with timestamps
# to build/oom-events.log (gitignored via /build/). Run as root so it can
# follow the kernel ring buffer:
#
#   sudo nohup scripts/watch-oom.sh >/dev/null 2>&1 &
#
# This is the "who blew up the box" companion to monitor-resources.sh.
set -u

LOG="${1:-$PWD/build/oom-events.log}"
mkdir -p "$(dirname "$LOG")"
echo "=== oom watcher start $(date '+%F %T') ===" >> "$LOG"

journalctl -k -f -o cat 2>/dev/null | while IFS= read -r line; do
    case "$line" in
        *oom-kill*|*"Killed process"*|*"Out of memory"*)
            echo "[$(date '+%F %T')] $line" >> "$LOG" ;;
    esac
done
