# Round 0017 verification plan

本文中表内基线数字为 **[事实]**；尚未在仓库执行的新 profile 收益、阈值
和归因均为 **[待验]**；由 ABI/后端机制解释但没有消融证据的部分为
**[推断]**。任何待验项都不能因写入本计划而升级为事实。

## 口径与冻结 baseline

所有实验先冻结同一份 emitter source、reference library、QEMU CPU/VL、corpus
和函数测量范围。只有被研究的一个因素可以变化；编译器版本与完整 flags
必须写入 manifest/build fingerprint。

当前比较锚点（**[事实]**）：

| 对象 | fused_uop | stack vector 明细 | 动态 MCA | vector_lb 920B | vector_lb NP1 | correctness |
| --- | ---: | --- | ---: | ---: | ---: | --- |
| NEON upstream | 10214 | — | 3319 | 2553.5 | 2553.5 | reference |
| sdot-s32 scalar | 4704 | `ldr_z=280, str_z=280`（560） | 3518 | —（指定资料未列） | 1106 | 20k=0, lite=5/5 |
| **sdot-s32 scatter incumbent** | **5878** | **`ldr_z=355, str_z=71`（426）** | **1900** | **2510** | **1255** | **20k=0, lite=5/5** |
| pair_scatter 反例 | 5583 | 增加（需下轮报告精确值） | 1940 | — | — | 20k/lite 通过 |
| split_scatter 反例 | 6252 | 压力增加 | 1957 | — | 1367 | 20k/lite 通过 |

`sdot scalar` 的 critical-path 71 已知不可靠，不作门禁。950 数据只用于
校准；本轮代理结论不能冒充 NP1/960 实机 cycle。

## 通用验证漏斗

任何 flag、region、allocator、asm 或 zip 修复都按以下顺序。第一个失败即
停止后续性能评估并保存最小反例。

### Gate 0：构建与静态合法性

必须保存：

- 源码哈希、object 哈希、compiler path/version、全部 flags；
- `.arch`/ELF attributes，确认 sdot 候选是
  `armv9.4-a+sve2p1`；
- assembler/Clang/GCC stderr；出现 unsupported instruction、
  unpredictable `movprfx` 或 constraint warning 即失败；
- function range、frame size、`ldr_z/str_z`、stack slot 与 callee-save
  report；
- direct asm 的 allocation、bundle、ABI verifier 全通过。

固定 VL profile 还要核对 object 确由 `-msve-vector-bits=256` 构建，而不是
只在 QEMU 运行时固定 VL。

### Gate 1：footprint / guard-page

所有 SVE load/store 根据 predicate 和元素宽度计算地址集合，证明：

- 第一趟 `src` 只访问 `[0,1024)` 个 `int16_t`；
- 第二趟 `coef` 只访问 `[0,1024)`；
- `dst` 对 manifest 的 stride 32/33/64 均不越界；
- constant table 地址在声明对象内；
- planned scratch 与 spill slot 不重叠，SP 始终 16-byte 对齐。

zip32 必须增加精确大小对象后的 guard page。padding 只能作辅助：它不能
证明地址合法，也不能覆盖第一趟外部 `src` 的越界。

### Gate 2：短差分

用与 full corpus 相同 RNG 流的前 2000 例。upstream-exact 要求
`mismatches=0`。输出第一处 mismatch 的 case、row、column、expected、got，
并保存输入；不得只保存总百分比。

### Gate 3：20k upstream-exact 差分

运行 manifest 的完整 20000 例、strides 32/33/64、全 int16 输入范围：

```text
required: return code 0 && mismatches == 0
```

GCC 与 Clang 的 zip 诊断是两个独立 Gate 3，不能以一个编译器通过代替另一
个。直接 asm 至少由 GNU as 构建后跑一次；若还有 Clang integrated assembler
路径，再作为第二构建对照。

### Gate 4：TestBenchLite 黄金门

对通过 20k 的 object 运行项目固定五个 seed：

```text
1, 2, 0x12345678, 0xDEADBEEF, 987654321
```

命令形状：

```sh
scripts/build-testbench-lite.sh CANDIDATE.o build/x265-8-testbench \
  -- --gate idct32 --seed SEED
```

要求 5/5 PASS。每次确保候选 object 被重新链接；发现任一 FAIL，候选不能
进入 MCA winner 排名。

### Gate 5：true-dynamic 计数

记录完整候选范围的一次真实执行：

- total dynamic instructions；
- vector、movprfx、scatter/gather 与 uop-adjusted `fused_uop`；
- `stack_vector`，并拆 `ldr_z/str_z/ld1_sp/st1_sp`；
- stack address ops、frame、distinct slots、滑窗 stack traffic；
- SVE/NEON 向量数。

QEMU 11.0.3 会把 SVE2p1 sdot 打成 `.byte`。sdot 的 fused/count 可以在无
循环、范围严格一致的前提下使用 object static count，但动态 MCA 输入必须
用 trace-driver objdump 修复；报告中必须注明两种口径，不能把漏掉 1376 条
sdot 的 QEMU raw vector count当结果。

### Gate 6：修复后的动态 LLVM-MCA

要求：

1. 输入是 QEMU 实际执行序，不是全函数静态 objdump；
2. `.byte` 已按地址用候选 trace-driver 修复；
3. 使用包含 `SDOT_ZZZ_HtoS` 调度补丁的 llvm-mca 22.1.8；
4. `-mattr=+sve2p1 -iterations=1`；
5. 不得出现 `lack-sched` 被跳过。只允许已审计的 parse-only 跳过；任何
   sdot 缺调度即整次 MCA 无效；
6. 保存 `Total Cycles`、`Total uOps` 与输入 stream hash。

动态 MCA 是当前无 NP1 实机时的主要性能门。static MCA 只允许在 short
funnel 中粗排，scatter 已知会被 static stream 高估约 61%。

### Gate 7：920B / NP1 vector lower bound

同一个已修复 stream 同时计算：

- 920B：SVE 2×256 / NEON 4×128；
- NP1：SVE 4×256 / NEON 4×128。

NP1 相对 NEON 的结构减半门：

```text
vector_lb_NP1 <= 2553.5 / 2 = 1276.75
```

920B 不享受 2×宽度，报告其结果但不套用 NP1 的收益结论。`vector_lb` 只
表达宽度吞吐下界，不能覆盖 scatter ports、stack reload 或依赖链，所以
不能单独选 winner。

## ACLE compiler-profile 实验

### 实验矩阵

先对 sdot scalar/scatter 各运行 control 与一个单因素 profile；mul 只测
fixed256/live-shrink，保留 O2 control。

| ID | 变化 | 主要问题 |
| --- | --- | --- |
| G0 | GCC O3 current | sdot control |
| G1 | G0 + fixed256 | 固定 VL 是否减少 frame/address overhead |
| G2 | G0 + live-range-shrinkage | RTL live-range 是否是 spill 来源 |
| G3 | G0 + pressure algorithm 1 | 默认 scheduler 是否过度追求 ILP |
| G4 | GCC O2 + pre-RA schedule/pressure 2 | O3 收益是否主要来自 `fschedule-insns` |
| C0 | Clang O3 greedy current | Clang control |
| C1 | C0 + fixed256 | 同 G1 |
| C2 | C1 + PBQP | greedy 局部选择是否是瓶颈 |
| C3 | C1 + greedy deep splitting/eviction | allocator 是否因高干涉/编译预算早退 |
| C4 | C1 + ilpmin/regpressure scheduler | spill 是否由 pre-RA ILP 调度造成 |

每个 profile 先跑 Gate 0 的静态 spill report；若编译时间超过 control 5×或
预设上限，记录 `BUILD_TIMEOUT`，不继续扩大 cutoff/PBQP 预算。

### profile 接纳门

相对同 compiler、同 source control：

```text
correctness: 20k=0 && lite=5/5
performance: dynamic_mca <= control_mca
spill signal: stack_vector <= 0.90 * control_stack_vector
              OR dynamic_mca < control_mca
```

对当前 scatter，10% spill 目标是 `stack_vector <= 383`。这是“值得固化
profile”的筛选线，不是假定每个 flag 都应达到。若 stack 降而 MCA 上升，
标记为 `rejected-performance`；C4 很可能出现这一类结果。若所有 flag 的
动态 MCA 改善不足 1% 且 stack 不降 10%，结论是 backend flag 已收敛，停止
继续枚举隐藏选项。

必须同时保存 O2/O3 的 `-Q --help=optimizers` 或等价 profile snapshot，
避免未来 compiler upgrade 改默认后沿用旧归因。

## 直接 asm / allocator 验证

### IR 与 liveness 单元门

对每个 region 在 codegen 前验证：

- 每个 use 有唯一 dominating def；
- 每个 memory op 的 lane footprint 合法；
- liveness 与 last-use 由第二个朴素解释器交叉核对；
- `peak_live_z`、`overcommit_area_{24,28,32}` 可重放；
- rematerialized value 的重建语义等价；
- phase-buffer 值恰好一次定义，load 前已 store，地址不冲突。

用已有三类结构做回归：volatile C 应降低跨 chunk live；pair 应提高
peak/overcommit；split 应提高 accumulator live count。若 proxy 不能复现
这三个方向，不允许用于搜索剪枝。

### allocation verifier

打印汇编前逐指令检查：

1. 所有 simultaneous live value 映射到不同的合法物理寄存器；
2. tied operand 同寄存器；early-clobber 不与仍需读取的输入重叠；
3. low-Z encoding constraint 满足；
4. spill slot 大小/对齐正确，dirty value 在 reload 前已 store；
5. rematerialization 后原 interval 已死亡；
6. helper call 处没有未保存的 live Z/P/GPR；
7. wrapper 的保存/恢复集合与实际 clobber 一致。

随后反汇编 object，再做一次 physical def/use 检查，防止 assembly printer
或 assembler alias 改写约束。

### ABI 门

增加专用 caller harness：调用前把 x19–x29、d8–d15 的 ABI-preserved 部分
写入 sentinel，调用后逐项检查；同时检查 SP 值与 16-byte alignment。若
声明 variant PCS，再独立检查其要求的 scalable Z/P 保存集合。任何 sentinel
改变都是 correctness fail，不得靠 TestBench 恰好没使用这些寄存器掩盖。

### `movprfx` 门

每个 `movprfx` 必须：

- 与下一条 destructive consumer 物理相邻；
- destination、predicate、element type 兼容；
- 没有 label/branch/另一个 prefix 插入；
- prefix destination 不覆盖 consumer 仍需的非 tied source；
- assembler 无 unpredictable warning。

只有通过此门的 pair 才在 fused_uop 中按融合扣减。优先通过 coalescing 完全
消除 prefix，特别是 round→splice 中让输出复用已死 `n0`。

### direct asm 性能接纳门

相对当前 sdot scatter incumbent：

```text
20k == 0
lite == 5/5
unplanned_stack_vector == 0          # 首选目标
  or actual_stack_vector <= predicted + audited ABI/planned traffic
dynamic_mca < 1900
vector_lb_NP1 <= 1276.75
```

fused_uop 可以小幅增加，只要动态 MCA 明确下降；这正是避免 pair 反例的
目的。920B vector_lb 与动态 MCA 同时报告，但不把它设成 NP1 必须减半的
硬门。若 K=32 仅比 K=24 少少量 spill，需把保存/恢复 d8-d15 的动态成本
计入后再决定，不能只看主体。

## spill 代理的验证与门禁

### 方向校准集

至少用以下四个既有点校准，不需要读取或依赖未公开手写 kernel：

| 对照 | 正确方向 |
| --- | --- |
| pre-volatile C → volatile C | cross-chunk live、linear-scan spill、实际 stack traffic 均显著下降 |
| sdot single-chunk → pair | peak accumulator live、overcommit、predicted spill 上升；即使 constant load 下降也不能排前 |
| normal → split | chain depth 下降，但 accumulator live/pressure 上升；综合风险不应误判为赢家 |
| scalar → scatter | vector count/lower bound 与动态 MCA 可能分歧；代理必须保留两者而不是强行同序 |

### 排名质量

每轮保存所有通过 correctness 候选的 proxy 向量。样本足够后报告：

- dynamic-MCA top-1 是否在 cheap shortlist；
- top-3 recall；
- Kendall/Spearman 仅作描述，不作正确性门；
- “fused 改善、MCA 恶化”的 false-winner 数；
- 因 hard guard 被拒绝的候选及理由。

首个硬回归用 pair_scatter：无论其 fused=5583 多好，只要动态 MCA=1940
仍大于 incumbent 1900，就必须是 ineligible。若新的 consensus/Pareto
实现仍可能 finalize 它，工具门禁失败。

### 防止代理过拟合

- 原始字段永远落盘，单一 pressure score 只用于 shortlist；
- 不用 pair/split 同一批样本既拟合权重又声称验证成功；
- 新 family 首批候选全部跑动态 MCA，用于检查 shortlist recall；
- 只有连续两轮 top-3 recall 满足预注册阈值，才允许 pressure proxy 做硬
  prune；此前只 down-rank，不删除。

## zip32 诊断实验

按顺序执行；后一步只在前一步仍失败时进行。

### Z1：消除所有 over-read

改动概念（下一轮实现，本轮未改源码）：

- 数据行仍需 16-lane `zip1` 结果，但只从每行装低 8 个 halfword；使用
  8-lane predicate 的 zeroing load，使高 lane inactive，而不是物理读下一
  行；
- CDOT 常量仍是完整 16-lane 合法 table load；不要误把它也截成 8 lane；
- 第一趟 external src 与第二趟 local coef 都放 guard page；
- 分别构建 GCC O3 与 Clang O3；可加 mul+zip32 作为不经过 sdot row-load
  的 store-path control。

判读：

| 结果 | 结论 |
| --- | --- |
| GCC/Clang 均 20k=0 | UB 是主因；进入 lite/MCA，不再声称 RA miscompile |
| sdot 修复，mul control 也正确 | 更强地锁定 sdot row footprint |
| mul 与无 UB sdot 都错 | 转向共同 zip 集成/pressure，而不是继续 padding |
| 仅一个编译器错 | 保存最小源码与 disassembly，进入后端/constraint 调查 |

### Z2：无 UB 前提下拆成 noinline chunk

把 compute→round→zip→store 全放在一个 `noinline,noclone` chunk helper，
四个 chunk/两个 stage 之间不传 Z 值。保持算法、load predicate、常量顺序、
优化级别不变。

判读：

- inline 错、noinline 对：pressure/schedule/破坏性指令分配是触发条件；比较
  `peak_live`、frame、`ldr_z/str_z` 与 movprfx 序列。
- 两者都错：不是简单跨 chunk 活跃；进入 Z3。
- 两者都对：以动态 MCA/stack traffic 决定是否接受函数边界；调用开销必须
  计在完整 range 内。

### Z3：固定 `splice` 约束或 planned-memory control

二选一或同时做：

1. 用一条显式 tied/early-clobber asm bundle，使 splice destination 复用已死
   source0，且绝不与 source1 重叠；若需 movprfx，两条不可拆。
2. 把 32 个 narrow 列先写入明确 scratch，再由小的独立 transpose helper
   load/uzp/store，彻底移除大 kernel 中的 32-vector live interface。

若固定约束正确而 ACLE splice 错，审计两个编译器的 destructive lowering，
形成最小后端 bug；若 planned-memory 正确，说明 peak-live/allocator 是触发
因素。只有在 Z1 已证明无 UB 后，才能使用“compiler miscompile”这一结论。

## 每轮结果记录模板

```yaml
candidate: <tag>
source_sha256: <sha>
build_fingerprint: <sha>
compiler: <path + version>
flags: [ ... ]
correctness:
  guard_page: pass|fail
  diff_2k: 0
  diff_20k: 0
  lite: 5/5
pressure_ir:
  peak_live_z: <n>
  overcommit_area_24: <n>
  overcommit_area_28: <n>
  overcommit_area_32: <n>
  linear_spill_load: <n>
  linear_spill_store: <n>
object:
  frame_bytes: <n>
  ldr_z: <n>
  str_z: <n>
  planned_stack: <n>
  abi_save_restore: <n>
dynamic:
  fused_uop: <n>
  stack_vector: <n>
  mca_cycles: <n>
  mca_uops: <n>
  vector_lb_920B: <n>
  vector_lb_NP1: <n>
decision: accepted|rejected-correctness|rejected-performance|foundation-only
reason: <hard gate and exact comparison>
```

最终没有 NP1 实机数据时，应表述为“通过当前动态 MCA + vector_lb 代理门”，
不能写成“已达到 cycle 最优”。
