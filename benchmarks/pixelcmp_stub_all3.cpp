// Stubs for pixelcmp_microbench linking when only satd8 is measured.
#include <stdint.h>
extern "C" int dynopt_satd_16x16_sve2(const uint8_t* a, intptr_t s1,
                                      const uint8_t* b, intptr_t s2)
{ (void)a; (void)s1; (void)b; (void)s2; return 0; }
extern "C" int dynopt_sad_16x16_sve2(const uint8_t* a, intptr_t s1,
                                     const uint8_t* b, intptr_t s2)
{ (void)a; (void)s1; (void)b; (void)s2; return 0; }
extern "C" int dynopt_sa8d_16x16_sve2(const uint8_t* a, intptr_t s1,
                                      const uint8_t* b, intptr_t s2)
{ (void)a; (void)s1; (void)b; (void)s2; return 0; }
extern "C" int dynopt_satd_8x16_sve2(const uint8_t* a, intptr_t s1,
                                     const uint8_t* b, intptr_t s2)
{ (void)a; (void)s1; (void)b; (void)s2; return 0; }
extern "C" int dynopt_satd_16x8_sve2(const uint8_t* a, intptr_t s1,
                                     const uint8_t* b, intptr_t s2)
{ (void)a; (void)s1; (void)b; (void)s2; return 0; }
