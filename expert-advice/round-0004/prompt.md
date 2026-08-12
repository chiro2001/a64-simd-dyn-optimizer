# Round 0004: typed TRN lowering 与 raw 16x16 helper 的审阅

你是 AArch64/SVE2/编译器优化审阅者。请只读审阅，不要修改仓库；最终建议
写入回复。

## 背景

上一轮（round-0003）建议：把 MachineIR 中 24 个 shuffle（恰为 i16/i32/i64
三种粒度的 TRN1/TRN2，六种 mask 各重复四次）直接 lowering 为 SVE
`svtrn1/2_*`，并新增 raw half-R8 x2 helper。M9 已实现并验证：

- `optimizer/ir/codegen.py`：`_sve_trn_spec()` 识别六种 mask，生成
  `svtrn1/2_u16/u32/u64`（u32/u64 零成本 reinterpret）；未知 mask 保留
  `svtbl2` 回退；`raw=True` 时 pack=2 跳过 `+1>>1`，返回两块 half-R8 之和。
- 新增 `dynopt_sa8d_8x8x2raw_neon_sve2`；`sve_verify.cpp` 抽出
  `sa8d8_raw()`（完整 R8）并验证 raw 期望值 `(R8_A+R8_B)/2`（先断言偶数）。

结果（`experiments/m9-sve-trn/`）：

- 正确性：QEMU VL=256 与 VL=512 各 10 万例，single/x2/x2raw 全部
  0 mismatch。
- 静态指令（-O2，独立 .o 计数）：
  - single：117 total / 101 SIMD（1 × 8x8）
  - x2：125 / 103（2 × 8x8，每 tile 62.5 / 51.5）
  - x2raw：116 / 101（2 × 8x8，每 tile 58 / 50.5）
  - 相对 M8 每 tile（148.5 / 112.5）：x2 -58% total / -54% SIMD；
    x2raw -61% / -55%。
- 索引机制（48 ld1h + 24 mad + 24 tbl + adrp 常量地址）全部消失，
  只剩 12×trn1 + 12×trn2 + 算术。

一个值得注意的编译器行为：x2raw 源码有两条 `svaddv`（前缀半和 + 全和，
再相减），但 -O2 汇编只出现 1 条 `uaddv` + 1 条 `mov` + 1 条 `whilelt`，
疑似编译器把 lane 重排后做了一次归约。

## 请回答

1. 对“typed TRN 等价且静态大幅下降”结论的反驳或确认；独立 .o 的静态
   计数作为筛选指标还缺什么（生产 flags、final linked symbol、spill、
   QEMU guest 动态指令）。
2. 最可能被遗漏的 correctness/ABI/VL 风险：raw helper 的
   `(R8_A+R8_B)/2` 合同与 16x16 统一舍入组合、两次 x2raw wave 的地址/
   footprint、编译器把两条 uaddv 合成一条的信任边界（跨 GCC 版本/优化
   级别是否稳定）、VL<256 静默错误、guard-page/负 stride/恰好边界。
3. 按信息增益排序的 1–3 个下一轮实验，重点评估：
   - 两个 x2raw wave 组合成合法 16x16（顶部两 tile + 底部两 tile，统一
     `(sum+1)>>1`）；
   - 零号门禁（guard-page/ASan、实际 `svcntb()` 日志、QEMU guest 动态
     指令计数、生产 flags 最终 symbol）；
   - 是否值得继续在 SVE 静态候选上投入，还是按 round-0003 结论冻结
     M6 并转向 DCT8/interp8（N1 可实测）。
4. 明确区分：事实 / 推断 / 需实验验证。

## 上下文文件（路径已核实）

- `experiments/m9-sve-trn/iteration.md`、`manifest.yaml`
- `experiments/m9-sve-trn/static/sve1-insns.txt`、`sve2-insns.txt`、
  `sve3-insns.txt`
- `experiments/m9-sve-trn/correctness/vl256-512-qemu-100k.log`
- `optimizer/ir/codegen.py`（`_sve_trn_spec`、`raw` 尾部）
- `generated/sa8d/sve_roundtrip_sa8d_8x8.cpp`、`_8x8x2.cpp`、
  `_8x8x2raw.cpp`
- `kernels/sa8d/sve_verify.cpp`（`sa8d8_raw`、x2raw oracle）
- `experiments/m8-sve-pack/iteration.md`（M8 基线）
- `expert-advice/round-0003/response.md`、`decision.md`
- `docs/03-sa8d-end-to-end.md`（16x16 舍入合同）、
  `docs/04-validation-benchmark.md`（计数/门禁规范）、
  `docs/05-roadmap.md`（M6 退出条件）
