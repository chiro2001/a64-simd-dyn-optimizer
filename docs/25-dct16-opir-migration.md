# DCT16 op-rewrite 迁移设计（2026-08-13）

目标：把 DCT32 已验证的“基础 plan + op 级原子 rewrite + 序列搜索”机制
迁移到 DCT16，作为“无内部参考”的第二个验证点。

## 1. 现状（证据）

- DCT16 已由 manifest 轴搜索独立复现 best **704**（legacy 合同，321 实测，
  `experiments/m30-dct16-search/layout-search-refresh/results.json`）；
- 704 的结构来自 grouped/asm 发射器（`emit_dct16_sve2_shared.py` /
  `emit_dct16_sve2_asm.py`），尚无 DCT16 op DAG，也没有 op 级 rewrite。

## 2. DCT16 op 集（与 DCT32 复用同一 Op 语义）

load/rev/unpk/add/sub/permute(tbl2|zip|trn)/dot_segment/mul_reduce/
round_shift/narrow/narrow8/store/extract2 —— 直接复用
`optimizer/ir/dct32_op_ir.py` 的 `Op` 与 `provenance_report`。

## 3. 机制 ↔ rewrite 映射（预期）

| DCT16 机制（已由轴搜索发现） | 对应 op rewrite | 预期效果 |
| --- | --- | --- |
| 4/8 行切片 + lane-per-output dot | `merge_narrow8`（移植） | 窄化/存储合并，与 DCT32 同类 |
| TBL 切片 → zip/trn | `tbl2_to_zip`（已通用） | permute 形态替换 |
| legacy s16 sdot（k2/k4） | `legacy_k2/legacy_k4`（按 DCT16 k 族适配） | mul+saddv → sdot |
| 常量预复制 | `const_prearrange`（DCT16 的 CODD 等价） | ld1h 减少 |

## 4. 实施顺序（Go/No-Go）

1. `dct16_op_ir.py`：把 DCT16 legacy best（704）lower 为 op DAG，
   以 `provenance_report` 通过 + 与 grouped 发射计数一致为 Go；
2. 移植 `tbl2_to_zip`（最通用）→ 验证 rewrite 前后计数/门禁；
3. 移植 `merge_narrow8` → 验证 row 合并；
4. `legacy_k2/k4` 按 DCT16 的 k 族（k=2/6/10/14 等）适配；
5. 接入 `search_rewrite_sequences.py`（参数化 kernel），跑 625 序列，
   验收：无参考方向时自动重发现 ≤ 704。

## 5. 风险

- DCT16 的 704 是 legacy 语义（mism 2300/0.011%），rewrite 必须保留
  legacy 签名并过 TestBenchLite；
- DCT16 行数 16 而非 32，`merge_narrow8` 的 32//n_groups 推导需按
  16//n_groups 参数化；
- 常量表/IDX 不同，`const_prearrange` 需按 DCT16 的 CODD 布局生成。

## 6. even-k 路径依赖（2026-08-13 新增）

`emit_dct16_sve2_shared.py` 的 pass1 even-k（k2/k4/k0）与 odd 不同：
odd 用 O 叶 + sdot；even 需要 E/EE/EEE/EEEO 蝴蝶链，且最终横向归约与
收窄走 **NEON bridge**（`svget_neonq + vmovn + vcombine + vpaddq +
vrshrn`）。op 化时需新增两个 op 种类：
- `neon_pack`（SVE→NEON 桥接：把 4/8 个 s32 partial 转成 NEON 向量）；
- `neon_reduce_narrow`（vpaddq 树 + vrshrn → s16）。
当前 op 集（load/rev/unpk/add/sub/permute/dot_segment/mul_reduce/
round_shift/narrow/store）不覆盖这两类，移植 even-k 前必须扩展；否则
even-k 只能保留 grouped 发射器作为 oracle。

## 7. 上游 op 后端第一切片（2026-08-13 晚，已交付）

### 目标与证据

- `optimizer/ir/dct16_op_ir.py`：
  - `lower_pass1_perrow()`：pass1 per-row 上游结构（load→full-rev→E/O
    SVE + 每 (k,row) 一条 SDOT + `neon_pack`(svget_neonq) +
    `neon_reduce_narrow`(vmovn/vcombine/vpaddq/vrshrn) + 4-lane store），
    704 ops；
  - `lower_pass2_upstream()`：pass2 上游结构（rowpair
    E/EO/EEE/EEO 蝴蝶链 + odd k per-row NEON-bridge SDOT + even
    k2/k0/k4/k8/k12 vmul/vpadd/vrshrn 路径），740 ops；
  - `dct16_upstream_provenance()`：512 输出 lane 双射、dot-term
    8 覆盖/行、round epoch 校验，通过。
- `optimizer/ir/dct16_op_emit.py`：op DAG→ACLE（新增
  `neon_pack`/`neon_reduce_narrow`/`neon_mul`/`neon_padd`/`neon_narrow`
  发射；`-O2 -fno-tree-pre -march=armv8.2-a+sve2` 编译契约）。
- `tools/build_dct16_opbackend.sh` + `search_sve2_layouts.py`
  `--backend op --kernel dct16` 接入（range_start=op_pass_4、
  range_end=wrapper）。

### 验证

| 项 | 结果 |
| --- | --- |
| pass1/pass2 与 grouped 上游逐 pass 差分 | 0 mismatch（2000 例×3 stride） |
| 全量 20k 差分（vs x265::dct16_sve） | 0 mismatch，upstream-exact |
| TestBenchLite dct16（seed 0x12345678） | PASS |
| 动态计数（内层 op_pass_4+op_pass_11） | vector 1853 / movprfx 382 / fused **1471** |
| grouped per-row 上游同口径（pass<3>+pass2_upstream） | vector 1895 / movprfx 384 / fused 1511 |

计算指令（sdot/add/sub/mul/rev/zip/narrow/store 等）两边完全同数；
1471 < 1511 全部来自栈 spill 减少（stack_vector 152 vs 200）与循环
开销消除——op 后端全展开让寄存器分配更好，无语义差异。

### 修掉的坑

1. k0/4/8/12 的 EEE/EEO 下标：group g（行 4g..4g+3）对应 rowpair
   `2g / 2g+1`，不是 `g / g+1`（首轮 pass2 差分 18.7% 错误率，全量
   集中在 k=0 列）；
2. 常量表达式必须展开为具体索引（`GT16_S32[(k-2)/4]` 在展开代码里
   `k` 未声明）；
3. TestBenchLite 与 grouped 参考对象同符号冲突：`build-testbench-lite.sh`
   现按候选/参考导出的符号交集自动丢弃重复参考对象。

### 下一步

1. pass1 quarter（QE/QO 打包）+ pass2 odd-quarter + legacy（含
   even_sve 纯 SVE 路径与 store_merge16）lowering，对齐 704；
2. 移植 `tbl2_to_zip`（已通用）与 `merge_narrow8`（32//n_groups →
   16//n_groups 参数化）；
3. `search_rewrite_sequences.py` 参数化 kernel（当前硬编码 dct32 符号
   `_ZL9op_pass_4` 与基线），验收：无内部参考时自动重发现 ≤ 704；
4. 之后才进入 legacy_k2/k4 的 DCT16 k 族适配与常量预排列。

## 8. pass2 odd-quarter op 后端切片（2026-08-13 晚，已交付）

- `lower_pass2_odd_quarter(pack_zip, store_merge16, k_tile)`：rowpair
  E/EO/EEE/EEO 蝴蝶链（SVE load + NEON s32 链）+ SVE zO zip pack
  （view_s64/zip1d/zip2d/view_s16）+ odd k 链式 SDOT
  （dot_segment + dot_accum）+ narrow8/narrow16 合并窄化与 store
  merge（16-lane store）+ 每 group NEON even 路径。
- 新增 op 种类：`dot_accum`、`narrow8`、`narrow16`、SVE view/zip
  permute、`neon_pack`(s16→int16x8_t)；常量表 CQ_LO/CQ_HI。
- `emit_from_combo` 已按 manifest 轴选择 pass2 形态；搜索驱动现在会
  生成 upstream 与 odd-quarter（× pack_zip × store_merge16 × k_tile）
  多个唯一源。

验证（pass1 per-row + pass2 odd-quarter，upstream-exact）：

| 项 | 结果 |
| --- | --- |
| 逐 pass 差分 vs grouped odd-quarter | 0 mismatch |
| 全量 20k 差分 | 0 mismatch |
| TestBenchLite dct16 | PASS |
| 动态计数（op 后端） | fused **1275** / vector 1568 |
| grouped 同配置 | fused 1270 / vector 1566 |

计算指令完全同数；差异全在访存调度（ld1h/st1h/stp/ldr 组合，net
vector +2、movprfx -3）。op 后端在 ≤5 条误差内复现 odd-quarter
结构——下一步可直接在其上移植 rewrite（`tbl2_to_zip` 的 DCT16 适配
对象就是这里的 zip pack / 未来 tbl2 pack；`merge_narrow8` 对应
narrow8/16 合并，32//n_groups 参数化已在 DCT32 版本确认）。

## 9. pass1 quarter + pass2 odd-quarter op 后端（2026-08-13 晚，已交付）

- `lower_pass1_quarter(k_tile, pack_zip, even_factor, narrow_merge)`：
  zip pack（view_s64/zip1d/zip2d/revh_d）→ QE0/QE1/QO0/QO1，
  EEF/EOF even factoring（CQ_LO 单常量 dot），odd k 链式 SDOT
  （CQ_LO+CQ_HI），merged narrow8/4 + 8/4-lane store；
  even_factor=0 时偶数 k 退化为 QE 双常量路径。
- `revh_d` helper（inline asm）加入发射器；`_emit_pass1` 扩展 SVE
  view/zip/revh/dot_accum/narrow4/narrow8/store-sve；`emit_acle` 按
  manifest 轴选择 pass1/pass2 形态。

### op 搜索驱动全量结果（upstream-exact，0 mismatch，无 scatter）

| 结构 | fused_uop |
| --- | --- |
| quarter + odd-quarter + even_factor=1（best） | **895**（per_out 3.50） |
| quarter + odd-quarter + even_factor=1（无 store_merge16） | 903 |
| quarter + odd-quarter + even_factor=0 | 923 / 931 |
| quarter + pass2-upstream | 1097 / 1125 |
| per-row + odd-quarter | 1275 / 1283 |
| per-row + upstream | 1471 |

对比 grouped 非 legacy 最优 887（pk1=1/pk2=1/sm16=1/ef=1），op 后端
895 只差 8 条（差异在访存调度与 pk2 发射细节）；相对 grouped 同参数
920 反超 25 条。计算指令语义逐 pass bit-exact。

### 下一步（遗留最后一块）

1. pass2 legacy：EO16/EE16 s16 链 + QEOW/QEEW pack + s16 sdot 路径
   （`svqrshrnb` 饱和窄化，legacy 合同）；
2. even_sve=1 纯 SVE even 路径（revh/revw/addp + st1d scatter，
   704 需要，注意 scatter 实机多 uop 的取舍）；
3. `search_rewrite_sequences.py` 参数化 kernel，验收自动重发现
   ≤ 704。

## 10. legacy + even_sve op 后端（2026-08-13 晚，已交付）

- `lower_pass2_odd_quarter_legacy_even_sve(k_tile, store_merge16)`：
  每组 zip quarter + QEOW（saddlb/saddlt + zip/revw + uzp1_wide）+
  EEp/EOp（uzp1d/revw_d64 + s32 add/sub）→ T8E8 四乘
  （svmul + addp32）→ qrshrn + uzp1 + `st1d_scatter`（EVEN_OFFS
  bytes {0,128,256,384}，覆盖 k=0/4/8/12）；odd k 链式 SDOT +
  narrow16；legacy k=2/6/10/14 用 QEOW 单常量 SDOT + narrow16。
- 新增 op：`widen_add_sve`(saddlb/lt)、`mul`(s32 SVE)、`addp32`、
  `narrow4_sve`、SVE `zip1s/zip2s/uzp1s/uzp2s/uzp1d/uzp2d/uzp1_wide/
  revw_d32/revw_d64`、scatter store；helper：revw_d32/revw_d64/
  addp_s32/st1d_scatter_s16；常量 T8E8/EVEN_OFFS；legacy 模式
  `rshrnb → qrshrnb`。
- provenance 支持 scatter 拓扑（记录 `scatter_stores`，默认不判错）。

### 验证与结果

| 项 | 结果 |
| --- | --- |
| 逐 pass 差分 vs grouped legacy 704 | 0 mismatch（2000 例） |
| 20k 差分 vs 上游 | 2300 / 0.0449%（legacy 签名，与 grouped 完全一致） |
| TestBenchLite dct16 | PASS |
| op 后端 fused_uop（含 4 scatter） | **699**（vector 803 / fused 687 / sg 4） |
| grouped 704 同构实测 | 708（vector 812 / fused 696 / sg 4） |
| 全 op 搜索最优（upstream-exact、无 scatter） | 895 |

op 后端已完整复现 DCT16 legacy best 704 结构，且全展开后寄存器分配
更好（stack_vector 16 vs 24），fused_uop 699 < 704/708。**DCT16
“kernel→op DAG→ACLE→验证→计数”主链全部打通**，四种结构
（upstream / odd-quarter / quarter+odd-quarter / legacy+even_sve）
均由同一 op 发射器生成，manifest 轴驱动的搜索可直接排序。

### 已知口径

- legacy even_sve 路径当前固定合并窄化（store_merge16 忽略）；搜索
  tag 中 store_merge16-0/1 去重为同一源。
- scatter 计 4 uop（docs/17 §1 口径）；若后续实机发现 scatter 多 uop
  更差，op 后端可加 rewrite 把 4×scatter 改回普通 st1。

### 下一步（工具链收官）

1. `search_rewrite_sequences.py` 参数化 kernel（当前硬编码 dct32
   符号 `_ZL9op_pass_4` 与基线），在 DCT16 op DAG 上跑 rewrite
   序列，验收：无内部参考时自动重发现 ≤ 699；
2. 移植 `tbl2_to_zip`（DCT16 的 tbl2 pack 变体）、`merge_narrow8`
   （16//n_groups 参数化）；
3. 然后回到 DCT32 把发现的通用 rewrite 反向收益确认，并更新
   docs/23 流程图中的 Agent 依赖点。

## 11. DCT16 rewrite 引擎 + 参数化序列搜索（2026-08-13 晚，已交付）

- `optimizer/ir/dct16_rewrites.py`（跨 kernel 移植，与 dct32_rewrites
  同契约）：
  - `tbl2_to_zip`：pass2 odd-quarter pack 链
    （PO01/PO23 + QO0/QO1 tbl2 → view/zip1d/zip2d 转置，保持 QO 名）；
  - `merge_narrow8`：pass2 odd k 两对 narrow8+8-lane store →
    narrow16+16-lane store；
  - `apply_rewrites(ops, names)` 顺序应用。
- `lower_pass2_odd_quarter` 补 tbl2 pack 变体（pack_zip=False）；
  发射器补 svtbl2/idx_lo/idx_qa/idx_qb。
- `search_rewrite_sequences.py` 参数化：`--kernel dct32|dct16`，
  每 kernel 配置 base/rewrites/verify/driver/range/ref_lib；
  dct16 base = quarter + odd-quarter + tbl2 + store_merge16=0。

### 结果

| kernel | base fused_uop | best 序列 | 结果 |
| --- | --- | --- | --- |
| dct16 | 965（tbl2 + sm16=0） | `tbl2_to_zip`（或 +merge_narrow8） | **903**（MCA 260 cyc / 1238 uops） |
| dct32（回归） | — | `legacy_k2\|legacy_k4\|merge_narrow8\|tbl2_to_zip` | **6456**（与重构前一致） |

重写后的源码与 grouped 逐 pass bit-exact、20k 差分 0；两 kernel 共用
同一搜索骨架。DCT16 的 903 已接近 layout 搜索的零 scatter 最优 895；
≤704 的 legacy 路径目前仍是 layout 轴机制（699），要变成原子 rewrite
（QEOW/even_sve）才能被序列搜索自动重发现——这是下一个显式缺口。

## 12. `legacy_even_sve` 原子 rewrite（2026-08-13 晚，已交付）

- `rewrite_legacy_even_sve`：把 pass2 NEON even 路径整体替换为纯 SVE
  even_sve 块（zip quarters q0..q3 → QO0/QO1 同名重建 + QEOW
  saddlb/saddlt/zip/revw/uzp1_wide + EEp/EOp mul/addp32 + qrshrn +
  st1d_scatter，k=0/4/8/12；QEOW 单常量 SDOT k=2/6/10/14），并删除
  旧 pack 段使 zO/rev 变死代码；所有 narrow op 翻转为 qrshrn（legacy
  语义，pass1+pass2）。
- 顺带修复：两个 lowering 合并后 op_id 冲突（`apply_rewrites` 入口统一
  重编号）；pass1 narrow8 发射漏用 per-op mode（全局 rshrn）。
- `search_rewrite_sequences.py`：dct16 rewrites 加入 `legacy_even_sve`，
  含该 rewrite 的序列按 legacy 门禁（mism ≤ 22528）验收。

### 最终结果（全序列刷新，无内部参考）

| 项 | 值 |
| --- | --- |
| base（quarter+odd-quarter+tbl2+sm16=1） | 965 fused_uop |
| best 序列 | `legacy_even_sve`（tbl2_to_zip/merge 可加可不加） |
| best fused_uop | **705**（vector 809 / fused 693 / sg 4） |
| 20k 差分 | 2300（legacy 签名，与 grouped 704 完全一致） |
| 逐 pass vs grouped legacy 704 | 0 mismatch |
| TestBenchLite | PASS |
| MCA | 212 cycles / 991 uops |

与 layout 轴最优 699 的差异只剩 6 条栈调度（stp/ldp/str/ldr 组合），
全部计算指令（zip/revh/revw/uzp/sdot/qrshrn/mul/addp）逐条同数。
DCT16 的“kernel→op DAG→原子 rewrite→序列搜索→验证→计数”闭环至此
完整：rewrite 引擎跨 DCT32/DCT16 复用，序列搜索可自动重发现 legacy
路径（705 ≈ 704 验收线，误差为编译器 spill 噪声）。

### 下一步

1. DCT16 `legacy_k2`（QEOW s16 链 + sdot）与 `even_sve`（scatter 纯
   SVE even 路径）原子 rewrite —— 已完成（合并为一个
   `legacy_even_sve`），序列搜索自动重发现 705；
2. DCT32 侧把 `const_prearrange`/k0 向量化做成 rewrite（内部参考
   4827 → 目标）；DCT16 若需零 scatter 版本，把 scatter 4× 换回普通
   st1 的 rewrite 作为后续增量；
3. 回填 docs/23 的 Agent 依赖表（op DAG / rewrite / 序列搜索现在
   对 DCT16 也是自动化路径）。

## 13. 全代理重排（2026-08-14，layout 轴 + MCA/成本/cp/lite）

在 `experiments/m30-dct16-search/layout-search-proxy/` 上跑
`--rank-by mca --mca-top 10 --cost-top 10 --cp-top 10 --lite-top 5`
（32 候选全过差分，top-5 官方 5 seed lite 全 PASS）：

| 候选 | fused_uop | MCA cycles | est NP1 | cp NP1 | lite |
| --- | ---: | ---: | ---: | ---: | --- |
| 699（legacy，quarter+odd-quarter） | **699** | **212** | **125.5** | 43 | PASS |
| 727（同族，pass1_even_factor=0） | 727 | 222 | 131.1 | **42** | PASS |

结论：
- 699 在 fused/MCA/结构成本下均第一，cp 与 727 几乎持平（43 vs 42）；
  已固化为 `kernels/dct16/candidates/best_op_mca.{cpp,S}`，
  TestBenchLite dct16 官方 5 seed 全 PASS。
- 与 §12 的 705（rewrite 序列搜索）差 6 条栈调度；layout 轴 699 就是
  历史记录里“layout 最优 699”的完整代理验证。
- 全代理流程（llvm-mca + NP1 结构成本 + NV2 critical-path + lite）
  在 DCT16 上首次整套跑通，结果与 fused_uop 排名一致。
