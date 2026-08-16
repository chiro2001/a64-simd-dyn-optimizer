# Round 0025 context

## Task

在 2026-08-16 晚压缩上下文后，重新读取交接文档
（`docs/59-handoff-20260816.md` 及其关联专题文档），请 top model 基于
当前状态给出下一步方向，并将结论归档。

## Method

- 调用方式：bash 工具执行 `codex exec`（非子代理），模型
  `gpt-5.6-sol`，provider `sss`，reasoning effort `max`，sandbox
  `read-only`，`--ephemeral`。
- 模型读取：`docs/59-handoff-20260816.md`、
  `docs/63-950-920b-intranet-quicktest-20260816.md`、
  `docs/64-sve128-neon-migration-plan-20260816.md`、
  `docs/65-ir-granularity-audit-20260816.md`、
  `docs/66-multi-isa-kernels-survey-20260816.md`、
  `reports/intranet-quicktest-920b-950-20260816.md`。
- 原始最终回复先落盘 `build/tmp-topmodel-direction.md`，再复制为本轮
  `response.md`。

## Status summary (facts)

- HEAD `72c8a08`（handoff rewrite: current-state-first docs/59），工作树
  干净；日期 2026-08-16。
- 两个 goal 均 complete：dct16/32 SVE256→SVE128/NEON + IR 宽度参数化
  （docs/64/65）；多 ISA kernel 推广（docs/66）。
- 机器：N1（NEON-only，工作树勿动）、920B（SVE1 VL256）、710（SVE2
  VL128）、950（SVE2 2x256，缺 yuv 未跑 E2E）。
- best9 E2E：920B -2.06%/-2.02%、N1 ~-1.6%/-1.52%、710 -1.53%
  （100f，bit-exact）。
- 7-kernel IR-all（N1/920B/710）：+0.08%/+0.02%/-0.08%，基本中性。
- 920B 快测：scanPosLast ~1.5x、idct32 +17%、cost 中性、remain DFA
  均匀语料 -35%（真实分布 +20%）待复查、interp8 path-B 停用、
  sa8d16 +4%（云 +12% 未复现）。
- 950 快测：dct16 op895 +29% vs SVE（慢于 NEON 14%）、dct32 opbase
  平价、dct32 op4032 +72.7% vs SVE / +39.1% vs NEON（非 bit-exact，
  匹配 C 参考，需策略放行）；sdot.d 确认是 base SVE（SVE1）指令。

## Deliverables

- `prompt.md`：发送给模型的完整请求。
- `response.md`：模型最终回复（约 93k tokens 使用量）。
- `decision.md`：执行 Agent 对建议的处置（2026-08-16 已按 P2 执行
  920B 消融后填写）。
