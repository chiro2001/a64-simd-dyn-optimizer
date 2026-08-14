.arch armv8.2-a+sve2
.text
sub sp, sp, #0x820
stp x29, x30, [sp]
mov x29, sp
str x19, [sp, #0x10]
mov x19, x1
add x1, sp, #0x20
addvl sp, sp, #0xffffffffffffffe2
adrp x3, #0x457000
ptrue p7.b
sub sp, sp, #0x70
add x3, x3, #0xeb0
add x11, x3, #0x20
add x5, x2, x2, lsl #1
add x7, x2, x2, lsl #2
lsl x18, x2, #3
stp x29, x30, [sp]
mov x29, sp
lsl x8, x2, #4
ld1w {z31.s}, p7/z, [x11]
addvl x11, sp, #1
stp x19, x20, [sp, #0x10]
add x11, x11, #0x70
sub x9, x18, x2
str x21, [sp, #0x20]
add x10, x18, x2
stp d8, d9, [sp, #0x30]
sub x8, x8, x2
add x17, x0, x5, lsl #1
stp d10, d11, [sp, #0x40]
add x16, x0, x7, lsl #1
add x15, x0, x5, lsl #2
stp d12, d13, [sp, #0x50]
add x13, x0, x7, lsl #2
add x12, x0, x5, lsl #3
stp d14, d15, [sp, #0x60]
add x7, x2, x7, lsl #1
str z31, [x11]
add x11, x3, #0x40
ld1w {z31.s}, p7/z, [x11]
addvl x11, sp, #2
add x5, x2, x5, lsl #2
add x11, x11, #0x70
str z31, [x11]
lsl x4, x2, #5
add x11, x3, #0x60
ld1w {z31.s}, p7/z, [x11]
add x19, x0, x2, lsl #1
add x11, sp, #0x70
str z31, [x11]
add x30, x0, x2, lsl #2
add x11, x3, #0xa0
ld1h {z31.h}, p7/z, [x11]
add x2, x0, x2, lsl #3
addvl x11, sp, #0x16
add x14, x0, x9, lsl #1
add x11, x11, #0x70
str z31, [x11]
add x10, x0, x10, lsl #1
add x11, x3, #0xc0
ld1h {z31.h}, p7/z, [x11]
add x7, x0, x7, lsl #1
addvl x11, sp, #0x17
add x5, x0, x5, lsl #1
add x11, x11, #0x70
str z31, [x11]
add x9, x0, x9, lsl #2
add x11, x3, #0xe0
ld1h {z31.h}, p7/z, [x11]
add x8, x0, x8, lsl #1
addvl x11, sp, #0x18
add x20, x1, #0x40
add x11, x11, #0x70
str z31, [x11]
add x18, x18, x2
add x11, x3, #0x100
ld1h {z31.h}, p7/z, [x11]
add x21, x3, #0x80
addvl x11, sp, #0x19
mov x6, #0
add x11, x11, #0x70
str z31, [x11]
add x11, x3, #0x120
ld1h {z31.h}, p7/z, [x11]
addvl x11, sp, #0x1a
add x11, x11, #0x70
str z31, [x11]
add x11, x3, #0x140
ld1h {z31.h}, p7/z, [x11]
addvl x11, sp, #0x1b
add x11, x11, #0x70
str z31, [x11]
add x11, x3, #0x160
ld1h {z31.h}, p7/z, [x11]
addvl x11, sp, #0x1c
add x11, x11, #0x70
str z31, [x11]
add x11, x3, #0x180
ld1h {z31.h}, p7/z, [x11]
addvl x11, sp, #0x1d
add x11, x11, #0x70
str z31, [x11]
add x11, x0, x6
ld1h {z31.h}, p7/z, [x11]
ld1h {z24.h}, p7/z, [x17]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x19, x6
ld1h {z29.h}, p7/z, [x11]
sub z12.h, z31.h, z30.h
add x11, x11, #0x20
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x30, x6
rev z30.h, z30.h
ld1h {z22.h}, p7/z, [x11]
add x11, x11, #0x20
sub z11.h, z29.h, z30.h
add z29.h, z29.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0xe
rev z30.h, z30.h
add x11, x11, #0x70
sub z25.h, z22.h, z30.h
str z25, [x11]
add x11, x17, #0x20
add z22.h, z22.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0xf
rev z30.h, z30.h
sub z23.h, z24.h, z30.h
add x11, x11, #0x70
str z23, [x11]
add z24.h, z24.h, z30.h
add x11, x2, x6
ld1h {z28.h}, p7/z, [x11]
ld1h {z26.h}, p7/z, [x16]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x16, #0x20
sub z14.h, z28.h, z30.h
add z28.h, z28.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x15, #0x20
rev z30.h, z30.h
sub z13.h, z26.h, z30.h
add z26.h, z26.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x10
ld1h {z18.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z20.h, z18.h, z30.h
str z20, [x11]
add x11, x14, #0x20
add z18.h, z18.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x18, x6
rev z30.h, z30.h
ld1h {z27.h}, p7/z, [x11]
add x11, x11, #0x20
ld1h {z20.h}, p7/z, [x14]
sub z6.h, z20.h, z30.h
add z20.h, z20.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x11
add x11, x11, #0x70
rev z30.h, z30.h
sub z21.h, z27.h, z30.h
str z21, [x11]
add x11, x10, #0x20
add z27.h, z27.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x12
ld1h {z25.h}, p7/z, [x10]
add x11, x11, #0x70
rev z30.h, z30.h
sub z19.h, z25.h, z30.h
str z19, [x11]
add x11, x13, #0x20
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
ld1h {z0.h}, p7/z, [x13]
add x11, x11, #0x70
rev z30.h, z30.h
sub z17.h, z0.h, z30.h
str z17, [x11]
add x11, x7, #0x20
add z0.h, z0.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x12, #0x20
rev z30.h, z30.h
ld1h {z23.h}, p7/z, [x11]
add x11, x5, #0x20
rev z23.h, z23.h
ld1h {z1.h}, p7/z, [x7]
sub z7.h, z1.h, z30.h
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x12]
ld1h {z19.h}, p7/z, [x5]
sub z16.h, z30.h, z23.h
add z30.h, z30.h, z23.h
ld1h {z23.h}, p7/z, [x11]
add x11, x9, #0x20
rev z23.h, z23.h
sub z15.h, z19.h, z23.h
add z19.h, z19.h, z23.h
ld1h {z23.h}, p7/z, [x11]
addvl x11, sp, #0x14
rev z23.h, z23.h
add x11, x11, #0x70
ld1h {z2.h}, p7/z, [x9]
sub z10.h, z2.h, z23.h
add z2.h, z2.h, z23.h
str z10, [x11]
add x11, x8, #0x20
ld1h {z23.h}, p7/z, [x11]
rev z23.h, z23.h
ld1h {z10.h}, p7/z, [x8]
ptrue p6.d
sub z9.h, z10.h, z23.h
add z10.h, z10.h, z23.h
zip1 z23.d, z31.d, z22.d
zip2 z31.d, z31.d, z22.d
zip1 z22.d, z29.d, z24.d
zip2 z29.d, z29.d, z24.d
zip1 z21.d, z23.d, z22.d
zip1 z24.d, z31.d, z29.d
zip2 z22.d, z23.d, z22.d
revh z24.d, p6/m, z24.d
zip2 z31.d, z31.d, z29.d
revh z31.d, p6/m, z31.d
addvl x11, sp, #4
saddlb z23.s, z21.h, z31.h
add x11, x11, #0x70
str z21, [x11]
ldr z29, [x11]
addvl x11, sp, #7
saddlt z21.s, z29.h, z31.h
add x11, x11, #0x70
str z31, [x11]
mov z31.d, z22.d
addvl x11, sp, #5
saddlb z22.s, z22.h, z24.h
add x11, x11, #0x70
str z31, [x11]
ldr z29, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
str z24, [x11]
saddlt z24.s, z29.h, z24.h
revw z22.d, p6/m, z22.d
revw z24.d, p6/m, z24.d
zip1 z31.s, z23.s, z21.s
zip2 z23.s, z23.s, z21.s
zip1 z29.s, z24.s, z22.s
zip2 z24.s, z24.s, z22.s
add z31.s, z31.s, z29.s
add z24.s, z23.s, z24.s
uzp2 z23.d, z31.d, z24.d
revw z23.d, p6/m, z23.d
ptrue p5.s
uzp1 z31.d, z31.d, z24.d
ld1w {z21.s}, p7/z, [x3]
add z24.s, z23.s, z31.s
sub z29.s, z31.s, z23.s
movprfx z22, z24
mul z22.s, p7/m, z22.s, z21.s
addp z22.s, p5/m, z22.s, z22.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z8, [x11]
movprfx z23, z8
mul z23.s, p7/m, z23.s, z29.s
addp z23.s, p5/m, z23.s, z23.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z5, [x11]
mul z24.s, p7/m, z24.s, z5.s
addp z24.s, p5/m, z24.s, z24.s
add x11, sp, #0x70
ldr z4, [x11]
mul z29.s, p7/m, z29.s, z4.s
mov z31.d, z29.d
addp z31.s, p5/m, z31.s, z29.s
addvl x11, sp, #0x15
add x11, x11, #0x70
str z31, [x11]
zip1 z31.d, z28.d, z18.d
zip2 z28.d, z28.d, z18.d
zip1 z18.d, z26.d, z20.d
zip2 z26.d, z26.d, z20.d
zip1 z20.d, z31.d, z18.d
zip2 z18.d, z31.d, z18.d
zip1 z31.d, z28.d, z26.d
revh z3.d, p6/m, z31.d
zip2 z28.d, z28.d, z26.d
revh z26.d, p6/m, z28.d
addvl x11, sp, #8
mov z28.d, z20.d
saddlb z20.s, z20.h, z26.h
add x11, x11, #0x70
str z28, [x11]
ldr z29, [x11]
addvl x11, sp, #0xb
saddlt z17.s, z29.h, z26.h
add x11, x11, #0x70
str z26, [x11]
mov z26.d, z18.d
addvl x11, sp, #9
saddlb z18.s, z18.h, z3.h
add x11, x11, #0x70
str z26, [x11]
ldr z29, [x11]
addvl x11, sp, #0xa
saddlt z26.s, z29.h, z3.h
add x11, x11, #0x70
str z3, [x11]
revw z18.d, p6/m, z18.d
revw z26.d, p6/m, z26.d
zip1 z28.s, z26.s, z18.s
zip1 z31.s, z20.s, z17.s
zip2 z26.s, z26.s, z18.s
add z31.s, z31.s, z28.s
zip2 z20.s, z20.s, z17.s
add z26.s, z20.s, z26.s
uzp2 z18.d, z31.d, z26.d
revw z18.d, p6/m, z18.d
uzp1 z31.d, z31.d, z26.d
add z20.s, z18.s, z31.s
sub z28.s, z31.s, z18.s
movprfx z17, z20
mul z17.s, p7/m, z17.s, z21.s
addp z17.s, p5/m, z17.s, z17.s
movprfx z18, z8
mul z18.s, p7/m, z18.s, z28.s
addp z18.s, p5/m, z18.s, z18.s
mul z20.s, p7/m, z20.s, z5.s
addp z20.s, p5/m, z20.s, z20.s
mul z28.s, p7/m, z28.s, z4.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z31.d, z27.d, z0.d
zip1 z26.d, z25.d, z1.d
zip2 z27.d, z27.d, z0.d
zip2 z25.d, z25.d, z1.d
zip1 z0.d, z31.d, z26.d
zip2 z4.d, z31.d, z26.d
zip1 z31.d, z27.d, z25.d
revh z3.d, p6/m, z31.d
zip2 z27.d, z27.d, z25.d
revh z27.d, p6/m, z27.d
addvl x11, sp, #0xc
saddlb z26.s, z0.h, z27.h
saddlb z25.s, z4.h, z3.h
add x11, x11, #0x70
str z0, [x11]
ldr z29, [x11]
addvl x11, sp, #0xd
saddlt z1.s, z29.h, z27.h
add x11, x11, #0x70
str z27, [x11]
saddlt z27.s, z4.h, z3.h
revw z25.d, p6/m, z25.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z26.s, z1.s
zip2 z26.s, z26.s, z1.s
zip1 z0.s, z27.s, z25.s
zip2 z27.s, z27.s, z25.s
add z31.s, z31.s, z0.s
add z27.s, z26.s, z27.s
uzp2 z26.d, z31.d, z27.d
revw z26.d, p6/m, z26.d
uzp1 z31.d, z31.d, z27.d
add z27.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
movprfx z25, z27
mul z25.s, p7/m, z25.s, z21.s
addp z25.s, p5/m, z25.s, z25.s
movprfx z26, z8
mul z26.s, p7/m, z26.s, z31.s
addp z26.s, p5/m, z26.s, z26.s
mul z27.s, p7/m, z27.s, z5.s
addp z27.s, p5/m, z27.s, z27.s
add x11, sp, #0x70
ldr z1, [x11]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z1.d, z30.d, z2.d
zip2 z30.d, z30.d, z2.d
zip1 z2.d, z19.d, z10.d
zip2 z19.d, z19.d, z10.d
zip1 z8.d, z1.d, z2.d
zip2 z0.d, z1.d, z2.d
zip1 z10.d, z30.d, z19.d
revh z1.d, p6/m, z10.d
zip2 z30.d, z30.d, z19.d
revh z5.d, p6/m, z30.d
saddlb z10.s, z8.h, z5.h
saddlt z30.s, z8.h, z5.h
saddlb z2.s, z0.h, z1.h
saddlt z19.s, z0.h, z1.h
revw z2.d, p6/m, z2.d
revw z19.d, p6/m, z19.d
zip1 z29.s, z19.s, z2.s
addvl x11, sp, #3
zip2 z19.s, z19.s, z2.s
add x11, x11, #0x70
str z30, [x11]
zip1 z30.s, z10.s, z30.s
add z30.s, z30.s, z29.s
ldr z29, [x11]
zip2 z10.s, z10.s, z29.s
add z19.s, z10.s, z19.s
uzp2 z10.d, z30.d, z19.d
revw z10.d, p6/m, z10.d
uzp1 z30.d, z30.d, z19.d
add z19.s, z10.s, z30.s
sub z30.s, z30.s, z10.s
mul z21.s, p7/m, z21.s, z19.s
addp z21.s, p5/m, z21.s, z21.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z10, [x11]
mul z10.s, p7/m, z10.s, z30.s
addp z10.s, p5/m, z10.s, z10.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z2, [x11]
mul z19.s, p7/m, z19.s, z2.s
addp z19.s, p5/m, z19.s, z19.s
add x11, sp, #0x70
ldr z2, [x11]
mul z30.s, p7/m, z30.s, z2.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #0x15
uzp1 z22.s, z22.s, z17.s
uzp1 z25.s, z25.s, z21.s
add x11, x11, #0x70
uzp1 z23.s, z23.s, z18.s
uzp1 z26.s, z26.s, z10.s
rshrnb z22.h, z22.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z22.h, z22.h, z22.h
uzp1 z25.h, z25.h, z25.h
rshrnb z23.h, z23.s, #4
rshrnb z26.h, z26.s, #4
uzp1 z23.h, z23.h, z23.h
uzp1 z26.h, z26.h, z26.h
stp q22, q25, [x1]
uzp1 z24.s, z24.s, z20.s
uzp1 z31.s, z31.s, z30.s
rshrnb z31.h, z31.s, #4
stp q23, q26, [x1, #0x200]
ldr z29, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z25, [x11]
uzp1 z29.s, z29.s, z28.s
addvl x11, sp, #0xf
uzp1 z31.h, z31.h, z31.h
rshrnb z29.h, z29.s, #4
add x11, x11, #0x70
ldr z23, [x11]
uzp1 z29.h, z29.h, z29.h
addvl x11, sp, #0x10
uzp1 z27.s, z27.s, z19.s
rshrnb z24.h, z24.s, #4
add x11, x11, #0x70
ldr z20, [x11]
uzp1 z24.h, z24.h, z24.h
addvl x11, sp, #0x11
rshrnb z27.h, z27.s, #4
uzp1 z27.h, z27.h, z27.h
add x11, x11, #0x70
str q29, [x1, #0x600]
zip1 z29.d, z12.d, z25.d
trn2 z30.d, z11.d, z23.d
zip1 z28.d, z11.d, z23.d
zip1 z26.d, z29.d, z28.d
str q31, [x1, #0x610]
trn2 z31.d, z12.d, z25.d
zip1 z29.d, z14.d, z20.d
zip1 z28.d, z13.d, z6.d
trn1 z12.d, z12.d, z25.d
zip1 z22.d, z29.d, z28.d
str q24, [x1, #0x400]
zip2 z24.d, z31.d, z30.d
trn1 z11.d, z11.d, z23.d
zip2 z25.d, z12.d, z11.d
str q27, [x1, #0x410]
zip1 z27.d, z31.d, z30.d
trn2 z31.d, z14.d, z20.d
trn1 z14.d, z14.d, z20.d
ldr z20, [x11]
addvl x11, sp, #0x13
add x11, x11, #0x70
ldr z18, [x11]
zip1 z29.d, z20.d, z18.d
addvl x11, sp, #0x12
trn2 z30.d, z13.d, z6.d
trn1 z13.d, z13.d, z6.d
add x11, x11, #0x70
ldr z19, [x11]
zip1 z23.d, z31.d, z30.d
addvl x11, sp, #0x14
zip2 z21.d, z14.d, z13.d
zip1 z28.d, z19.d, z7.d
add x11, x11, #0x70
zip2 z14.d, z31.d, z30.d
zip1 z12.d, z29.d, z28.d
trn2 z31.d, z20.d, z18.d
trn1 z29.d, z20.d, z18.d
ldr z20, [x11]
addvl x11, sp, #0x16
trn2 z30.d, z19.d, z7.d
trn1 z28.d, z19.d, z7.d
add x11, x11, #0x70
ldr z18, [x11]
zip1 z13.d, z31.d, z30.d
addvl x11, sp, #0x17
zip2 z11.d, z29.d, z28.d
zip2 z10.d, z31.d, z30.d
add x11, x11, #0x70
ldr z17, [x11]
trn2 z31.d, z16.d, z20.d
addvl x11, sp, #0x18
trn2 z30.d, z15.d, z9.d
zip1 z29.d, z16.d, z20.d
add x11, x11, #0x70
ldr z2, [x11]
zip1 z28.d, z15.d, z9.d
add x11, x1, #0x40
zip1 z6.d, z29.d, z28.d
zip1 z7.d, z31.d, z30.d
ld1h {z19.h}, p7/z, [x21]
trn1 z16.d, z16.d, z20.d
trn1 z15.d, z15.d, z9.d
zip2 z9.d, z31.d, z30.d
zip2 z15.d, z16.d, z15.d
movi d31, #0000000000000000
movprfx z30, z31
sdot z30.d, z27.h, z18.h
movprfx z20, z31
sdot z20.d, z23.h, z18.h
movprfx z29, z31
sdot z29.d, z13.h, z18.h
movprfx z28, z31
sdot z28.d, z7.h, z18.h
sdot z30.d, z26.h, z19.h
sdot z20.d, z22.h, z19.h
sdot z30.d, z25.h, z17.h
sdot z20.d, z21.h, z17.h
sdot z30.d, z24.h, z2.h
sdot z20.d, z14.h, z2.h
sdot z29.d, z12.h, z19.h
sdot z28.d, z6.h, z19.h
sdot z29.d, z11.h, z17.h
sdot z28.d, z15.h, z17.h
sdot z29.d, z10.h, z2.h
sdot z28.d, z9.h, z2.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #0x1a
add x11, x11, #0x70
ldr z19, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z19.h
addvl x11, sp, #0x19
movprfx z20, z31
sdot z20.d, z23.h, z19.h
movprfx z29, z31
sdot z29.d, z13.h, z19.h
add x11, x11, #0x70
ldr z18, [x11]
movprfx z28, z31
sdot z28.d, z7.h, z19.h
addvl x11, sp, #0x1b
sdot z30.d, z26.h, z18.h
sdot z20.d, z22.h, z18.h
add x11, x11, #0x70
ldr z17, [x11]
sdot z29.d, z12.h, z18.h
addvl x11, sp, #0x1c
sdot z30.d, z25.h, z17.h
sdot z20.d, z21.h, z17.h
add x11, x11, #0x70
ldr z2, [x11]
sdot z29.d, z11.h, z17.h
add x11, x1, #0xc0
sdot z20.d, z14.h, z2.h
sdot z30.d, z24.h, z2.h
sdot z29.d, z10.h, z2.h
sdot z28.d, z6.h, z18.h
uzp1 z30.s, z30.s, z20.s
sdot z28.d, z15.h, z17.h
rshrnb z30.h, z30.s, #4
sdot z28.d, z9.h, z2.h
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x1a0
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x1c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z17.h
add x11, x3, #0x1e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z17.h
addvl x11, sp, #0x1d
movprfx z29, z31
sdot z29.d, z13.h, z17.h
movprfx z28, z31
sdot z28.d, z7.h, z17.h
add x11, x11, #0x70
ldr z2, [x11]
sdot z30.d, z26.h, z2.h
add x11, x1, #0x140
sdot z30.d, z25.h, z18.h
sdot z20.d, z22.h, z2.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z21.h, z18.h
sdot z29.d, z12.h, z2.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z6.h, z2.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z15.h, z18.h
uzp1 z30.s, z30.s, z20.s
sdot z28.d, z9.h, z19.h
rshrnb z30.h, z30.s, #4
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x200
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x220
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x240
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x260
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x1c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x280
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x2a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x2c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x2e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x240
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x300
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x320
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x340
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x360
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x2c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x380
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x3a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x3c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x3e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x400
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x420
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x440
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x460
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x3c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x480
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x4a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x4c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x4e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x440
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x500
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x520
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x540
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x560
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x4c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x580
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x5a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x5c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x5e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x540
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x600
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x620
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x640
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x660
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x5c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x680
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x6a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x6c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x6e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x640
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x700
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x720
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x740
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x760
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x6c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x780
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x7a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x7c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x7e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x740
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x800
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x820
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z19.h
add x11, x3, #0x840
ld1h {z28.h}, p7/z, [x11]
movprfx z27, z31
sdot z27.d, z23.h, z19.h
add x11, x3, #0x860
ld1h {z29.h}, p7/z, [x11]
sdot z30.d, z26.h, z20.h
add x11, x1, #0x7c0
movprfx z26, z31
sdot z26.d, z13.h, z19.h
sdot z30.d, z25.h, z28.h
sdot z27.d, z22.h, z20.h
movprfx z25, z31
sdot z25.d, z7.h, z19.h
sdot z30.d, z24.h, z29.h
sdot z27.d, z21.h, z28.h
sdot z26.d, z12.h, z20.h
sdot z27.d, z14.h, z29.h
sdot z26.d, z11.h, z28.h
sdot z25.d, z6.h, z20.h
sdot z26.d, z10.h, z29.h
sdot z25.d, z15.h, z28.h
uzp1 z30.s, z30.s, z27.s
sdot z25.d, z9.h, z29.h
rshrnb z30.h, z30.s, #4
uzp1 z26.s, z26.s, z25.s
rshrnb z26.h, z26.s, #4
uzp1 z30.h, z30.h, z26.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z16, [x11]
sub z26.h, z4.h, z3.h
addvl x11, sp, #7
sub z29.h, z8.h, z5.h
sub z28.h, z0.h, z1.h
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z16.h, z13.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z15, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
ldr z14, [x11]
sub z22.h, z15.h, z14.h
addvl x11, sp, #8
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #9
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z6, [x11]
sub z27.h, z7.h, z6.h
add x11, x3, #0x880
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x8a0
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x80
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x8c0
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x8e0
ld1h {z19.h}, p7/z, [x11]
add x11, x1, #0x180
movprfx z30, z31
sdot z30.d, z22.h, z19.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
sdot z30.d, z23.h, z20.h
sdot z17.d, z25.h, z20.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
sdot z21.d, z27.h, z20.h
sdot z18.d, z29.h, z20.h
uzp1 z30.s, z30.s, z17.s
uzp1 z21.s, z21.s, z18.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x900
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x920
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x280
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x940
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x960
ld1h {z19.h}, p7/z, [x11]
add x11, x1, #0x380
movprfx z30, z31
sdot z30.d, z22.h, z19.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
sdot z30.d, z23.h, z20.h
sdot z17.d, z25.h, z20.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
sdot z21.d, z27.h, z20.h
sdot z18.d, z29.h, z20.h
uzp1 z30.s, z30.s, z17.s
uzp1 z21.s, z21.s, z18.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x980
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x9a0
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x480
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x9c0
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x9e0
ld1h {z19.h}, p7/z, [x11]
add x11, x1, #0x580
movprfx z30, z31
sdot z30.d, z22.h, z19.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
sdot z30.d, z23.h, z20.h
sdot z17.d, z25.h, z20.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
sdot z21.d, z27.h, z20.h
sdot z18.d, z29.h, z20.h
uzp1 z30.s, z30.s, z17.s
uzp1 z21.s, z21.s, z18.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xa00
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0xa20
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x680
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xa40
ld1h {z21.h}, p7/z, [x11]
add x11, x3, #0xa60
ld1h {z20.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z20.h
sdot z30.d, z23.h, z21.h
movprfx z23, z31
sdot z23.d, z24.h, z20.h
sdot z23.d, z25.h, z21.h
movprfx z25, z31
sdot z25.d, z26.h, z20.h
uzp1 z30.s, z30.s, z23.s
sdot z25.d, z27.h, z21.h
rshrnb z30.h, z30.s, #4
movprfx z27, z31
sdot z27.d, z28.h, z20.h
sdot z27.d, z29.h, z21.h
uzp1 z25.s, z25.s, z27.s
rshrnb z25.h, z25.s, #4
uzp1 z30.h, z30.h, z25.h
add x11, x1, #0x780
add z27.h, z13.h, z16.h
st1h {z30.h}, p7, [x11]
add z30.h, z14.h, z15.h
revh z30.d, p6/m, z30.d
sub z27.h, z27.h, z30.h
add z28.h, z9.h, z12.h
add z30.h, z10.h, z11.h
revh z30.d, p6/m, z30.d
sub z28.h, z28.h, z30.h
add z29.h, z6.h, z7.h
add z30.h, z3.h, z4.h
revh z30.d, p6/m, z30.d
sub z29.h, z29.h, z30.h
add z26.h, z1.h, z0.h
add z30.h, z5.h, z8.h
revh z26.d, p6/m, z26.d
add x11, x3, #0xa80
ld1h {z24.h}, p7/z, [x11]
sub z30.h, z30.h, z26.h
add x11, x1, #0x100
movprfx z22, z31
sdot z22.d, z28.h, z24.h
movprfx z23, z31
sdot z23.d, z30.h, z24.h
movprfx z26, z31
sdot z26.d, z27.h, z24.h
movprfx z25, z31
sdot z25.d, z29.h, z24.h
uzp1 z26.s, z26.s, z22.s
uzp1 z25.s, z25.s, z23.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0xaa0
ld1h {z24.h}, p7/z, [x11]
add x11, x1, #0x300
movprfx z22, z31
sdot z22.d, z28.h, z24.h
movprfx z23, z31
sdot z23.d, z30.h, z24.h
movprfx z26, z31
sdot z26.d, z27.h, z24.h
movprfx z25, z31
sdot z25.d, z29.h, z24.h
uzp1 z26.s, z26.s, z22.s
uzp1 z25.s, z25.s, z23.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0xac0
ld1h {z24.h}, p7/z, [x11]
movprfx z26, z31
sdot z26.d, z27.h, z24.h
add x11, x1, #0x500
movprfx z22, z31
sdot z22.d, z28.h, z24.h
movprfx z23, z31
sdot z23.d, z30.h, z24.h
movprfx z25, z31
sdot z25.d, z29.h, z24.h
uzp1 z26.s, z26.s, z22.s
uzp1 z25.s, z25.s, z23.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0xae0
ld1h {z25.h}, p7/z, [x11]
add x11, x1, #0x700
movprfx z26, z31
sdot z26.d, z27.h, z25.h
add x1, x1, #0x20
movprfx z27, z31
sdot z27.d, z28.h, z25.h
movprfx z28, z31
sdot z28.d, z29.h, z25.h
sdot z31.d, z30.h, z25.h
uzp1 z30.s, z26.s, z27.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #4
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x11]
add x17, x17, x4
add x16, x16, x4
add x15, x15, x4
add x14, x14, x4
add x10, x10, x4
add x13, x13, x4
add x7, x7, x4
add x12, x12, x4
add x5, x5, x4
add x9, x9, x4
add x8, x8, x4
add x6, x6, x4
cmp x20, x1
add x11, x0, x6
ld1h {z31.h}, p7/z, [x11]
ld1h {z24.h}, p7/z, [x17]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x19, x6
ld1h {z29.h}, p7/z, [x11]
sub z12.h, z31.h, z30.h
add x11, x11, #0x20
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x30, x6
rev z30.h, z30.h
ld1h {z22.h}, p7/z, [x11]
add x11, x11, #0x20
sub z11.h, z29.h, z30.h
add z29.h, z29.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0xe
rev z30.h, z30.h
add x11, x11, #0x70
sub z25.h, z22.h, z30.h
str z25, [x11]
add x11, x17, #0x20
add z22.h, z22.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0xf
rev z30.h, z30.h
sub z23.h, z24.h, z30.h
add x11, x11, #0x70
str z23, [x11]
add z24.h, z24.h, z30.h
add x11, x2, x6
ld1h {z28.h}, p7/z, [x11]
ld1h {z26.h}, p7/z, [x16]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x16, #0x20
sub z14.h, z28.h, z30.h
add z28.h, z28.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x15, #0x20
rev z30.h, z30.h
sub z13.h, z26.h, z30.h
add z26.h, z26.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x10
ld1h {z18.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z20.h, z18.h, z30.h
str z20, [x11]
add x11, x14, #0x20
add z18.h, z18.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x18, x6
rev z30.h, z30.h
ld1h {z27.h}, p7/z, [x11]
add x11, x11, #0x20
ld1h {z20.h}, p7/z, [x14]
sub z6.h, z20.h, z30.h
add z20.h, z20.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x11
add x11, x11, #0x70
rev z30.h, z30.h
sub z21.h, z27.h, z30.h
str z21, [x11]
add x11, x10, #0x20
add z27.h, z27.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x12
ld1h {z25.h}, p7/z, [x10]
add x11, x11, #0x70
rev z30.h, z30.h
sub z19.h, z25.h, z30.h
str z19, [x11]
add x11, x13, #0x20
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
ld1h {z0.h}, p7/z, [x13]
add x11, x11, #0x70
rev z30.h, z30.h
sub z17.h, z0.h, z30.h
str z17, [x11]
add x11, x7, #0x20
add z0.h, z0.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x12, #0x20
rev z30.h, z30.h
ld1h {z23.h}, p7/z, [x11]
add x11, x5, #0x20
rev z23.h, z23.h
ld1h {z1.h}, p7/z, [x7]
sub z7.h, z1.h, z30.h
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x12]
ld1h {z19.h}, p7/z, [x5]
sub z16.h, z30.h, z23.h
add z30.h, z30.h, z23.h
ld1h {z23.h}, p7/z, [x11]
add x11, x9, #0x20
rev z23.h, z23.h
sub z15.h, z19.h, z23.h
add z19.h, z19.h, z23.h
ld1h {z23.h}, p7/z, [x11]
addvl x11, sp, #0x14
rev z23.h, z23.h
add x11, x11, #0x70
ld1h {z2.h}, p7/z, [x9]
sub z10.h, z2.h, z23.h
add z2.h, z2.h, z23.h
str z10, [x11]
add x11, x8, #0x20
ld1h {z23.h}, p7/z, [x11]
rev z23.h, z23.h
ld1h {z10.h}, p7/z, [x8]
ptrue p6.d
sub z9.h, z10.h, z23.h
add z10.h, z10.h, z23.h
zip1 z23.d, z31.d, z22.d
zip2 z31.d, z31.d, z22.d
zip1 z22.d, z29.d, z24.d
zip2 z29.d, z29.d, z24.d
zip1 z21.d, z23.d, z22.d
zip1 z24.d, z31.d, z29.d
zip2 z22.d, z23.d, z22.d
revh z24.d, p6/m, z24.d
zip2 z31.d, z31.d, z29.d
revh z31.d, p6/m, z31.d
addvl x11, sp, #4
saddlb z23.s, z21.h, z31.h
add x11, x11, #0x70
str z21, [x11]
ldr z29, [x11]
addvl x11, sp, #7
saddlt z21.s, z29.h, z31.h
add x11, x11, #0x70
str z31, [x11]
mov z31.d, z22.d
addvl x11, sp, #5
saddlb z22.s, z22.h, z24.h
add x11, x11, #0x70
str z31, [x11]
ldr z29, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
str z24, [x11]
saddlt z24.s, z29.h, z24.h
revw z22.d, p6/m, z22.d
revw z24.d, p6/m, z24.d
zip1 z31.s, z23.s, z21.s
zip2 z23.s, z23.s, z21.s
zip1 z29.s, z24.s, z22.s
zip2 z24.s, z24.s, z22.s
add z31.s, z31.s, z29.s
add z24.s, z23.s, z24.s
uzp2 z23.d, z31.d, z24.d
revw z23.d, p6/m, z23.d
ptrue p5.s
uzp1 z31.d, z31.d, z24.d
ld1w {z21.s}, p7/z, [x3]
add z24.s, z23.s, z31.s
sub z29.s, z31.s, z23.s
movprfx z22, z24
mul z22.s, p7/m, z22.s, z21.s
addp z22.s, p5/m, z22.s, z22.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z8, [x11]
movprfx z23, z8
mul z23.s, p7/m, z23.s, z29.s
addp z23.s, p5/m, z23.s, z23.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z5, [x11]
mul z24.s, p7/m, z24.s, z5.s
addp z24.s, p5/m, z24.s, z24.s
add x11, sp, #0x70
ldr z4, [x11]
mul z29.s, p7/m, z29.s, z4.s
mov z31.d, z29.d
addp z31.s, p5/m, z31.s, z29.s
addvl x11, sp, #0x15
add x11, x11, #0x70
str z31, [x11]
zip1 z31.d, z28.d, z18.d
zip2 z28.d, z28.d, z18.d
zip1 z18.d, z26.d, z20.d
zip2 z26.d, z26.d, z20.d
zip1 z20.d, z31.d, z18.d
zip2 z18.d, z31.d, z18.d
zip1 z31.d, z28.d, z26.d
revh z3.d, p6/m, z31.d
zip2 z28.d, z28.d, z26.d
revh z26.d, p6/m, z28.d
addvl x11, sp, #8
mov z28.d, z20.d
saddlb z20.s, z20.h, z26.h
add x11, x11, #0x70
str z28, [x11]
ldr z29, [x11]
addvl x11, sp, #0xb
saddlt z17.s, z29.h, z26.h
add x11, x11, #0x70
str z26, [x11]
mov z26.d, z18.d
addvl x11, sp, #9
saddlb z18.s, z18.h, z3.h
add x11, x11, #0x70
str z26, [x11]
ldr z29, [x11]
addvl x11, sp, #0xa
saddlt z26.s, z29.h, z3.h
add x11, x11, #0x70
str z3, [x11]
revw z18.d, p6/m, z18.d
revw z26.d, p6/m, z26.d
zip1 z28.s, z26.s, z18.s
zip1 z31.s, z20.s, z17.s
zip2 z26.s, z26.s, z18.s
add z31.s, z31.s, z28.s
zip2 z20.s, z20.s, z17.s
add z26.s, z20.s, z26.s
uzp2 z18.d, z31.d, z26.d
revw z18.d, p6/m, z18.d
uzp1 z31.d, z31.d, z26.d
add z20.s, z18.s, z31.s
sub z28.s, z31.s, z18.s
movprfx z17, z20
mul z17.s, p7/m, z17.s, z21.s
addp z17.s, p5/m, z17.s, z17.s
movprfx z18, z8
mul z18.s, p7/m, z18.s, z28.s
addp z18.s, p5/m, z18.s, z18.s
mul z20.s, p7/m, z20.s, z5.s
addp z20.s, p5/m, z20.s, z20.s
mul z28.s, p7/m, z28.s, z4.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z31.d, z27.d, z0.d
zip1 z26.d, z25.d, z1.d
zip2 z27.d, z27.d, z0.d
zip2 z25.d, z25.d, z1.d
zip1 z0.d, z31.d, z26.d
zip2 z4.d, z31.d, z26.d
zip1 z31.d, z27.d, z25.d
revh z3.d, p6/m, z31.d
zip2 z27.d, z27.d, z25.d
revh z27.d, p6/m, z27.d
addvl x11, sp, #0xc
saddlb z26.s, z0.h, z27.h
saddlb z25.s, z4.h, z3.h
add x11, x11, #0x70
str z0, [x11]
ldr z29, [x11]
addvl x11, sp, #0xd
saddlt z1.s, z29.h, z27.h
add x11, x11, #0x70
str z27, [x11]
saddlt z27.s, z4.h, z3.h
revw z25.d, p6/m, z25.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z26.s, z1.s
zip2 z26.s, z26.s, z1.s
zip1 z0.s, z27.s, z25.s
zip2 z27.s, z27.s, z25.s
add z31.s, z31.s, z0.s
add z27.s, z26.s, z27.s
uzp2 z26.d, z31.d, z27.d
revw z26.d, p6/m, z26.d
uzp1 z31.d, z31.d, z27.d
add z27.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
movprfx z25, z27
mul z25.s, p7/m, z25.s, z21.s
addp z25.s, p5/m, z25.s, z25.s
movprfx z26, z8
mul z26.s, p7/m, z26.s, z31.s
addp z26.s, p5/m, z26.s, z26.s
mul z27.s, p7/m, z27.s, z5.s
addp z27.s, p5/m, z27.s, z27.s
add x11, sp, #0x70
ldr z1, [x11]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z1.d, z30.d, z2.d
zip2 z30.d, z30.d, z2.d
zip1 z2.d, z19.d, z10.d
zip2 z19.d, z19.d, z10.d
zip1 z8.d, z1.d, z2.d
zip2 z0.d, z1.d, z2.d
zip1 z10.d, z30.d, z19.d
revh z1.d, p6/m, z10.d
zip2 z30.d, z30.d, z19.d
revh z5.d, p6/m, z30.d
saddlb z10.s, z8.h, z5.h
saddlt z30.s, z8.h, z5.h
saddlb z2.s, z0.h, z1.h
saddlt z19.s, z0.h, z1.h
revw z2.d, p6/m, z2.d
revw z19.d, p6/m, z19.d
zip1 z29.s, z19.s, z2.s
addvl x11, sp, #3
zip2 z19.s, z19.s, z2.s
add x11, x11, #0x70
str z30, [x11]
zip1 z30.s, z10.s, z30.s
add z30.s, z30.s, z29.s
ldr z29, [x11]
zip2 z10.s, z10.s, z29.s
add z19.s, z10.s, z19.s
uzp2 z10.d, z30.d, z19.d
revw z10.d, p6/m, z10.d
uzp1 z30.d, z30.d, z19.d
add z19.s, z10.s, z30.s
sub z30.s, z30.s, z10.s
mul z21.s, p7/m, z21.s, z19.s
addp z21.s, p5/m, z21.s, z21.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z10, [x11]
mul z10.s, p7/m, z10.s, z30.s
addp z10.s, p5/m, z10.s, z10.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z2, [x11]
mul z19.s, p7/m, z19.s, z2.s
addp z19.s, p5/m, z19.s, z19.s
add x11, sp, #0x70
ldr z2, [x11]
mul z30.s, p7/m, z30.s, z2.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #0x15
uzp1 z22.s, z22.s, z17.s
uzp1 z25.s, z25.s, z21.s
add x11, x11, #0x70
uzp1 z23.s, z23.s, z18.s
uzp1 z26.s, z26.s, z10.s
rshrnb z22.h, z22.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z22.h, z22.h, z22.h
uzp1 z25.h, z25.h, z25.h
rshrnb z23.h, z23.s, #4
rshrnb z26.h, z26.s, #4
uzp1 z23.h, z23.h, z23.h
uzp1 z26.h, z26.h, z26.h
stp q22, q25, [x1]
uzp1 z24.s, z24.s, z20.s
uzp1 z31.s, z31.s, z30.s
rshrnb z31.h, z31.s, #4
stp q23, q26, [x1, #0x200]
ldr z29, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z25, [x11]
uzp1 z29.s, z29.s, z28.s
addvl x11, sp, #0xf
uzp1 z31.h, z31.h, z31.h
rshrnb z29.h, z29.s, #4
add x11, x11, #0x70
ldr z23, [x11]
uzp1 z29.h, z29.h, z29.h
addvl x11, sp, #0x10
uzp1 z27.s, z27.s, z19.s
rshrnb z24.h, z24.s, #4
add x11, x11, #0x70
ldr z20, [x11]
uzp1 z24.h, z24.h, z24.h
addvl x11, sp, #0x11
rshrnb z27.h, z27.s, #4
uzp1 z27.h, z27.h, z27.h
add x11, x11, #0x70
str q29, [x1, #0x600]
zip1 z29.d, z12.d, z25.d
trn2 z30.d, z11.d, z23.d
zip1 z28.d, z11.d, z23.d
zip1 z26.d, z29.d, z28.d
str q31, [x1, #0x610]
trn2 z31.d, z12.d, z25.d
zip1 z29.d, z14.d, z20.d
zip1 z28.d, z13.d, z6.d
trn1 z12.d, z12.d, z25.d
zip1 z22.d, z29.d, z28.d
str q24, [x1, #0x400]
zip2 z24.d, z31.d, z30.d
trn1 z11.d, z11.d, z23.d
zip2 z25.d, z12.d, z11.d
str q27, [x1, #0x410]
zip1 z27.d, z31.d, z30.d
trn2 z31.d, z14.d, z20.d
trn1 z14.d, z14.d, z20.d
ldr z20, [x11]
addvl x11, sp, #0x13
add x11, x11, #0x70
ldr z18, [x11]
zip1 z29.d, z20.d, z18.d
addvl x11, sp, #0x12
trn2 z30.d, z13.d, z6.d
trn1 z13.d, z13.d, z6.d
add x11, x11, #0x70
ldr z19, [x11]
zip1 z23.d, z31.d, z30.d
addvl x11, sp, #0x14
zip2 z21.d, z14.d, z13.d
zip1 z28.d, z19.d, z7.d
add x11, x11, #0x70
zip2 z14.d, z31.d, z30.d
zip1 z12.d, z29.d, z28.d
trn2 z31.d, z20.d, z18.d
trn1 z29.d, z20.d, z18.d
ldr z20, [x11]
addvl x11, sp, #0x16
trn2 z30.d, z19.d, z7.d
trn1 z28.d, z19.d, z7.d
add x11, x11, #0x70
ldr z18, [x11]
zip1 z13.d, z31.d, z30.d
addvl x11, sp, #0x17
zip2 z11.d, z29.d, z28.d
zip2 z10.d, z31.d, z30.d
add x11, x11, #0x70
ldr z17, [x11]
trn2 z31.d, z16.d, z20.d
addvl x11, sp, #0x18
trn2 z30.d, z15.d, z9.d
zip1 z29.d, z16.d, z20.d
add x11, x11, #0x70
ldr z2, [x11]
zip1 z28.d, z15.d, z9.d
add x11, x1, #0x40
zip1 z6.d, z29.d, z28.d
zip1 z7.d, z31.d, z30.d
ld1h {z19.h}, p7/z, [x21]
trn1 z16.d, z16.d, z20.d
trn1 z15.d, z15.d, z9.d
zip2 z9.d, z31.d, z30.d
zip2 z15.d, z16.d, z15.d
movi d31, #0000000000000000
movprfx z30, z31
sdot z30.d, z27.h, z18.h
movprfx z20, z31
sdot z20.d, z23.h, z18.h
movprfx z29, z31
sdot z29.d, z13.h, z18.h
movprfx z28, z31
sdot z28.d, z7.h, z18.h
sdot z30.d, z26.h, z19.h
sdot z20.d, z22.h, z19.h
sdot z30.d, z25.h, z17.h
sdot z20.d, z21.h, z17.h
sdot z30.d, z24.h, z2.h
sdot z20.d, z14.h, z2.h
sdot z29.d, z12.h, z19.h
sdot z28.d, z6.h, z19.h
sdot z29.d, z11.h, z17.h
sdot z28.d, z15.h, z17.h
sdot z29.d, z10.h, z2.h
sdot z28.d, z9.h, z2.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #0x1a
add x11, x11, #0x70
ldr z19, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z19.h
addvl x11, sp, #0x19
movprfx z20, z31
sdot z20.d, z23.h, z19.h
movprfx z29, z31
sdot z29.d, z13.h, z19.h
add x11, x11, #0x70
ldr z18, [x11]
movprfx z28, z31
sdot z28.d, z7.h, z19.h
addvl x11, sp, #0x1b
sdot z30.d, z26.h, z18.h
sdot z20.d, z22.h, z18.h
add x11, x11, #0x70
ldr z17, [x11]
sdot z29.d, z12.h, z18.h
addvl x11, sp, #0x1c
sdot z30.d, z25.h, z17.h
sdot z20.d, z21.h, z17.h
add x11, x11, #0x70
ldr z2, [x11]
sdot z29.d, z11.h, z17.h
add x11, x1, #0xc0
sdot z20.d, z14.h, z2.h
sdot z30.d, z24.h, z2.h
sdot z29.d, z10.h, z2.h
sdot z28.d, z6.h, z18.h
uzp1 z30.s, z30.s, z20.s
sdot z28.d, z15.h, z17.h
rshrnb z30.h, z30.s, #4
sdot z28.d, z9.h, z2.h
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x1a0
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x1c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z17.h
add x11, x3, #0x1e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z17.h
addvl x11, sp, #0x1d
movprfx z29, z31
sdot z29.d, z13.h, z17.h
movprfx z28, z31
sdot z28.d, z7.h, z17.h
add x11, x11, #0x70
ldr z2, [x11]
sdot z30.d, z26.h, z2.h
add x11, x1, #0x140
sdot z30.d, z25.h, z18.h
sdot z20.d, z22.h, z2.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z21.h, z18.h
sdot z29.d, z12.h, z2.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z6.h, z2.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z15.h, z18.h
uzp1 z30.s, z30.s, z20.s
sdot z28.d, z9.h, z19.h
rshrnb z30.h, z30.s, #4
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x200
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x220
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x240
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x260
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x1c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x280
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x2a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x2c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x2e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x240
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x300
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x320
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x340
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x360
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x2c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x380
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x3a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x3c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x3e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x400
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x420
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x440
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x460
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x3c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x480
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x4a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x4c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x4e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x440
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x500
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x520
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x540
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x560
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x4c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x580
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x5a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x5c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x5e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x540
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x600
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x620
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x640
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x660
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x5c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x680
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x6a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x6c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x6e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x640
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x700
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x720
ld1h {z16.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x740
ld1h {z18.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x3, #0x760
ld1h {z19.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z13.h, z16.h
add x11, x1, #0x6c0
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x780
ld1h {z17.h}, p7/z, [x11]
add x11, x3, #0x7a0
ld1h {z16.h}, p7/z, [x11]
add x11, x3, #0x7c0
ld1h {z18.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z16.h
add x11, x3, #0x7e0
ld1h {z19.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z16.h
add x11, x1, #0x740
movprfx z29, z31
sdot z29.d, z13.h, z16.h
movprfx z28, z31
sdot z28.d, z7.h, z16.h
sdot z30.d, z26.h, z17.h
sdot z20.d, z22.h, z17.h
sdot z30.d, z25.h, z18.h
sdot z20.d, z21.h, z18.h
sdot z30.d, z24.h, z19.h
sdot z20.d, z14.h, z19.h
sdot z29.d, z12.h, z17.h
sdot z28.d, z6.h, z17.h
sdot z29.d, z11.h, z18.h
sdot z28.d, z15.h, z18.h
sdot z29.d, z10.h, z19.h
sdot z28.d, z9.h, z19.h
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x800
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x820
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z19.h
add x11, x3, #0x840
ld1h {z28.h}, p7/z, [x11]
movprfx z27, z31
sdot z27.d, z23.h, z19.h
add x11, x3, #0x860
ld1h {z29.h}, p7/z, [x11]
sdot z30.d, z26.h, z20.h
add x11, x1, #0x7c0
movprfx z26, z31
sdot z26.d, z13.h, z19.h
sdot z30.d, z25.h, z28.h
sdot z27.d, z22.h, z20.h
movprfx z25, z31
sdot z25.d, z7.h, z19.h
sdot z30.d, z24.h, z29.h
sdot z27.d, z21.h, z28.h
sdot z26.d, z12.h, z20.h
sdot z27.d, z14.h, z29.h
sdot z26.d, z11.h, z28.h
sdot z25.d, z6.h, z20.h
sdot z26.d, z10.h, z29.h
sdot z25.d, z15.h, z28.h
uzp1 z30.s, z30.s, z27.s
sdot z25.d, z9.h, z29.h
rshrnb z30.h, z30.s, #4
uzp1 z26.s, z26.s, z25.s
rshrnb z26.h, z26.s, #4
uzp1 z30.h, z30.h, z26.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z16, [x11]
sub z26.h, z4.h, z3.h
addvl x11, sp, #7
sub z29.h, z8.h, z5.h
sub z28.h, z0.h, z1.h
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z16.h, z13.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z15, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
ldr z14, [x11]
sub z22.h, z15.h, z14.h
addvl x11, sp, #8
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #9
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z6, [x11]
sub z27.h, z7.h, z6.h
add x11, x3, #0x880
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x8a0
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x80
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x8c0
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x8e0
ld1h {z19.h}, p7/z, [x11]
add x11, x1, #0x180
movprfx z30, z31
sdot z30.d, z22.h, z19.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
sdot z30.d, z23.h, z20.h
sdot z17.d, z25.h, z20.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
sdot z21.d, z27.h, z20.h
sdot z18.d, z29.h, z20.h
uzp1 z30.s, z30.s, z17.s
uzp1 z21.s, z21.s, z18.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x900
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x920
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x280
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x940
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x960
ld1h {z19.h}, p7/z, [x11]
add x11, x1, #0x380
movprfx z30, z31
sdot z30.d, z22.h, z19.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
sdot z30.d, z23.h, z20.h
sdot z17.d, z25.h, z20.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
sdot z21.d, z27.h, z20.h
sdot z18.d, z29.h, z20.h
uzp1 z30.s, z30.s, z17.s
uzp1 z21.s, z21.s, z18.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x980
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x9a0
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x480
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x9c0
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0x9e0
ld1h {z19.h}, p7/z, [x11]
add x11, x1, #0x580
movprfx z30, z31
sdot z30.d, z22.h, z19.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
sdot z30.d, z23.h, z20.h
sdot z17.d, z25.h, z20.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
sdot z21.d, z27.h, z20.h
sdot z18.d, z29.h, z20.h
uzp1 z30.s, z30.s, z17.s
uzp1 z21.s, z21.s, z18.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xa00
ld1h {z20.h}, p7/z, [x11]
add x11, x3, #0xa20
ld1h {z19.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z19.h
add x11, x1, #0x680
sdot z30.d, z23.h, z20.h
movprfx z17, z31
sdot z17.d, z24.h, z19.h
movprfx z21, z31
sdot z21.d, z26.h, z19.h
sdot z17.d, z25.h, z20.h
sdot z21.d, z27.h, z20.h
movprfx z18, z31
sdot z18.d, z28.h, z19.h
uzp1 z30.s, z30.s, z17.s
sdot z18.d, z29.h, z20.h
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z18.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xa40
ld1h {z21.h}, p7/z, [x11]
add x11, x3, #0xa60
ld1h {z20.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z20.h
sdot z30.d, z23.h, z21.h
movprfx z23, z31
sdot z23.d, z24.h, z20.h
sdot z23.d, z25.h, z21.h
movprfx z25, z31
sdot z25.d, z26.h, z20.h
uzp1 z30.s, z30.s, z23.s
sdot z25.d, z27.h, z21.h
rshrnb z30.h, z30.s, #4
movprfx z27, z31
sdot z27.d, z28.h, z20.h
sdot z27.d, z29.h, z21.h
uzp1 z25.s, z25.s, z27.s
rshrnb z25.h, z25.s, #4
uzp1 z30.h, z30.h, z25.h
add x11, x1, #0x780
add z27.h, z13.h, z16.h
st1h {z30.h}, p7, [x11]
add z30.h, z14.h, z15.h
revh z30.d, p6/m, z30.d
sub z27.h, z27.h, z30.h
add z28.h, z9.h, z12.h
add z30.h, z10.h, z11.h
revh z30.d, p6/m, z30.d
sub z28.h, z28.h, z30.h
add z29.h, z6.h, z7.h
add z30.h, z3.h, z4.h
revh z30.d, p6/m, z30.d
sub z29.h, z29.h, z30.h
add z26.h, z1.h, z0.h
add z30.h, z5.h, z8.h
revh z26.d, p6/m, z26.d
add x11, x3, #0xa80
ld1h {z24.h}, p7/z, [x11]
sub z30.h, z30.h, z26.h
add x11, x1, #0x100
movprfx z22, z31
sdot z22.d, z28.h, z24.h
movprfx z23, z31
sdot z23.d, z30.h, z24.h
movprfx z26, z31
sdot z26.d, z27.h, z24.h
movprfx z25, z31
sdot z25.d, z29.h, z24.h
uzp1 z26.s, z26.s, z22.s
uzp1 z25.s, z25.s, z23.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0xaa0
ld1h {z24.h}, p7/z, [x11]
add x11, x1, #0x300
movprfx z22, z31
sdot z22.d, z28.h, z24.h
movprfx z23, z31
sdot z23.d, z30.h, z24.h
movprfx z26, z31
sdot z26.d, z27.h, z24.h
movprfx z25, z31
sdot z25.d, z29.h, z24.h
uzp1 z26.s, z26.s, z22.s
uzp1 z25.s, z25.s, z23.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0xac0
ld1h {z24.h}, p7/z, [x11]
movprfx z26, z31
sdot z26.d, z27.h, z24.h
add x11, x1, #0x500
movprfx z22, z31
sdot z22.d, z28.h, z24.h
movprfx z23, z31
sdot z23.d, z30.h, z24.h
movprfx z25, z31
sdot z25.d, z29.h, z24.h
uzp1 z26.s, z26.s, z22.s
uzp1 z25.s, z25.s, z23.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0xae0
ld1h {z25.h}, p7/z, [x11]
add x11, x1, #0x700
movprfx z26, z31
sdot z26.d, z27.h, z25.h
add x1, x1, #0x20
movprfx z27, z31
sdot z27.d, z28.h, z25.h
movprfx z28, z31
sdot z28.d, z29.h, z25.h
sdot z31.d, z30.h, z25.h
uzp1 z30.s, z26.s, z27.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #4
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x11]
add x17, x17, x4
add x16, x16, x4
add x15, x15, x4
add x14, x14, x4
add x10, x10, x4
add x13, x13, x4
add x7, x7, x4
add x12, x12, x4
add x5, x5, x4
add x9, x9, x4
add x8, x8, x4
add x6, x6, x4
cmp x20, x1
ldr x21, [sp, #0x20]
ldp x29, x30, [sp]
ldp x19, x20, [sp, #0x10]
ldp d8, d9, [sp, #0x30]
ldp d10, d11, [sp, #0x40]
ldp d12, d13, [sp, #0x50]
ldp d14, d15, [sp, #0x60]
addvl sp, sp, #0x1e
add sp, sp, #0x70
mov x1, x19
add x0, sp, #0x20
cntb x12, all, mul #9
adrp x2, #0x457000
ptrue p7.b
lsl x12, x12, #2
add x2, x2, #0xeb0
sub sp, sp, x12
add x3, x2, #0x20
ld1w {z31.s}, p7/z, [x3]
sub sp, sp, #0x40
cntb x6
addvl x3, sp, #0x19
lsl x6, x6, #5
add x3, x3, #0x40
add x5, x0, #0x800
stp d8, d9, [sp]
add x4, x2, #0x80
stp d10, d11, [sp, #0x10]
stp d12, d13, [sp, #0x20]
stp d14, d15, [sp, #0x30]
str z31, [x3]
add x3, x2, #0x40
ld1w {z31.s}, p7/z, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x60
ld1w {z31.s}, p7/z, [x3]
addvl x3, sp, #0x1b
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xa0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1c
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xc0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1d
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xe0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1e
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x100
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1f
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x120
ld1h {z31.h}, p7/z, [x3]
cntb x3
lsl x3, x3, #5
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x140
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
rdvl x6, #0x11
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x160
ld1h {z31.h}, p7/z, [x3]
rdvl x3, #0x11
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x180
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
str z31, [x3]
add x3, x0, #0x20
ld1h {z30.h}, p7/z, [x3]
ld1h {z20.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z28.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z13.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z12.h}, p7/z, [x3]
zip1 z14.d, z20.d, z12.d
add x3, x0, #0xc0
zip2 z20.d, z20.d, z12.d
ld1h {z11.h}, p7/z, [x3]
zip1 z12.d, z15.d, z11.d
zip2 z15.d, z15.d, z11.d
zip1 z2.d, z14.d, z12.d
zip2 z12.d, z14.d, z12.d
zip1 z14.d, z20.d, z15.d
revh z14.d, p6/m, z14.d
zip2 z20.d, z20.d, z15.d
revh z15.d, p6/m, z20.d
rev z19.h, z19.h
rev z17.h, z17.h
rev z30.h, z30.h
zip1 z20.d, z30.d, z19.d
rev z24.h, z24.h
zip2 z30.d, z30.d, z19.d
zip1 z19.d, z24.d, z17.d
zip2 z24.d, z24.d, z17.d
zip1 z17.d, z20.d, z19.d
zip2 z19.d, z20.d, z19.d
zip1 z20.d, z30.d, z24.d
revh z11.d, p6/m, z20.d
zip2 z30.d, z30.d, z24.d
revh z24.d, p6/m, z30.d
addvl x3, sp, #4
saddlb z30.s, z15.h, z24.h
saddlb z20.s, z2.h, z17.h
add x3, x3, #0x40
str z17, [x3]
ldr z10, [x3]
addvl x3, sp, #3
add z20.s, z20.s, z30.s
saddlt z30.s, z15.h, z24.h
add x3, x3, #0x40
str z15, [x3]
saddlt z17.s, z2.h, z10.h
addvl x3, sp, #7
add z17.s, z17.s, z30.s
saddlb z30.s, z14.h, z11.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z19.d
addvl x3, sp, #1
saddlb z19.s, z12.h, z19.h
add z19.s, z19.s, z30.s
add x3, x3, #0x40
str z12, [x3]
ldr z30, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z10, [x3]
addvl x3, sp, #2
saddlt z30.s, z30.h, z10.h
saddlt z24.s, z14.h, z11.h
add x3, x3, #0x40
str z14, [x3]
add z24.s, z30.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z11, [x3]
revw z19.d, p6/m, z19.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z20.s, z17.s
zip2 z20.s, z20.s, z17.s
zip1 z15.s, z24.s, z19.s
zip2 z24.s, z24.s, z19.s
add z30.s, z30.s, z15.s
add z24.s, z20.s, z24.s
uzp2 z20.d, z30.d, z24.d
revw z20.d, p6/m, z20.d
ptrue p5.s
uzp1 z30.d, z30.d, z24.d
ld1w {z14.s}, p7/z, [x2]
add z24.s, z20.s, z30.s
sub z30.s, z30.s, z20.s
movprfx z17, z24
mul z17.s, p7/m, z17.s, z14.s
addp z17.s, p5/m, z17.s, z17.s
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z9, [x3]
movprfx z19, z9
mul z19.s, p7/m, z19.s, z30.s
addp z19.s, p5/m, z19.s, z19.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z8, [x3]
mul z24.s, p7/m, z24.s, z8.s
addp z24.s, p5/m, z24.s, z24.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z3, [x3]
mul z30.s, p7/m, z30.s, z3.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x100
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z11.h}, p7/z, [x3]
zip1 z12.d, z20.d, z11.d
add x3, x0, #0x1c0
ld1h {z10.h}, p7/z, [x3]
zip2 z20.d, z20.d, z11.d
zip1 z11.d, z15.d, z10.d
zip2 z15.d, z15.d, z10.d
zip2 z7.d, z12.d, z11.d
zip1 z10.d, z12.d, z11.d
zip1 z12.d, z20.d, z15.d
revh z6.d, p6/m, z12.d
zip2 z20.d, z20.d, z15.d
revh z5.d, p6/m, z20.d
rev z18.h, z18.h
rev z16.h, z16.h
rev z26.h, z26.h
zip1 z20.d, z26.d, z18.d
rev z22.h, z22.h
zip2 z26.d, z26.d, z18.d
zip1 z18.d, z22.d, z16.d
zip2 z22.d, z22.d, z16.d
zip1 z16.d, z20.d, z18.d
zip2 z18.d, z20.d, z18.d
zip1 z20.d, z26.d, z22.d
revh z4.d, p6/m, z20.d
zip2 z26.d, z26.d, z22.d
revh z22.d, p6/m, z26.d
addvl x3, sp, #8
saddlb z26.s, z5.h, z22.h
saddlb z20.s, z10.h, z16.h
add x3, x3, #0x40
add z20.s, z20.s, z26.s
str z10, [x3]
ldr z26, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
str z16, [x3]
ldr z1, [x3]
addvl x3, sp, #0xb
saddlt z16.s, z26.h, z1.h
saddlt z26.s, z5.h, z22.h
add x3, x3, #0x40
str z5, [x3]
add z16.s, z16.s, z26.s
addvl x3, sp, #0xf
saddlb z26.s, z6.h, z4.h
add x3, x3, #0x40
str z22, [x3]
mov z22.d, z18.d
addvl x3, sp, #9
saddlb z18.s, z7.h, z18.h
add z18.s, z18.s, z26.s
add x3, x3, #0x40
str z7, [x3]
ldr z26, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
str z22, [x3]
ldr z1, [x3]
addvl x3, sp, #0xa
saddlt z26.s, z26.h, z1.h
saddlt z22.s, z6.h, z4.h
add x3, x3, #0x40
str z6, [x3]
add z22.s, z26.s, z22.s
addvl x3, sp, #0xe
add x3, x3, #0x40
str z4, [x3]
revw z18.d, p6/m, z18.d
revw z22.d, p6/m, z22.d
zip1 z26.s, z20.s, z16.s
zip2 z20.s, z20.s, z16.s
zip1 z15.s, z22.s, z18.s
zip2 z22.s, z22.s, z18.s
add z26.s, z26.s, z15.s
add z22.s, z20.s, z22.s
uzp2 z20.d, z26.d, z22.d
revw z20.d, p6/m, z20.d
uzp1 z26.d, z26.d, z22.d
add z10.s, z20.s, z26.s
sub z26.s, z26.s, z20.s
movprfx z6, z10
mul z6.s, p7/m, z6.s, z14.s
addp z6.s, p5/m, z6.s, z6.s
mov z5.d, z9.d
movprfx z7, z9
mul z7.s, p7/m, z7.s, z26.s
addp z7.s, p5/m, z7.s, z7.s
mov z4.d, z8.d
mul z10.s, p7/m, z10.s, z8.s
addp z10.s, p5/m, z10.s, z10.s
mul z26.s, p7/m, z26.s, z3.s
addp z26.s, p5/m, z26.s, z26.s
add x3, x0, #0x200
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x240
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z20.h}, p7/z, [x3]
zip1 z9.d, z15.d, z20.d
add x3, x0, #0x2c0
zip2 z15.d, z15.d, z20.d
ld1h {z18.h}, p7/z, [x3]
zip1 z20.d, z22.d, z18.d
zip2 z22.d, z22.d, z18.d
zip1 z1.d, z9.d, z20.d
zip1 z8.d, z15.d, z22.d
zip2 z9.d, z9.d, z20.d
revh z8.d, p6/m, z8.d
zip2 z15.d, z15.d, z22.d
revh z0.d, p6/m, z15.d
rev z25.h, z25.h
rev z23.h, z23.h
rev z28.h, z28.h
rev z31.h, z31.h
zip1 z20.d, z28.d, z25.d
zip2 z28.d, z28.d, z25.d
zip1 z25.d, z31.d, z23.d
zip2 z31.d, z31.d, z23.d
zip1 z18.d, z20.d, z25.d
zip1 z11.d, z28.d, z31.d
zip2 z20.d, z20.d, z25.d
revh z11.d, p6/m, z11.d
zip2 z28.d, z28.d, z31.d
revh z28.d, p6/m, z28.d
addvl x3, sp, #0x10
saddlb z31.s, z0.h, z28.h
saddlb z23.s, z1.h, z18.h
add x3, x3, #0x40
add z23.s, z23.s, z31.s
str z1, [x3]
ldr z31, [x3]
addvl x3, sp, #0x13
saddlt z25.s, z8.h, z11.h
add x3, x3, #0x40
str z18, [x3]
ldr z18, [x3]
addvl x3, sp, #0x12
saddlt z16.s, z31.h, z18.h
saddlt z31.s, z0.h, z28.h
add x3, x3, #0x40
add z16.s, z16.s, z31.s
saddlb z31.s, z8.h, z11.h
str z0, [x3]
addvl x3, sp, #0x11
saddlb z18.s, z9.h, z20.h
add x3, x3, #0x40
add z18.s, z18.s, z31.s
str z9, [x3]
ldr z31, [x3]
saddlt z31.s, z31.h, z20.h
add z25.s, z31.s, z25.s
revw z18.d, p6/m, z18.d
revw z25.d, p6/m, z25.d
zip1 z31.s, z23.s, z16.s
zip2 z23.s, z23.s, z16.s
zip1 z12.s, z25.s, z18.s
zip2 z25.s, z25.s, z18.s
add z31.s, z31.s, z12.s
add z25.s, z23.s, z25.s
uzp2 z23.d, z31.d, z25.d
revw z23.d, p6/m, z23.d
uzp1 z31.d, z31.d, z25.d
add z25.s, z23.s, z31.s
sub z31.s, z31.s, z23.s
movprfx z16, z25
mul z16.s, p7/m, z16.s, z14.s
addp z16.s, p5/m, z16.s, z16.s
mov z9.d, z5.d
movprfx z18, z5
mul z18.s, p7/m, z18.s, z31.s
addp z18.s, p5/m, z18.s, z18.s
mov z22.d, z4.d
mul z25.s, p7/m, z25.s, z4.s
addp z25.s, p5/m, z25.s, z25.s
mov z15.d, z3.d
mul z31.s, p7/m, z31.s, z3.s
addp z31.s, p5/m, z31.s, z31.s
add x3, x0, #0x300
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x340
ld1h {z12.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z4.h}, p7/z, [x3]
zip1 z5.d, z23.d, z4.d
add x3, x0, #0x3c0
ld1h {z3.h}, p7/z, [x3]
zip2 z23.d, z23.d, z4.d
zip1 z4.d, z12.d, z3.d
zip2 z12.d, z12.d, z3.d
zip2 z0.d, z5.d, z4.d
zip1 z3.d, z5.d, z4.d
zip1 z5.d, z23.d, z12.d
revh z1.d, p6/m, z5.d
add x3, sp, #0x40
zip2 z23.d, z23.d, z12.d
str z1, [x3]
revh z12.d, p6/m, z23.d
rev z23.h, z21.h
rev z13.h, z13.h
mov z1.d, z12.d
rev z29.h, z29.h
rev z27.h, z27.h
zip1 z21.d, z29.d, z13.d
zip2 z29.d, z29.d, z13.d
zip1 z13.d, z27.d, z23.d
zip2 z27.d, z27.d, z23.d
zip1 z23.d, z21.d, z13.d
zip1 z12.d, z29.d, z27.d
zip2 z21.d, z21.d, z13.d
revh z12.d, p6/m, z12.d
zip2 z29.d, z29.d, z27.d
revh z29.d, p6/m, z29.d
addvl x3, sp, #0x14
saddlb z27.s, z1.h, z29.h
saddlb z5.s, z3.h, z23.h
add x3, x3, #0x40
add z5.s, z5.s, z27.s
str z3, [x3]
ldr z27, [x3]
addvl x3, sp, #0x17
mov z13.d, z1.d
add x3, x3, #0x40
str z23, [x3]
ldr z3, [x3]
addvl x3, sp, #0x16
saddlt z1.s, z27.h, z3.h
saddlt z27.s, z13.h, z29.h
add x3, x3, #0x40
str z13, [x3]
add z1.s, z1.s, z27.s
add x3, sp, #0x40
ldr z23, [x3]
saddlb z27.s, z23.h, z12.h
addvl x3, sp, #0x15
saddlb z4.s, z0.h, z21.h
saddlt z13.s, z23.h, z12.h
add x3, x3, #0x40
add z4.s, z4.s, z27.s
str z0, [x3]
ldr z27, [x3]
saddlt z27.s, z27.h, z21.h
add z13.s, z27.s, z13.s
revw z4.d, p6/m, z4.d
revw z13.d, p6/m, z13.d
zip1 z27.s, z5.s, z1.s
zip2 z5.s, z5.s, z1.s
zip1 z0.s, z13.s, z4.s
zip2 z13.s, z13.s, z4.s
add z27.s, z27.s, z0.s
add z13.s, z5.s, z13.s
uzp2 z5.d, z27.d, z13.d
revw z5.d, p6/m, z5.d
uzp1 z27.d, z27.d, z13.d
add z13.s, z5.s, z27.s
sub z27.s, z27.s, z5.s
mul z14.s, p7/m, z14.s, z13.s
addp z14.s, p5/m, z14.s, z14.s
movprfx z5, z9
mul z5.s, p7/m, z5.s, z27.s
addp z5.s, p5/m, z5.s, z5.s
mul z13.s, p7/m, z13.s, z22.s
addp z13.s, p5/m, z13.s, z13.s
mul z27.s, p7/m, z27.s, z15.s
addp z27.s, p5/m, z27.s, z27.s
addvl x3, sp, #0x18
uzp1 z17.s, z17.s, z6.s
uzp1 z16.s, z16.s, z14.s
add x3, x3, #0x40
uzp1 z19.s, z19.s, z7.s
uzp1 z18.s, z18.s, z5.s
uzp1 z24.s, z24.s, z10.s
uzp1 z25.s, z25.s, z13.s
uzp1 z30.s, z30.s, z26.s
uzp1 z31.s, z31.s, z27.s
rshrnb z17.h, z17.s, #0xb
rshrnb z16.h, z16.s, #0xb
uzp1 z17.h, z17.h, z17.h
uzp1 z16.h, z16.h, z16.h
rshrnb z19.h, z19.s, #0xb
rshrnb z18.h, z18.s, #0xb
uzp1 z19.h, z19.h, z19.h
uzp1 z18.h, z18.h, z18.h
rshrnb z24.h, z24.s, #0xb
rshrnb z25.h, z25.s, #0xb
uzp1 z24.h, z24.h, z24.h
uzp1 z25.h, z25.h, z25.h
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z30.h, z30.h, z30.h
uzp1 z31.h, z31.h, z31.h
stp q17, q16, [x1]
stp q19, q18, [x1, #0x200]
str q24, [x1, #0x400]
str q25, [x1, #0x410]
str q30, [x1, #0x600]
str q31, [x1, #0x610]
str z2, [x3]
ldr z31, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z30, [x3]
sub z14.h, z31.h, z30.h
addvl x3, sp, #1
add x3, x3, #0x40
ldr z31, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z30, [x3]
sub z16.h, z31.h, z30.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z31, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z31.h, z30.h
revh z13.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z27, [x3]
sub z31.h, z15.h, z27.h
revh z10.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z18, [x3]
sub z6.h, z26.h, z18.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z18, [x3]
sub z7.h, z26.h, z18.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z4, [x3]
sub z31.h, z26.h, z4.h
revh z5.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
sub z31.h, z25.h, z23.h
revh z4.d, p6/m, z31.d
addvl x3, sp, #0x10
sub z31.h, z8.h, z11.h
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z19, [x3]
sub z0.h, z18.h, z19.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z18, [x3]
sub z1.h, z18.h, z20.h
revh z9.d, p6/m, z31.d
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z3.h, z28.h
revh z15.d, p6/m, z31.d
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z19, [x3]
sub z23.h, z18.h, z19.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z18, [x3]
sub z22.h, z18.h, z21.h
add x3, sp, #0x40
ldr z19, [x3]
sub z31.h, z19.h, z12.h
revh z2.d, p6/m, z31.d
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z18, [x3]
sub z31.h, z18.h, z29.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x1c
movi d31, #0000000000000000
ld1h {z24.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z17, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
addvl x3, sp, #0x1d
movprfx z25, z31
sdot z25.d, z7.h, z17.h
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x3, #0x40
ldr z19, [x3]
movprfx z26, z31
sdot z26.d, z22.h, z17.h
addvl x3, sp, #0x1e
sdot z30.d, z14.h, z24.h
sdot z25.d, z6.h, z24.h
add x3, x3, #0x40
ldr z18, [x3]
sdot z30.d, z13.h, z19.h
add x3, x1, #0x40
sdot z30.d, z10.h, z18.h
sdot z25.d, z5.h, z19.h
sdot z27.d, z0.h, z24.h
sdot z25.d, z4.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z23.h, z24.h
sdot z27.d, z15.h, z18.h
sdot z26.d, z2.h, z19.h
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z3.h, z18.h
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
cntb x3
cntb x6
lsl x3, x3, #5
lsl x6, x6, #5
add z11.h, z8.h, z11.h
add x3, sp, x3
add x3, x3, #0x40
ldr z17, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
addvl x3, sp, #0x1f
movprfx z25, z31
sdot z25.d, z7.h, z17.h
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x3, #0x40
ldr z19, [x3]
sdot z30.d, z14.h, z19.h
addvl x3, x6, #1
sdot z25.d, z6.h, z19.h
sdot z27.d, z0.h, z19.h
add x3, x3, #0x40
rdvl x6, #0x11
add x3, sp, x3
ldr z18, [x3]
sdot z30.d, z13.h, z18.h
rdvl x3, #0x11
sdot z25.d, z5.h, z18.h
sdot z27.d, z9.h, z18.h
lsl x3, x3, #1
lsl x6, x6, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z26, [x3]
sdot z25.d, z4.h, z26.h
sdot z30.d, z10.h, z26.h
sdot z27.d, z15.h, z26.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
ldr z17, [x3]
add x3, x1, #0xc0
sdot z26.d, z23.h, z19.h
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z2.h, z18.h
rshrnb z30.h, z30.s, #0xb
sdot z26.d, z3.h, z17.h
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x1a0
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z19.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z24.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z18.h
addvl x3, x6, #1
movprfx z25, z31
sdot z25.d, z7.h, z18.h
movprfx z27, z31
sdot z27.d, z1.h, z18.h
add x3, x3, #0x40
movprfx z26, z31
sdot z26.d, z22.h, z18.h
add x3, sp, x3
ldr z17, [x3]
sdot z30.d, z14.h, z17.h
add x3, x1, #0x140
sdot z30.d, z13.h, z19.h
sdot z25.d, z6.h, z17.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z5.h, z19.h
sdot z27.d, z0.h, z17.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z23.h, z17.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z2.h, z19.h
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z3.h, z24.h
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x240
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x260
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x1c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x280
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x2a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x2c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x2e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x240
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x300
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x340
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x360
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x2c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x380
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x3a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x3c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x3e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x340
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x400
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x420
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x440
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x460
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x3c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x480
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x4a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x4c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x4e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x440
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x500
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x540
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x560
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x4c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x580
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x5a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x5c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x5e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x540
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x600
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x620
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x640
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x660
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x5c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x680
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x6a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x6c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x6e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x640
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x700
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x720
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x740
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x760
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x6c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x780
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x7a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x7c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x7e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x740
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x800
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x820
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x840
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x860
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x7c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z2, [x3]
add z30.h, z17.h, z2.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
add z27.h, z17.h, z2.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z26, [x3]
add z25.h, z14.h, z26.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z24, [x3]
add z19.h, z15.h, z24.h
addvl x3, sp, #0xc
sub z26.h, z30.h, z19.h
sub z24.h, z27.h, z25.h
add x3, x3, #0x40
ldr z17, [x3]
add z30.h, z30.h, z19.h
addvl x3, sp, #8
add z27.h, z27.h, z25.h
add x3, x3, #0x40
ldr z16, [x3]
add z18.h, z17.h, z16.h
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
ldr z16, [x3]
add z17.h, z17.h, z16.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z6, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z4, [x3]
add z14.h, z6.h, z4.h
addvl x3, sp, #0xb
sub z13.h, z17.h, z14.h
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
add z10.h, z5.h, z23.h
addvl x3, sp, #0x13
sub z16.h, z18.h, z10.h
add x3, x3, #0x40
ldr z22, [x3]
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z15, [x3]
add z22.h, z22.h, z15.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z15, [x3]
add z20.h, z20.h, z15.h
addvl x3, sp, #0x12
sub z8.h, z20.h, z11.h
add x3, x3, #0x40
ldr z0, [x3]
add z28.h, z0.h, z28.h
addvl x3, sp, #0x17
sub z9.h, z22.h, z28.h
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z7, [x3]
add z23.h, z15.h, z7.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z15, [x3]
add z21.h, z21.h, z15.h
add x3, sp, #0x40
ldr z15, [x3]
add z12.h, z15.h, z12.h
addvl x3, sp, #0x16
sub z6.h, z21.h, z12.h
add x3, x3, #0x40
ldr z15, [x3]
add z29.h, z15.h, z29.h
add x3, x2, #0x880
ld1h {z4.h}, p7/z, [x3]
sub z7.h, z23.h, z29.h
add x3, x2, #0x8a0
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x80
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x8c0
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x8e0
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x180
movprfx z15, z31
sdot z15.d, z24.h, z3.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
sdot z15.d, z26.h, z4.h
sdot z1.d, z16.h, z4.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
sdot z5.d, z9.h, z4.h
sdot z2.d, z7.h, z4.h
uzp1 z15.s, z15.s, z1.s
uzp1 z5.s, z5.s, z2.s
rshrnb z15.h, z15.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x900
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x920
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x280
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x940
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x960
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x380
movprfx z15, z31
sdot z15.d, z24.h, z3.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
sdot z15.d, z26.h, z4.h
sdot z1.d, z16.h, z4.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
sdot z5.d, z9.h, z4.h
sdot z2.d, z7.h, z4.h
uzp1 z15.s, z15.s, z1.s
uzp1 z5.s, z5.s, z2.s
rshrnb z15.h, z15.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x980
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x9a0
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x480
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x9c0
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x9e0
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x580
movprfx z15, z31
sdot z15.d, z24.h, z3.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
sdot z15.d, z26.h, z4.h
sdot z1.d, z16.h, z4.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
sdot z5.d, z9.h, z4.h
sdot z2.d, z7.h, z4.h
uzp1 z15.s, z15.s, z1.s
uzp1 z5.s, z5.s, z2.s
rshrnb z15.h, z15.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0xa00
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0xa20
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x680
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0xa40
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0xa60
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x780
movprfx z15, z31
sdot z15.d, z24.h, z4.h
movprfx z24, z31
sdot z24.d, z8.h, z4.h
sdot z15.d, z26.h, z5.h
sdot z24.d, z9.h, z5.h
movprfx z26, z31
sdot z26.d, z13.h, z4.h
sdot z26.d, z16.h, z5.h
movprfx z16, z31
sdot z16.d, z6.h, z4.h
uzp1 z15.s, z15.s, z26.s
sdot z16.d, z7.h, z5.h
rshrnb z15.h, z15.s, #0xb
uzp1 z24.s, z24.s, z16.s
rshrnb z24.h, z24.s, #0xb
uzp1 z15.h, z15.h, z24.h
st1h {z15.h}, p7, [x3]
revh z27.d, p6/m, z27.d
sub z30.h, z30.h, z27.h
add z18.h, z18.h, z10.h
add z17.h, z17.h, z14.h
revh z17.d, p6/m, z17.d
sub z18.h, z18.h, z17.h
add z22.h, z22.h, z28.h
add z20.h, z20.h, z11.h
revh z20.d, p6/m, z20.d
sub z22.h, z22.h, z20.h
add z23.h, z23.h, z29.h
add z21.h, z21.h, z12.h
revh z21.d, p6/m, z21.d
add x3, x2, #0xa80
ld1h {z27.h}, p7/z, [x3]
sub z23.h, z23.h, z21.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z27.h
movprfx z25, z31
sdot z25.d, z18.h, z27.h
movprfx z26, z31
sdot z26.d, z23.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
uzp1 z29.s, z29.s, z25.s
uzp1 z28.s, z28.s, z26.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0xaa0
ld1h {z27.h}, p7/z, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z27.h
movprfx z25, z31
sdot z25.d, z18.h, z27.h
movprfx z26, z31
sdot z26.d, z23.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
uzp1 z29.s, z29.s, z25.s
uzp1 z28.s, z28.s, z26.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0xac0
ld1h {z27.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z30.h, z27.h
add x3, x1, #0x500
movprfx z25, z31
sdot z25.d, z18.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
movprfx z26, z31
sdot z26.d, z23.h, z27.h
uzp1 z29.s, z29.s, z25.s
uzp1 z28.s, z28.s, z26.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0xae0
add x0, x0, #0x400
ld1h {z27.h}, p7/z, [x3]
add x3, x1, #0x700
movprfx z29, z31
sdot z29.d, z30.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
movprfx z30, z31
sdot z30.d, z18.h, z27.h
sdot z31.d, z23.h, z27.h
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
add x3, x0, #0x20
ld1h {z30.h}, p7/z, [x3]
ld1h {z20.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z28.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z13.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z12.h}, p7/z, [x3]
zip1 z14.d, z20.d, z12.d
add x3, x0, #0xc0
zip2 z20.d, z20.d, z12.d
ld1h {z11.h}, p7/z, [x3]
zip1 z12.d, z15.d, z11.d
zip2 z15.d, z15.d, z11.d
zip1 z2.d, z14.d, z12.d
zip2 z12.d, z14.d, z12.d
zip1 z14.d, z20.d, z15.d
revh z14.d, p6/m, z14.d
zip2 z20.d, z20.d, z15.d
revh z15.d, p6/m, z20.d
rev z19.h, z19.h
rev z17.h, z17.h
rev z30.h, z30.h
zip1 z20.d, z30.d, z19.d
rev z24.h, z24.h
zip2 z30.d, z30.d, z19.d
zip1 z19.d, z24.d, z17.d
zip2 z24.d, z24.d, z17.d
zip1 z17.d, z20.d, z19.d
zip2 z19.d, z20.d, z19.d
zip1 z20.d, z30.d, z24.d
revh z11.d, p6/m, z20.d
zip2 z30.d, z30.d, z24.d
revh z24.d, p6/m, z30.d
addvl x3, sp, #4
saddlb z30.s, z15.h, z24.h
saddlb z20.s, z2.h, z17.h
add x3, x3, #0x40
str z17, [x3]
ldr z10, [x3]
addvl x3, sp, #3
add z20.s, z20.s, z30.s
saddlt z30.s, z15.h, z24.h
add x3, x3, #0x40
str z15, [x3]
saddlt z17.s, z2.h, z10.h
addvl x3, sp, #7
add z17.s, z17.s, z30.s
saddlb z30.s, z14.h, z11.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z19.d
addvl x3, sp, #1
saddlb z19.s, z12.h, z19.h
add z19.s, z19.s, z30.s
add x3, x3, #0x40
str z12, [x3]
ldr z30, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z10, [x3]
addvl x3, sp, #2
saddlt z30.s, z30.h, z10.h
saddlt z24.s, z14.h, z11.h
add x3, x3, #0x40
str z14, [x3]
add z24.s, z30.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z11, [x3]
revw z19.d, p6/m, z19.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z20.s, z17.s
zip2 z20.s, z20.s, z17.s
zip1 z15.s, z24.s, z19.s
zip2 z24.s, z24.s, z19.s
add z30.s, z30.s, z15.s
add z24.s, z20.s, z24.s
uzp2 z20.d, z30.d, z24.d
revw z20.d, p6/m, z20.d
ptrue p5.s
uzp1 z30.d, z30.d, z24.d
ld1w {z14.s}, p7/z, [x2]
add z24.s, z20.s, z30.s
sub z30.s, z30.s, z20.s
movprfx z17, z24
mul z17.s, p7/m, z17.s, z14.s
addp z17.s, p5/m, z17.s, z17.s
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z9, [x3]
movprfx z19, z9
mul z19.s, p7/m, z19.s, z30.s
addp z19.s, p5/m, z19.s, z19.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z8, [x3]
mul z24.s, p7/m, z24.s, z8.s
addp z24.s, p5/m, z24.s, z24.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z3, [x3]
mul z30.s, p7/m, z30.s, z3.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x100
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z11.h}, p7/z, [x3]
zip1 z12.d, z20.d, z11.d
add x3, x0, #0x1c0
ld1h {z10.h}, p7/z, [x3]
zip2 z20.d, z20.d, z11.d
zip1 z11.d, z15.d, z10.d
zip2 z15.d, z15.d, z10.d
zip2 z7.d, z12.d, z11.d
zip1 z10.d, z12.d, z11.d
zip1 z12.d, z20.d, z15.d
revh z6.d, p6/m, z12.d
zip2 z20.d, z20.d, z15.d
revh z5.d, p6/m, z20.d
rev z18.h, z18.h
rev z16.h, z16.h
rev z26.h, z26.h
zip1 z20.d, z26.d, z18.d
rev z22.h, z22.h
zip2 z26.d, z26.d, z18.d
zip1 z18.d, z22.d, z16.d
zip2 z22.d, z22.d, z16.d
zip1 z16.d, z20.d, z18.d
zip2 z18.d, z20.d, z18.d
zip1 z20.d, z26.d, z22.d
revh z4.d, p6/m, z20.d
zip2 z26.d, z26.d, z22.d
revh z22.d, p6/m, z26.d
addvl x3, sp, #8
saddlb z26.s, z5.h, z22.h
saddlb z20.s, z10.h, z16.h
add x3, x3, #0x40
add z20.s, z20.s, z26.s
str z10, [x3]
ldr z26, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
str z16, [x3]
ldr z1, [x3]
addvl x3, sp, #0xb
saddlt z16.s, z26.h, z1.h
saddlt z26.s, z5.h, z22.h
add x3, x3, #0x40
str z5, [x3]
add z16.s, z16.s, z26.s
addvl x3, sp, #0xf
saddlb z26.s, z6.h, z4.h
add x3, x3, #0x40
str z22, [x3]
mov z22.d, z18.d
addvl x3, sp, #9
saddlb z18.s, z7.h, z18.h
add z18.s, z18.s, z26.s
add x3, x3, #0x40
str z7, [x3]
ldr z26, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
str z22, [x3]
ldr z1, [x3]
addvl x3, sp, #0xa
saddlt z26.s, z26.h, z1.h
saddlt z22.s, z6.h, z4.h
add x3, x3, #0x40
str z6, [x3]
add z22.s, z26.s, z22.s
addvl x3, sp, #0xe
add x3, x3, #0x40
str z4, [x3]
revw z18.d, p6/m, z18.d
revw z22.d, p6/m, z22.d
zip1 z26.s, z20.s, z16.s
zip2 z20.s, z20.s, z16.s
zip1 z15.s, z22.s, z18.s
zip2 z22.s, z22.s, z18.s
add z26.s, z26.s, z15.s
add z22.s, z20.s, z22.s
uzp2 z20.d, z26.d, z22.d
revw z20.d, p6/m, z20.d
uzp1 z26.d, z26.d, z22.d
add z10.s, z20.s, z26.s
sub z26.s, z26.s, z20.s
movprfx z6, z10
mul z6.s, p7/m, z6.s, z14.s
addp z6.s, p5/m, z6.s, z6.s
mov z5.d, z9.d
movprfx z7, z9
mul z7.s, p7/m, z7.s, z26.s
addp z7.s, p5/m, z7.s, z7.s
mov z4.d, z8.d
mul z10.s, p7/m, z10.s, z8.s
addp z10.s, p5/m, z10.s, z10.s
mul z26.s, p7/m, z26.s, z3.s
addp z26.s, p5/m, z26.s, z26.s
add x3, x0, #0x200
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x240
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z20.h}, p7/z, [x3]
zip1 z9.d, z15.d, z20.d
add x3, x0, #0x2c0
zip2 z15.d, z15.d, z20.d
ld1h {z18.h}, p7/z, [x3]
zip1 z20.d, z22.d, z18.d
zip2 z22.d, z22.d, z18.d
zip1 z1.d, z9.d, z20.d
zip1 z8.d, z15.d, z22.d
zip2 z9.d, z9.d, z20.d
revh z8.d, p6/m, z8.d
zip2 z15.d, z15.d, z22.d
revh z0.d, p6/m, z15.d
rev z25.h, z25.h
rev z23.h, z23.h
rev z28.h, z28.h
rev z31.h, z31.h
zip1 z20.d, z28.d, z25.d
zip2 z28.d, z28.d, z25.d
zip1 z25.d, z31.d, z23.d
zip2 z31.d, z31.d, z23.d
zip1 z18.d, z20.d, z25.d
zip1 z11.d, z28.d, z31.d
zip2 z20.d, z20.d, z25.d
revh z11.d, p6/m, z11.d
zip2 z28.d, z28.d, z31.d
revh z28.d, p6/m, z28.d
addvl x3, sp, #0x10
saddlb z31.s, z0.h, z28.h
saddlb z23.s, z1.h, z18.h
add x3, x3, #0x40
add z23.s, z23.s, z31.s
str z1, [x3]
ldr z31, [x3]
addvl x3, sp, #0x13
saddlt z25.s, z8.h, z11.h
add x3, x3, #0x40
str z18, [x3]
ldr z18, [x3]
addvl x3, sp, #0x12
saddlt z16.s, z31.h, z18.h
saddlt z31.s, z0.h, z28.h
add x3, x3, #0x40
add z16.s, z16.s, z31.s
saddlb z31.s, z8.h, z11.h
str z0, [x3]
addvl x3, sp, #0x11
saddlb z18.s, z9.h, z20.h
add x3, x3, #0x40
add z18.s, z18.s, z31.s
str z9, [x3]
ldr z31, [x3]
saddlt z31.s, z31.h, z20.h
add z25.s, z31.s, z25.s
revw z18.d, p6/m, z18.d
revw z25.d, p6/m, z25.d
zip1 z31.s, z23.s, z16.s
zip2 z23.s, z23.s, z16.s
zip1 z12.s, z25.s, z18.s
zip2 z25.s, z25.s, z18.s
add z31.s, z31.s, z12.s
add z25.s, z23.s, z25.s
uzp2 z23.d, z31.d, z25.d
revw z23.d, p6/m, z23.d
uzp1 z31.d, z31.d, z25.d
add z25.s, z23.s, z31.s
sub z31.s, z31.s, z23.s
movprfx z16, z25
mul z16.s, p7/m, z16.s, z14.s
addp z16.s, p5/m, z16.s, z16.s
mov z9.d, z5.d
movprfx z18, z5
mul z18.s, p7/m, z18.s, z31.s
addp z18.s, p5/m, z18.s, z18.s
mov z22.d, z4.d
mul z25.s, p7/m, z25.s, z4.s
addp z25.s, p5/m, z25.s, z25.s
mov z15.d, z3.d
mul z31.s, p7/m, z31.s, z3.s
addp z31.s, p5/m, z31.s, z31.s
add x3, x0, #0x300
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x340
ld1h {z12.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z4.h}, p7/z, [x3]
zip1 z5.d, z23.d, z4.d
add x3, x0, #0x3c0
ld1h {z3.h}, p7/z, [x3]
zip2 z23.d, z23.d, z4.d
zip1 z4.d, z12.d, z3.d
zip2 z12.d, z12.d, z3.d
zip2 z0.d, z5.d, z4.d
zip1 z3.d, z5.d, z4.d
zip1 z5.d, z23.d, z12.d
revh z1.d, p6/m, z5.d
add x3, sp, #0x40
zip2 z23.d, z23.d, z12.d
str z1, [x3]
revh z12.d, p6/m, z23.d
rev z23.h, z21.h
rev z13.h, z13.h
mov z1.d, z12.d
rev z29.h, z29.h
rev z27.h, z27.h
zip1 z21.d, z29.d, z13.d
zip2 z29.d, z29.d, z13.d
zip1 z13.d, z27.d, z23.d
zip2 z27.d, z27.d, z23.d
zip1 z23.d, z21.d, z13.d
zip1 z12.d, z29.d, z27.d
zip2 z21.d, z21.d, z13.d
revh z12.d, p6/m, z12.d
zip2 z29.d, z29.d, z27.d
revh z29.d, p6/m, z29.d
addvl x3, sp, #0x14
saddlb z27.s, z1.h, z29.h
saddlb z5.s, z3.h, z23.h
add x3, x3, #0x40
add z5.s, z5.s, z27.s
str z3, [x3]
ldr z27, [x3]
addvl x3, sp, #0x17
mov z13.d, z1.d
add x3, x3, #0x40
str z23, [x3]
ldr z3, [x3]
addvl x3, sp, #0x16
saddlt z1.s, z27.h, z3.h
saddlt z27.s, z13.h, z29.h
add x3, x3, #0x40
str z13, [x3]
add z1.s, z1.s, z27.s
add x3, sp, #0x40
ldr z23, [x3]
saddlb z27.s, z23.h, z12.h
addvl x3, sp, #0x15
saddlb z4.s, z0.h, z21.h
saddlt z13.s, z23.h, z12.h
add x3, x3, #0x40
add z4.s, z4.s, z27.s
str z0, [x3]
ldr z27, [x3]
saddlt z27.s, z27.h, z21.h
add z13.s, z27.s, z13.s
revw z4.d, p6/m, z4.d
revw z13.d, p6/m, z13.d
zip1 z27.s, z5.s, z1.s
zip2 z5.s, z5.s, z1.s
zip1 z0.s, z13.s, z4.s
zip2 z13.s, z13.s, z4.s
add z27.s, z27.s, z0.s
add z13.s, z5.s, z13.s
uzp2 z5.d, z27.d, z13.d
revw z5.d, p6/m, z5.d
uzp1 z27.d, z27.d, z13.d
add z13.s, z5.s, z27.s
sub z27.s, z27.s, z5.s
mul z14.s, p7/m, z14.s, z13.s
addp z14.s, p5/m, z14.s, z14.s
movprfx z5, z9
mul z5.s, p7/m, z5.s, z27.s
addp z5.s, p5/m, z5.s, z5.s
mul z13.s, p7/m, z13.s, z22.s
addp z13.s, p5/m, z13.s, z13.s
mul z27.s, p7/m, z27.s, z15.s
addp z27.s, p5/m, z27.s, z27.s
addvl x3, sp, #0x18
uzp1 z17.s, z17.s, z6.s
uzp1 z16.s, z16.s, z14.s
add x3, x3, #0x40
uzp1 z19.s, z19.s, z7.s
uzp1 z18.s, z18.s, z5.s
uzp1 z24.s, z24.s, z10.s
uzp1 z25.s, z25.s, z13.s
uzp1 z30.s, z30.s, z26.s
uzp1 z31.s, z31.s, z27.s
rshrnb z17.h, z17.s, #0xb
rshrnb z16.h, z16.s, #0xb
uzp1 z17.h, z17.h, z17.h
uzp1 z16.h, z16.h, z16.h
rshrnb z19.h, z19.s, #0xb
rshrnb z18.h, z18.s, #0xb
uzp1 z19.h, z19.h, z19.h
uzp1 z18.h, z18.h, z18.h
rshrnb z24.h, z24.s, #0xb
rshrnb z25.h, z25.s, #0xb
uzp1 z24.h, z24.h, z24.h
uzp1 z25.h, z25.h, z25.h
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z30.h, z30.h, z30.h
uzp1 z31.h, z31.h, z31.h
stp q17, q16, [x1]
stp q19, q18, [x1, #0x200]
str q24, [x1, #0x400]
str q25, [x1, #0x410]
str q30, [x1, #0x600]
str q31, [x1, #0x610]
str z2, [x3]
ldr z31, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z30, [x3]
sub z14.h, z31.h, z30.h
addvl x3, sp, #1
add x3, x3, #0x40
ldr z31, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z30, [x3]
sub z16.h, z31.h, z30.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z31, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z31.h, z30.h
revh z13.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z27, [x3]
sub z31.h, z15.h, z27.h
revh z10.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z18, [x3]
sub z6.h, z26.h, z18.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z18, [x3]
sub z7.h, z26.h, z18.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z4, [x3]
sub z31.h, z26.h, z4.h
revh z5.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
sub z31.h, z25.h, z23.h
revh z4.d, p6/m, z31.d
addvl x3, sp, #0x10
sub z31.h, z8.h, z11.h
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z19, [x3]
sub z0.h, z18.h, z19.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z18, [x3]
sub z1.h, z18.h, z20.h
revh z9.d, p6/m, z31.d
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z3.h, z28.h
revh z15.d, p6/m, z31.d
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z19, [x3]
sub z23.h, z18.h, z19.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z18, [x3]
sub z22.h, z18.h, z21.h
add x3, sp, #0x40
ldr z19, [x3]
sub z31.h, z19.h, z12.h
revh z2.d, p6/m, z31.d
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z18, [x3]
sub z31.h, z18.h, z29.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x1c
movi d31, #0000000000000000
ld1h {z24.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z17, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
addvl x3, sp, #0x1d
movprfx z25, z31
sdot z25.d, z7.h, z17.h
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x3, #0x40
ldr z19, [x3]
movprfx z26, z31
sdot z26.d, z22.h, z17.h
addvl x3, sp, #0x1e
sdot z30.d, z14.h, z24.h
sdot z25.d, z6.h, z24.h
add x3, x3, #0x40
ldr z18, [x3]
sdot z30.d, z13.h, z19.h
add x3, x1, #0x40
sdot z30.d, z10.h, z18.h
sdot z25.d, z5.h, z19.h
sdot z27.d, z0.h, z24.h
sdot z25.d, z4.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z23.h, z24.h
sdot z27.d, z15.h, z18.h
sdot z26.d, z2.h, z19.h
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z3.h, z18.h
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
cntb x3
cntb x6
lsl x3, x3, #5
lsl x6, x6, #5
add z11.h, z8.h, z11.h
add x3, sp, x3
add x3, x3, #0x40
ldr z17, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
addvl x3, sp, #0x1f
movprfx z25, z31
sdot z25.d, z7.h, z17.h
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x3, #0x40
ldr z19, [x3]
sdot z30.d, z14.h, z19.h
addvl x3, x6, #1
sdot z25.d, z6.h, z19.h
sdot z27.d, z0.h, z19.h
add x3, x3, #0x40
rdvl x6, #0x11
add x3, sp, x3
ldr z18, [x3]
sdot z30.d, z13.h, z18.h
rdvl x3, #0x11
sdot z25.d, z5.h, z18.h
sdot z27.d, z9.h, z18.h
lsl x3, x3, #1
lsl x6, x6, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z26, [x3]
sdot z25.d, z4.h, z26.h
sdot z30.d, z10.h, z26.h
sdot z27.d, z15.h, z26.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
ldr z17, [x3]
add x3, x1, #0xc0
sdot z26.d, z23.h, z19.h
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z2.h, z18.h
rshrnb z30.h, z30.s, #0xb
sdot z26.d, z3.h, z17.h
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x1a0
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z19.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z24.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z18.h
addvl x3, x6, #1
movprfx z25, z31
sdot z25.d, z7.h, z18.h
movprfx z27, z31
sdot z27.d, z1.h, z18.h
add x3, x3, #0x40
movprfx z26, z31
sdot z26.d, z22.h, z18.h
add x3, sp, x3
ldr z17, [x3]
sdot z30.d, z14.h, z17.h
add x3, x1, #0x140
sdot z30.d, z13.h, z19.h
sdot z25.d, z6.h, z17.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z5.h, z19.h
sdot z27.d, z0.h, z17.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z23.h, z17.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z2.h, z19.h
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z3.h, z24.h
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x240
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x260
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x1c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x280
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x2a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x2c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x2e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x240
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x300
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x340
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x360
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x2c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x380
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x3a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x3c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x3e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x340
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x400
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x420
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x440
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x460
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x3c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x480
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x4a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x4c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x4e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x440
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x500
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x540
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x560
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x4c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x580
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x5a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x5c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x5e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x540
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x600
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x620
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x640
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x660
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x5c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x680
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x6a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x6c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x6e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x640
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x700
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x720
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x740
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x760
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x6c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x780
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x7a0
ld1h {z17.h}, p7/z, [x3]
add x3, x2, #0x7c0
ld1h {z19.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x7e0
ld1h {z24.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x1, #0x740
movprfx z27, z31
sdot z27.d, z1.h, z17.h
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x800
ld1h {z18.h}, p7/z, [x3]
add x3, x2, #0x820
ld1h {z17.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z16.h, z17.h
add x3, x2, #0x840
ld1h {z19.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z7.h, z17.h
add x3, x2, #0x860
ld1h {z24.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z17.h
add x3, x1, #0x7c0
movprfx z26, z31
sdot z26.d, z22.h, z17.h
sdot z30.d, z14.h, z18.h
sdot z25.d, z6.h, z18.h
sdot z30.d, z13.h, z19.h
sdot z25.d, z5.h, z19.h
sdot z30.d, z10.h, z24.h
sdot z25.d, z4.h, z24.h
sdot z27.d, z0.h, z18.h
sdot z26.d, z23.h, z18.h
sdot z27.d, z9.h, z19.h
sdot z26.d, z2.h, z19.h
sdot z27.d, z15.h, z24.h
sdot z26.d, z3.h, z24.h
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z2, [x3]
add z30.h, z17.h, z2.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
add z27.h, z17.h, z2.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z26, [x3]
add z25.h, z14.h, z26.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z24, [x3]
add z19.h, z15.h, z24.h
addvl x3, sp, #0xc
sub z26.h, z30.h, z19.h
sub z24.h, z27.h, z25.h
add x3, x3, #0x40
ldr z17, [x3]
add z30.h, z30.h, z19.h
addvl x3, sp, #8
add z27.h, z27.h, z25.h
add x3, x3, #0x40
ldr z16, [x3]
add z18.h, z17.h, z16.h
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
ldr z16, [x3]
add z17.h, z17.h, z16.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z6, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z4, [x3]
add z14.h, z6.h, z4.h
addvl x3, sp, #0xb
sub z13.h, z17.h, z14.h
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
add z10.h, z5.h, z23.h
addvl x3, sp, #0x13
sub z16.h, z18.h, z10.h
add x3, x3, #0x40
ldr z22, [x3]
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z15, [x3]
add z22.h, z22.h, z15.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z15, [x3]
add z20.h, z20.h, z15.h
addvl x3, sp, #0x12
sub z8.h, z20.h, z11.h
add x3, x3, #0x40
ldr z0, [x3]
add z28.h, z0.h, z28.h
addvl x3, sp, #0x17
sub z9.h, z22.h, z28.h
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z7, [x3]
add z23.h, z15.h, z7.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z15, [x3]
add z21.h, z21.h, z15.h
add x3, sp, #0x40
ldr z15, [x3]
add z12.h, z15.h, z12.h
addvl x3, sp, #0x16
sub z6.h, z21.h, z12.h
add x3, x3, #0x40
ldr z15, [x3]
add z29.h, z15.h, z29.h
add x3, x2, #0x880
ld1h {z4.h}, p7/z, [x3]
sub z7.h, z23.h, z29.h
add x3, x2, #0x8a0
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x80
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x8c0
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x8e0
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x180
movprfx z15, z31
sdot z15.d, z24.h, z3.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
sdot z15.d, z26.h, z4.h
sdot z1.d, z16.h, z4.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
sdot z5.d, z9.h, z4.h
sdot z2.d, z7.h, z4.h
uzp1 z15.s, z15.s, z1.s
uzp1 z5.s, z5.s, z2.s
rshrnb z15.h, z15.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x900
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x920
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x280
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x940
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x960
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x380
movprfx z15, z31
sdot z15.d, z24.h, z3.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
sdot z15.d, z26.h, z4.h
sdot z1.d, z16.h, z4.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
sdot z5.d, z9.h, z4.h
sdot z2.d, z7.h, z4.h
uzp1 z15.s, z15.s, z1.s
uzp1 z5.s, z5.s, z2.s
rshrnb z15.h, z15.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x980
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x9a0
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x480
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0x9c0
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0x9e0
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x580
movprfx z15, z31
sdot z15.d, z24.h, z3.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
sdot z15.d, z26.h, z4.h
sdot z1.d, z16.h, z4.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
sdot z5.d, z9.h, z4.h
sdot z2.d, z7.h, z4.h
uzp1 z15.s, z15.s, z1.s
uzp1 z5.s, z5.s, z2.s
rshrnb z15.h, z15.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0xa00
ld1h {z4.h}, p7/z, [x3]
add x3, x2, #0xa20
ld1h {z3.h}, p7/z, [x3]
movprfx z15, z31
sdot z15.d, z24.h, z3.h
add x3, x1, #0x680
sdot z15.d, z26.h, z4.h
movprfx z1, z31
sdot z1.d, z13.h, z3.h
movprfx z5, z31
sdot z5.d, z8.h, z3.h
sdot z1.d, z16.h, z4.h
sdot z5.d, z9.h, z4.h
movprfx z2, z31
sdot z2.d, z6.h, z3.h
uzp1 z15.s, z15.s, z1.s
sdot z2.d, z7.h, z4.h
rshrnb z15.h, z15.s, #0xb
uzp1 z5.s, z5.s, z2.s
rshrnb z5.h, z5.s, #0xb
uzp1 z15.h, z15.h, z5.h
st1h {z15.h}, p7, [x3]
add x3, x2, #0xa40
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0xa60
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x780
movprfx z15, z31
sdot z15.d, z24.h, z4.h
movprfx z24, z31
sdot z24.d, z8.h, z4.h
sdot z15.d, z26.h, z5.h
sdot z24.d, z9.h, z5.h
movprfx z26, z31
sdot z26.d, z13.h, z4.h
sdot z26.d, z16.h, z5.h
movprfx z16, z31
sdot z16.d, z6.h, z4.h
uzp1 z15.s, z15.s, z26.s
sdot z16.d, z7.h, z5.h
rshrnb z15.h, z15.s, #0xb
uzp1 z24.s, z24.s, z16.s
rshrnb z24.h, z24.s, #0xb
uzp1 z15.h, z15.h, z24.h
st1h {z15.h}, p7, [x3]
revh z27.d, p6/m, z27.d
sub z30.h, z30.h, z27.h
add z18.h, z18.h, z10.h
add z17.h, z17.h, z14.h
revh z17.d, p6/m, z17.d
sub z18.h, z18.h, z17.h
add z22.h, z22.h, z28.h
add z20.h, z20.h, z11.h
revh z20.d, p6/m, z20.d
sub z22.h, z22.h, z20.h
add z23.h, z23.h, z29.h
add z21.h, z21.h, z12.h
revh z21.d, p6/m, z21.d
add x3, x2, #0xa80
ld1h {z27.h}, p7/z, [x3]
sub z23.h, z23.h, z21.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z27.h
movprfx z25, z31
sdot z25.d, z18.h, z27.h
movprfx z26, z31
sdot z26.d, z23.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
uzp1 z29.s, z29.s, z25.s
uzp1 z28.s, z28.s, z26.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0xaa0
ld1h {z27.h}, p7/z, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z27.h
movprfx z25, z31
sdot z25.d, z18.h, z27.h
movprfx z26, z31
sdot z26.d, z23.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
uzp1 z29.s, z29.s, z25.s
uzp1 z28.s, z28.s, z26.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0xac0
ld1h {z27.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z30.h, z27.h
add x3, x1, #0x500
movprfx z25, z31
sdot z25.d, z18.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
movprfx z26, z31
sdot z26.d, z23.h, z27.h
uzp1 z29.s, z29.s, z25.s
uzp1 z28.s, z28.s, z26.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0xae0
add x0, x0, #0x400
ld1h {z27.h}, p7/z, [x3]
add x3, x1, #0x700
movprfx z29, z31
sdot z29.d, z30.h, z27.h
movprfx z28, z31
sdot z28.d, z22.h, z27.h
movprfx z30, z31
sdot z30.d, z18.h, z27.h
sdot z31.d, z23.h, z27.h
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
cntb x12, all, mul #9
lsl x12, x12, #2
ldp d8, d9, [sp]
ldp d10, d11, [sp, #0x10]
ldp d12, d13, [sp, #0x20]
ldp d14, d15, [sp, #0x30]
add sp, sp, x12
add sp, sp, #0x40
ldr x19, [sp, #0x10]
ldp x29, x30, [sp]
add sp, sp, #0x820
stp x29, x30, [sp, #-0x20]!
