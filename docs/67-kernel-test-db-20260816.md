# Kernel 测试数据库（2026-08-16）

把散落在 reports/docs 的最新测试数据收敛成一个可查询的轻量数据库：

- 权威数据：`data/kernel-test-db.csv`（一行 = 一个候选变体在某台机器
  的一次测量；gate-only 行 machine 留空）
- 查询/维护工具：`tools/kernel_db.py`
- 自动生成的摘要文档：`data/kernel-test-db.md`（`export-md` 产物）

## 字段

id / date / commit / kernel / family / variant / input_isa（DAG 或候选
来源：c/neon/sve1/sve2/sve2p3/混合）/ output_isa（lowering 目标）/
candidate_file / mca_fused_uop / mca_total / gate_vq（vq 或 replay/
real-20k/scalar）/ gate_cases / gate_mismatch / testbench（TestBenchLite
PASS 或空）/ machine（N1/920B/710/950）/ kernel_metric + kernel_value
（实机 paired 指标；ratio >1 候选更快，ticks_pct 负=更快）/ e2e_30f_pct
/ e2e_100f_pct（负=更快；bundle 四臂等受控实验同约定）/ e2e_ci_ms
（bootstrap95，跨零=不显著）/ bit_exact / report（来源文件）。

## 用法

```sh
# 新增/更新一行（id 缺省按 kernel-variant-machine-date 生成，upsert）
python3 tools/kernel_db.py add 'kernel=dct16 variant=op895 machine=950 \
  mca_fused_uop=895 gate_vq=1;2 gate_cases=20000 gate_mismatch=0 \
  testbench=PASS bit_exact=yes report=reports/xxx.txt'

# 查询（按子串过滤）
python3 tools/kernel_db.py query --kernel dct32 --machine 950
python3 tools/kernel_db.py query --family filter --output-isa neon

# 重新生成摘要 Markdown
python3 tools/kernel_db.py export-md
```

约定：E2E % 统一“负=更快”；CI 为空/0 表示未计算；bit_exact 为
same-machine md5 门（op4032 这类策略放行项记 `no (policy)`）。每次
新测试落盘后，把结果行 `add` 进 CSV、`export-md`、随报告一起提交。
