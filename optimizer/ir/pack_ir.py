"""PackIR: abstract data-layout projection of MachineIR.

PackIR removes opcodes, intrinsics, concrete registers and instruction order.
It only records value identities and per-lane provenance. The verifier
rejects any schema violation so search candidates cannot smuggle in
instruction details.
"""

import json

SCHEMA_VERSION = "0.1"
FORBIDDEN_KEYS = ("op", "opcode", "intrinsic", "register", "reg", "seq")


def verify_pack_ir(doc):
    """Return list of violations; empty means the document is PackIR-clean."""
    violations = []
    if doc.get("schema_version") != SCHEMA_VERSION:
        violations.append("schema_version mismatch")
    for val in doc.get("values", []):
        for k in FORBIDDEN_KEYS:
            if k in val:
                violations.append("value %s contains forbidden key %r"
                                  % (val.get("id"), k))
        lanes = val.get("lanes", [])
        if not isinstance(lanes, list) or not lanes:
            violations.append("value %s has no lane list" % val.get("id"))
        for lane in lanes:
            if not isinstance(lane, dict) or "element" not in lane:
                violations.append("value %s lane is not provenance-annotated"
                                  % val.get("id"))
    if not violations:
        # order-independence check: document must not contain instruction
        # sequence list.
        if "instructions" in doc or "schedule" in doc:
            violations.append("PackIR must not contain instruction order")
    return violations


def projection_ok(machine_ir_doc, pack_ir_doc):
    """Cheap sanity: every MachineIR value has a PackIR counterpart."""
    mvalues = set()
    for node in machine_ir_doc.get("nodes", []):
        if "dst" in node:
            mvalues.add(node["dst"])
    pvalues = {v["id"] for v in pack_ir_doc.get("values", [])}
    return mvalues <= pvalues, sorted(mvalues - pvalues)
