# Round 0008 blocked（2026-08-13）

触发条件：DCT16 工具链连续多个迭代阶段后按协议发起只读咨询
（`codex -p sss -c 'model="gpt-5.6-sol"' -c 'model_reasoning_effort="max"`
`-s read-only exec -o response.md`）。

结果：会话运行约 3 小时（tokens used ≈ 316k），期间多次
`ERROR: Reconnecting...`，最终**未写出 `response.md`**；按要求中断并
记录，不伪造回复。

会话中已产生的审阅线索（未落盘为正式建议，仅作参考，不视为专家结论）：

1. `is_vector()` 漏计 `ldr/str/ldp/stp qN|dN` 向量访存——**已由主
   流程修复并重算**（见 m30 iteration.md 二次口径修正）；
2. VL=256 必须核验 `prctl` 实际返回值——**已修复**（验证器断言）；
3. pass2 按地址分段构成（setup/odd/even）已量化：v3 中 setup≈202、
   odd≈457、even 2/6/10/14≈168、even 0/4/8/12≈107（修正口径）。

处置：本 round 标记 `blocked-expert`；下一批（3 个阶段）满额后按协议
重试 round-0009，不围绕本 round 追问。主流程继续执行，不因本次阻塞
重跑实验。
