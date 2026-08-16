# SVE1 → SVE2 指令集提升对照实验（VL=128 机器，2026-08-16 预注册）

## 动机

920B（SVE1 VL=256）与 950（SVE2，VL 待确认）的跨平台对比混入了
ISA 与宽度两个变量。一台 **SVE2 且 VL=128** 的机器可以在同机、同宽、
同微架构下分离出“指令集提升”（SVE1 vs SVE2）。

## 实验设计（预注册，先于测量）

### 1. 同构对照（satd8 8x8）

- SVE1 候选：gen 后端 `--isa sve1` pack-2（CADD90 用 tbl+sign+mul+add
  模拟，920B 实测 1.87x 慢于 NEON）；源
  experiments/isa-sve1-satd8-20260816/pack-2_compute-sve.cpp；
- SVE2 候选：gen 后端 `--isa sve2` pack-2（原生 `svcadd_s16` x8，QEMU
  fused 52 vs SVE1 61）；源
  experiments/isa-sve2-satd8-128/compute-sve_pack-2.cpp；
- 同机编译：SVE1 候选 `-march=armv8.2-a+sve`、SVE2 候选
  `-march=armv8.5-a+sve2`；
- 基线：x265 `primitives.pu[LUMA_8x8].satd`（NEON-128）；
- 指标：CNTVCT batch 中位（batch >= 4096），3 次重复，taskset 单核；
- 判定：SVE2/SVE1 比率（>1 = SVE2 指令带来提升）、两者 vs NEON。

### 2. 正确性交叉验证（VL=128）

- best9-950 的全部 SVE2 候选在 VL=128 机器上跑 20k 差分
  （此前 QEMU 仅模拟 VL=256）——验证无 VL 假设；
- 若候选含 `svcntb`/固定 VL 假设，标记并修正。

### 3. 扩展（若机器支持 NEON+dotprod）

- dct8/interp8 的 SVE1 vs SVE2 同构候选（待生成）补充到矩阵；
- NEON-128 作为共同参照，三向分解 ΔISA 与 ΔVL。

## 产物

- scripts/isa-sve1-vs-sve2-paired.sh：目标机一键三版本 paired；
- 结果回填 reports/，与 920B（SVE1-256）和 950（SVE2-256，若有）
  一起构成 ISA x VL 矩阵。

## 用途

- 验证“SVE2 指令（cadd/smull/smlal/zip/uzp/trn/tbl2）相对 SVE1 的
  真实提升”是否如 ISA 审计预期（docs/53）——解释 920B 上 SVE1
  候选全输、950 上 SVE2 赢点的归因；
- 为 AGO 的 ISA 目标选择（sve1 vs sve2）提供同机证据。
