// Minimal stubs for x265 SVE symbols that are absent from NEON-only
// libx265 builds. Only used to link microbenches that reference the SVE
// baseline for verification; timing uses NEON/candidate paths.
#include <cstdint>

namespace x265 {
void dct8_sve(const int16_t*, int16_t*, intptr_t) {}
void dct16_sve(const int16_t*, int16_t*, intptr_t) {}
void dct32_sve(const int16_t*, int16_t*, intptr_t) {}
}
