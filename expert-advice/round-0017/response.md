咨询已完成并落盘：

- [summary.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0017/summary.md)
- [tooling-roadmap.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0017/tooling-roadmap.md)
- [verification.md](/home/chiro/projects/a64-simd-dyn-optimizer/expert-advice/round-0017/verification.md)

核心判断：zip32 首要嫌疑是确定存在的 16-lane 越界读取 UB，寄存器压力更可能是触发条件；应先改为严格 8-lane predicated load，再依次做 noinline chunk 和固定 `splice` 约束诊断。

已验证文档中的 GCC 16.1、Clang 22.1.8 命令选项均可解析。未读取 `/tmp` kernel，未修改源码、manifest、实验或构建目录。