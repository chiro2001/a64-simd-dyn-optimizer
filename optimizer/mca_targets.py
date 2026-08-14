"""MCA target profiles for the project's two Kunpeng models.

2026-08-14 (用户口径): 
  920B = SVE 2x256 / NEON 4x128 (VL=256)
  NP1  = SVE 4x256 / NEON 4x128 (VL=256, 960)

latency 参数参考 LLVM Neoverse-V2 调度模型
(llvm/lib/Target/AArch64/AArch64SchedNeoverseV2.td, main):
  ADD/SUB ZZZ        2c 1V
  MUL ZZZ BHS        4c V02
  SDOT HtoD          4c V02 (read advance 3)
  TBL/TBX/UZP/ZIP/TRN/REV  2c 1V
  MOVPRFX            2c 1V
  LD1 (SVE)          6c 1L
  ST1H               2c 1L01+1V01
  RSHRN (ASIMD)      4c V13   (SVE2 rshrnb 代理)
  SMULL (ASIMD)      3c V02   (SVE smull 代理)

throughput 权重（用户 2026-08-14 口径）：实测 920B 数据可靠性不足，
直接按目标管道结构计算——920B 全部按 SVE 2×256（2 条管道 →
0.5 cyc/op/类），NP1 按 SVE 4×256（4 条管道 → 0.25 cyc/op/类）；
NEON 4×128 的 0.25 只在本项目没有 NEON 主路径时备用。load/store 也
按 SVE 管道计（全部都是 SVE pipe）。movprfx 视为与下一条融合
（docs/09）。
"""


NV2_LATENCY = {
    "dot": 4,       # SDOT HtoD (V02)
    "mul": 4,       # MUL ZZZ BHS (V02)
    "add": 2,       # ADD/SUB ZZZ (1V)
    "permute": 2,   # TBL/UZP/ZIP/TRN/REV (1V)
    "narrow": 4,    # ASIMD RSHRN 代理 (V13)
    "load": 6,      # SVE LD1 (1L)
    "store": 2,     # SVE ST1H (1L01+1V01)
    "shift": 2,     # SVE shift (V13)
    "movprfx": 2,   # fused with next (docs/09)
    "scalar": 1,
}


TARGETS = {
    "920B": {
        "name": "920B",
        "sve_pipes": 2,
        "sve_vl_bits": 256,
        "neon_pipes": 4,
        "neon_vl_bits": 128,
        "vl_bytes": 32,
        "issue_rate": 4.0,
        "latency": dict(NV2_LATENCY),
        # 全部按 SVE 2x256：2 条管道 -> 0.5 cyc/op（不再用 920B 实测）
        "throughput": {
            "dot": 0.5, "mul": 0.5, "add": 0.5, "permute": 0.5,
            "narrow": 0.5, "load": 0.5, "store": 0.5, "shift": 0.5,
            "scalar": 1.0,
        },
        "llvm_proxy_cpu": "neoverse-v2",
        "llvm_proxy_mattr": "+sve2",
    },
    "NP1": {
        "name": "NP1",
        "sve_pipes": 4,
        "sve_vl_bits": 256,
        "neon_pipes": 4,
        "neon_vl_bits": 128,
        "vl_bytes": 32,
        "issue_rate": 6.4,
        "latency": dict(NV2_LATENCY),
        # SVE 4x256：4 条管道 -> 0.25 cyc/op
        "throughput": {
            "dot": 0.25, "mul": 0.25, "add": 0.25, "permute": 0.25,
            "narrow": 0.25, "load": 0.25, "store": 0.25, "shift": 0.25,
            "scalar": 1.0,
        },
        "llvm_proxy_cpu": "neoverse-v2",
        "llvm_proxy_mattr": "+sve2",
    },
    # 950 (920G) first-round fit from real paired ratios (docs/34 §2.4,
    # tools/calibrate_mca_950.py): NV2 latency base x fitted factors
    # compute 3.16 / permute 0.316 / mem 3.16. WARNING: dct8 residual
    # remains large (model direction flip); vpp residuals ~13-23%.
    # Use only as a rough SVE-vs-NEON balance proxy for 950-like silicon.
    "950": {
        "name": "950",
        "sve_pipes": 2,
        "sve_vl_bits": 256,
        "neon_pipes": 4,
        "neon_vl_bits": 128,
        "vl_bytes": 32,
        "issue_rate": 4.0,
        "latency": {
            "dot": 12.648, "mul": 12.648, "add": 6.324,
            "permute": 0.632, "narrow": 12.648, "load": 18.972,
            "store": 6.324, "shift": 6.324, "movprfx": 2.0,
            "scalar": 1.0,
        },
        "throughput": {
            "dot": 12.648, "mul": 12.648, "add": 6.324,
            "permute": 0.632, "narrow": 12.648, "load": 18.972,
            "store": 6.324, "shift": 6.324, "scalar": 1.0,
        },
        "llvm_proxy_cpu": "neoverse-v2",
        "llvm_proxy_mattr": "+sve2",
    },
}


def target(name):
    try:
        return TARGETS[name]
    except KeyError:
        raise KeyError("unknown mca target %r (have %s)"
                       % (name, sorted(TARGETS)))
