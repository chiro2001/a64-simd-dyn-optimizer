# M2 seed import artifacts

Source: x265 `b81f650e21e8aacbe6a9ad04ce14aefc05b932c0`,
`source/common/aarch64/pixel-prim.cpp`, compiled with Clang 18.1.3 at `-O2`
with the same macro set as the frozen 8-bit GCC build.

## Contents

- `llvm-ir/sa8d-8x8.ll` — extracted `sa8d8_neon<8,8>` LLVM IR (201 lines).
- `llvm-ir/sa8d-16x16-core.ll` — extracted `pixel_sa8d_16x16_neon` core.
- `imported/machine-ir.json` — MachineIR nodes from the restricted-IR importer
  (`kernels/sa8d/import_seed.py`).
- `imported/pack-ir.json` — PackIR projection for loads + first sub stage;
  deeper stages still need full lane provenance.

`pixel-prim.ll` (full module) is regenerable and gitignored.

## Import status (8x8 core)

MachineIR: 167 nodes

```text
load 16 | zext 16 | sub 24 | add 24 | shuffle 24 | bitcast 32
intrinsic: abs 4, sabd 4, umax 4, uaddlv 1 | lshr 1 | ret 1
scalar addr: addr 14, shl 2
```

All nodes have recognized opcodes; no opaque instructions. PackIR verifier
passes on the current (loads/sub-only) projection. Next step: full lane
provenance for butterfly/shuffle/reduction stages and roundtrip codegen.
