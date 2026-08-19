"""Unit tests for tools/cover_registry.py (docs/87 step 1)."""

import json
import os
import tempfile
import unittest

import cover_registry as cr


class FingerprintTest(unittest.TestCase):
    def test_stable_and_sensitive(self):
        base = dict(machine="950", isa="sve2", vl=32, compiler="gcc15.3",
                    so_sha256="a" * 64)
        fp1 = cr.fingerprint(**base)
        fp2 = cr.fingerprint(**base)
        self.assertEqual(fp1, fp2)
        self.assertRegex(fp1, r"^m[0-9a-f]{8}$")
        for key in ("machine", "isa", "vl", "compiler", "so_sha256"):
            var = dict(base)
            var[key] = (var[key] + "X") if isinstance(var[key], str) else var[key] + 1
            self.assertNotEqual(fp1, cr.fingerprint(**var),
                                "fingerprint ignored %s" % key)


class PresetTest(unittest.TestCase):
    def test_roundtrip(self):
        p = cr.Preset("m1a2b3c4d", {"dct16": 3, "satd-8": 0})
        q = cr.Preset.parse(p.serialize())
        self.assertEqual(p.fp, q.fp)
        self.assertEqual(p.choices, q.choices)

    def test_bad_grammar(self):
        for bad in ("", "v1", "v2:m1a2b3c4:dct16=1",
                    "v1:xxx:dct16=1", "v1:m1a2b3c4:dct16", 
                    "v1:m1a2b3c4:dct16= -1"):
            with self.assertRaises(ValueError, msg=bad):
                cr.Preset.parse(bad.strip())

    def test_robot_rejects_negative(self):
        with self.assertRaises(ValueError):
            cr.Preset.parse("v1:m1a2b3c4:dct16=-1")


class RegistryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # dct16 covers module is small and imports no IR at meta time.
        cls.reg = cr.build_ago_registry(kernels=["dct16", "sad"])

    def test_ids_start_at_upstream(self):
        by = {e["kernel"]: e for e in self.reg["kernels"]}
        for k in ("dct16", "sad"):
            covers = by[k]["covers"]
            self.assertEqual(covers[0]["id"], 0)
            self.assertEqual(covers[0]["kind"], "upstream")
            self.assertEqual([c["id"] for c in covers],
                             list(range(len(covers))))

    def test_dct16_has_ago_covers(self):
        by = {e["kernel"]: e for e in self.reg["kernels"]}
        dct16 = by["dct16"]
        self.assertEqual([c["label"] for c in dct16["covers"]],
                         ["upstream dispatch", "A", "B", "C"])
        c3 = dct16["covers"][3]
        self.assertEqual(c3["kind"], "ago")
        self.assertEqual(c3["name"], "op895 (hand-written reference, permute=18.5%)")
        self.assertAlmostEqual(c3["expected_permute_ratio"], 0.185, places=3)

    def test_resolve_preset(self):
        _, ok, warns = cr.resolve_preset("v1:m1a2b3c4d:dct16=3,sad=1",
                                      self.reg, expect_fp="m1a2b3c4d")
        self.assertTrue(ok)
        self.assertEqual(warns, [])

    def test_resolve_unknown_kernel(self):
        _, ok, warns = cr.resolve_preset("v1:m1a2b3c4d:nope=1", self.reg)
        self.assertFalse(ok)
        self.assertTrue(any("unknown kernel" in w for w in warns))

    def test_resolve_out_of_range(self):
        _, ok, warns = cr.resolve_preset("v1:m1a2b3c4d:dct16=99", self.reg)
        self.assertFalse(ok)
        self.assertTrue(any("not in cover ids" in w for w in warns))

    def test_resolve_fingerprint_mismatch(self):
        _, ok, warns = cr.resolve_preset("v1:m00000000:dct16=1", self.reg,
                                         expect_fp="m1a2b3c4d")
        self.assertFalse(ok)
        self.assertTrue(any("fingerprint mismatch" in w for w in warns))


class SchemaTest(unittest.TestCase):
    def make(self):
        return {"schema_version": 1, "kernels": [
            {"kernel": "k", "default_symbol": "s", "covers": [
                {"id": 0, "kind": "upstream"},
                {"id": 1, "kind": "ago", "label": "A"},
            ]},
        ]}

    def test_valid_save_load(self):
        reg = self.make()
        with tempfile.TemporaryDirectory() as td:
            path = os.path.join(td, "reg.json")
            cr.CoverRegistry.save(reg, path)
            loaded = cr.CoverRegistry.load(path)
        self.assertEqual(loaded, reg)

    def test_duplicate_kernel_rejected(self):
        reg = self.make()
        reg["kernels"].append(dict(reg["kernels"][0]))
        self.assertTrue(cr.CoverRegistry.validate(reg))

    def test_id0_must_be_upstream(self):
        reg = self.make()
        reg["kernels"][0]["covers"][0]["kind"] = "ago"
        self.assertTrue(cr.CoverRegistry.validate(reg))

    def test_duplicate_ids_rejected(self):
        reg = self.make()
        reg["kernels"][0]["covers"].append(
            {"id": 1, "kind": "ago", "label": "A2"})
        self.assertTrue(cr.CoverRegistry.validate(reg))

    def test_cover_missing_fields_no_crash(self):
        """A cover dict missing 'id' or 'kind' must produce a clean
        validation error, not a KeyError (regression guard)."""
        reg = self.make()
        reg["kernels"][0]["covers"].append({"label": "no fields"})
        errs = cr.CoverRegistry.validate(reg)
        self.assertTrue(any("missing 'id'" in e for e in errs), errs)
        self.assertTrue(any("missing 'kind'" in e for e in errs), errs)
        # save() must refuse, not crash
        with tempfile.TemporaryDirectory() as td:
            path = os.path.join(td, "reg.json")
            with self.assertRaises(ValueError):
                cr.CoverRegistry.save(reg, path)


if __name__ == "__main__":
    unittest.main()

class BoundedFieldsTest(unittest.TestCase):
    def test_bind_bound_and_cover_bound(self):
        reg = cr.CoverRegistry.new()
        reg["kernels"].append({
            "kernel": "dct32",
            "default_symbol": "dynopt_dct32",
            "covers": [
                {"id": 0, "kind": "upstream", "label": "upstream"},
                {"id": 4, "kind": "static", "label": "op4032",
                 "source_file": "kernels/dct32/candidates/best_sve2_op4032.cpp"},
            ]})
        applied = cr.apply_bounds(reg, ["dct32=4:32767"])
        self.assertEqual(applied, [("dct32", 4, 32767)])
        self.assertEqual(cr.cover_bound(reg, "dct32", 4), 32767)
        self.assertEqual(cr.cover_bound(reg, "dct32", 0), 0)
        self.assertEqual(cr.cover_bound(reg, "sao", 1), 0)
        self.assertEqual(cr.CoverRegistry.validate(reg), [])

    def test_bound_validation(self):
        reg = cr.CoverRegistry.new()
        reg["kernels"].append({
            "kernel": "dct32",
            "covers": [{"id": 4, "kind": "static",
                        "bound": 0},  # 0 = exact only -> invalid explicit
                       {"id": 0, "kind": "upstream", "bound": 1}]})
        errs = cr.CoverRegistry.validate(reg)
        self.assertTrue(any("bound must be a positive int" in e for e in errs))
        self.assertTrue(any("id 0" in e and "bound" in e for e in errs))

    def test_deviation_field(self):
        reg = cr.CoverRegistry.new()
        reg["kernels"].append({
            "kernel": "dct32",
            "covers": [{"id": 4, "kind": "static",
                        "bound": 32767, "deviation": 12096}]})
        self.assertEqual(cr.CoverRegistry.validate(reg), [])
        reg["kernels"][0]["covers"][0]["deviation"] = -1
        self.assertTrue(cr.CoverRegistry.validate(reg))
