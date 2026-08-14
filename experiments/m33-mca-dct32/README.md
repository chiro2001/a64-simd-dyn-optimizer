# DCT32 三方 LLVM-MCA 预估（2026-08-14）

口径：QEMU（VL=256）抓取完整动态指令流（`-one-insn-per-tb -d exec,in_asm`
`-dfilter` 符号范围），去掉分支/ret 后整段喂 `llvm-mca`：

```sh
llvm-mca -mtriple=aarch64 -mcpu=neoverse-v2 -mattr=+sve2 -iterations=1 \
  -skip-unsupported-instructions=parse-failure <kernel>.mca.s
```

## 结果

| kernel | 动态指令总数 | 其中向量 | MCA 预估 cycles | MCA uops |
| --- | ---: | ---: | ---: | ---: |
| 上游 `x265::dct32_sve` | 13362 | 12710 | **2608** | 15009 |
| 内部 `dct32_sve256` | 5381 | 4731 | **1048** | 5800 |
| 本项目 4002 | 5619 | 4466 | **1109** | 5893 |

相对上游：内部 0.402×、4002 0.425×；4002/内部 = 1.058×。

## 复现

- 动态流：`qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2
  -one-insn-per-tb -d exec,in_asm -dfilter <start>..<end> -D <log> <driver>`，
  再 `tools/parse_qemu_trace.py <log> <start> <end> --exec --json`；
- 输入 mca.s：本目录三个文件（已去分支），由动态 JSON 生成；
- 注意：MCA 不建模 cache/内存延迟与分支开销；Neoverse-V2 调度模型对
  SVE 的建模是近似值；结论以实机 paired 为准。

## 备注

- 静态体口径（只跑一次循环体）不可比：上游基本全展开，内部有 6 个
  循环、4002 有 2 个 g 循环；本报告统一用“完整动态执行流”。
- 内部算子用 scatter store（st1d 向量偏移），MCA 按其 uop 建模，
  未额外加 sg 惩罚（若按用户口径 +3 uops/st1d 会更差）。
- 本目录 mca.s 已按内核保存，可复跑。

## hip09（920B）/ hip12（920C/G）的 MCA 可行性（2026-08-14）

LLVM 有 `-mcpu=tsv110`（HiSilicon TS-V110，鲲鹏 920 核心），但实测
**tsv110 调度模型基本没有 SVE 指令条目**：

| kernel | 输入指令 | tsv110 跳过（lack-sched） | 跳过占比 |
| --- | ---: | ---: | ---: |
| upstream | 13281 | 5496 | 41% |
| cand4002 | 5610 | 4491 | 80% |

被跳过的指令不消耗周期，结果（upstream 5810 cyc / cand4002 419 cyc）
无意义；内部算子还因 `adr #0x...` 绝对偏移无法被 llvm-mc 编码。
结论：**tsv110 不能用于 SVE 的 MCA 预估**；LLVM 没有鲲鹏 920 的
SVE 管线模型。可行的替代：

1. 用 neoverse-v1/v2（LLVM 覆盖最全的 SVE 模型）作近似——本报告
   已用 v2；
2. hip09（920B）有实机：可对 **SVE1 可运行**的内核（上游
   dct32_sve、best_sve1）做真实 cycle 测量（CNTVCT paired），
   比 MCA 可信；
3. 4002/内部是 SVE2，920B 跑不了；若 hip12（920C/G，SVE2）可提供
   访问，可直接实机测 4002 与内部算子，这比任何静态模型都准。

## 920B（hip09）实机配对：上游 SVE1 vs best_sve1（2026-08-14）

环境：920B（SVE1/VL=256，CNTVCT，无 PMU），微基准
`dct32_microbench`（仅 sve/cand），上游对象取自本地
`build/x265-8-clang-sve`（`dct-prim-sve.cpp.o`），候选
`best_sve1.o`；配对 150 对（30×5），`taskset -c 0`，随机 A/B。
原始数据见 `paired-920b/{latency,throughput}/paired-raw.csv`。

| mode | sve/cand median | geomean | bootstrap95 |
| --- | ---: | ---: | ---: |
| latency | 0.8625 | 0.8757 | [0.8533, 0.8805] |
| throughput | 0.8509 | 0.8706 | [0.8444, 0.8756] |

ratio = sve/cand，<1 表示上游更快：**best_sve1 在 920B 上比上游
SVE1 慢约 16%（latency）/ 17.5%（throughput）**——该 SVE1 变体
是早期 v2 量级实现，未含本轮 SVE2 优化（SVE2 指令 920B 不可跑）。
验证：`verify sve/cand 2000` 均 0 mismatch。
