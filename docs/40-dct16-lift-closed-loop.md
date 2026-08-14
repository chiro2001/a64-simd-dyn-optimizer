# DCT16 闭环实验：MachineIR 线 → 配方种子 → 搜索复现（2026-08-14）

> 长期目标（/goal）的首个验收：新算子免手写特化发射器即达到手写特化
> 水平。DCT16 是试金石——它同时拥有通用线产物（m30 seed、roundtrip、
> lane 追踪）和特化线结果（699/847 fused/MCA）。

## 1. 闭环定义

```text
kernels/dct16 上游 NEON（dct16_neon）
  → ① 抽取：LLVM IR import（m30 seed，2244 节点）✅ 已完成
  → ② 检测：lane 追踪 + 共享常量矩阵（MachineIR 线，本实验补齐数值
     常量解析）
  → ③ 配方匹配：检测结果 → 蝶形族配方（odd/even k 族、G16 行号）
  → ④ 轴种子：配方事实 → 布局轴建议（legacy/narrow_merge/even_sve…）
  → ⑤ 搜索：search_sve2_layouts 全轴空间 → 复现 699/847（已存在工具）
  → ⑥ 验收：20k 差分 + TestBenchLite + fused/MCA 对照
```

“免手写”的含义：①②③④对 dct16 不得使用 dct16 专属的手写 Plan/发射器
逻辑；只允许通用检测 + 配方库（蝶形族配方本身是知识层资产，跨算子复用）。
⑤⑥复用现有搜索/验证工具。

## 2. 里程碑与验收

### M1a：MachineIR 线数值常量解析 + 共享矩阵检测（本实验第一步）

- 输入：`experiments/m30-dct16-search/imported/machine-ir.json`；
- 常量源：load 节点已带 `const_name/const_off`（g_t16 + 字节偏移）；
  由 x265 源码常量提取器解析（M1a2），不再依赖配方 G16 硬编码；
- 验收：检测命中数与 asm 线报告
  `shared-matrix-discovery.json`（39 个）一致或超集；
  命中常量逐值匹配 G16 行。

### M1b：配方匹配 + 轴种子

- 输出 `recipe-seed.json`：kernel=butterfly/dct16，odd/even 行号、
  splat 计数、轴种子（legacy_semantics/narrow_merge/even_sve/
  pass1_quarter…）+ 每条建议的证据（命中 id/常量行）；
- 验收：轴种子覆盖 699 组合的关键轴取值（pass1-quarter、
  legacy_semantics=1、narrow_merge=1、even_sve=1）。

### M2：搜索复现

- 用 M1b 种子约束后的轴空间跑 search_sve2_layouts（op 后端）；
- 验收：不手工挑选，复现 fused 699 / MCA 212（或更好）。

### M3：推广

- 同一流水线跑 m18 interp8、m2 sa8d seed；
- 验收：各达到与手写特化相同或更好的 fused/MCA。

## 3. 时间盒与止损

- M1a+M1b：1 个会话；M2：1 个会话；M3：每 seed 1 个会话；
- 任一步超预算先落差距文档（缺什么 op kind/布局自由度/常量源），
  回到混合路线，不无限投入；
- 特化线交付（950 数据、interp4vpp paired、ipb16 重测）并行不受阻。

## 5. 执行记录（2026-08-14）

### M1a ✅：MachineIR 线数值常量解析 + 共享矩阵检测

- `optimizer/analysis/linearize.py` 新增：
  - `resolve_const_loads()`：读 load 节点的 `const_name/const_off`
    （常量源见 M1a2）；
  - `lane_forms(ir, const_values)`：smull 遇常量叶子时按**叶子 lane
    映射**缩放系数（首版按 slot i 取值，shuffle 后错位；修复后
    consts 变为完整 G16 行）；
  - `shared_constant_matrix_outputs()`：asm 检测器的 MachineIR 移植。
- 新工具 `tools/recipe_seed.py`（原名 dct16_recipe_seed.py）：seed →
  检测 → 配方匹配 →
  轴种子 JSON。
- 结果（m30 seed，2244 节点）：
  - **44 命中**（asm 线 39 的超集），13 个唯一常量签名 vs asm 9 个，
    交集 8；多出的 5 个是偶路径（k4 行 4/12、k0 行 8 的
    [83,36,-36,-83] / [64,-64,-64,64] / [36,-83,83,-36]）；
  - asm 独有的 `[1,1,1,1]` 是 k0 偶路径的归一化形式（asm 线折叠系数），
    MachineIR 线用原始值匹配到 G16 行 8，覆盖面更完整；
  - 奇数行 1/3/5/7/9/11/13/15 全部精确匹配 G16（含 revneg 变体）。

### M1a2 ✅：通用源码常量提取（替代配方 G16 硬编码）

- 新工具 `tools/extract_x265_constants.py`：解析
  `third_party/x265/source/common/constants.cpp` 的 int16 表
  （g_t4/8/16/32、g_lumaFilter、g_chromaFilter），输出
  {符号: {字节偏移: 行值}}；
- 修复记录：花括号计数起点错误（regex 已消费开括号，只解析到第一行）；
  行宽正则灾难性回溯（g_t32 大块）→ 改从声明第二维度取行宽，宏维度
  （NTAPS_*）才解析首行；常量表键需用 x265 mangled 名
  （`_ZN4x2655g_t16E`）匹配 seed 的 const_name；
- `tools/recipe_seed.py` 自动提取常量（`--const-tables` 可指定
  JSON），不再 import dct16 专属 G16；
- 结果与 M1a 完全一致（44 命中、odd 1/3/5/7/9/11/13/15、
  even [4,8,12]、轴种子不变）——常量源已通用化。

> 为什么不用 ELF/rodata：MachineIR 的 const_off 是源码数组布局，而链接
> 后二进制（GCC 构建的 libx265）会重排常量表（dct16.rodata 中 g_t16
> 行被拆成低半+零填充/高半重复的 16 字节块），直接按符号+偏移解析会
> 错位。源码定义才是 LLVM IR 全局引用的布局，因此源码提取是该线路的
> 正确常量源。

### M1b ✅：配方匹配 + 轴种子

- `recipe-seed.json`：kernel=dct16/family=butterfly，odd_rows=全 8 行、
  even_rows=[4,8,12]，轴种子：
  `pass1=quarter, pass1_k_tile=2, pass2=odd-quarter, pass2_k_tile=1,
  legacy_semantics=1, narrow_merge=1, even_sve=1`；
- 与手写 699 组合逐轴对照：种子覆盖其全部关键轴（699 的
  `pass1_even_factor=1` 可由偶路径检测补充，种子未显式给出）。

### M2 ✅：搜索复现

- 全新 outdir 重跑 `search_sve2_layouts.py --backend op --kernel dct16
  --workers 8 --rank-by mca ... --outdir experiments/m30-dct16-search/
  lift-search`（32 候选全过差分）：
  - **fused 699 / MCA 212 / est NP1 125.5 / cp 43 / lite 5/5 PASS**，
    与 layout-search-proxy 完全一致；
- 胜出组合正是轴种子指向的角落。

### M3a ✅：interp8 / sa8d seed recipe（docs/41 §5）

### M3b ✅：FIR / diff-sum 检测 + 族→轴种子

- `tools/recipe_seed.py` 新增 `detect_fir` / `detect_diff_sum` 与
  `axis_seed_for`（知识层映射：结构事实 → 搜索轴）：
  - **interp8（fir）**：filter=g_lumaFilter、phases=4、taps=8、
    sdot=32、tbl=24、narrow=sqrshrun → 轴种子
    `compute=[sdot-h], pairsum=[addp]`（即手写最优 93 fused 的组合）；
  - **sa8d（diff-sum）**：sabd=4、abs=4、umax=4、reduce=uaddlv →
    轴种子 `reduce=[sve], reduce_tail=[saddv,dot-uaddv]`
    （saddv 即 186 最优）；
  - dct16（butterfly）行为不变（44 命中 + 原轴种子）。

### M3c ✅：interp8 / sa8d 端到端搜索复现（M3 验收）

- **interp8 8x8**：全轴空间搜索，轴种子指向 `compute=sdot-h,
  pairsum=addp` → **fused 93 / MCA 53**，与手写最优完全一致；
- **sa8d 16x16**：`reduce_tail=saddv` → **fused 186（过减半门）/ MCA 73**，
  与手写最优一致；`dot-uaddv` 189/72 次之；
- **sa8d 8x8**：修复 8x8 发射器遗留 `%s` 占位符 bug（`emit_pair`
  `_PAIR_PRE` 未替换前言占位，导致 sa8d 8x8 全部 BUILD FAIL）后搜索
  跑通：**evenpair+sve fused 79 / MCA 71**（基线 97，-18%；此前
  8x8 候选 116-125 反而更差，修复后为更好候选）；
- MCA 注意：interp8 sdot-h 需 patched llvm-mca +
  `--mca-bin /home/chiro/llvm-src/build-mca/bin/llvm-mca`
  （系统 llvm-mca 无 sdot.h 支持，默认会 WARN）。

**M3 验收达成**：三个族（butterfly/fir/diff-sum）都从 seed 出发，经
检测→轴种子→搜索，达到或超过手写特化水平。

### 结论

对 dct16，**抽取（M1a）+ 配方匹配/轴种子（M1b）+ 通用搜索（M2）的闭环
已跑通**：从上游 NEON 的 LLVM IR seed 出发，无需手写轴即自动指向并复现
手写特化最优（699/847）。剩余：
- M1a2：常量源从配方 G16 改为 ELF/rodata 符号解析（通用性）；
- M3：m18 interp8、m2 sa8d 走同一流水线。

## 4. 通用性边界（本实验明确记录）

- 常量解析先用配方库 G16（知识层资产），通用版改为 ELF/rodata 符号
  解析（记录为 M1a2）；
- 检测只覆盖“共享常量矩阵 × 逐行叶子”形状；其他结构族（滑动窗、
  差分归约）由后续配方扩展，不在本实验范围。

## 6. 通用发射器首个切片：diff-sum 配方（2026-08-15，/goal 免手写）

目标“新算子免手写特化发射器”的第一个可验证切片：
`tools/gen_sve2_emit.py` —— **只读 seed 的 MachineIR JSON**，按知识层
配方（op 形态 → SVE lowering）生成 SVE2 候选，不写任何 per-kernel
发射器。

- 配方（diff-sum）：`uabd + uaddlv` 对 = 行内绝对差求和；行数 =
  GEP 行偏移乘数的最大值+1；每行加载宽度 = 16 × uabd 组数
  （16x16 → 16 字节/行；32x32 → 32 字节/行，VL=256 整行一次）；
  lowering = `svld1_u8 + svabd_u8 + svaddv_u8` 累加。
- 接入：`search_sve2_layouts.py --backend gen`（make_emitter 顶层
  gen 分支，manifest 符号/verify/trace/MCA 全复用现有漏斗）。
- 验收（20k 差分 0 失配，experiments/m30-sad-search/gen-search-*）：
  - **sad-16x16：80 fused / MCA 69** —— 与手写最优完全一致；
  - **sad-32x32：160 fused / MCA 118** —— 与手写最优完全一致。
- 过程中修掉的推导 bug：行数不能取 uabd 节点数（32x32 每行 2 组），
  必须按 GEP 行偏移；加载宽度取 16×组数而非固定 16（否则 32 宽行
  拆 2×16，指令数翻倍）。
- 结论：diff-sum 家族（sad 16/32）已达成“免手写发射器即复现手写
  最优”；同配方可扩展到 sa8d/satd（还需 addp/abs/reduce 变体），
  其他配方（butterfly/fir）按同一机制继续加。

## 7. 通用发射器配方注册表（2026-08-15）

- `tools/gen_sve2_emit.py` 重构为 **RECIPES 注册表**：每个配方 =
  (detect 签名, emit lowering)。`--backend gen` 按第一个命中的配方
  生成候选；识别到但没有 lowering 的家族（hadamard/fir）给出明确的
  “recipe gap”错误，绝不静默误发。
- 现状：diff-sum（sad 16/32，80/69 与 160/118 复现手写最优）；
  hadamard（sa8d 8x8 签名已识别）、fir（interp8/4 签名已识别）待
  实现 lowering。
- 新增配方协议：在 `tools/gen_sve2_emit.py` 加 `detect_*` +
  `emit_*` 并注册即可；同配方的新算子（形状/行数/宽度）由
  MachineIR 自动推导，无需写 per-kernel 发射器。

## 8. hadamard 配方落地（2026-08-15，sa8d 8x8）

- `tools/gen_sve2_emit.py` 新增 hadamard 配方：把 sa8d 8x8 的
  MachineIR DAG（167 节点：8 行 u8 load → zext/sub → 2D Hadamard
  蝶形 → sabd/abs/umax → uaddlv(+1>>1)）逐节点翻译为 SVE2 ACLE：
  - load/zext → svld1_u8(pg8) + svunpklo_u16（8-of-16 lane 布局）；
  - add/sub/sabd/abs/umax → svadd/sub/abd/abs_s16_x(p16) +
    svmax_u16_x；
  - **shuffle 映射**：NEON trn1/trn2（奇偶交错）→ SVE
    svtrn1/svtrn2（s16/s32）；`<2 x i64>` 的 trn = 4×s16 块搬移，
    用 svsplice(pg4)（trn1）与 rot4+svsplice（trn2）；
  - reduce → svaddv_u16(pg8h)（**坑：必须用 16 位 8-lane 谓词
    pg8h，用 b8 谓词只会激活 4 个 16 位 lane**）。
- 验收（20k 差分 0 失配，experiments/m30-sa8d-search/
  gen-search-8x8/results.json）：**126 fused / MCA 67 / dyn 150**；
  对比手写最优 79 fused / MCA 71 —— 指令数更高（pack=1 朴素版），
  但 MCA 反而更好；pack=2/evenpair 等布局轴留给配方后续版本。
- 调试记录：trn1/trn2 的 NEON 语义是奇偶交错（曾误映射 zip1/trn2
  导致 v105 起全错）；splice 的 i64 语义已实测验证。

## 9. hadamard 配方跨形状推广：sa8d-16x16（2026-08-15）

- 同配方直接覆盖新成员（零 per-kernel 发射器代码）：
  `seeds/sa8d-16x16.yaml`（目标 `pixel_sa8d_16x16_neon`，653 节点）；
  配方新增 op：常量字节偏移 GEP（左右 8 列象限 +8）、
  `[0,1,2,3,8,9,10,11]` 的 s16 低半拼接 shuffle（svsplice(pg4)）、
  `uaddlp`（NEON-bridge `vpaddlq_u16`，GCC 16 无 svpadd）、
  `vecreduce_add`（svaddv_u32(pg4w)）。
- 验收（20k 差分 0 失配，experiments/m30-sa8d16-search/
  gen-search-16x16/results.json）：**505 fused / MCA 157 / dyn 602**；
  对比手写最优 186 fused / MCA 73 —— 正确但 pack=1 朴素布局
  （8-lane 行处理 + NEON 桥）尚未利用 16-lane 行寄存器；pack/layout
  轴是 hadamard 配方下一阶段的优化方向。
- 配方检测放宽：hadamard 签名 = sabd+abs+umax + (uaddlv | uaddlp+
  vecreduce_add)。

## 10. fir 配方落地：interp8 8x8（2026-08-15，第三个族）

- `tools/gen_sve2_emit.py` 新增 fir 配方：interp8 hpp 的
  MachineIR（136 节点，m18）→ SVE2 ACLE：
  - 每行 16 像素滑窗（svld1_u8 pg16b，src+r*stride-3）→ s8
    （sub 128）；
  - 共享滑窗 permute（IDX0/1/2 从 taps/宽度推导：输出组 0-3 taps
    0-3、组 0-3 taps 4-7、组 4-7 taps 4-7）→ svtbl_s8；
  - 4-way dot：svdot_s32(acc=8192, perm, b0/b1)，b0/b1 = 系数
    f0..f3 / f4..f7 按 4-lane 组重复（svtbl 构造）；
  - 窄化走 **NEON-bridge**（vmovn/vcombine/vqrshrun）——QEMU 的
    svqxtnb/svqrshrunb 在 VL=256 下结果错位（偶数 lane 插零），
    与手写发射器同法规避；
  - 系数来自 `extract_x265_constants` 的 g_lumaFilter（通用源）。
- 验收（20k 差分 0 失配，experiments/m30-interp8-search/
  gen-search-8x8/results.json）：**106 fused / MCA 52 / dyn 170**；
  对比手写最优 93 fused / MCA 53 —— 指令数高 14%，MCA 更好。
- 坑：u8 的 load/tbl 必须用 **b8 谓词**（用 b16 谓词只激活偶数字节，
  曾致 8 输出里 6 个为 0）；stride 参数 '1'/'3' 只能按需解析，不能
  预置进 env（会与 load dst 同名冲突）。
- **通用发射器现状**：diff-sum（sad 16/32）、hadamard（sa8d 8x8/
  16x16）、fir（interp8 8x8）三个族全部由 MachineIR 自动生成并过
  20k 差分；除 sa8d 16x16 外，MCA 均不差于手写最优。

## 11. fir 配方跨形状推广：interp8 16x16 / 32x32（2026-08-15）

- 同配方覆盖全部三个 hpp 形状：`_fir_derived` 从 store 地址链推导
  行数（rows=stores/groups）、从 sqrshrun 取精度；发射器按
  `for r / for g` 双层循环（每组 8 输出、16 样本滑窗，组偏移 g*8）。
- 验收（各 20k 差分 0 失配，experiments/m30-interp8-search/
  gen-search-16x16|32x32/results.json）：
  - interp8-16x16：**457 fused / MCA 130**（手写 327/114）；
  - interp8-32x32：**1801 fused / MCA 441**（手写 1289/369）。
- 推导坑：行数必须解析 shl/mul 的 stride 倍数（否则 16x16 只推出
  4 行 × 8 组）。

## 12. fir 配方 4-tap 变体：interp4 8x8/16x16/32x32（2026-08-15）

- `_fir_derived` 泛化：taps（4/8 从系数 load 类型）、窗偏移
  （src-1 / src-3 从首 addr 常量）、滤波器表（g_chromaFilter /
  g_lumaFilter 从全局名）、相位（chroma 0..7 / luma 1..3）；
  idx 模式按 taps 生成（4-tap 2 组 perm、8-tap 3 组）；
  groups = store 宽度组数 × 每行 store 数（16 字节 store 覆盖 2 组）。
- 验收（各 20k 差分 0 失配，experiments/m30-interp4-search/
  gen-search-*）：
  - interp4-8x8：**94 fused / MCA 44**（手写 85/47，MCA 更好）；
  - interp4-16x16：**358 fused / MCA 103**（手写 165/70）；
  - interp4-32x32：**1414 fused / MCA 344**（手写 645/189）。
- **fir 配方共覆盖 6 个形状**（interp8 8/16/32 + interp4 8/16/32），
  全部 MachineIR 自动生成；8x8 两形状 MCA 均优于手写。

## 13. satd-8x8：新算子零改动命中 hadamard 配方（2026-08-15）

- 首次覆盖 satd（docs/37 之前未覆盖）：`seeds/satd-8x8.yaml`
  （目标 `satd8_neon<8,8>`，125 节点）+ `kernels/satd-8/manifest.yaml`
  （复用 sa8d 的 verify 形态，参考上游 `satd8_sve2<8,8>`）。
- 检测：MachineIR op 集（sabd/abs/umax/uaddlv + trn1/trn2 s16/s32）
  与 hadamard 配方签名完全一致，**零发射器改动**直接生成 SVE2 候选。
- 验收（20k 差分 0 失配，experiments/m30-satd-search/
  gen-search-8x8/results.json）：**93 fused / MCA 51 / dyn 108**；
  无手写基线（首次覆盖），对照上游 satd8_sve2 差分通过。
- 意义：这是“新算子免手写特化发射器”最直接的一例——算子从未
  覆盖过，仅凭 MachineIR 命中配方即完成优化候选生成与验证。

## 14. satd 4x4 / 16x16：hadamard 配方补 3 个 op 形态（2026-08-15）

- 4x4（57 节点）：新增 `insertelement <2 x i32>`（NEON-bridge
  vsetq_lane 链）、标量 i32 load、`<2 x i32>→<8 x i8>` bitcast；
  uaddlv 的 src 若已是 u16 不再 reinterprete（修 as_u16）。
- 16x16（507 节点）：新增 `<16 x i8>` 行 load（pg16b）、u8 低/高
  8 提取（[0..7]/[8..15] → svget_neonq + vget_low/high + vcombine）。
- 验收（各 20k 差分 0 失配，experiments/m30-satd-search/
  gen-search-4x4|16x16/results.json）：
  - satd-4x4：**37 fused / MCA 57**；
  - satd-16x16：**441 fused / MCA 133**；
  - （satd-8x8 此前 93/51）。
- satd 三个形状全部由 hadamard 配方覆盖；无手写基线（首次覆盖），
  对照上游 satd4/satd8_sve2 差分通过。

## 15. satd 4x8 / 8x16（2026-08-15）

- 同配方继续覆盖：satd-4x8（107 节点，insertelement 双行打包）与
  satd-8x16（251 节点）均命中 hadamard，零发射器改动。
- 验收（各 20k 差分 0 失配，experiments/m30-satd-search/
  gen-search-4x8|8x16/results.json）：
  - satd-4x8：**63 fused / MCA 62**；
  - satd-8x16：**185 fused / MCA 70**。
- satd 已覆盖 4x4/4x8/8x8/8x16/16x16 五个形状。

## 16. vertical-fir 配方：interp8 vpp 16x16（2026-08-15，第四个族）

- `tools/gen_sve2_emit.py` 新增 vertical-fir 配方：interp8 vpp 的
  MachineIR（571 节点，umull+sqrshrun 结构）→ SVE2 ACLE：
  - 垂直滤波是 lane-wise（列共享同一组 tap），16 宽行用**一个**
    16-lane s16 累加器（svunpklo_u16 整行加宽）即可；
  - 每 tap：svld1_u8(pg16b) + svmul_s16(dup(|c|))，符号用
    svadd/svsub 区分；
  - 窄化走 NEON-bridge（svget_neonq 低 8 + svtbl 高 8 + 两次
    vqrshrun + vcombine），QEMU qxtnb 错位规避；
  - 系数来自 g_lumaFilter 相位 1..3，运行时 coeffIdx 分发。
- 验收（20k 差分 0 失配，experiments/m30-interp8vpp-search/
  gen-search-16x16/results.json）：
  - sliding=0（逐 tap 加载）：**593 fused / MCA 259 / dyn 1761**；
  - sliding=1（11 行→23 行全部预加载 + 加宽外提 + svmla/svmls
    融合）：**385 fused / MCA 171 / dyn 1057**（-35%/-34%）；
  - sliding=2（4 行分组 + 11 寄存器旋转窗口，新行按组补载）：
    **387 fused / MCA 161 / dyn 1024**（best，MCA 距手写 157 仅
    2.5%）；
- 手写 247/157。

## 17. vertical-fir 跨宽度：interp8 vpp 32x32（2026-08-15）

- vpp-32（2191 节点，64 个 16 字节 store）通过 store 地址链推导
  行数（32）与列组（2）；发射器按列组循环（每列组 16 列）复用全部
  sliding 变体。
- 验收（20k 差分 0 失配，experiments/m30-interp8vpp-search/
  gen-search-32x32/results.json）：
  - sliding=0：2369 fused / MCA 965；
  - sliding=1：1625 / 645；
  - sliding=2：**1501 / 583**（best）；
  - 手写 936/547 —— MCA 差 6.6%。
- 通用发射器现覆盖 4 个配方族、16 个算子形状。
