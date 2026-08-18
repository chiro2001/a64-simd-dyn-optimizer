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
# Output buffers must be sized for (rows * stride * elem), not the
# logical block: x265 callers use padded strides and the kernels write
# full padded rows (undersizing corrupts .bss -> random crashes).
SPECS = {
    "dct16": {
        "buffers": [16 * 16 * 2 + 64, 16 * 64 * 2 + 64],
        "scalars": [64],
        "shape": "16x16 int16, stride 64 (out 16*64)",
    },
    "dct32": {
        "buffers": [32 * 32 * 2 + 64, 32 * 128 * 2 + 64],
        "scalars": [128],
        "shape": "32x32 int16, stride 128 (out 32*128)",
    },
    "satd-8": {
        "buffers": [8 * 8 + 64, 8 * 8 + 64],
        "scalars": [64, 64],
        "shape": "8x8 pixel, strides 64/64",
    },
}


def spec(kernel):
    return SPECS.get(kernel)
