#!/usr/bin/env python3
"""Print the critical-path latency estimate for a disassembly text file.

Usage:
  aarch64-linux-gnu-objdump -d f.o | python3 tools/critical_path.py -
  python3 tools/critical_path.py <disasm.txt> [<disasm2.txt> ...]
"""

import sys

from optimizer.analysis.critical_path import estimate_critical_path, \
    load_mnemonic_hist


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    chain = "--chain" in sys.argv
    paths = [p for p in sys.argv[1:] if p != "--chain"]
    for path in paths:
        text = sys.stdin.read() if path == "-" else open(path).read()
        cp, dist, lines, preds = estimate_critical_path(text)
        hist = load_mnemonic_hist(text)
        print("%-24s critical_path=%.1f instructions=%d"
              % (path, cp, sum(hist.values())))
        if chain:
            i = max(range(len(dist)), key=dist.__getitem__)
            path = []
            while True:
                path.append(lines[i].strip())
                if preds[i]:
                    i = max(preds[i], key=dist.__getitem__)
                else:
                    break
            for step in reversed(path[:24]):
                print("   ", step)
    return 0


if __name__ == "__main__":
    sys.exit(main())
