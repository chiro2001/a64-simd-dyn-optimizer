# N+2（鲲鹏 960）SVE2 验证合同（2026-08-13）

状态：**预注册**。当前只有 QEMU（`-cpu max,sve-max-vq=2`）验证与
true-dynamic 计数；920B 是 SVE1，无法执行本项目的 s16→s64 SDOT
（SVE2），因此**中间档 920B 只对 NEON 候选有效**，SVE2 候选直接以
960 为验收目标。

## 1. 目标与基线

| 档位 | 基线（同机冻结） | 保留 | 优秀 |
| --- | --- | ---: | ---: |
| b：NEON→SVE256 | 同机最佳 NEON（dct16_neon） | speedup > 2.10 | >= 2.30 |
| c：SVE256→SVE256 | 同机最佳 SVE256（上游 dct16_sve 或本项目 best） | speedup > 1.10 | >= 2.30 |

指令数口径（预注册）：true-dynamic fused_adj（movprfx 融合后）；宽度
标准：相对 128-bit 有效上游 SVE 应减半（当前 best 1292/1911=0.68，
回收 65% 减半空间）。

## 2. 运行合同

- 固定 VL=256：候选注册前 `prctl(PR_SVE_SET_VL, 32)` 并断言返回值；
  线程池继承由 x265 dispatch 层负责，注册时校验 worker VL；
- 同一 binary 内函数指针 A/B（候选/上游），或分 binary 时严格同
  compiler/flags/layout 并记录 binary hash；
- corpus：manifest 声明（stride {16,17,32}、[-255,255]、随机 seed
  固定）；每轮加 guard-page 与 canary 边界；
- paired 协议：warmup→empty→A→B 与 B→A 交替，≥30 有效 pair、跨 3
  进程，报 median/p05/p95/MAD + bootstrap 95% CI；
- cycles 用 PMU（CNTVCT 或 perf），不拿 TestBench ticks 当 cycles；
- 正确性：上游位级一致（manifest 生成 harness，200k 例 0 分歧）+
  x265 transforms TestBench + 单线程 deterministic encode 回归。

## 3. 候选注册条件（960 接入前可完成的静态门禁）

- `tools/pipeline.py --all` 全绿（baseline/search/report）；
- `pipeline.py finalize` 固化产物并通过 200k 上游差分；
- `tools/check_isa_level.py` 确认指令集 <= SVE2.3、VL 相关指令合规；
- 循环恢复报告无异常展开（loop_report 健康度）；
- `tools/fusion_analysis.py` 融合清单与 fused_adj 口径一致。

## 4. 决策

- 960 实测保留门槛未过：保留负结果与成本误差，不注入；
- b/c 档优秀门槛达到：标记"工具已优秀"并全量存档；
- 实机与 fused_adj 预测偏差 >20%：以实机为准，回填成本模型数据
  （docs/09 resource lower bound）。
