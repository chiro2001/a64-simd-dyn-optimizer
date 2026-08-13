# M30-DCT16-Search：DCT16 seed 导入 + roundtrip codegen + 常量重排 rewrite 设计

- run-id: `m30-dct16-search`
- state: `in-progress`（step 1-2 完成；step 3 rewrite 进行中）
- date: 2026-08-13（Asia/Shanghai）
- 目标：让**搜索工具**（而不是手写 kernel）发现内部 DCT16/DCT32 的
  "常量重排"优化（用户输入：内部 SVE256 实现靠常量重排减 shuffle，+30~60%）

## Step 1-2 完成：seed + roundtrip

- `scripts/extract-dct16-seed.sh`：clang `-O3 -funroll-loops` +
  unroll 阈值把 `dct16_neon` 展开成直线代码，importer 导入 **2244 节点**：
  304 shuffle（8 种 mask：rev16/rev32/rev64q/half-extract/concat）、
  512 smull、320 addp、128 rshrn、132 sext、368 add、187 mul。
- importer 修复：shufflevector 的结果类型 = mask 长度 × **源元素类型**
  （此前硬编码 i32，<8 x i16> 源会错）；alloca/lifetime 已支持。
- `emit_dct16_c_intrinsics`：NEON roundtrip，qemu 20 万例
  `candidate_vs_neon_mismatches=0`（与上游 dct16_neon 位级一致）；
  与 C 的 7 例分歧即上游自身已知的 0.0045% 潜在分歧。

## Step 3：常量重排 rewrite（进行中）

### 已实现：shuffle 外提（`hoist_shuffles`）

`add(P(x), P(y)) == P(add(x, y))`（P 为纯置换、两个操作数同 P）：
把公共置换从 elementwise add/sub 外提。带 2 条单测；但在 DCT16 seed 上
命中 0 次——实际数据路径是"单边置换"（`add(shuffle(x,P), y)`），单边外提
不保语义。

### 设计：lane 追踪线性化 pass（DCT16 真正需要的规则）

每个值维护符号形式：`{lane_i: [(coeff, leaf_lane), ...]}`，叶子 =
load/sext(load) 的 lane。逐 op 传播：

| op | 传播 |
| --- | --- |
| shuffle(P) | lane i ← 源 lane P[i] |
| add/sub | 两操作数项并集（sub 取负），同源 lane 系数合并 |
| mul(const_vec c) | 每项系数 × c[i]；splat 则统一缩放 |
| smull / sext | 1:1 |
| addp(a,b) | lane i ← a[2i]+a[2i+1]（b 同），项两两合并 |
| rshrn | 1:1 窄化 |

实测项数分布（128 个窄化输出）：1 项 ×8、2 项 ×32、**16 项 ×56**、
256 项 ×32。16 项的是偶数路径输出。

关键形状发现：DCT16 偶数输出是 **共享常量矩阵 × 逐行叶子**
（`out[i] = dot(C, leaf_i)`，C 对 4 个输出 lane 共享），不是"叶子 lane 与
输出 lane 对齐"的 elementwise 组合。因此：

- 已实现的 `fold_shuffles_into_constants` 只处理**对齐**形状（否则语义
  错误），单测覆盖对齐/置换两种 case；在 DCT16 seed 上按设计命中 0 次；
- 下一增量 = "共享常量矩阵"规则：检测 `out[i] = Σ_j C[j]·leaf_i[j]`，
  改写为 `mul(C_lo, leaf_i_lo) + mul(C_hi, leaf_i_hi) + addp`（C 预置换、
  跨输出共享），运行时 rev32/zip/rev64 全部消失。预算 =
  `linearize_max_terms` 控制触发范围：

1. 项数少 → 直接 mul+addp（SVE256 上 tbl/splice permute 更贵，收益反转）；
2. 项数多 → 不触发（避免 NEON128 的稠密亏损）；
3. 项数 = 预算边界由搜索枚举（`--rewrite linearize_max_terms=N`）。

正确性门：rewrite 输出必须过**上游位级一致**差分（2026-08-13 用户决定：
候选与被替换的开源 kernel 一致即可，不需要完全对应 C ref；C oracle
只作算法/规格审计）；指令数门：shuffle 计数下降且总 SIMD+load
不显著上升；实机门：N1/920B 双口径 paired（NEON 后端），N+2 接入后
SVE256 后端复用同一 rewrite。

## 产物

- `experiments/m30-dct16-search/imported/machine-ir.json`（seed）
- `build/dct16_roundtrip.cpp/.o`、`kernels/dct16/roundtrip_verify.cpp`
- `optimizer/ir/codegen.py::emit_dct16_c_intrinsics`
- `optimizer/ir/rewrites.py::hoist_shuffles` + 2 单测

## 动态流发现结果（2026-08-13）

在 DCT16 单次执行的 QEMU 动态流上，完整发现链（抓取 → 常量解析 → 语义
lane 追踪 → 共享矩阵检测）得到：

- **45 个可常量重排的窄化输出**：
  - 24 个 `[1,1,1,1]` splat 求和（偶数路径，置换可直接删除）；
  - 21 个 g_t16 奇数行点积，常量逐值精确匹配（`[90,87,80,70,57,43,25,9]`
    = 行1、`[87,57,9,-43,-80,-90,-70,-25]` = 行3 …）；
- 每个输出形如 `out[i] = dot(C, O_row_i)`，C 跨输出 lane 共享——即内部
  DCT16 实现靠常量重排消除数据 shuffle 的结构，由工具自动发现。

待完成（发射）：把检测到的 C 与叶子自身 tbl 置换组合成全量 C'，对每个
输出发射 `mul(C'_lo, raw_lo) + mul(C'_hi, raw_hi) + addp`；8 个奇数输出
共享同一组 O，全部改写后 O 链成为死代码，64 个常量 tbl 整体消失；再走
上游位级一致差分 + 两机双口径实测。

## 视图归一化 + 全量组合验证（2026-08-13）

- `.2d` 的 zip/uzp 建模为 4-lane s32 置换（64-bit lane = s32 对）；
  `.8h/.16b` 消费 4-lane 形式时按"低半=值、高半=0"展开（DCT16 的
  E/EE 中间值 ≤2040，适配 s16）；
- 解析门禁命中：res1（g_t16 行1）的全量组合
  `C' = C[j] - C[7-j] = [81,62,37,13,-13,-37,-62,-81]`，与 lane-tracking
  输出的逐 lane 系数完全一致——rev16 tbl 已正确折进常量；
- 剩余一个建模缺口：`ldp q28,q23` 一次载入两行（行 i 与镜像行 15-i），
  当前 importer 只给第一个寄存器 8-lane 形式，第二个寄存器成为独立
  叶子，导致 lane 1-3 的合并停在两叶（load + rev16(mirror)）。补上
ldp 双寄存器分叶后，45 个输出的全量 C' 全部闭合，即可发射。

## SVE2 稠密点积探针：C-exact + lane 语义修正（2026-08-13）

`kernels/dct16/candidates/sve2_dense.cpp`：把 DCT16 整体视为两个稠密
16×16 矩阵乘（VL 固定 256），每个输出系数行 k 一条 16 系数 SVE2 SDOT
（s16→s64），修复两个 lane 语义问题后：

```text
qemu-aarch64 -cpu max,sve-max-vq=2 build/dct16_sve2_verify 300000
cases=300000 mismatches=0     # stride {16,17,32}
```

修复中确认的 SVE2 lane 语义（已写入 `isa/aarch64/instructions.yaml`）：

1. `SDOT .d, .h, .h` 在 VL=256 时：16 个 s16 操作数 → 4 个 s64 lane，
   每 lane = 连续 4 元素的点积（lane 顺序线性，无跨段混排）；
2. `RSHRNB .h, .s` 把每个 s32 结果放在**偶数** s16 lane、奇数 lane 置零，
   连续存储前必须 `UZP1` 压缩一次；
3. `ADDP .d` 是 128-bit 段内两两相加（`[a0+a1, b0+b1, a2+a3, b2+b3]`），
   配合 `UZP1/UZP2` 才能把每行两个 8 元素半积合成 16 元素全积。

### 口径修正：稠密逐输出形式不是目标形态

早期"~500 条 SVE2 / 3.1x 削减"的估算**作废**：它把 4 输出共享常量组的
~21 条指令与"NEON 稠密点积 ~55 条/输出"对比，而后者不是上游 DCT16
的基线。真实基线是上游 butterfly 动态流：全 DCT16（两遍）**1553 条向量
指令、~3 条/输出**（addp 320 + smull2 256 + smlal 256 + mul 176 + rshrn
112 + tbl 80 …）。逐输出稠密 SDOT 形式实测 ~6.5 计算 + 1.5 访存/输出，
两遍约 3300+ 条，**反而约 2.1x 劣于上游**——稠密形式重算每输出的 16
个 MAC，丢失了 butterfly 跨系数共享的 E/O/EE/EO 部分和。

因此正确的发射形态是**共享叶子的 butterfly + 预置常量点积**：

- 每输入行只算一次 E/O（8 lane）与 EE/EO/EEE/EEO（4/2 lane），16 个
  系数输出共享；
- 每个输出系数只做 8/4/2 元素点积，常量 C 预先置换好，运行期 tbl/rev
  链消失；
- SVE256 下 4 行一组打包，`SDOT` 一次算 4 个输出的 4 元素部分积 +
  `ADDP` 合成，预算约 2-3 条/输出（含窄化/存储）→ 与上游 3 条/输出
  相比才有 +30~60% 空间，与内部 DCT16 结论一致。

### 可复现发现报告（工具增量）

`tools/dct16_shared_discovery.py` 固化发现管线：trace JSON + .rodata
dump → 常量解析 → lane 追踪 → 共享常量矩阵检测 → 结构化 JSON 报告：

```sh
python3 tools/dct16_shared_discovery.py \
  experiments/m30-dct16-search/trace/dct16-dynamic.json \
  build/dct16.rodata --out experiments/m30-dct16-search/shared-matrix-discovery.json
```

报告结果：**39 个命中**（奇数输出），16 个跨命中共享的叶子（4 行 ×
O 高低半），17 组不同常量向量，每个命中 = 4 个输出 lane 共享
`[C, -rev(C)]`，叶子即 ldp 加载的 raw 行对（行 i 与镜像行 15-i）——
即常量重排已经折进 C，运行期数据置换可整体删除。该 JSON 是下一步
发射器（row-hoisted butterfly + SDOT）的输入契约。

结论闭环（修正版）：工具在动态流上发现常量重排结构 ✅ → NEON128 稠密
发射被否决 ✅ → SVE256 稠密探针 C-exact ✅ → 稠密逐输出形态因丢失共享
部分和被否决 ✅ → 下一步发射"共享叶子 butterfly + 预置常量 SDOT"，
静态预算约 2-3 条/输出，等待实机验证。

## 上游 SVE DCT16 基线（2026-08-13）

在 920B 用 Miniforge3 + clang 22.1.8（conda-forge）原生构建 x265
（`ENABLE_SVE=ON ENABLE_SVE2=ON ENABLE_NEON_I8MM=ON`；注意
`ENABLE_NEON_I8MM=OFF` 会因 x265 的级联约束静默禁用 SVE，缓存里
`ENABLE_SVE` 仍显示 ON，但 SVE 源文件不会进 build.ninja）。库同步回
本地：`build/x265-8-clang-sve/libx265.a`，QEMU `sve-max-vq=2` 下差分：

```text
kernels/dct16/sve_roundtrip_verify: cases=100000 lanes=25600000
  mismatches=48 rate=0.000188%   first-diff idx=18 want=2773 got=-2987
```

上游 SVE kernel 与 C 参考存在约 0.000188% 分歧——2026-08-13 用户决定这
属于行为合同（候选必须复现，而不是修正）。动态指令流（固定 VL=256，
同一输入，与 NEON trace 同口径）：

```text
dct16_neon (fully unrolled): total=2074 vector=1553
dct16_sve  (looped):         total=2047 vector=1577
```

> **口径修正（2026-08-13）**：此前的 `dct16_sve total=970 vector=689`
> 是 `-d in_asm` 的翻译一次计数，循环体只算一遍，**不是真实动态流**；
> 真实动态计数需 `-d exec,in_asm` 合并（tools/parse_qemu_trace.py
> `--exec`，tools/trace_kernel.sh 已切换）。按真实动态口径，开源 SVE 版
> 的向量指令数（1577）与 NEON（1553）基本持平——SDOT 替换并没有带来
> 动态指令削减，689 是方法学假象。

工具生成候选的目标基线因此仍是 **NEON/上游 SVE 的真实动态向量指令数
（~1550-1580）**：纯 SVE256 宽度（每 SDOT 处理 4 个输出而非 2 个）叠加
常量预置换后，动态预算应显著低于 1550 且与上游 dct16_sve 位级一致，
才值得进入 960 实机。

## 工具发射器 v1/v2 + 正确性反例（2026-08-13）

### 合同修订 + 口径修正（用户决定，2026-08-13）

> 我认为只要和开源算子一致，就可以，不需要完全对应 c ref

正确性合同从 `c-exact`（candidate == C 参考）改为 **`upstream-exact`**
（candidate == 被替换的开源 kernel，位级一致）。影响：

- C oracle 仍是算法/规格审计层，不再是默认接受门；
- 上游 SVE 与 C 的 ~0.000188% 分歧成为行为合同的一部分，候选必须
  复现而不是修正；
- 因此 v2 的 pass2 叶子位宽要求以**上游实现**为准（E=s32、O=s16），
  而不是以 C 的 int32 E/O 为准；
- 文档落盘：docs/04-validation-benchmark.md V0.5、docs/08 ADR A009、
  round-0007 decision 第 7 条标注取代。

### v2.1：pass2 复刻上游结构，达到位级一致（2026-08-13）

发射器新增 `pass2_upstream`（E 走 vaddl s32、O 走 s16 bridge SDOT、
偶数路径用 t8_even `[a,b,a,b]` 重复常量，与上游 pass2Butterfly16_sve
逐行一致），修复过程中发现并修正两处常量错误：`t8_even` 是重复排列
（不是 g_t8 行），`GT16_S32` 索引应为 `(k-2)/4`。结果：

```text
build/dct16_sve_shared_verify 200000
cases=200000 lanes=51200000 mismatches=0 rate=0.000000%   # 上游位级一致

true-dynamic (exec+in_asm):
dct16_neon : vector=1553
dct16_sve  : vector=1577
shared v2.1: vector=1636   (total=2353)
```

v2.1 是第一个**上游位级一致**的工具生成 SVE2 候选；真实动态向量数 1636
比上游 SVE 1577 高约 4%——结构上 pass1 的"每行一个 sdot + NEON bridge
窄化"仍有冗余，v3 四分之一交错布局（2 sdot + 1 addp 出 4 输出）是下一
个主假设，目标动态向量数 < 1200。

## v3：四分之一交错 pass1（2026-08-13）

发射器新增 `pass1_layout=quarter`：4 行的 E/O 低/高 4 元素交错打包成
16-lane 寄存器（QE0/QE1/QO0/QO1，每 4 行 8 个 tbl2，跨 16 个 k 复用），
常量 `[C0..C3]×4` / `[C4..C7]×4` 预复制，每个 k 每 4 行 =
2 sdot + 1 add（对齐的部分积直接相加，不需要 addp 树）+ 纯 SVE 窄化
（uzp1_s32 + rshrnb + uzp1_s16 + 4-lane store，经 20 万例确认与上游
vrshrn 舍入一致）。结果：

```text
build/dct16_sve_shared_verify 200000: mismatches=0（上游位级一致）

true-dynamic vector counts（raw / movprfx / fused_adj，docs/09 §1.5）：
dct16_neon : 1553 / 0 / 1553
dct16_sve  : 1577 / 0 / 1577
shared v2.1 : 1636 / 384 / 1252
shared v3   : 1246 / 192 / 1054   ← 实机融合口径最优
```

960 周期估算（SVE 4×256 vs NEON 4×128 同 pipe 数，fused_adj 口径）：
1054/4=264 vs 1553/4=388 → 约 +47%。距离 +130% 目标（约 700 向量）的
主要缺口在
**pass2（724 条，仍是上游 NEON/SVE bridge 结构）**：v4 需把 pass2 也
改成 SVE2 四分之一布局（E 走 s32、O 走 s16 sdot 或 smull 变体），
静态目标 pass2 < 200。

## v4：pass2 奇数路径 quarter 化（2026-08-13）

发射器新增 `pass2_layout=odd-quarter`：偶数 k 与 E/EO/EEE/EEO 保持上游
NEON 结构（E 必须 s32），奇数 k 改为 O 的四分之一交错打包 + 2 sdot +
1 对齐 add + 纯 SVE 窄化（每组 4 行 4 个 tbl2 打包，跨 8 个奇数 k
复用）。修复了发射器格式化残留变量 bug（`QO0_%d` 引用循环外 g=3）。

```text
true-dynamic vector counts（均与上游 dct16_sve 位级一致）：
shared v3 (p1-quarter)     : raw 1246 / fused_adj 1054
shared v4 (p2-odd-quarter) : raw 1183 / fused_adj 1087
```

> 融合口径结论（用户 2026-08-13）：movprfx 在实机上与下一条指令融合
> 执行，不占独立发射/周期；排名以 fused_adj 为准（docs/09 §1.5）。
> 因此 **v3 在实机口径下优于 v4**（1054 < 1087）：v4 省下的 sdot/
> movprfx 被新增的 tbl2/mov 打包开销抵消。raw 口径 v4 仍更少，两档
> 都要记录；验收以实机 cycles 为准。

960 周期估算（fused_adj）：v3 1054/4=264 vs NEON 1553/4=388 → 约
+47%。`tools/search_sve2_layouts.py` 枚举 3 个布局组合（全部过 20k
上游差分），排名键已切换为 fused_adj。偶数路径（E s32）仍是 pass2 的
主要剩余（~600 条），其 SVE2 重构在 s32×s32→s64 点积无原生指令的
前提下暂不划算；等待 round-0008 专家建议后再定 v5 方向。

`tools/emit_dct16_sve2_shared.py` 参数化发射器：由 g_t16 常量与发现结构
生成 SVE2 VL=256 kernel（`kernels/dct16/candidates/sve2_shared.cpp`），
构建命令可完全复现。已实现的搜索参数：

- `pass1`：s16 E/O 叶子（每行 `TBL` 全 16-lane 反转 + add/sub）+ 每行
  一个 `SDOT .d`（常量 [C|C] 预复制）+ NEON bridge 连续窄化
  （svget_neonq + vmovn + vcombine + vpaddq + vrshrn + vst1）；
- v1 纯 SVE 窄化（RSHRNB/RSHRNT）被否决：实证发现 SVE2 窄化把结果放在
  每个 128-bit 段内的偶数/奇数半宽 lane，无法连续排列 4 个输出
  （h=[f0,f1,hi0,hi1]），这是 v1 全部 lane 错乱的根因；
- v2 通过 20 万例差分后仅 11 处与 C 分歧（5.5e-5/例）：

```text
build/dct16_shared_verify 200000        # C 参考审计（合同修订前口径）
dct16 sve2 shared mismatch stride=32 first-diff idx=9 want=-2270 got=1826

build/dct16_sve_shared_verify 100000    # 接受门：上游 dct16_sve 位级一致
cases=100000 lanes=25600000 mismatches=24 rate=0.000094%
```

反例归因：**pass2 的 E 在 s16 域溢出**。pass2 输入是 pass1 系数
（±32767），E=c[j]+c[15-j] 可达 ±65534；上游 pass2 的 E 是 s32
（vaddl）、只有 O 是 s16。按 2026-08-13 修订后的合同（候选与替换目标
上游 kernel 位级一致），该候选对 dct16_sve 差分 10 万例有 24 处分歧
（0.000094%，首例 idx=9 want=-2270 got=1826），因此标记
`rejected-correctness`（未与上游位级一致；反例已保存）。修复点很窄：
**pass2 仅 E 拓宽到 s32，O 保持 s16（与上游一致）**。

下一步（v3）：pass2 仅 E 改为 s32 叶子（`svaddl/svsubl` 拓宽）+ s32
点积，O 维持 s16 SDOT，保持与上游位级一致；pass1 维持 s16 E/O SDOT。
指令预算：pass1 ≈ 640，pass2 ≈ 420+，合计约 1060+，仍高于上游 689——
该差距是下一轮搜索（k-blocking、pass 融合、常量常驻、NEON bridge
窄化变体）要消化的空间。

### v3 结构发现：四分之一交错打包 + 常量四重复制（解释上游 689）

上游 689 条向量指令的机制不是"每行一个 SDOT"，而是**跨行四分之一交错**：

```text
x = [O_i[0:4] | O_j[0:4] | O_k[0:4] | O_l[0:4]]   # 4 行各 4 元素
y = [C[0:4] | C[0:4] | C[0:4] | C[0:4]]           # 常量四重复制
SDOT .d -> [dot4_i, dot4_j, dot4_k, dot4_l]        # 4 行的同一部分积
```

8 元素叶子点积 = 2 个 sdot（低/高 4 元素）+ 1 个 addp = **3 条指令 /
4 输出（0.75 条/输出）**；窄化+存储约 1.25 条/输出 → 全 kernel 静态
预算约 2 条/输出（两遍约 1000 条），仍高于上游 689 中
"dot+narrow ≈ 0.36 条/输出"的实测——说明上游还有跨 k 复用/常量常驻等
额外收益（其 trace：sdot 72、addp 36、uzp1 44、rshrn 32、movi 72）。

这条结构的工具化要点（v3 发射器参数）：

1. 数据打包：4 行的 O/E 低/高 4 元素交错成 16-lane 寄存器（每 4 行
   2 个包，跨 8 个 k 复用；打包成本约 12 条/4 行，摊销后 ~0.2/输出）；
2. 常量：`C_lo` 与 `C_hi` 各四重复制（16-lane），运行期零 shuffle；
3. 上游位级一致：pass1 用 s16 E/O；pass2 仅 E 需 s32（与上游 vaddl
   一致，smull 变体约 2 条/输出），O 保持 s16（上游即 s16）；不同
   位宽组合都要进搜索枚举；
4. 窄化必须走 NEON bridge（SVE2 RSHRNB/RSHRNT 无法连续排布）。

结论：v2 的"每行一个 sdot"结构被否决（dot+narrow ≈ 2.25 条/输出，
两遍约 1300）；v3 改为四分之一交错打包 + 常量四重复制，静态预算
约 2 条/输出（两遍约 1000 条），若加上跨 k 常量常驻与 pass 融合有望
逼近或低于 689。下一轮以此为唯一主假设。

### 下一步（发射器设计要点，2026-08-13 交接）

发现报告已确认：奇数输出 k 的 4 个输出 lane 共享常量 `[C_k, -rev(C_k)]`，
叶子 = ldp 载入的行对（行 i 与镜像行 15-i），即常量重排已折进 C，运行期
tbl/rev 链可整体删除。发射器要解决的关键问题：

1. **SVE 无免费 concat**：SDOT 需要 16-lane 操作数 `[O0|O1]`，而 O_i 是
   8-lane 值；NEON 有 vcombine（免费寄存器配对），SVE 需要 zip/tbl/splice
   或直接按行打包加载（ld1 一次载两行成 16-lane 再处理行内 rev）。这是
   数据布局搜索点，不应手拍；
2. **s32 vs s64 SDOT**：s64 每行 2 个半积、addp 后是 `[f0,f2,f1,f3]`
   顺序，需一次重排；换打包顺序（行 0/2 一包、1/3 一包）可直接得到
   `[f0,f1,f2,f3]`，代价是输入行的交错加载。两种布局都应进搜索枚举；
3. **偶数路径**：24 个 splat-1 求和输出（EE/EO/EEE/EEO 共享）尚未进入
   当前 39 命中报告，发射器需补检测（`[1,1,1,1]` 常量向量当前被
   `shared_constant_matrix_outputs` 之外的路径覆盖）；
4. 正确性门（2026-08-13 修订）：QEMU 与替换目标（上游 NEON/SVE）位级
   一致；指令数门：以**上游 butterfly 动态流
   1553 条向量指令**为基线，目标 2-3 条/输出（两遍约 1000-1300 条）；
   实机门：N1/920B paired。
