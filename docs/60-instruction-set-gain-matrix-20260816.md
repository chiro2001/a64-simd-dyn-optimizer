# 指令集演进增益矩阵：NEON → SVE → SVE2 → SVE2p1/p3

> 2026-08-16 整理。目的：回答“每个指令集层新增了什么能力、对应
> 什么类型算子、实测带来多少增益”。所有百分比标注证据类型：
> **实测**（CNTVCT paired / 真机）/ **回放**（真实调用分布）/
> **MCA**（fused/MCA 或替换预估）/ **排除**（实测未达标）。

## 1. 指令集能力差异（经 ISA 对齐审计核实，docs/53 §6）

| 层 | 新增结构能力 | 关键缺失 |
| --- | --- | --- |
| NEON | 128-bit 固定宽度；N1/710 另有 dotprod/i8mm | 无变长向量、无 CADD90、无 HISTSEG、无宽乘 |
| SVE1（920B 2x256） | **VL=256 宽度**、gather、LD2-4/ST2-4、饱和算术、**SDOT 16→64**（.D,.H,.H）、单寄存器 TBL；ZIP/UZP/TRN 本就属于 SVE1 | 无 **CADD90**、无宽乘（SMULLB/SMLALB/UMULLB/T）、无 TBL2/TBX、无 2-way 点积 |
| SVE2（710 VL=128 / 950 2x256） | **CADD90、HISTSEG/HISTCNT、宽乘、TBL2/TBX、饱和配对**、MATCH/NMATCH | 2-way SDOT 需 p1/p3 |
| SVE2p1 | SDOT 2-way **H→S**（.S,.H,.H） | — |
| SVE2p3（960 4x256） | SDOT 2-way **B→H**（.H,.B,.B） | — |

## 2. 结构指令 → 算子类型映射

| 指令能力 | 适合的数据流形态 | 对应算子族 |
| --- | --- | --- |
| CADD90（旋转加减） | 8 点 Hadamard/旋转蝶形（每指令完成 4 对加减） | satd、dct8/16、idct、psyCost/calc_energy |
| HISTSEG/HISTCNT | 直方图/桶计数（单指令统计 ±2/±1/0 边类型） | 熵 c1c2（符号统计）、SAO 边类型统计 |
| 宽乘 SMULLB/SMLALB/UMULLB/T | 16→32 宽乘累加，避免解包 | dct/idct、interp 8-tap、quant/dequant 族 |
| TBL2/TBX | 双寄存器查表 | interp 相位滤波、DCT 系数表 |
| SDOT 16→64（SVE1） | s16×s16→s64 点积 | dct 奇数项、sa8d（SVE1 上实测为负，见 §3） |
| SDOT 2-way H→S（SVE2p1） | s16 点积（.S,.H,.H） | idct16/32、dct 的 sdot 系候选 |
| SDOT 2-way B→H（SVE2p3） | u8 点积（.H,.B,.B） | interp8 hpp path-B（sdoth） |
| VL=256 宽度 | 连续多行/宽行数据一次性处理 | satd/sad/dct 行处理（SVE1 上被结构代价抵消） |

## 3. 实测增益矩阵（算子 × 目标 ISA）

| 算子 | NEON | SVE1 2x256（920B） | SVE2-128（710） | SVE2 2x256（950） | SVE2p1/p3 4x256（960，MCA/替换） |
| --- | --- | --- | --- | --- | --- |
| satd8（CADD90） | 1.0 | **-47%~-87%**（1.82–1.87x 慢，模拟 cadd90） | **+25% vs NEON / +33% vs SVE1 模拟**（1720 vs 2141/2286 ticks） | 原生 CADD90 生效 | — |
| c1c2（HISTSEG） | 1.0（C 参考） | — | 注入（回放 +30%） | **+81%** | — |
| dct8 | 1.0 | -33%（0.75x） | 注入（20k 零失配） | **+48%** | — |
| interp8vpp 16/32 | 1.0 | — | VL=256 假设（排除） | **+12%/+13%** | — |
| sa8d16 | 1.0 | -5~-8%（0.92–0.95x） | ~0%（vaddlv_seq）；32x32 包装 +19% | **+28%**（正确性 FAIL→改 NEON） | — |
| cost-coeff-nxn | 1.0 | — | +10%（NEON unroll） | — | — |
| scan / remain | 1.0 | — | +27% / +20%（回放） | scan **-4.5x**（排除） | — |
| idct16 / idct32 | 1.0 | -17%（0.85x） | VL=256 候选（排除） | **≥+9% / ≥+3%**（BtoS 下界） | SVE2p1 sdot 候选，960 预期更高 |
| interp8 hpp path-B（sdoth） | 1.0 | — | -1.6~-1.7x（排除） | 替换上界 0.44–0.58（950 无 SVE2p3） | **960 原生 sdot.h 保留目标**（MCA≈1.0，待实机） |
| quant 族 | 1.0 | — | 无宽度优势（未注入） | 搜索层 fused/MCA（quant 508/169、nquant 329/131），**无 paired %** | SVE2p1 系，待 960 |

## 4. 结论

1. **SVE1 是“宽度换结构代价”的失败层**：VL=256 宽度优势被 uaddv
   归约延迟（13 cyc）、ld1b load-use（24 cyc）、CADD90/宽乘缺失的
   模拟开销完全抵消。920B 上全部 SVE1 候选实测慢于 NEON
   （0.75–1.87x）。早期“SVE1 缺 zip/uzp/trn”为误判，真缺的是
   结构指令（CADD90、宽乘）。
2. **SVE2 的赢点 = 结构指令，而非宽度**：VL=128 下原生 CADD90 让
   satd8 快 1.33x（vs SVE1 模拟）、1.25x（vs NEON）；HISTSEG 让
   c1c2 +81%；宽乘/点积让 dct8 +48%。Yitian E2E 的 ~1.5% 基本全部
   来自结构指令。
3. **SVE2p1/p3 是“点积族”的待兑现层**：2-way SDOT 只在 p1/p3 机器
   原生可用；950（仅 SVE2）跑不了 sdoth（替换预估 0.44–0.58x），
   候选保留给 960（SVE2p3 4x256），目前只有 MCA/替换预估。
4. **对 AGO 的含义**：指令集收益不单调——NEON→SVE1 负收益、
   SVE1→SVE2 结构指令正收益、SVE2→SVE2p3 待实测。按目标机 ISA
   实测非劣才注入是唯一正确姿势。

## 5. 证据来源

- docs/53（SVE1 全量证据 + ISA 对齐审计）、docs/32/35（950 实机）、
  reports/isa-sve1-vs-sve2-128-20260816.txt（同机 ISA 隔离）、
  reports/950-quick-test-20260815.txt、docs/44（quant 族 MCA）、
  docs/56（目标审计）、docs/59（Yitian 证据与关闭记录）。
