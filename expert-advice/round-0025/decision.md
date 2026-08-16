# Round 0025 decision

状态：response.md 于 2026-08-16 落盘；执行 Agent 随后完成 P2 的 920B
消融（reports/entropy-ablation-920b-20260816.txt），处置如下。

| 建议 | 处置 | 证据/理由 | 下一步 |
| --- | --- | --- | --- |
| P0：950 exact 路线（dct16/32 真实热点→单候选消融→E2E） | **defer** | 交接文档无 950 访问信息/yuv，无法在本轮执行；需用户提供访问与 `/tmp/real_1080p_30f.yuv` | 用户提供后按 docs/63 流程执行 |
| P1：op4032 非 bit-exact 策略实验 | **defer（默认不发布）** | 现行门禁要求 bit-exact；op4032 匹配 C 参考但与上游 SVE 有 5300/20M lane 差异 | 等策略签字；如放行则测多内容/QP 码率与 PSNR/SSIM/VMAF |
| P2：920B 熵族收敛（remain 分布复查 + scan/remain 消融） | **accept（已完成）** | 真实分布回放 08-15 已显示 remain DFA +20%；本轮 30f 消融：scan-only -1.61%、no-remain -1.50%、with-remain -1.75%，全部 bit-exact、CI 不跨零。remain 贡献约 +0.25pp，均匀语料 -35% 为分布敏感伪信号 | 保持 scan 与 remain DFA 注入；后续 100f 交错复核 |
| P3：N1 四臂 100f 组合归因 | **accept（已执行，结果中性）** | reports/four-arm-n1-100f-20260816.txt：10 轮交错全部 bit-exact；best9 +0.54%（CI 跨零）、ir-dct -0.12%、best9-ir-dct +0.19%——IR-DCT 未在 best9 上叠加，N1 噪声主导 | N1 维持 best9 发布集；IR-DCT 候选保留，待 950/710 或低噪声节点复测 |
| P4：710 luma_hvpp 新研发 | **pending** | 需先审计槽位与调用链 | 待 P0-P3 收敛后立项 |
| 新增 `scripts/freeze-ablate.sh` 参数化消融工具 | **accept** | 三变体一次通过，md5 门与 paired CI 正常 | 复用于 100f 复核与 950 单候选消融 |
