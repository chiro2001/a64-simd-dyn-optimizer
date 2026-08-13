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

正确性门：rewrite 输出必须过 C-exact 差分（上游 dct16 0.0045% 分歧是
已知潜在缺陷，候选以 C 为准）；指令数门：shuffle 计数下降且总 SIMD+load
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
C-exact 差分 + 两机双口径实测。

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
4. 正确性门不变：QEMU C-exact；指令数门：以**上游 butterfly 动态流
   1553 条向量指令**为基线，目标 2-3 条/输出（两遍约 1000-1300 条）；
   实机门：N1/920B paired。
