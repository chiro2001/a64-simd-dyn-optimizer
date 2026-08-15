# best6b 冻结发布与复现手册（2026-08-15）

## 1. 冻结版本

- 冻结 commit：`3765764`（`376576465b5f33022977be6f2a94dd3799d568b2`）
- 目标机：920B（SVE1 2x256 + NEON 4x128，无 PMU），x265 b81f650，
  build/x265-8-gcc。
- 测试输入：真实 1080p YUV420；片段 A=30 帧，片段 B=同视频 3.33s 起
  100 帧（内容不同）。
- 正确性基准：码流 md5 与干净基线完全一致（片段 A: ee5db7…；片段 B:
  1600c2fa…），即逐位 bit-exact。

## 2. 注入内容（20 个 dispatch 槽，6 个内核）

| kernel | 发射器/来源 | 生产逐调用验证 | 真实回放 |
| --- | --- | ---: | ---: |
| cost-c1c2-flag (r29) | emit_cost_c1c2_flag_sve2_shared.py | 6,472,176 bad=0 | +30% |
| scan-pos-last (r30) | emit_scan_pos_last_sve2_shared.py | 4,325,107 bad=0 | +27% |
| cost-coeff-remain (r32) | emit_cost_remain_sve2_shared.py (emit_dfa) | 2,391,308 bad=0 | +20% |
| cost-coeff-nxn (NEON) | emit_cost_coeff_nxn_sve2_shared.py (emit_neon) | 5,776,047 bad=0 | +9.7% |
| satd-8 | satd 搜索候选 | 20k 差分 + E2E 码流一致 | +8% |
| sa8d16 | sa8d16 搜索候选 | 20k 差分 + E2E 码流一致 | ~1.0 |

覆盖声明（round-0022 审计）：**生产逐调用差分仅覆盖 4 个熵内核**
（合计 1896 万次调用，含 canary 红区检查）；satd8/sa8d16 为 20k 差分 +
批量注入后 E2E 码流一致。

## 3. 性能声明

| 片段 | 基线中位 | best6b 中位 | 差 | bootstrap95 |
| --- | ---: | ---: | ---: | ---: |
| A（30 帧） | 8180-8210 ms | 8047-8061 ms | -1.63% | [106, 173] ms |
| B（100 帧） | 22352 ms | 22025 ms | -1.43% | [250, 424] ms |

两次测量均为 5+5 配对、共享节点单核单线程；码流 bit-exact。

## 4. 一键复现（内网 920B/950 可用）

```sh
# 前置：目标机有干净 build/x265-8-gcc、/tmp/real_1080p_30f.yuv、
# /tmp/cloud-e2e-inject.sh（从 scripts/ 拷）
git pull origin main
scripts/freeze-best6b.sh user@host
# 30 帧默认；异片段：
FREEZE_INPUT=/path/clip.yuv FREEZE_FRAMES=100 FREEZE_MD5=auto \
  scripts/freeze-best6b.sh user@host
```

脚本输出：两边码流 md5、5+5 计时、bootstrap CI；PASS/FAIL 由 md5 门禁
决定。

## 5. 完整工具链（从候选到冻结）

1. 录制真实调用：`tools/trace_entropy_calls.py` +
   `DYNOPT_TRACE_PATH=... x265 ...`（码流必须不变）。
2. 生产逐调用差分 + 回放计时：`benchmarks/entropy_trace_replay.cpp`
   （`verify` / `neon` / `cand` 模式；verify 含 canary 红区）。
3. 像素族测量：`tools/trace_pixelcmp_calls.py`。
4. 注入：`tools/build_preload_so.py --inject-outdir ...` →
   `scripts/cloud-e2e-inject.sh`。
5. 冻结：`scripts/freeze-best6b.sh`（md5 门禁 + 配对 CI）。

## 6. 已知负方向（勿重复）

quant（三轮）、dct32 替换、interp8、sad16、sa8d8、pixelavg、psyCost、
sa8d16 mixed、ccn 全展开、c1c2 run-cache、scan SVE2(950)。完整证据见
`reports/negative-ledger-20260815.md`。

## 7. 决策点（等待用户/内网）

- 同机并行配置矩阵：唯一被专家认定可能到 15% 的结构路线，但超出
  “只做算子层”约束，需授权。
- 内网 920B/950 复测：机器恢复后跑第 4 节命令；950 上重点看
  scan/ccn/c1c2 是否保持或更好（构建门禁已通过，真机待验）。
- 算子平均 +30% / 端到端 +15%：round-0021/0022 两次专家核算均判定在
  920B 算子级不可达；当前冻结成果为 -1.4~-1.9%（bit-exact）。
