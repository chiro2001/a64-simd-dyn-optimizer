# M26-DCT8-Native-Build：原生 -mcpu=native 调度对 M22 五候选的影响

- run-id: `m26-dct8-native-build`
- state: `accepted`（测量敏感性已量化；性能结论不变，全部 <1）
- date: 2026-08-13（Asia/Shanghai）
- hosts: N1（g++ 13.3、neoverse-n1）、920B（g++ 12.3）

## 1. 假设

此前候选用交叉 `-O2 -march=armv8-a` 编译；M15 时代原生二进制与本轮交叉
二进制绝对 ticks 差约 24%。假设：在每台机器上用 `-O3 -mcpu=native` 重编
M22 五候选（并链接原生 `build/x265-8-gcc` 上游基线）后，某个候选可能
达到或超过上游（tier a +30% 的前置条件）。

## 2. 方法

固定 harness（M25）+ 原生编译（candidate 与上游同库）：

```sh
g++ -O3 -mcpu=native ... benchmarks/dct8_microbench.cpp \
    experiments/m22-dct8-structural-search/<tag>.cpp \
    build/x265-8-gcc/libx265.a -lnuma -lpthread -ldl
scripts/bench-paired.sh build/m26_mb_<tag> 30 3 <out>
```

## 3. 结果（paired latency，90 pairs，median neon/cand）

| 候选 | N1 交叉(M25) | N1 原生 | 920B 交叉(M25) | 920B 原生 |
| --- | ---: | ---: | ---: | ---: |
| widen | 0.8775 | 0.9597 | 0.9567 | 0.9863 |
| widen-shift64 | 0.8858 | 0.9595 | 0.9566 | 0.9942 |
| widen-wide_load | 0.8648 | 0.9441 | 0.9571 | 0.9902 |
| widen-tree_to_mla | 0.8685 | 0.8557 | 0.9507 | 0.9777 |
| widen-wide_load-tree_to_mla | 0.8535 | 0.8435 | 0.9530 | 0.9805 |

## 4. 结论

1. 原生 `-mcpu=native` 调度对 N1 的 widen 家族提升明显（0.878→0.960，
   ~+9%），对 920B 提升 2–4%；tree_to_mla 家族两机都没有获得同等提升；
2. 但**没有任何候选达到 1.0**，更不用说 1.30：编译调度敏感性不足以翻
   转 M15/M16/M22 的结论；上游 NEON DCT8 在这两台机器上确实接近其局部
   结构下界；
3. 对工具的意义：搜索排序前的编译阶段应按目标机 `-mcpu` 生成代码，但
   这只能修正 ~10% 量级的偏差，不能替代结构搜索。

## 5. 下一步

- tier a 的 +30% 需要新的 DCT 分解/结构，信息增益最高的输入仍是内部参考
  反汇编或指令直方图；
- b/c 档转向 SVE2 DCT8 静态设计与 N+2 准备（920B 无 SVE2，只能在
  qemu -cpu max 上做正确性验证）；
- round-0007 回复后写 decision.md 并按优先级执行。
