# 工具清单与流水线地图（2026-08-13）

目的：让后续优化/评估**直接走工具程序流程**。规范入口是
`tools/pipeline.py`；每个 kernel 用一份 manifest 声明接入信息；工具按
阶段归类，输入/输出明确，可单独运行也可被 pipeline 编排。

## 1. 流水线地图

```text
                    kernels/<name>/manifest.yaml
                              │
   kernel ──▶ ingest ──▶ discover ──▶ optimize ──▶ emit ──▶ evaluate
              │          │            │            │        │
          trace_kernel │ dct16_shared │ search_*  emit_*   parse_qemu
          (QEMU)       │ _discovery   │ (枚举)    (C++/.S)  + verify
              │        │            │            │        │
              ▼          ▼            ▼            ▼        ▼
          asm_ir/     lane-forms   布局参数/    kernel    fused_adj
          LoopIR      + 共享矩阵    rewrite     源码      + loop_report
```

## 2. 工具清单

### ingest（抓取/导入）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `tools/trace_kernel.sh` | kernel .o + 符号 → `-d exec,in_asm` trace 日志 | 通用 |
| `tools/parse_qemu_trace.py` | trace 日志 + 地址区间 → 指令流 JSON（true-dynamic，含 fused_adj） | 通用；`--exec` 为真实动态 |
| `optimizer/ir/asm_ir.py` | 指令流 → 寄存器 SSA asm-IR | DCT16 覆盖 |
| `tools/recover_loops.py` | 指令流 JSON → 循环骨架（trip/period/depth） | 原型，通用 |

### discover（结构发现）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `tools/dct16_shared_discovery.py` | trace + .rodata → 共享常量矩阵报告 JSON | DCT16 专属 |
| `optimizer/analysis/asm_linearize.py` | asm-IR → lane 符号形式 / 共享矩阵命中 | DCT16 覆盖 |

### optimize / emit（生成）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `tools/emit_dct16_sve2_shared.py` | 布局参数 → C++ ACLE kernel | DCT16 专属；参数化 |
| `tools/emit_dct16_sve2_asm.py` | C++ → `.S`（bootstrap 一次）+ `as` | DCT16 专属；ACLE-free 重建 |
| `optimizer/ir/rewrites.py` | MachineIR → MachineIR（widen/tree_to_mla 等） | DCT8 覆盖，未接 SVE2 |
| `optimizer/ir/codegen.py` | MachineIR → NEON C++（dct8/dct16/sa8d/interp8） | 每 kernel 专属函数 |

### evaluate（评估）

| 工具 | 输入 → 输出 | 状态 |
| --- | --- | --- |
| `kernels/<name>/*_verify.cpp` | 候选 + 参考 → mismatch 报告 | 每 kernel 专属 harness |
| `tools/search_sve2_layouts.py` | 布局域 → 生成/编译/差分/计数/排名 | DCT16 专属；穷举 |
| `tools/search_driver.py` | MachineIR + rewrite 组合 → 静态 Pareto 排名 | DCT8 通用 |
| `tools/count_asm_insns.py` / `classify_disasm.py` | object/disasm → 静态分类 | 通用 |
| `tools/fusion_analysis.py` | disasm + profile → 融合清单 | 通用 |
| `tools/recover_loops.py` | trace JSON → 循环健康度 | 通用 |

### 编排与契约

| 工具 | 说明 |
| --- | --- |
| `tools/pipeline.py` | 一键骨架：baseline → search → report；读取 kernel manifest |
| `tools/pipeline.py finalize` | 固化最优候选：best_sve2.cpp/.S + 20 万例验证 + best.json |
| `tools/gen_verify.py` | 从 manifest 生成上游差分 harness（参考/corpus/VL） |
| `kernels/<name>/manifest.yaml` | kernel 接入契约：参考库/符号、driver、corpus、VL、布局域 |

## 3. 现状判定

- **DCT16 纵切**：pipeline 一键可跑（~3.4s），优化只改 manifest 布局域 /
  发射器参数；finalize 输出稳定交付产物（best_sve2.cpp/.S）；
- **通用化缺口**：manifest 仅 dct16 一份；verify harness、lane 语义、
  发射器仍是 per-kernel；rewrites（MachineIR）未接到 SVE2 流程；
- **搜索空间**：当前 3 个布局组合穷举，耗时 <60s，暂不需要启发式算法；
  超过 60s 后再引入 beam/剪枝。

## 4. 下一步（按用户优先级：工具进化优先）

1. kernel manifest 成为所有阶段的输入契约（baseline/verify/搜索从
   manifest 读符号、参考、corpus、布局域）——✅ 已完成；
2. 布局搜索空间参数化：`search_sve2_layouts.py` 从 manifest 布局域自动
   枚举，新增布局只改 manifest——✅ 已完成（6 组合，~6.4s）；
3. 评估漏斗参数化：verify 从 manifest 选参考符号/corpus，去掉硬编码；
   ——✅ 已完成（gen_verify.py）；
4. LoopIR 接入发射器（docs/15），循环级布局进入搜索域；
5. rewrites 通用化后接到 SVE2 流程，优化 pass 真正可插拔。
