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

## 4. 工具/流程修正（本轮发现）

- `search_sve2_layouts.py --mca-top` 的 mca_cycles 之前未写回
  results.json（dump 顺序错误），已修复并回填 m32 结果。
- m32 全布局搜索 best=fused_uop 3930（MCA 1094）；MCA 最优候选
  fu=4014（MCA 1041）但 TestBenchLite 5 seed 中 1 seed FAIL，
  说明**搜索阶段必须加 lite 门禁后才能按 MCA 排名**，正在补做
  top-N lite 扫描（见 docs/20 §6.13 更新）。
