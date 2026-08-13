# round-0014 verification plan

目标是证明加速只改变“完成时间和重复工作”，不改变正确性、计数口径、候选排序或可恢复性。所有实验均在仓库内现有本地 x86 + 交叉 g++/QEMU 环境执行；不读取或依赖 `/tmp` 及仓库外参考源码。内部 DCT16/DCT32 只引用 `docs/18`、`docs/20` 的聚合数字。

## 1. 固定基线和证据分层

建立一份不可变 baseline manifest（只读记录，不改源码），至少包含：

```
git/worktree snapshot id（以及明确记录已有 dirty files）
kernel, backend, contract, VL
rewrite/layout enumeration rule
compiler path + version + flags
QEMU path/version + -cpu/-L 参数
verify corpus cases, seed, strides, value range
trace parser/metric schema
MCA version, cpu, iterations
```

基线分三层保存：

1. **语义层**：原始枚举键、canonical key、source SHA-256、alias 集；
2. **正确性层**：build/link/verify return code、mismatch 数和 stdout 摘要；
3. **性能层**：动态 total/vector/movprfx/scatter/stack/fused 计数、MCA 字段、每阶段耗时和 artifact hash。

不要把旧结果目录中的临时生成物当成新基线；当前工作树可能有后台实验文件，比较时按本次运行的 manifest 和 full hash 隔离。

## 2. 并行化的等价性测试

### 2.1 W=1 回放

先让新 coordinator 以 `workers=1, trace-workers=1, mode=exhaustive` 运行 DCT16/DCT32 各一遍，使用与旧脚本相同的枚举顺序和 full cases。逐项检查：

- source SHA 集完全相同；
- 每个 source 的 build/link/verify/trace 状态相同；
- 通过项的 mismatch、动态计数和 scatter/stack 计数相同；
- best、按 fused 主指标的排序和 Pareto 前沿相同；
- 失败项不因新的异常处理变成“成功”。

允许差异：JSON 的字段顺序、日志到达顺序、别名展示顺序（只要按稳定键排序后相同）。不允许差异：源码 hash、计数、门禁状态或最优候选。

### 2.2 并发扫描

对 `W=1,2,4,8,12` 重复同一 exhaustive manifest，至少三次冷缓存和一次 warm-cache。记录：墙钟、CPU 利用率、RSS、写入字节、QEMU 非零退出/超时、重试次数。验收建议：

- `W=8` 相对 W=1 speedup ≥5×（机器核数不足时记录饱和点）；
- 通过 source 的计数逐 hash 相等；
- 没有两个 worker 产生同一 hash 的不同 artifact；
- 随机完成顺序不会改变合并后的 best；
- 强制 kill coordinator 后重启，过期 lease 被回收，已完成任务不重跑。

并发下若计数变化，先排查 QEMU 固定 VL、trace 文件路径和 parser，再谈性能；不能用“统计噪声”解释功能/动态计数差异。

## 3. 正确性门禁（短/full 两级）

### 3.1 短门禁召回实验

对旧全集的每个 candidate 先跑 2k cases，再跑 20k cases；把 2k 结果当分类器，形成四格表：

| 2k | 20k | 处理 |
| --- | --- | --- |
| fail | fail | 可短路，记录原因 |
| pass | pass | 进入 trace |
| fail | pass | **false negative，硬失败** |
| pass | fail | full gate 淘汰，记录短门漏报 |

目标是 upstream-exact 和 legacy 两种合同都 `fail→pass = 0`。legacy 特别加入固定边界向量、±255、stride 16/17/32 和已知回绕触发样本；随机 2k 为筛选，不是最终证明。

### 3.2 Full correctness

所有进入动态计数的候选仍跑 manifest 的 20k 差分。最终保留项再跑更大 corpus、x265 TestBenchLite，必要时完整 TestBench。记录 `returncode==1` 的 legacy 预期情形与 mismatch rate，不把它误报为进程崩溃。

验证器生成源必须以 contract/corpus hash 参与缓存键；修改 cases、seed、VL 或 reference library 后，旧成功结果不得命中。

## 4. Rewrite 依赖剪枝的完备性证明

将旧的 up-to-four 槽枚举视为 reference universe。对每个被剪掉的序列保存：

```
原始序列
触发的 requires/conflict/idempotent 规则
规范代表（若映射到已有 source）
证明类型：no-op / commutation / invalid / build-fail
```

逐条做以下审计：

1. **source 覆盖**：旧全集中每个成功 source SHA 都有一个保留的 canonical representative；
2. **失败覆盖**：确定性 build/link/semantic failure 的规则与旧错误一致；临时 QEMU/IO failure 不得用算法规则剪掉；
3. **依赖顺序**：`k0_even_sve` 的代表必须含并先应用 legacy k2/k4；DCT16 `legacy_even_sve` 至多一次；
4. **幂等性**：重复 rewrite 若声称 no-op，需比较前后 IR/source hash，而不是只看函数返回；
5. **顺序敏感性**：对未证明可交换的 rewrite 保留两个顺序，比较 source/计数后才能合并。

剪枝 Go 门槛：旧全集的成功 source 覆盖率 100%，旧 best source 不丢失；若只证明“当前已知 best”而非全覆盖，只能在 explore 模式启用。

## 5. Cache 和增量搜索测试

### 5.1 命中/失效矩阵

用一个小的 DCT16 子集和一个 DCT32 子集测试以下变化：

| 变化 | 预期 |
| --- | --- |
| 仅重排原始 seq、source 不变 | 命中同一 source artifact |
| 改 manifest contract/cases/seed/VL | verify cache miss |
| 改 compiler flag/version | object/link cache miss |
| 改 QEMU CPU 参数 | verify/trace cache miss |
| 改 parser metric schema | trace count cache miss |
| 重新启动、已有 permanent failure | 不重试 |
| timeout/截断 log | 有限重试，不能永久命中 |
| 中途 kill 留下 RUNNING lease | 下次回收并重做 |

每次命中都校验完整 hash；短 hash 仅用于文件名/显示，不能作为唯一安全身份。

### 5.2 增量覆盖

在已有 cache 上只新增一个 rewrite/一个 layout axis，确认旧 source hash 不重新编译、不重新 verify/trace；新增 child 即使父节点已通过，也必须有自己的 correctness/count 记录。结果合并后旧候选的排序应逐 hash 不变。

## 6. MCA/静态漏斗安全性

先把 MCA 当软排序器，不能直接硬淘汰。使用旧 exhaustive 结果做离线回放，针对 `K ∈ {5,10,20,50,100%}` 计算：

```
dynamic_best_recall@K
top-10 overlap
Spearman/Kendall（仅描述，不作为正确性门）
false-negative count
```

由于 `docs/20` 已有 MCA 与实机周期排序不一致的记录，只有在动态 best 召回率 100%、且至少跨两个 kernel/合同稳定时，才允许在 explore 模式硬剪；exhaustive 模式永不因 MCA 丢候选。MCA 的对象反汇编、`.mca.s` 和版本指纹必须缓存，避免每次重复生成。

静态 reject 只允许使用可证明约束（ISA 不支持、符号不存在、scatter policy 明确禁止、IR provenance 失败）；“预计 fused 较高”只能排序。

## 7. Trace fast path 等价性

对至少 10 个代表候选覆盖：upstream/legacy、零/非零 scatter、不同 row_group、含 spill、build 失败和空 trace。对同一个 raw QEMU log 同时运行旧 `parse_qemu_trace.py --exec --json` 与新流式计数器，逐字段比较：

`total, vector, movprfx, vector_fused, scatter_gather, stack_vector, vector_fused_uop`。

目标为完全相同；再用 3 次独立 QEMU 运行确认 raw log 本身没有因并发改变。成功候选可不保存完整 JSON，但 debug/replay 模式必须能从保存的 raw log 重建它。

特别记录本轮口径：用户要求 gather/scatter 不进入优化目标；历史 `+3×sg` 折算仍可作为兼容诊断列。测试脚本应同时比较 `fused_adj` 主列和历史兼容列，确保换口径不会无声改变 best。

## 7.1 批量 verify 的隔离实验

若实现多候选 verify harness，先在 2k 小子集上把同一候选分别放入独立 binary 与批量 binary。对每个候选比较 mismatch、return code、首个差异摘要和进程退出原因；故意注入一个失败候选，确认不会吞掉同批其它候选的结果。再以 20k 对 top-N 重复。批量 harness 不得用于 trace 计数，trace 仍必须一候选一 driver。

将批处理收益拆成 QEMU 启动/loader、输入/reference 生成、候选执行三部分计时；只有前两部分下降时才报告批处理收益，不能把候选执行时间误归因于 host 端向量化。

## 8. TestBench 和最终排序回归

对每个模式最终 top-N（至少 N=10）以及旧/new best：

1. 20k full differential；
2. x265 TestBenchLite，固定 seed 集；
3. legacy 再跑其允许 mismatch 签名和更大边界 corpus；
4. 逐条记录 source hash、compiler/QEMU 指纹、计数口径和结果。

黄金标准是 TestBenchLite/完整 TestBench；QEMU 差分是快速 proxy。若短门、MCA 或 fused 代理与 TestBench 冲突，以 TestBench 正确性为准，并把候选标为失败/需调查，不降低门槛。

## 9. 验收报告模板

每次加速实验至少输出：

```
planned / canonical / unique_sources
cache_hit / permanent_fail / retryable_fail / measured
wall_clock_total + stage_p50/p95
worker_count / trace_worker_count / CPU/RSS/IO
source_set_sha256 + result_set_sha256
correctness_false_negative_short_gate
dynamic_best_recall / ranking_changed
old_best -> new_best (primary score, sg diagnostic, MCA)
```

建议的硬门：

- exhaustive source 集和成功结果逐 hash 可重放；
- 短门 `false_negative=0`；
- 并行与串行 `ranking_changed=false`；
- cache 失效矩阵全部符合预期；
- final top-N 通过 full differential + TestBenchLite；
- DCT32 四步非 `none` 的 625 headline 候选目标 `<5 min`、DCT16 raw fixed-slot 256 候选目标 `<3 min` 作为性能目标；同时报告实际 up-to-four 键数（DCT32 781、DCT16 121）。若机器资源不足则报告饱和点和原因，不把未达标伪装成算法正确性问题。

## 10. 明确的“不能证明”事项

- QEMU trace 数量下降不等于 ARM 实机周期下降；历史 MCA/920B 分歧要求实机另验。
- 2k 随机差分通过不等于 20k 或 TestBench 通过，尤其是 legacy 稀有回绕。
- 源码 hash 去重不证明两个序列的 IR 语义可交换；需要 provenance/输出 lane 审计。
- 并行日志顺序不同不是结果变化，但任何计数/门禁差异都必须调查。
- scatter 的历史惩罚列与本轮 primary 目标不同；报告必须标明两者，不能将数字直接横比。
