#!/usr/bin/env python3
"""Test for optimizer/templates/ region-schedule template library."""

import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from optimizer.templates import (
    NEONBridgeTemplate, SvdotS32DirectTemplate, LoopKSectionsTemplate,
    CADDButterflyTemplate, TemplateConstraints, ALL_TEMPLATES,
    select_template,
)


class TestTemplateConstraints(unittest.TestCase):

    def test_defaults(self):
        c = TemplateConstraints()
        self.assertEqual(c.isa, "sve2")
        self.assertEqual(c.vl, 32)
        self.assertTrue(c.no_sve2p3)
        self.assertAlmostEqual(c.max_permute_ratio, 0.30)


class TestNEONBridgeTemplate(unittest.TestCase):

    def test_applicable_sve2_950(self):
        tpl = NEONBridgeTemplate()
        c = TemplateConstraints(isa="sve2", vl=32)
        self.assertTrue(tpl.applicable("hpp", c))
        self.assertTrue(tpl.applicable("dct16", c))

    def test_not_applicable_no_neon(self):
        tpl = NEONBridgeTemplate()
        c = TemplateConstraints(isa="sve2", vl=32, no_neon=True)
        self.assertFalse(tpl.applicable("hpp", c))

    def test_not_applicable_sve1(self):
        tpl = NEONBridgeTemplate()
        c = TemplateConstraints(isa="sve1", vl=32)
        self.assertFalse(tpl.applicable("hpp", c))

    def test_not_applicable_vl128(self):
        tpl = NEONBridgeTemplate()
        c = TemplateConstraints(isa="sve2", vl=16)
        self.assertFalse(tpl.applicable("hpp", c))

    def test_predict_ratio(self):
        tpl = NEONBridgeTemplate()
        self.assertLess(tpl.predict_permute_ratio(), 0.20)

    def test_emit_hpp(self):
        tpl = NEONBridgeTemplate()
        result = tpl.emit("dynopt_interp8_8x8_sve2_test",
                          kernel_type="hpp", width=8, height=8)
        self.assertIsInstance(result.code, str)
        self.assertGreater(len(result.code), 500)
        self.assertIn("svdot_s32", result.code)
        self.assertIn("vqmovun_s16", result.code)

    def test_emit_dct16(self):
        tpl = NEONBridgeTemplate()
        result = tpl.emit("dynopt_dct16_sve2_test",
                          kernel_type="dct16")
        self.assertIsInstance(result.code, str)
        self.assertGreater(len(result.code), 1000)


class TestSvdotS32DirectTemplate(unittest.TestCase):

    def test_applicable_hpp(self):
        tpl = SvdotS32DirectTemplate()
        c = TemplateConstraints(isa="sve2", vl=32)
        self.assertTrue(tpl.applicable("hpp", c))

    def test_not_applicable_sve1(self):
        tpl = SvdotS32DirectTemplate()
        c = TemplateConstraints(isa="sve1", vl=32)
        self.assertFalse(tpl.applicable("hpp", c))

    def test_predict_ratio(self):
        tpl = SvdotS32DirectTemplate()
        self.assertLess(tpl.predict_permute_ratio(), 0.30)


class TestLoopKSectionsTemplate(unittest.TestCase):

    def test_applicable_dct32(self):
        tpl = LoopKSectionsTemplate()
        c = TemplateConstraints(isa="sve2", vl=32)
        self.assertTrue(tpl.applicable("dct32", c))

    def test_predict_ratio(self):
        tpl = LoopKSectionsTemplate()
        self.assertLess(tpl.predict_permute_ratio(), 0.25)


class TestSelectTemplate(unittest.TestCase):

    def test_select_for_hpp(self):
        c = TemplateConstraints(isa="sve2", vl=32)
        tpl = select_template("hpp", c)
        self.assertIsNotNone(tpl)
        self.assertIn(tpl.name, ("neon_bridge", "svdot_s32_direct"))

    def test_select_for_dct32(self):
        c = TemplateConstraints(isa="sve2", vl=32)
        tpl = select_template("dct32", c)
        self.assertIsNotNone(tpl)
        self.assertEqual(tpl.name, "loop_ksections")

    def test_no_template_for_unknown(self):
        c = TemplateConstraints(isa="sve2", vl=32)
        tpl = select_template("unknown_kernel", c)
        self.assertIsNone(tpl)


class TestCADDButterflyTemplate(unittest.TestCase):

    def test_applicable_sve2_950(self):
        tpl = CADDButterflyTemplate()
        c = TemplateConstraints(isa="sve2", vl=32)
        self.assertTrue(tpl.applicable("satd16", c))
        self.assertTrue(tpl.applicable("psy_cost", c))

    def test_not_applicable_sve1(self):
        tpl = CADDButterflyTemplate()
        c = TemplateConstraints(isa="sve1", vl=32)
        self.assertFalse(tpl.applicable("satd16", c))

    def test_not_applicable_vl128(self):
        tpl = CADDButterflyTemplate()
        c = TemplateConstraints(isa="sve2", vl=16)
        self.assertFalse(tpl.applicable("satd16", c))

    def test_predict_ratio(self):
        tpl = CADDButterflyTemplate()
        self.assertLess(tpl.predict_permute_ratio(), 0.20)

    def test_emit_satd16(self):
        tpl = CADDButterflyTemplate()
        result = tpl.emit("dynopt_satd_16x16_sve2_test",
                          kernel_type="satd16")
        self.assertIsInstance(result.code, str)
        self.assertGreater(len(result.code), 500)
        self.assertIn("svcadd_s16", result.code)
        self.assertIn("270", result.code)

    def test_select_for_satd16(self):
        c = TemplateConstraints(isa="sve2", vl=32)
        tpl = select_template("satd16", c)
        self.assertIsNotNone(tpl)
        self.assertEqual(tpl.name, "cadd_butterfly")


class TestAllTemplates(unittest.TestCase):

    def test_all_have_names(self):
        for t in ALL_TEMPLATES:
            self.assertTrue(t.name)
            self.assertTrue(t.description)

    def test_all_have_isa_support(self):
        for t in ALL_TEMPLATES:
            self.assertGreater(len(t.isa_support), 0)

    def test_all_have_kernel_types(self):
        for t in ALL_TEMPLATES:
            self.assertGreater(len(t.kernel_types), 0)


if __name__ == "__main__":
    unittest.main()
