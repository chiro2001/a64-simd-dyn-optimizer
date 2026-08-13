已完成，且仅新增指定的三份文档：

- [summary.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0012/summary.md)：10 行结论摘要。
- [tooling-roadmap.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0012/tooling-roadmap.md)：机制提炼、typed LayoutIR、分层搜索与 3 项实验。
- [verification.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0012/verification.md)：差分、Lite/TestBench、guard、ISA 与实机验收标准。
- 核心验收：禁用复合 v3 模板后，工具仍应主动重建 `≤3962`、upstream-exact、零 scatter 的 DCT32。
- 下一轮优先级：DCT32 盲重发现 → SVE2p3 canary/interp8-B → NEON 同算力消融。
- 已通过文件范围、摘要行数及 `git diff --check` 自检；未访问 `/tmp`、未运行构建或修改源码。