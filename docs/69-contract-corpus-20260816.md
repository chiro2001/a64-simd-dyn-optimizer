# 契约语料库（round-0026 P2，2026-08-16 起步）

## 目的

AGO 的有界搜索要“声音地”做等价/最优推理，必须先显式记录每个
kernel/region 的语义事实：读写足迹（effects）、允许的别名（alias）、
舍入语义（rounding）、尾部/边界处理（tail）、合法向量宽度（VL），
以及当前承担的证明类型（proof_type）。这些字段决定搜索能安全
重写/剪枝什么，也是四机成本模型与弃权 ranker 的输入（round-0026
路线 P2→P3）。

## 数据

- 权威：`data/contract-corpus.csv`（一行 = 一个 kernel/region）
- 工具：`tools/contract_corpus.py`（add/query/export-md）
- 生成摘要：`data/contract-corpus.md`

字段：

| 字段 | 含义 |
| --- | --- |
| family / kernel / region | 家族、kernel、形状（如 64x1、CG16） |
| input_isa / output_isa | 输入来源与 lowering 目标（c/neon/sve1/sve2…） |
| vl_supported | 合法 VL（如 128;256），VL 依赖点记 notes |
| effects | 内存/状态足迹（read/write/accumulate/state） |
| alias | 允许的别名（none/src-dst disjoint/ctx in-place…） |
| rounding | 算术语义（exact / saturating narrow / rounding shift…） |
| tail | 尾部与边界（无 tail / edge guard / CG 边界 / adapter 回退） |
| dataflow_kind | 数据流形态（butterfly/fir/hadamard/reduce/fsm/table…） |
| proof_type | 承担证明：upstream-exact / exhaustive-table / SMT / test-obligation |
| correctness_gate | 现有门禁证据（20k diff / TestBenchLite / 生产逐调用 / E2E bit-exact） |
| status | gated / measured / injected / invalid-note |
| notes | 关键事实（收益、策略、坑） |

## 使用与维护（agents 强制，AGENTS.md §2 同款规则）

1. 新 kernel/region 进 DAG/门禁前，先 `add` 一行契约（没有契约的
   搜索声明视为未完成）；
2. 修改语义（舍入/tail/别名）必须更新行并跑门禁；
3. `add` 后 `export-md`，与代码/报告同一 commit；
4. proof_type 按 round-0026 口径：有限域最优=exhaustive/B&B 证书；
   bit-exact= SMT/穷举；排序/性能只给统计界，不写进 proof_type。

## 现状与目标

种子 17 行 / 6 家族（dct、pixel、sao、asm、filter、entropy）。目标
（round-0026 P2）：≥4 家族 ✅，≥50 region，≥100 唯一 final-object；
覆盖缺口：interp8 其余 6 形状、sao E1–E3、satd/asm 其它形状、
quant/dequant/psy-cost 等。

## 与后续步骤的关系

- P3 四机成本模型：按 family 留出，用契约字段分组（rounding/tail/
  VL 相同的 region 共享残差模型）；
- P4 有界搜索：`effects/alias/tail` 是安全重写的前提，`proof_type`
  决定剪枝证书义务。
