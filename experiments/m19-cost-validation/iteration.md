# m19-cost-validation：成本模型跨家族泛化验证（P6' 相关性门）

- run-id: `m19-cost-validation`
- state: `rejected-generalization`（模型家族内有效、跨家族不成立）
- date: 2026-08-13（Asia/Shanghai）
- host: 本地 x86（静态分析）+ N1/920B 实测延迟

## 1. 方法

7 个候选（DCT8：upstream/widened/proto_b/proto_c；interp8：proto_dot 8x8 /
proto_dot16 / proto_vdot）× 双机实测 latency。用 M16 拟合的逐 mnemonic 权重
在最长路径组成上做点积预测，报告 Spearman 排名相关；再做留一法（6 拟合、
1 预测）。

## 2. 结果

| 验证 | N1 | 920B |
| --- | ---: | ---: |
| 家族内拟合（DCT8 4 点） | R²=0.814 | R²=0.982 |
| 跨家族直接外推（DCT8 权重预测 interp8） | Spearman 0.500 | 0.143 |
| 留一法（7 点交叉） | Spearman **-0.214** | **0.607** |

interp8 关键路径上的 `sdot/tbl/smlal` 在 DCT8 拟合中权重≈0（无覆盖），
外推预测几乎为 0。留一法 N1 为负——**最长路径组成的线性模型不能跨 kernel
家族泛化**。

## 3. 结论（P6' 门）

docs/09 的“相关性验证后进搜索主循环”**未通过**：模型仅在拟合家族内可用
（920B DCT8 R²=0.98 可驱动该家族内排序），不得用于跨家族候选排序。改进
方向（按信息增益）：

1. 按 lane 位宽/指令家族分组延迟（mul 8b/16b/32b、dot、tbl、narrow 各自
   一组），而非逐 mnemonic；
2. 加吞吐/端口项（当前只建模最长前向链）；
3. 扩充每机实测点（≥3 家族 × ≥4 候选）再拟合；
4. 拿到内部 30-60% 参考实现的指令直方图校准。

证据：`tools/validate_cost_model.py` + `experiments/m16-dct8-protoc/
fitted-{n1,920b}.json`。
