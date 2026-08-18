#!/usr/bin/env python3
"""Cover registry + preset protocol (docs/87 step 1, spec docs/88).

Cover ids: 0 = upstream dispatch (always); 1..N = covers in stable order.
The same ordinal space is used by the benchmark mode (AGO_BENCH=1) and by
the preset env var (AGO_PRESET=v1:<fp>:<kernel>=<ord>,...).

Preset grammar (v1):
    AGO_PRESET=v1:<m[0-9a-f]{8}>:<kernel>=<ord>,<kernel>=<ord>,...
Example:
    AGO_PRESET=v1:m1a2b3c4d:dct16=3,interp8=1,satd-8=0

This module is pure data/schema logic (no compilation, no QEMU), so the
whole preset lifecycle can be developed and tested on the external side.
"""

import hashlib
import importlib
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)
if os.path.join(ROOT, "tools") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "tools"))
if os.path.join(ROOT, "optimizer") not in sys.path:
    sys.path.insert(0, os.path.join(ROOT, "optimizer"))

PRESET_VERSION = "v1"
UPSTREAM_ID = 0  # id 0 is reserved for upstream dispatch (never injected)

# Serialize/parse the AGO_PRESET env var.
_KV_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9_-]*=[0-9]+$")
_FP_RE = re.compile(r"^m[0-9a-f]{8}$")


def fingerprint(machine, isa, vl, compiler, so_sha256, extra=""):
    """Deterministic 8-hex machine fingerprint used to guard a preset.

    Components that invalidate a preset if they change:
      machine name/class, ISA feature string, vector length, compiler
      id, and the injected .so content hash. `extra` may carry build
      flags; changing it also invalidates the preset (conservative).
    """
    canon = "|".join([
        str(machine), str(isa), str(vl), str(compiler),
        str(so_sha256), str(extra),
    ]).encode("utf-8")
    return "m" + hashlib.sha256(canon).hexdigest()[:8]


class Preset:
    """AGO_PRESET value: fingerprint + ordered per-kernel cover choices."""

    def __init__(self, fp, choices):
        self.fp = fp
        self.choices = dict(choices)  # kernel -> ordinal (int)

    @classmethod
    def parse(cls, text):
        if not text or not text.startswith(PRESET_VERSION + ":"):
            raise ValueError("AGO_PRESET must start with %s:" % PRESET_VERSION)
        rest = text[len(PRESET_VERSION) + 1:]
        fp, _, body = rest.partition(":")
        if not _FP_RE.match(fp):
            raise ValueError("bad fingerprint token: %r" % fp)
        choices = {}
        if body:
            for tok in body.split(","):
                if not _KV_RE.match(tok):
                    raise ValueError("bad preset token: %r" % tok)
                k, _, v = tok.rpartition("=")
                choices[k] = int(v)
        return cls(fp, choices)

    def serialize(self):
        body = ",".join("%s=%d" % (k, self.choices[k])
                        for k in sorted(self.choices))
        return "%s:%s:%s" % (PRESET_VERSION, self.fp, body)

    def validate(self, registry, expect_fp=None):
        """Whitelist/ordinal/fingerprint check.

        Returns (ok, warnings). Unknown kernels and out-of-range ordinals
        are warnings + not-ok; strict=False callers may still apply the
        valid subset (fallback semantics live in the .so loader).
        """
        warnings = []
        if expect_fp is not None and self.fp != expect_fp:
            return False, ["fingerprint mismatch: preset=%s host=%s"
                           % (self.fp, expect_fp)]
        known = registry["kernels"] if isinstance(registry, dict) else {}
        ids = {e["kernel"]: [c["id"] for c in e.get("covers", ())]
               for e in known}
        ok = True
        for k, ord_ in sorted(self.choices.items()):
            if k not in ids:
                warnings.append("unknown kernel in preset: %s" % k)
                ok = False
                continue
            if ord_ not in ids[k]:
                warnings.append("kernel %s: ordinal %d not in cover ids %s"
                                % (k, ord_, sorted(ids[k])))
                ok = False
        return ok, warnings


class CoverRegistry:
    """Schema (json) helpers for the cover registry manifest."""

    SCHEMA_VERSION = 1
    REQUIRED_KERNEL = ("kernel", "covers")
    REQUIRED_COVER = ("id", "kind")

    @staticmethod
    def new(schema_version=SCHEMA_VERSION):
        return {"schema_version": schema_version, "kernels": []}

    @staticmethod
    def validate(registry):
        errors = []
        if registry.get("schema_version") != CoverRegistry.SCHEMA_VERSION:
            errors.append("schema_version must be %d" % CoverRegistry.SCHEMA_VERSION)
        seen = set()
        for e in registry.get("kernels", []):
            for f in CoverRegistry.REQUIRED_KERNEL:
                if f not in e:
                    errors.append("kernel entry missing %r: %r" % (f, e.get("kernel")))
                    continue
            k = e["kernel"]
            if k in seen:
                errors.append("duplicate kernel: %s" % k)
            seen.add(k)
            ids = []
            for c in e.get("covers", []):
                for f in CoverRegistry.REQUIRED_COVER:
                    if f not in c:
                        errors.append("kernel %s cover missing %r" % (k, f))
                        continue
                ids.append(c["id"])
                if c["kind"] not in ("upstream", "ago", "static"):
                    errors.append("kernel %s: bad cover kind %r" % (k, c["kind"]))
            if 0 in ids and [c for c in e.get("covers", ())
                             if c["id"] == 0 and c["kind"] != "upstream"]:
                errors.append("kernel %s: id 0 must be kind=upstream" % k)
            if len(set(ids)) != len(ids):
                errors.append("kernel %s: duplicate cover ids" % k)
            if ids and min(ids) < 0:
                errors.append("kernel %s: negative cover id" % k)
        return errors

    @staticmethod
    def save(registry, path):
        errs = CoverRegistry.validate(registry)
        if errs:
            raise ValueError("refusing to save invalid registry: %s"
                             % "; ".join(errs[:3]))
        with open(path, "w", encoding="utf-8") as f:
            json.dump(registry, f, ensure_ascii=False, indent=2, sort_keys=True)
            f.write("\n")

    @staticmethod
    def load(path):
        with open(path, encoding="utf-8") as f:
            registry = json.load(f)
        errs = CoverRegistry.validate(registry)
        if errs:
            raise ValueError("invalid registry %s: %s"
                             % (path, "; ".join(errs[:3])))
        return registry


def _import_ago_covers_map():
    """Late import: ago_auto_search.KERNEL_COVERS (covers module -> symbol)."""
    from ago_auto_search import KERNEL_COVERS
    return KERNEL_COVERS


def _static_candidates(kernel):
    d = os.path.join(ROOT, "kernels", kernel, "candidates")
    if not os.path.isdir(d):
        return []
    return sorted(p for p in os.listdir(d)
                  if p.endswith(".cpp") or p.endswith(".S"))


def build_ago_registry(kernels=None, include_static=False):
    """Build the registry from AGO covers modules (+ optional static files).

    Ordering rules (stable numeric ids):
      id 0 = upstream dispatch (always present);
      id 1..N = cover_meta()['covers'] order (letter order in module);
      if include_static, remaining candidate files (not referenced by any
      ago cover source_file) are appended after, kind='static', with
      selection_rule='manual' until build_release extracts the
      candidate_sources() flag rules (docs/87 step 4).
    """
    registry = CoverRegistry.new()
    kmap = _import_ago_covers_map()
    for kernel in sorted(kmap if kernels is None else kernels):
        if kernel not in kmap:
            continue
        module_name, default_symbol = kmap[kernel]
        entry = {"kernel": kernel,
                 "default_symbol": default_symbol,
                 "covers": [{"id": UPSTREAM_ID, "kind": "upstream",
                             "label": "upstream dispatch"}]}
        next_id = 1
        try:
            mod = importlib.import_module(module_name)
            meta = mod.cover_meta()
        except Exception as exc:  # keep the tool usable when a module breaks
            entry["covers"].append({"id": next_id, "kind": "ago",
                                    "label": "COVER_META_ERROR",
                                    "note": "%s: %s" % (type(exc).__name__, exc)})
            next_id += 1
        else:
            referenced_files = set()
            for letter in meta.get("covers", []):
                name = meta.get("names", {}).get(letter, "")
                ratio = meta.get("expected_permute_ratio", {}).get(letter)
                cover = {"id": next_id, "kind": "ago", "label": letter,
                         "name": name,
                         "source_module": module_name}
                if ratio is not None:
                    cover["expected_permute_ratio"] = ratio
                entry["covers"].append(cover)
                next_id += 1
            # deviation profile fields (docs/87 §3.1) are optional for now;
            # filled by the deviation-profile tool (step 5).
        if include_static:
            for fn in _static_candidates(kernel):
                entry["covers"].append({
                    "id": next_id, "kind": "static",
                    "label": fn, "source_file": os.path.join(
                        "kernels", kernel, "candidates", fn),
                    "selection_rule": "manual",
                })
                next_id += 1
        registry["kernels"].append(entry)
    if kernels is None:
        registry["generated"] = "all-ago-covers"
    return registry


def resolve_preset(text, registry, expect_fp=None):
    """Parse + validate a preset against a registry.

    Returns (preset, valid, warnings). Valid=False means at least one
    entry is unknown/out-of-range or the fingerprint mismatches; the
    .so loader then ignores the preset and falls back to default
    dispatch (docs/87 step 2).
    """
    preset = Preset.parse(text)
    valid, warnings = preset.validate(registry, expect_fp=expect_fp)
    return preset, valid, warnings


if __name__ == "__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--build", metavar="OUT.json",
                    help="build registry from AGO covers and save JSON")
    ap.add_argument("--static", action="store_true",
                    help="with --build: include static candidate files")
    ap.add_argument("--kernels", default="",
                    help="with --build: comma-separated kernel subset")
    ap.add_argument("--check-preset", metavar="TEXT",
                    help="parse+validate a preset against a registry file")
    ap.add_argument("--registry", metavar="FILE",
                    help="registry JSON used by --check-preset / --fingerprint")
    ap.add_argument("--fingerprint", action="store_true",
                    help="print an example fingerprint (uses --registry hash)")
    ap.add_argument("--print", action="store_true",
                    help="pretty-print registry (with --build)")
    args = ap.parse_args()

    if args.build:
        ks = [k for k in args.kernels.split(",") if k] or None
        reg = build_ago_registry(kernels=ks, include_static=args.static)
        CoverRegistry.save(reg, args.build)
        print("registry saved to", args.build, "(%d kernels)"
              % len(reg["kernels"]))
        if args.print:
            print(json.dumps(reg, ensure_ascii=False, indent=2, sort_keys=True))
    if args.check_preset:
        reg = CoverRegistry.load(args.registry)
        preset, ok, warns = resolve_preset(args.check_preset, reg)
        print("preset:", preset.serialize())
        print("valid:", ok)
        for w in warns:
            print("warn:", w)
    if args.fingerprint:
        so_hash = hashlib.sha256(
            open(args.registry, "rb").read()).hexdigest()
        fp = fingerprint("example950", "sve2", 32, "gcc15.3", so_hash)
        print("example fingerprint:", fp)
