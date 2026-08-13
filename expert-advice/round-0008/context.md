# Round 0008 context（2026-08-13）

本批（自 round-0007 以来 7 个实际迭代阶段）涉及：

- `experiments/m30-dct16-search/iteration.md`：DCT16 工具链闭环主记录；
- `experiments/m30-dct16-search/shared-matrix-discovery.json`：发现报告；
- `experiments/m30-dct16-search/trace/dct16-{neon,sve,shared,shared-v3}-true.json`：
  真实动态指令流（`-d exec,in_asm`，`parse_qemu_trace.py --exec`）；
- `tools/emit_dct16_sve2_shared.py`：参数化 SVE2 发射器（pass1_layout：
  per-row / quarter；pass2_upstream）；
- `kernels/dct16/candidates/sve2_shared.cpp`：生成的 v3 候选；
- `kernels/dct16/sve_shared_verify.cpp`：上游位级一致接受门；
- `docs/04-validation-benchmark.md` V0.5、`docs/08-risks-and-decisions.md`
  ADR A009：合同改为 upstream-exact；
- `isa/aarch64/instructions.yaml`：已验证的 SVE2 lane 语义。

## 关键数字（真实动态，VL=256，同一输入）

| 实现 | total | vector | 备注 |
| --- | --- | --- | --- |
| NEON（全展开） | 2074 | 1553 | 上游 dct16_neon 展开 |
| 上游 SVE（循环） | 2047 | 1577 | 早期 689 是 in_asm 口径假象 |
| 工具 v2.1（per-row pass1 + 上游 pass2） | 2353 | 1636 | pass1 912 |
| 工具 v3（quarter pass1 + 上游 pass2） | 1856 | 1246 | pass1 ~522 |

v3 与上游 dct16_sve 位级一致（20 万例 0 分歧）。960 周期估算
（SVE 4x256 vs NEON 4x128 同 pipe）：1246/4=312 vs 1553/4=388，约
+25%；目标 +130% 需总向量 ~675。

## 已确认的 SVE2 语义（实证）

- SDOT .d/.h/.h：VL=256 时 16 s16 → 4 s64，每 lane=连续 4 元素点积；
- RSHRNB/RSHRNT：每个 128-bit 段内源 s32 lane 依次进偶数/奇数半宽
  lane，无法把 4 个连续输出排成 h[0..3]（需 uzp1_s16 压缩）；
- ADDP .d：段内两两 `[a0+a1, b0+b1, a2+a3, b2+b3]`；
- NEON bridge（svget/svset_neonq）只暴露低 128 位，窄化用
  vmovn+vcombine+vrshrn 最省；
- 舍入：rshrnb 与上游 vrshrn 在 DCT16 域等价（20 万例实证）。

## v3 quarter 结构（当前最佳）

4 行 E/O 低/高 4 元素交错打包（每 4 行 8 个 tbl2，跨 16 k 复用），常量
`[C0..3]×4`/`[C4..7]×4` 预复制；每 k 每 4 行 = 2 sdot + 1 对齐 add +
纯 SVE 窄化 4 条。pass1 向量 912→522。

## 当前阻塞点（请反驳/给方向）

pass2 仍是上游结构（~724 向量）：奇数 k 用 s16 O + bridge sdot；
偶数 k 用 s32 E（vaddl）+ vmulq/vpaddq。**pass2 的 E 必须 s32 才能与
上游位级一致**（s16 E 会溢出，10 万例 24 处分歧）。尝试把 pass2 偶数
路径改成 SVE2 s32 quarter 点积（smullb/smullt + addp 树）后静态估算
每 k 每 4 行 ~24 条，反而远差于现状 8 条；s32×s32→s64 的 8 元素点积
在 SVE2 无原生指令，且 8-lane s32 归约受 128-bit 段边界限制。

问题：在不违反 upstream-exact（E 精确 s32）的前提下，pass2 是否有
结构性的 SVE256 削减路径（例如 pass 融合、DCT 分解、把 E 拆分
E_lo/E_hi 双 sdot、4×4 矩阵分块），还是应当接受 pass2 现状并把
+130% 目标重新拆分为 pass1 主导的 DCT 族？请按信息增益排序 1-3 个
实验，并明确区分事实/推断/待验证建议。

## 已归档的后续实验（本批）

- v4：pass2 奇数路径改 quarter（预计省 ~60 条，pass2 仍 ~660）；
- v5：pass2 偶数路径 E_lo/E_hi 拆分双 sdot（预计每 k 每 4 行 ~15 条，
  比现状 8 条差，倾向否决）；
- pass 融合：pass1 输出布局直接适配 pass2 消费（两个 pass 的 coef
  布局目前都是 k*16+i，可论证保持）；
- 920B 无法执行 s16→s64 SDOT（SVE1），实机周期只能等 960；指令数
  口径用 QEMU true-dynamic。
