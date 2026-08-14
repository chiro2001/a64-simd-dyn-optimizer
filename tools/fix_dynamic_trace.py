#!/usr/bin/env python3
"""Repair QEMU dynamic traces whose disassembler cannot decode SVE2p1.

QEMU 11.0.3 executes `sdot z.s, z.h, z.h` but its in_asm disassembler
prints the encoding as `.byte 0x..`, so the dynamic instruction stream
silently loses all sdot_z32 (SVE2p1) instructions (docs/27 §8.10). The
dynamic stream is the authoritative MCA input (real execution order); this
module re-disassembles the traced address range with objdump (which knows
sdot) and substitutes the missing mnemonics by address.

Addresses match because the trace driver is linked -no-pie -static: the
driver binary's own objdump output has the same addresses as the QEMU
trace.
"""

import re
import subprocess


def objdump_map(binary, start=None, end=None):
    """addr -> (mn, ops) from `objdump -d binary` (optionally range)."""
    out = subprocess.run(
        ["aarch64-linux-gnu-objdump", "-d", binary],
        capture_output=True, text=True, check=True).stdout
    table = {}
    for line in out.splitlines():
        m = re.match(r"\s+([0-9a-f]+):\s+[0-9a-f]+\s+([a-z0-9.]+)\s+(.*)",
                     line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        if start is not None and not (start <= addr < end):
            continue
        table[addr] = (m.group(2), m.group(3).split("//")[0].strip())
    return table


def fix_insns(insns, table):
    """Replace .byte (QEMU unknown) entries with objdump mnemonics."""
    out = []
    n_fixed = 0
    for i in insns:
        if i["mn"] == ".byte" and i["addr"] in table:
            mn, ops = table[i["addr"]]
            out.append({"addr": i["addr"], "mn": mn, "ops": ops})
            n_fixed += 1
        else:
            out.append(i)
    return out, n_fixed


def parse_exec_fixed(log, start, end, binary):
    """parse_exec + objdump repair for unknown (QEMU .byte) mnemonics."""
    from parse_qemu_trace import parse_exec
    insns = parse_exec(log, start, end)
    table = objdump_map(binary, start, end)
    return fix_insns(insns, table)


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 5:
        print("usage: fix_dynamic_trace.py <trace.log> <start_hex> "
              "<end_hex> <binary>", file=sys.stderr)
        sys.exit(2)
    insns, n = parse_exec_fixed(sys.argv[1], int(sys.argv[2], 16),
                                int(sys.argv[3], 16), sys.argv[4])
    print("parsed %d insns, repaired %d .byte entries" % (len(insns), n))
