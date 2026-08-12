# M25-DCT8-Harness-Fix：修正微基准测量缺陷并用修复后的 harness 复测 M22

- run-id: `m25-dct8-harness-fix`
- state: `accepted`（测量方法修复；M22 定性结论不变，全部仍 <1）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地 x86 交叉 + qemu、N1、920B

## 1. 修了什么（round-0006 §2.4 的欠账）

`benchmarks/dct8_microbench.cpp`：

1. 输入分布 off-by-one：`(rng() & 0x1FF) - 255` 实际是 [-255,256]，
   改为 `rng() % 511 - 255`（真 uniform [-255,255]）；
2. latency 序列偏置：不同实现此前跟随不同输入链（sel 依赖各自输出），
   现在 Corpus 构造时用 C==NEON（cand 链接时还要求 cand==C）预筛所有
   CORPUS 条目，所有实现遍历同一输入序列；
3. throughput 单输出缓冲的 WAW 串行：改为 4 路独立 dst 轮转；
4. 2D origin 修正为 `oy*STRIDE + ox`；latency 输出缓冲显式清零，消除
   `empty` 实现的未初始化读取 UB。

同时把 `kernels/dct8/dct8_verify.cpp` 与
`kernels/dct8/upstream_contract.cpp` 的 uniform 探针改成同样的真
[-255,255] 分布。

## 2. 修复后的分歧率（20 万例）

- 上游 `dct8_neon` vs C：**1736/200000（0.868%）**（此前 [-255,256] 下
  1821/200000）；stride 8/16/17/32 分别为 442/455/412/494（自备 oracle
  200k）或 uniform 模式 1736；
- 上游 `dct16_neon` vs C：**9/200000（0.0045%）**（此前 7/200000）；
- dct4/dct32 仍为 0。

M21 的数字已按此修订。

## 3. 复测 M22 五候选（paired latency，90 pairs，ns，median neon/cand）

| 候选 | N1 旧 | N1 新 | 920B 旧 | 920B 新 |
| --- | ---: | ---: | ---: | ---: |
| widen | 0.8946 | 0.8775 | 0.9982 | 0.9567 |
| widen-shift64 | 0.8906 | 0.8858 | 0.9971 | 0.9566 |
| widen-wide_load | 0.8638 | 0.8648 | 0.9719 | 0.9571 |
| widen-tree_to_mla | 0.8876 | 0.8685 | 0.9823 | 0.9507 |
| widen-wide_load-tree_to_mla | 0.8771 | 0.8535 | 0.9780 | 0.9530 |

数值因“同序列 + 真分布 + 干净 dst”而移动，但全部仍 <1 且 CI 上界 <1：
M22 的“结构 rewrite 无性能突破”结论不变。

## 4. 结论

- 测量方法修复通过，后续所有 DCT8 性能证据应使用本 harness；
- 修复不改变任何性能判定，仅让证据更可信；
- 上游分歧率更新为 0.868%（dct8）/0.0045%（dct16）。
