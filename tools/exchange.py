#!/usr/bin/env python3
"""exchange.py -- docs/87 step 8: 内网 <-> 外网 data exchange protocol.

Three exchange payloads (schema 'ago/exchange/*', version 1):

  verdict.json         内网 -> 外网  终验结论（pairwise 排名 / 每 cover
                                     ns-per-call / md5+TBL 门禁 / 有界包络）
  bone-cost.json       内网 -> 外网  指令代价表（指令类 / 延迟 / 8 路吞吐 /
                                     VL128 / VL256），外网重评全部 kernel
  measure-request.json 外网 -> 内网  主动测量清单（外网先算哪个测量消除
                                     最多排名不确定度，内网只跑点名项）

usage:
  python3 tools/exchange.py --validate <payload.json>
  python3 tools/exchange.py --examples data/exchange/examples
  python3 tools/exchange.py --make-request --kernels dct16,dct32 \\
      --out data/exchange/measure-request.json
"""

import argparse
import datetime
import json
import os
import re
import shutil
import subprocess
import sys

SCHEMA_VERDICT = "ago/exchange/verdict"
SCHEMA_COST = "ago/exchange/bone-cost"
SCHEMA_REQUEST = "ago/exchange/measure-request"
VERSION = 1

REQUIRED_VERDICT = (
    "schema", "version", "machine", "date", "preset_used", "gates")
REQUIRED_COST = ("schema", "version", "machine", "date", "rows")
REQUIRED_REQUEST = ("schema", "version", "date", "rationale", "requests")

GATE_NAMES = ("interception", "video_md5", "tbl", "replay_envelope",
              "benchmark")
PAIRWISE_ORDER = ("upstream", "A", "B", "C", "K", "D", "E", "F")


def _check(cond, msg, errors):
    if not cond:
        errors.append(msg)


def validate(payload, registry=None):
    """Validate a payload; returns (ok, errors list)."""
    if not isinstance(payload, dict):
        return False, ["payload must be a JSON object"]
    errors = []
    schema = payload.get("schema")
    version = payload.get("version")
    _check(schema in (SCHEMA_VERDICT, SCHEMA_COST, SCHEMA_REQUEST),
           "unknown schema %r" % schema, errors)
    _check(version == VERSION, "version must be %d" % VERSION, errors)
    reqs = {SCHEMA_VERDICT: REQUIRED_VERDICT,
            SCHEMA_COST: REQUIRED_COST,
            SCHEMA_REQUEST: REQUIRED_REQUEST}.get(schema, ())
    for f in reqs:
        _check(f in payload, "missing %r" % f, errors)
    if schema == SCHEMA_VERDICT:
        _validate_verdict(payload, registry, errors)
    elif schema == SCHEMA_COST:
        _validate_cost(payload, errors)
    elif schema == SCHEMA_REQUEST:
        _validate_request(payload, errors)
    return not errors, errors


def _validate_verdict(p, registry, errors):
    m = p.get("machine") or {}
    for f in ("tag", "isa", "vl"):
        _check(f in m, "machine missing %r" % f, errors)
    preset = p.get("preset_used")
    _check(isinstance(preset, str) and preset.startswith("v1:"),
           "preset_used must look like v1:<fp>:<kernel>=<ord>,...", errors)
    pair = p.get("pairwise") or {}
    for k, order in pair.items():
        _check(isinstance(order, list) and len(order) >= 2,
               "pairwise %s must be a ranked list" % k, errors)
        _check(set(order).issubset(set(PAIRWISE_ORDER)),
               "pairwise %s has unknown labels %r" % (k, order), errors)
    gates = p.get("gates") or {}
    for g in GATE_NAMES:
        if g in gates and not isinstance(gates[g], dict):
            errors.append("gate %r must be an object" % g)
    if "video_md5" in gates:
        gm = gates["video_md5"]
        _check("passed" in gm, "video_md5 gate missing 'passed'", errors)
        _check("clips" in gm and isinstance(gm["clips"], list),
               "video_md5 gate missing 'clips' list", errors)
    for k in p.get("kernels", []):
        _check(isinstance(k, dict) and "kernel" in k and "cover" in k,
               "kernel entry needs kernel+cover", errors)
        if registry:
            ids = {c["id"] for e in registry["kernels"]
                   for c in e.get("covers", [])
                   if e["kernel"] == k["kernel"]}
            _check(k["cover"] in ids,
                   "kernel %s cover %s not in registry" %
                   (k["kernel"], k["cover"]), errors)


def _validate_cost(p, errors):
    for r in p.get("rows", []):
        for f in ("op", "class", "latency", "tput_8way",
                  "tput_vl128_ratio", "tput_vl256_ratio"):
            _check(f in r, "cost row missing %r (%s)" % (f, r.get("op")),
                   errors)
        _check(r["latency"] >= 0 and r["tput_8way"] >= 0,
               "cost row %s has negative metric" % r.get("op"), errors)


def _validate_request(p, errors):
    for r in p.get("requests", []):
        for f in ("kernel", "measure", "priority"):
            _check(f in r, "request missing %r" % f, errors)
        _check(r.get("measure") in ("ns_per_call", "replay_envelope",
                                    "video_md5", "bone_cost"),
               "request measure %r unknown" % r.get("measure"), errors)
        _check(isinstance(r.get("priority"), int) and r["priority"] > 0,
               "request priority must be positive int", errors)


def example_verdict(machine="950", date=None, registry=None,
                    preset_used="v1:m1a2b3c4d:dct16=2,dct32=0",
                    add_kernels=()):
    date = date or datetime.date.today().isoformat()
    kernels = [
        {"kernel": "dct16", "cover": 2, "kind": "exact",
         "arm_ns": 92, "upstream_ns": 100, "speedup_vs_upstream": 1.087,
         "samples": 300, "md5_match": True, "tbl": "pass"},
        {"kernel": "dct32", "cover": 0, "kind": "upstream",
         "arm_ns": 100, "upstream_ns": 100, "speedup_vs_upstream": 1.0,
         "samples": 0, "md5_match": True, "tbl": "n/a"},
    ] + list(add_kernels)
    return {
        "schema": SCHEMA_VERDICT, "version": VERSION,
        "machine": {"tag": machine, "isa": "sve2", "vl": 32,
                    "note": "final gate host"},
        "date": date, "preset_used": preset_used,
        "pairwise": {"dct16": ["upstream", "C", "B", "A"],
                     "dct32": ["upstream", "C", "B", "A"]},
        "kernels": kernels,
        "gates": {
            "interception": {"passed": True, "patched_slots": 2},
            "video_md5": {"passed": True,
                          "clips": ["spec-8k-01"],
                          "sampling": "full"},
            "tbl": {"passed": True, "cases": 1200},
            "benchmark": {"passed": True, "rounds": 3},
        },
        "commit_external": "cf69379",
        "report_ref": "reports/950-final-20260820.txt",
    }


def example_cost(machine="950", date=None):
    date = date or datetime.date.today().isoformat()
    return {
        "schema": SCHEMA_COST, "version": VERSION,
        "machine": {"tag": machine, "isa": "sve2", "vl": 32},
        "date": date,
        "units": "ns per 1000 ops at VL256 throughput; ratios vs 8-way",
        "rows": [
            {"op": "vadd.s8", "class": "ALU", "latency": 4,
             "tput_8way": 0.25, "tput_vl128_ratio": 1.0,
             "tput_vl256_ratio": 1.0, "notes": ""},
            {"op": "svld1.s8", "class": "LD", "latency": 8,
             "tput_8way": 0.5, "tput_vl128_ratio": 1.1,
             "tput_vl256_ratio": 1.0, "notes": ""},
        ],
    }


def example_request(kernels=("dct16", "dct32"), date=None):
    date = date or datetime.date.today().isoformat()
    return {
        "schema": SCHEMA_REQUEST, "version": VERSION,
        "date": date,
        "rationale": "ranking uncertainty: top-N kernels cover 78% of "
                     "variance (see ranker_calibrate.py)",
        "requests": [
            {"kernel": k, "cover_ids": [], "measure": "ns_per_call",
             "samples": 300, "priority": i + 1}
            for i, k in enumerate(kernels)
        ],
    }


def ingest_verdict(payload, registry, request=None):
    """Consume a 950 verdict: return (db_rows, pairwise_after, request_after).

    No I/O: callers persist. Pairwise merges by kernel (verdict ranking keyed
    by canonical labels); measure-request refresh drops satisfied ns_per_call
    requests for kernels the verdict measured with md5/tbl passing.
    """
    db_rows, p_after, req_after = [], {}, request
    preset = payload.get("preset_used", "")
    chosen = {}
    try:
        import cover_registry as cr
        obj, ok, _ = cr.resolve_preset(preset, registry)
        chosen = obj.choices if ok else {}
    except Exception:
        chosen = {}
    for k in payload.get("pairwise", {}):
        p_after[k] = payload["pairwise"][k]
    for row in payload.get("kernels", []):
        kernel = row.get("kernel")
        cover = row.get("cover", 0)
        kind = row.get("kind", "upstream" if cover == 0 else "exact")
        bit_exact = "yes" if cover == 0 or kind == "exact" else (
            "no (bounded: max_abs<=%d)" % row.get("bound", 0))
        up = row.get("upstream_ns")
        arm = row.get("arm_ns")
        speedup = (float(up) / arm) if up and arm else None
        db_rows.append({
            "id": "%s-950-%s-%s" % (kernel, payload.get("date", "?"), "final"),
            "date": payload.get("date", ""),
            "commit": payload.get("commit_external", ""),
            "kernel": kernel,
            "variant": str(row.get("label", cover)),
            "machine": payload.get("machine", {}).get("tag", "950"),
            "kernel_metric": "ns_per_call",
            "kernel_value": str(arm) if arm else "",
            "e2e_100f_pct": (round((1 - speedup) * 100, 3)
                             if speedup else ""),
            "bit_exact": bit_exact,
            "report": payload.get("report_ref", ""),
        })
    if isinstance(request, dict):
        req_after = refresh_request(request, payload, registry)
    return db_rows, p_after, req_after


def refresh_request(request, verdict, registry=None):
    """Drop ns_per_call requests for kernels the verdict measured (via md5+
    TBL passing, or gates absent); keep replay_envelope/video_md5 asks."""
    kernels = {}
    pools = [row.get("kernel") for row in verdict.get("kernels", [])
             if row.get("kind") in ("exact", "upstream")]
    md5 = (verdict.get("gates", {}).get("video_md5", {}) or {}).get("passed")
    for req in request.get("requests", []):
        k = req.get("kernel")
        if (req.get("measure") == "ns_per_call" and k in pools and
                md5 is not False):
            continue
        kernels.setdefault(k, 0)
        kernels[k] += 1
    out = [r for r in request.get("requests", [])
           if not (r.get("measure") == "ns_per_call" and
                   r.get("kernel") in pools and md5 is not False)]
    out.sort(key=lambda r: r.get("priority", 999))
    for i, r in enumerate(out, 1):
        r["priority"] = i
    return {"schema": request.get("schema"), "version": request.get("version"),
            "date": datetime.date.today().isoformat(),
            "rationale": request.get("rationale", "") +
                         " (refreshed after verdict ingestion)",
            "requests": out}


def write_json(payload, path):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(payload, f, ensure_ascii=False, indent=2, sort_keys=True)
        f.write("\n")
    ok, errs = validate(payload)
    if not ok:
        raise ValueError("refusing to write invalid exchange payload: %s"
                         % "; ".join(errs))


def main():
    ap = argparse.ArgumentParser(prog="exchange.py", description=__doc__)
    ap.add_argument("--validate", metavar="FILE",
                    help="validate an exchange payload")
    ap.add_argument("--registry", default="",
                    help="registry JSON (--validate verdict against it)")
    ap.add_argument("--examples", metavar="DIR",
                    help="write the three example payloads to DIR")
    ap.add_argument("--ingest-inbox", metavar="DIR",
                    help="consume verdict/bone-cost payloads dropped by 950:"
                         " validate -> kernel-test-db/pairwise -> refresh"
                         " measure-request -> archive (docs/95 T3)")
    ap.add_argument("--outbox", default=os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "..", "data",
        "exchange", "outbox"),
                    help="outbox dir for refreshed measure-request")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--make-request", metavar="OUT",
                    help="write a measure-request for --kernels")
    ap.add_argument("--kernels", default="dct16,dct32")
    args = ap.parse_args()
    if args.validate:
        with open(args.validate, encoding="utf-8") as f:
            payload = json.load(f)
        reg = None
        if args.registry:
            import cover_registry as cr
            reg = cr.CoverRegistry.load(args.registry)
        ok, errs = validate(payload, registry=reg)
        for e in errs:
            print("ERR:", e)
        print("valid:", ok)
        return 0 if ok else 1
    if args.examples:
        write_json(example_verdict(), os.path.join(args.examples,
                                                   "verdict.json"))
        write_json(example_cost(), os.path.join(args.examples,
                                                "bone-cost.json"))
        write_json(example_request(), os.path.join(
            args.examples, "measure-request.json"))
        print("examples written to", args.examples)
    if args.make_request:
        ks = [k for k in args.kernels.split(",") if k]
        write_json(example_request(ks), args.make_request)
        print("measure-request written to", args.make_request)
    if args.ingest_inbox:
        reg = None
        if args.registry:
            import cover_registry as cr
            reg = cr.CoverRegistry.load(args.registry)
        inbox = os.path.abspath(args.ingest_inbox)
        archived = os.path.join(inbox, "processed")
        os.makedirs(archived, exist_ok=True)
        request = None
        rq_path = os.path.join(args.outbox, "measure-request.json")
        if os.path.exists(rq_path):
            with open(rq_path, encoding="utf-8") as f:
                request = json.load(f)
        consumed, summary = [], {"files": [], "errors": [], "db_rows": 0,
                                 "pairwise": {}, "request": None}
        for fn in sorted(os.listdir(inbox)):
            if not fn.endswith(".json"):
                continue
            pathc = os.path.join(inbox, fn)
            with open(pathc, encoding="utf-8") as f:
                payload = json.load(f)
            ok, errs = validate(payload, registry=reg)
            if not ok:
                summary["errors"].append("%s: %s" % (fn, "; ".join(errs)))
                continue
            if payload.get("schema") == SCHEMA_VERDICT:
                rows, p_after, request2 = ingest_verdict(payload, reg,
                                                         request)
                summary["pairwise"].update(p_after)
                if not args.dry_run:
                    import kernel_db
                    for row in rows:
                        cmd = [sys.executable,
                               os.path.join(os.path.dirname(
                                   os.path.abspath(__file__)),
                                   "kernel_db.py"), "add"] + \
                            ["%s=%s" % (kk, vv)
                             for kk, vv in row.items() if vv != ""]
                        rr = subprocess.run(cmd, capture_output=True,
                                            text=True)
                        if rr.returncode != 0:
                            summary["errors"].append(
                                "%s db add: %s"
                                % (row["id"], rr.stderr[-140:]))
                        else:
                            summary["db_rows"] += 1
                summary["request"] = request2
                request = request2
            elif payload.get("schema") == SCHEMA_COST:
                if not args.dry_run:
                    write_json(payload, os.path.join(
                        os.path.dirname(os.path.abspath(__file__)), "..",
                        "data", "exchange", "bone-cost-latest.json"))
            summary["files"].append(fn)
            if not args.dry_run:
                shutil.move(pathc, os.path.join(
                    archived, datetime.date.today().isoformat() + "-" + fn))
            consumed.append(fn)
        if not args.dry_run and request is not None:
            write_json(request, os.path.join(args.outbox,
                                             "measure-request.json"))
        print(json.dumps({
            "ingested": consumed, "errors": summary["errors"],
            "db_rows": summary["db_rows"],
            "pairwise_after": summary["pairwise"],
            "request_after": summary["request"] and summary["request"].get(
                "requests", [])}, ensure_ascii=False, indent=2,
            sort_keys=True))
        return 0 if not summary["errors"] else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
