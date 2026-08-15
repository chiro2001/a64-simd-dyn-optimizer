"""Final-object feature extraction for AGO M2-expanded (round-0024).

Features are extracted from the linked/compiled object disassembly:
instruction mix by class, total instructions, spill/reload heuristics,
external calls, and the object hash. The predictor consumes these
features; the ranking gate consumes measured cycles.
"""

from __future__ import annotations

import re
import subprocess
from collections import Counter
from typing import Dict, List

from ago.manifest import sha256_file


_CLASSES = {
    "ld_vec": re.compile(r"\b(ld1|ldr|ldp)\b"),
    "st_vec": re.compile(r"\b(st1|str|stp)\b"),
    "add": re.compile(r"\b(add|addl|addv|uaddlv|saddlv|paddl|padal)\w*\b"),
    "sub": re.compile(r"\b(sub|subl|usubl|abd)\w*\b"),
    "abs": re.compile(r"\b(abs)\w*\b"),
    "max": re.compile(r"\b(max|smax|umax)\w*\b"),
    "trn": re.compile(r"\b(trn1|trn2|uzp1|uzp2|zip1|zip2)\w*\b"),
    "mul": re.compile(r"\b(mul|mla|sdot|udot)\w*\b"),
    "branch": re.compile(r"\b(bl|b\.)\b"),
}


def disassemble(object_path: str, arch: str = "aarch64") -> List[str]:
    cmd = ["aarch64-linux-gnu-objdump", "-d", object_path]
    try:
        out = subprocess.run(cmd, capture_output=True, text=True,
                             check=True).stdout
    except (subprocess.CalledProcessError, FileNotFoundError):
        out = subprocess.run(["objdump", "-d", object_path],
                             capture_output=True, text=True,
                             check=True).stdout
    lines = []
    in_text = False
    for ln in out.splitlines():
        if ln.strip().startswith("Disassembly"):
            in_text = True
            continue
        if in_text and re.match(r"^\s*[0-9a-f]+:\s", ln):
            lines.append(ln)
    return lines


def extract_features(object_path: str, source_path: str = "") -> Dict:
    lines = disassemble(object_path)
    total = 0
    classes: Counter = Counter()
    spills = 0
    calls = 0
    for ln in lines:
        total += 1
        for name, pat in _CLASSES.items():
            if pat.search(ln):
                classes[name] += 1
        # spill/reload heuristic: vector loads/stores with stack offset
        if re.search(r"\b(ldr|str)\b.*\[x\d+, #-", ln):
            spills += 1
        if re.search(r"\bbl\b", ln):
            calls += 1
    feats = {
        "object_sha256": sha256_file(object_path),
        "insn_total": total,
        "insn_by_class": {k: int(v) for k, v in sorted(classes.items())},
        "spill_reload_heuristic": spills,
        "external_calls": calls,
    }
    if source_path:
        feats["source_sha256"] = sha256_file(source_path)
    return feats


def dedupe_key(feats: Dict) -> str:
    return feats["object_sha256"]
