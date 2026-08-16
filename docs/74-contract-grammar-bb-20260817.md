# 契约 grammar 与有限 B&B 搜索设计（2026-08-17）

对应 round-0028 建议 1（契约驱动生成，改“搜什么”）与建议 3（有限
B&B + 主动测量，改“怎么选”）。本文档给出设计、验收门与首个可运行
原型；状态：设计 + 原型已落地，真实生成器接入待做。

## 1. 契约 → grammar 映射（搜什么）

每个 region 的契约语料（data/contract-corpus.csv：effects/alias/
rounding/tail/VL/proof_type）先过滤掉非法组合，再展开为合法 lowering
grammar。合法操作按族划分：

| 族 | 合法操作集（grammar 非终结符） | 契约过滤项 |
| --- | --- | --- |
| satd/sa8d | 差分 load、abs/复制、Hadamard 归约树（pair/quad/oct）、
  sdot/dot-fusion、窄化+饱和、lane 分配、尾块 | rounding、tail、
  VL（8x8/16x16 宽度无关 DAG） |
| dct（16/32） | 常量乘、butterfly-quarter 模板、dot/sdot、tbl2↔zip、
  归约树、pass1/pass2 边界、k≡2mod4 quad-form | rounding（有舍入
  恒等才允许）、VL（8/16-lane）、alias（in-place 约束） |
| saoCuOrg（E0-E3/B0） | tbl 查表、edge/band 符号递推（1-lag 差分或
  insr 链）、128 偏置 clip、尾部谓词 | tail（E3 x=2..63、B0
  height%4）、effects（upBuff 写集） |
| interp8 hpp i8mm | matmul 2x8×8x2（vusmmla/svusmmla）、permute
  表、coeff2 correction、4 行批处理、W≥32 perm 复用 | alias（独立
  src/dst）、tail（宽度 4 尾）、rounding（vqrshrun） |

每 region 候选预算：64（round-0028）。生成顺序：先按 ISA/VL 过滤，
再按契约约束去重（canonical key），最后才进测量。

## 2. 有限 B&B（怎么选）

目标：在 grammar 状态空间上求“给定代价函数的域内最优”，并把
候选筛到可实测规模，而不是全枚举。

### 状态与转移

- 状态 = 部分 lowering：DAG 前缀 + 已选操作序列（含 lane 分配/布局
  决策），canonical key（对象哈希/去重后的等价类）用于去重；
- 转移 = 应用一个合法操作（pack/load 合并/归约树/dot/fusion/
  unroll/predicate-tail）；
- 代价 = fused_uop（静态）为主、关键路径/访存/peak-live 为辅助特征
  （对 710/950 再套四机成本模型，round-0028 建议 2）。

### 可采纳下界（必须 ≤ 真代价，否则会错剪）

对剩余 DAG 取三个下界的最大值：
1. 关键路径下界：剩余依赖链上不可并行的最小操作数 × 最小操作周期；
2. 资源吞吐下界：剩余 vector 操作数 / 每周期最大发射；
3. 访存下界：剩余必需 load/store 数 × 最小访存周期。

下界在每次转移后增量更新；若 `代价 + 下界 ≥ 当前最优`，剪枝。

### 主动测量

- 只对 Pareto 前沿（按不确定度排序）上机实测，而不是全测；
- 小域先与全枚举对照（验收见 §4），通过后才在大域启用。

## 3. 原型：tools/bb_search.py（已落地）

- 合成域：归约树 lowering（satd/sa8d 风格），状态 = 组大小多重集
  （canonical 排序），操作 = pair/quad/oct（arity+cost），代价可加；
- 实现：全枚举（DFS + 每状态最优到达代价去重）与 B&B（best-first
  + 可采纳下界 + 状态级剪枝）；
- 验证：tools/test_bb_search.py 4 项单测（确定性最优性、随机
  40 实例无误剪、下界可采纳性 200 例、merge canonical）；
  `--instances 200`：0 失配，B&B 状态 2144 vs 全枚举 3234
  （1.51x 节点减少）。
- 诚实边界：合成域的节点减少依赖代价异质性；真实 grammar 需把
  生成器参数轴显式化并接入 fused_uop oracle 后重测，节点减少未必
  立即 ≥2x。

## 4. 验收门（round-0028，真实域）

在 satd8 8x8 小域（先显式化 satd8/sa8d 生成器参数轴）：
1. B&B 最优与全枚举最优**对象哈希一致**；
2. **无误剪枝**：B&B 找到的最优 == 全枚举最优（随机实例 0 失配）；
3. 节点减半（B&B 展开状态 ≤ 全枚举/2），或同 regret 下实测候选
   减少 ≥30%；
4. 未达门则回退 beam 搜索，~100 组后再议 bandit。

## 5. 下一步

1. 把 m30 satd/sa8d 生成器的 compute/fusion/permute/lane-assign
   轴显式化为 grammar（每个轴一个非终结符），用 §2 的状态机枚举；
2. 接入 fused_uop 静态 oracle（static_counts）作为代价函数；
3. 跑 §4 验收（satd8 8x8 小域），产出对照报告并入库；
4. 通过后推广到 dct16/32 的 butterfly-quarter 模板空间与 saoCuOrg
   布局空间。
