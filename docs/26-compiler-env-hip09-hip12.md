# 920B/hip09 流水线数据调研与 MCA 导入路径（2026-08-14）

> 目的（用户口径）：调研编译器/公开资料里有没有 920B（鲲鹏 920 /
> TaiShan V110）指令后端执行流水线数据（执行单元、时延、吞吐），
> 方便导入 llvm-mca 建立自定义 target。

## 1. 结论摘要

**目标口径（用户确认 2026-08-14）**：MCA 目标机 = **SVE 2×256 /
NEON 4×128**（SVE 2 条 256-bit 执行管道、NEON 4 条 128-bit 管道，
固定 VL=256）。当前搜索用的 `neoverse-v2 + sve2` 只是 LLVM 代理，
不是该口径的模型；920B 实测表 + hip09.md 管道结构（4×FSU，SVE 占用
其中 2 条）才是建自定义模型的基础。

1. **LLVM：tsv110 模型明确把 SVE 标记为 unsupported**
   （`AArch64SchedTSV110.td` 的 `SVEUnsupported.F` / `SVE2p1Unsupported.F`）。
   实测 `llvm-mca -mtriple=aarch64 -mcpu=tsv110 -mattr=+sve2` 对
   `add z0.s, z0.s, z1.s` 报“unsupported instruction”。因此用
   `-mcpu=tsv110` 做 MCA 时 SVE 指令 100% 跳过，不可用。
2. **GCC：`tsv110.md` 只有 NEON/FP 流水线，没有 SVE reservation。**
   GCC 主线的 `aarch64-cores.def` 中 tsv110 也只带 `(CRYPTO, F16)`，
   不带 SVE。
3. **GCC for openEuler（Huawei 分支）新增 hip 系列 core**：
   - `hip09`（=920B）：V8.5A + SVE + I8MM + F32MM/F64MM（后期补丁移除
     F32MM/F64MM，加 RNG）；`-mcpu=hip09` 在 openEuler 24.03 SP2 的
     GCC 12.3.1 上已可用（实测宏含 `__ARM_FEATURE_SVE`、
     `SVE_MATMUL_*`、`RNG`）。
   - `hip10a/hip10c/hip11`：中间型号，hip11 为 V8.5A + SVE + SVE2 + F16。
   - `hip12`（=920C/G）：V9.2A + SVE + SVE2 + SVE2_AES/SM4/SHA3/BITPERM
     + BF16 + DOTPROD + RNG 等；openEuler GCC 12.3.1 也认 `-mcpu=hip12`。
   - 补丁来源：`src-openeuler/gcc`（gitcode）openEuler-24.03-LTS-SP3
     分支的 `0370-Add-hip12-core-definition-and-cost-model.patch`、
     `0374-Add-hip12-instructions-pipeline.patch`、
     `0392-Modify-cores-definition-for-hip-cores.patch`。
4. **hip12.md（GCC for openEuler，2025-04）是唯一接近“可导入 MCA”的
   官方流水线模型**：4×ALU(1cyc) + 2×多周期 ALU + 3×load + 2×store +
   2×store-data + 4×非对称 ASIMD/FP/SVE 向量管道 V0-V3；包含 NEON/FP
   指令的 latency/reservation（如 neon arith 1-2、neon mul 3、neon dot 3、
   fp add 2、fp mul 3、fma 4、ld 6、st 1-3、crypto 2-4）。
   **但没有 SVE 指令的 reservation**（无 `sve_*` type 覆盖）。
5. **公开资料里没有 920B 的 SVE 指令级时延表**：
   - 华为官方《鲲鹏编程与调优指南》只给执行管道功能表（ALU1、
     ALU2/3/BRU1/2、MDU、LS0/1、FSU1/FSU2），FSU1/FSU2 都带
     “Hivector”（SVE 向量执行单元），无逐指令时延。
   - 《鲲鹏920 TSV110 微架构评测》（知乎/CSDN 转载）给出后端配置：
     3×ALU(1)、1×MUL(4)、1×DIV(19)、2×FADD(4)、2×FMUL(5)、2×FMA(7)、
     1×FDIV(17)、2×AGU；没有 SVE 数据。
   - ARM Cortex-A72 Software Optimization Guide（网上常见引用）与
     Kunpeng 无关，不能当作 920B 数据。
6. **结论：920B 的 SVE 流水线数据必须自己实测。** 920B 无 PMU，只能
   用 CNTVCT + 微基准（latency 链/独立链吞吐）测量，之后：
   - 方案 A（推荐，低侵入）：生成“指令 → {latency, throughput, pipes}”
     表，先在项目内做轻量 MCA 替代（动态流计数 + 表驱动 cycle 预估），
     不依赖 LLVM 编译；
   - 方案 B（完整）：按表给 LLVM 的 tsv110 模型补 SVE SchedWriteRes/
     SchedReadAdvance，本地构建 llvm-mca 的自定义 target（工作量较大）；
   - 方案 C（SVE2 机型）：hip12（920C/G）可直接用 GCC for openEuler
     的 hip12.md NEON/FP 数据 + 自行补 SVE，作为 SVE2/256 的 MCA 模型。

## 2. 已确认的可用信息（可落表）

### 2.1 920B 后端执行单元（微架构评测 + 华为官方）

| 单元 | 数量 | 延迟(cyc) | 说明 |
| --- | --- | --- | --- |
| ALU | 3 | 1 | 简单整型 |
| BRU | 2 | - | 分支 |
| MUL | 1 | 4 | 整型乘 |
| DIV | 1 | 19 | 整型除（提前退出） |
| AGU(ld+st) / AGU(ld) | 2/2 | 4 | 访存地址 |
| FADD | 2 | 4 | FP 加 |
| FMUL | 2 | 5 | FP 乘 |
| FDIV | 1 | 17 | FP 除 |
| FMA | 2 | 7 | FP 乘加 |
| FSU1/FSU2 | 2 | ? | ASIMD/FP/SVE（Hivector），SVE 时延待测 |

### 2.2 GCC for openEuler hip12.md（SVE2 机型，供参照/迁移）

向量相关关键值（`hip12_v*` 管道，latency）：

| 类别 | latency | 管道 |
| --- | --- | --- |
| neon arith basic / logical | 1 | V0-V3 任意 |
| neon arith long / complex / cmp | 2 | V0-V3 |
| neon reduce / dot | 3 | V0-V3 |
| neon multiply / mla | 3 | V0-V3 |
| neon shift | 2 | V0-V3 |
| neon fp arith / minmax | 2 | V0-V3 |
| neon fp mul | 3 | V0-V3 |
| neon fp mla / fma | 4 | V0-V3 |
| neon fp cvt / round | 3-4 | V0-V3 |
| neon dup | 6 | V0-V3 |
| neon ld1 | 6-10 | V0-V3 + load |
| neon st1 | 1-4 | V0-V3 + store |
| fp div s/d | 6/8 | V0-V3 |
| fp sqrt s/d | 6/8 | V0-V3 |

### 2.3 毕昇编译器（Bisheng）可用性与 SVE 调度

毕昇 = Huawei 基于 LLVM 10.0.1 的发行版（flang 前端），rpm/tar 可从
`repo.oepkgs.net/bisheng`（bisheng-compiler-2.1.0-1.aarch64.rpm，
~302MB；source rpm ~466MB）或华为云镜像
`mirrors.huaweicloud.com/kunpeng/archive/compiler/bisheng_compiler/`
（2.4/2.5/3.x 系列）获取。920B 默认 yum 源**不含** bisheng-compiler
（只有 BiSheng-Autotuner/opentuner）；需手动加 oepkgs 源。

关键结论：毕昇的公开资料（直播/开发者社区）只强调对 920B 的 SVE
向量化/内建函数优化，**没有公开 920B SVE 逐指令时延/吞吐表**；其
TSV110 调度模型继承上游 LLVM（SVEUnsupported，同 §1.1），未见到
独立 SVE reservation 的公开证据。验证源码 .td 需下载 ~466MB src
rpm，收益低，不列入本轮；若后续需要可补。结论与 §1 一致：920B 的
SVE 流水线数据只能自测（方案 A 微基准 + 表驱动 cycle 预估）。

## 3. 下一步（导入 MCA 的路径）

1. 在 920B 上跑 SVE 微基准（latency/throughput），覆盖本项目实际使用
   的指令族：`add/mul/sdot/smull/tbl/uzp1/zip/rshrnb/fcvt/ld1h/ld1w/
   st1h/st1w/movprfx`（VL=256）。基准源码放 `benchmarks/`，结果落
   `docs/27-920b-sve-timings.md` 或 `isa/` 下机器可读 JSON。
2. 先做“表驱动 cycle 预估器”（方案 A）接入搜索排序，与
   `neoverse-v2` MCA 并行对照；两者趋势一致后再决定是否做 LLVM
   自定义 target（方案 B）。
3. hip12 可用后，用 GCC hip12.md 作为 SVE2 模型的初版（补齐 SVE
   reservation），920G 实机 paired cycles 校准。

## 5. 新建 MCA target：920B / NP1（2026-08-14）

按用户口径新建两个 target（`optimizer/mca_targets.py`，latency 参数
参考 LLVM Neoverse-V2 调度模型）：

| target | SVE | NEON | 说明 |
| --- | --- | --- | --- |
| **920B** | 2×256 | 4×128 | 920B 实测 throughput 权重 |
| **NP1** | 4×256 | 4×128 | 960；SVE 管道数 4/2 缩放 |

latency 参考（Neoverse-V2，cycles）：

| 类别 | latency | 管道 |
| --- | ---: | --- |
| ADD/SUB ZZZ | 2 | 1×V |
| MUL ZZZ | 4 | V0/V2 |
| SDOT HtoD | 4 | V0/V2（读推进 3） |
| TBL/UZP/ZIP/TRN/REV | 2 | 1×V |
| MOVPRFX | 2 | 1×V（融合） |
| LD1（SVE） | 6 | 1×L |
| ST1H | 2 | L01+V01 |
| RSHRN（ASIMD 代理） | 4 | V13 |
| SMULL（ASIMD 代理） | 3 | V02 |

throughput 权重（用户 2026-08-14 口径，实测 920B 数据可靠性不足，
直接按管道结构算）：920B 全部按 SVE 2×256（2 条管道 → 每类
0.5 cyc/op）；NP1 按 SVE 4×256（4 条管道 → 每类 0.25 cyc/op）；
load/store 同样按 SVE 管道计。scalar 1.0，movprfx 融合不计。

用法：

```sh
# 单 trace 估算（默认 NP1）
python3 tools/estimate_cycles.py <trace.log> <start> <end> --profile NP1
# critical-path 估算（NV2 latency，动态流）
python3 tools/critical_path_dynamic.py <trace.log> <start> <end> --target NP1
# 搜索中给 top-N 加 est_cycles_<target> 并参与排序
python3 tools/search_sve2_layouts.py ... --mca-target NP1 --cost-top 10 \
  --cp-top 10 --rank-by cp
```

初步对照（**注意机器口径，2026-08-14**）：实测锚点是 **950**
（SVE2，SVE 2×256 / NEON 4×128），不是 960/NP1（SVE 4×256）。
因此 950 数据只与 **920B 结构模型**（同为 SVE 2×256）对照：

| kernel | 950 TestBench | est(920B 结构) | est(NP1/960，无实机) |
| --- | ---: | ---: | ---: |
| best_op_r16 | 1019~1077 | 1271 | 794（前瞻估计） |
| 上游 | 2107 | 3341 | 2088（前瞻估计） |

950 与 920B 结构模型：best 高估 ~21%，上游高估 ~59%；两个 kernel 的
IPC 分别是 ~5.3 与 ~6.3，单一 issue_rate 无法同时拟合，疑似 TestBench
计时口径（单次调用 vs 整块）不一致。**NP1/960 暂无实机数据，其估值
不能当作校准结论**；等 960 实机（或用户提供 NP1 数据）后再拟合。

**950 实机验证（2026-08-14，用户提供）**：best_op_mca（4014）950
TestBench **985~995 cyc**（best_op_r16 1019~1077、内部 1167、上游
2107）。llvm-mca（neoverse-v2）预测 1041（约 +5% 高估），是当前最准
的代理；结构成本（920B 1164 / NP1 728）只适合粗排。

## 4. 工具/流程修正（本轮发现）

- `search_sve2_layouts.py --mca-top` 的 mca_cycles 之前未写回
  results.json（dump 顺序错误），已修复并回填 m32 结果。
- m32 全布局搜索 best=fused_uop 3930（MCA 1094）；MCA 最优候选
  fu=4014（MCA 1041）但 TestBenchLite 5 seed 中 1 seed FAIL，
  说明**搜索阶段必须加 lite 门禁后才能按 MCA 排名**，正在补做
  top-N lite 扫描（见 docs/20 §6.13 更新）。

## 5. 自定义 llvm-mca（SVE2p1 sdot 调度补丁，2026-08-14）

**问题**：llvm-mca 22.1.8 的所有 AArch64 调度模型
（neoverse-v2/v3/512tvb/ampere1a、generic）都没有
`sdot z.s,z.h,z.h`（SDOT_ZZZ_HtoS / SDOT_ZZZI_HtoS，SVE2p1）与
`sdot z.h,z.b,z.b`（SDOT_ZZZ_BtoH，SVE2p3）的调度条目，sdot 候选
无法 MCA 评估（`lack-sched` 跳过会使结果失真）。960 实机未流片，
NP1 评估必须以 MCA 为代理，因此给 Neoverse-V2 模型补了这两族指令。

**补丁**：`patches/llvm-22.1.8-aarch64-sdot-z32-sched.patch`，在
`llvm/lib/Target/AArch64/AArch64SchedNeoverseV2.td` 增加两条 InstRW：

```tablegen
def : InstRW<[V2Wr_ZDOTH, V2Rd_ZDOTH], (instregex "^[SU]DOT_ZZZI?_HtoS")>;
def : InstRW<[V2Wr_ZDOTH, V2Rd_ZDOTH], (instregex "^[SU]DOT_ZZZI?_BtoH")>;
```

与项目 dot 口径一致：Latency 4、V02 端口、read-advance 3（同
SDOT HtoD）。构建脚本 `scripts/build-custom-llvm-mca.sh`（LLVM
22.1.8 源码 + 代理下载 + cmake 单 target；本机实测约 2 分钟）。

**动态流口径（比静态流更准）**：MCA 输入应使用 QEMU 动态 trace
（真实执行序）。QEMU 11.0.3 的 in_asm 把 sdot 反汇编成 `.byte`，
`tools/fix_dynamic_trace.py` 按地址用 objdump 修复
（`parse_qemu_trace.py` 的 INS 正则已允许 `.byte` 助记符）。
无循环 kernel 的 objdump 静态流近似动态流（scalar 差 ~3%；
scatter 静态流明显偏高，以动态流为准）。

**静态 vs 动态实测对比（idct32，neoverse-v2 + sve2p1 补丁）**：

| 版本 | 静态 MCA（objdump 全函数） | 动态 MCA（QEMU 修复 trace） | 静态偏差 |
| --- | ---: | ---: | ---: |
| NEON 上游 | 3319 / 12296 uOps | 3319 / 12296 uOps | 0% |
| sdot-s32 scalar | 3404 / 19987 | 3518 / 20960 | -3.2% |
| sdot-s32 scatter | 3065 / 17402 | **1900 / 10415** | +61% |

scalar 的静态流略低估（~3%，动态多出的主要是实际执行中的栈/spill
调整）；scatter 的静态流明显高估（+61%），因为全函数 objdump 包含
未在测量区间执行的序言/收尾与静态展开序，而动态 trace 反映真实
执行序。结论：MCA 一律以修复后的动态流为口径，静态只作快速粗筛。

**双目标宽度口径（用户 2026-08-14）**：MCA/成本评估必须区分两个
目标机——920B = SVE 2×256 / NEON 4×128（SVE 与 NEON 总宽相等，
无宽度优势）；NP1(960) = SVE 4×256 / NEON 4×128（SVE256 算力是
NEON 的 **2 倍**）。因此：

- 用 **NP1 评估**时，NEON→SVE256 的理论 cycle 减半是起点，验收应
  追求**更大**的 cycle 缩减（≥50%），不能拿 920B 的预期当 NP1 目标；
- 用 **920B 对照**时，SVE 2×256 与 NEON 4×128 总宽相同，收益只能
  来自指令数/ILP，是保守口径。

`tools/estimate_cycles.py --profile 920B|NP1` 新增
`vector_lb_cycles`（宽度感知向量吞吐下界：sve/neon 向量指令数分别
除以各自 pipe 数；SVE2p1 sdot 需 `--fix-driver` 修复 `.byte` 后统计）。
idct32 实测（动态流，修复后）：

| 版本 | vector 指令 | vector_lb 920B | vector_lb NP1 |
| --- | ---: | ---: | ---: |
| NEON 上游 | 10214（全 NEON128） | 2553.5 | 2553.5 |
| sdot-s32 scatter | 5110（SVE256） | 2510（1.02×） | **1255（2.03×）** |

NP1 下理论向量吞吐下界正好 ~2×：这是“960 需要 SVE256、NEON→SVE256
应争取 cycle 减半”的结构依据。当前 NV2 代理 MCA（3319 vs 1900，
1.75×）方向一致但偏保守；920B 无宽度收益，实机 paired 才可信。

**评估结果（neoverse-v2 + sve2p1，动态流，idct32）**：

| 版本 | MCA cycles | uOps |
| --- | ---: | ---: |
| NEON 上游 idct32 | 3319 | 12296 |
| sdot-s32 scalar | 3518 | 20960 |
| sdot-s32 scatter | **1900** | 10415 |

sdot scatter 动态 MCA 1900 相对 NEON -43%；scalar 仍 +6%（sdot
依赖链/写回路径）。这是当前 NP1 周期评估的最强代理；est/cp 结构
模型只作粗排。
