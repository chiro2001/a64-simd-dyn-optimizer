# Round 0028 decision（2026-08-17）

执行 Agent 对 round-0028 建议的逐项处置。专家回复基于其读取时刻的
状态（sao SVE2 仅 E0/B0/E1、i8mm 仅 3 形状）；处置时对照执行时的
最新事实（sao SVE2 六 kernel 已全闭环、interp8 hpp i8mm 已扩 6
非方形形状，DB 183 行）。

| 建议 | 处置 | 证据/理由 | 对应行动 |
| --- | --- | --- | --- |
| 契约驱动生成：把 effects/alias/rounding/tail/VL/dataflow 映射为合法 grammar，按 ISA/VL 先过滤，每区 64 候选（satd/sa8d、dct、saoCuOrg、interp8-i8mm） | accept（设计先行） | 与 M2/M3 现有搜索方向一致；契约语料 128 行已含 6 cuorg region 与多 region 元数据，可作为 grammar 的种子数据。 | 下一轮：设计 grammar 草案（docs/74），先在 satd/sa8d 小域对照全枚举 |
| 联合成本代理 + 弃权：每机拟合关键路径/端口/访存/peak-live/spill/分支/尺寸 + fused_uop -> ticks 区间；补 60 跨 family 三机 pair；留一机验证，只测 25% | accept（分阶段） | 现有 ranker 已达门（acc 0.917/tau 0.871/regret 1.53pp），但特征仅 fused_uop/mca_total，710/950 标签稀疏；补标签成本高。 | 先扩特征（static_counts 已有 total/stack_vector 可加），再补三机 pair；950 行依赖实机 |
| 有限 B&B + 主动测量（satd/sa8d 小域与全枚举对照；Pareto 前沿按不确定度实测） | accept（下一搜索迭代） | 与“内最优可用穷举/B&B 证明”的既有判断一致；P4 证明目标已列 docs/70 §5。 | 实现 B&B 原型时以 satd/sa8d 为对照域 |
| 双组 lowering 组合等价证明（svcntb()==32 + 契约下 16-lane 程序 ≡ 两个 fused8 DAG；SMT 证原语 + lane_in/n_out 无环归纳） | accept（最高价值数学声明） | 16-lane 发射器已全门禁通过；这是可用于 M4 的发布安全证书，不声明 VL 无关。 | 作为 P4 证明首要任务，写入 docs/70 §5 |
| 有限 grammar 的 B&B 最优性证明（给定 grammar/编译器/代价函数的域内最优，保存上下界/剪枝原因/哈希） | accept（次高） | 可复用 M3 PEXT/DFA 的证书模式。 | 与 B&B 原型同批沉淀 |
| ranker 若跳过实测，证明 P(regret>2pp\|不弃权)≤0.05 + coverage 下界 | defer | 当前 coverage 83% 仅为点估计；先补标签再谈概率界，避免在稀疏数据上伪造置信。 | 标签 ≥60 pair 后重评 |
| 跨机迁移界、全球最优、全 VL 等价、15% E2E 上界 | reject（学术装饰） | 数据与微架构参数不足，且对发布决策无增量价值。 | 不立项 |
| 三机实测 saoCuOrg NEON 种子与 interp8-i8mm（710 优先），须 ratio CI 下界>1、两批 bit-exact、E2E 增 0.2pp；否则归档 | accept（无 950 路线第一步） | 提供 sao/ i8mm 家族首个实机证据；SVE2 32B 版仅静态/QEMU，不冒充实机。 | 本轮后续：检查注入基础设施并启动 N1/710 实机 kernel A/B |
| 纯 SVE 仅作回退：微基准相对 NEON/混合 ≥10% 且 Amdahl 投影 ≥0.3pp 才重开 | accept | 710 纯 SVE dct16/32 E2E -2.63% 已证不占优；本轮 sao SVE2 为 QEMU-only 证据，不做实机承诺。 | 纯 SVE 推广暂停，除非微基准翻转 |
| 950 是独立外部门，未测前不宣称 M4 完成 | accept | 与 tools/m4_declaration.py 的 INCOMPLETE 判定一致。 | 保持 M4 INCOMPLETE，等用户侧 950 |

本轮新增事实（专家未见）：saoCuOrg E0/B0/E1/E1_2Rows/E2/E3 SVE2
全闭环（20k 0 失配，fused_uop 65/57/129/65/33/33，0-NEON）；
interp8 hpp i8mm 非方形 6 形状双参考（dotprod + C）0 失配
（fused_uop -O2 33/34/62/33/62/33）。
