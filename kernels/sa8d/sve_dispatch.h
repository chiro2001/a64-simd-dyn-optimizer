// Runtime SVE dispatch contract for generated SA8D candidates.
//
// Packed candidates (pack=2, raw, 16x16) require VL >= 256 bits because
// `svwhilelt_b16(0,16)` activates only 8 lanes at VL=128 and the upper-half
// sum silently becomes zero. Production dispatch must therefore gate them on
// the observed vector length, not on the ISA feature alone.
//
// register_candidates() re-evaluates `svcntb()` every call and marks each
// entry registered when the runtime VL (in bytes) is at least min_vl_bytes.
// call() is the only way to invoke a registered entry: it counts calls and
// aborts on an unregistered call so a contract violation cannot masquerade
// as a passed differential run.
#pragma once

#include <arm_sve.h>

#include <cstddef>
#include <cstdint>
#include <cstdlib>

namespace dynopt_sve {

struct Sa8dCandidate
{
    const char* name;
    int (*fn)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
    unsigned min_vl_bytes;  // runtime svcntb() must be >= this to register
    bool registered;
    std::size_t calls;
};

inline std::size_t register_candidates(Sa8dCandidate* cands, std::size_t n)
{
    const unsigned vl = (unsigned)svcntb();
    std::size_t nreg = 0;
    for (std::size_t i = 0; i < n; i++)
    {
        cands[i].registered = vl >= cands[i].min_vl_bytes;
        cands[i].calls = 0;
        if (cands[i].registered)
            nreg++;
    }
    return nreg;
}

inline int call(Sa8dCandidate& c, const uint8_t* a, intptr_t sa,
                const uint8_t* b, intptr_t sb)
{
    if (!c.registered)
    {
        std::abort();
    }
    c.calls++;
    return c.fn(a, sa, b, sb);
}

}  // namespace dynopt_sve
