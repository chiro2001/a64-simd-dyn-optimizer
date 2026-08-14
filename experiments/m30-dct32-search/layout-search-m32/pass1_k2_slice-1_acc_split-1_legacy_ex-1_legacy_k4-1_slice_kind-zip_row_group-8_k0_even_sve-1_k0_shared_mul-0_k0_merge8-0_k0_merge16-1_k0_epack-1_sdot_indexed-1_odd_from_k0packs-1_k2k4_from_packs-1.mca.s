.arch armv8.2-a+sve2
.text
sub sp, sp, #0x810
mov x15, x1
add x1, sp, #0x10
stp x29, x30, [sp]
mov x29, sp
addvl sp, sp, #0xfffffffffffffffa
adrp x3, #0x456000
ptrue p7.b
add x3, x3, #0x5b0
sub sp, sp, #0x40
add x5, x3, #0x20
ld1w {z31.s}, p7/z, [x5]
add x7, x0, x2, lsl #2
addvl x5, sp, #1
add x6, x7, x2, lsl #2
add x5, x5, #0x40
stp d8, d9, [sp]
add x8, x6, x2, lsl #2
stp d10, d11, [sp, #0x10]
add x14, x1, #0x40
add x13, x0, x2, lsl #1
stp d12, d13, [sp, #0x20]
add x12, x7, x2, lsl #1
add x11, x6, x2, lsl #1
stp d14, d15, [sp, #0x30]
add x10, x8, x2, lsl #1
str z31, [x5]
add x5, x3, #0x40
ld1w {z31.s}, p7/z, [x5]
addvl x5, sp, #2
add x9, x3, #0x80
add x5, x5, #0x40
str z31, [x5]
mov x4, #0
add x5, x3, #0x60
ld1w {z31.s}, p7/z, [x5]
addvl x5, sp, #3
add x5, x5, #0x40
str z31, [x5]
add x5, x3, #0x180
ld1h {z14.h}, p7/z, [x5]
add x5, x3, #0x280
ld1h {z15.h}, p7/z, [x5]
mov z5.d, z15.d
add x5, x3, #0x380
ld1h {z0.h}, p7/z, [x5]
mov z7.d, z0.d
add x5, x3, #0xa0
ld1h {z1.h}, p7/z, [x5]
mov z0.d, z14.d
add x5, x3, #0x1a0
ld1h {z2.h}, p7/z, [x5]
add x5, x3, #0x2a0
ld1h {z3.h}, p7/z, [x5]
add x5, x3, #0x3a0
ld1h {z4.h}, p7/z, [x5]
add x5, x3, #0x100
ld1h {z8.h}, p7/z, [x5]
add x5, x0, x4
ld1h {z24.h}, p7/z, [x5]
ptrue p6.d
add x5, x5, #0x20
ld1h {z31.h}, p7/z, [x5]
rev z31.h, z31.h
add x5, x13, x4
sub z27.h, z24.h, z31.h
add z24.h, z24.h, z31.h
ld1h {z31.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z30.h}, p7/z, [x5]
add x5, x7, x4
rev z30.h, z30.h
ld1h {z29.h}, p7/z, [x5]
add x5, x5, #0x20
sub z15.h, z31.h, z30.h
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x12, x4
rev z30.h, z30.h
ld1h {z25.h}, p7/z, [x5]
add x5, x5, #0x20
sub z6.h, z29.h, z30.h
add z29.h, z29.h, z30.h
ld1h {z30.h}, p7/z, [x5]
addvl x5, sp, #4
add x5, x5, #0x40
rev z30.h, z30.h
sub z20.h, z25.h, z30.h
str z20, [x5]
add x5, x6, x4
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z26.h}, p7/z, [x5]
add x5, x11, x4
rev z26.h, z26.h
sub z28.h, z30.h, z26.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z23.h}, p7/z, [x5]
add x5, x8, x4
rev z23.h, z23.h
ld1h {z22.h}, p7/z, [x5]
add x5, x5, #0x20
sub z16.h, z26.h, z23.h
add z26.h, z26.h, z23.h
ld1h {z23.h}, p7/z, [x5]
add x5, x10, x4
rev z23.h, z23.h
ld1h {z19.h}, p7/z, [x5]
zip1 z17.d, z24.d, z29.d
sub z9.h, z22.h, z23.h
zip2 z29.d, z24.d, z29.d
add x5, x5, #0x20
zip1 z24.d, z31.d, z25.d
add z22.h, z22.h, z23.h
zip2 z31.d, z31.d, z25.d
ld1h {z23.h}, p7/z, [x5]
zip1 z13.d, z17.d, z24.d
rev z23.h, z23.h
zip2 z17.d, z17.d, z24.d
sub z10.h, z19.h, z23.h
zip1 z21.d, z29.d, z31.d
add z19.h, z19.h, z23.h
revh z21.d, p6/m, z21.d
zip2 z29.d, z29.d, z31.d
revh z29.d, p6/m, z29.d
saddlb z25.s, z13.h, z29.h
saddlt z20.s, z13.h, z29.h
saddlb z23.s, z17.h, z21.h
saddlt z24.s, z17.h, z21.h
revw z23.d, p6/m, z23.d
revw z24.d, p6/m, z24.d
zip1 z31.s, z24.s, z23.s
zip2 z24.s, z24.s, z23.s
zip1 z18.s, z25.s, z20.s
zip2 z25.s, z25.s, z20.s
add z31.s, z18.s, z31.s
add z25.s, z25.s, z24.s
uzp2 z24.d, z31.d, z25.d
revw z24.d, p6/m, z24.d
ptrue p5.s
uzp1 z31.d, z31.d, z25.d
ld1w {z20.s}, p7/z, [x3]
add z25.s, z24.s, z31.s
sub z31.s, z31.s, z24.s
movprfx z23, z25
mul z23.s, p7/m, z23.s, z20.s
addp z23.s, p5/m, z23.s, z23.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z24, [x5]
mul z24.s, p7/m, z24.s, z31.s
addp z24.s, p5/m, z24.s, z24.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z18, [x5]
mul z25.s, p7/m, z25.s, z18.s
addp z25.s, p5/m, z25.s, z25.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z14, [x5]
mul z31.s, p7/m, z31.s, z14.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z18.d, z30.d, z22.d
addvl x5, sp, #5
zip2 z30.d, z30.d, z22.d
zip1 z22.d, z26.d, z19.d
add x5, x5, #0x40
zip1 z14.d, z18.d, z22.d
zip2 z26.d, z26.d, z19.d
zip2 z18.d, z18.d, z22.d
zip1 z22.d, z30.d, z26.d
str z31, [x5]
revh z22.d, p6/m, z22.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
saddlb z12.s, z14.h, z30.h
saddlt z26.s, z14.h, z30.h
saddlb z11.s, z18.h, z22.h
saddlt z19.s, z18.h, z22.h
revw z11.d, p6/m, z11.d
revw z19.d, p6/m, z19.d
zip1 z31.s, z19.s, z11.s
add x5, sp, #0x40
str z26, [x5]
zip1 z26.s, z12.s, z26.s
add z26.s, z26.s, z31.s
ldr z31, [x5]
zip2 z12.s, z12.s, z31.s
zip2 z19.s, z19.s, z11.s
add z19.s, z12.s, z19.s
uzp2 z12.d, z26.d, z19.d
revw z12.d, p6/m, z12.d
uzp1 z26.d, z26.d, z19.d
add z19.s, z12.s, z26.s
sub z26.s, z26.s, z12.s
mul z20.s, p7/m, z20.s, z19.s
addp z20.s, p5/m, z20.s, z20.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z12, [x5]
mul z12.s, p7/m, z12.s, z26.s
addp z12.s, p5/m, z12.s, z12.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z11, [x5]
mul z19.s, p7/m, z19.s, z11.s
addp z19.s, p5/m, z19.s, z19.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z11, [x5]
mul z26.s, p7/m, z26.s, z11.s
addp z26.s, p5/m, z26.s, z26.s
addvl x5, sp, #5
uzp1 z23.s, z23.s, z20.s
uzp1 z25.s, z25.s, z19.s
add x5, x5, #0x40
ldr z31, [x5]
uzp1 z31.s, z31.s, z26.s
addvl x5, sp, #4
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
add x5, x5, #0x40
ldr z20, [x5]
rshrnb z23.h, z23.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z23.h, z23.h, z23.h
uzp1 z25.h, z25.h, z25.h
str q31, [x1, #0x600]
trn2 z31.d, z15.d, z20.d
zip1 z26.d, z15.d, z20.d
zip1 z19.d, z16.d, z10.d
trn1 z15.d, z15.d, z20.d
uzp1 z24.s, z24.s, z12.s
rshrnb z24.h, z24.s, #4
uzp1 z24.h, z24.h, z24.h
str q23, [x1]
add x5, x3, #0xc0
zip1 z20.d, z28.d, z9.d
zip1 z20.d, z20.d, z19.d
str q25, [x1, #0x400]
trn2 z25.d, z27.d, z6.d
zip1 z23.d, z25.d, z31.d
zip2 z25.d, z25.d, z31.d
trn2 z31.d, z16.d, z10.d
trn1 z16.d, z16.d, z10.d
str q24, [x1, #0x200]
zip1 z24.d, z27.d, z6.d
trn1 z27.d, z27.d, z6.d
zip1 z24.d, z24.d, z26.d
zip2 z27.d, z27.d, z15.d
trn2 z26.d, z28.d, z9.d
ld1h {z15.h}, p7/z, [x9]
zip1 z19.d, z26.d, z31.d
trn1 z28.d, z28.d, z9.d
zip2 z26.d, z26.d, z31.d
zip2 z28.d, z28.d, z16.d
movi d31, #0000000000000000
movprfx z16, z31
sdot z16.d, z23.h, z0.h[0]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[0]
sdot z16.d, z24.h, z15.h[0]
sdot z12.d, z20.h, z15.h[0]
sdot z16.d, z27.h, z5.h[0]
sdot z12.d, z28.h, z5.h[0]
sdot z16.d, z25.h, z7.h[0]
sdot z12.d, z26.h, z7.h[0]
uzp1 z16.s, z16.s, z12.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[1]
add x5, x3, #0x1c0
sdot z12.d, z20.h, z15.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z23.h, z0.h[1]
sdot z16.d, z24.h, z15.h[1]
movprfx z15, z12
sdot z15.d, z28.h, z5.h[1]
sdot z16.d, z27.h, z5.h[1]
sdot z15.d, z26.h, z7.h[1]
sdot z16.d, z25.h, z7.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z10.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[0]
add x5, x3, #0x2c0
sdot z15.d, z20.h, z1.h[0]
sdot z15.d, z28.h, z3.h[0]
sdot z15.d, z26.h, z4.h[0]
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[0]
sdot z16.d, z24.h, z1.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z25.h, z4.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z12.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[1]
add x5, x3, #0x3c0
sdot z15.d, z20.h, z1.h[1]
sdot z15.d, z28.h, z3.h[1]
sdot z15.d, z26.h, z4.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[1]
sdot z16.d, z24.h, z1.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z25.h, z4.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0xe0
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x1e0
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x2e0
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x3e0
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x200
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x300
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x400
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z10, z31
sdot z10.d, z19.h, z11.h[0]
add x5, x3, #0x120
sdot z10.d, z20.h, z8.h[0]
sdot z10.d, z28.h, z12.h[0]
sdot z10.d, z26.h, z15.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[0]
sdot z16.d, z24.h, z8.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z10.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z10, z31
sdot z10.d, z19.h, z11.h[1]
sdot z10.d, z20.h, z8.h[1]
sdot z10.d, z28.h, z12.h[1]
sdot z10.d, z26.h, z15.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x220
sdot z16.d, z24.h, z8.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z10.s
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x320
rshrnb z16.h, z16.s, #4
ld1h {z12.h}, p7/z, [x5]
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x420
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
ld1h {z15.h}, p7/z, [x5]
sdot z9.d, z20.h, z11.h[0]
add x5, x3, #0x140
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x4c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x240
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x340
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x440
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x160
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
sdot z9.d, z28.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x260
sdot z16.d, z24.h, z11.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z9.s
ld1h {z9.h}, p7/z, [x5]
rshrnb z16.h, z16.s, #4
add x5, x3, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z9.h[0]
add x5, x3, #0x460
sdot z15.d, z20.h, z10.h[0]
ld1h {z12.h}, p7/z, [x5]
sdot z15.d, z28.h, z11.h[0]
sdot z15.d, z26.h, z12.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[0]
sdot z16.d, z24.h, z10.h[0]
sdot z16.d, z27.h, z11.h[0]
sdot z16.d, z25.h, z12.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[1]
sdot z16.d, z24.h, z10.h[1]
sdot z16.d, z27.h, z11.h[1]
movprfx z27, z31
sdot z27.d, z19.h, z9.h[1]
sdot z16.d, z25.h, z12.h[1]
sdot z27.d, z20.h, z10.h[1]
sdot z27.d, z28.h, z11.h[1]
movprfx z28, z27
sdot z28.d, z26.h, z12.h[1]
uzp1 z28.s, z16.s, z28.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
sub z25.h, z13.h, z29.h
sub z24.h, z17.h, z21.h
sub z26.h, z18.h, z22.h
sub z27.h, z14.h, z30.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x500
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x7c0]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4a0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x80]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x520
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x180]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4c0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x280]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x540
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x380]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4e0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x480]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x560
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x580]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add z29.h, z29.h, z13.h
add z21.h, z21.h, z17.h
str q28, [x1, #0x680]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z26.h, z12.h[1]
movprfx z26, z25
sdot z26.d, z27.h, z15.h[1]
uzp1 z28.s, z28.s, z26.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
str q28, [x1, #0x780]
revh z21.d, p6/m, z21.d
sub z29.h, z29.h, z21.h
add z30.h, z30.h, z14.h
add z22.h, z22.h, z18.h
revh z22.d, p6/m, z22.d
sub z30.h, z30.h, z22.h
add x5, x3, #0x580
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z27, z31
sdot z27.d, z30.h, z15.h[1]
str q28, [x1, #0x100]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x5, x3, #0x5a0
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
str q28, [x1, #0x300]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x1, x1, #0x10
str q28, [x1, #0x4f0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
sdot z31.d, z30.h, z15.h[1]
uzp1 z31.s, z28.s, z31.s
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x6f0]
add x4, x4, x2, lsl #4
cmp x14, x1
add x5, x0, x4
ld1h {z24.h}, p7/z, [x5]
ptrue p6.d
add x5, x5, #0x20
ld1h {z31.h}, p7/z, [x5]
rev z31.h, z31.h
add x5, x13, x4
sub z27.h, z24.h, z31.h
add z24.h, z24.h, z31.h
ld1h {z31.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z30.h}, p7/z, [x5]
add x5, x7, x4
rev z30.h, z30.h
ld1h {z29.h}, p7/z, [x5]
add x5, x5, #0x20
sub z15.h, z31.h, z30.h
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x12, x4
rev z30.h, z30.h
ld1h {z25.h}, p7/z, [x5]
add x5, x5, #0x20
sub z6.h, z29.h, z30.h
add z29.h, z29.h, z30.h
ld1h {z30.h}, p7/z, [x5]
addvl x5, sp, #4
add x5, x5, #0x40
rev z30.h, z30.h
sub z20.h, z25.h, z30.h
str z20, [x5]
add x5, x6, x4
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z26.h}, p7/z, [x5]
add x5, x11, x4
rev z26.h, z26.h
sub z28.h, z30.h, z26.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z23.h}, p7/z, [x5]
add x5, x8, x4
rev z23.h, z23.h
ld1h {z22.h}, p7/z, [x5]
add x5, x5, #0x20
sub z16.h, z26.h, z23.h
add z26.h, z26.h, z23.h
ld1h {z23.h}, p7/z, [x5]
add x5, x10, x4
rev z23.h, z23.h
ld1h {z19.h}, p7/z, [x5]
zip1 z17.d, z24.d, z29.d
sub z9.h, z22.h, z23.h
zip2 z29.d, z24.d, z29.d
add x5, x5, #0x20
zip1 z24.d, z31.d, z25.d
add z22.h, z22.h, z23.h
zip2 z31.d, z31.d, z25.d
ld1h {z23.h}, p7/z, [x5]
zip1 z13.d, z17.d, z24.d
rev z23.h, z23.h
zip2 z17.d, z17.d, z24.d
sub z10.h, z19.h, z23.h
zip1 z21.d, z29.d, z31.d
add z19.h, z19.h, z23.h
revh z21.d, p6/m, z21.d
zip2 z29.d, z29.d, z31.d
revh z29.d, p6/m, z29.d
saddlb z25.s, z13.h, z29.h
saddlt z20.s, z13.h, z29.h
saddlb z23.s, z17.h, z21.h
saddlt z24.s, z17.h, z21.h
revw z23.d, p6/m, z23.d
revw z24.d, p6/m, z24.d
zip1 z31.s, z24.s, z23.s
zip2 z24.s, z24.s, z23.s
zip1 z18.s, z25.s, z20.s
zip2 z25.s, z25.s, z20.s
add z31.s, z18.s, z31.s
add z25.s, z25.s, z24.s
uzp2 z24.d, z31.d, z25.d
revw z24.d, p6/m, z24.d
ptrue p5.s
uzp1 z31.d, z31.d, z25.d
ld1w {z20.s}, p7/z, [x3]
add z25.s, z24.s, z31.s
sub z31.s, z31.s, z24.s
movprfx z23, z25
mul z23.s, p7/m, z23.s, z20.s
addp z23.s, p5/m, z23.s, z23.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z24, [x5]
mul z24.s, p7/m, z24.s, z31.s
addp z24.s, p5/m, z24.s, z24.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z18, [x5]
mul z25.s, p7/m, z25.s, z18.s
addp z25.s, p5/m, z25.s, z25.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z14, [x5]
mul z31.s, p7/m, z31.s, z14.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z18.d, z30.d, z22.d
addvl x5, sp, #5
zip2 z30.d, z30.d, z22.d
zip1 z22.d, z26.d, z19.d
add x5, x5, #0x40
zip1 z14.d, z18.d, z22.d
zip2 z26.d, z26.d, z19.d
zip2 z18.d, z18.d, z22.d
zip1 z22.d, z30.d, z26.d
str z31, [x5]
revh z22.d, p6/m, z22.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
saddlb z12.s, z14.h, z30.h
saddlt z26.s, z14.h, z30.h
saddlb z11.s, z18.h, z22.h
saddlt z19.s, z18.h, z22.h
revw z11.d, p6/m, z11.d
revw z19.d, p6/m, z19.d
zip1 z31.s, z19.s, z11.s
add x5, sp, #0x40
str z26, [x5]
zip1 z26.s, z12.s, z26.s
add z26.s, z26.s, z31.s
ldr z31, [x5]
zip2 z12.s, z12.s, z31.s
zip2 z19.s, z19.s, z11.s
add z19.s, z12.s, z19.s
uzp2 z12.d, z26.d, z19.d
revw z12.d, p6/m, z12.d
uzp1 z26.d, z26.d, z19.d
add z19.s, z12.s, z26.s
sub z26.s, z26.s, z12.s
mul z20.s, p7/m, z20.s, z19.s
addp z20.s, p5/m, z20.s, z20.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z12, [x5]
mul z12.s, p7/m, z12.s, z26.s
addp z12.s, p5/m, z12.s, z12.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z11, [x5]
mul z19.s, p7/m, z19.s, z11.s
addp z19.s, p5/m, z19.s, z19.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z11, [x5]
mul z26.s, p7/m, z26.s, z11.s
addp z26.s, p5/m, z26.s, z26.s
addvl x5, sp, #5
uzp1 z23.s, z23.s, z20.s
uzp1 z25.s, z25.s, z19.s
add x5, x5, #0x40
ldr z31, [x5]
uzp1 z31.s, z31.s, z26.s
addvl x5, sp, #4
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
add x5, x5, #0x40
ldr z20, [x5]
rshrnb z23.h, z23.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z23.h, z23.h, z23.h
uzp1 z25.h, z25.h, z25.h
str q31, [x1, #0x600]
trn2 z31.d, z15.d, z20.d
zip1 z26.d, z15.d, z20.d
zip1 z19.d, z16.d, z10.d
trn1 z15.d, z15.d, z20.d
uzp1 z24.s, z24.s, z12.s
rshrnb z24.h, z24.s, #4
uzp1 z24.h, z24.h, z24.h
str q23, [x1]
add x5, x3, #0xc0
zip1 z20.d, z28.d, z9.d
zip1 z20.d, z20.d, z19.d
str q25, [x1, #0x400]
trn2 z25.d, z27.d, z6.d
zip1 z23.d, z25.d, z31.d
zip2 z25.d, z25.d, z31.d
trn2 z31.d, z16.d, z10.d
trn1 z16.d, z16.d, z10.d
str q24, [x1, #0x200]
zip1 z24.d, z27.d, z6.d
trn1 z27.d, z27.d, z6.d
zip1 z24.d, z24.d, z26.d
zip2 z27.d, z27.d, z15.d
trn2 z26.d, z28.d, z9.d
ld1h {z15.h}, p7/z, [x9]
zip1 z19.d, z26.d, z31.d
trn1 z28.d, z28.d, z9.d
zip2 z26.d, z26.d, z31.d
zip2 z28.d, z28.d, z16.d
movi d31, #0000000000000000
movprfx z16, z31
sdot z16.d, z23.h, z0.h[0]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[0]
sdot z16.d, z24.h, z15.h[0]
sdot z12.d, z20.h, z15.h[0]
sdot z16.d, z27.h, z5.h[0]
sdot z12.d, z28.h, z5.h[0]
sdot z16.d, z25.h, z7.h[0]
sdot z12.d, z26.h, z7.h[0]
uzp1 z16.s, z16.s, z12.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[1]
add x5, x3, #0x1c0
sdot z12.d, z20.h, z15.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z23.h, z0.h[1]
sdot z16.d, z24.h, z15.h[1]
movprfx z15, z12
sdot z15.d, z28.h, z5.h[1]
sdot z16.d, z27.h, z5.h[1]
sdot z15.d, z26.h, z7.h[1]
sdot z16.d, z25.h, z7.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z10.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[0]
add x5, x3, #0x2c0
sdot z15.d, z20.h, z1.h[0]
sdot z15.d, z28.h, z3.h[0]
sdot z15.d, z26.h, z4.h[0]
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[0]
sdot z16.d, z24.h, z1.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z25.h, z4.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z12.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[1]
add x5, x3, #0x3c0
sdot z15.d, z20.h, z1.h[1]
sdot z15.d, z28.h, z3.h[1]
sdot z15.d, z26.h, z4.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[1]
sdot z16.d, z24.h, z1.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z25.h, z4.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0xe0
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x1e0
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x2e0
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x3e0
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x200
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x300
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x400
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z10, z31
sdot z10.d, z19.h, z11.h[0]
add x5, x3, #0x120
sdot z10.d, z20.h, z8.h[0]
sdot z10.d, z28.h, z12.h[0]
sdot z10.d, z26.h, z15.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[0]
sdot z16.d, z24.h, z8.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z10.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z10, z31
sdot z10.d, z19.h, z11.h[1]
sdot z10.d, z20.h, z8.h[1]
sdot z10.d, z28.h, z12.h[1]
sdot z10.d, z26.h, z15.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x220
sdot z16.d, z24.h, z8.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z10.s
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x320
rshrnb z16.h, z16.s, #4
ld1h {z12.h}, p7/z, [x5]
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x420
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
ld1h {z15.h}, p7/z, [x5]
sdot z9.d, z20.h, z11.h[0]
add x5, x3, #0x140
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x4c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x240
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x340
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x440
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x160
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
sdot z9.d, z28.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x260
sdot z16.d, z24.h, z11.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z9.s
ld1h {z9.h}, p7/z, [x5]
rshrnb z16.h, z16.s, #4
add x5, x3, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z9.h[0]
add x5, x3, #0x460
sdot z15.d, z20.h, z10.h[0]
ld1h {z12.h}, p7/z, [x5]
sdot z15.d, z28.h, z11.h[0]
sdot z15.d, z26.h, z12.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[0]
sdot z16.d, z24.h, z10.h[0]
sdot z16.d, z27.h, z11.h[0]
sdot z16.d, z25.h, z12.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[1]
sdot z16.d, z24.h, z10.h[1]
sdot z16.d, z27.h, z11.h[1]
movprfx z27, z31
sdot z27.d, z19.h, z9.h[1]
sdot z16.d, z25.h, z12.h[1]
sdot z27.d, z20.h, z10.h[1]
sdot z27.d, z28.h, z11.h[1]
movprfx z28, z27
sdot z28.d, z26.h, z12.h[1]
uzp1 z28.s, z16.s, z28.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
sub z25.h, z13.h, z29.h
sub z24.h, z17.h, z21.h
sub z26.h, z18.h, z22.h
sub z27.h, z14.h, z30.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x500
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x7c0]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4a0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x80]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x520
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x180]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4c0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x280]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x540
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x380]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4e0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x480]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x560
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x580]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add z29.h, z29.h, z13.h
add z21.h, z21.h, z17.h
str q28, [x1, #0x680]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z26.h, z12.h[1]
movprfx z26, z25
sdot z26.d, z27.h, z15.h[1]
uzp1 z28.s, z28.s, z26.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
str q28, [x1, #0x780]
revh z21.d, p6/m, z21.d
sub z29.h, z29.h, z21.h
add z30.h, z30.h, z14.h
add z22.h, z22.h, z18.h
revh z22.d, p6/m, z22.d
sub z30.h, z30.h, z22.h
add x5, x3, #0x580
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z27, z31
sdot z27.d, z30.h, z15.h[1]
str q28, [x1, #0x100]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x5, x3, #0x5a0
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
str q28, [x1, #0x300]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x1, x1, #0x10
str q28, [x1, #0x4f0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
sdot z31.d, z30.h, z15.h[1]
uzp1 z31.s, z28.s, z31.s
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x6f0]
add x4, x4, x2, lsl #4
cmp x14, x1
add x5, x0, x4
ld1h {z24.h}, p7/z, [x5]
ptrue p6.d
add x5, x5, #0x20
ld1h {z31.h}, p7/z, [x5]
rev z31.h, z31.h
add x5, x13, x4
sub z27.h, z24.h, z31.h
add z24.h, z24.h, z31.h
ld1h {z31.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z30.h}, p7/z, [x5]
add x5, x7, x4
rev z30.h, z30.h
ld1h {z29.h}, p7/z, [x5]
add x5, x5, #0x20
sub z15.h, z31.h, z30.h
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x12, x4
rev z30.h, z30.h
ld1h {z25.h}, p7/z, [x5]
add x5, x5, #0x20
sub z6.h, z29.h, z30.h
add z29.h, z29.h, z30.h
ld1h {z30.h}, p7/z, [x5]
addvl x5, sp, #4
add x5, x5, #0x40
rev z30.h, z30.h
sub z20.h, z25.h, z30.h
str z20, [x5]
add x5, x6, x4
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z26.h}, p7/z, [x5]
add x5, x11, x4
rev z26.h, z26.h
sub z28.h, z30.h, z26.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z23.h}, p7/z, [x5]
add x5, x8, x4
rev z23.h, z23.h
ld1h {z22.h}, p7/z, [x5]
add x5, x5, #0x20
sub z16.h, z26.h, z23.h
add z26.h, z26.h, z23.h
ld1h {z23.h}, p7/z, [x5]
add x5, x10, x4
rev z23.h, z23.h
ld1h {z19.h}, p7/z, [x5]
zip1 z17.d, z24.d, z29.d
sub z9.h, z22.h, z23.h
zip2 z29.d, z24.d, z29.d
add x5, x5, #0x20
zip1 z24.d, z31.d, z25.d
add z22.h, z22.h, z23.h
zip2 z31.d, z31.d, z25.d
ld1h {z23.h}, p7/z, [x5]
zip1 z13.d, z17.d, z24.d
rev z23.h, z23.h
zip2 z17.d, z17.d, z24.d
sub z10.h, z19.h, z23.h
zip1 z21.d, z29.d, z31.d
add z19.h, z19.h, z23.h
revh z21.d, p6/m, z21.d
zip2 z29.d, z29.d, z31.d
revh z29.d, p6/m, z29.d
saddlb z25.s, z13.h, z29.h
saddlt z20.s, z13.h, z29.h
saddlb z23.s, z17.h, z21.h
saddlt z24.s, z17.h, z21.h
revw z23.d, p6/m, z23.d
revw z24.d, p6/m, z24.d
zip1 z31.s, z24.s, z23.s
zip2 z24.s, z24.s, z23.s
zip1 z18.s, z25.s, z20.s
zip2 z25.s, z25.s, z20.s
add z31.s, z18.s, z31.s
add z25.s, z25.s, z24.s
uzp2 z24.d, z31.d, z25.d
revw z24.d, p6/m, z24.d
ptrue p5.s
uzp1 z31.d, z31.d, z25.d
ld1w {z20.s}, p7/z, [x3]
add z25.s, z24.s, z31.s
sub z31.s, z31.s, z24.s
movprfx z23, z25
mul z23.s, p7/m, z23.s, z20.s
addp z23.s, p5/m, z23.s, z23.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z24, [x5]
mul z24.s, p7/m, z24.s, z31.s
addp z24.s, p5/m, z24.s, z24.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z18, [x5]
mul z25.s, p7/m, z25.s, z18.s
addp z25.s, p5/m, z25.s, z25.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z14, [x5]
mul z31.s, p7/m, z31.s, z14.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z18.d, z30.d, z22.d
addvl x5, sp, #5
zip2 z30.d, z30.d, z22.d
zip1 z22.d, z26.d, z19.d
add x5, x5, #0x40
zip1 z14.d, z18.d, z22.d
zip2 z26.d, z26.d, z19.d
zip2 z18.d, z18.d, z22.d
zip1 z22.d, z30.d, z26.d
str z31, [x5]
revh z22.d, p6/m, z22.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
saddlb z12.s, z14.h, z30.h
saddlt z26.s, z14.h, z30.h
saddlb z11.s, z18.h, z22.h
saddlt z19.s, z18.h, z22.h
revw z11.d, p6/m, z11.d
revw z19.d, p6/m, z19.d
zip1 z31.s, z19.s, z11.s
add x5, sp, #0x40
str z26, [x5]
zip1 z26.s, z12.s, z26.s
add z26.s, z26.s, z31.s
ldr z31, [x5]
zip2 z12.s, z12.s, z31.s
zip2 z19.s, z19.s, z11.s
add z19.s, z12.s, z19.s
uzp2 z12.d, z26.d, z19.d
revw z12.d, p6/m, z12.d
uzp1 z26.d, z26.d, z19.d
add z19.s, z12.s, z26.s
sub z26.s, z26.s, z12.s
mul z20.s, p7/m, z20.s, z19.s
addp z20.s, p5/m, z20.s, z20.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z12, [x5]
mul z12.s, p7/m, z12.s, z26.s
addp z12.s, p5/m, z12.s, z12.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z11, [x5]
mul z19.s, p7/m, z19.s, z11.s
addp z19.s, p5/m, z19.s, z19.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z11, [x5]
mul z26.s, p7/m, z26.s, z11.s
addp z26.s, p5/m, z26.s, z26.s
addvl x5, sp, #5
uzp1 z23.s, z23.s, z20.s
uzp1 z25.s, z25.s, z19.s
add x5, x5, #0x40
ldr z31, [x5]
uzp1 z31.s, z31.s, z26.s
addvl x5, sp, #4
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
add x5, x5, #0x40
ldr z20, [x5]
rshrnb z23.h, z23.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z23.h, z23.h, z23.h
uzp1 z25.h, z25.h, z25.h
str q31, [x1, #0x600]
trn2 z31.d, z15.d, z20.d
zip1 z26.d, z15.d, z20.d
zip1 z19.d, z16.d, z10.d
trn1 z15.d, z15.d, z20.d
uzp1 z24.s, z24.s, z12.s
rshrnb z24.h, z24.s, #4
uzp1 z24.h, z24.h, z24.h
str q23, [x1]
add x5, x3, #0xc0
zip1 z20.d, z28.d, z9.d
zip1 z20.d, z20.d, z19.d
str q25, [x1, #0x400]
trn2 z25.d, z27.d, z6.d
zip1 z23.d, z25.d, z31.d
zip2 z25.d, z25.d, z31.d
trn2 z31.d, z16.d, z10.d
trn1 z16.d, z16.d, z10.d
str q24, [x1, #0x200]
zip1 z24.d, z27.d, z6.d
trn1 z27.d, z27.d, z6.d
zip1 z24.d, z24.d, z26.d
zip2 z27.d, z27.d, z15.d
trn2 z26.d, z28.d, z9.d
ld1h {z15.h}, p7/z, [x9]
zip1 z19.d, z26.d, z31.d
trn1 z28.d, z28.d, z9.d
zip2 z26.d, z26.d, z31.d
zip2 z28.d, z28.d, z16.d
movi d31, #0000000000000000
movprfx z16, z31
sdot z16.d, z23.h, z0.h[0]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[0]
sdot z16.d, z24.h, z15.h[0]
sdot z12.d, z20.h, z15.h[0]
sdot z16.d, z27.h, z5.h[0]
sdot z12.d, z28.h, z5.h[0]
sdot z16.d, z25.h, z7.h[0]
sdot z12.d, z26.h, z7.h[0]
uzp1 z16.s, z16.s, z12.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[1]
add x5, x3, #0x1c0
sdot z12.d, z20.h, z15.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z23.h, z0.h[1]
sdot z16.d, z24.h, z15.h[1]
movprfx z15, z12
sdot z15.d, z28.h, z5.h[1]
sdot z16.d, z27.h, z5.h[1]
sdot z15.d, z26.h, z7.h[1]
sdot z16.d, z25.h, z7.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z10.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[0]
add x5, x3, #0x2c0
sdot z15.d, z20.h, z1.h[0]
sdot z15.d, z28.h, z3.h[0]
sdot z15.d, z26.h, z4.h[0]
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[0]
sdot z16.d, z24.h, z1.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z25.h, z4.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z12.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[1]
add x5, x3, #0x3c0
sdot z15.d, z20.h, z1.h[1]
sdot z15.d, z28.h, z3.h[1]
sdot z15.d, z26.h, z4.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[1]
sdot z16.d, z24.h, z1.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z25.h, z4.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0xe0
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x1e0
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x2e0
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x3e0
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x200
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x300
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x400
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z10, z31
sdot z10.d, z19.h, z11.h[0]
add x5, x3, #0x120
sdot z10.d, z20.h, z8.h[0]
sdot z10.d, z28.h, z12.h[0]
sdot z10.d, z26.h, z15.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[0]
sdot z16.d, z24.h, z8.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z10.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z10, z31
sdot z10.d, z19.h, z11.h[1]
sdot z10.d, z20.h, z8.h[1]
sdot z10.d, z28.h, z12.h[1]
sdot z10.d, z26.h, z15.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x220
sdot z16.d, z24.h, z8.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z10.s
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x320
rshrnb z16.h, z16.s, #4
ld1h {z12.h}, p7/z, [x5]
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x420
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
ld1h {z15.h}, p7/z, [x5]
sdot z9.d, z20.h, z11.h[0]
add x5, x3, #0x140
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x4c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x240
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x340
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x440
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x160
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
sdot z9.d, z28.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x260
sdot z16.d, z24.h, z11.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z9.s
ld1h {z9.h}, p7/z, [x5]
rshrnb z16.h, z16.s, #4
add x5, x3, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z9.h[0]
add x5, x3, #0x460
sdot z15.d, z20.h, z10.h[0]
ld1h {z12.h}, p7/z, [x5]
sdot z15.d, z28.h, z11.h[0]
sdot z15.d, z26.h, z12.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[0]
sdot z16.d, z24.h, z10.h[0]
sdot z16.d, z27.h, z11.h[0]
sdot z16.d, z25.h, z12.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[1]
sdot z16.d, z24.h, z10.h[1]
sdot z16.d, z27.h, z11.h[1]
movprfx z27, z31
sdot z27.d, z19.h, z9.h[1]
sdot z16.d, z25.h, z12.h[1]
sdot z27.d, z20.h, z10.h[1]
sdot z27.d, z28.h, z11.h[1]
movprfx z28, z27
sdot z28.d, z26.h, z12.h[1]
uzp1 z28.s, z16.s, z28.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
sub z25.h, z13.h, z29.h
sub z24.h, z17.h, z21.h
sub z26.h, z18.h, z22.h
sub z27.h, z14.h, z30.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x500
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x7c0]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4a0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x80]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x520
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x180]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4c0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x280]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x540
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x380]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4e0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x480]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x560
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x580]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add z29.h, z29.h, z13.h
add z21.h, z21.h, z17.h
str q28, [x1, #0x680]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z26.h, z12.h[1]
movprfx z26, z25
sdot z26.d, z27.h, z15.h[1]
uzp1 z28.s, z28.s, z26.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
str q28, [x1, #0x780]
revh z21.d, p6/m, z21.d
sub z29.h, z29.h, z21.h
add z30.h, z30.h, z14.h
add z22.h, z22.h, z18.h
revh z22.d, p6/m, z22.d
sub z30.h, z30.h, z22.h
add x5, x3, #0x580
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z27, z31
sdot z27.d, z30.h, z15.h[1]
str q28, [x1, #0x100]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x5, x3, #0x5a0
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
str q28, [x1, #0x300]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x1, x1, #0x10
str q28, [x1, #0x4f0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
sdot z31.d, z30.h, z15.h[1]
uzp1 z31.s, z28.s, z31.s
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x6f0]
add x4, x4, x2, lsl #4
cmp x14, x1
add x5, x0, x4
ld1h {z24.h}, p7/z, [x5]
ptrue p6.d
add x5, x5, #0x20
ld1h {z31.h}, p7/z, [x5]
rev z31.h, z31.h
add x5, x13, x4
sub z27.h, z24.h, z31.h
add z24.h, z24.h, z31.h
ld1h {z31.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z30.h}, p7/z, [x5]
add x5, x7, x4
rev z30.h, z30.h
ld1h {z29.h}, p7/z, [x5]
add x5, x5, #0x20
sub z15.h, z31.h, z30.h
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x12, x4
rev z30.h, z30.h
ld1h {z25.h}, p7/z, [x5]
add x5, x5, #0x20
sub z6.h, z29.h, z30.h
add z29.h, z29.h, z30.h
ld1h {z30.h}, p7/z, [x5]
addvl x5, sp, #4
add x5, x5, #0x40
rev z30.h, z30.h
sub z20.h, z25.h, z30.h
str z20, [x5]
add x5, x6, x4
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z26.h}, p7/z, [x5]
add x5, x11, x4
rev z26.h, z26.h
sub z28.h, z30.h, z26.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
add x5, x5, #0x20
ld1h {z23.h}, p7/z, [x5]
add x5, x8, x4
rev z23.h, z23.h
ld1h {z22.h}, p7/z, [x5]
add x5, x5, #0x20
sub z16.h, z26.h, z23.h
add z26.h, z26.h, z23.h
ld1h {z23.h}, p7/z, [x5]
add x5, x10, x4
rev z23.h, z23.h
ld1h {z19.h}, p7/z, [x5]
zip1 z17.d, z24.d, z29.d
sub z9.h, z22.h, z23.h
zip2 z29.d, z24.d, z29.d
add x5, x5, #0x20
zip1 z24.d, z31.d, z25.d
add z22.h, z22.h, z23.h
zip2 z31.d, z31.d, z25.d
ld1h {z23.h}, p7/z, [x5]
zip1 z13.d, z17.d, z24.d
rev z23.h, z23.h
zip2 z17.d, z17.d, z24.d
sub z10.h, z19.h, z23.h
zip1 z21.d, z29.d, z31.d
add z19.h, z19.h, z23.h
revh z21.d, p6/m, z21.d
zip2 z29.d, z29.d, z31.d
revh z29.d, p6/m, z29.d
saddlb z25.s, z13.h, z29.h
saddlt z20.s, z13.h, z29.h
saddlb z23.s, z17.h, z21.h
saddlt z24.s, z17.h, z21.h
revw z23.d, p6/m, z23.d
revw z24.d, p6/m, z24.d
zip1 z31.s, z24.s, z23.s
zip2 z24.s, z24.s, z23.s
zip1 z18.s, z25.s, z20.s
zip2 z25.s, z25.s, z20.s
add z31.s, z18.s, z31.s
add z25.s, z25.s, z24.s
uzp2 z24.d, z31.d, z25.d
revw z24.d, p6/m, z24.d
ptrue p5.s
uzp1 z31.d, z31.d, z25.d
ld1w {z20.s}, p7/z, [x3]
add z25.s, z24.s, z31.s
sub z31.s, z31.s, z24.s
movprfx z23, z25
mul z23.s, p7/m, z23.s, z20.s
addp z23.s, p5/m, z23.s, z23.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z24, [x5]
mul z24.s, p7/m, z24.s, z31.s
addp z24.s, p5/m, z24.s, z24.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z18, [x5]
mul z25.s, p7/m, z25.s, z18.s
addp z25.s, p5/m, z25.s, z25.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z14, [x5]
mul z31.s, p7/m, z31.s, z14.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z18.d, z30.d, z22.d
addvl x5, sp, #5
zip2 z30.d, z30.d, z22.d
zip1 z22.d, z26.d, z19.d
add x5, x5, #0x40
zip1 z14.d, z18.d, z22.d
zip2 z26.d, z26.d, z19.d
zip2 z18.d, z18.d, z22.d
zip1 z22.d, z30.d, z26.d
str z31, [x5]
revh z22.d, p6/m, z22.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
saddlb z12.s, z14.h, z30.h
saddlt z26.s, z14.h, z30.h
saddlb z11.s, z18.h, z22.h
saddlt z19.s, z18.h, z22.h
revw z11.d, p6/m, z11.d
revw z19.d, p6/m, z19.d
zip1 z31.s, z19.s, z11.s
add x5, sp, #0x40
str z26, [x5]
zip1 z26.s, z12.s, z26.s
add z26.s, z26.s, z31.s
ldr z31, [x5]
zip2 z12.s, z12.s, z31.s
zip2 z19.s, z19.s, z11.s
add z19.s, z12.s, z19.s
uzp2 z12.d, z26.d, z19.d
revw z12.d, p6/m, z12.d
uzp1 z26.d, z26.d, z19.d
add z19.s, z12.s, z26.s
sub z26.s, z26.s, z12.s
mul z20.s, p7/m, z20.s, z19.s
addp z20.s, p5/m, z20.s, z20.s
addvl x5, sp, #1
add x5, x5, #0x40
ldr z12, [x5]
mul z12.s, p7/m, z12.s, z26.s
addp z12.s, p5/m, z12.s, z12.s
addvl x5, sp, #2
add x5, x5, #0x40
ldr z11, [x5]
mul z19.s, p7/m, z19.s, z11.s
addp z19.s, p5/m, z19.s, z19.s
addvl x5, sp, #3
add x5, x5, #0x40
ldr z11, [x5]
mul z26.s, p7/m, z26.s, z11.s
addp z26.s, p5/m, z26.s, z26.s
addvl x5, sp, #5
uzp1 z23.s, z23.s, z20.s
uzp1 z25.s, z25.s, z19.s
add x5, x5, #0x40
ldr z31, [x5]
uzp1 z31.s, z31.s, z26.s
addvl x5, sp, #4
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
add x5, x5, #0x40
ldr z20, [x5]
rshrnb z23.h, z23.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z23.h, z23.h, z23.h
uzp1 z25.h, z25.h, z25.h
str q31, [x1, #0x600]
trn2 z31.d, z15.d, z20.d
zip1 z26.d, z15.d, z20.d
zip1 z19.d, z16.d, z10.d
trn1 z15.d, z15.d, z20.d
uzp1 z24.s, z24.s, z12.s
rshrnb z24.h, z24.s, #4
uzp1 z24.h, z24.h, z24.h
str q23, [x1]
add x5, x3, #0xc0
zip1 z20.d, z28.d, z9.d
zip1 z20.d, z20.d, z19.d
str q25, [x1, #0x400]
trn2 z25.d, z27.d, z6.d
zip1 z23.d, z25.d, z31.d
zip2 z25.d, z25.d, z31.d
trn2 z31.d, z16.d, z10.d
trn1 z16.d, z16.d, z10.d
str q24, [x1, #0x200]
zip1 z24.d, z27.d, z6.d
trn1 z27.d, z27.d, z6.d
zip1 z24.d, z24.d, z26.d
zip2 z27.d, z27.d, z15.d
trn2 z26.d, z28.d, z9.d
ld1h {z15.h}, p7/z, [x9]
zip1 z19.d, z26.d, z31.d
trn1 z28.d, z28.d, z9.d
zip2 z26.d, z26.d, z31.d
zip2 z28.d, z28.d, z16.d
movi d31, #0000000000000000
movprfx z16, z31
sdot z16.d, z23.h, z0.h[0]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[0]
sdot z16.d, z24.h, z15.h[0]
sdot z12.d, z20.h, z15.h[0]
sdot z16.d, z27.h, z5.h[0]
sdot z12.d, z28.h, z5.h[0]
sdot z16.d, z25.h, z7.h[0]
sdot z12.d, z26.h, z7.h[0]
uzp1 z16.s, z16.s, z12.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z12, z31
sdot z12.d, z19.h, z0.h[1]
add x5, x3, #0x1c0
sdot z12.d, z20.h, z15.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z23.h, z0.h[1]
sdot z16.d, z24.h, z15.h[1]
movprfx z15, z12
sdot z15.d, z28.h, z5.h[1]
sdot z16.d, z27.h, z5.h[1]
sdot z15.d, z26.h, z7.h[1]
sdot z16.d, z25.h, z7.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z10.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[0]
add x5, x3, #0x2c0
sdot z15.d, z20.h, z1.h[0]
sdot z15.d, z28.h, z3.h[0]
sdot z15.d, z26.h, z4.h[0]
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[0]
sdot z16.d, z24.h, z1.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z25.h, z4.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z12.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z2.h[1]
add x5, x3, #0x3c0
sdot z15.d, z20.h, z1.h[1]
sdot z15.d, z28.h, z3.h[1]
sdot z15.d, z26.h, z4.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z23.h, z2.h[1]
sdot z16.d, z24.h, z1.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z25.h, z4.h[1]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0xe0
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x1e0
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x2e0
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x3e0
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x200
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x300
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x400
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z10, z31
sdot z10.d, z19.h, z11.h[0]
add x5, x3, #0x120
sdot z10.d, z20.h, z8.h[0]
sdot z10.d, z28.h, z12.h[0]
sdot z10.d, z26.h, z15.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[0]
sdot z16.d, z24.h, z8.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z10.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z10, z31
sdot z10.d, z19.h, z11.h[1]
sdot z10.d, z20.h, z8.h[1]
sdot z10.d, z28.h, z12.h[1]
sdot z10.d, z26.h, z15.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z23.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x220
sdot z16.d, z24.h, z8.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z10.s
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x320
rshrnb z16.h, z16.s, #4
ld1h {z12.h}, p7/z, [x5]
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x420
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
ld1h {z15.h}, p7/z, [x5]
sdot z9.d, z20.h, z11.h[0]
add x5, x3, #0x140
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x4c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
sdot z16.d, z24.h, z11.h[1]
ld1h {z11.h}, p7/z, [x5]
add x5, x3, #0x240
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x340
sdot z9.d, z28.h, z12.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
ld1h {z12.h}, p7/z, [x5]
sdot z16.d, z25.h, z15.h[1]
add x5, x3, #0x440
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
ld1h {z15.h}, p7/z, [x5]
movprfx z9, z31
sdot z9.d, z19.h, z10.h[0]
add x5, x3, #0x160
sdot z9.d, z20.h, z11.h[0]
sdot z9.d, z28.h, z12.h[0]
sdot z9.d, z26.h, z15.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[0]
sdot z16.d, z24.h, z11.h[0]
sdot z16.d, z27.h, z12.h[0]
sdot z16.d, z25.h, z15.h[0]
uzp1 z16.s, z16.s, z9.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
movprfx z9, z31
sdot z9.d, z19.h, z10.h[1]
sdot z9.d, z20.h, z11.h[1]
sdot z9.d, z28.h, z12.h[1]
sdot z9.d, z26.h, z15.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z23.h, z10.h[1]
ld1h {z10.h}, p7/z, [x5]
add x5, x3, #0x260
sdot z16.d, z24.h, z11.h[1]
sdot z16.d, z27.h, z12.h[1]
sdot z16.d, z25.h, z15.h[1]
uzp1 z16.s, z16.s, z9.s
ld1h {z9.h}, p7/z, [x5]
rshrnb z16.h, z16.s, #4
add x5, x3, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z11.h}, p7/z, [x5]
movprfx z15, z31
sdot z15.d, z19.h, z9.h[0]
add x5, x3, #0x460
sdot z15.d, z20.h, z10.h[0]
ld1h {z12.h}, p7/z, [x5]
sdot z15.d, z28.h, z11.h[0]
sdot z15.d, z26.h, z12.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[0]
sdot z16.d, z24.h, z10.h[0]
sdot z16.d, z27.h, z11.h[0]
sdot z16.d, z25.h, z12.h[0]
uzp1 z16.s, z16.s, z15.s
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
add x5, x3, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z23.h, z9.h[1]
sdot z16.d, z24.h, z10.h[1]
sdot z16.d, z27.h, z11.h[1]
movprfx z27, z31
sdot z27.d, z19.h, z9.h[1]
sdot z16.d, z25.h, z12.h[1]
sdot z27.d, z20.h, z10.h[1]
sdot z27.d, z28.h, z11.h[1]
movprfx z28, z27
sdot z28.d, z26.h, z12.h[1]
uzp1 z28.s, z16.s, z28.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
sub z25.h, z13.h, z29.h
sub z24.h, z17.h, z21.h
sub z26.h, z18.h, z22.h
sub z27.h, z14.h, z30.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x500
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x7c0]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4a0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x80]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x520
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x180]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4c0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x280]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x540
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x380]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z23, z31
sdot z23.d, z26.h, z12.h[1]
add x5, x3, #0x4e0
sdot z23.d, z27.h, z15.h[1]
str q28, [x1, #0x480]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
ld1h {z15.h}, p7/z, [x5]
add x5, x3, #0x560
ld1h {z12.h}, p7/z, [x5]
movprfx z23, z31
sdot z23.d, z26.h, z12.h[0]
sdot z23.d, z27.h, z15.h[0]
str q28, [x1, #0x580]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[0]
sdot z28.d, z25.h, z15.h[0]
uzp1 z28.s, z28.s, z23.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add z29.h, z29.h, z13.h
add z21.h, z21.h, z17.h
str q28, [x1, #0x680]
movprfx z28, z31
sdot z28.d, z24.h, z12.h[1]
sdot z28.d, z25.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z26.h, z12.h[1]
movprfx z26, z25
sdot z26.d, z27.h, z15.h[1]
uzp1 z28.s, z28.s, z26.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
str q28, [x1, #0x780]
revh z21.d, p6/m, z21.d
sub z29.h, z29.h, z21.h
add z30.h, z30.h, z14.h
add z22.h, z22.h, z18.h
revh z22.d, p6/m, z22.d
sub z30.h, z30.h, z22.h
add x5, x3, #0x580
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
movprfx z27, z31
sdot z27.d, z30.h, z15.h[1]
str q28, [x1, #0x100]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x5, x3, #0x5a0
ld1h {z15.h}, p7/z, [x5]
movprfx z27, z31
sdot z27.d, z30.h, z15.h[0]
str q28, [x1, #0x300]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[0]
uzp1 z28.s, z28.s, z27.s
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
add x1, x1, #0x10
str q28, [x1, #0x4f0]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
sdot z31.d, z30.h, z15.h[1]
uzp1 z31.s, z28.s, z31.s
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x6f0]
add x4, x4, x2, lsl #4
cmp x14, x1
ldp d8, d9, [sp]
ldp d10, d11, [sp, #0x10]
ldp d12, d13, [sp, #0x20]
ldp d14, d15, [sp, #0x30]
addvl sp, sp, #6
add sp, sp, #0x40
add x0, sp, #0x10
mov x1, x15
addvl sp, sp, #0xfffffffffffffff6
adrp x2, #0x456000
ptrue p7.b
sub sp, sp, #0x60
add x2, x2, #0x5b0
add x4, x2, #0x20
add x18, x0, #0xa0
add x17, x0, #0xe0
add x16, x0, #0x120
stp x29, x30, [sp]
mov x29, sp
add x30, x0, #0x60
ld1w {z31.s}, p7/z, [x4]
add x4, sp, #0x60
str x19, [sp, #0x10]
add x15, x0, #0x160
stp d8, d9, [sp, #0x20]
add x14, x0, #0x1a0
add x13, x0, #0x1e0
stp d10, d11, [sp, #0x30]
add x12, x0, #0x40
add x11, x0, #0x80
stp d12, d13, [sp, #0x40]
add x10, x0, #0xc0
add x9, x0, #0x100
stp d14, d15, [sp, #0x50]
add x8, x0, #0x140
str z31, [x4]
add x4, x2, #0x40
ld1w {z31.s}, p7/z, [x4]
addvl x4, sp, #1
add x7, x0, #0x180
add x4, x4, #0x60
str z31, [x4]
add x6, x0, #0x1c0
add x4, x2, #0x60
ld1w {z31.s}, p7/z, [x4]
add x5, x2, #0x80
addvl x4, sp, #2
add x19, x0, #0x20
add x4, x4, #0x60
str z31, [x4]
mov x3, #0
add x4, x2, #0x180
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #3
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0x280
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #4
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0x380
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #5
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0xa0
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #6
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0x1a0
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #7
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0x2a0
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #8
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0x3a0
ld1h {z31.h}, p7/z, [x4]
addvl x4, sp, #9
add x4, x4, #0x60
str z31, [x4]
add x4, x2, #0x100
ld1h {z13.h}, p7/z, [x4]
ld1h {z23.h}, p7/z, [x11, x3, lsl #1]
ld1h {z14.h}, p7/z, [x0, x3, lsl #1]
ld1h {z29.h}, p7/z, [x12, x3, lsl #1]
zip1 z9.d, z14.d, z23.d
ld1h {z21.h}, p7/z, [x10, x3, lsl #1]
zip2 z14.d, z14.d, z23.d
ld1h {z25.h}, p7/z, [x19, x3, lsl #1]
zip1 z23.d, z29.d, z21.d
ld1h {z31.h}, p7/z, [x30, x3, lsl #1]
zip2 z29.d, z29.d, z21.d
zip1 z5.d, z9.d, z23.d
ld1h {z27.h}, p7/z, [x18, x3, lsl #1]
ld1h {z28.h}, p7/z, [x17, x3, lsl #1]
ld1h {z26.h}, p7/z, [x16, x3, lsl #1]
ld1h {z30.h}, p7/z, [x15, x3, lsl #1]
ld1h {z24.h}, p7/z, [x14, x3, lsl #1]
ld1h {z22.h}, p7/z, [x13, x3, lsl #1]
zip2 z9.d, z9.d, z23.d
zip1 z7.d, z14.d, z29.d
ptrue p6.d
revh z7.d, p6/m, z7.d
zip2 z14.d, z14.d, z29.d
revh z14.d, p6/m, z14.d
rev z27.h, z27.h
rev z29.h, z28.h
rev z25.h, z25.h
rev z31.h, z31.h
zip1 z17.d, z25.d, z27.d
zip1 z28.d, z31.d, z29.d
zip2 z25.d, z25.d, z27.d
zip2 z31.d, z31.d, z29.d
zip1 z19.d, z17.d, z28.d
zip1 z11.d, z25.d, z31.d
zip2 z17.d, z17.d, z28.d
revh z11.d, p6/m, z11.d
zip2 z25.d, z25.d, z31.d
revh z25.d, p6/m, z25.d
saddlb z31.s, z14.h, z25.h
saddlb z28.s, z5.h, z19.h
add z28.s, z28.s, z31.s
saddlt z31.s, z14.h, z25.h
saddlt z23.s, z5.h, z19.h
add z23.s, z23.s, z31.s
saddlb z31.s, z7.h, z11.h
saddlb z27.s, z9.h, z17.h
saddlt z29.s, z9.h, z17.h
add z27.s, z27.s, z31.s
saddlt z31.s, z7.h, z11.h
add z29.s, z29.s, z31.s
revw z27.d, p6/m, z27.d
revw z29.d, p6/m, z29.d
zip1 z31.s, z28.s, z23.s
zip2 z28.s, z28.s, z23.s
zip1 z21.s, z29.s, z27.s
zip2 z29.s, z29.s, z27.s
add z31.s, z31.s, z21.s
add z29.s, z28.s, z29.s
uzp2 z28.d, z31.d, z29.d
revw z28.d, p6/m, z28.d
ptrue p5.s
uzp1 z31.d, z31.d, z29.d
ld1w {z23.s}, p7/z, [x2]
add z29.s, z28.s, z31.s
sub z31.s, z31.s, z28.s
movprfx z27, z29
mul z27.s, p7/m, z27.s, z23.s
addp z27.s, p5/m, z27.s, z27.s
add x4, sp, #0x60
ldr z3, [x4]
movprfx z28, z3
mul z28.s, p7/m, z28.s, z31.s
addp z28.s, p5/m, z28.s, z28.s
addvl x4, sp, #1
add x4, x4, #0x60
ldr z2, [x4]
mul z29.s, p7/m, z29.s, z2.s
addp z29.s, p5/m, z29.s, z29.s
addvl x4, sp, #2
add x4, x4, #0x60
ldr z1, [x4]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
ld1h {z20.h}, p7/z, [x7, x3, lsl #1]
ld1h {z15.h}, p7/z, [x9, x3, lsl #1]
ld1h {z21.h}, p7/z, [x8, x3, lsl #1]
zip1 z10.d, z15.d, z20.d
ld1h {z18.h}, p7/z, [x6, x3, lsl #1]
zip2 z15.d, z15.d, z20.d
zip1 z20.d, z21.d, z18.d
zip2 z21.d, z21.d, z18.d
zip1 z6.d, z10.d, z20.d
zip1 z8.d, z15.d, z21.d
zip2 z10.d, z10.d, z20.d
revh z8.d, p6/m, z8.d
zip2 z15.d, z15.d, z21.d
revh z15.d, p6/m, z15.d
rev z24.h, z24.h
rev z22.h, z22.h
rev z26.h, z26.h
rev z30.h, z30.h
zip1 z18.d, z26.d, z24.d
zip2 z26.d, z26.d, z24.d
zip1 z24.d, z30.d, z22.d
zip2 z30.d, z30.d, z22.d
zip1 z20.d, z18.d, z24.d
zip1 z12.d, z26.d, z30.d
zip2 z18.d, z18.d, z24.d
revh z12.d, p6/m, z12.d
zip2 z26.d, z26.d, z30.d
revh z26.d, p6/m, z26.d
saddlb z30.s, z15.h, z26.h
saddlb z22.s, z6.h, z20.h
add z22.s, z22.s, z30.s
saddlt z30.s, z15.h, z26.h
saddlt z16.s, z6.h, z20.h
add z16.s, z16.s, z30.s
saddlb z30.s, z8.h, z12.h
saddlb z21.s, z10.h, z18.h
saddlt z24.s, z8.h, z12.h
add z21.s, z21.s, z30.s
saddlt z30.s, z10.h, z18.h
add z24.s, z30.s, z24.s
revw z21.d, p6/m, z21.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z22.s, z16.s
zip2 z22.s, z22.s, z16.s
zip1 z4.s, z24.s, z21.s
zip2 z24.s, z24.s, z21.s
add z30.s, z30.s, z4.s
add z24.s, z22.s, z24.s
uzp2 z22.d, z30.d, z24.d
revw z22.d, p6/m, z22.d
uzp1 z30.d, z30.d, z24.d
add z24.s, z22.s, z30.s
sub z30.s, z30.s, z22.s
mul z23.s, p7/m, z23.s, z24.s
addp z23.s, p5/m, z23.s, z23.s
movprfx z22, z3
mul z22.s, p7/m, z22.s, z30.s
addp z22.s, p5/m, z22.s, z22.s
mul z24.s, p7/m, z24.s, z2.s
addp z24.s, p5/m, z24.s, z24.s
mul z30.s, p7/m, z30.s, z1.s
addp z30.s, p5/m, z30.s, z30.s
uzp1 z27.s, z27.s, z23.s
rshrnb z27.h, z27.s, #0xb
uzp1 z27.h, z27.h, z27.h
uzp1 z28.s, z28.s, z22.s
uzp1 z29.s, z29.s, z24.s
uzp1 z31.s, z31.s, z30.s
rshrnb z28.h, z28.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z28.h, z28.h, z28.h
uzp1 z29.h, z29.h, z29.h
rshrnb z31.h, z31.s, #0xb
sub z22.h, z5.h, z19.h
uzp1 z31.h, z31.h, z31.h
sub z21.h, z9.h, z17.h
str q27, [x1]
sub z27.h, z7.h, z11.h
str q28, [x1, #0x200]
str q29, [x1, #0x400]
str q31, [x1, #0x600]
revh z27.d, p6/m, z27.d
sub z28.h, z14.h, z25.h
revh z28.d, p6/m, z28.d
sub z24.h, z6.h, z20.h
sub z23.h, z10.h, z18.h
sub z29.h, z8.h, z12.h
revh z29.d, p6/m, z29.d
sub z30.h, z15.h, z26.h
revh z30.d, p6/m, z30.d
addvl x4, sp, #3
movi d31, #0000000000000000
ld1h {z4.h}, p7/z, [x5]
add x4, x4, #0x60
ldr z2, [x4]
movprfx z3, z31
sdot z3.d, z23.h, z2.h[0]
addvl x4, sp, #4
sdot z3.d, z24.h, z4.h[0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z3.d, z29.h, z1.h[0]
addvl x4, sp, #5
sdot z16.d, z22.h, z4.h[0]
sdot z16.d, z27.h, z1.h[0]
add x4, x4, #0x60
ldr z0, [x4]
sdot z3.d, z30.h, z0.h[0]
addvl x4, sp, #7
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z3.s
add x4, x4, #0x60
movprfx z3, z31
sdot z3.d, z23.h, z2.h[1]
rshrnb z16.h, z16.s, #0xb
sdot z3.d, z24.h, z4.h[1]
uzp1 z16.h, z16.h, z16.h
sdot z3.d, z29.h, z1.h[1]
sdot z3.d, z30.h, z0.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
sdot z16.d, z22.h, z4.h[1]
sdot z16.d, z27.h, z1.h[1]
sdot z16.d, z28.h, z0.h[1]
uzp1 z16.s, z16.s, z3.s
ldr z3, [x4]
addvl x4, sp, #6
add x4, x4, #0x60
ldr z2, [x4]
rshrnb z16.h, z16.s, #0xb
addvl x4, sp, #8
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z4.d, z24.h, z2.h[0]
addvl x4, sp, #9
sdot z4.d, z29.h, z1.h[0]
add z25.h, z14.h, z25.h
add x4, x4, #0x60
ldr z0, [x4]
sdot z4.d, z30.h, z0.h[0]
add x4, x2, #0xc0
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z1.h[0]
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[1]
sdot z4.d, z24.h, z2.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1c0
sdot z4.d, z29.h, z1.h[1]
sdot z16.d, z27.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2c0
sdot z4.d, z30.h, z0.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z0.h[1]
add x4, x2, #0x3c0
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0xe0
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1e0
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2e0
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x3e0
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x200
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x300
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x400
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z1, z31
sdot z1.d, z23.h, z2.h[0]
add x4, x2, #0x120
sdot z1.d, z24.h, z13.h[0]
sdot z1.d, z29.h, z3.h[0]
sdot z1.d, z30.h, z4.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
sdot z16.d, z22.h, z13.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z1.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z1, z31
sdot z1.d, z23.h, z2.h[1]
sdot z1.d, z24.h, z13.h[1]
sdot z1.d, z29.h, z3.h[1]
sdot z1.d, z30.h, z4.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x220
sdot z16.d, z22.h, z13.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z1.s
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x320
rshrnb z16.h, z16.s, #0xb
ld1h {z3.h}, p7/z, [x4]
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x420
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
str q16, [x1, #0x4c0]
ld1h {z4.h}, p7/z, [x4]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z0.d, z30.h, z4.h[0]
add x4, x2, #0x140
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x240
ld1h {z1.h}, p7/z, [x4]
sdot z0.d, z29.h, z3.h[1]
add x4, x2, #0x340
sdot z0.d, z30.h, z4.h[1]
sdot z16.d, z27.h, z3.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x440
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x160
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
sdot z0.d, z29.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x260
sdot z16.d, z22.h, z2.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z0.s
ld1h {z0.h}, p7/z, [x4]
rshrnb z16.h, z16.s, #0xb
add x4, x2, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z2.h}, p7/z, [x4]
movprfx z4, z31
sdot z4.d, z23.h, z0.h[0]
add x4, x2, #0x460
sdot z4.d, z24.h, z1.h[0]
ld1h {z3.h}, p7/z, [x4]
sdot z4.d, z29.h, z2.h[0]
sdot z4.d, z30.h, z3.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[0]
sdot z16.d, z22.h, z1.h[0]
sdot z16.d, z27.h, z2.h[0]
sdot z16.d, z28.h, z3.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[1]
sdot z16.d, z22.h, z1.h[1]
sdot z16.d, z27.h, z2.h[1]
sdot z16.d, z28.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z0.h[1]
sdot z28.d, z24.h, z1.h[1]
sdot z28.d, z29.h, z2.h[1]
sdot z28.d, z30.h, z3.h[1]
add z19.h, z19.h, z5.h
add z17.h, z17.h, z9.h
sub z29.h, z19.h, z25.h
add z11.h, z7.h, z11.h
add z26.h, z15.h, z26.h
add z20.h, z20.h, z6.h
ld1h {z15.h}, p7/z, [x4]
sub z27.h, z20.h, z26.h
add x4, x2, #0x500
add z18.h, z18.h, z10.h
ld1h {z14.h}, p7/z, [x4]
add z12.h, z8.h, z12.h
uzp1 z16.s, z16.s, z28.s
sub z24.h, z18.h, z12.h
sub z28.h, z17.h, z11.h
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4a0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x80]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x520
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x180]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4c0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x280]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x540
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x380]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4e0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x480]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x560
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x580]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
rshrnb z16.h, z16.s, #0xb
add z19.h, z19.h, z25.h
uzp1 z16.h, z16.h, z16.h
add z17.h, z17.h, z11.h
str q30, [x1, #0x680]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z24.h, z14.h[1]
sdot z29.d, z27.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
str q30, [x1, #0x780]
str q16, [x1, #0x7c0]
revh z17.d, p6/m, z17.d
sub z19.h, z19.h, z17.h
add z20.h, z20.h, z26.h
add z18.h, z18.h, z12.h
revh z18.d, p6/m, z18.d
sub z20.h, z20.h, z18.h
add x4, x2, #0x580
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
movprfx z29, z31
sdot z29.d, z20.h, z15.h[1]
str q30, [x1, #0x100]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x5a0
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
str q30, [x1, #0x300]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x3, x3, #0x100
str q30, [x1, #0x500]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
sdot z31.d, z20.h, z15.h[1]
uzp1 z31.s, z30.s, z31.s
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x700]
add x1, x1, #0x10
cmp x3, #0x400
ld1h {z23.h}, p7/z, [x11, x3, lsl #1]
ld1h {z14.h}, p7/z, [x0, x3, lsl #1]
ld1h {z29.h}, p7/z, [x12, x3, lsl #1]
zip1 z9.d, z14.d, z23.d
ld1h {z21.h}, p7/z, [x10, x3, lsl #1]
zip2 z14.d, z14.d, z23.d
ld1h {z25.h}, p7/z, [x19, x3, lsl #1]
zip1 z23.d, z29.d, z21.d
ld1h {z31.h}, p7/z, [x30, x3, lsl #1]
zip2 z29.d, z29.d, z21.d
zip1 z5.d, z9.d, z23.d
ld1h {z27.h}, p7/z, [x18, x3, lsl #1]
ld1h {z28.h}, p7/z, [x17, x3, lsl #1]
ld1h {z26.h}, p7/z, [x16, x3, lsl #1]
ld1h {z30.h}, p7/z, [x15, x3, lsl #1]
ld1h {z24.h}, p7/z, [x14, x3, lsl #1]
ld1h {z22.h}, p7/z, [x13, x3, lsl #1]
zip2 z9.d, z9.d, z23.d
zip1 z7.d, z14.d, z29.d
ptrue p6.d
revh z7.d, p6/m, z7.d
zip2 z14.d, z14.d, z29.d
revh z14.d, p6/m, z14.d
rev z27.h, z27.h
rev z29.h, z28.h
rev z25.h, z25.h
rev z31.h, z31.h
zip1 z17.d, z25.d, z27.d
zip1 z28.d, z31.d, z29.d
zip2 z25.d, z25.d, z27.d
zip2 z31.d, z31.d, z29.d
zip1 z19.d, z17.d, z28.d
zip1 z11.d, z25.d, z31.d
zip2 z17.d, z17.d, z28.d
revh z11.d, p6/m, z11.d
zip2 z25.d, z25.d, z31.d
revh z25.d, p6/m, z25.d
saddlb z31.s, z14.h, z25.h
saddlb z28.s, z5.h, z19.h
add z28.s, z28.s, z31.s
saddlt z31.s, z14.h, z25.h
saddlt z23.s, z5.h, z19.h
add z23.s, z23.s, z31.s
saddlb z31.s, z7.h, z11.h
saddlb z27.s, z9.h, z17.h
saddlt z29.s, z9.h, z17.h
add z27.s, z27.s, z31.s
saddlt z31.s, z7.h, z11.h
add z29.s, z29.s, z31.s
revw z27.d, p6/m, z27.d
revw z29.d, p6/m, z29.d
zip1 z31.s, z28.s, z23.s
zip2 z28.s, z28.s, z23.s
zip1 z21.s, z29.s, z27.s
zip2 z29.s, z29.s, z27.s
add z31.s, z31.s, z21.s
add z29.s, z28.s, z29.s
uzp2 z28.d, z31.d, z29.d
revw z28.d, p6/m, z28.d
ptrue p5.s
uzp1 z31.d, z31.d, z29.d
ld1w {z23.s}, p7/z, [x2]
add z29.s, z28.s, z31.s
sub z31.s, z31.s, z28.s
movprfx z27, z29
mul z27.s, p7/m, z27.s, z23.s
addp z27.s, p5/m, z27.s, z27.s
add x4, sp, #0x60
ldr z3, [x4]
movprfx z28, z3
mul z28.s, p7/m, z28.s, z31.s
addp z28.s, p5/m, z28.s, z28.s
addvl x4, sp, #1
add x4, x4, #0x60
ldr z2, [x4]
mul z29.s, p7/m, z29.s, z2.s
addp z29.s, p5/m, z29.s, z29.s
addvl x4, sp, #2
add x4, x4, #0x60
ldr z1, [x4]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
ld1h {z20.h}, p7/z, [x7, x3, lsl #1]
ld1h {z15.h}, p7/z, [x9, x3, lsl #1]
ld1h {z21.h}, p7/z, [x8, x3, lsl #1]
zip1 z10.d, z15.d, z20.d
ld1h {z18.h}, p7/z, [x6, x3, lsl #1]
zip2 z15.d, z15.d, z20.d
zip1 z20.d, z21.d, z18.d
zip2 z21.d, z21.d, z18.d
zip1 z6.d, z10.d, z20.d
zip1 z8.d, z15.d, z21.d
zip2 z10.d, z10.d, z20.d
revh z8.d, p6/m, z8.d
zip2 z15.d, z15.d, z21.d
revh z15.d, p6/m, z15.d
rev z24.h, z24.h
rev z22.h, z22.h
rev z26.h, z26.h
rev z30.h, z30.h
zip1 z18.d, z26.d, z24.d
zip2 z26.d, z26.d, z24.d
zip1 z24.d, z30.d, z22.d
zip2 z30.d, z30.d, z22.d
zip1 z20.d, z18.d, z24.d
zip1 z12.d, z26.d, z30.d
zip2 z18.d, z18.d, z24.d
revh z12.d, p6/m, z12.d
zip2 z26.d, z26.d, z30.d
revh z26.d, p6/m, z26.d
saddlb z30.s, z15.h, z26.h
saddlb z22.s, z6.h, z20.h
add z22.s, z22.s, z30.s
saddlt z30.s, z15.h, z26.h
saddlt z16.s, z6.h, z20.h
add z16.s, z16.s, z30.s
saddlb z30.s, z8.h, z12.h
saddlb z21.s, z10.h, z18.h
saddlt z24.s, z8.h, z12.h
add z21.s, z21.s, z30.s
saddlt z30.s, z10.h, z18.h
add z24.s, z30.s, z24.s
revw z21.d, p6/m, z21.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z22.s, z16.s
zip2 z22.s, z22.s, z16.s
zip1 z4.s, z24.s, z21.s
zip2 z24.s, z24.s, z21.s
add z30.s, z30.s, z4.s
add z24.s, z22.s, z24.s
uzp2 z22.d, z30.d, z24.d
revw z22.d, p6/m, z22.d
uzp1 z30.d, z30.d, z24.d
add z24.s, z22.s, z30.s
sub z30.s, z30.s, z22.s
mul z23.s, p7/m, z23.s, z24.s
addp z23.s, p5/m, z23.s, z23.s
movprfx z22, z3
mul z22.s, p7/m, z22.s, z30.s
addp z22.s, p5/m, z22.s, z22.s
mul z24.s, p7/m, z24.s, z2.s
addp z24.s, p5/m, z24.s, z24.s
mul z30.s, p7/m, z30.s, z1.s
addp z30.s, p5/m, z30.s, z30.s
uzp1 z27.s, z27.s, z23.s
rshrnb z27.h, z27.s, #0xb
uzp1 z27.h, z27.h, z27.h
uzp1 z28.s, z28.s, z22.s
uzp1 z29.s, z29.s, z24.s
uzp1 z31.s, z31.s, z30.s
rshrnb z28.h, z28.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z28.h, z28.h, z28.h
uzp1 z29.h, z29.h, z29.h
rshrnb z31.h, z31.s, #0xb
sub z22.h, z5.h, z19.h
uzp1 z31.h, z31.h, z31.h
sub z21.h, z9.h, z17.h
str q27, [x1]
sub z27.h, z7.h, z11.h
str q28, [x1, #0x200]
str q29, [x1, #0x400]
str q31, [x1, #0x600]
revh z27.d, p6/m, z27.d
sub z28.h, z14.h, z25.h
revh z28.d, p6/m, z28.d
sub z24.h, z6.h, z20.h
sub z23.h, z10.h, z18.h
sub z29.h, z8.h, z12.h
revh z29.d, p6/m, z29.d
sub z30.h, z15.h, z26.h
revh z30.d, p6/m, z30.d
addvl x4, sp, #3
movi d31, #0000000000000000
ld1h {z4.h}, p7/z, [x5]
add x4, x4, #0x60
ldr z2, [x4]
movprfx z3, z31
sdot z3.d, z23.h, z2.h[0]
addvl x4, sp, #4
sdot z3.d, z24.h, z4.h[0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z3.d, z29.h, z1.h[0]
addvl x4, sp, #5
sdot z16.d, z22.h, z4.h[0]
sdot z16.d, z27.h, z1.h[0]
add x4, x4, #0x60
ldr z0, [x4]
sdot z3.d, z30.h, z0.h[0]
addvl x4, sp, #7
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z3.s
add x4, x4, #0x60
movprfx z3, z31
sdot z3.d, z23.h, z2.h[1]
rshrnb z16.h, z16.s, #0xb
sdot z3.d, z24.h, z4.h[1]
uzp1 z16.h, z16.h, z16.h
sdot z3.d, z29.h, z1.h[1]
sdot z3.d, z30.h, z0.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
sdot z16.d, z22.h, z4.h[1]
sdot z16.d, z27.h, z1.h[1]
sdot z16.d, z28.h, z0.h[1]
uzp1 z16.s, z16.s, z3.s
ldr z3, [x4]
addvl x4, sp, #6
add x4, x4, #0x60
ldr z2, [x4]
rshrnb z16.h, z16.s, #0xb
addvl x4, sp, #8
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z4.d, z24.h, z2.h[0]
addvl x4, sp, #9
sdot z4.d, z29.h, z1.h[0]
add z25.h, z14.h, z25.h
add x4, x4, #0x60
ldr z0, [x4]
sdot z4.d, z30.h, z0.h[0]
add x4, x2, #0xc0
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z1.h[0]
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[1]
sdot z4.d, z24.h, z2.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1c0
sdot z4.d, z29.h, z1.h[1]
sdot z16.d, z27.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2c0
sdot z4.d, z30.h, z0.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z0.h[1]
add x4, x2, #0x3c0
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0xe0
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1e0
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2e0
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x3e0
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x200
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x300
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x400
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z1, z31
sdot z1.d, z23.h, z2.h[0]
add x4, x2, #0x120
sdot z1.d, z24.h, z13.h[0]
sdot z1.d, z29.h, z3.h[0]
sdot z1.d, z30.h, z4.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
sdot z16.d, z22.h, z13.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z1.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z1, z31
sdot z1.d, z23.h, z2.h[1]
sdot z1.d, z24.h, z13.h[1]
sdot z1.d, z29.h, z3.h[1]
sdot z1.d, z30.h, z4.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x220
sdot z16.d, z22.h, z13.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z1.s
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x320
rshrnb z16.h, z16.s, #0xb
ld1h {z3.h}, p7/z, [x4]
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x420
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
str q16, [x1, #0x4c0]
ld1h {z4.h}, p7/z, [x4]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z0.d, z30.h, z4.h[0]
add x4, x2, #0x140
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x240
ld1h {z1.h}, p7/z, [x4]
sdot z0.d, z29.h, z3.h[1]
add x4, x2, #0x340
sdot z0.d, z30.h, z4.h[1]
sdot z16.d, z27.h, z3.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x440
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x160
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
sdot z0.d, z29.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x260
sdot z16.d, z22.h, z2.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z0.s
ld1h {z0.h}, p7/z, [x4]
rshrnb z16.h, z16.s, #0xb
add x4, x2, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z2.h}, p7/z, [x4]
movprfx z4, z31
sdot z4.d, z23.h, z0.h[0]
add x4, x2, #0x460
sdot z4.d, z24.h, z1.h[0]
ld1h {z3.h}, p7/z, [x4]
sdot z4.d, z29.h, z2.h[0]
sdot z4.d, z30.h, z3.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[0]
sdot z16.d, z22.h, z1.h[0]
sdot z16.d, z27.h, z2.h[0]
sdot z16.d, z28.h, z3.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[1]
sdot z16.d, z22.h, z1.h[1]
sdot z16.d, z27.h, z2.h[1]
sdot z16.d, z28.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z0.h[1]
sdot z28.d, z24.h, z1.h[1]
sdot z28.d, z29.h, z2.h[1]
sdot z28.d, z30.h, z3.h[1]
add z19.h, z19.h, z5.h
add z17.h, z17.h, z9.h
sub z29.h, z19.h, z25.h
add z11.h, z7.h, z11.h
add z26.h, z15.h, z26.h
add z20.h, z20.h, z6.h
ld1h {z15.h}, p7/z, [x4]
sub z27.h, z20.h, z26.h
add x4, x2, #0x500
add z18.h, z18.h, z10.h
ld1h {z14.h}, p7/z, [x4]
add z12.h, z8.h, z12.h
uzp1 z16.s, z16.s, z28.s
sub z24.h, z18.h, z12.h
sub z28.h, z17.h, z11.h
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4a0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x80]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x520
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x180]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4c0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x280]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x540
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x380]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4e0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x480]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x560
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x580]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
rshrnb z16.h, z16.s, #0xb
add z19.h, z19.h, z25.h
uzp1 z16.h, z16.h, z16.h
add z17.h, z17.h, z11.h
str q30, [x1, #0x680]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z24.h, z14.h[1]
sdot z29.d, z27.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
str q30, [x1, #0x780]
str q16, [x1, #0x7c0]
revh z17.d, p6/m, z17.d
sub z19.h, z19.h, z17.h
add z20.h, z20.h, z26.h
add z18.h, z18.h, z12.h
revh z18.d, p6/m, z18.d
sub z20.h, z20.h, z18.h
add x4, x2, #0x580
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
movprfx z29, z31
sdot z29.d, z20.h, z15.h[1]
str q30, [x1, #0x100]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x5a0
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
str q30, [x1, #0x300]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x3, x3, #0x100
str q30, [x1, #0x500]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
sdot z31.d, z20.h, z15.h[1]
uzp1 z31.s, z30.s, z31.s
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x700]
add x1, x1, #0x10
cmp x3, #0x400
ld1h {z23.h}, p7/z, [x11, x3, lsl #1]
ld1h {z14.h}, p7/z, [x0, x3, lsl #1]
ld1h {z29.h}, p7/z, [x12, x3, lsl #1]
zip1 z9.d, z14.d, z23.d
ld1h {z21.h}, p7/z, [x10, x3, lsl #1]
zip2 z14.d, z14.d, z23.d
ld1h {z25.h}, p7/z, [x19, x3, lsl #1]
zip1 z23.d, z29.d, z21.d
ld1h {z31.h}, p7/z, [x30, x3, lsl #1]
zip2 z29.d, z29.d, z21.d
zip1 z5.d, z9.d, z23.d
ld1h {z27.h}, p7/z, [x18, x3, lsl #1]
ld1h {z28.h}, p7/z, [x17, x3, lsl #1]
ld1h {z26.h}, p7/z, [x16, x3, lsl #1]
ld1h {z30.h}, p7/z, [x15, x3, lsl #1]
ld1h {z24.h}, p7/z, [x14, x3, lsl #1]
ld1h {z22.h}, p7/z, [x13, x3, lsl #1]
zip2 z9.d, z9.d, z23.d
zip1 z7.d, z14.d, z29.d
ptrue p6.d
revh z7.d, p6/m, z7.d
zip2 z14.d, z14.d, z29.d
revh z14.d, p6/m, z14.d
rev z27.h, z27.h
rev z29.h, z28.h
rev z25.h, z25.h
rev z31.h, z31.h
zip1 z17.d, z25.d, z27.d
zip1 z28.d, z31.d, z29.d
zip2 z25.d, z25.d, z27.d
zip2 z31.d, z31.d, z29.d
zip1 z19.d, z17.d, z28.d
zip1 z11.d, z25.d, z31.d
zip2 z17.d, z17.d, z28.d
revh z11.d, p6/m, z11.d
zip2 z25.d, z25.d, z31.d
revh z25.d, p6/m, z25.d
saddlb z31.s, z14.h, z25.h
saddlb z28.s, z5.h, z19.h
add z28.s, z28.s, z31.s
saddlt z31.s, z14.h, z25.h
saddlt z23.s, z5.h, z19.h
add z23.s, z23.s, z31.s
saddlb z31.s, z7.h, z11.h
saddlb z27.s, z9.h, z17.h
saddlt z29.s, z9.h, z17.h
add z27.s, z27.s, z31.s
saddlt z31.s, z7.h, z11.h
add z29.s, z29.s, z31.s
revw z27.d, p6/m, z27.d
revw z29.d, p6/m, z29.d
zip1 z31.s, z28.s, z23.s
zip2 z28.s, z28.s, z23.s
zip1 z21.s, z29.s, z27.s
zip2 z29.s, z29.s, z27.s
add z31.s, z31.s, z21.s
add z29.s, z28.s, z29.s
uzp2 z28.d, z31.d, z29.d
revw z28.d, p6/m, z28.d
ptrue p5.s
uzp1 z31.d, z31.d, z29.d
ld1w {z23.s}, p7/z, [x2]
add z29.s, z28.s, z31.s
sub z31.s, z31.s, z28.s
movprfx z27, z29
mul z27.s, p7/m, z27.s, z23.s
addp z27.s, p5/m, z27.s, z27.s
add x4, sp, #0x60
ldr z3, [x4]
movprfx z28, z3
mul z28.s, p7/m, z28.s, z31.s
addp z28.s, p5/m, z28.s, z28.s
addvl x4, sp, #1
add x4, x4, #0x60
ldr z2, [x4]
mul z29.s, p7/m, z29.s, z2.s
addp z29.s, p5/m, z29.s, z29.s
addvl x4, sp, #2
add x4, x4, #0x60
ldr z1, [x4]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
ld1h {z20.h}, p7/z, [x7, x3, lsl #1]
ld1h {z15.h}, p7/z, [x9, x3, lsl #1]
ld1h {z21.h}, p7/z, [x8, x3, lsl #1]
zip1 z10.d, z15.d, z20.d
ld1h {z18.h}, p7/z, [x6, x3, lsl #1]
zip2 z15.d, z15.d, z20.d
zip1 z20.d, z21.d, z18.d
zip2 z21.d, z21.d, z18.d
zip1 z6.d, z10.d, z20.d
zip1 z8.d, z15.d, z21.d
zip2 z10.d, z10.d, z20.d
revh z8.d, p6/m, z8.d
zip2 z15.d, z15.d, z21.d
revh z15.d, p6/m, z15.d
rev z24.h, z24.h
rev z22.h, z22.h
rev z26.h, z26.h
rev z30.h, z30.h
zip1 z18.d, z26.d, z24.d
zip2 z26.d, z26.d, z24.d
zip1 z24.d, z30.d, z22.d
zip2 z30.d, z30.d, z22.d
zip1 z20.d, z18.d, z24.d
zip1 z12.d, z26.d, z30.d
zip2 z18.d, z18.d, z24.d
revh z12.d, p6/m, z12.d
zip2 z26.d, z26.d, z30.d
revh z26.d, p6/m, z26.d
saddlb z30.s, z15.h, z26.h
saddlb z22.s, z6.h, z20.h
add z22.s, z22.s, z30.s
saddlt z30.s, z15.h, z26.h
saddlt z16.s, z6.h, z20.h
add z16.s, z16.s, z30.s
saddlb z30.s, z8.h, z12.h
saddlb z21.s, z10.h, z18.h
saddlt z24.s, z8.h, z12.h
add z21.s, z21.s, z30.s
saddlt z30.s, z10.h, z18.h
add z24.s, z30.s, z24.s
revw z21.d, p6/m, z21.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z22.s, z16.s
zip2 z22.s, z22.s, z16.s
zip1 z4.s, z24.s, z21.s
zip2 z24.s, z24.s, z21.s
add z30.s, z30.s, z4.s
add z24.s, z22.s, z24.s
uzp2 z22.d, z30.d, z24.d
revw z22.d, p6/m, z22.d
uzp1 z30.d, z30.d, z24.d
add z24.s, z22.s, z30.s
sub z30.s, z30.s, z22.s
mul z23.s, p7/m, z23.s, z24.s
addp z23.s, p5/m, z23.s, z23.s
movprfx z22, z3
mul z22.s, p7/m, z22.s, z30.s
addp z22.s, p5/m, z22.s, z22.s
mul z24.s, p7/m, z24.s, z2.s
addp z24.s, p5/m, z24.s, z24.s
mul z30.s, p7/m, z30.s, z1.s
addp z30.s, p5/m, z30.s, z30.s
uzp1 z27.s, z27.s, z23.s
rshrnb z27.h, z27.s, #0xb
uzp1 z27.h, z27.h, z27.h
uzp1 z28.s, z28.s, z22.s
uzp1 z29.s, z29.s, z24.s
uzp1 z31.s, z31.s, z30.s
rshrnb z28.h, z28.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z28.h, z28.h, z28.h
uzp1 z29.h, z29.h, z29.h
rshrnb z31.h, z31.s, #0xb
sub z22.h, z5.h, z19.h
uzp1 z31.h, z31.h, z31.h
sub z21.h, z9.h, z17.h
str q27, [x1]
sub z27.h, z7.h, z11.h
str q28, [x1, #0x200]
str q29, [x1, #0x400]
str q31, [x1, #0x600]
revh z27.d, p6/m, z27.d
sub z28.h, z14.h, z25.h
revh z28.d, p6/m, z28.d
sub z24.h, z6.h, z20.h
sub z23.h, z10.h, z18.h
sub z29.h, z8.h, z12.h
revh z29.d, p6/m, z29.d
sub z30.h, z15.h, z26.h
revh z30.d, p6/m, z30.d
addvl x4, sp, #3
movi d31, #0000000000000000
ld1h {z4.h}, p7/z, [x5]
add x4, x4, #0x60
ldr z2, [x4]
movprfx z3, z31
sdot z3.d, z23.h, z2.h[0]
addvl x4, sp, #4
sdot z3.d, z24.h, z4.h[0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z3.d, z29.h, z1.h[0]
addvl x4, sp, #5
sdot z16.d, z22.h, z4.h[0]
sdot z16.d, z27.h, z1.h[0]
add x4, x4, #0x60
ldr z0, [x4]
sdot z3.d, z30.h, z0.h[0]
addvl x4, sp, #7
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z3.s
add x4, x4, #0x60
movprfx z3, z31
sdot z3.d, z23.h, z2.h[1]
rshrnb z16.h, z16.s, #0xb
sdot z3.d, z24.h, z4.h[1]
uzp1 z16.h, z16.h, z16.h
sdot z3.d, z29.h, z1.h[1]
sdot z3.d, z30.h, z0.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
sdot z16.d, z22.h, z4.h[1]
sdot z16.d, z27.h, z1.h[1]
sdot z16.d, z28.h, z0.h[1]
uzp1 z16.s, z16.s, z3.s
ldr z3, [x4]
addvl x4, sp, #6
add x4, x4, #0x60
ldr z2, [x4]
rshrnb z16.h, z16.s, #0xb
addvl x4, sp, #8
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z4.d, z24.h, z2.h[0]
addvl x4, sp, #9
sdot z4.d, z29.h, z1.h[0]
add z25.h, z14.h, z25.h
add x4, x4, #0x60
ldr z0, [x4]
sdot z4.d, z30.h, z0.h[0]
add x4, x2, #0xc0
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z1.h[0]
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[1]
sdot z4.d, z24.h, z2.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1c0
sdot z4.d, z29.h, z1.h[1]
sdot z16.d, z27.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2c0
sdot z4.d, z30.h, z0.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z0.h[1]
add x4, x2, #0x3c0
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0xe0
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1e0
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2e0
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x3e0
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x200
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x300
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x400
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z1, z31
sdot z1.d, z23.h, z2.h[0]
add x4, x2, #0x120
sdot z1.d, z24.h, z13.h[0]
sdot z1.d, z29.h, z3.h[0]
sdot z1.d, z30.h, z4.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
sdot z16.d, z22.h, z13.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z1.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z1, z31
sdot z1.d, z23.h, z2.h[1]
sdot z1.d, z24.h, z13.h[1]
sdot z1.d, z29.h, z3.h[1]
sdot z1.d, z30.h, z4.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x220
sdot z16.d, z22.h, z13.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z1.s
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x320
rshrnb z16.h, z16.s, #0xb
ld1h {z3.h}, p7/z, [x4]
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x420
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
str q16, [x1, #0x4c0]
ld1h {z4.h}, p7/z, [x4]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z0.d, z30.h, z4.h[0]
add x4, x2, #0x140
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x240
ld1h {z1.h}, p7/z, [x4]
sdot z0.d, z29.h, z3.h[1]
add x4, x2, #0x340
sdot z0.d, z30.h, z4.h[1]
sdot z16.d, z27.h, z3.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x440
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x160
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
sdot z0.d, z29.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x260
sdot z16.d, z22.h, z2.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z0.s
ld1h {z0.h}, p7/z, [x4]
rshrnb z16.h, z16.s, #0xb
add x4, x2, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z2.h}, p7/z, [x4]
movprfx z4, z31
sdot z4.d, z23.h, z0.h[0]
add x4, x2, #0x460
sdot z4.d, z24.h, z1.h[0]
ld1h {z3.h}, p7/z, [x4]
sdot z4.d, z29.h, z2.h[0]
sdot z4.d, z30.h, z3.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[0]
sdot z16.d, z22.h, z1.h[0]
sdot z16.d, z27.h, z2.h[0]
sdot z16.d, z28.h, z3.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[1]
sdot z16.d, z22.h, z1.h[1]
sdot z16.d, z27.h, z2.h[1]
sdot z16.d, z28.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z0.h[1]
sdot z28.d, z24.h, z1.h[1]
sdot z28.d, z29.h, z2.h[1]
sdot z28.d, z30.h, z3.h[1]
add z19.h, z19.h, z5.h
add z17.h, z17.h, z9.h
sub z29.h, z19.h, z25.h
add z11.h, z7.h, z11.h
add z26.h, z15.h, z26.h
add z20.h, z20.h, z6.h
ld1h {z15.h}, p7/z, [x4]
sub z27.h, z20.h, z26.h
add x4, x2, #0x500
add z18.h, z18.h, z10.h
ld1h {z14.h}, p7/z, [x4]
add z12.h, z8.h, z12.h
uzp1 z16.s, z16.s, z28.s
sub z24.h, z18.h, z12.h
sub z28.h, z17.h, z11.h
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4a0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x80]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x520
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x180]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4c0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x280]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x540
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x380]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4e0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x480]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x560
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x580]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
rshrnb z16.h, z16.s, #0xb
add z19.h, z19.h, z25.h
uzp1 z16.h, z16.h, z16.h
add z17.h, z17.h, z11.h
str q30, [x1, #0x680]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z24.h, z14.h[1]
sdot z29.d, z27.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
str q30, [x1, #0x780]
str q16, [x1, #0x7c0]
revh z17.d, p6/m, z17.d
sub z19.h, z19.h, z17.h
add z20.h, z20.h, z26.h
add z18.h, z18.h, z12.h
revh z18.d, p6/m, z18.d
sub z20.h, z20.h, z18.h
add x4, x2, #0x580
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
movprfx z29, z31
sdot z29.d, z20.h, z15.h[1]
str q30, [x1, #0x100]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x5a0
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
str q30, [x1, #0x300]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x3, x3, #0x100
str q30, [x1, #0x500]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
sdot z31.d, z20.h, z15.h[1]
uzp1 z31.s, z30.s, z31.s
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x700]
add x1, x1, #0x10
cmp x3, #0x400
ld1h {z23.h}, p7/z, [x11, x3, lsl #1]
ld1h {z14.h}, p7/z, [x0, x3, lsl #1]
ld1h {z29.h}, p7/z, [x12, x3, lsl #1]
zip1 z9.d, z14.d, z23.d
ld1h {z21.h}, p7/z, [x10, x3, lsl #1]
zip2 z14.d, z14.d, z23.d
ld1h {z25.h}, p7/z, [x19, x3, lsl #1]
zip1 z23.d, z29.d, z21.d
ld1h {z31.h}, p7/z, [x30, x3, lsl #1]
zip2 z29.d, z29.d, z21.d
zip1 z5.d, z9.d, z23.d
ld1h {z27.h}, p7/z, [x18, x3, lsl #1]
ld1h {z28.h}, p7/z, [x17, x3, lsl #1]
ld1h {z26.h}, p7/z, [x16, x3, lsl #1]
ld1h {z30.h}, p7/z, [x15, x3, lsl #1]
ld1h {z24.h}, p7/z, [x14, x3, lsl #1]
ld1h {z22.h}, p7/z, [x13, x3, lsl #1]
zip2 z9.d, z9.d, z23.d
zip1 z7.d, z14.d, z29.d
ptrue p6.d
revh z7.d, p6/m, z7.d
zip2 z14.d, z14.d, z29.d
revh z14.d, p6/m, z14.d
rev z27.h, z27.h
rev z29.h, z28.h
rev z25.h, z25.h
rev z31.h, z31.h
zip1 z17.d, z25.d, z27.d
zip1 z28.d, z31.d, z29.d
zip2 z25.d, z25.d, z27.d
zip2 z31.d, z31.d, z29.d
zip1 z19.d, z17.d, z28.d
zip1 z11.d, z25.d, z31.d
zip2 z17.d, z17.d, z28.d
revh z11.d, p6/m, z11.d
zip2 z25.d, z25.d, z31.d
revh z25.d, p6/m, z25.d
saddlb z31.s, z14.h, z25.h
saddlb z28.s, z5.h, z19.h
add z28.s, z28.s, z31.s
saddlt z31.s, z14.h, z25.h
saddlt z23.s, z5.h, z19.h
add z23.s, z23.s, z31.s
saddlb z31.s, z7.h, z11.h
saddlb z27.s, z9.h, z17.h
saddlt z29.s, z9.h, z17.h
add z27.s, z27.s, z31.s
saddlt z31.s, z7.h, z11.h
add z29.s, z29.s, z31.s
revw z27.d, p6/m, z27.d
revw z29.d, p6/m, z29.d
zip1 z31.s, z28.s, z23.s
zip2 z28.s, z28.s, z23.s
zip1 z21.s, z29.s, z27.s
zip2 z29.s, z29.s, z27.s
add z31.s, z31.s, z21.s
add z29.s, z28.s, z29.s
uzp2 z28.d, z31.d, z29.d
revw z28.d, p6/m, z28.d
ptrue p5.s
uzp1 z31.d, z31.d, z29.d
ld1w {z23.s}, p7/z, [x2]
add z29.s, z28.s, z31.s
sub z31.s, z31.s, z28.s
movprfx z27, z29
mul z27.s, p7/m, z27.s, z23.s
addp z27.s, p5/m, z27.s, z27.s
add x4, sp, #0x60
ldr z3, [x4]
movprfx z28, z3
mul z28.s, p7/m, z28.s, z31.s
addp z28.s, p5/m, z28.s, z28.s
addvl x4, sp, #1
add x4, x4, #0x60
ldr z2, [x4]
mul z29.s, p7/m, z29.s, z2.s
addp z29.s, p5/m, z29.s, z29.s
addvl x4, sp, #2
add x4, x4, #0x60
ldr z1, [x4]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
ld1h {z20.h}, p7/z, [x7, x3, lsl #1]
ld1h {z15.h}, p7/z, [x9, x3, lsl #1]
ld1h {z21.h}, p7/z, [x8, x3, lsl #1]
zip1 z10.d, z15.d, z20.d
ld1h {z18.h}, p7/z, [x6, x3, lsl #1]
zip2 z15.d, z15.d, z20.d
zip1 z20.d, z21.d, z18.d
zip2 z21.d, z21.d, z18.d
zip1 z6.d, z10.d, z20.d
zip1 z8.d, z15.d, z21.d
zip2 z10.d, z10.d, z20.d
revh z8.d, p6/m, z8.d
zip2 z15.d, z15.d, z21.d
revh z15.d, p6/m, z15.d
rev z24.h, z24.h
rev z22.h, z22.h
rev z26.h, z26.h
rev z30.h, z30.h
zip1 z18.d, z26.d, z24.d
zip2 z26.d, z26.d, z24.d
zip1 z24.d, z30.d, z22.d
zip2 z30.d, z30.d, z22.d
zip1 z20.d, z18.d, z24.d
zip1 z12.d, z26.d, z30.d
zip2 z18.d, z18.d, z24.d
revh z12.d, p6/m, z12.d
zip2 z26.d, z26.d, z30.d
revh z26.d, p6/m, z26.d
saddlb z30.s, z15.h, z26.h
saddlb z22.s, z6.h, z20.h
add z22.s, z22.s, z30.s
saddlt z30.s, z15.h, z26.h
saddlt z16.s, z6.h, z20.h
add z16.s, z16.s, z30.s
saddlb z30.s, z8.h, z12.h
saddlb z21.s, z10.h, z18.h
saddlt z24.s, z8.h, z12.h
add z21.s, z21.s, z30.s
saddlt z30.s, z10.h, z18.h
add z24.s, z30.s, z24.s
revw z21.d, p6/m, z21.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z22.s, z16.s
zip2 z22.s, z22.s, z16.s
zip1 z4.s, z24.s, z21.s
zip2 z24.s, z24.s, z21.s
add z30.s, z30.s, z4.s
add z24.s, z22.s, z24.s
uzp2 z22.d, z30.d, z24.d
revw z22.d, p6/m, z22.d
uzp1 z30.d, z30.d, z24.d
add z24.s, z22.s, z30.s
sub z30.s, z30.s, z22.s
mul z23.s, p7/m, z23.s, z24.s
addp z23.s, p5/m, z23.s, z23.s
movprfx z22, z3
mul z22.s, p7/m, z22.s, z30.s
addp z22.s, p5/m, z22.s, z22.s
mul z24.s, p7/m, z24.s, z2.s
addp z24.s, p5/m, z24.s, z24.s
mul z30.s, p7/m, z30.s, z1.s
addp z30.s, p5/m, z30.s, z30.s
uzp1 z27.s, z27.s, z23.s
rshrnb z27.h, z27.s, #0xb
uzp1 z27.h, z27.h, z27.h
uzp1 z28.s, z28.s, z22.s
uzp1 z29.s, z29.s, z24.s
uzp1 z31.s, z31.s, z30.s
rshrnb z28.h, z28.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z28.h, z28.h, z28.h
uzp1 z29.h, z29.h, z29.h
rshrnb z31.h, z31.s, #0xb
sub z22.h, z5.h, z19.h
uzp1 z31.h, z31.h, z31.h
sub z21.h, z9.h, z17.h
str q27, [x1]
sub z27.h, z7.h, z11.h
str q28, [x1, #0x200]
str q29, [x1, #0x400]
str q31, [x1, #0x600]
revh z27.d, p6/m, z27.d
sub z28.h, z14.h, z25.h
revh z28.d, p6/m, z28.d
sub z24.h, z6.h, z20.h
sub z23.h, z10.h, z18.h
sub z29.h, z8.h, z12.h
revh z29.d, p6/m, z29.d
sub z30.h, z15.h, z26.h
revh z30.d, p6/m, z30.d
addvl x4, sp, #3
movi d31, #0000000000000000
ld1h {z4.h}, p7/z, [x5]
add x4, x4, #0x60
ldr z2, [x4]
movprfx z3, z31
sdot z3.d, z23.h, z2.h[0]
addvl x4, sp, #4
sdot z3.d, z24.h, z4.h[0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z3.d, z29.h, z1.h[0]
addvl x4, sp, #5
sdot z16.d, z22.h, z4.h[0]
sdot z16.d, z27.h, z1.h[0]
add x4, x4, #0x60
ldr z0, [x4]
sdot z3.d, z30.h, z0.h[0]
addvl x4, sp, #7
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z3.s
add x4, x4, #0x60
movprfx z3, z31
sdot z3.d, z23.h, z2.h[1]
rshrnb z16.h, z16.s, #0xb
sdot z3.d, z24.h, z4.h[1]
uzp1 z16.h, z16.h, z16.h
sdot z3.d, z29.h, z1.h[1]
sdot z3.d, z30.h, z0.h[1]
str q16, [x1, #0x40]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
sdot z16.d, z22.h, z4.h[1]
sdot z16.d, z27.h, z1.h[1]
sdot z16.d, z28.h, z0.h[1]
uzp1 z16.s, z16.s, z3.s
ldr z3, [x4]
addvl x4, sp, #6
add x4, x4, #0x60
ldr z2, [x4]
rshrnb z16.h, z16.s, #0xb
addvl x4, sp, #8
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[0]
add x4, x4, #0x60
ldr z1, [x4]
sdot z4.d, z24.h, z2.h[0]
addvl x4, sp, #9
sdot z4.d, z29.h, z1.h[0]
add z25.h, z14.h, z25.h
add x4, x4, #0x60
ldr z0, [x4]
sdot z4.d, z30.h, z0.h[0]
add x4, x2, #0xc0
str q16, [x1, #0xc0]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z1.h[0]
sdot z16.d, z28.h, z0.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z4, z31
sdot z4.d, z23.h, z3.h[1]
sdot z4.d, z24.h, z2.h[1]
str q16, [x1, #0x140]
movprfx z16, z31
sdot z16.d, z21.h, z3.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1c0
sdot z4.d, z29.h, z1.h[1]
sdot z16.d, z27.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2c0
sdot z4.d, z30.h, z0.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z0.h[1]
add x4, x2, #0x3c0
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0xe0
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x1c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x240]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x1e0
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x2e0
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x3e0
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x200
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x2c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x340]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x300
sdot z0.d, z29.h, z3.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x400
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z1, z31
sdot z1.d, z23.h, z2.h[0]
add x4, x2, #0x120
sdot z1.d, z24.h, z13.h[0]
sdot z1.d, z29.h, z3.h[0]
sdot z1.d, z30.h, z4.h[0]
str q16, [x1, #0x3c0]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[0]
sdot z16.d, z22.h, z13.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z1.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z1, z31
sdot z1.d, z23.h, z2.h[1]
sdot z1.d, z24.h, z13.h[1]
sdot z1.d, z29.h, z3.h[1]
sdot z1.d, z30.h, z4.h[1]
str q16, [x1, #0x440]
movprfx z16, z31
sdot z16.d, z21.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x220
sdot z16.d, z22.h, z13.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z1.s
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x320
rshrnb z16.h, z16.s, #0xb
ld1h {z3.h}, p7/z, [x4]
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x420
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
str q16, [x1, #0x4c0]
ld1h {z4.h}, p7/z, [x4]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z0.d, z30.h, z4.h[0]
add x4, x2, #0x140
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
str q16, [x1, #0x540]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
sdot z16.d, z22.h, z2.h[1]
ld1h {z2.h}, p7/z, [x4]
add x4, x2, #0x240
ld1h {z1.h}, p7/z, [x4]
sdot z0.d, z29.h, z3.h[1]
add x4, x2, #0x340
sdot z0.d, z30.h, z4.h[1]
sdot z16.d, z27.h, z3.h[1]
ld1h {z3.h}, p7/z, [x4]
sdot z16.d, z28.h, z4.h[1]
add x4, x2, #0x440
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
ld1h {z4.h}, p7/z, [x4]
movprfx z0, z31
sdot z0.d, z23.h, z1.h[0]
add x4, x2, #0x160
sdot z0.d, z24.h, z2.h[0]
sdot z0.d, z29.h, z3.h[0]
sdot z0.d, z30.h, z4.h[0]
str q16, [x1, #0x5c0]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[0]
sdot z16.d, z22.h, z2.h[0]
sdot z16.d, z27.h, z3.h[0]
sdot z16.d, z28.h, z4.h[0]
uzp1 z16.s, z16.s, z0.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
movprfx z0, z31
sdot z0.d, z23.h, z1.h[1]
sdot z0.d, z24.h, z2.h[1]
sdot z0.d, z29.h, z3.h[1]
sdot z0.d, z30.h, z4.h[1]
str q16, [x1, #0x640]
movprfx z16, z31
sdot z16.d, z21.h, z1.h[1]
ld1h {z1.h}, p7/z, [x4]
add x4, x2, #0x260
sdot z16.d, z22.h, z2.h[1]
sdot z16.d, z27.h, z3.h[1]
sdot z16.d, z28.h, z4.h[1]
uzp1 z16.s, z16.s, z0.s
ld1h {z0.h}, p7/z, [x4]
rshrnb z16.h, z16.s, #0xb
add x4, x2, #0x360
uzp1 z16.h, z16.h, z16.h
ld1h {z2.h}, p7/z, [x4]
movprfx z4, z31
sdot z4.d, z23.h, z0.h[0]
add x4, x2, #0x460
sdot z4.d, z24.h, z1.h[0]
ld1h {z3.h}, p7/z, [x4]
sdot z4.d, z29.h, z2.h[0]
sdot z4.d, z30.h, z3.h[0]
str q16, [x1, #0x6c0]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[0]
sdot z16.d, z22.h, z1.h[0]
sdot z16.d, z27.h, z2.h[0]
sdot z16.d, z28.h, z3.h[0]
uzp1 z16.s, z16.s, z4.s
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
add x4, x2, #0x480
str q16, [x1, #0x740]
movprfx z16, z31
sdot z16.d, z21.h, z0.h[1]
sdot z16.d, z22.h, z1.h[1]
sdot z16.d, z27.h, z2.h[1]
sdot z16.d, z28.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z0.h[1]
sdot z28.d, z24.h, z1.h[1]
sdot z28.d, z29.h, z2.h[1]
sdot z28.d, z30.h, z3.h[1]
add z19.h, z19.h, z5.h
add z17.h, z17.h, z9.h
sub z29.h, z19.h, z25.h
add z11.h, z7.h, z11.h
add z26.h, z15.h, z26.h
add z20.h, z20.h, z6.h
ld1h {z15.h}, p7/z, [x4]
sub z27.h, z20.h, z26.h
add x4, x2, #0x500
add z18.h, z18.h, z10.h
ld1h {z14.h}, p7/z, [x4]
add z12.h, z8.h, z12.h
uzp1 z16.s, z16.s, z28.s
sub z24.h, z18.h, z12.h
sub z28.h, z17.h, z11.h
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4a0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x80]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x520
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x180]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4c0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x280]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x540
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x380]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x4e0
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z27.h, z15.h[1]
str q30, [x1, #0x480]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
ld1h {z15.h}, p7/z, [x4]
add x4, x2, #0x560
ld1h {z14.h}, p7/z, [x4]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[0]
sdot z23.d, z27.h, z15.h[0]
str q30, [x1, #0x580]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[0]
sdot z30.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
rshrnb z16.h, z16.s, #0xb
add z19.h, z19.h, z25.h
uzp1 z16.h, z16.h, z16.h
add z17.h, z17.h, z11.h
str q30, [x1, #0x680]
movprfx z30, z31
sdot z30.d, z28.h, z14.h[1]
sdot z30.d, z29.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z24.h, z14.h[1]
sdot z29.d, z27.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
str q30, [x1, #0x780]
str q16, [x1, #0x7c0]
revh z17.d, p6/m, z17.d
sub z19.h, z19.h, z17.h
add z20.h, z20.h, z26.h
add z18.h, z18.h, z12.h
revh z18.d, p6/m, z18.d
sub z20.h, z20.h, z18.h
add x4, x2, #0x580
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
movprfx z29, z31
sdot z29.d, z20.h, z15.h[1]
str q30, [x1, #0x100]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x4, x2, #0x5a0
ld1h {z15.h}, p7/z, [x4]
movprfx z29, z31
sdot z29.d, z20.h, z15.h[0]
str q30, [x1, #0x300]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[0]
uzp1 z30.s, z30.s, z29.s
rshrnb z30.h, z30.s, #0xb
uzp1 z30.h, z30.h, z30.h
add x3, x3, #0x100
str q30, [x1, #0x500]
movprfx z30, z31
sdot z30.d, z19.h, z15.h[1]
sdot z31.d, z20.h, z15.h[1]
uzp1 z31.s, z30.s, z31.s
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z31.h, z31.h
str q31, [x1, #0x700]
add x1, x1, #0x10
cmp x3, #0x400
ldr x19, [sp, #0x10]
ldp x29, x30, [sp]
ldp d8, d9, [sp, #0x20]
ldp d10, d11, [sp, #0x30]
ldp d12, d13, [sp, #0x40]
ldp d14, d15, [sp, #0x50]
addvl sp, sp, #0xa
add sp, sp, #0x60
ldp x29, x30, [sp]
add sp, sp, #0x810
stp x29, x30, [sp, #-0x20]!
