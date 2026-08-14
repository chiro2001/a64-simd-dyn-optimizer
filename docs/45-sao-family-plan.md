# sao 族覆盖计划（2026-08-15）

> docs/37 最大剩余族（10 字段：saoCuOrgE0/E1/E1_2Rows/E2×2/E3×2/B0 +
> saoStats）。与 quant 不同：aarch64 有 **ACLE NEON 实现**
> （loopfilter-prim.cpp），可直接作 seed 语义源。

## 1. 现状

- saoCuOrgE0 ✅（2026-08-15）：固定 width=64、2 行全展开 seed
  （`kernels/sao/seed_e0.cpp`），门禁 20k 例 0 失配，对照
  **开源 NEON `processSaoCUE0_neon`（harness 直接编译
  loopfilter-prim.cpp）** + C 基线；
- 新 codegen 资产：sao_e0 ABI、`smax/smin/sqxtun/tbl1`、
  `vext_s8(a,b,7)`/`vqtbl1_s8(vcombine_s8(...))` shifter、
  <8 x i8> splat/vneg/vadd、标量 load、add/sub 的 128-bit `q` 判定、
  intrinsic arg 剥 `range(...)` 注解、splat 常量 add；
- 待办：saoCuOrgE0 的 **SVE2 搜索层**（svtbl 结构）、E1/E2/E3/B0、
  Stats 族（sao-prim-sve2.cpp 已有上游 SVE2 统计可对照）。

## 2. E0 语义（已实测）

每像素：`signRight = clamp(rec[i]-rec[i+1], -1, 1)`；
`edgeType = signRight + signLeft + 2`（carry：行内 signLeft 继承
**`-signRight[7]`**，行首来自 signLeft[y]）；`rec[i] = clip(rec[i] +
offsetEo[edgeType])`。NEON 用 `vtbl2`（clang 降级为
insertelement+shuffle+tbl1）实现 8 像素并行。

## 3. 后续执行顺序

1. **E0 SVE2 搜索**：svtbl（256 元素表）+ 16 像素块；carry 用
   `svlastb_s8` 或 extract；axis：block 宽（16/32）、table 布局
   （load5+zero vs dup）、clamp 结构（s16 min/max vs svabd）；
2. **E1 / E1_2Rows / E2 / E3**：垂直/对角 edge 类，共享 tbl 配方；
3. **B0**（band offset）：`(pixel>>3)` 查 32 项表，简单；
4. **Stats 族**：对照上游 SVE2（sao-prim-sve2.cpp）。

## 4. 风险

- edge 分类的 lane 间 carry 使向量化敏感，SVE2 搜索需保证
  `svlastb`/提取语义正确（E0 的 NEON carry 是 -sign[7]）；
- 门禁依赖 harness 直接编译 loopfilter-prim.cpp（静态函数），
  注意 HIGH_BIT_DEPTH=0 的宏分支。
