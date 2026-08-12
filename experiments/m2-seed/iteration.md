# M2 Seed Import & Roundtrip Iteration

- run-id: `m2-seed`
- state: `accepted`（seed importer/roundtrip 全部门禁通过）
- date: 2026-08-12（Asia/Shanghai）
- host: `n1-neon128`

## 1. 本轮试图证伪什么

“从 LLVM IR 导入的 MachineIR/PackIR 无法 bit-exact 复现上游 NEON SA8D
语义，或 roundtrip 性能偏离上游超过 ±3%。”该命题被证伪。

## 2. 什么变了，什么刻意没变

变：

- `optimizer/ir/machine_ir.py`：受限 LLVM IR 导入器（load/zext/add/sub/
  shuffle/bitcast/AArch64 NEON intrinsics/lshr/ret），167 节点，无未知指令。
- `optimizer/ir/interp.py`：MachineIR 解释器，10 万随机 case 与 canonical
  解释器 bit-exact 一致。
- `optimizer/ir/pack_ir.py`：引用式 lane provenance 传播与 verifier，
  149 个值全部有 provenance，PackIR 不含 opcode/寄存器/顺序。
- `optimizer/ir/codegen.py`：MachineIR -> C++ NEON intrinsics。
- `generated/sa8d/roundtrip_sa8d_8x8.cpp`：roundtrip 候选。
- `scripts/build-sa8d-roundtrip.sh`、`build-sa8d-roundtrip-bench.sh`。

刻意没变：

- 没有修改 x265；没有进入搜索/优化，roundtrip 只是导入链路的验证。

## 3. 正确性证据

- MachineIR 解释器 vs canonical：100,000 cases（随机 stride/offset），
  mismatches=0。
- Roundtrip 候选 vs x265 C/NEON：100,000 cases，mismatches=0。
- PackIR verifier：无违规；projection_ok=True。

## 4. 相对哪个精确 baseline，性能如何

同一 `sa8d_microbench_rt` binary，8x8 latency，batch=4096，
taskset CPU0，5 进程 x 30 样本：

| impl | median ns/batch | ns/call |
| --- | ---: | ---: |
| upstream NEON | 113480.5 | 26.19 |
| roundtrip rt | 112601.0 | 25.98 |

speedup = 1.0078x，满足 M2 roundtrip 的 ±3% 门禁（无回退）。

## 5. 下一轮最有信息量的一个实验

M3 第一步：为 8x8 seed 实际出现的每条指令建语义 + N1 实测成本条目
（latency/throughput），并用静态 disassembly 分类与 PMU 动态计数校准；
然后开始第一个 layout/peephole 搜索假设。

## 产物索引

- `llvm-ir/`：Clang 提取的 seed IR
- `imported/machine-ir.json`、`pack-ir.json`
- `generated/sa8d/roundtrip_sa8d_8x8.cpp`
- 验证命令：`scripts/build-sa8d-roundtrip.sh`
- 性能命令：`scripts/build-sa8d-roundtrip-bench.sh`
