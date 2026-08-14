"""SVE2 SAO stats BO (band offset), 64x1, VL=256 (docs/45).

BO accumulates stats/count[rec>>3] -- an inherent scatter pattern.
Upstream NEON already uses a scalar byte-addressed u64 trick, so there is
no meaningful SVE width advantage; this candidate mirrors that structure
and is recorded as a coverage item (no optimization space), like sad /
scale2D.
"""


def emit_64(func_name="dynopt_sao_stats_bo_64_sve2"):
    lines = [
        "#include <stdint.h>",
        "#include <stddef.h>",
        "",
        "extern \"C\" void %s(const int16_t* diff, const uint8_t* rec,"
        " intptr_t stride, int32_t* stats, int32_t* count)" % func_name,
        "{",
    ]
    lines.append("    uint64_t v;")
    for x in range(0, 64, 8):
        lines.append("    v = *(const uint64_t*)(const void*)(rec + %d);" % x)
        lines.append("    v >>= 1;")
        for i in range(8):
            sh = i * 8
            lines.append(
                "    *((int32_t*)((uint8_t*)stats + ((v >> %d) & 0x7c)))"
                " += diff[%d];" % (sh, x + i))
            lines.append(
                "    *((int32_t*)((uint8_t*)count + ((v >> %d) & 0x7c)))"
                " += 1;" % sh)
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_combo(combo):
    return emit_64()
