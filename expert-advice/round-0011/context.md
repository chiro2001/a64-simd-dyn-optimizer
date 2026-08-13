# round-0011 上下文（批：DCT32 v2 + 半数门 + 健壮性审计）

自 round-0010 后完成 3 个阶段，均已提交推送：

1. `418fa36` DCT32 v1→v2 行主序轴（叶子不落缓冲）：fused_uop
   8942→7190（0.566x，near-gate）；2 万例差分 0 + lite PASS。
2. `f45b38b` 半数硬门落进搜索（manifest targets + HALVED/near-gate/NO
   打标）：dct32 0.566、sa8d16 0.507、sa8d 0.814。
3. `d42adc7` guard 审计：sve_guard 指向当前 8x8/16x16 候选 + VL=256
   断言 + VL=512 拒绝；build-sve-guard.sh；多 seed lite（sa8d/sa8d16/
   dct32 全 PASS）。

## 关键事实（仓库内可查证）

- 上游 dct32_sve（128-bit 风格）fused_uop = 12710；用户口径 = 至少减半
  （6355）；内部手工参考 x265_dct32_sve256（仅 /tmp 评估，不入库）=
  fused_adj 4251 / fused_uop 4827（含 192 条 scatter st1d 惩罚）。
- 我们 v2 = 7190：sdot 1024、uaddv 1024、mul 768、saddv 768、
  fmov 1984、movprfx 1664、叶子构建约 1200。
- 探针结论：SVE ADDP .s 段内交错布局，8-lane 横向和不比 saddv 便宜，
  批量窄化（padd 链）方向被否决；内部参考无 uaddv，靠 partial 跨 pass
  流动（pass1 的 4 个 s64 partial 不进 pass2 的逐输出求和）。
- round-0010 建议：保留 fused_uop 半数硬门；finalist 需 200k 差分、
  多 seed lite、guard、VL 拒绝、paired cycles；工具加 Pareto 维度。

## 请重点阅读

- docs/20-dct32-optimization-assessment.md（含内部参考聚合指标与方向）
- tools/emit_dct32_sve2_shared.py（v1/v2 发射器）
- kernels/dct32/manifest.yaml
- docs/18-internal-dct-evaluation.md（DCT16 的 partial/odd-quarter 经验）
- expert-advice/round-0010/response.md + decision.md
