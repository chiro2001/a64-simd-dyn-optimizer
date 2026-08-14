# Round 0017：寄存器 spill 最小化结论

## 判定标记

- **[事实]**：由本轮指定文件、其中记录的实验，或本机 GCC 16.1 / Clang
  22.1.8 选项查询直接支持。
- **[推断]**：由 AArch64/SVE ABI、寄存器分配和调度机制推得，但本项目尚未
  做对应消融。
- **[待验]**：下一轮应以独立候选验证；文中的百分比是筛选目标或经验区间，
  不是已取得的收益。

## 核心结论

1. **后端 flag 只能处理“调度造成的额外压力”，不能消除结构上必然的
   spill。** [事实] AArch64 只有 32 个 Z 寄存器；当前 ACLE 源码先生成
   32 个输入行、成组累加器、完整 `E/O/t/u`，zip32 又先生成 32 个 `n`
   和 16 个 `w`。这会形成远大于 32 的活跃集。即使换最好的 allocator，
   只要这些值在同一点必须同时存活，仍然必须 spill。[推断] 后端参数的合理
   期望是把偶然延长的 live range 和不良拆分压掉，通常是 0–15% 的 stack
   traffic；真正的数量级收益来自 chunk/k-group 划分、消费后立即写回和直接
   asm 的显式分配。

2. **GCC 不应统一选择 O2 或 O3，而应按 compute family 固定 profile。**
   [事实] sdot 版 O3 优于 O2：记录中的 scalar 6146→5462、scatter
   5600→5311，且 spill 下降；mul scatter 的 O3 则曾由 6561 恶化到
   7902。[事实] 本机 GCC 16.1 在 O2/O3 都已启用 `-fsched-pressure`，但
   只有 O3 启用 pre-RA `-fschedule-insns`。因此 sdot 保持 O3；mul 保持
   O2。最有信息量的 GCC 消融是 `O2 + -fschedule-insns`，而不是重复添加
   已经开启的 `-fsched-pressure`。

3. **直接 asm 的第一目标应是降低最大活跃集，不是先发明更复杂的
   coloring。** [推断] 先把计算改成 `k_block=4/8`、输入对按需装入、蝶形
   原地覆盖、结果立即 narrow/store，使 peak-live 控制在 24（不保存
   d8–d15）或 30–32（入口一次保存 d8–d15）的预算内。固定顺序后，带
   interval splitting/rematerialization 的线性扫描足以作为搜索内环；只对
   top 候选运行 optimistic graph coloring。当前 pair 与 split 两个反例
   正好说明：扩大并发累加器集，哪怕减少常量 load 或缩短单链，也会输给
   寄存器压力。

4. **`fused_uop` 必须保留，但不得单独决定赢家。** [事实] 它已经包含
   `stack_vector`，并把 gather/scatter 按多 uop 计数；但 pair_scatter 的
   fused 5878→5583（-5%）而动态 MCA 1900→1940（+2%），证明一条 stack
   load/store 不能只按一条普通向量指令处罚，也没有表达 reload→consumer
   依赖。[事实] 当前字段本质上是 `vector_fused_uop`，spill 所需的标量
   `addvl/subvl` 等 frame/address 指令也不在该分数内。[推断] 搜索应先做
   liveness/线性扫描代理，再对“top fused、top
   low-spill、Pareto frontier、任何 fused 改善但 spill 恶化的风险候选”的
   并集跑动态 MCA。最终候选必须过 MCA 非回退硬门，不能用平均 rank 抵消
   MCA 回退。

5. **zip32 最可能是“确定存在的越界 UB，被高压力触发”，而不是 spill
   本身让正确程序算错。** [事实] `chunk_arithmetic_sdot()` 用 `p16` 从
   `src + 32*m + off` 装 16 个 halfword，而 chunk 只消费低 8 lane；
   `off=24,m=31` 实际读取索引 1016..1031，超过 32×32 对象 8 个元素。
   scalar/scatter 偶然通过不消除该 UB。只给局部 `coef` 加 padding 也没有
   修复第一趟外部 `src` 的越界。[推断] GCC 与 Clang 同时产生相似错误，
   更符合共同源级 UB；纯寄存器压力只应影响性能。第二嫌疑是压力触发的
   destructive `splice`/`movprfx` 寄存器重叠或内联 asm 约束问题。转置数学
   本身已有独立 QEMU 探针，优先级较低。

## ACLE 编译路径：最值得试的 profiles

所有 profile 都必须和当前精确 baseline 单因素对比。固定 VL 是项目合同，
但当前 GCC 查询显示默认仍是 `-msve-vector-bits=scalable`，所以先单独验证
`256`，不要一开始和 allocator/scheduler flag 混在一起。

### GCC 16.1

当前 sdot control：

```sh
aarch64-linux-gnu-g++ -O3 -std=c++11 \
  -march=armv9.4-a+sve2p1 -c candidate.cpp -o candidate.o
```

| 优先级 | profile / 命令增量 | 机制 | 预期收益与适用场景 |
| --- | --- | --- | --- |
| G1 | `-msve-vector-bits=256` | 把运行时已固定的 VL 告诉后端，可简化 spill frame、`addvl/rdvl` 和部分谓词/长度推理；不改变 Z 寄存器数量 | **[待验]** 低风险，常见是 0–5% 指令/栈地址开销；若 vector spill 数不变也属正常。所有 family 都值得先测 |
| G2 | `-flive-range-shrinkage` | GCC 16.1 在 O2/O3 默认均关闭；尝试把定义移近使用、缩短 RTL live range | **[待验]** 目标是 `stack_vector`/`ldr_z+str_z` 降 5–15%；对长直线 basic block 最相关，但无法解决结构性 >32 活跃 |
| G3 | `-fsched-pressure --param=sched-pressure-algorithm=1`（配 O3） | O3 已运行 pre-RA scheduler；算法 1 比默认算法 2 更保守地限制压力，可能少做拉长 live range 的 ILP 调度 | **[待验]** spill 可能降 5–20%，但依赖链/MCA 可能变差；仅当动态 MCA 不回退才保留 |
| G4 | `-O2 -fschedule-insns -fsched-pressure --param=sched-pressure-algorithm=2` | 隔离 O3 与 O2 的关键已知差异：在较少 O3 中端变换的前提下启用 pressure-aware pre-RA schedule | **[待验]** sdot 有机会接近或超过 O3 的 spill；mul 的 O3 已是反例，所以 mul 只把它当诊断，不当默认候选 |

G3 完整示例：

```sh
aarch64-linux-gnu-g++ -O3 -std=c++11 \
  -march=armv9.4-a+sve2p1 \
  -fsched-pressure --param=sched-pressure-algorithm=1 \
  -c candidate.cpp -o candidate.o
```

不建议进入首轮矩阵的 GCC flag：

- **[事实]** `-fno-tree-pre`、`-fweb`、`-frename-registers` 对 mul 已无改善。
  PRE 的确可能把公共向量值提前并拉长 live range，但现有 mul 消融没有该
  信号，sdot 的 volatile `load_c` 又已精准截断最危险的常量复用；没有新
  CSE 证据时不应重跑。rename 是 post-RA 假依赖清理，本来就不能撤销已经
  插入的 spill；ACLE 直线代码也已接近 SSA web，`-fweb` 的空间有限。
- **[事实]** `-fira-algorithm=CB`、`-fira-region=one` 已是 GCC 16.1 当前
  默认，`-fira-hoist-pressure` 也已开启；函数是大直线区域，代码 hoist 与
  loop region 都不是主要杠杆，`all/mixed` 和 `-fira-loop-pressure` 没有可
  利用的循环层级。`priority` allocator 更适合作为编译时间对照，不是首选
  性能候选。
- **[事实]** volatile `load_c` 已用更精确的方法阻止跨 chunk 常量 CSE；
  不应为了同一目的再次全局关闭大量优化。

### Clang 22.1.8

control：

```sh
clang++ --target=aarch64-linux-gnu --gcc-toolchain=/usr \
  -O3 -std=c++11 -march=armv9.4-a+sve2p1 \
  -c candidate.cpp -o candidate.o
```

下列选项已在本机 Clang/LLVM 22.1.8 确认可被接受：

| 优先级 | profile / 命令增量 | 机制 | 预期收益与适用场景 |
| --- | --- | --- | --- |
| C1 | `-msve-vector-bits=256` | 与 GCC G1 相同，固定后端 VL 合同 | **[待验]** 0–5% 地址/框架开销；所有 profile 的独立第一步 |
| C2 | `-mllvm -regalloc=pbqp` | 用 PBQP 全局求解分配/拆分权衡，可能避开 greedy 在高干涉图上的局部选择 | **[待验]** 0–15% spill，编译时间/内存显著增加；只跑通过短门的 top 源码。若无收益立即停止，不改用 `basic/fast` |
| C3 | `-mllvm -regalloc=greedy -mllvm -split-spill-mode=speed -mllvm -regalloc-eviction-max-interference-cutoff=1000` | 保留成熟 greedy，但允许高干涉 live range 做更积极的 eviction/splitting，避免为编译时间过早放弃 | **[待验]** 对“数百干涉边”的大函数比换 fast/basic 更合理；目标 5–15% stack traffic，设 5× control 编译超时防止搜索失控 |
| C4 | `-mllvm -misched=ilpmin -mllvm -misched-regpressure` | pre-RA 调度刻意降低同时并行的链，优先压寄存器压力 | **[待验]** 可作“压力是否由调度造成”的强诊断，spill 可能降 10–30%，但 ILP/关键路径很可能变差；只在动态 MCA 同时改善时接纳 |

C2/C4 示例：

```sh
clang++ --target=aarch64-linux-gnu --gcc-toolchain=/usr \
  -O3 -std=c++11 -march=armv9.4-a+sve2p1 -msve-vector-bits=256 \
  -mllvm -regalloc=pbqp \
  -c candidate.cpp -o candidate-pbqp.o

clang++ --target=aarch64-linux-gnu --gcc-toolchain=/usr \
  -O3 -std=c++11 -march=armv9.4-a+sve2p1 -msve-vector-bits=256 \
  -mllvm -regalloc=greedy \
  -mllvm -misched=ilpmin -mllvm -misched-regpressure \
  -c candidate.cpp -o candidate-ilpmin.o
```

`greedy` 是 O3 的稳健 control；`basic`/`fast` 主要换编译速度，预期会增加
spill。release ML advisor 是否随发行包带有效模型与训练目标有关，不应在
本轮优先于上述可解释消融。

## 直接 asm 路径：推荐结构

### 活跃集与分配

- 先建立 typed op DAG：每个 op 显式记录 `defs/uses`、Z/P/GPR regclass、
  元素宽度、memory effect、latency/resource、destructive/tied/early-clobber
  约束，以及 indexed sdot 的低寄存器限制。
- 以 stage/chunk/k-group 为 region 做精确 liveness；搜索
  `k_block={4,8}`。不要跨两个 chunk 共享累加器。对每个 k-block，逐个
  row-pair 执行 `load A/B -> zip -> load C -> sdot active_accs`，随后杀死
  A/B/D/C。它用重复少量输入 load 换取可控 live set，正是 pair 反例所
  缺失的维度。
- 蝶形改成 destructive/in-place lowering：`EEEE/EEEO -> EEE -> EE -> E`
  后覆盖已死输入；得到 `E±O` 后立即 round/narrow/store，不再同时保留
  32 个 `t/u`。
- zip32 中把“先产生 32 个 n”改为每两个最终输出立即
  `round(n0,n1) -> splice(w[p])`，并让 `w` tied 到已死的 `n0`；最后只让
  16 个 `w` 进入 3 层 uzp，使用 2 个 scratch 原地更新。transpose 区域的
  合理峰值约 18 个 Z，而不是 48+。
- 常量、zero、predicate、scatter index 标为 rematerializable；常量仍在
  使用前一条 `ld1h` 装入并立即死亡。优先 rematerialize，禁止把常量向量
  spill 到栈后再 reload。
- 搜索内环使用 hole-aware linear scan + live-range splitting；spill 选择按
  动态 use、next-use distance、reload criticality 加权。top 候选再用
  Briggs/Chaitin optimistic coloring 检查是否能减少 planned spill。

### 调度与 `movprfx`

- list scheduler 的首要硬约束是 `live_Z <= budget`；软目标依次为减少
  overcommit area、保持 critical-path slack、平衡 target resources。
  对 ready op 优先选择“杀死最后一个 use、少产生长 live def”的指令，load
  只提前 1–2 个 latency window，store 在最后 use 后立即发出。
- destructive SVE op 应尽量把目的寄存器与死亡的第一输入 coalesce。例如
  `splice Zd, Pg, Zn, Zm` 令 `Zd==Zn`，并保证 `Zd!=Zm`，即可不发
  `movprfx`。确实需要 prefix 时，把 `movprfx + consumer` 作为不可拆 bundle
  验证：相邻、同目的、兼容 predicate/element size，中间不得插指令。
- 若要严格控制顺序，使用真正 `.S`。很多小的 `asm volatile` 既不是完整
  调度器，也不是通用 memory barrier；它们会阻断优化，却仍把物理寄存器
  选择交给编译器。保留 inline asm 时，固定寄存器块必须完整声明输出、所有
  Z/P/GPR clobber；固定范围 load 优先声明精确 `"m"` 输入，无法描述的
  scatter/任意指针副作用才使用 `"memory"` clobber。`splice` 类输出用
  early-clobber/tied 约束防止 prefix 覆盖第二输入。当前 `load_c` 的 asm
  没有 memory operand；常量只读使其未必是现有错误来源，但这是进入通用
  inline-asm 路径前应补的约束审计项。

### 函数与 ABI

- 低成本 ACLE 诊断：把 zip32 改成真正 `noinline,noclone` 的单 chunk
  helper，helper 内完成 compute→round→transpose→store，调用之间不传活的
  Z 值。8 次调用的标量开销相对数千条主体很小，却能阻止跨 chunk/stage
  扩大活跃集。若 chunk 仍超预算，再按输出 row/k-group 拆 helper；边界只传
  指针/标量并落地中间结果，不通过调用边界携带一批 Z 值。
- 直接 `.S` 推荐一个 C ABI wrapper + 本地 private-convention chunk/k-group
  helper。base AAPCS 下可无保存使用 `z0-z7,z16-z31`（24 个 Z）；若确需
  全 32 个，wrapper 只在入口/出口保存恢复 `d8-d15` 的低 64 bit，内部
  helper 可约定 clobber 全部 Z，且调用边界不得有活 Z 值。保持 SP 16-byte
  对齐并保存 LR/所用 callee-saved GPR。
- 不要无需要地把指针参数函数标成 SVE variant PCS；该 PCS 会引入更大的
  scalable callee-save 集。若 helper 暴露为普通独立符号，就必须遵守其
  声明的 PCS，不能靠注释假定 clobber。

## 搜索中的 spill/压力代理与选择规则

按成本从低到高建议记录：

1. emitter/DAG 级：`peak_live_z/p`、`live_area`、
   `overcommit_area_{24,28,32}`、chunk 边界 live 值数、累加器数、最长/总
   live-range、rematerializable 比例。
2. 快速分配模拟：对 K=24/28/32 跑线性扫描，输出预测
   `spill_load/store/bytes`、distinct slots、reload→use 距离和 planned
   remat 数。这比单纯 peak-live 更接近实际 spill。
3. object/disasm 级：分开计 `ldr_z`、`str_z`、`ld1/st1 [sp]`、
   `addvl/subvl/rdvl`、frame bytes、callee-save、distinct spill slots，以及
   32/64 指令滑窗内 stack traffic 峰值。planned algorithmic scratch 必须与
   allocator spill 分栏，不能都塞进 `stack_vector`。
4. 动态级：现有 fused_uop；另加 stack load/store port lower bound 和
   reload→consumer critical-edge penalty。最终仍以修复后的动态 trace MCA
   为当前最强代理，static MCA 只粗筛。

候选选择采用硬门 + Pareto，而不是单一加权总分：

```text
correct(20k) && lite(5/5)
&& dynamic_mca <= incumbent_dynamic_mca
&& (stack_vector <= incumbent_stack
    || dynamic_mca 明确优于 incumbent)
```

MCA shortlist 是以下集合的并集，而非仅 `ok[:topN by fused]`：top fused、
top predicted spill、top actual stack traffic、四维 Pareto frontier，以及
任何“fused 改善但 stack/peak-live 恶化”的风险候选。对 IDCT32 当前
incumbent，pair_scatter 会因 1940 > 1900 自动被挡住。NP1 的结构门继续
要求 `vector_lb <= 2553.5/2 = 1276.75`；920B 只报告同宽保守结果，不把
NP1 的 2× 宽度收益套过去。

## zip32 根因排序与诊断

1. **越界 load/UB：最高。** 先把数据行 load 改为仅激活 8 个 halfword
   的 predicate（inactive lane 置零），并对第一趟 `src`、第二趟 `coef`
   都用精确对象/guard page 验证。只有这一步通过后，其他归因才有效。
2. **压力触发的 destructive-instruction 约束/后端问题：第二。** 若无 UB
   后仍错，做 noinline chunk 消融，并扫描 disassembly 中每个
   `movprfx/splice`：prefix 是否紧邻 consumer、目的是否覆盖仍需的第二
   source、spill store/reload slot 是否一致。可用一个 early-clobber 的固定
   asm splice bundle作对照。
3. **纯数学排列或普通 spill：较低。** 独立 QEMU 探针已覆盖同构 n；合法
   程序的 spill 只能变慢，不能改变值。只有 GCC/Clang 在无 UB、固定寄存器
   版本之间出现差异，才能把问题升级为后端 miscompile。

## 下一轮实验（按信息增益排序）

| 顺序 | 实验 | 成本 | 预期信息/收益 | 成功与停止条件 |
| --- | --- | --- | --- | --- |
| 1 | **zip32 UB 消除 + 顺序 noinline 消融**：先只把 16-lane 行读变成严格 8-lane predicated load，GCC/Clang 各跑；若仍错，再把每 chunk 做 noinline helper | 低，4–6 次构建，约半天内 | 最大概率直接恢复正确性；也能把“源级 UB”与“压力触发后端问题”二分 | 任一编译器 20k 非零立即停性能；两编译器均 0 mismatch 后才跑 lite/MCA。UB 修复即成功则不再追 RA-miscompile |
| 2 | **正确 sdot scalar/scatter 的编译器 profile 小矩阵**：GCC G1–G4、Clang C1–C4，2k 短门后只让 Pareto top 2–3 进入 20k/lite/动态 MCA | 低到中，约 16 个 compile，工程量 <0.5 天 | 量化“flag 能救多少”的上限；[待验] 期望最好 profile 降 5–15% stack traffic，MCA 可能仅 0–3% | 保留条件：20k=0、lite=5/5、stack 至少 -10% 且 MCA 不回退，或 MCA 直接优于 1900。全部失败即停止 flag 深挖 |
| 3 | **一个 sdot chunk 的 pressure-budgeted 直接 asm 原型**：`k_block=4/8`、in-place butterfly、round+splice 融合；线性扫描 K=24/32，随后嵌回两 stage | 中高，1–2 个工程日 | 验证结构化分组能否把 compiler spill 变成 0 或少量 planned traffic；目标是动态 MCA <1900，而不是只降 fused | allocator verifier 先证明无冲突/ABI 正确；20k=0、lite=5/5；NP1 vector_lb ≤1276.75 且动态 MCA <1900 才扩展 graph coloring |

三项之后的决策很清楚：若实验 2 没有实质收益而实验 3 能把 peak-live 和
stack traffic 压下去，就停止继续枚举编译器隐藏 flag，把预算转到直接 asm
的 region/schedule/allocator；若实验 1 在消除 UB 后仍然只有 noinline 或
固定寄存器版本正确，则保存最小反例，再决定是否向 GCC/LLVM 报后端 bug。
