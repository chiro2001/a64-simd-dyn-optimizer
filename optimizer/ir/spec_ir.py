"""SpecIR schema and hashing for canonical kernel specs.

v1 keeps the schema intentionally small: a kernel spec is a versioned JSON
document that names the kernel, its memory contract, and (for now) a pointer
to the canonical interpreter implementation under kernels/<family>/.
Later milestones may expand this into a full node graph; the hash below must
remain stable for identical semantic documents.
"""

import hashlib
import json

SPEC_SCHEMA_VERSION = "1.0"


def canonical_json(obj):
    """Serialize with sorted keys and compact separators for stable hashing."""
    return json.dumps(obj, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def canonical_hash(obj):
    return hashlib.sha256(canonical_json(obj).encode("utf-8")).hexdigest()


def make_sa8d_spec(shape, bit_depth=8, interpreter="python:x265_c_stages"):
    doc = {
        "schema_version": SPEC_SCHEMA_VERSION,
        "kernel": "sa8d",
        "shape": {"width": shape, "height": shape},
        "bit_depth": bit_depth,
        "memory_contract": {
            "a": {"region": "pixel_a", "stride": "intptr", "min_stride": shape},
            "b": {"region": "pixel_b", "stride": "intptr", "min_stride": shape},
            "over_read": False,
        },
        "semantics": {
            "d": "signed(A) - signed(B), lane s16",
            "t": "W8 @ D @ W8^T with x265 HADAMARD4 stage order",
            "abs_sum": "sum(abs(T))",
            "rounding": "sa8d8x8=(R8+2)>>2; 16x16 rounds once after four raw R8; "
                        "32x32 sums rounded 16x16; 64x64 sums rounded 16x16",
        },
        "interpreter": interpreter,
    }
    return doc
