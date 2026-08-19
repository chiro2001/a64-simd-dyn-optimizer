"""Per-kernel benchmark driver specs (docs/87 step 3).

The multicover runtime generates one bench function per kernel.  These
specs make the skeleton shape-aware: real buffer sizes for each pointer
parameter and realistic scalar call values, instead of the generic
zero-buffer fallback from step 2.

Kernels without a spec fall back to the generic driver (4096-byte
zeroed buffers + scalar 64); they are still benchable but are labelled
"generic" in reports.
"""

# key: registry kernel name (docs/88); values:
#   buffers   : bytes allocated for each pointer param (index order)
#   scalars   : call-time values for each non-pointer param (index order)
#   shape     : human-readable description
# Gate metadata used by build_release.py P2 (coarse screening):
#   ret       : C return type
#   params    : C parameter list (same order as buffers/scalars)
#   upstream  : x265 primitive slot expression producing the upstream fn
#   compare   : "bytes" (compare dst buffer) or "return" (compare int)
# Output buffers must be sized for (rows * stride * elem), not the
# logical block: x265 callers use padded strides and the kernels write
# full padded rows (undersizing corrupts .bss -> random crashes).
SPECS = {
    "dct16": {
        "buffers": [16 * 16 * 2 + 64, 16 * 64 * 2 + 64],
        "scalars": [64],
        "call_scalars": [16],
        "shape": "16x16 int16, stride 64 (out 16*64)",
        "ret": "void",
        "params": "const int16_t* a0, int16_t* a1, intptr_t a2",
        "upstream": "P->cu[BLOCK_16x16].dct",
        "compare": "bytes",
        "compare_bytes": 16 * 16 * 2,
    },
    "dct32": {
        "buffers": [32 * 32 * 2 + 64, 32 * 128 * 2 + 64],
        "scalars": [128],
        "call_scalars": [32],
        "shape": "32x32 int16, stride 128 (out 32*128)",
        "ret": "void",
        "params": "const int16_t* a0, int16_t* a1, intptr_t a2",
        "upstream": "P->cu[BLOCK_32x32].dct",
        "compare": "bytes",
        "compare_bytes": 32 * 32 * 2,
    },
    "interp8-32": {
        # x265::interp_horiz_pp_neon<8,32,32> -> pu[LUMA_32x32].luma_hpp
        # (filter_pp_t: (const pixel*, intptr_t, pixel*, intptr_t, int)).
        "buffers": [ (32 + 8) * 64, 32 * 64 + 64 ],
        "scalars": [64, 64, 2],
        "shape": "interp8 hpp 32x32, strides 64/64, coeffIdx 2 (luma_hpp xFrac&3 domain)",
        "ret": "void",
        "params": ("const uint8_t* a0, intptr_t a1, uint8_t* a2,"
                   " intptr_t a3, int a4"),
        "upstream": "P->pu[LUMA_32x32].luma_hpp",
        "compare": "bytes",
        "compare_bytes": 32 * 32,
    },
    "sao": {
        # processSaoCUE0 (edge offset class 0, width 64, two rows):
        # saoCuOrgE0_t = (uint8_t*, int8_t*, int, int8_t*, intptr_t).
        # Candidates hardcode width==64 -> adapter call profile:
        #   cand_sig: (uint8_t*, int8_t*, int8_t*, intptr_t)
        #   width is implicit (64) when adapter dispatches.
        "buffers": [2 * 128 + 64, 64, 128 + 64],
        "scalars": [64, 128],
        "fills": ["bytes", "int8x", "sign8"],
        "shape": "sao E0 2x64 rows, stride 128",
        "ret": "void",
        "params": ("uint8_t* a0, int8_t* a1, int a2, int8_t* a3,"
                   " intptr_t a4"),
        "cand_params": ("uint8_t* a0, int8_t* a1, int8_t* a2,"
                        " intptr_t a3"),
        "adapter": True,
        "inplace": True,
        "out_buf": 0,
        "upstream": "P->saoCuOrgE0",
        "compare": "bytes",
        "compare_bytes": 2 * 64,
    },
    "satd-8": {
        "buffers": [8 * 8 + 64, 8 * 8 + 64],
        "scalars": [64, 64],
        "shape": "8x8 pixel, strides 64/64",
        "ret": "int",
        "params": "const uint8_t* a0, intptr_t a1, const uint8_t* a2, intptr_t a3",
        "upstream": "P->pu[LUMA_8x8].satd",
        "compare": "return",
    },
}


def spec(kernel):
    return SPECS.get(kernel)
