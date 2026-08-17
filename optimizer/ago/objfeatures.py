"""Final-object feature extraction for AGO M2-expanded (round-0024).

Features are extracted from the linked/compiled object disassembly:
instruction mix by class, total instructions, spill/reload heuristics,
external calls, and the object hash. The predictor consumes these
features; the ranking gate consumes measured cycles.

Extended (2026-08-18): bridges static_counts.py critical-path features
(permute_depth_ratio, critical_path_latency, critical_path_len,
permute_on_critical) into the AGO feature set, enabling permute-aware
ranking without requiring manually annotated cp_chains per cover.
"""

from __future__ import annotations

import os
import re
import subprocess
from collections import Counter
from typing import Dict, List

from ago.manifest import sha256_file

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))


_CLASSES = {
    "ld_vec": re.compile(r"\b(ld1|ldr|ldp)\b"),
    "st_vec": re.compile(r"\b(st1|str|stp)\b"),
    "add": re.compile(r"\b(add|addl|addv|uaddlv|saddlv|paddl|padal)\w*\b"),
    "sub": re.compile(r"\b(sub|subl|usubl|abd)\w*\b"),
    "abs": re.compile(r"\b(abs)\w*\b"),
    "max": re.compile(r"\b(max|smax|umax)\w*\b"),
    "trn": re.compile(r"\b(trn1|trn2|uzp1|uzp2|zip1|zip2)\w*\b"),
    "tbl": re.compile(r"\btbl\b"),
    "mul": re.compile(r"\b(mul|mla|sdot|udot)\w*\b"),
    "branch": re.compile(r"\b(bl|b\.)\b"),
}


def disassemble(object_path: str, arch: str = "aarch64") -> List[str]:
    # Try cross-objdump first (for cross-compiled objects), fall back
    # to system objdump (for native-compiled objects on aarch64 hosts).
    for cmd in (["aarch64-linux-gnu-objdump", "-d", object_path],
                ["objdump", "-d", object_path]):
        try:
            out = subprocess.run(cmd, capture_output=True, text=True,
                                 check=True).stdout
            lines = []
            in_text = False
            for ln in out.splitlines():
                if ln.strip().startswith("Disassembly"):
                    in_text = True
                    continue
                if in_text and re.match(r"^\s*[0-9a-f]+:\s", ln):
                    lines.append(ln)
            if lines:
                return lines
        except (subprocess.CalledProcessError, FileNotFoundError):
            continue
    return []


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
    # Bridge static_counts.py critical-path features (permute_depth_ratio
    # etc.) into AGO feature set. These are the rho=-1.000 predictors
    # from docs/79 P1, enabling permute-aware ranking without manually
    # annotated cp_chains per cover.
    try:
        _sys_path = os.path.join(_ROOT, "tools")
        if _sys_path not in os.sys.path:
            os.sys.path.insert(0, _sys_path)
        from static_counts import static_counts
        sc = static_counts(object_path)
        feats["permute_depth_ratio"] = sc.get("permute_depth_ratio")
        feats["critical_path_latency"] = sc.get("critical_path_latency")
        feats["critical_path_len"] = sc.get("critical_path_len")
        feats["permute_on_critical"] = sc.get("permute_on_critical")
        feats["vector_fused_uop"] = sc.get("vector_fused_uop")
    except Exception:
        # static_counts may not be available (missing cross-compiler,
        # non-aarch64 object, etc.) — skip without failing.
        pass
    if source_path:
        feats["source_sha256"] = sha256_file(source_path)
    return feats


def dedupe_key(feats: Dict) -> str:
    return feats["object_sha256"]
