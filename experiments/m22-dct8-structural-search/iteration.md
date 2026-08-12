# M22-DCT8-Structural-Search：把 M15/M16 结构选择编码进 IR rewrite 目录

- run-id: `m22-dct8-structural-search`
- state: `tool-foundation accepted / candidates rejected-performance`
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地 x86 交叉 + qemu、N1、920B

## 1. 问题

docs/11 决策点 d：把 M15/M16 人工验证过的“结构差距”（奇数行 tree↔mla、
全宽 128-bit 加载、转置）编码为 IR rewrite，让 `tools/search_driver.py`
真正展开搜索空间，而不是继续手工写原型。当前目录只有 `{widen, shift64}`。

## 2. 实现

- `optimizer/ir/rewrites.py`：
  - `wide_loads()`：相邻 `<4 x i16>` 两次加载（o 与 o+8 字节）融合为一次
    `<8 x i16>` 加载 + `vget_low/high`，删除 +8 地址节点；仅融合唯一
    consumer 的地址对；
  - `tree_to_mla()`：pass2 奇数列的 4×`mul<s32>`+3×`addp` 树 →
    4×4 转置（`vtrn1/2q_s32`+`vcombine`）+ `vmulq_n`/`vmlaq_n` 四深链
    （M15 原型 b 的结构）；系数从 g_t8 常量 load 解析，不改写 pass1 的
    smull 树；未 widen 时 no-op；
- `optimizer/ir/codegen.py`：新增 `<8 x i16>`、`vld1q_s16`、`half`
  （vget_low/high_s16）、双源 `vtrn1q/vtrn2q_s32`、`mla`（splat 常量 →
  `vmlaq_n_s32`，非 splat → `vmlaq_s32`+const pool）；
- `tools/search_driver.py`：目录扩为 `{widen, shift64, wide_load,
  tree_to_mla}`，枚举全部 16 个组合；
- 单测 `optimizer/ir/test_rewrites.py`（+5，全量 28 通过）。

## 3. 正确性证据

16 个组合全部通过 codegen→交叉编译→反汇编。含 widen 的 5 个候选链接进
`kernels/dct8/dct8_verify.cpp` 后，本地 qemu 200000 例全部
`candidate_mismatches=0`（cand == C oracle，bit-exact）。组合
`widen-shift64-wide_load-tree_to_mla` 静态 337 条（widen 347、上游 343）。

## 4. 实机性能（paired latency，90 pairs，CNTVCT/ns，median neon/cand）

| 候选 | N1 | 920B | 静态条数 |
| --- | ---: | ---: | ---: |
| widen | 0.8946 | 0.9982 | 347 |
| widen-shift64 | 0.8906 | 0.9971 | 347 |
| widen-wide_load | 0.8638 | 0.9719 | 339 |
| widen-tree_to_mla | 0.8876 | 0.9823 | 345 |
| widen-wide_load-tree_to_mla | 0.8771 | 0.9780 | 337 |

全部 <1.05 且 CI 上界 <1.00，按 round-0006 止损线**全部 REJECT**。这与
M15/M16 手工原型的结论一致：上游 NEON DCT8 的树形结构在这些机器上已经
接近其局部 peephole 下界；指令条数下降不换算为周期收益。

## 5. 结论与下一步

1. 工具目标达成：M15/M16 的两种结构选择现在是可组合、可验证、可排序的
   IR rewrite，搜索循环能自动做出真实指令选择（这是本轮主要交付）；
2. 性能仍无突破：需要内部 30–60% 参考的反汇编/指令直方图，或 N+2 实机；
3. 下一步（工具侧）：把 M22 的 5 组实机 ticks 并入 M16 的 4 组校准点，
   按机器重拟合逐指令延迟，并检查排序与实测的一致性（m16 §6 的欠定问题
   现在有 9 个数据点）；随后发起 round-0007 专家咨询。
