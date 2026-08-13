# round-0010 上下文（批：SA8D 工具链 3 阶段 + ISA 刷新）

本批包含三个已完成阶段（自 round-0009 之后），全部已提交并推送
（GitHub + N1，main）：

1. `1e8ae00` SA8D 8x8 pair=2 候选（fused_uop 97→86）+ TestBenchLite
   `--gate sa8d`（SA8D 验收口径 = lite 门，用户决策 2026-08-13）。
2. `c1a5a18` SA8D 发射器新增 pack(pair/evenpair) x reduce(neon/sve) 轴；
   SVE 原生列变换（TBL2 重打包 + 半区旋转 max + unpklo/addv）；
   evenpair+sve → fused_uop 79（-18.6%）。
3. `d65be53` ISA 2026-06 刷新 + 补全 16 条 SVE2.3 语义库条目
   （之前只有 placeholder；GCC 16.1 无 SVE2.3 ACLE 内置）。
4. `439ec10` SA8D 16x16：每行 16 像素 = 一个 16-lane 寄存器，
   无打包/拆半/TBL2/旋转开销；fused_uop 373→189（-49.3%，真减半）。

## 关键事实（仓库内可查证）

- 开源 128-bit 基线（x265 pixel-prim-sve2.cpp）：
  sa8d8_sve2<8,8> dynamic 111 / vector 97；sa8d16_sve2<16,16>
  dynamic 423 / vector 373。
- 工具生成：
  - 8x8 evenpair+sve：dynamic 126 / vector 91 / fused 79（movprfx 12 不计）；
  - 16x16 natural-row：dynamic 227 / vector 193 / fused 189（movprfx 4）。
- 用户口径（2026-08-13）：开源 sa8d 是 128-bit 算法，SVE256 必须
  计算指令数减半才算收益（不是 97→79）。8x8 受打包开销限制难突破；
  16x16 已达到 -49.3%。
- 16x16 实现要点：无谓词 16 字节 load（stride≥16 约束）、行 H 每行
  3 cadd+2 tbl、列 H 跨 16 个行寄存器 lane-wise、归约 1×udot+addv。
- 验证：两候选均过 2 万例差分（vs 上游 SVE2 参考）与
  TestBenchLite（PixelHarness + 从 pixel.cpp 原样搬的 C 参照）PASS。
- 工具现状：sa8d/sa8d16 已接入 manifest 驱动搜索
  （tools/search_sve2_layouts.py + gen_verify sa8d shape）；
  DCT16 已达 upstream 887 / legacy 692（fused_uop），内部参考 731。

## 请重点阅读

- docs/19-sa8d-optimization-assessment.md（含 5c 减半口径分析）
- docs/16-tool-inventory.md、docs/17-n2-validation.md
- kernels/sa8d/manifest.yaml、kernels/sa8d16/manifest.yaml
- tools/emit_sa8d_sve2_shared.py（emit_pair / emit_16x16）
- tools/search_sve2_layouts.py、tools/gen_verify.py
- experiments/m7-isa-coverage/coverage-report.md（sve2p1/p2/bitperm 仍 0 覆盖）
- 旧建议：expert-advice/round-0009/response.md
