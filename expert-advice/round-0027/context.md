# Round 0027 context

## Task

用户要求用 bash 调顶级模型（`codex exec -p sss`，profile
`~/.codex/sss.config.toml`：model=gpt-5.6-sol、provider=sss、
reasoning effort=max），在后台回答 16-lane 双组 lowering 通过门禁
后的下一步方向（docs/06 §5 批次触发：round-0026 之后的新批次）。
主进程不等待，继续前台工作；响应落盘后写 `decision.md`。

## Method

- 调用：`codex exec -p sss -s workspace-write -C "$PWD"
  -o expert-advice/round-0027/response.md - < prompt.md`
- 输出只允许写入 `expert-advice/round-0027/`（prompt 已约束）。
- 若模型不可用，只记录 `blocked.md` 与错误，不伪造 response。

## Status summary (facts, 2026-08-17)

- HEAD `e46ebfe`，三端同步（origin=N1 / yitian=710 / github）。
- 发布集：best9-minus-remain + dct IR（`AGO_IR_DCT=1`），N1 双批
  +2.25%/+2.14%，710 双批 +2.03%/+2.36%，均 bit-exact、CI 不跨零
  （reports/n1-best9-noremain-ir-dct-freeze-20260817.txt、
  reports/710-best9-noremain-ir-dct-freeze-20260817.txt）。
- 熵族逐 kernel 复核（920B 交错注入）：scan-pos-last +1.23% 成立，
  cost-coeff-remain -0.23% 回归已从发布集移除；710 移除 remain。
- 纯 SVE 模式（`AGO_PURE_SVE=1`、`check_isa_level --no-neon`）：
  dct16/32 双发射器完成，0 NEON、20k VL=128 差分 0 失配、
  TestBenchLite 多 seed 全过；710 实机 E2E -2.63%（回归，默认不
  注入）。纯 SVE 推广到 interp8/satd/sa8d 未做。
- 16-lane 双组发射器（docs/72）：dct16 已实现并通过 0 NEON +
  51k 跨 VQ 差分（vq1 8-lane 参考 vs vq2 16-lane，分进程）+ 
  TestBenchLite vq=2 六 seed PASS。dct32 同法尚未完成。
- 950（920G）E2E：dct8/16/32 opbase 注入 30f +0.79% CI[54,98]，
  100f 与 op4032 策略待用户放行。
- P3 ranker：MCA 基线 3 组 acc=0.778/tau=0.556/regret=0.32pp 未达
  门（acc≥0.80/tau≥0.70/regret≤2%）；瓶颈缺“MCA+有效标签”同组
  候选（tools/export_ranker_data.py + ranker_eval.py 已就绪）。
- 契约语料 `data/contract-corpus.csv` 100 行（短期项 7 region 目标
  达成；≥100 唯一 final-object 口径待细化）。
- 已知工具 bug 均已修并入库：freeze-ablate stale-bundle、
  LD_PRELOAD N1/920B 无效、/tmp 配额流程改 build/。

## Deliverables

- `prompt.md`（已写）、`response.md`（后台生成）、`decision.md`
  （主进程在自然检查点填写）。
