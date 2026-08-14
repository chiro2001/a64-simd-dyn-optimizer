# sao 族覆盖计划（2026-08-15）

> docs/37 最大剩余族（10 字段：saoCuOrgE0/E1/E1_2Rows/E2×2/E3×2/B0 +
> saoStats）。与 quant 不同：aarch64 有 **ACLE NEON 实现**
> （loopfilter-prim.cpp），可直接作 seed 语义源。

## 1. 现状

- saoCuOrgE0 ✅（2026-08-15）：固定 width=64、2 行全展开 seed
  （`kernels/sao/seed_e0.cpp`），门禁 20k 例 0 失配，对照
  **开源 NEON `processSaoCUE0_neon`（harness 直接编译
  loopfilter-prim.cpp）** + C 基线；
- saoCuOrgE0 **SVE2 搜索 ✅（305 fused / MCA 133，20k 0 失配）**：
  svld1sb 符号扩展 offset 表 + svtbl_u16 查表 + splice/tbl 构造
  per-lane signLeft（[signL, -sr0..-sr6]）+ 有符号 s16 clip +
  svqxtnb_u16 无符号窄化；
- saoCuOrgB0 ✅（2026-08-15）：seed（vld1_s8_x4 + vtbl4，64x4）门禁
  20k 0 失配；SVE2 搜索 **386 fused / MCA 126**（u16 域索引 +
  svtbl_s8 + 有符号 clip + 无符号窄化；略重于 NEON 的 u8 直查，诚实
  记录）；codegen 新增 ld1x4/extractvalue/tbl2/vshr 向量/vcombine_s8；
- saoCuOrgE1 ✅（2026-08-15）：seed（逐行镜像 processSaoCUE1_neon，
  64x4，upBuff1 逐像素更新，无行内 carry），门禁 20k 0 失配；SVE2
  搜索 **610 fused / MCA 171**；codegen 新增 s8 store/load 基、
  sao_e1 ABI；
- saoCuOrgE2 ✅（2026-08-15）：seed（64x1，右下邻居 + bufft[x+1]
  偏移 1 存储），门禁 20k 0 失配；SVE2 搜索 **154 fused / MCA 74**；
- saoCuOrgE3 ✅（2026-08-15）：seed（64x1，向量块 1..56 + 标量尾
  57..63，动态 offsetEo 查表），门禁 20k 0 失配；SVE2 搜索
  **135 fused / MCA 73**；codegen 新增通用资产：标量 i32/i64
  有符号算术（修复无符号 et 导致动态索引越界）、动态 GEP +
  标量 load/store（s8 基有符号）、`llvm.ucmp/smax/umin` 标量
  intrinsic、通用 llvm intrinsic 导入（剥 range 注解）；
- 新 codegen 资产：sao_e0 ABI、`smax/smin/sqxtun/tbl1`、
  `vext_s8(a,b,7)`/`vqtbl1_s8(vcombine_s8(...))` shifter、
  <8 x i8> splat/vneg/vadd、标量 load、add/sub 的 128-bit `q` 判定、
  intrinsic arg 剥 `range(...)` 注解、splat 常量 add；
- 待办：E1_2Rows、Stats 族（sao-prim-sve2.cpp 已有上游 SVE2
  统计可对照）；E0 若追求更优可试 16 像素/块（降低 splice/tbl
  每块开销，当前 305 vs NEON ~230）。

## 6. E3 完成记录

- E3 有 (startX, endX) 范围：endX=64 时向量块覆盖 1..56、标量尾
  57..63（7 像素），标量尾用 offsetEo[动态索引] —— 已实现动态 GEP
  + 标量 load/store；坑：标量 add 必须按 LLVM 有符号（et 为负时
  uint 会让动态索引变成 2^64-2）、s8 基标量 load 必须带符号
  （-8 不能读成 248）。

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

## 5. E0 SVE2 语义实测记录

- offset 表必须**符号扩展**（svld1sb_u16），零扩展会把 -4 变成 252；
- per-lane signLeft = [signL, -sr0..-sr6]，用
  `svsplice(pg8, nsr, dup(signL))` 把 signL 放到表 lane8，再
  `svtbl_s16(table, [8,0..6])` 取出；
- clip 必须在 **s16 有符号域**（-2→0，不能按 u16 65534→255）；
- 窄化必须用**无符号** `svqxtnb_u16`（`svqxtnb_s16` 会把 >127
  饱和成 127，破坏 128..255 输出）。
