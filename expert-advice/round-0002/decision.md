# Round 0002 decision

顶级模型回复见 `response.md`。逐项处置如下：

| 建议 | 处置 | 证据/理由 | 对应动作 |
| --- | --- | --- | --- |
| 修正 8/4/2-lane trn/zip 语义；umax 按 unsigned；补单元测试 | accept | 已实现 `semantics.py` 通用掩码、`interp.py` unsigned umax、测试覆盖 2/4/8-lane | 本轮提交 |
| SpecIR rounding 文本与 canonical 对齐（32x32 为 16x16 块） | accept | `spec_ir.py` 文本修正并重生成 spec.json/hash | 本轮提交 |
| cand-0001 性能结论证据不完整，需 randomized paired A/B + CI + PMU | defer | 需要重写 benchmark 驱动（交替次序、bootstrap CI、candidate PMU/汇编归档） | 下一优化轮前升级 `test-candidate.sh` |
| cand-0002 失败不能证明 8 条 s64 shuffle 必要；先做 UMAXP 布局实验 | accept | 恒等式 `\|p+q\|+\|p-q\|=2max(\|p\|,\|q\|)` 已确认；下一步尝试 Hadamard stage 换序 + `vpmaxq_u16` | 下一轮 cand-0003 |
| PackIR verifier 需递归检查引用/lane 边界与最终语义等价 | defer | 需要 evaluator/等价判定（coefficient multiset），工程量较大 | 与 UMAXP 布局同步开发 |
| 每候选重做 s16 范围证明（不只复用全局上界） | accept-as-procedure | 写入候选模板要求，随 cand-0003 执行 | 下一轮 |
| 候选 benchmark 需 guard/sanitizer/TestBench/注入 | defer | 先跑通 layout 搜索，再进入注入门禁 | M4 后半 |
| workload 权重仍是 placeholder，30% 判定需先冻结 | accept-as-procedure | 真实权重来自 x265 clip 调用统计 | 引入 clip 采样任务 |
