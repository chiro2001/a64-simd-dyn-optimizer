# Round 0026 context

## Task

用户要求用 bash 调用 top model（`codex exec -p sss`，model
`gpt-5.6-sol`，reasoning effort `max`，read-only）问三个问题：AGO
搜索如何改进以逼近最优性能、能否数学证明、AGO 项目下一步路线。

## Method

- 调用：`codex exec --ephemeral -s read-only -p sss -m gpt-5.6-sol
  -o build/tmp-expert-advice-round-0026.md '<prompt>'`
- profile `~/.codex/sss.config.toml`：model=gpt-5.6-sol、
  provider=sss、reasoning effort=max、disable_response_storage=true。
- 模型读取：docs/52、docs/59（+history）、docs/65、docs/66、
  round-0024 decision/response、ago-m2/m3 报告、
  data/kernel-test-db.csv。

## Status summary (facts)

- HEAD `6c46351`（920B 内网 best9 E2E 入库），三端同步。
- AGO M0-M2 完成：SATD8 17 实例留出排序门 N1 acc=0.975/tau=0.951、
  920B acc=1.000、N1→920B 迁移 acc=1.000（reports/ago-m2-expanded-
  ranking-20260816.txt）。
- M3：PEXT/DFA 模板 + 穷举证明 + 生产逐调用差分/canary/真实回放；
  scan E2E 920B -1.61%/-1.80%，remain +0.25pp；M3 剩余全展开模板。
- M4：`--backend ago`/`--rank-by ago` 存在，无独立 E2E 声明。
- 项目 E2E：best9 920B -2.06%/-2.02%（内网复测 -1.85%/-1.80%）、
  N1 -1.52%、710 -1.53%；距 15% 目标 ~13pp。
- 数据库 45 行；AGENTS.md 强制测量入库。

## Deliverables

- `prompt.md`：发送给模型的完整请求。
- `response.md`：模型最终回复（待 bash 运行后复制）。
- `decision.md`：执行 Agent 处置，后续自然检查点填写。
