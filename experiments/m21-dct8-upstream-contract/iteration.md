# M21-DCT8-Upstream-Contract：开源 DCT kernel 原样搬入测试框架，验证是否通过 x265 内部 test

- run-id: `m21-dct8-upstream-contract`
- state: `accepted`
- date: 2026-08-13（Asia/Shanghai）
- hosts: 本地 x86 交叉 + qemu-aarch64、N1（129.146.162.16）、鲲鹏 920B
  （124.70.206.229）
- 上游代码：pinned `third_party/x265 @ b81f650`（NEON 原样，未改动）

## 1. 回答的问题

用户输入：“开源版本的 kernel 和 C 参照可能不是完全对应的，这取决于它
能否通过 x265 内部的 test；把开源 kernel 直接搬到我们的测试框架里，看
能否测试通过。”

结论：**能通过**。dct4/8/16/32 四个上游 NEON kernel 按 x265 内部
transforms 测试的语义（`MBDstHarness::check_dct_primitive`：三种输入 case、
stride=width、C vs NEON 逐字节 memcmp）全部通过；而我们此前记录的
“dct8 与 C 参考 0.87% 分歧”只发生在内部测试几乎不采样的全范围均匀极端
输入上。

## 2. 方法

- 新增自包含验证器 `kernels/dct8/upstream_contract.cpp`，复刻 x265
  `MBDstHarness` 的输入生成与比较语义：
  - case0 = `(rand() & 255) - (rand() & 255)`（三角分布）、
    case1 = -255、case2 = +255；
  - 每次迭代 `index = rand() % 3`，stride = width，`memcmp` 输出；
- 构建脚本 `scripts/build-upstream-contract.sh`，链接未改动的
  `build/x265-8-cross-make/libx265.a`；
- 忠实度说明：上游 TestBench 有多个全局 harness 构造顺序与 `time(NULL)`
  seed，只影响 rand 流的偏移、不影响分布；本验证器精确复刻 MBDstHarness
  的分布与选择语义（详见源文件头注释）。

## 3. 证据（同二进制、三处执行结果一致）

### 3.1 x265 内部契约（通过）

| 场景 | 迭代数 | dct4 | dct8 | dct16 | dct32 |
| --- | ---: | ---: | ---: | ---: | ---: |
| 单次契约（seed=7） | 128 | 0/128 | 0/128 | 0/128 | 0/128 |
| 200 个独立 seed 扫描（qemu） | 128×200 | 0 | 0 | 0 | 0 |
| 契约压力（seed=12345）qemu/N1/920B | 200000 | 0 | 0 | 0 | 0 |

全部 `PASS`，exit 0。

### 3.2 全范围 uniform 诊断（比 x265 内部 test 更严）

`--uniform`：输入在整个 [-255,255] 均匀随机、stride 在 {8,16,17,32} 随机
（`kernels/dct8/dct8_verify.cpp` 同款探针），200000 例，qemu/N1/920B 三处
输出完全一致：

| kernel | 与 C 参考分歧 | 率 |
| --- | ---: | ---: |
| dct4_neon | 0 | 0 |
| dct8_neon | 1736 | **0.868%** |
| dct16_neon | 9 | **0.0045%** |
| dct32_neon | 0 | 0 |

dct8 的 0.868% 复现 M12/M14 已知的 pass2 `vsub_s16` 回绕；dct16 的 9 例为
本轮新发现（未做最小化，仅记录）。

## 4. 结论与后续

1. 开源 DCT NEON kernel 通过 x265 内部 test 是确定的，内部 test 未采样的
   全范围输入上仍与 C 参考存在分歧（dct8 0.868%、dct16 0.0045%）；
2. 本项目当前的 C-exact 门禁是 x265 内部 test 的**严格超集**：通过
   C-exact 的候选必然通过 x265 内部 test（M14 widened 候选实测通过），
   不建议为了小幅优化自由度放宽到“仅过内部 test”，除非用户明确要求；
3. 本轮不改变优化门禁，仅把“开源 kernel 原样可通过 x265 内部 test”作为
   已验证事实记录。
