# M14-DCT8-CExact：C-exact 修复（消除上游 s16 回绕 bug）

- run-id: `m14-dct8-cexact`
- state: `accepted`（正确性达成：cand==C 参考；性能待搜索提升）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地 x86 交叉 + N1 + 920B

## 1. 假设与结论

假设：把 pass2 奇数列 O 从 s16 提升到 s32（`vsubl_s16`）+ 奇数列点积从
`vmull_s16` 换成 `vmulq_s32`，可消除上游 0.87% 回绕分歧，代价是少量额外
指令。**成立**：cand==C oracle 在本地 20 万例、N1/920B 各 2 万例全部
bit-exact；静态指令 347 vs 上游 341（+6 总条数）。

## 2. 实现

- `optimizer/ir/rewrites.py::widen_dct8_pass2_odd()`：类型化语义改写
  （识别 `sub<s16>(rshrn2, rev64(rshrn2))` 模式并提升 s32；奇数列
  `smull` → `mul<s32>`，系数与 O 各加 `sext`），单测
  `optimizer/ir/test_rewrites.py`；
- `optimizer/ir/codegen.py`：两操作数向量 `mul <4 x i32>` → `vmulq_s32`；
- `kernels/dct8/gen_roundtrip.py --widen-pass2`；
- 产物：`generated/dct8/roundtrip_dct8_widen.cpp`（415 行）。

## 3. 正确性证据

```text
本地 qemu:  dct8_verify_widen 200000 -> candidate_mismatches=0
           （candidate_vs_neon=1733 = 上游 bug 位置，符合预期）
N1:         microbench cand --verify-only -> "cand == C reference on 20k"
920B:       同上通过
```

## 4. 性能（paired latency，cntvct）

| 机器 | widened cand vs 上游 NEON | 说明 |
| --- | ---: | --- |
| 920B | **0.981×**（CI [0.979, 0.983]） | +6 指令，几乎免费 |
| N1 | **0.891×**（CI [0.884, 0.903]） | s32 乘法 + 额外 vmovl 在 N1 代价明显 |

上游 NEON 对 C 的基线：N1 0.807×、920B 0.961×。因此 widened 候选对 C：
N1 ≈0.72×、920B ≈0.94×。这是"正确性合同"必须付的账，tier-a 的 +30% 必须
靠后续指令选择/布局搜索赚回来（内部参考 30-60% 余量说明上游结构本身弱）。

## 5. 下一轮

进入 DCT8 搜索：以 C-exact 为硬门禁，尝试减少 `vmull/vmul+vpaddq` 配对
链、`rev64/zip` 重排、常量复用与 pass2 奇数列的更低成本点积；round-0006
专家建议落盘后按其优先级排实验。
