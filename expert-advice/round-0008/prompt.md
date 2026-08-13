你是 AArch64/编译器优化审阅者。请阅读仓库根目录下的
`expert-advice/round-0008/context.md` 以及其中列出的实验记录
（`experiments/m30-dct16-search/iteration.md`、发射器
`tools/emit_dct16_sve2_shared.py`、验证器
`kernels/dct16/sve_shared_verify.cpp`、真实动态 trace JSON）。
不要修改仓库，只把建议写入你的回复。

背景：我们正在把 x265 DCT16 优化为 SVE2（固定 VL=256），合同是
"与上游 dct16_sve 位级一致"（2026-08-13 用户决定，不再要求 C-exact）。
工具已完成：QEMU 真实动态抓取 → lane 追踪 → 共享常量矩阵发现 →
参数化发射器 → 上游差分验证。当前最佳 v3：pass1 用"四分之一交错 +
常量四重复制 + 2 sdot + 1 add"布局（912→522 向量），pass2 仍是上游
NEON/SVE bridge 结构（~724 向量）；总计 1246 向量，较上游 SVE 1577
约 -21%，960 周期估算约 +25%，目标 +130%（需 ~675）。

请至少给出：

1. 对"pass2 的 s32 E 使 SVE2 重构不划算"结论的反驳或确认；若确认，
   指出最可能遗漏的结构性路径（pass 融合、E_lo/E_hi 拆分、4×4 分块、
   不同 DCT 分解、NEON+SVE 混合等）；
2. 最可能遗漏的 correctness/VL/ABI 风险（当前发射器、验证器、trace
   口径）；
3. 下一轮按信息增益排序的 1-3 个实验；
4. 若连续无收益，是否应改变 IR/search/cost 方向或停止 DCT family；
5. 明确区分"由已有文件支持的事实""推断""需要实验验证的建议"。
