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
