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
