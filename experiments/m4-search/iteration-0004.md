# M4 Search Iteration 0004 — UMAXP layout feasibility (analysis-only)

- run-id: `m4-search-layout-analysis`
- state: `rejected-performance`（分析结论：当前打包下不可行，未生成候选）
- date: 2026-08-12（Asia/Shanghai）

## 1. 假设

专家建议：重排 Hadamard bit-stage，使最终折半配对 `(p,q)`（系数差 4）
变为相邻 lane，然后用 `vpmaxq_u16`（UMAXP）一次折叠两个向量，
把 4×3=12 条（8 trn + 4 umax）降到 4 条。

## 2. 分析结果（线性形式求值器 + WHT 矩阵实验）

- 用 `optimizer/ir/provenance.py` 导出 seed 中 abs/sabd 输入的线性形式：
  最终配对是“列变换最高位”（cols 0–3 vs 4–7），在现布局中相隔 4 lane。
- 枚举 6 种 butterfly stage 顺序：8 点 WHT 的各 stage 算子
  （H⊗I⊗I、I⊗H⊗I、I⊗I⊗H）两两交换，**换序不改变输出 lane→系数映射**，
  因此仅靠换序无法让配对相邻。
- 要让配对相邻需显式 interleave：每向量 `vext(v,v,4)+vzip1q_s16(v,ext)`
  （2 条指令），8 个向量共 16 条，再加 4 条 UMAXP = 20 条，
  比现状 12 条更差。也可尝试在更早的 s32 trn 阶段吸收该置换，
  但等价于把现有 24 条重排的一部分搬移，不产生净减少。

## 3. 结论

“UMAXP 布局”在现打包方案下不可行（换序无效、显式 interleave 倒挂）。
该结果与 cand-0003 共同构成 8×8 重排路线的两个正交负结果：
在当前允许指令集与打包下，24 条 trn/zip 接近该表示的最优。

按专家停止门槛：两个正交布局族均无 ≥2 条净指令减少 → 从 8×8 shuffle
削减转向 **16×16 raw-tile 交错 / 跨 tile 融合 / 地址与归约摊销**。

## 4. 下一轮

16×16：以上游 `pixel_sa8d_16x16_neon`（481 条，约 120/tile）为基线，
尝试两 tile 交错共享地址/寄存器、延后归约；用同一 paired benchmark 门禁。
