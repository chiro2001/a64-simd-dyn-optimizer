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
