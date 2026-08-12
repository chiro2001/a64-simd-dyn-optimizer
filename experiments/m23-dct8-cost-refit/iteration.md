# M23-DCT8-Cost-Refit：9 点重拟合关键路径逐 mnemonic 延迟 + 留一法验证

- run-id: `m23-dct8-cost-refit`
- state: `rejected`（9 点回归不能泛化；全量拟合仅能粗排，留一法为负）
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地 x86 交叉 + N1 + 920B

## 1. 假设

m16 §6 提出“按机器拟合逐指令延迟”的下一步。假设：把 M16 的 4 个校准点扩到
9 个同批次候选（upstream/widen/proto_b/proto_c + M22 的 5 个结构组合），
关键路径逐 mnemonic 线性回归可以给出跨候选排序，且留一法验证通过。

## 2. 方法

- 9 个候选用同一套交叉构建（候选 .o `-O2 -march=armv8-a`，微基准 `-O3`）；
- 每机每候选：31 次、batch=4096、`taskset -c 0`、CNTVCT_EL0，取 median，
  再减去同二进制的 `empty` 总 ticks，得到 kernel ticks
  （`measurements.json`）；
- 反汇编 9 个候选（`disasm/*.txt`），`tools/critical_path.py --fit` 拟合
  逐 mnemonic 延迟（NNLS 下界 0.01），`fitted-{n1,920b}.json`；
- `tools/validate_cost_model.py --loocv`：每次留一个候选，用其余 8 个
  拟合再预测留出者。

## 3. 结果

### 3.1 全量拟合

| 机器 | R² | Spearman(pred, meas) | 备注 |
| --- | ---: | ---: | --- |
| 920B | 0.551 | 0.633 | 能粗排（proto_b/proto_c 判为最差） |
| N1 | 0.333 | 0.550 | 同样仅粗排 |

按家族分组的全量 Spearman：920B 0.867、N1 0.200。关键路径组合把
`widen`/`widen-shift64`/`widen-wide_load` 归为同一预测值，无法区分
非关键路径上的 shift64/wide_load 差异。

### 3.2 留一法（能否推广到未见过结构）

| 机器 | LOOCV Spearman | LOOCV R² |
| --- | ---: | ---: |
| 920B | -0.517 | -2.432 |
| N1 | -0.833 | -3.399 |

9 个点对 15 个 mnemonic 严重过拟合；留一法为负，说明**当前线性关键路径
回归不能作为排序模型**。按 mnemonic 家族分组后留一法仍只有 0.217/0.100。

## 4. 结论

1. 回归方案**否决**：跨结构推广失败；`tools/validate_cost_model.py` 新增
   `--loocv`，`tools/search_driver.py` 新增 `--fit=` 以便复用拟合产物。
2. 证据指向模型缺项：关键路径单项 + 线性权重无法解释实测排序（上游
   342 条指令反而最快、proto_b 229 条最慢），需要：
   - 逐指令延迟**直接测量**（依赖链微基准，替代回归拟合）；
   - 或增加 issue/front-end 资源项与显式机器端口模型。
3. 全量拟合权重作为“粗筛”保留：它能稳定把 mla 链候选判为差，但对相近
   结构没有区分度，禁止用作最终排序依据。

## 5. 下一步

按信息增益：
1. 在 N1/920B 上直接测量 addp/mul/mla/rshrn/trn/zip/widen 等关键 mnemonic
   的依赖链延迟，替换拟合权重，再对 9 候选重跑排序验证；
2. 若直接延迟仍不能排序，把成本模型改为“关键路径 + issue 计数”两参数
   结构，并用 M23 九点校准；
3. 等待 round-0007 专家回复后按其优先级修正方向。
