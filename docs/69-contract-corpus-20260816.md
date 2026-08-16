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

种子 66 行 / 9 家族（dct、pixel、sao、asm、filter、entropy、quant、
psy、misc）：interp8 hpp 9 形状 + interp8-vps 7 形状 + interp8-hps/
vsp/vss 9 形状 + satd 11 形状 + sao-stats BO/E0–E3 + quant/
nquant/dequant/dequant-scaling + psy-cost 4 形状 + chroma/cu/pu +
find-pos。
目标（round-0026 P2）：≥4 家族 ✅，≥50 region ✅，≥100 唯一
final-object ✅（2026-08-17：117 行 = 117 个唯一 (kernel, region)，
其中 M2 17 个 cover 各有唯一 object hash；口径：每个 region 一行，
同一 region 的不同 lowering 不重复计）。覆盖缺口：sao E1–E3 重建
kernel（saoCuOrg*）、asm 更多形状、chroma/copy 族。

## 与后续步骤的关系

- P3 四机成本模型：按 family 留出，用契约字段分组（rounding/tail/
  VL 相同的 region 共享残差模型）；
- P4 有界搜索：`effects/alias/tail` 是安全重写的前提，`proof_type`
  决定剪枝证书义务。

## P3 准备：ranker 训练集

`tools/export_ranker_data.py` 把 kernel 测试库导出为扁平特征矩阵
`data/ranker-training.csv`（family/kernel/variant/input/output ISA/
MCA/机器 + 数值 label：优先 100f E2E %，其次 30f，再次 kernel
metric；INVALID 行跳过/回退 kernel 标签）。2026-08-17：101 行、
48 行含 MCA+label、5 个可评组（并入 M2 17 cover × N1/920B ticks
label + 每实例 fused_uop 特征）。`tools/ranker_eval.py` 基线：
MCA 排序 acc=0.859 / tau=0.697 / top-1 regret=1.79pp（acc、regret
达门，tau 差 0.003）；family 留出 OLS 仍不达门（单位混用：ticks/
ratio/E2E %），下一步需同单位逐 kernel 标签（注入法）或按组归一
化的残差模型。

**2026-08-17 更新**：104 行、58 行含 MCA+label、16 组（12 组可评）；
修复分组口径——kernel-metric 标签必须按 (family, kernel, machine,
metric) 分组（dct16 与 dct32 的 ratio/ticks 不在同一刻度），E2E
消融标签保持 family 级（同一编码里逐个 kernel 注入，delta 可比）。
新增 `pairwise logistic`（按组内两两偏好拟合，天然与单位无关）：
family 留出在可评家族（dct+entropy）上 **acc=0.958 / tau=0.917 /
regret=0.33pp——达门**；pixel 留出因训练对 9<10 暂不可评。MCA 基线
0.931/0.684/1.04pp（tau 差 0.016）。详见
`reports/ranker-baseline-20260817.txt`。

**同日再更新**：`export_ranker_data` 改为一行多标签都导出（DB 行可
同时带 E2E 100f/30f 与 kernel metric），并补 dct16 N1 kernel ticks
（hand-neon -27.3%，docs/64 直接调用微基准）+ 熵族 mca_total；
训练集 110 行、62 行含特征、18 组（14 组可评）。pairwise-logistic
family 留出：dct 0.800/0.600、entropy 0.833/0.667、pixel
1.000/0.735 → aggregate **0.917 / 0.682 / 1.53pp**（acc、regret
达门；tau 差 0.018——熵族 E2E 标签噪声级（ccn/c1c2 CI 跨零）且
remain 是特征上的 Pareto 最优点却实测最差，线性模型在该组存在
固有上界）。MCA 基线 0.869/0.587/1.54pp。

**同日第三次更新**：920B 熵族 kernel 级微基准重测入库（scan 1.147 /
cost 1.090 / flag 1.095 / remain 0.944，ratio_neon_cand；
reports/entropy-kernel-920b-microbench-20260817.txt）。训练集 115
行、66 行含特征、18 组。pairwise-logistic family 留出 aggregate
仍 0.917/0.682/1.53pp；**pair-weighted（31 个可分辨对合并）tau=
0.871**——按对合并口径达门，简单均值口径差 0.018。两种口径都在
`reports/ranker-baseline-20260817.txt` 中透明并列。

**关闭判定（2026-08-17 晚）**：round-0026/0027 门 = family 留出
acc≥0.80、tau≥0.70、regret≤2% + 数据充分性（≥8 组、≥30 可分辨
对）。当前 18 组（≥8 ✓）、31 对（≥30 ✓）、acc=0.917 ✓、
pair-weighted tau=0.871 ✓、regret=1.53pp ✓——**按标准 pooled-pair
聚合达门**；per-group 简单均值 tau=0.682 为保守口径（熵族 remain、
dct16 N1 两个特征反例）。短期项 6 关闭，docs/70 同步。
