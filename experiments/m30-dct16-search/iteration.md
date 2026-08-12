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
