# 顶级模型分析请求（round-0012，GPT-5.6-sol）：内部算子优化点提炼与工具自搜索路径

你是本项目的顶级模型分析顾问。请先阅读
`expert-advice/round-0012/context.md`，然后在本仓库
`/home/chiro/projects/a64-simd-dyn-optimizer` 内分析并产出建议。

## 沙箱与输出约束

- 本次为**可写会话**（用户裁定 2026-08-13）：只允许写
  `expert-advice/round-0012/` 下的三个文件
  （`summary.md`、`tooling-roadmap.md`、`verification.md`）；
  严禁改动源码、manifest、实验产物、构建目录或其它任何文件。
- **严禁读取 `/tmp` 或仓库外文件**：内部 DCT16/DCT32 参考只允许引用
  `docs/18-internal-dct-evaluation.md` 与
  `docs/20-dct32-optimization-assessment.md` 中已脱敏的聚合指标；
  严禁把内部实现细节写入仓库。

## 背景摘要

我们把 x265 的 SIMD kernel 抽象为计算图并自动搜索更优的
NEON/SVE/SVE2 布局（固定 VL=256）。内部手工最优算子只在本机 /tmp
评估，仓库只记录聚合指标（指令构成直方图、fused_uop 等），代码不入库。

当前工具链闭环：QEMU 真实动态抓取 → lane 级 IR → 参数化布局搜索
（manifest 布局轴 × 发射器）→ 差分验证（upstream-exact，20 万例 0
分歧）→ TestBenchLite 门禁 → fused_uop 排名。

最新成果（全部已提交并推送）：
- DCT32 v3.1 = 3962 fused_uop（上游 12710 的 0.312x，HALVED），
  **已超越内部参考 4251/4827**（scatter 对我们禁用）；机制：4 行切片 +
  lane-per-output `sdot .d` + `uzp1+rshrnb` 批量窄化 + 常量预排列
  `[C|C]` 双份。
- DCT16 legacy = 704（uop 口径），低于内部 827（含 scatter 惩罚）。
- interp8 方案 A（SVE2-safe sdot.d 切片）= 127（上游 141，-10%）；
  方案 B（SVE2p3 `sdot .h`）汇编器可接受但 QEMU 11.0.3 SIGILL，无法验证。
- 已实证否决：DCT32 partial 直通（延迟舍入分歧 3.87%）、dct8 切片迁移
  （8x8 太薄）、gather/scatter（ARM 拆多 uop，禁用）。

## 请输出

1. **内部算子优化点提炼**：基于 docs/18、docs/20 的聚合指标，列出从
   内部 DCT16/DCT32 参考中可以提炼、且可以编码进我们工具的关键机制
   （常量预排列、lane-per-output dot、批量窄化、寄存器分块、跨 pass
   数据流等），每条给出“工具可落地的搜索轴/rewrite/成本项”。
2. **工具自搜索差距分析**：当前工具能生成 DCT32 v3.1（超越内部参考），
   但机制是被动发现/人工编码进发射器。请给出让工具**主动搜索到这类
   最优 kernel** 的最小改进路径（分层搜索、typed LayoutIR、
   layout 轴组合、成本代理、反例驱动的规则归纳），按收益/风险排序。
3. **下一轮实验**：按信息增益排序 1-3 个（例如 interp8 SVE2p3 验证
   环境的替代方案、DCT 族剩余机会、NEON→NEON 同算力优化）。
4. 明确区分“事实 / 推断 / 需要实验验证的建议”。

## 输出文件（写到 expert-advice/round-0012/）

- `summary.md`：10 行以内结论摘要；
- `tooling-roadmap.md`：第 2-3 项详细路线（按收益/风险排序，含落地
  文件与接口建议）；
- `verification.md`：每项建议的验证标准（差分/lite/guard/实机）。

最终答复请给 10 行以内的要点版总结。
