
## 1. 优先级与门禁

**事实：**dct16 双组版已有 0 NEON、51.2k 跨 VQ 零失配及六 seed 门禁；dct32 未完成。950 严格 op bundle 的 30f E2E 为 **+0.79%**，但单 kernel 仍慢于 NEON。纯 SVE VL128 在 710 为 **-2.63%**；ranker 仅 3 组，acc/tau=0.778/0.556。

**排序：**`dct32＋同宽/950 实测` > `随测量补 ranker 标签` > `satd/sa8d 16-lane` > `interp8 16-lane` > `纯 SVE VL128 调优`。新家族须先有 950 热点；后两项不宜开放式调参。

信息增益最高的三步：

1. **闭环 dct32：**要求 0 NEON、VL=256 guard、≥20k 跨 VQ 零失配、TestBenchLite 多 seed；登记对象的 uop、`tbl/tbl2`、spill、尺寸。op4032 仅作非 bit-exact 性能上界，不能作正确性基准。
2. **dct16 先做布局 A/B，再将 dct16/32 上 950：**双组版、严格 op、NEON 三方随机交错 direct-call。相对最快严格基线的 kernel ratio 95%CI 下界大于 1 才晋级；同时采 MCA 与实机标签补 ranker。
3. **只让胜者跑 950 30f/100f：**要求同机 md5、两段同向、100f CI 不跨零，且相对现有严格 bundle 有正增量；否则暂停新家族升宽。ranker 至少有 8 个独立组、30 个可分辨对后再做 family 留出，门仍为 acc≥0.80、tau≥0.70、top-1 regret≤2%。

## 2. `tbl2` 与布局

**推断：**pair-of-rows 布局使 `combine_g0/quad_pack` 跨组；但行主序输入、四行 dot 和连续输出间本就需转置，换布局常只是把代价移到 load、额外 dot 或回存。可尽早形成 quad-form 并跨多个 k 保持，以 `splice/zip/trn/uzp` 减少通用 `tbl2`。950 的“2×256”不代表 shuffle 吞吐充足。

**最小证伪：**只改 dct16，A=现布局，B=同算术、结构化置换并保持 quad-form；过同一门后在 950 交错测 direct-call。若 B 周期 CI 显著优于 A，且按调用占比投影 E2E≥0.1pp，即否定当前打包；若落在预注册 MDE 内且无 spill/前端恶化，则保留 A 并迁移至 dct32。

## 3. 正确性策略

更便宜的是 **pass 边界规范化 trace**：在 pass1、pack、pass2 后按 `(pass,k,row)` 导出值，跨进程比较 vq1 fused8、vq2 双组和定宽标量规格。再加入全零、逐位置冲激、极值、交错符号及舍入阈值输入；约 1.3k 块更易定位错误。它是调试门，最终仍保留 TestBenchLite，以防共享 DAG 的共因错误。

更强的是利用 `lane_in/n_out` 做 **组合式翻译验证**：逐原语以 SMT bit-vector 证明“解包 16-lane 结果等于两个 8-lane 结果”，覆盖加宽、wrap、舍入移位、窄化、排列和内存足迹，再沿无环 def-use 归纳。上游 C 仅作独立最终 oracle，并先固定整数宽度、排除 UB。

## 4. 下一条可证明声明

证明：在 `svcntb()==32` 及契约给定的 alias/有效地址前提下，dct16/32 双组 lowering 逐语句精化两个独立 fused8 DAG，且 store 的逻辑输出与内存足迹相同。局部 SMT 证书加 DAG 归纳即可复用到 satd/sa8d。

**不先声明 VL 无关：**现实现有 VL guard，zip/uzp 分组也随 VL 改变；最多另证“非 256 时安全回退”。ranker 只有经验统计量，尚无有意义的 regret 界。
