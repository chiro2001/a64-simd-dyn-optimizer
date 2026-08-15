# 920B 负结果台账（2026-08-15，round-0021/0022 停止规则）

规则：只有预测 E2E >=0.25 点或通过结构门禁的路径才继续；本台账记录
所有已尝试的负方向及其证据，避免重复劳动。

| 方向 | 结果 | 证据 |
| --- | --- | --- |
| costC1C2Flag run-cache（NEON） | 真实分布整体 ~0.95（n1-4 慢） | reports/c12-slot-investigation-20260815.txt |
| costC1C2Flag NEON 掩码路径（round-25/28） | n5-8 无改善（掩码构建不是瓶颈） | reports/c1c2-920b-e2e-20260815.txt |
| costCoeffNxN NEON 变体初版 | soff=15 92,999 失配（尾部 ctx 跳过缺失），修复后 +9.7% 转正 | reports/entropy-replay-920b-20260815.txt |
| costCoeffNxN soff 全展开（round-31） | +7.5% < 循环版 +9.7% | 同上 |
| dct32 SVE2 布局（best_op_mca/r16） | 替换版延迟 0.93-0.97、吞吐 ~1.0，不注入 | reports/dct32-sub-920b-20260815.txt |
| quant（SVE1 / NEON 全展开 / NEON pair+uzp） | 12-13 vs 上游 9 ticks（三轮） | reports/end-to-end-comparison-20260815.txt |
| interp8 path-B SVE1 替换 | 0.55-0.87，不注入 | docs/29 |
| sad16 SVE1 候选 | 78 vs 43 ticks（1.8× 慢） | 本轮实测 |
| sa8d16 mixed（SVE1 宽装载+NEON H） | 0.92-0.95 | docs/48 |
| scanPosLast SVE2 候选（950） | 慢 4.5×，950 不注入 | reports/950-quick-test-20260815.txt |
| sa8d16 SVE2 候选（950） | 正确性 FAIL | 同上 |

## 方法学负结果（工具层）

- 均匀/固定 n 微基准会高估熵族收益（costC1C2Flag 2.1× 假象）；真实
  分布回放为准。
- 共享节点逐桶计时噪声 ±5-10%，大桶首次触碰页故障可 5×；必须先暖
  缓存并核对二进制 md5。
- QEMU/交叉 ref 与云端生产 ref 在 beyond-bound read 场景行为不同；
  熵族候选必须对生产静态库逐调用差分。
