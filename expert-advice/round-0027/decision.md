# Round 0027 decision（2026-08-17）

执行 Agent 对 round-0027 建议的逐项处置。注意：专家回复基于其读取
时刻的旧状态（dct32 未完成、ranker 3 组）；本 decision 以其建议为
准，处置时对照执行时的最新事实。

| 建议 | 处置 | 证据/理由 | 对应下一轮 |
| --- | --- | --- | --- |
| 闭环 dct32（0 NEON、VL=256 guard、≥20k 跨 VQ、TestBenchLite 多 seed，登记 uop/tbl/spill/尺寸） | accept | 本轮已完成：dct32 双组 0 NEON、41k 跨 VQ 0 失配、TestBenchLite vq=2 六 seed PASS；fused_uop 897 已入库（docs/72 同宽表）。 | 950 实机 direct-call/注入 |
| dct16 布局 A/B（现打包 vs quad-form 早形成 + splice/zip/trn/uzp）再过同一门禁后 950 交错 direct-call，预注册 MDE，95%CI 下界>1 才晋级 | defer | 需 950 机器；静态同宽对比已显示现布局 uop 显著更少（640 vs 952）。950 若周期不占优再启动布局 B，避免无数据空转。 | 950 实测后 |
| 950 E2E 只让胜者跑（同机 md5、两段同向、100f CI 不跨零、相对严格 bundle 正增量） | accept | 与 docs/63 既有协议一致；继续作为 950 放行门。 | 950 100f/策略 |
| ranker 至少 8 独立组、30 可分辨对后再做 family 留出，门 acc≥0.80/tau≥0.70/regret≤2% | accept | 已并入 M2 34 行 + 熵族 mca：ranker-training 101 行、5 组、MCA 基线 0.859/0.697/1.79pp（acc/regret 达门）；组数与可分辨对仍不足，family 留出暂不宣布。 | P3 ranker 数据补齐 |
| 换布局常只是把代价转移；保持 quad-form 跨多个 k，减少通用 tbl2 | accept（部分） | 当前实现已在 k≡2 mod4 保持 quad-form（dct16 一次 pack 供 4 个 k）；把“减少 tbl2”作为 950 后优化项。 | 布局优化 |
| pass 边界规范化 trace（调试门，保留 TestBenchLite 防共因错误） | accept | 本轮调试即用了等价手段（pass1/pass11 分进程逐值对照）；可沉淀为工具。 | 工具 |
| 组合式 SMT 翻译验证（逐原语 bit-vector + def-use 归纳） | defer | 正确性门禁已足够（TestBenchLite 标量 oracle + 跨 VQ 差分）；SMT 作为 P4 长期证明目标，proof_type 已进契约语料。 | P4 证明 |
| 下一条可证明声明：双组 lowering 逐语句精化两个独立 fused8 DAG + 相同 store 足迹 | accept（长期） | 写入 docs/70 §5；局部 SMT 证书 + DAG 归纳可复用到 satd/sa8d。 | P4 证明 |
| 不先声明 VL 无关（zip/uzp 分组随 VL 变化，最多证“非 256 安全回退”） | accept | 与本轮实测一致：8-lane 参考在 vq=2 因 zip/uzp 分组变化而失效；双组实现带 `svcntb()==32` guard。 | 文档/门禁 |
