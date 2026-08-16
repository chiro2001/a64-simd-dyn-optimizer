"""Unit tests for typed dot canonicalization (dot_ir)."""

import unittest

from dot_ir import (
    canonicalize_dot_ops,
    dot_summary,
    legal_lowerings,
    make_dot,
)
from op_ir import Op


def _mk(kind, oid, tile, ins=(), attrs=None, out=""):
    return Op(oid, kind, tile, out or ("o_" + oid), tuple(ins),
              dict(attrs or {}))


class TestCanonicalize(unittest.TestCase):
    def test_legacy_kinds_to_typed_dot(self):
        ops = [
            _mk("dot_segment", "d1", "p1.odd.k1.r0",
                ("O0",), {"terms": ("O0", "C0"), "lane_owner": "output"}),
            _mk("mul_reduce", "m1", "p2.k2.k2",
                ("E0", "C2"), {"lane_owner": "partial"}),
            _mk("neon_mul", "n1", "p1.k2.k2",
                ("E1", "C1"), {}),
            _mk("add", "a1", "p1.e", ("x", "y"), {"elem": "s16"}),
        ]
        out = canonicalize_dot_ops(ops)
        dots = [o for o in out if o.kind == "dot"]
        self.assertEqual(len(dots), 3)
        self.assertEqual(dots[0].attrs["lowering"], "sdot.d")
        self.assertEqual(dots[0].attrs["acc_ty"], "s64")
        self.assertEqual(dots[1].attrs["lowering"], "mul_saddv")
        self.assertEqual(dots[1].attrs["acc_ty"], "s32")
        self.assertEqual(dots[2].attrs["lowering"], "vmull_vmlal")
        # non-dot nodes pass through
        self.assertEqual([o for o in out if o.kind == "add"], [ops[3]])

    def test_summary(self):
        ops = [
            _mk("dot_segment", "d1", "t", ("a",), {}),
            _mk("mul_reduce", "m1", "t", ("b",), {}),
            _mk("dot_segment", "d2", "t", ("c",), {}),
        ]
        s = dot_summary(ops)
        self.assertEqual(s["sdot.d/s64"], 2)
        self.assertEqual(s["mul_saddv/s32"], 1)


class TestLegalLowerings(unittest.TestCase):
    def test_sve1_s64(self):
        d = make_dot("d", "t", ("a",), "s64", "s16", "s16", "sdot.d")
        self.assertEqual(legal_lowerings(d, "sve1", "both"),
                         [("sdot.d", 1)])

    def test_s32_requires_mul_saddv_upstream_exact(self):
        d = make_dot("d", "t", ("a",), "s32", "s32", "s32", "mul_saddv")
        self.assertEqual(legal_lowerings(d, "sve1", "upstream-exact"),
                         [("mul_saddv", 4)])

    def test_s16_s32_choices(self):
        d = make_dot("d", "t", ("a",), "s32", "s16", "s16", "smullb_smlalb")
        # SVE1 target: NEON vmlal + unpack-mul both legal.
        self.assertEqual(
            legal_lowerings(d, "sve1", "both"),
            [("vmull_vmlal", 2), ("unpk_svmul", 2)])
        # SVE2 target: only the native widening multiply.
        self.assertEqual(legal_lowerings(d, "sve2", "both", sve2=True),
                         [("smullb_smlalb", 2)])

    def test_legacy_contract_opens_sdot_on_s16_slices(self):
        d = make_dot("d", "t", ("a",), "s64", "s16", "s16", "sdot.d")
        self.assertEqual(legal_lowerings(d, "sve1", "legacy-internal-exact"),
                         [("sdot.d", 1)])

    def test_legacy_contract_is_superset(self):
        d = make_dot("d", "t", ("a",), "s32", "s32", "s32", "mul_saddv")
        # mul_saddv (upstream-exact) stays legal under the legacy family.
        self.assertEqual(legal_lowerings(d, "sve1", "legacy-internal-exact"),
                         [("mul_saddv", 4)])


if __name__ == "__main__":
    unittest.main()
