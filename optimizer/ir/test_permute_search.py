"""Unit tests for the SVE lane-permutation matcher."""

import os
import subprocess
import sys
import tempfile

from permute_search import (
    N,
    butterfly,
    emit_acle,
    probe_source,
    search_transpose,
    transpose_target,
)


def _rows():
    return [[r * N + c for c in range(N)] for r in range(N)]


def test_search_finds_zip_butterfly():
    hit = search_transpose(ops=("zip",))
    assert hit == ((8, 4, 2, 1), "zip"), hit
    order, op_name = hit
    out = butterfly(_rows(), order, op_name)
    assert out == transpose_target()


def test_trn_butterfly_is_not_a_transpose():
    # trn1/trn2 only touch the low 8 lanes of each source, so the full
    # butterfly cannot express the 16x16 transpose (regression guard).
    for order in ((1, 2, 4, 8), (8, 4, 2, 1)):
        out = butterfly(_rows(), order, "trn")
        assert out != transpose_target()


def test_probe_source_compiles_under_qemu():
    hit = search_transpose(ops=("zip",))
    assert hit
    order, op_name = hit
    src = probe_source(order, op_name)
    with tempfile.TemporaryDirectory() as td:
        cpp = os.path.join(td, "probe.cpp")
        exe = os.path.join(td, "probe")
        with open(cpp, "w") as f:
            f.write(src)
        cc = subprocess.run(
            ["aarch64-linux-gnu-g++", "-O2", "-march=armv8.2-a+sve2",
             cpp, "-o", exe],
            capture_output=True, text=True)
        if cc.returncode != 0:
            raise AssertionError(cc.stderr[-1000:])
        q = subprocess.run(
            ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
             "-cpu", "max,sve-max-vq=2", exe],
            capture_output=True, text=True)
        assert q.returncode == 0, q.stdout + q.stderr
        assert "bad=0" in q.stdout


def test_emit_acle_shape():
    lines = emit_acle((8, 4, 2, 1), "zip", "out", "dst")
    assert lines.count("svzip1_s16") == 32
    assert lines.count("svzip2_s16") == 32
