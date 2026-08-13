# round-0013 决策（2026-08-13）

咨询结论（response.md / summary.md / tooling-roadmap.md /
verification.md）已落盘。本文件记录采纳与修正。

## 1. 采纳的判定

- **E1-R（rewrite-driven rediscovery）= PASS**：18→18→12→12 漏斗、
  `lower()` 前 canonical key 去重、20k upstream-exact 0 分歧、零
  scatter 均可复核。
- **E1-B（backend-independent blind discovery）= 已达成（2026-08-13）**：
  `optimizer/ir/dct32_op_ir.py` + `dct32_op_emit.py` 从 op DAG 独立
  codegen（不调用 grouped C++ 块），`-O2 -fno-tree-pre` 下 full
  fused_uop **8283 ≤ 8292**、20k 差分 0、TestBenchLite PASS。
- **ProofReport 四级化**（plan/lowering/object/trace）与
  `REJECT/UNKNOWN` 分流、带正负例的剪枝规则：采纳，进入工具清单。
- **统一 SearchAdapter / 合并搜索驱动**：采纳为下一批主项之一；先做
  schema/cache/proof 合并，再做多 kernel 回归（DCT16 不变、DCT32
  不回退、interp8-A 127）。
- **row_group=8 双 accumulator**：保留为静态可行性探针，但见 §2 的
  实证修正，先验收益下调。

> **2026-08-13 用户裁定（追加）**：放开 legacy-internal-exact 合同族
> （允许 s16 sdot 化 k2/k4 带来的与 C 参照的稀有回绕分歧），DCT32
> 候选验收黄金标准 = **TestBenchLite PASS**（不再要求 upstream-exact /
> C-exact 位级一致）。内部参考 4827 成为可合法追逐的目标。

## 2. 咨询后新增证据（必须并入决策，否则 Go 判据失真）

### 2.1 fused_uop 口径 bug：3962 是 pass1-only

咨询期间发现搜索工具 dct32 的 trace range 只覆盖 `pass32_impl<4>`
（pass1）。修正 `range_end` 后 full-call 计数：

| 候选 | pass1 | pass2 | full fused_uop | ratio vs 12710 |
| --- | ---: | ---: | ---: | ---: |
| v2 / v2b（**full-call best**） | 3595 | 3595 | 7190 | 0.566 |
| v3.1（k2=1/sdot/narrow4/derived） | 3962 | 4330 | 8292 | 0.652 |
| v3 | 4266 | 4330 | 8596 | 0.676 |

因此：

- “3962 = 0.312x / HALVED / 超越内部 4251/4827” 结论**撤销**（pass1-only
  假象）；内部参考 full 4827 仍领先。
- E1-B 的 Go 判据从“OpIR 重发现 fused_uop<=3962”改为 **“OpIR 重发现
  full-call <=8292（v3.1），且优先 <=7190（v2）”**；低于 7190 才算
  工具真正超过现有结构。
- search_sve2_layouts 已加 `range_end`；结果落在
  `experiments/m30-dct32-search/layout-search-full-v2/results.json`。

### 2.2 acc_split 消融：拆链不改善 920B 周期

新增 `acc_split {1,2,4}` 轴并实机验证（SVE1/VL=256）：

| 变体 | full fused_uop（SVE1） | 920B p50 cycles |
| --- | ---: | ---: |
| as1（4 连链） | 9042 | 226 |
| as2（2+2+add） | 9298 | 236 |
| as4（4 独立+树 add） | 9307 | 236 |

三者 20k 差分 0；**拆链反而 +10 cycles**。结论：920B 上瓶颈既不是
指令数也不是 sdot 链深度；对 row_group=8 双 accumulator 探针而言，
单纯增加独立累加器不构成先验收益，静态可行性分析必须同时看寄存器
压力与实机周期。

### 2.3 v2 pass 拆分与下一优化方向

v2 的 pass1/pass2 各 3595，两个 pass 都优于 v3（4266/3962 与
4330）。v3 的 4 行切片 + lane-per-output sdot 在 VL=256 上被
tbl2/uzp/常量重排开销抵消。**下一步工具轴：把 `odd_lowering=sdot.d`
与 `narrow_batch=4` 应用到 v2 行主序结构（v2-odd-sdot），目标
7190 → <6355（半数门）**，而不是继续扩展 v3 模板。

## 3. 下一批执行顺序（已修订）

1. **OpIR backend 垂直切片**（E1-B 关键路径）：覆盖 leaf、odd segment
   dot、pass1-k2 slice、round/narrow/store；grouped emitter 只作 oracle。
   Go：full-call <=8292，且 op provenance 覆盖率 100%、200k 0 mismatch、
   Lite>=3 seed、零 scatter。
2. **v2-odd-sdot 轴**：在 v2 行主序上重放 sdot.d/narrow 机制，先跑
   QEMU full-call 计数，再 920B 实测；目标过半数门 6355。
3. **统一搜索驱动**：canonical 层前移、四级 ProofReport、缓存键含
   compiler/backend/ISA；DCT16/interp8 回归不回退。
4. row_group=8 静态可行性（低先验，仅当 OpIR/v2 轴有正收益后并行）。

## 4. 搁置/延后（沿用咨询意见）

- interp8 path-B（SVE2p3）：canary 通过前只标 build/semantic-only。
- NEON→NEON 消融：仅作成本校准，无目标机 paired cycles 不宣称收益。
- 学习式 cycles 模型、任意 interpass retile：在 E1-B 与统一驱动稳定后
  再评估。
