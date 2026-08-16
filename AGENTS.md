# AGENTS.md（Codex/agent 协作约定，2026-08-16）

本文件是 agent 读取的项目操作契约；人类阅读入口是
`README.md`。两者冲突时以本文件与 `docs/59-handoff-20260816.md`
为准。

## 1. 入口文档（先读这些）

- 当前状态唯一权威交接：`docs/59-handoff-20260816.md`（历史版
  `docs/59-history-20260816.md`）。
- 专题：docs/63（950/920B 内网测试）、docs/64（SVE128/NEON 迁移）、
  docs/65（IR 粒度审计）、docs/66（多 ISA 家族全景）、docs/67
  （kernel 测试数据库）、docs/52（AGO 规划）。
- 实测报告：`reports/`；顶级模型建议：`expert-advice/round-NNNN/`
  （含 `decision.md`，执行 agent 必须处理每条建议的 accept/reject/
  defer）。

## 2. 测试数据库（强制维护）

`data/kernel-test-db.csv` 是全部测试结果的权威记录，
`tools/kernel_db.py` 是其唯一维护入口；
`data/kernel-test-db.md` 是 `export-md` 生成物。

规则：
1. 任何测量（门禁、MCA 计数、实机 kernel、E2E、消融、bundle A/B）
   都必须入库：`python3 tools/kernel_db.py add '...'`，然后
   `python3 tools/kernel_db.py export-md`。
2. 入库行必须与对应报告/代码在**同一个 commit** 里提交。
3. 禁止手改 CSV 列位（易错位）；增改一律走 CLI。CSV 是唯一权威，
   MD 不要手改。
4. 符号约定：E2E % 负=更快；kernel ratio >1=候选更快；CI 为
   bootstrap95 范围、空=未计算；bit_exact 填 same-machine md5 门
   结果（策略放行项填 `no (policy)`）。
5. gate-only 结果 machine 留空；`report` 字段必须指向可读来源。

示例：

```sh
python3 tools/kernel_db.py add 'kernel=dct16 variant=op895 machine=950 \
  mca_fused_uop=895 gate_vq=1;2 gate_cases=20000 gate_mismatch=0 \
  testbench=PASS kernel_metric=ratio_vs_sve kernel_value=1.29 \
  bit_exact=yes report=reports/xxx.txt'
python3 tools/kernel_db.py export-md
```

## 3. 机器与红线

- N1（chiro@129.146.162.16）：工作树有用户暂存删除，**禁止
  checkout/reset**；验证一律 scp .so + LD_PRELOAD。
- 920B（chiro@124.70.206.229）：ssh 有 PQ 警告横幅（正常）；SVE2
  候选 SIGILL；真实 100f 必须用 `/tmp/real_1080p_100f_b.yuv`
  （30f 文件只有 30 帧，`--frames 100` 不补帧）。
- 710（root@47.96.166.168）：`git push yitian` 直同步。
- 950：SVE2 2x256，E2E 需 host+yuv；测试媒体从 GitHub release
  `e2e-media-20260816` 下载（docs/63 §0）。
- /tmp 曾配额写满：临时产物放 `build/tmp-*`，清理用显式路径的
  python `os.remove`，不用 rm 通配。

## 4. 工作流

- 新候选：DAG → emit → `tools/dag_pipeline.py` 门禁 → 计数 →
  **DB 行** →（实机 kernel/E2E）→ **DB 行** → 报告 → docs 更新 →
  commit。
- 代码改动提交前必须跑回归：
  `python3 -m unittest discover -s tools -p 'test_*.py'`、
  `python3 -m unittest discover -s optimizer/ir`、
  `python3 -m unittest discover -s optimizer/ago`。
- 结果、报告、DB 行、docs 更新一起提交，并推送到 origin/yitian/
  github 三端。
