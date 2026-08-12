# M6-SVE2 Functional Milestone — same-IR dual-backend codegen

- run-id: `m6-sve-function`
- state: `accepted`（功能验证通过；性能待真实 SVE 硬件）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`（编译）+ `qemu-aarch64 -cpu max,sve-max-vq=4`（执行）

## 1. 本轮试图证伪什么

“从同一个 MachineIR 无法自动生成正确的 SVE2-vl256 候选”被证伪：SVE2 后端
从 8x8 seed 的 MachineIR 生成候选，在 QEMU（VL<=256）下与标量 canonical
完全一致。

## 2. 什么变了

- `codegen.py` 新增 SVE2 后端 `emit_sve_intrinsics`：
  - `svld1ub_u16` 装载 u8→u16；`svadd/svsub/svmax/svabs/svabd` 谓词运算；
  - 重排统一用 `svtbl2_u16`，索引按 `svcntw()` 动态计算 b 偏移，保证
    VL=128/256 都正确；
  - 归约 `svaddv_u16`，标量 add/lshr 保持标量；
  - 当前使用 8 个活跃 s16 lane（半向量利用率）。
- `gen_roundtrip.py` 支持 `--backend sve2`。
- 新增 `sve_verify.cpp`（标量 canonical + 随机差分）、
  `scripts/build-sve-sa8d.sh`、`scripts/qemu-sve-smoke.sh`。

## 3. 正确性证据

```text
qemu-aarch64 -cpu max,sve-max-vq=4 build/sve_verify 100000
cases=100000 mismatches=0
```

固定 stride/offset 集合、随机 u8 输入；与独立标量 W8 实现比较。

## 4. 性能状态

`blocked-environment`：N1 无 SVE，性能必须等真实 SVE2 VL=256 硬件。
当前候选是功能验证基线，半向量利用率，不宣称性能收益。

## 5. 下一轮最有信息量的一个实验

把 16 个 s16 lane 用满：处理两个 8x8 tile（或两行）的打包搜索，目标
`sve2-vl256` 每调用指令数相对 8 活跃 lane 版本减半；之后在真实 SVE2
硬件上与上游 SVE2 实现做 paired A/B。

## 产物索引

- `generated/sa8d/sve_roundtrip_sa8d_8x8.cpp`（SVE2 候选，自动生成）
- `kernels/sa8d/sve_verify.cpp`、`sve_smoke.cpp`
- `scripts/build-sve-sa8d.sh`、`qemu-sve-smoke.sh`
