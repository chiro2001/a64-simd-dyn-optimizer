# 顶级模型分析请求（round-0010，GPT-5.6-sol）

你是本项目的顶级模型分析顾问。请先阅读
`expert-advice/round-0010/context.md`（本批 3 个阶段的 commit/结果/文件），
然后只在本仓库 `/home/chiro/projects/a64-simd-dyn-optimizer` 内做**只读分析**
并产出下一阶段工具优化路线。不要修改任何代码/构建/运行产物（写建议文档除外）。

## 硬性约束

1. **严禁读取 `/tmp` 或仓库外任何文件**（尤其是内部算子源码/反汇编/追踪，
   如 `/tmp/dct-sve.s`、`/tmp/*internal*`）。只能使用仓库内已落盘的聚合信息。
2. 严禁把内部算子代码或实现细节写入仓库；引用 docs/18 已有计数即可。
3. 分析过程只读：可读文件、可跑只读统计脚本，不要执行构建/搜索/编译。

## 背景摘要

项目目标：x265 的 NEON/SVE 算子在 SVE256（VL=256）下离线超优化，
工具链 = manifest 布局轴 -> 发射器生成 -> 2 万例差分 + TestBenchLite
（SA8D 验收）-> true-dynamic fused_uop 指令数。用户口径：开源 128-bit
算法在 SVE256 下计算指令数需减半才算收益。

本批结果：
- SA8D 8x8：pair=2 打包 + SVE 列变换，fused_uop 97→79（-18.6%，未达标）；
- SA8D 16x16：每行 16 像素天然一个 16-lane 寄存器，无打包/拆半/TBL2/
  旋转开销，fused_uop 373→189（-49.3%，达标）；lite 门 PASS；
- ISA 2026-06 刷新，16 条 SVE2.3 已补进语义库（asm-only，GCC 16.1 无
  ACLE 内置）；sve2p1(110)/sve2p2(9)/sve2_bitperm(3) 仍 0 覆盖。

## 请输出

1. 反驳与风险：对“16x16 已真减半”“8x8 79 是布局开销所致”的结论提出
   反驳；最可能遗漏的 correctness/ABI/VL/边界风险（如无谓词 16 字节
   load 越界读、stride 下限、舍入恒等式、movprfx 口径、QEMU vs 实机）。
2. 下一轮按信息增益排序的 1–3 个实验：例如 16x32（I422）、16x16 归约/
   常量轴、把 8x8 的 79 继续压向 ~70、interp8_hpp 接入、DCT16 剩余
   60 条 gap 的工具化。
3. 工具方向：search 轴是否该从“指令数”转向“实机 cycles 代理”，
   SVE2.3 新指令（SABAL/UABAL、SQSHRN 2-reg 等）对本批 kernel 是否有
   可工具化的收益；sve2p1/p2 是否值得补目录。
4. 明确区分“由已有文件支持的事实”“推断”“需要实验验证的建议”。

## 输出文件（写到 expert-advice/round-0010/）

- `summary.md`：10 行以内结论摘要；
- `tooling-roadmap.md`：第 2-3 项详细路线（按收益/风险排序）；
- `verification.md`：每项建议的验证标准（差分/lite/实机/fused_uop 阈值）。

最终答复请给 10 行以内的要点版总结。
