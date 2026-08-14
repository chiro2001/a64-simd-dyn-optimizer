# MCA 与 920B 替换预估校准（2026-08-14，P2 第一轮）

> 目标（docs/30 P2）：积累“候选 vs 上游 NEON”在 **NV2 代理 MCA** 与
> **920B 替换 paired（CNTVCT）** 两套 proxy 下的样本，校准相对排序
> 一致性，指导 950/960 实机验收的口径。

## 1. 样本表（2026-08-14 实测）

上游 NEON 基线本轮补测：dct8_neon（146 fused / MCA 48）、
idct16_neon（1487 / 462）、idct32_neon（10214 / 3318）。

| kernel | cand fused | MCA 比率 cand/up | 920B 替换比率 neon/cand | 方向一致 | 说明 |
| --- | ---: | ---: | ---: | ---: | --- |
| dct8 | 289/146 | 1.60 | ~0.75（p50 4/3） | ✅ 都慢 | 920B 是离散 p50，精度低 |
| idct16 | 980/1487 | **0.53** | 0.905（cand 慢 9.5%） | ⚠️ 方向反 | 替换把 2-way HtoS 变 4-way BtoS，高估 cand 工作量；docs/29 判为“上界” |
| idct32 | 5085/10214 | 0.35 | **1.129**（cand 快 13%） | ✅ 都快 | 替换版为“下界” |
| interp8 path-B 8x8（addp 前） | 101/141 | 1.02 | 0.5425 | ⚠️ 幅度差大 | BtoS 替换翻倍 dot 工作量 |
| interp8 path-B 16x16 | 359/467 | 1.03 | 0.8715 | ⚠️ 幅度差大 | 同上 |
| interp8 path-B 32x32 | 1417/1829 | 1.06 | 0.5911 | ⚠️ 幅度差大 | 同上 |

## 2. 结论

1. **方向可靠性**：920B 替换比率的“快/慢”方向只在替换形状接近真实时
   可信（idct32 HtoS→BtoS 同 32-bit 累加，方向正确）；对元素宽度变化
   大的替换（interp8 BtoH→BtoS），方向也可能失真（8x8 明显，16x16
   已接近 1.0）。
2. **幅度是有界估计**：BtoS 替换（每 lane 乘积数翻倍）给出 cand 的
   **上界 cycle**（即速度下界）；MCA（NV2）对 SVE2p3 内核更接近真实
   方向（interp8 三形状 MCA≈1.0，与“指令数 -30% 但 permute 主导”的
   结构判断一致）。
3. **实测建议**：950（SVE2）上 interp8 path-B 用 sve2 目标替换
   （sdot.h→sdot.s，addp/sqrrshrunb 原生，docs/32 §4.5）比 920B 的
   sve1 替换更接近真实；idct16 需要 950/960 复测来裁决 MCA(0.53) vs
   920B(0.905) 的分歧。
4. **模型用途**：MCA 用于候选排序（主），920B 替换用于“实机方向”
   次信号；绝对值验收以 950/960 为准（docs/27）。

## 2.1 950 真机校准更新（2026-08-14，docs/35）

950（920G，SVE2 2×256）真机 paired 数据（docs/35）显示：

- vpp16/vpp32/dct8 三个“MCA 判慢”的内核在 950 上实际**快于 NEON**
  （1.12~1.48×）——NV2 代理对 SVE256 系统性低估；
- idct16/32 的 BtoS 替换比率（1.09/1.03）是**下界**，方向与 MCA 一致；
- interp8 path-B 替换上界 0.44~0.58，950 不采用，等 960。

## 2.2 920B 内网实机 vs 云主机对照（2026-08-14，reports/920b-intranet）

| kernel | 内网 920B | 云主机（docs/29） | 差异 |
| --- | ---: | ---: | ---: |
| idct16 (sve1 sub) | 0.8462 | 0.905 | ~6%，同向（cand 慢） |
| idct32 (sve1 sub) | 1.1047 | 1.129 | ~2%，同向（cand 快） |
| ipb8 | 0.5086 | 0.5425 | ~6%，同向 |
| ipb16 | **0.6666** | **0.8715** | **分歧 >10%**（待复核云样本） |
| ipb32 | 0.5335 | 0.5911 | ~10% |

- 内网节点 cpuinfo 无 `sve2`，但直测可执行 SVE2 指令（sdot.d、
  splice）——应视为 **SVE2 能力的鲲鹏**，非严格 SVE1 920B；
- ipb16 分歧：云样本 60 对 vs 内网（共享 256 核节点），建议云主机
  重测（更多对 + 固定核）或以内网为准；
- dct8 内网原生测量方差极大（共享节点干扰），不可比，待独占核重测；
- 仓库工具已补 splice→sel（sve1 形状规则），使 idct16 sve1 替换构建
  可复现（此前 Agent 需本地扩展）。

## 3. 复现命令

```sh
# 上游 NEON 基线 trace + MCA（本机）：
python3 tools/gen_verify.py --manifest kernels/idct16/manifest.yaml --out /tmp/v.cpp
# 上游 idct16/32/dct8 NEON 的 trace/MCA 见 docs/34 §1（trace 文件在
# 对应 experiments/ 或重新按 docs/10 流程抓取）
# 920B 替换 paired：
bash scripts/build-substituted-microbench.sh idct16 sve1 build/idct16_sve1
bash scripts/bench-dct32-paired.sh build/idct16_sve1 neon cand
```
