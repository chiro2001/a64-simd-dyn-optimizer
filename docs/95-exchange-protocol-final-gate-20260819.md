# 95. 内网↔外网数据交换协议 + 950 终验闭环（docs/87 步骤 8）

日期：2026-08-19（外网侧完成；950 复验见文末清单）

## 1. 三件交换载荷（schema `ago/exchange/*` v1）

载体：JSON。生成/校验/示例统一走 `python3 tools/exchange.py`。

| 载荷 | 方向 | 内容 | 文件 |
|---|---|---|---|
| `verdict.json`   | 内网→外网 | 终验结论：pairwise 排名、每 cover ns/call、md5/TBL/拦截/bench 门禁、有界包络 | `release/<machine>/verdict.json` |
| `bone-cost.json` | 内网→外网 | 指令代价表（指令类/延迟/8 路吞吐/VL128/VL256 比例），外网凭此重排全部 142 kernel | `data/exchange/examples/bone-cost.json` |
| `measure-request.json` | 外网→内网 | 主动测量清单：外网先算"哪个测量消除最多排名不确定度"，内网只跑点名项 | `data/exchange/outbox/measure-request.json` |

校验规则（`exchange.validate`，单测 5 项全绿）：

- verdict：`preset_used` 必须 `v1:<fp>:<kernel>=<ord>,...`；pairwise 标签只允许
  `{upstream,A,B,C,K,D,E,F}`（manifest 的 `upstream dispatch` 归一为 `upstream`）；
  `video_md5` 门禁必须有 `passed` + `clips`。
- bone-cost：每行必须有 op/class/latency/tput_8way/tput_vl128_ratio/tput_vl256_ratio，
  数值非负。
- measure-request：measure 只允许 `ns_per_call|replay_envelope|video_md5|bone_cost`，
  priority 为正整数。

示例与出站清单已生成：`data/exchange/examples/*`、`data/exchange/outbox/`。

## 2. 终验闭环 runner

`python3 tools/final_gate.py`（950/内网侧入口 `bash scripts/run-final-gate.sh`）：

```
输入: {release.so, preset-<target>.txt, manifest.json, 指定视频, x265 lib 目录, 目标机}
流程: 1) manifest sha256 公证 + preset 文法/白名单
     2) 拦截自检 + AGO_BENCH（对 release.so 本身）→ 每 cover ns/call arms
     3) 运行时分派门禁：AGO_PRESET applied 的 kernel 数 == chosen 数（防部分接受）
     4) 视频 md5 门禁：基线编码 vs LD_PRELOAD+AGO_PRESET 编码
     5) 写 release/<machine>/verdict.json（exchange schema）+ kernel-test-db 行
输出: verdict（passed/每门禁证据/errors）+ DB 行（bit_exact/ns_per_call/e2e_100f_pct）
退出码: 0 仅当 interception+video_md5+benchmark 全过且无 errors
```

实战产物：`release/qemu/verdict.json`（`tools/exchange.py --validate` 通过）。

## 3. qemu 代理的关键机制（LD_PRELOAD 失效的规避）

qemu 11 下 guest 动态加载器不处理 env 传入的 `LD_PRELOAD`（host ld 还会把 aarch64
.so 预载进 qemu 进程报错）。代理统一改为：

```
qemu-aarch64 <cpu> -L /usr/aarch64-linux-gnu \
  /usr/aarch64-linux-gnu/lib/ld-linux-aarch64.so.1 \
  --library-path /lib:<libdir> --preload <abs release.so> <程序> <args>
```

已实测：`--preload` 使 guest 加载 release.so 并完整执行
`dynopt_patch_primitives`（"patched 2 slots" + AGO_PRESET applied + bench arms）。
`tools/build_release.py` P4 与 `tools/final_gate.py` 均已切换到该路径（native
仍用 LD_PRELOAD，950/920B/710 不变）。

代理 md5 门禁默认不再注入：release.so 自带 interposer 即注入点，直接对
`build/x265-8-cross-sve2` 的干净共享构建预载即可获得真实单次 patch 语义；
`--inject-shared` 仅用于仿真 legacy 注入 lib 组合（幂等守卫验证场景）。

## 4. 样本实测结果（外网侧 qemu，dct16/dct32 release）

```
interception : PASS  patched_slots=2
preset_policy : PASS  applied 2/2 kernels（无 ignored）
benchmark     : PASS  8 臂（dct16 ord0-3: 2358/4635/7023/4455 ns；
                       dct32 ord0-3: 18409/59473/56986/58972 ns）
video_md5     : FAIL  base 60d7bdebd1 != release 1b13e4aedde1（即便 preset=上游 0/0）
verdict       : FAIL → 正确触发"不发布"信号
DB 闭环        : 写出 dct16/dct32 chosen 行（ns_per_call + bit_exact=yes）
```

根因已二分并修复（工作区内闭环，非 950 独有）：

```
基 线         干净 lib + no-op 预载        -> 60d7...（无 patch）
现代部署     干净 lib + release.so         -> 60d7...（interposer 单次 patch）
缺陷复现     legacy 注入 lib + release.so  -> 1b13...（hook 时机错误）
修复后       guarded 注入 lib + release.so -> 60d7...（与基线一致）
修复后       guarded 注入 lib + no-op      -> 60d7...（不受影响）
```

根因（disasm 证据）：legacy 注入 lib 的 hook 位于 x265_setup_primitives 内部
`setupAliasPrimitives` 之后——但该函数尾还有 `bEnableLowpassDCT` 分支可
`enableLowpassDCTPrimitives(primitives)`（重写 dct 槽）与 `x265_report_simd`
路径；setup 期间的 patch 先于这些表变更执行，槽位被后续写入覆盖/错位，
运行时落到非上游 cover，编码输出改变。multicover release.so 的正确定时是
整个 setup 返回后再 patch——由其自带的 x265_setup_primitives interposer 承担。

修复（两层，均已生效）：

- F1 注入点升级：`tools/build_preload_so.py` 与 `tools/tbl_md5.py` 的
  primitives.cpp hack 改为守卫式 hook——
  `if (!dlsym(RTLD_DEFAULT, "dynopt_preset_and_bench")) dynopt_patch_primitives();`
  ——存在 multicover 标记时 lib 完全退让给 interposer；legacy probe 时代
  （无该标记，docs/93 静态 CLI 链路）保持 setup 时调用不变。
- F2 纵深防御：multicover `dynopt_patch_primitives` 进程级幂等（`static int
  done`），任何残留双入口只 no-op，不再二次保存/重选。

代理门禁策略：`final_gate.py` 默认直接使用 x265 二进制目录（干净 lib）+
loader --preload；`--inject-shared` 保留为"legacy 注入组合"仿真，现同样全绿。
两种形态样本均 PASS：

```
interception PASS  patched_slots=2
preset_policy PASS  applied 2/2（含 partial-acceptance 硬门禁）
benchmark     PASS  8 臂量级稳定（dct16: ~2369/4754/7066/4364 ns；
                       dct32: ~18409/59473/56986/58972 ns）
video_md5     PASS  base == release == 60d7bdebd1（preset=上游 0/0）
verdict       PASS  exchange schema 校验通过；DB 行已闭环
```

950（及 920B/710）复验清单（收窄为对照确认）：

1. 同一 release.so + preset-950.txt，干净 x265 二进制 + LD_PRELOAD 跑 md5
   门禁 → 预期 base == release（与代理一致）；
2. 内网侧若沿用 legacy 注入 lib：用升级后的注入点重新生成（build_preload_so
   --inject / tbl_md5 guarded hook）或直接改用干净 lib；预期 md5 同样相等；
3. 任一测量维度出现差异即按 verdict 明细回传外网继续仲裁。

## 5. 已知问题与后续

- T1（已了）：clean lib + 自检直调路径曾出现 "AGO_PRESET applied (1 kernels)"
  ——hook 时序差异；多形态下 applied 2/2 且已纳入硬门禁（applied_kernels ==
  expected_kernels），防止部分接受静默通过。
- T2（已闭环）：代理 md5 差异 = legacy 注入 lib 的 hook 时机错误（setup
  中 patch 早于函数尾 lowpass/report 写入）；F1 守卫式 hook（multicover
  标记时退让 interposer）+ F2 幂等守卫双修复，现代/legacy 两种部署形态代理
  实测均与基线一致；见 §4。
- T3（已闭环）：`measure-request → verdict` 自动消费：
  `python3 tools/exchange.py --ingest-inbox data/exchange/inbox
  --registry release/qemu/manifest.json --outbox data/exchange/outbox`
  ——950 把 verdict/bone-cost 放进 inbox 后：校验 → kernel-test-db 写
  machine=950 行（ns_per_call/e2e_100f_pct/bit_exact/report 引用）→
  pairwise 合并 → measure-request 自动移除已裁决 kernel 的 ns_per_call
  项并重排优先级 → 归档 processed/。演练：inbox/verdict-950-final.json
  + bone-cost-950.json 已消费（2 行入库、request 净空、归档完成）。
- 真实 950 部署契约不变：`AGO_PRESET=$(cat preset-950.txt) LD_PRELOAD=release.so
  x265 ...`（docs/87 §5）；本 runner 的 `--native` 路径即该形态。

## 6. 关联

- docs/87 §4（主线 C 三件套落地）、§7.8 收口
- tools/exchange.py / tools/final_gate.py / scripts/run-final-gate.sh
- tools/test_exchange.py / tools/test_final_gate.py
- release/qemu/{manifest.json, preset-qemu.txt, report.json, verdict.json}
