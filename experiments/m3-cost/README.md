# M3 cost/semantics artifacts

- `static/sa8d-8x8.json` — static instruction classification of the 8x8 core:
  116 insns, 72 simd compute, 24 permute, 16 vector load/store.
- `static/pixel-sa8d-16x16.json` — 16x16 core: 481 insns, 291 compute,
  97 permute, 86 vector load/store.
- Semantics library: `optimizer/targets/aarch64/semantics.py` + unit tests
  (`test_semantics.py`), covering usubl/add/sub/trn/zip/sabd/abs/umax/uaddlv
  and the seed rounding identity.

llvm-mca does not support AArch64 (LLVM 18.1.3), so cost data comes from PMU
and dedicated op microbenchmarks; `sa8d-seed-ops.yaml` tracks measured values.
