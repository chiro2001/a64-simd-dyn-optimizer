# M29-Cost-Model-P0：依赖图修复后的一次性重验证 → 自动精排取消

- run-id: `m29-cost-model-p0`
- state: `accepted`（P0 门禁判定：模型不通过，永久取消自动精排）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地 x86（解析/复验用 M23 已有 N1/920B 测量）

## 1. 修了什么（round-0007 P0 指出的依赖图语义缺口）

`optimizer/analysis/critical_path.py`：

1. **MLA 类读改写累加器链**：`mla/mls/smlal/...` 的目的寄存器也是输入，旧
   解析漏掉后把 4 深 `vmlaq` 链切断（proto_b 的 odd 列链此前不可见）；
2. **寄存器视图别名**：q/v/d/s/h/b → vN，w/x → xN，`mov v0,..` 与
   `mov q0,..` 不再被当作两条不相干 live range；
3. **pair load 双目的**：`ldp x0, x1, [sp,#N]` 的两个目的都写入
   last_writer；
4. **sp 派生基址的栈数组穿越**：识别 `add/sub/mov xN, sp`，把 `[xN,#disp]`
   的访问解析成栈槽，pass1 的 coef store → pass2 的 coef load 正确成链
   （此前两 pass 的依赖完全丢失，pass2 链长被低估）；
5. 栈地址 `[sp,#N]!` 后索引解析、内存访问把基址寄存器记为输入。

单测 `test_critical_path.py` 由 4 条扩到 9 条，覆盖上述全部修复；全仓
33 条 optimizer 单测通过。

## 2. 复验协议与结果（round-0007 门禁）

数据：M25 修复后 harness 的 9 候选、N1/920B 两机 CNTVCT ticks
（`experiments/m23-dct8-cost-refit/measurements-fixed-harness.json` +
`disasm/*.txt`）。特征取少参数四项：`cp`（修复后关键路径）、`issue`
（资源类指令数）、`frontend`（总指令/4）、`spill`（栈相关 str/ldr 数）。
线性非负组合拟合，留一法 + leave-one-structure-out：

| 机器 | 全量 Spearman | LOOCV Spearman | struct-out Spearman | top-3 命中 |
| --- | ---: | ---: | ---: | ---: |
| N1 | -0.867 | -0.800 | -0.517 | 0/3 |
| 920B | -0.833 | -0.600 | -0.500 | 1/3 |

门禁要求"两机 Spearman ≥0.7 且 top-3 命中 ≥2"——**双双失败，且为负相关**
（修复后上游静态链 62 最长、实测 8756 最快；proto_b 链 34 最短、实测
13703 最慢）。9 个候选去重后只有 **8 份不同 .text**（
`widen-wide_load-tree_to_mla` 与 `widen-shift64-wide_load-tree_to_mla`
同码）。静态关键路径连粗分组都排反，说明本 corpus 的 latency 排序由
静态模型缺失的项支配（MLA 转发延迟、store→load 前递、端口/发射细节）。

## 3. 判定（按 round-0007 已定门禁执行）

1. **永久取消自动精排**：`tools/search_driver.py` 的 `--fit=` 拒绝使用，
   默认只输出"安全/静态 Pareto 粗序"（总指令数、SIMD+load 指令数）并对
   .text 去重；所有不同 .text 必须实机实测（`ranking.json` 增加
   `text_sha12`）。
2. 静态模型降级为**粗筛**（只用于剔除明显膨胀/溢出的候选），不得用于
   最终排序，也不得用于跨家族比较。
3. 后续排序证据唯一来源 = 目标实机 paired/绝对测量（N1/920B 已有；
   N+2 接入后同样适用）。

## 4. 复验工具

- `tools/p0_cost_reeval.py`：四项特征 + 两机 Spearman/top-3 + .text 去重
  报告（本轮使用的门禁复验器）。

## 5. P1 第一轮：两 pass 融合（proto_fused）——负结果

按 round-0007 P1 的第一个方向做了宏结构候选：
`kernels/dct8/candidates/proto_fused.cpp`——基于 proto_b（C-exact），
pass1 输出留在 8 个 q 寄存器直接喂 pass2（去掉 coef store/reload 往返），
odd 列仍 4 深 vmlaq、even 列上游 mul+addp。

- 正确性：qemu 20 万例 `candidate_mismatches=0`（C-exact）；
- 静态：269 条（proto_b 229、上游 341）；因 24 个 q 寄存器同时存活，
  GCC 产生 23 str + 15 ldr 的 spill，把 coef 往返换成了栈 spill 往返；
- 实测 paired latency（30×5=150 pairs，median neon/cand）：
  **N1 0.815**（bootstrap95 [0.807, 0.821]）、
  **920B 0.906**（bootstrap95 [0.903, 0.911]）——两机均显著慢于上游，
  比 M22 widen 族（N1 0.85–0.90）更差。

结论：q 寄存器融合在 32 寄存器预算下必然 spill，依赖链反而变长；与
proto_c 的测量教训一致。**P1 已用一轮、结果为负**，按 stop-loss 不再
继续同族结构猜测。

## 6. batching 调用点可行性审计（SVE256 双块 pack 的前提）

x265 pinned b81f650 的 dct 热调用点只有 `common/quant.cpp` 的
`primitives.cu[sizeIdx].dct(residual, m_resiDctCoeff, resiStride)`
（每个 TU 一次）+ psy-rdoq 分支对 fencShortBuf 的第二次调用。两者都是
**单 TU、单缓冲**，残差布局里不存在两个水平相邻的 8×8 tile；16 宽 TU
走 dct16 而不是两个 dct8。

结论：**当前 x265 管线没有 dct8 的合法连续多块调用点**；SVE256 双块
pack 若要真用，必须先改编码管线的 TU 批量处理方式（超出 kernel 级
注入范围）。在拿到内部参考实现或 N+2 实机之前，DCT8 family 的性能
搜索按 round-0007 止损线停止，转向其他 hotspot 或 DCT→quant 融合。

## 7. 双口径补测：latency 与 throughput 排序不同（2026-08-13）

此前所有 DCT8 结论都是 latency 口径。`scripts/bench-paired.sh` 增加
mode 参数后，对 proto_b/proto_c/widen/proto_fused 四候选做两机双口径
paired（150 pairs，median neon/cand，>1 表示候选更快）：

| 候选（静态指令） | N1 latency | N1 throughput | 920B latency | 920B throughput |
| --- | ---: | ---: | ---: | ---: |
| proto_b（229） | 0.843 | 0.850 | 0.949 | 0.974 |
| proto_c（254） | 0.829 | 0.864 | 0.958 | **1.040** [1.033,1.049] |
| widen（347） | 0.870 | 0.876 | 0.976 | 0.990 |
| proto_fused（269） | 0.815 | 0.863 | 0.910 | 0.960 |

结论：

1. 除 proto_c 在 920B throughput 为 **+4.0%**（CI 下界 1.033，首次有
   候选 >1）外，其余全部 <1——tier-a +30% 在两种口径、两机上仍未达成；
2. proto_c 是"宽 q-load + pass 间 q 布局"结构：它在 920B throughput 是
   正的、在 920B latency（0.958）和 N1 双口径（0.83–0.86）是负的——
   **排序随口径和机器翻转**，证实 round-0007"必须同时记录 latency 与
   四路 throughput"的判据，也说明单一微架构模型无法统一排序（P0 取消
   自动精排的决定因此更稳）；
3. +4% 未达 1.10 保留门槛，proto_c 不保留；但其"全宽 load/layout"
   方向是 920B throughput 上唯一正向信号，后续若继续 tier-a 搜索，
   应在该方向做 N1/920B 双口径复核，而不是回到 mul/addp peephole。
