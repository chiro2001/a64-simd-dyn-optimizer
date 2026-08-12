# M16-DCT8-ProtoC：全宽加载 + coef 往返转置 + 树形奇数列（原型 c）

- run-id: `m16-dct8-protoc`
- state: `rejected-performance`
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地交叉 + N1 + 920B

## 1. 假设

全宽 128-bit stride 加载（8 lane/行）、两 pass 之间走 coef 内存缓冲（免
显式转置）、奇数列保持树形 `vmul+vpaddq` 归约（N1 友好），可净赚指令数
与周期。显式寄存器 8×8 转置（vtrn 三阶）实测产生位反转序置换，判定成本
过高，已放弃。

## 2. 结果

- 正确性：cand==C 本地 20 万例、N1/920B 各 2 万例 0 mismatch。
- 静态：254 total / 118 SIMD（widened 347、proto_b 229、上游 341）。
- paired latency（cntvct）vs 上游 NEON：
  - **N1：0.829×**（CI [0.800, 0.843]）
  - **920B：0.953×**（CI [0.944, 0.964]）
- paired throughput：N1 0.837×、920B 1.036×。

## 3. 归因与三原型总账

| 候选 | 静态 | N1 latency | 920B latency | 920B tp |
| --- | ---: | ---: | ---: | ---: |
| upstream NEON | 341 | 1.000 | 1.000 | 1.000 |
| widened (a) | 347 | 0.891 | 0.981 | - |
| proto_b (b) | 229 | 0.858 | 1.019 | 0.993 |
| proto_c (c) | 254 | 0.829 | 0.953 | 1.036 |

无一达到 round-0006 止损线（中心 >1.05 且 CI 下界 >1.00）。proto_c 的
`res[][]`+`vcombine` 与每次 `vmovl_s16` 常量提升在 N1 上引入额外代价，
全宽加载收益被抵消。结论：**上游 NEON 局部 peephole family 止损**。

## 4. 下一步（止损后 pivot，按 round-0006）

转 range-aware fixed-point 成本模型：实现 docs/09 的资源下界模型
（mul/mla、addp、permute、narrow、load/store、关键路径按目标 CPU 权重），
用本轮 12 组实测（3 候选 × 2 机 × 2 模式）校准；再试寄存器常驻分解、
双块 DCT8 批处理或跨 primitive 融合。若内部 30-60% 实现可给反汇编/指令
直方图，优先用于校准搜索空间。

## 5. 成本模型 v0 校准结论（本里程碑内完成）

`optimizer/analysis/cost.py`（资源分类 + cycles_lb 骨架）与
`tools/calibrate_cost.py`（线性拟合）已实现并用 4 候选 × 2 机 latency
实测校准：**线性吞吐模型 R²<0**（N1 各候选 2.3~3.2 ticks、920B
6.0~7.1 ticks，与 229~347 的静态指令数几乎不相关）。证据：
`calibration-data.json`。结论：latency 由依赖链关键路径主导（N1 上 mla
四深链），v0 只有资源/前端项，下一增量必须加 `critical_path_latency`
依赖图估计器；在此之前不得用线性模型排序候选。

## 7. range-aware 值域分析（止损后 pivot，本里程碑内完成）

`optimizer/analysis/range.py` + `tools/range_analysis.py`：对 MachineIR 做
前向整数区间传播（load 合同范围、常量表精确解析 `const_name/const_off`、
sext/add/sub/mul/shl/shuffle、smull/addp/rshrn 语义），任何计算区间超出
存储类型位宽的节点标记为 overflow risk。

对 dct8 seed（380 节点）静态扫描：**精确命中 8 个 pass2 O 的 s16 `sub`
（id 203/204/218/219/233/234/248/249）+ 6 个传播它的 rev64 shuffle**；
其中 4 个（奇数列系数，smull 精确常量）得到**精确上界 [-65280,65280]**，
其余 4 个（偶数列，区间乘上近似）为保守上界。pass1 无假阳性。此前这一定
位需要 20 万例差分；现在 `range_analysis.py` 一步静态复现（回归测试
`optimizer/analysis/test_range.py::test_dct8_seed_flags_pass2_o_subs`）。

这是 round-0006 建议的 range-aware fixed-point IR 的核心；已知限制：朴素
区间对乘/加链上近似（保守），下一增量可对 dot-product 归约做
`Σ|g_i|·max|O_i|` 紧界跟踪。

## 8. 闭环：范围驱动的自动宽度修复

`optimizer/ir/rewrites.py::widen_overflows()` 以值域分析结果为输入，自动
把每个溢出的 s16 `sub` 提升到 s32（操作数 sext + 消费者 smull→mul），不再
依赖 M14 手写的 rshrn 模式。对 dct8 seed 二者输出**逐节点一致**（428
节点，`test_range_driven_matches_pattern_on_seed` 回归）。`gen_roundtrip.py
--widen-overflow` 可生成同样 C-exact 的候选。这完成
“值域分析 → 自动宽度修复 → C-exact 候选”的通用工具链闭环：位宽 bug 从
“差分偶然发现”变成“静态检测 + 自动修复”，对任意 kernel 适用。

## 6. 关键路径估计器 v0（本里程碑内完成）

`optimizer/analysis/critical_path.py` + `tools/critical_path.py`：从反汇编
建寄存器+栈槽（`sp#offset`）def-use 图，按逐指令延迟表算最长前向链。
4 候选（本地 GCC16 反汇编）：

| 候选 | 关键路径 | N1 实测 ticks | 920B 实测 ticks |
| --- | ---: | ---: | ---: |
| upstream | 40 | 2.30 | 6.92 |
| widened | 44 | 2.59 | 7.06 |
| proto_b | 34 | 2.94 | **6.05** |
| proto_c | 50 | **3.17** | 6.48 |

种子延迟表下：920B 排名（proto_b 最快、proto_c 次快）基本吻合；N1 上把
proto_b 排成最快（实测第二慢），说明 N1 的 s32 标量 mul/mla 延迟高于
920B——**按机器拟合逐指令延迟**是下一增量（4 点对 30 个 mnemonic 欠定，
优先拟合 mul/mla/addp/rshrn/trn/zip 六个家族）。单测覆盖解析/栈槽链/最长
路径（`optimizer/analysis/test_critical_path.py`）。
