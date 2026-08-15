#!/usr/bin/env python3
"""Regression tests for the static ISA-level gate
(tools/check_isa_level.py).

Covers the 2026-08-16 alignment audit:
  - TBX (even single-register) is SVE2 and must not pass an sve1 gate;
  - UDOT 2-way .S/.H/.H (SVE2p1) and .H/.B/.B (SVE2p3) must not pass an
    sve1 gate, while 4-way UDOT/SDOT (including .D/.H/.H) are SVE1;
  - NEON TBX/FMLALB must not be flagged by the SVE2 z-register rules.
"""

import os
import subprocess
import sys
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

import check_isa_level  # noqa: E402


DISASM = """\
0000000000000000 <f>:
   0:\t44000000\t%s\t%s
"""


class OperandLevelTest(unittest.TestCase):

    def test_sdot_sve1_forms(self):
        self.assertIsNone(check_isa_level.operand_level(
            "sdot", "z0.s, z1.b, z2.b"))
        self.assertIsNone(check_isa_level.operand_level(
            "sdot", "z0.d, z1.h, z2.h"))  # 16->64 4-way is SVE1

    def test_sdot_sve2p1_sve2p3(self):
        self.assertEqual(check_isa_level.operand_level(
            "sdot", "z0.s, z1.h, z2.h"),
            check_isa_level.LEVELS["sve2p1"])
        self.assertEqual(check_isa_level.operand_level(
            "sdot", "z0.h, z1.b, z2.b"),
            check_isa_level.LEVELS["sve2p3"])

    def test_udot_mirrors_sdot(self):
        self.assertIsNone(check_isa_level.operand_level(
            "udot", "z0.s, z1.b, z2.b"))
        self.assertIsNone(check_isa_level.operand_level(
            "udot", "z0.d, z1.h, z2.h"))
        self.assertEqual(check_isa_level.operand_level(
            "udot", "z0.s, z1.h, z2.h"),
            check_isa_level.LEVELS["sve2p1"])
        self.assertEqual(check_isa_level.operand_level(
            "udot", "z0.h, z1.b, z2.b"),
            check_isa_level.LEVELS["sve2p3"])

    def test_tbx_single_register_is_sve2(self):
        self.assertEqual(check_isa_level.operand_level(
            "tbx", "z0.s, z1.s, z2.s"),
            check_isa_level.LEVELS["sve2"])
        # NEON TBX must stay unflagged.
        self.assertIsNone(check_isa_level.operand_level(
            "tbx", "v0.16b, v1.16b, v2.16b"))

    def test_sve2_family_z_register(self):
        for mnem in ("cadd", "addp", "histcnt", "match", "nmatch",
                     "fmlalb", "fmlalt", "fmlslb", "fmlslt"):
            self.assertEqual(check_isa_level.operand_level(
                mnem, "z0.s, z1.s, z2.s"),
                check_isa_level.LEVELS["sve2"], mnem)
        # NEON forms of the same mnemonics stay unflagged.
        for mnem in ("fmlalb", "fmlalt", "fmlslb", "fmlslt"):
            self.assertIsNone(check_isa_level.operand_level(
                mnem, "v0.4s, v1.4h, v2.4h"), mnem)


class GateRegressionTest(unittest.TestCase):

    def run_gate(self, disasm_text, level):
        with tempfile.NamedTemporaryFile("w", suffix=".s", delete=False) as f:
            f.write(disasm_text)
            path = f.name
        try:
            proc = subprocess.run(
                [sys.executable, os.path.join(ROOT, "tools",
                                              "check_isa_level.py"),
                 "--disasm", path, "--level", level],
                capture_output=True, text=True)
            return proc
        finally:
            os.unlink(path)

    def test_tbx_fails_sve1_gate(self):
        proc = self.run_gate(DISASM % ("tbx", "z0.s, z1.s, z2.s"), "sve1")
        self.assertEqual(proc.returncode, 1)
        self.assertIn("VIOLATIONS", proc.stdout)
        self.assertIn("tbx", proc.stdout)

    def test_udot_2way_fails_sve1_gate(self):
        proc = self.run_gate(DISASM % ("udot", "z0.s, z1.h, z2.h"), "sve1")
        self.assertEqual(proc.returncode, 1)
        proc = self.run_gate(DISASM % ("udot", "z0.h, z1.b, z2.b"), "sve1")
        self.assertEqual(proc.returncode, 1)

    def test_sve1_forms_pass(self):
        text = DISASM % ("sdot", "z0.s, z1.b, z2.b")
        text += DISASM % ("udot", "z0.d, z1.h, z2.h")
        text += DISASM % ("tbl", "z0.s, z1.s, z2.s")
        text += DISASM % ("uzp1", "z0.h, z1.h, z2.h")
        proc = self.run_gate(text, "sve1")
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)

    def test_neon_tbx_fmlalb_pass_sve1(self):
        text = DISASM % ("tbx", "v0.16b, v1.16b, v2.16b")
        text += DISASM % ("fmlalb", "v0.4s, v1.4h, v2.4h")
        proc = self.run_gate(text, "sve1")
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)

    def test_sdot_2way_requires_correct_levels(self):
        proc = self.run_gate(DISASM % ("sdot", "z0.s, z1.h, z2.h"), "sve2")
        self.assertEqual(proc.returncode, 1)
        proc = self.run_gate(DISASM % ("sdot", "z0.s, z1.h, z2.h"),
                             "sve2p1")
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        proc = self.run_gate(DISASM % ("sdot", "z0.h, z1.b, z2.b"),
                             "sve2p3")
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)


if __name__ == "__main__":
    unittest.main()
