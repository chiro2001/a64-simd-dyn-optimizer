# Round 0006 context（3 个实际优化迭代：P1' dispatch、M11 920B、M12 DCT8）

## 本批 run-id 与关键文件

- `experiments/m11-sve-920b/iteration.md`、`manifest.yaml`、
  `correctness/`、`static/`、`benchmark/pmu/`（920B SVE256 闭环，负性能
  结果全量归档）
- `experiments/m12-dct8/iteration.md`、`manifest.yaml`、
  `evidence/dct8-differential-920b.log`（DCT8 上游分歧发现）
- `candidates/identity.yaml`（SA8D 候选冻结身份）
- `kernels/sa8d/sve_dispatch.h`、`kernels/sa8d/sve_verify.cpp`、
  `kernels/sa8d/sve_vl_thread_test.cpp`（VL dispatch 与线程继承）
- `kernels/dct8/dct8_verify.cpp`、`benchmarks/dct8_microbench.cpp`
- `tools/check_isa_level.py`（官方 ARM ISA catalog 门控）
- `scripts/run-pmu-sa8d-paired.sh`（paired cycles，无 PMU 回退 CNTVCT）
- `docs/09-instruction-fusion-analysis.md`（需求 v0.4 与 P0'~P7'）
- `docs/06-agent-iteration-protocol.md`（咨询频率：每 3 阶段一次）

## 关键事实摘要

- 三档目标：a NEON→NEON N1 +30%；b NEON/SVE128→SVE256 N+2 +130%；
  c SVE256→SVE256 N+2 +130%。920B 中间保留门 >1.10（对同机 NEON）。
- 920B：openEuler 24.03、SVE1、VL=256（svcntb=32）、2 vCPU、**无硬件
  PMU**（root 也没有；cycles 用 CNTVCT_EL0）。SA8D paired：8x8 latency
  0.897/tp 0.932，16x16 latency 0.886/tp 0.681，均 REJECT。ISA 静态门禁
  4/4 PASS；native 差分 1M×4 全 0；ASan/UBSan 过；guard 8/8。
- `PR_SVE_SET_VL` 实测：本机内核与 qemu-user 都按**字节**解释参数（手册
  写 bit）；新线程继承调用者 VL。
- DCT8 基线：N1 上游 NEON 比 C 慢 19%（speedup 0.807，cntvct，latency）；
  920B 慢 4%（0.961）。上游 NEON 与 C 参考分歧率 172/20000（0.86%），
  stride 无关、机器无关（N1/920B/本地 qemu 一致），oracle==dct8_c 精确；
  上游 TestBench transforms harness 通过。
- 用户输入：内部鲲鹏 DCT 实现比开源快 30–60%，DCT 是当前最高价值算子。

## 命令形状（已核对 codex-cli 0.147.0）

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s read-only \
  -C "$PWD" \
  exec -o expert-advice/round-0006/response.md - < expert-advice/round-0006/prompt.md
```

只读后台异步执行；主流程继续。响应落盘后写 decision.md；失败只记
blocked.md，不伪造。
