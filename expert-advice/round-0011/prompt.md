# 顶级模型分析请求（round-0011，GPT-5.6-sol）

你是本项目的顶级模型分析顾问。请先阅读
`expert-advice/round-0011/context.md`，然后在本仓库
`/home/chiro/projects/a64-simd-dyn-optimizer` 内分析并产出建议。

## 沙箱与输出约束

- 本次为**可写会话**（用户裁定 2026-08-13）：只允许写
  `expert-advice/round-0011/` 下的三个文件
  （`summary.md`、`tooling-roadmap.md`、`verification.md`）；
  严禁改动源码、manifest、实验产物、构建目录或其它任何文件。
- 严禁读取 `/tmp` 或仓库外文件（内部 DCT32 参考只允许引用 docs/20 的
  聚合指标）；严禁把内部实现细节写入仓库。

## 背景摘要

DCT32 目标：上游 12710 → 至少减半 6355（半数硬门）→ 超越内部参考
4251/4827（scatter 对我们禁用）。当前 v2 = 7190（0.566x，near-gate）。
瓶颈：每输出标量舍入/存储链（uaddv/saddv 1792 + fmov 1984）与
叶子构建；探针已否决 padd 链批量窄化；推断出路是 DCT16 式
“pass1 的 s64 partial 直通 pass2”（内部参考无 uaddv）。

## 请输出

1. 反驳与风险：对“partial 直通是 DCT32 主要出路”“7190 接近该架构
   地板”的结论反驳；pass-through 的寄存器压力/布局/舍入风险；
   半数门用 fused_uop 的合理性（实机 cycles 未测）。
2. 下一轮按信息增益排序的 1–3 个实验：例如 partial 直通的最小可行
   切片（只做 pass1 odd-k 的 partial 布局）、16x16/8x8 是否还有
   低成本余量、或者改测 920B/N1 上的基线校准。
3. 工具方向：search 是否该增加“每输出指令数/类别直方图”轴与
   Pareto（关键路径/端口/访存/spill）；SVE2.3 新指令（ADDQP 等）
   对 DCT32 是否值得探针。
4. 明确区分“事实 / 推断 / 需要实验验证的建议”。

## 输出文件（写到 expert-advice/round-0011/）

- `summary.md`：10 行以内结论摘要；
- `tooling-roadmap.md`：第 2-3 项详细路线（按收益/风险排序）；
- `verification.md`：每项建议的验证标准（差分/lite/guard/实机）。

最终答复请给 10 行以内的要点版总结。
