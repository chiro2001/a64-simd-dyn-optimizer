# Round 0025 decision

状态：response.md 于 2026-08-16 落盘；执行 Agent 随后完成 P2 的 920B
消融（reports/entropy-ablation-920b-20260816.txt），处置如下。

| 建议 | 处置 | 证据/理由 | 下一步 |
| --- | --- | --- | --- |
| P0：950 exact 路线（dct16/32 真实热点→单候选消融→E2E） | **部分完成** | 4bb48e3 复测（reports/950-quicktest-4bb48e3-20260816.txt）：kernel 级与门禁全部重确认（op895 +29% vs SVE、op4032 +71%/+40%、opbase 平价；5-seed PASS、20k diff 0/0/5300）；E2E 消融仍缺远程 host + yuv | 有 host+yuv 后跑 freeze-950-dct.sh；op4032 需策略签字 |
| P1：op4032 非 bit-exact 策略实验 | **defer（默认不发布）** | 现行门禁要求 bit-exact；op4032 匹配 C 参考但与上游 SVE 有 5300/20M lane 差异 | 等策略签字；如放行则测多内容/QP 码率与 PSNR/SSIM/VMAF |
| P2：920B 熵族收敛（remain 分布复查 + scan/remain 消融） | **accept（已完成）** | 真实分布回放 08-15 已显示 remain DFA +20%；本轮 30f 消融：scan-only -1.61%、no-remain -1.50%、with-remain -1.75%，全部 bit-exact、CI 不跨零。remain 贡献约 +0.25pp，均匀语料 -35% 为分布敏感伪信号 | 保持 scan 与 remain DFA 注入；后续 100f 交错复核 |
| P3：N1 四臂 100f 组合归因 | **accept（已执行，结果中性）** | reports/four-arm-n1-100f-20260816.txt（真实 100f 修正版）：10 轮交错全部 bit-exact（07450372…）；best9 +0.25%、ir-dct +0.02%、best9-ir-dct +0.10%，CI 全跨零——IR-DCT 未在 best9 上叠加，N1 噪声主导 | N1 维持 best9 发布集；IR-DCT 候选保留，待 950/710 或独占节点复测 |
| P4：710 luma_hvpp 新研发 | **defer（已有关闭证据）** | docs/59-history §13：profile 确认 interp_hv_pp 约 5–7% 是剩余最大目标，但 `emit_hvpp_fused.py` 的 Clang 融合提取候选对 GCC 缓冲路径不 bit-exact（20k 相位组合 ~52% 失配）且 22.16 vs 22.11 ticks 无赢点；需完全自研 SVE2 版本，收益不确定，已暂缓立项 | 仅当有新自研方案（非 Clang 提取）再重开；本轮已把 950 E2E 一键脚本备好 |
| 950 E2E 准备 | **accept（已备好）** | `scripts/freeze-950-dct.sh`（预构建 23-kernel bundle + 5+5 + md5 + paired CI，`GATE=1` 原生 TestBenchLite）、`scripts/build-testbench-lite-native.sh`（native 模式）已入库 | 用户提供 950 访问与 yuv 后执行 docs/63 流程 |
| 新增 `scripts/freeze-ablate.sh` 参数化消融工具 | **accept** | 三变体一次通过，md5 门与 paired CI 正常 | 复用于 100f 复核与 950 单候选消融 |
