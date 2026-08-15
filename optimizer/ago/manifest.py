"""Immutable candidate manifest for AGO M2-expanded (round-0024).

Every candidate gets a frozen manifest before timing: contract hash,
region/node IDs, cover template + parameters, target ISA,
compiler/version/flags, source hash, final-object hash, and verification
evidence. Candidates that compile to the same final object are
deduplicated, never counted as search diversity.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Dict, Optional


def sha256_file(path: str) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


@dataclass(frozen=True)
class CandidateManifest:
    kernel: str
    cover: str
    contract_hash: str
    region: str               # e.g. "satd8/tail" or "sa8d8/hadamard_h"
    template_params: Dict = field(default_factory=dict)
    isa: str = "neon"
    compiler: str = ""
    compiler_version: str = ""
    cflags: str = ""
    source_hash: str = ""
    object_hash: str = ""
    verify: str = ""          # evidence: "20k bad=0" etc.
    target: str = "n1"        # n1 | 920b

    def to_json(self) -> str:
        return json.dumps(asdict(self), indent=2, sort_keys=True) + "\n"

    @classmethod
    def from_json(cls, text: str) -> "CandidateManifest":
        return cls(**json.loads(text))


def load_manifests(path: str) -> Dict[str, CandidateManifest]:
    out: Dict[str, CandidateManifest] = {}
    p = Path(path)
    for f in sorted(p.glob("*.json")):
        m = CandidateManifest.from_json(f.read_text())
        out["%s/%s" % (m.kernel, m.cover)] = m
    return out


def write_manifest(path: str, m: CandidateManifest) -> None:
    Path(path).write_text(m.to_json())
