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
add x3, x3, #0xfb0
add x11, x3, #0x20
add x5, x2, x2, lsl #1
add x7, x2, x2, lsl #2
lsl x18, x2, #3
stp x29, x30, [sp]
mov x29, sp
lsl x8, x2, #4
ld1w {z31.s}, p7/z, [x11]
add x11, sp, #0x70
stp x19, x20, [sp, #0x10]
sub x9, x18, x2
add x10, x18, x2
str x21, [sp, #0x20]
sub x8, x8, x2
stp d8, d9, [sp, #0x30]
add x17, x0, x5, lsl #1
add x16, x0, x7, lsl #1
stp d10, d11, [sp, #0x40]
add x15, x0, x5, lsl #2
add x13, x0, x7, lsl #2
stp d12, d13, [sp, #0x50]
add x7, x2, x7, lsl #1
add x12, x0, x5, lsl #3
stp d14, d15, [sp, #0x60]
add x5, x2, x5, lsl #2
str z31, [x11]
add x11, x3, #0x40
ld1w {z31.s}, p7/z, [x11]
addvl x11, sp, #1
lsl x4, x2, #5
add x11, x11, #0x70
str z31, [x11]
add x19, x0, x2, lsl #1
add x11, x3, #0x60
ld1w {z31.s}, p7/z, [x11]
add x30, x0, x2, lsl #2
addvl x11, sp, #2
add x2, x0, x2, lsl #3
add x11, x11, #0x70
str z31, [x11]
add x14, x0, x9, lsl #1
add x11, x3, #0x180
ld1h {z31.h}, p7/z, [x11]
add x10, x0, x10, lsl #1
addvl x11, sp, #0x1b
add x7, x0, x7, lsl #1
add x11, x11, #0x70
str z31, [x11]
add x5, x0, x5, lsl #1
add x11, x3, #0x280
ld1h {z31.h}, p7/z, [x11]
add x9, x0, x9, lsl #2
addvl x11, sp, #0x1c
add x8, x0, x8, lsl #1
add x11, x11, #0x70
str z31, [x11]
add x20, x1, #0x40
add x11, x3, #0x380
ld1h {z31.h}, p7/z, [x11]
add x18, x18, x2
addvl x11, sp, #0x1d
add x21, x3, #0x80
add x11, x11, #0x70
str z31, [x11]
mov x6, #0
add x11, x3, #0xa0
ld1h {z12.h}, p7/z, [x11]
mov z4.d, z12.d
add x11, x3, #0x1a0
ld1h {z13.h}, p7/z, [x11]
mov z8.d, z13.d
add x11, x3, #0x2a0
ld1h {z11.h}, p7/z, [x11]
mov z5.d, z11.d
add x11, x3, #0x3a0
ld1h {z9.h}, p7/z, [x11]
mov z3.d, z9.d
add x11, x3, #0x100
ld1h {z10.h}, p7/z, [x11]
mov z0.d, z10.d
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
addvl x11, sp, #0x12
rev z30.h, z30.h
add x11, x11, #0x70
sub z25.h, z22.h, z30.h
str z25, [x11]
add x11, x17, #0x20
add z22.h, z22.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
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
addvl x11, sp, #0x14
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
addvl x11, sp, #0x15
add x11, x11, #0x70
rev z30.h, z30.h
sub z21.h, z27.h, z30.h
str z21, [x11]
add x11, x10, #0x20
add z27.h, z27.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x16
ld1h {z25.h}, p7/z, [x10]
add x11, x11, #0x70
rev z30.h, z30.h
sub z19.h, z25.h, z30.h
str z19, [x11]
add x11, x13, #0x20
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x17
ld1h {z23.h}, p7/z, [x13]
add x11, x11, #0x70
rev z30.h, z30.h
sub z17.h, z23.h, z30.h
str z17, [x11]
addvl x11, sp, #3
add z30.h, z23.h, z30.h
add x11, x11, #0x70
str z30, [x11]
ld1h {z1.h}, p7/z, [x7]
add x11, x7, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x12, #0x20
sub z7.h, z1.h, z30.h
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x12]
ld1h {z23.h}, p7/z, [x11]
add x11, x5, #0x20
rev z23.h, z23.h
sub z16.h, z30.h, z23.h
add z30.h, z30.h, z23.h
ld1h {z23.h}, p7/z, [x11]
add x11, x9, #0x20
rev z23.h, z23.h
ld1h {z19.h}, p7/z, [x5]
sub z15.h, z19.h, z23.h
add z19.h, z19.h, z23.h
ld1h {z23.h}, p7/z, [x11]
addvl x11, sp, #0x18
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
zip2 z17.d, z23.d, z22.d
zip1 z24.d, z31.d, z29.d
revh z24.d, p6/m, z24.d
zip2 z31.d, z31.d, z29.d
revh z31.d, p6/m, z31.d
addvl x11, sp, #7
saddlb z23.s, z21.h, z31.h
saddlb z22.s, z17.h, z24.h
add x11, x11, #0x70
str z21, [x11]
ldr z29, [x11]
addvl x11, sp, #0xa
saddlt z21.s, z29.h, z31.h
add x11, x11, #0x70
str z31, [x11]
addvl x11, sp, #8
add x11, x11, #0x70
str z17, [x11]
ldr z29, [x11]
addvl x11, sp, #9
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
uzp1 z31.d, z31.d, z24.d
ld1w {z21.s}, p7/z, [x3]
add z24.s, z23.s, z31.s
sub z29.s, z31.s, z23.s
ptrue p5.s
movprfx z23, z24
mul z23.s, p7/m, z23.s, z21.s
mov z31.d, z23.d
addp z31.s, p5/m, z31.s, z23.s
addvl x11, sp, #0x19
add x11, x11, #0x70
str z31, [x11]
add x11, sp, #0x70
ldr z23, [x11]
mul z23.s, p7/m, z23.s, z29.s
addp z23.s, p5/m, z23.s, z23.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z31, [x11]
mul z24.s, p7/m, z24.s, z31.s
addp z24.s, p5/m, z24.s, z24.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z17, [x11]
mul z29.s, p7/m, z29.s, z17.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z31.d, z28.d, z18.d
zip2 z28.d, z28.d, z18.d
zip1 z18.d, z26.d, z20.d
zip2 z26.d, z26.d, z20.d
zip1 z20.d, z31.d, z18.d
zip2 z18.d, z31.d, z18.d
zip1 z31.d, z28.d, z26.d
revh z31.d, p6/m, z31.d
zip2 z28.d, z28.d, z26.d
revh z26.d, p6/m, z28.d
addvl x11, sp, #0xb
mov z28.d, z20.d
saddlb z20.s, z20.h, z26.h
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #0xe
saddlt z17.s, z22.h, z26.h
mov z28.d, z18.d
add x11, x11, #0x70
str z26, [x11]
saddlb z18.s, z18.h, z31.h
addvl x11, sp, #0xc
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #0xd
saddlt z26.s, z22.h, z31.h
add x11, x11, #0x70
str z31, [x11]
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
add x11, sp, #0x70
ldr z18, [x11]
mul z18.s, p7/m, z18.s, z28.s
addp z18.s, p5/m, z18.s, z18.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z26, [x11]
mul z20.s, p7/m, z20.s, z26.s
addp z20.s, p5/m, z20.s, z20.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z26, [x11]
mul z28.s, p7/m, z28.s, z26.s
mov z31.d, z28.d
addp z31.s, p5/m, z31.s, z28.s
addvl x11, sp, #0x1a
zip1 z26.d, z25.d, z1.d
zip2 z25.d, z25.d, z1.d
add x11, x11, #0x70
str z31, [x11]
addvl x11, sp, #3
add x11, x11, #0x70
ldr z22, [x11]
zip1 z31.d, z27.d, z22.d
zip2 z27.d, z27.d, z22.d
zip1 z1.d, z31.d, z26.d
zip2 z28.d, z31.d, z26.d
zip1 z31.d, z27.d, z25.d
revh z31.d, p6/m, z31.d
zip2 z27.d, z27.d, z25.d
revh z27.d, p6/m, z27.d
addvl x11, sp, #0xf
saddlb z26.s, z1.h, z27.h
saddlb z25.s, z28.h, z31.h
add x11, x11, #0x70
str z1, [x11]
ldr z22, [x11]
addvl x11, sp, #4
saddlt z1.s, z22.h, z27.h
add x11, x11, #0x70
str z27, [x11]
addvl x11, sp, #0x10
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #3
saddlt z27.s, z22.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z25.d, p6/m, z25.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z26.s, z1.s
zip2 z26.s, z26.s, z1.s
zip1 z22.s, z27.s, z25.s
zip2 z27.s, z27.s, z25.s
add z31.s, z31.s, z22.s
add z27.s, z26.s, z27.s
uzp2 z26.d, z31.d, z27.d
revw z26.d, p6/m, z26.d
uzp1 z31.d, z31.d, z27.d
add z27.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
movprfx z25, z27
mul z25.s, p7/m, z25.s, z21.s
addp z25.s, p5/m, z25.s, z25.s
add x11, sp, #0x70
ldr z26, [x11]
mul z26.s, p7/m, z26.s, z31.s
addp z26.s, p5/m, z26.s, z26.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z1, [x11]
mul z27.s, p7/m, z27.s, z1.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z28, [x11]
mul z31.s, p7/m, z31.s, z28.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z1.d, z30.d, z2.d
zip2 z30.d, z30.d, z2.d
zip1 z2.d, z19.d, z10.d
zip2 z19.d, z19.d, z10.d
zip1 z28.d, z1.d, z2.d
zip1 z10.d, z30.d, z19.d
zip2 z1.d, z1.d, z2.d
revh z2.d, p6/m, z10.d
zip2 z30.d, z30.d, z19.d
revh z19.d, p6/m, z30.d
addvl x11, sp, #5
saddlb z10.s, z28.h, z19.h
saddlb z30.s, z1.h, z2.h
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #6
saddlt z28.s, z22.h, z19.h
add x11, x11, #0x70
str z19, [x11]
saddlt z19.s, z1.h, z2.h
revw z30.d, p6/m, z30.d
mov z22.d, z30.d
revw z19.d, p6/m, z19.d
addvl x11, sp, #0x11
zip1 z30.s, z10.s, z28.s
zip2 z10.s, z10.s, z28.s
add x11, x11, #0x70
str z22, [x11]
zip1 z22.s, z19.s, z22.s
add z30.s, z30.s, z22.s
ldr z22, [x11]
zip2 z19.s, z19.s, z22.s
add z19.s, z10.s, z19.s
uzp2 z10.d, z30.d, z19.d
revw z10.d, p6/m, z10.d
uzp1 z30.d, z30.d, z19.d
add z19.s, z10.s, z30.s
sub z30.s, z30.s, z10.s
mul z21.s, p7/m, z21.s, z19.s
addp z21.s, p5/m, z21.s, z21.s
add x11, sp, #0x70
ldr z10, [x11]
mul z10.s, p7/m, z10.s, z30.s
addp z10.s, p5/m, z10.s, z10.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z28, [x11]
mul z19.s, p7/m, z19.s, z28.s
addp z19.s, p5/m, z19.s, z19.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z28, [x11]
mul z30.s, p7/m, z30.s, z28.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #0x19
uzp1 z25.s, z25.s, z21.s
uzp1 z23.s, z23.s, z18.s
add x11, x11, #0x70
ldr z22, [x11]
uzp1 z26.s, z26.s, z10.s
addvl x11, sp, #0x1a
uzp1 z22.s, z22.s, z17.s
rshrnb z25.h, z25.s, #4
add x11, x11, #0x70
uzp1 z25.h, z25.h, z25.h
rshrnb z22.h, z22.s, #4
rshrnb z23.h, z23.s, #4
uzp1 z22.h, z22.h, z22.h
uzp1 z23.h, z23.h, z23.h
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
stp q22, q25, [x1]
uzp1 z31.s, z31.s, z30.s
uzp1 z24.s, z24.s, z20.s
uzp1 z27.s, z27.s, z19.s
stp q23, q26, [x1, #0x200]
ldr z28, [x11]
addvl x11, sp, #0x12
add x11, x11, #0x70
ldr z25, [x11]
uzp1 z29.s, z29.s, z28.s
addvl x11, sp, #0x13
rshrnb z29.h, z29.s, #4
uzp1 z29.h, z29.h, z29.h
add x11, x11, #0x70
ldr z23, [x11]
trn2 z30.d, z11.d, z23.d
addvl x11, sp, #0x14
zip1 z28.d, z11.d, z23.d
trn1 z11.d, z11.d, z23.d
add x11, x11, #0x70
ldr z23, [x11]
str q29, [x1, #0x600]
zip1 z29.d, z12.d, z25.d
zip1 z26.d, z29.d, z28.d
zip1 z28.d, z13.d, z6.d
zip1 z29.d, z14.d, z23.d
zip1 z22.d, z29.d, z28.d
rshrnb z24.h, z24.s, #4
ldr z29, [x11]
addvl x11, sp, #0x15
uzp1 z24.h, z24.h, z24.h
add x11, x11, #0x70
ldr z20, [x11]
rshrnb z27.h, z27.s, #4
addvl x11, sp, #0x17
uzp1 z27.h, z27.h, z27.h
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
add x11, x11, #0x70
str q24, [x1, #0x400]
str q27, [x1, #0x410]
str q31, [x1, #0x610]
trn2 z31.d, z12.d, z25.d
zip1 z27.d, z31.d, z30.d
zip2 z24.d, z31.d, z30.d
trn2 z30.d, z13.d, z6.d
trn1 z13.d, z13.d, z6.d
trn2 z31.d, z14.d, z23.d
trn1 z14.d, z14.d, z29.d
zip2 z21.d, z14.d, z13.d
ldr z13, [x11]
addvl x11, sp, #0x16
zip1 z29.d, z20.d, z13.d
add x11, x11, #0x70
ldr z14, [x11]
zip1 z23.d, z31.d, z30.d
addvl x11, sp, #0x18
zip2 z19.d, z31.d, z30.d
zip1 z28.d, z14.d, z7.d
add x11, x11, #0x70
zip1 z17.d, z29.d, z28.d
trn2 z31.d, z20.d, z13.d
trn1 z29.d, z20.d, z13.d
ldr z20, [x11]
addvl x11, sp, #0x1b
add x11, x11, #0x70
trn2 z30.d, z14.d, z7.d
trn1 z28.d, z14.d, z7.d
ldr z14, [x11]
addvl x11, sp, #0x1c
trn1 z12.d, z12.d, z25.d
add x11, x11, #0x70
ldr z13, [x11]
zip2 z25.d, z12.d, z11.d
addvl x11, sp, #0x1d
zip1 z18.d, z31.d, z30.d
zip2 z11.d, z29.d, z28.d
add x11, x11, #0x70
ldr z12, [x11]
zip2 z10.d, z31.d, z30.d
zip1 z29.d, z16.d, z20.d
trn2 z31.d, z16.d, z20.d
trn2 z30.d, z15.d, z9.d
zip1 z28.d, z15.d, z9.d
add x11, x1, #0x40
trn1 z15.d, z15.d, z9.d
zip1 z6.d, z29.d, z28.d
zip1 z7.d, z31.d, z30.d
zip2 z9.d, z31.d, z30.d
trn1 z16.d, z16.d, z20.d
movi d31, #0000000000000000
zip2 z16.d, z16.d, z15.d
movprfx z30, z31
sdot z30.d, z27.h, z14.h[0]
ld1h {z15.h}, p7/z, [x21]
movprfx z20, z31
sdot z20.d, z23.h, z14.h[0]
movprfx z29, z31
sdot z29.d, z18.h, z14.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z14.h[0]
sdot z30.d, z26.h, z15.h[0]
sdot z20.d, z22.h, z15.h[0]
sdot z30.d, z25.h, z13.h[0]
sdot z20.d, z21.h, z13.h[0]
sdot z30.d, z24.h, z12.h[0]
sdot z20.d, z19.h, z12.h[0]
sdot z29.d, z17.h, z15.h[0]
sdot z28.d, z6.h, z15.h[0]
sdot z29.d, z11.h, z13.h[0]
sdot z28.d, z16.h, z13.h[0]
sdot z29.d, z10.h, z12.h[0]
sdot z28.d, z9.h, z12.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z14.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z14.h[1]
sdot z30.d, z26.h, z15.h[1]
sdot z20.d, z22.h, z15.h[1]
sdot z30.d, z25.h, z13.h[1]
sdot z20.d, z21.h, z13.h[1]
sdot z30.d, z24.h, z12.h[1]
sdot z20.d, z19.h, z12.h[1]
sdot z29.d, z17.h, z15.h[1]
sdot z28.d, z6.h, z15.h[1]
sdot z29.d, z11.h, z13.h[1]
sdot z28.d, z16.h, z13.h[1]
sdot z29.d, z10.h, z12.h[1]
sdot z28.d, z9.h, z12.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x140
movprfx z30, z31
sdot z30.d, z27.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z23.h, z8.h[0]
sdot z30.d, z26.h, z4.h[0]
sdot z20.d, z22.h, z4.h[0]
sdot z30.d, z25.h, z5.h[0]
sdot z20.d, z21.h, z5.h[0]
sdot z30.d, z24.h, z3.h[0]
sdot z20.d, z19.h, z3.h[0]
movprfx z29, z31
sdot z29.d, z18.h, z8.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[0]
sdot z29.d, z17.h, z4.h[0]
sdot z28.d, z6.h, z4.h[0]
sdot z29.d, z11.h, z5.h[0]
sdot z28.d, z16.h, z5.h[0]
sdot z29.d, z10.h, z3.h[0]
sdot z28.d, z9.h, z3.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z27.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z8.h[1]
sdot z30.d, z26.h, z4.h[1]
sdot z20.d, z22.h, z4.h[1]
sdot z30.d, z25.h, z5.h[1]
sdot z20.d, z21.h, z5.h[1]
sdot z30.d, z24.h, z3.h[1]
sdot z20.d, z19.h, z3.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z8.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[1]
sdot z29.d, z17.h, z4.h[1]
sdot z28.d, z6.h, z4.h[1]
sdot z29.d, z11.h, z5.h[1]
sdot z28.d, z16.h, z5.h[1]
sdot z29.d, z10.h, z3.h[1]
sdot z28.d, z9.h, z3.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xc0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1c0
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x2c0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x3c0
ld1h {z15.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x1, #0x240
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xe0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1e0
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x2e0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x3e0
ld1h {z15.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x200
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x300
ld1h {z14.h}, p7/z, [x11]
add x11, x3, #0x400
ld1h {z15.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x1, #0x440
movprfx z20, z31
sdot z20.d, z23.h, z13.h[0]
movprfx z29, z31
sdot z29.d, z18.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[0]
sdot z30.d, z26.h, z0.h[0]
sdot z20.d, z22.h, z0.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z0.h[0]
sdot z28.d, z6.h, z0.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z27.h, z13.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[1]
sdot z30.d, z26.h, z0.h[1]
sdot z20.d, z22.h, z0.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z0.h[1]
sdot z28.d, z6.h, z0.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x120
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x220
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
add x11, x1, #0x540
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x140
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x240
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
add x11, x1, #0x640
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x160
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x260
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
add x11, x1, #0x740
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z23.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z18.h, z12.h[1]
movprfx z27, z31
sdot z27.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z29.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z29.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z29.d, z19.h, z15.h[1]
sdot z28.d, z17.h, z13.h[1]
sdot z27.d, z6.h, z13.h[1]
sdot z28.d, z11.h, z14.h[1]
sdot z27.d, z16.h, z14.h[1]
sdot z28.d, z10.h, z15.h[1]
sdot z27.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
uzp1 z28.s, z28.s, z27.s
rshrnb z30.h, z30.s, #4
rshrnb z28.h, z28.s, #4
uzp1 z30.h, z30.h, z28.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #7
sub z28.h, z1.h, z2.h
add x11, x11, #0x70
ldr z18, [x11]
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z18.h, z13.h
addvl x11, sp, #8
add x11, x11, #0x70
ldr z17, [x11]
addvl x11, sp, #9
add x11, x11, #0x70
ldr z16, [x11]
sub z22.h, z17.h, z16.h
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0xf
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z29, [x11]
sub z27.h, z7.h, z29.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z6, [x11]
addvl x11, sp, #3
add x11, x11, #0x70
ldr z30, [x11]
sub z26.h, z6.h, z30.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z21, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
ldr z19, [x11]
sub z29.h, z21.h, z19.h
add x11, x3, #0x480
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x500
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
add x11, x1, #0x80
sdot z30.d, z23.h, z15.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
sdot z19.d, z25.h, z15.h[0]
sdot z21.d, z27.h, z15.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z29.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z20.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x180
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
sdot z19.d, z25.h, z15.h[1]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[1]
sdot z21.d, z27.h, z15.h[1]
sdot z20.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x4a0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x520
ld1h {z14.h}, p7/z, [x11]
add x11, x1, #0x280
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
sdot z30.d, z23.h, z15.h[0]
sdot z19.d, z25.h, z15.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
sdot z21.d, z27.h, z15.h[0]
sdot z20.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x380
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
sdot z19.d, z25.h, z15.h[1]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[1]
sdot z21.d, z27.h, z15.h[1]
sdot z20.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x4c0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x540
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
add x11, x1, #0x480
sdot z30.d, z23.h, z15.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
sdot z19.d, z25.h, z15.h[0]
sdot z21.d, z27.h, z15.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z29.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z20.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x580
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
sdot z19.d, z25.h, z15.h[1]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[1]
sdot z21.d, z27.h, z15.h[1]
sdot z20.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x4e0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x560
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
sdot z30.d, z23.h, z15.h[0]
sdot z19.d, z25.h, z15.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
sdot z21.d, z27.h, z15.h[0]
sdot z20.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
add x11, x1, #0x680
st1h {z30.h}, p7, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z25.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z26.h, z14.h[1]
uzp1 z30.s, z30.s, z23.s
sdot z25.d, z27.h, z15.h[1]
rshrnb z30.h, z30.s, #4
movprfx z27, z31
sdot z27.d, z28.h, z14.h[1]
sdot z27.d, z29.h, z15.h[1]
uzp1 z25.s, z25.s, z27.s
rshrnb z25.h, z25.s, #4
uzp1 z30.h, z30.h, z25.h
add x11, x1, #0x780
add z27.h, z13.h, z18.h
st1h {z30.h}, p7, [x11]
add z30.h, z16.h, z17.h
revh z30.d, p6/m, z30.d
sub z27.h, z27.h, z30.h
add z28.h, z9.h, z12.h
add z30.h, z10.h, z11.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #4
sub z28.h, z28.h, z30.h
add x11, x11, #0x70
ldr z29, [x11]
add z29.h, z29.h, z7.h
addvl x11, sp, #3
add x11, x11, #0x70
ldr z30, [x11]
add z30.h, z30.h, z6.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #6
sub z29.h, z29.h, z30.h
add z26.h, z2.h, z1.h
add x11, x11, #0x70
ldr z19, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z30, [x11]
add z30.h, z19.h, z30.h
revh z26.d, p6/m, z26.d
add x11, x3, #0x580
ld1h {z15.h}, p7/z, [x11]
sub z30.h, z30.h, z26.h
add x11, x1, #0x100
movprfx z23, z31
sdot z23.d, z28.h, z15.h[0]
movprfx z24, z31
sdot z24.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z27.h, z15.h[0]
movprfx z25, z31
sdot z25.d, z29.h, z15.h[0]
uzp1 z26.s, z26.s, z23.s
uzp1 z25.s, z25.s, z24.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x1, #0x300
movprfx z23, z31
sdot z23.d, z28.h, z15.h[1]
movprfx z24, z31
sdot z24.d, z30.h, z15.h[1]
movprfx z26, z31
sdot z26.d, z27.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z29.h, z15.h[1]
uzp1 z26.s, z26.s, z23.s
uzp1 z25.s, z25.s, z24.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0x5a0
ld1h {z15.h}, p7/z, [x11]
add x11, x1, #0x500
movprfx z26, z31
sdot z26.d, z27.h, z15.h[0]
movprfx z23, z31
sdot z23.d, z28.h, z15.h[0]
movprfx z24, z31
sdot z24.d, z30.h, z15.h[0]
movprfx z25, z31
sdot z25.d, z29.h, z15.h[0]
uzp1 z26.s, z26.s, z23.s
uzp1 z25.s, z25.s, z24.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x1, #0x700
movprfx z26, z31
sdot z26.d, z27.h, z15.h[1]
add x1, x1, #0x20
movprfx z27, z31
sdot z27.d, z28.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
sdot z31.d, z30.h, z15.h[1]
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
addvl x11, sp, #0x12
rev z30.h, z30.h
add x11, x11, #0x70
sub z25.h, z22.h, z30.h
str z25, [x11]
add x11, x17, #0x20
add z22.h, z22.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
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
addvl x11, sp, #0x14
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
addvl x11, sp, #0x15
add x11, x11, #0x70
rev z30.h, z30.h
sub z21.h, z27.h, z30.h
str z21, [x11]
add x11, x10, #0x20
add z27.h, z27.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x16
ld1h {z25.h}, p7/z, [x10]
add x11, x11, #0x70
rev z30.h, z30.h
sub z19.h, z25.h, z30.h
str z19, [x11]
add x11, x13, #0x20
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x17
ld1h {z23.h}, p7/z, [x13]
add x11, x11, #0x70
rev z30.h, z30.h
sub z17.h, z23.h, z30.h
str z17, [x11]
addvl x11, sp, #3
add z30.h, z23.h, z30.h
add x11, x11, #0x70
str z30, [x11]
ld1h {z1.h}, p7/z, [x7]
add x11, x7, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x12, #0x20
sub z7.h, z1.h, z30.h
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x12]
ld1h {z23.h}, p7/z, [x11]
add x11, x5, #0x20
rev z23.h, z23.h
sub z16.h, z30.h, z23.h
add z30.h, z30.h, z23.h
ld1h {z23.h}, p7/z, [x11]
add x11, x9, #0x20
rev z23.h, z23.h
ld1h {z19.h}, p7/z, [x5]
sub z15.h, z19.h, z23.h
add z19.h, z19.h, z23.h
ld1h {z23.h}, p7/z, [x11]
addvl x11, sp, #0x18
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
zip2 z17.d, z23.d, z22.d
zip1 z24.d, z31.d, z29.d
revh z24.d, p6/m, z24.d
zip2 z31.d, z31.d, z29.d
revh z31.d, p6/m, z31.d
addvl x11, sp, #7
saddlb z23.s, z21.h, z31.h
saddlb z22.s, z17.h, z24.h
add x11, x11, #0x70
str z21, [x11]
ldr z29, [x11]
addvl x11, sp, #0xa
saddlt z21.s, z29.h, z31.h
add x11, x11, #0x70
str z31, [x11]
addvl x11, sp, #8
add x11, x11, #0x70
str z17, [x11]
ldr z29, [x11]
addvl x11, sp, #9
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
uzp1 z31.d, z31.d, z24.d
ld1w {z21.s}, p7/z, [x3]
add z24.s, z23.s, z31.s
sub z29.s, z31.s, z23.s
ptrue p5.s
movprfx z23, z24
mul z23.s, p7/m, z23.s, z21.s
mov z31.d, z23.d
addp z31.s, p5/m, z31.s, z23.s
addvl x11, sp, #0x19
add x11, x11, #0x70
str z31, [x11]
add x11, sp, #0x70
ldr z23, [x11]
mul z23.s, p7/m, z23.s, z29.s
addp z23.s, p5/m, z23.s, z23.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z31, [x11]
mul z24.s, p7/m, z24.s, z31.s
addp z24.s, p5/m, z24.s, z24.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z17, [x11]
mul z29.s, p7/m, z29.s, z17.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z31.d, z28.d, z18.d
zip2 z28.d, z28.d, z18.d
zip1 z18.d, z26.d, z20.d
zip2 z26.d, z26.d, z20.d
zip1 z20.d, z31.d, z18.d
zip2 z18.d, z31.d, z18.d
zip1 z31.d, z28.d, z26.d
revh z31.d, p6/m, z31.d
zip2 z28.d, z28.d, z26.d
revh z26.d, p6/m, z28.d
addvl x11, sp, #0xb
mov z28.d, z20.d
saddlb z20.s, z20.h, z26.h
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #0xe
saddlt z17.s, z22.h, z26.h
mov z28.d, z18.d
add x11, x11, #0x70
str z26, [x11]
saddlb z18.s, z18.h, z31.h
addvl x11, sp, #0xc
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #0xd
saddlt z26.s, z22.h, z31.h
add x11, x11, #0x70
str z31, [x11]
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
add x11, sp, #0x70
ldr z18, [x11]
mul z18.s, p7/m, z18.s, z28.s
addp z18.s, p5/m, z18.s, z18.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z26, [x11]
mul z20.s, p7/m, z20.s, z26.s
addp z20.s, p5/m, z20.s, z20.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z26, [x11]
mul z28.s, p7/m, z28.s, z26.s
mov z31.d, z28.d
addp z31.s, p5/m, z31.s, z28.s
addvl x11, sp, #0x1a
zip1 z26.d, z25.d, z1.d
zip2 z25.d, z25.d, z1.d
add x11, x11, #0x70
str z31, [x11]
addvl x11, sp, #3
add x11, x11, #0x70
ldr z22, [x11]
zip1 z31.d, z27.d, z22.d
zip2 z27.d, z27.d, z22.d
zip1 z1.d, z31.d, z26.d
zip2 z28.d, z31.d, z26.d
zip1 z31.d, z27.d, z25.d
revh z31.d, p6/m, z31.d
zip2 z27.d, z27.d, z25.d
revh z27.d, p6/m, z27.d
addvl x11, sp, #0xf
saddlb z26.s, z1.h, z27.h
saddlb z25.s, z28.h, z31.h
add x11, x11, #0x70
str z1, [x11]
ldr z22, [x11]
addvl x11, sp, #4
saddlt z1.s, z22.h, z27.h
add x11, x11, #0x70
str z27, [x11]
addvl x11, sp, #0x10
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #3
saddlt z27.s, z22.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z25.d, p6/m, z25.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z26.s, z1.s
zip2 z26.s, z26.s, z1.s
zip1 z22.s, z27.s, z25.s
zip2 z27.s, z27.s, z25.s
add z31.s, z31.s, z22.s
add z27.s, z26.s, z27.s
uzp2 z26.d, z31.d, z27.d
revw z26.d, p6/m, z26.d
uzp1 z31.d, z31.d, z27.d
add z27.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
movprfx z25, z27
mul z25.s, p7/m, z25.s, z21.s
addp z25.s, p5/m, z25.s, z25.s
add x11, sp, #0x70
ldr z26, [x11]
mul z26.s, p7/m, z26.s, z31.s
addp z26.s, p5/m, z26.s, z26.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z1, [x11]
mul z27.s, p7/m, z27.s, z1.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z28, [x11]
mul z31.s, p7/m, z31.s, z28.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z1.d, z30.d, z2.d
zip2 z30.d, z30.d, z2.d
zip1 z2.d, z19.d, z10.d
zip2 z19.d, z19.d, z10.d
zip1 z28.d, z1.d, z2.d
zip1 z10.d, z30.d, z19.d
zip2 z1.d, z1.d, z2.d
revh z2.d, p6/m, z10.d
zip2 z30.d, z30.d, z19.d
revh z19.d, p6/m, z30.d
addvl x11, sp, #5
saddlb z10.s, z28.h, z19.h
saddlb z30.s, z1.h, z2.h
add x11, x11, #0x70
str z28, [x11]
ldr z22, [x11]
addvl x11, sp, #6
saddlt z28.s, z22.h, z19.h
add x11, x11, #0x70
str z19, [x11]
saddlt z19.s, z1.h, z2.h
revw z30.d, p6/m, z30.d
mov z22.d, z30.d
revw z19.d, p6/m, z19.d
addvl x11, sp, #0x11
zip1 z30.s, z10.s, z28.s
zip2 z10.s, z10.s, z28.s
add x11, x11, #0x70
str z22, [x11]
zip1 z22.s, z19.s, z22.s
add z30.s, z30.s, z22.s
ldr z22, [x11]
zip2 z19.s, z19.s, z22.s
add z19.s, z10.s, z19.s
uzp2 z10.d, z30.d, z19.d
revw z10.d, p6/m, z10.d
uzp1 z30.d, z30.d, z19.d
add z19.s, z10.s, z30.s
sub z30.s, z30.s, z10.s
mul z21.s, p7/m, z21.s, z19.s
addp z21.s, p5/m, z21.s, z21.s
add x11, sp, #0x70
ldr z10, [x11]
mul z10.s, p7/m, z10.s, z30.s
addp z10.s, p5/m, z10.s, z10.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z28, [x11]
mul z19.s, p7/m, z19.s, z28.s
addp z19.s, p5/m, z19.s, z19.s
addvl x11, sp, #2
add x11, x11, #0x70
ldr z28, [x11]
mul z30.s, p7/m, z30.s, z28.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #0x19
uzp1 z25.s, z25.s, z21.s
uzp1 z23.s, z23.s, z18.s
add x11, x11, #0x70
ldr z22, [x11]
uzp1 z26.s, z26.s, z10.s
addvl x11, sp, #0x1a
uzp1 z22.s, z22.s, z17.s
rshrnb z25.h, z25.s, #4
add x11, x11, #0x70
uzp1 z25.h, z25.h, z25.h
rshrnb z22.h, z22.s, #4
rshrnb z23.h, z23.s, #4
uzp1 z22.h, z22.h, z22.h
uzp1 z23.h, z23.h, z23.h
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
stp q22, q25, [x1]
uzp1 z31.s, z31.s, z30.s
uzp1 z24.s, z24.s, z20.s
uzp1 z27.s, z27.s, z19.s
stp q23, q26, [x1, #0x200]
ldr z28, [x11]
addvl x11, sp, #0x12
add x11, x11, #0x70
ldr z25, [x11]
uzp1 z29.s, z29.s, z28.s
addvl x11, sp, #0x13
rshrnb z29.h, z29.s, #4
uzp1 z29.h, z29.h, z29.h
add x11, x11, #0x70
ldr z23, [x11]
trn2 z30.d, z11.d, z23.d
addvl x11, sp, #0x14
zip1 z28.d, z11.d, z23.d
trn1 z11.d, z11.d, z23.d
add x11, x11, #0x70
ldr z23, [x11]
str q29, [x1, #0x600]
zip1 z29.d, z12.d, z25.d
zip1 z26.d, z29.d, z28.d
zip1 z28.d, z13.d, z6.d
zip1 z29.d, z14.d, z23.d
zip1 z22.d, z29.d, z28.d
rshrnb z24.h, z24.s, #4
ldr z29, [x11]
addvl x11, sp, #0x15
uzp1 z24.h, z24.h, z24.h
add x11, x11, #0x70
ldr z20, [x11]
rshrnb z27.h, z27.s, #4
addvl x11, sp, #0x17
uzp1 z27.h, z27.h, z27.h
rshrnb z31.h, z31.s, #4
uzp1 z31.h, z31.h, z31.h
add x11, x11, #0x70
str q24, [x1, #0x400]
str q27, [x1, #0x410]
str q31, [x1, #0x610]
trn2 z31.d, z12.d, z25.d
zip1 z27.d, z31.d, z30.d
zip2 z24.d, z31.d, z30.d
trn2 z30.d, z13.d, z6.d
trn1 z13.d, z13.d, z6.d
trn2 z31.d, z14.d, z23.d
trn1 z14.d, z14.d, z29.d
zip2 z21.d, z14.d, z13.d
ldr z13, [x11]
addvl x11, sp, #0x16
zip1 z29.d, z20.d, z13.d
add x11, x11, #0x70
ldr z14, [x11]
zip1 z23.d, z31.d, z30.d
addvl x11, sp, #0x18
zip2 z19.d, z31.d, z30.d
zip1 z28.d, z14.d, z7.d
add x11, x11, #0x70
zip1 z17.d, z29.d, z28.d
trn2 z31.d, z20.d, z13.d
trn1 z29.d, z20.d, z13.d
ldr z20, [x11]
addvl x11, sp, #0x1b
add x11, x11, #0x70
trn2 z30.d, z14.d, z7.d
trn1 z28.d, z14.d, z7.d
ldr z14, [x11]
addvl x11, sp, #0x1c
trn1 z12.d, z12.d, z25.d
add x11, x11, #0x70
ldr z13, [x11]
zip2 z25.d, z12.d, z11.d
addvl x11, sp, #0x1d
zip1 z18.d, z31.d, z30.d
zip2 z11.d, z29.d, z28.d
add x11, x11, #0x70
ldr z12, [x11]
zip2 z10.d, z31.d, z30.d
zip1 z29.d, z16.d, z20.d
trn2 z31.d, z16.d, z20.d
trn2 z30.d, z15.d, z9.d
zip1 z28.d, z15.d, z9.d
add x11, x1, #0x40
trn1 z15.d, z15.d, z9.d
zip1 z6.d, z29.d, z28.d
zip1 z7.d, z31.d, z30.d
zip2 z9.d, z31.d, z30.d
trn1 z16.d, z16.d, z20.d
movi d31, #0000000000000000
zip2 z16.d, z16.d, z15.d
movprfx z30, z31
sdot z30.d, z27.h, z14.h[0]
ld1h {z15.h}, p7/z, [x21]
movprfx z20, z31
sdot z20.d, z23.h, z14.h[0]
movprfx z29, z31
sdot z29.d, z18.h, z14.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z14.h[0]
sdot z30.d, z26.h, z15.h[0]
sdot z20.d, z22.h, z15.h[0]
sdot z30.d, z25.h, z13.h[0]
sdot z20.d, z21.h, z13.h[0]
sdot z30.d, z24.h, z12.h[0]
sdot z20.d, z19.h, z12.h[0]
sdot z29.d, z17.h, z15.h[0]
sdot z28.d, z6.h, z15.h[0]
sdot z29.d, z11.h, z13.h[0]
sdot z28.d, z16.h, z13.h[0]
sdot z29.d, z10.h, z12.h[0]
sdot z28.d, z9.h, z12.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z14.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z14.h[1]
sdot z30.d, z26.h, z15.h[1]
sdot z20.d, z22.h, z15.h[1]
sdot z30.d, z25.h, z13.h[1]
sdot z20.d, z21.h, z13.h[1]
sdot z30.d, z24.h, z12.h[1]
sdot z20.d, z19.h, z12.h[1]
sdot z29.d, z17.h, z15.h[1]
sdot z28.d, z6.h, z15.h[1]
sdot z29.d, z11.h, z13.h[1]
sdot z28.d, z16.h, z13.h[1]
sdot z29.d, z10.h, z12.h[1]
sdot z28.d, z9.h, z12.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x140
movprfx z30, z31
sdot z30.d, z27.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z23.h, z8.h[0]
sdot z30.d, z26.h, z4.h[0]
sdot z20.d, z22.h, z4.h[0]
sdot z30.d, z25.h, z5.h[0]
sdot z20.d, z21.h, z5.h[0]
sdot z30.d, z24.h, z3.h[0]
sdot z20.d, z19.h, z3.h[0]
movprfx z29, z31
sdot z29.d, z18.h, z8.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[0]
sdot z29.d, z17.h, z4.h[0]
sdot z28.d, z6.h, z4.h[0]
sdot z29.d, z11.h, z5.h[0]
sdot z28.d, z16.h, z5.h[0]
sdot z29.d, z10.h, z3.h[0]
sdot z28.d, z9.h, z3.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z27.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z8.h[1]
sdot z30.d, z26.h, z4.h[1]
sdot z20.d, z22.h, z4.h[1]
sdot z30.d, z25.h, z5.h[1]
sdot z20.d, z21.h, z5.h[1]
sdot z30.d, z24.h, z3.h[1]
sdot z20.d, z19.h, z3.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z8.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[1]
sdot z29.d, z17.h, z4.h[1]
sdot z28.d, z6.h, z4.h[1]
sdot z29.d, z11.h, z5.h[1]
sdot z28.d, z16.h, z5.h[1]
sdot z29.d, z10.h, z3.h[1]
sdot z28.d, z9.h, z3.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xc0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1c0
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x2c0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x3c0
ld1h {z15.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x1, #0x240
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0xe0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1e0
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x2e0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x3e0
ld1h {z15.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x200
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x300
ld1h {z14.h}, p7/z, [x11]
add x11, x3, #0x400
ld1h {z15.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x1, #0x440
movprfx z20, z31
sdot z20.d, z23.h, z13.h[0]
movprfx z29, z31
sdot z29.d, z18.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[0]
sdot z30.d, z26.h, z0.h[0]
sdot z20.d, z22.h, z0.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z0.h[0]
sdot z28.d, z6.h, z0.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z27.h, z13.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[1]
sdot z30.d, z26.h, z0.h[1]
sdot z20.d, z22.h, z0.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z0.h[1]
sdot z28.d, z6.h, z0.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x120
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x220
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
add x11, x1, #0x540
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x140
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x240
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
add x11, x1, #0x640
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z20.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z20.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z20.d, z19.h, z15.h[1]
sdot z29.d, z17.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z16.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x160
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x260
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z20, z31
sdot z20.d, z23.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z18.h, z12.h[0]
add x11, x1, #0x740
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z20.d, z22.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z20.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z20.d, z19.h, z15.h[0]
sdot z29.d, z17.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z16.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z20.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z23.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z18.h, z12.h[1]
movprfx z27, z31
sdot z27.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z29.d, z22.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z29.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z29.d, z19.h, z15.h[1]
sdot z28.d, z17.h, z13.h[1]
sdot z27.d, z6.h, z13.h[1]
sdot z28.d, z11.h, z14.h[1]
sdot z27.d, z16.h, z14.h[1]
sdot z28.d, z10.h, z15.h[1]
sdot z27.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
uzp1 z28.s, z28.s, z27.s
rshrnb z30.h, z30.s, #4
rshrnb z28.h, z28.s, #4
uzp1 z30.h, z30.h, z28.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #7
sub z28.h, z1.h, z2.h
add x11, x11, #0x70
ldr z18, [x11]
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z18.h, z13.h
addvl x11, sp, #8
add x11, x11, #0x70
ldr z17, [x11]
addvl x11, sp, #9
add x11, x11, #0x70
ldr z16, [x11]
sub z22.h, z17.h, z16.h
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0xf
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z29, [x11]
sub z27.h, z7.h, z29.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z6, [x11]
addvl x11, sp, #3
add x11, x11, #0x70
ldr z30, [x11]
sub z26.h, z6.h, z30.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z21, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
ldr z19, [x11]
sub z29.h, z21.h, z19.h
add x11, x3, #0x480
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x500
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
add x11, x1, #0x80
sdot z30.d, z23.h, z15.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
sdot z19.d, z25.h, z15.h[0]
sdot z21.d, z27.h, z15.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z29.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z20.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x180
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
sdot z19.d, z25.h, z15.h[1]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[1]
sdot z21.d, z27.h, z15.h[1]
sdot z20.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x4a0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x520
ld1h {z14.h}, p7/z, [x11]
add x11, x1, #0x280
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
sdot z30.d, z23.h, z15.h[0]
sdot z19.d, z25.h, z15.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
sdot z21.d, z27.h, z15.h[0]
sdot z20.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x380
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
sdot z19.d, z25.h, z15.h[1]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[1]
sdot z21.d, z27.h, z15.h[1]
sdot z20.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x4c0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x540
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
add x11, x1, #0x480
sdot z30.d, z23.h, z15.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
sdot z19.d, z25.h, z15.h[0]
sdot z21.d, z27.h, z15.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z29.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z21.s, z21.s, z20.s
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x580
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
sdot z19.d, z25.h, z15.h[1]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[1]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[1]
sdot z21.d, z27.h, z15.h[1]
sdot z20.d, z29.h, z15.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x4e0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x560
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[0]
movprfx z19, z31
sdot z19.d, z24.h, z14.h[0]
sdot z30.d, z23.h, z15.h[0]
sdot z19.d, z25.h, z15.h[0]
movprfx z21, z31
sdot z21.d, z26.h, z14.h[0]
movprfx z20, z31
sdot z20.d, z28.h, z14.h[0]
sdot z21.d, z27.h, z15.h[0]
sdot z20.d, z29.h, z15.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z21.s, z21.s, z20.s
rshrnb z30.h, z30.s, #4
rshrnb z21.h, z21.s, #4
uzp1 z30.h, z30.h, z21.h
add x11, x1, #0x680
st1h {z30.h}, p7, [x11]
movprfx z30, z31
sdot z30.d, z22.h, z14.h[1]
sdot z30.d, z23.h, z15.h[1]
movprfx z23, z31
sdot z23.d, z24.h, z14.h[1]
sdot z23.d, z25.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z26.h, z14.h[1]
uzp1 z30.s, z30.s, z23.s
sdot z25.d, z27.h, z15.h[1]
rshrnb z30.h, z30.s, #4
movprfx z27, z31
sdot z27.d, z28.h, z14.h[1]
sdot z27.d, z29.h, z15.h[1]
uzp1 z25.s, z25.s, z27.s
rshrnb z25.h, z25.s, #4
uzp1 z30.h, z30.h, z25.h
add x11, x1, #0x780
add z27.h, z13.h, z18.h
st1h {z30.h}, p7, [x11]
add z30.h, z16.h, z17.h
revh z30.d, p6/m, z30.d
sub z27.h, z27.h, z30.h
add z28.h, z9.h, z12.h
add z30.h, z10.h, z11.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #4
sub z28.h, z28.h, z30.h
add x11, x11, #0x70
ldr z29, [x11]
add z29.h, z29.h, z7.h
addvl x11, sp, #3
add x11, x11, #0x70
ldr z30, [x11]
add z30.h, z30.h, z6.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #6
sub z29.h, z29.h, z30.h
add z26.h, z2.h, z1.h
add x11, x11, #0x70
ldr z19, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z30, [x11]
add z30.h, z19.h, z30.h
revh z26.d, p6/m, z26.d
add x11, x3, #0x580
ld1h {z15.h}, p7/z, [x11]
sub z30.h, z30.h, z26.h
add x11, x1, #0x100
movprfx z23, z31
sdot z23.d, z28.h, z15.h[0]
movprfx z24, z31
sdot z24.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z27.h, z15.h[0]
movprfx z25, z31
sdot z25.d, z29.h, z15.h[0]
uzp1 z26.s, z26.s, z23.s
uzp1 z25.s, z25.s, z24.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x1, #0x300
movprfx z23, z31
sdot z23.d, z28.h, z15.h[1]
movprfx z24, z31
sdot z24.d, z30.h, z15.h[1]
movprfx z26, z31
sdot z26.d, z27.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z29.h, z15.h[1]
uzp1 z26.s, z26.s, z23.s
uzp1 z25.s, z25.s, z24.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x3, #0x5a0
ld1h {z15.h}, p7/z, [x11]
add x11, x1, #0x500
movprfx z26, z31
sdot z26.d, z27.h, z15.h[0]
movprfx z23, z31
sdot z23.d, z28.h, z15.h[0]
movprfx z24, z31
sdot z24.d, z30.h, z15.h[0]
movprfx z25, z31
sdot z25.d, z29.h, z15.h[0]
uzp1 z26.s, z26.s, z23.s
uzp1 z25.s, z25.s, z24.s
rshrnb z26.h, z26.s, #4
rshrnb z25.h, z25.s, #4
uzp1 z26.h, z26.h, z25.h
st1h {z26.h}, p7, [x11]
add x11, x1, #0x700
movprfx z26, z31
sdot z26.d, z27.h, z15.h[1]
add x1, x1, #0x20
movprfx z27, z31
sdot z27.d, z28.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z29.h, z15.h[1]
sdot z31.d, z30.h, z15.h[1]
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
cntb x12
mov x13, #0x35
ptrue p7.b
adrp x2, #0x457000
add x2, x2, #0xfb0
mul x12, x12, x13
add x3, x2, #0x20
ld1w {z31.s}, p7/z, [x3]
cntb x3, all, mul #0xb
add x5, x0, #0x800
sub sp, sp, x12
lsl x3, x3, #2
sub sp, sp, #0x40
add x4, x2, #0x80
add x3, sp, x3
add x3, x3, #0x40
stp d8, d9, [sp]
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
add x3, x2, #0x180
ld1h {z31.h}, p7/z, [x3]
cntb x3, all, mul #3
lsl x6, x3, #4
sub x3, x6, x3
cntb x6, all, mul #3
add x3, x3, #0x40
lsl x6, x6, #4
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x280
ld1h {z31.h}, p7/z, [x3]
rdvl x3, #0x17
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x380
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #0xffffffffffffffff
cntb x6, all, mul #3
add x3, x3, #0x40
lsl x6, x6, #4
add x3, sp, x3
str z31, [x3]
add x3, x2, #0xa0
ld1h {z31.h}, p7/z, [x3]
cntb x3, all, mul #3
lsl x3, x3, #4
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x1a0
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x2a0
ld1h {z31.h}, p7/z, [x3]
rdvl x3, #0x19
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x3a0
ld1h {z31.h}, p7/z, [x3]
cntb x3, all, mul #3
add x3, x3, x3, lsl #4
add x3, x3, #0x40
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x100
ld1h {z0.h}, p7/z, [x3]
cntb x3, all, mul #0xd
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
str z0, [x3]
add x3, x0, #0x20
ld1h {z29.h}, p7/z, [x3]
ld1h {z0.h}, p7/z, [x0]
addvl x3, sp, #0x1c
rev z29.h, z29.h
sub z27.h, z0.h, z29.h
add x3, x3, #0x40
str z27, [x3]
cntb x6
add x3, x0, #0x40
ld1h {z17.h}, p7/z, [x3]
lsl x6, x6, #5
add x3, x0, #0x60
ld1h {z22.h}, p7/z, [x3]
rev z22.h, z22.h
addvl x3, sp, #0x1d
sub z26.h, z17.h, z22.h
ptrue p6.d
add x3, x3, #0x40
str z26, [x3]
add x3, x0, #0x80
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0xa0
ld1h {z9.h}, p7/z, [x3]
rev z9.h, z9.h
addvl x3, sp, #0x1e
sub z23.h, z21.h, z9.h
add x3, x3, #0x40
str z23, [x3]
add x3, x0, #0xc0
ld1h {z2.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z10.h}, p7/z, [x3]
rev z10.h, z10.h
addvl x3, sp, #0x1f
sub z31.h, z2.h, z10.h
add x3, x3, #0x40
str z31, [x3]
add x3, x0, #0x100
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z30.h}, p7/z, [x3]
rev z30.h, z30.h
cntb x3
sub z28.h, z23.h, z30.h
lsl x3, x3, #5
add x3, sp, x3
add x3, x3, #0x40
str z28, [x3]
add x3, x0, #0x140
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z24.h}, p7/z, [x3]
rev z24.h, z24.h
addvl x3, x6, #1
sub z25.h, z18.h, z24.h
rdvl x6, #0x11
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z25, [x3]
add x3, x0, #0x180
ld1h {z3.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z11.h}, p7/z, [x3]
rev z11.h, z11.h
rdvl x3, #0x11
sub z19.h, z3.h, z11.h
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z19, [x3]
add x3, x0, #0x1c0
ld1h {z4.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z12.h}, p7/z, [x3]
rev z12.h, z12.h
addvl x3, x6, #1
sub z20.h, z4.h, z12.h
cntb x6, all, mul #9
add x3, x3, #0x40
lsl x6, x6, #2
add x3, sp, x3
str z20, [x3]
add x3, x0, #0x200
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z31.h}, p7/z, [x3]
rev z31.h, z31.h
cntb x3, all, mul #9
sub z16.h, z25.h, z31.h
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
str z16, [x3]
add x3, x0, #0x240
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z26.h}, p7/z, [x3]
rev z26.h, z26.h
addvl x3, x6, #1
sub z15.h, z19.h, z26.h
cntb x6, all, mul #5
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
str z15, [x3]
add x3, x0, #0x280
ld1h {z5.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z13.h}, p7/z, [x3]
rev z13.h, z13.h
rdvl x3, #0x13
sub z14.h, z5.h, z13.h
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z14, [x3]
add x3, x0, #0x2c0
ld1h {z6.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z14.h}, p7/z, [x3]
rev z14.h, z14.h
addvl x3, x6, #0xffffffffffffffff
sub z8.h, z6.h, z14.h
cntb x6, all, mul #5
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
str z8, [x3]
add x3, x0, #0x300
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z28.h}, p7/z, [x3]
rev z7.h, z28.h
addvl x3, sp, #5
sub z1.h, z27.h, z7.h
add x3, x3, #0x40
str z7, [x3]
cntb x3, all, mul #5
lsl x3, x3, #3
add x3, sp, x3
add x3, x3, #0x40
str z1, [x3]
add x3, x0, #0x340
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z28.h}, p7/z, [x3]
rev z28.h, z28.h
addvl x3, x6, #1
sub z16.h, z20.h, z28.h
rdvl x6, #0x15
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z16, [x3]
add x3, x0, #0x380
ld1h {z7.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z15.h}, p7/z, [x3]
rev z15.h, z15.h
rdvl x3, #0x15
sub z8.h, z7.h, z15.h
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z8, [x3]
add x3, x0, #0x3c0
ld1h {z8.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z16.h}, p7/z, [x3]
rev z16.h, z16.h
addvl x3, x6, #1
sub z1.h, z8.h, z16.h
add x3, x3, #0x40
add x3, sp, x3
str z1, [x3]
zip1 z1.d, z0.d, z21.d
add x3, sp, #0x40
zip2 z21.d, z0.d, z21.d
zip1 z0.d, z17.d, z2.d
zip2 z17.d, z17.d, z2.d
zip1 z2.d, z1.d, z0.d
str z2, [x3]
zip2 z2.d, z1.d, z0.d
addvl x3, sp, #1
add x3, x3, #0x40
str z2, [x3]
zip1 z2.d, z21.d, z17.d
revh z0.d, p6/m, z2.d
zip2 z21.d, z21.d, z17.d
revh z21.d, p6/m, z21.d
mov z2.d, z21.d
zip1 z21.d, z29.d, z9.d
zip1 z17.d, z22.d, z10.d
zip2 z29.d, z29.d, z9.d
zip2 z22.d, z22.d, z10.d
zip2 z9.d, z21.d, z17.d
zip1 z10.d, z21.d, z17.d
zip1 z21.d, z29.d, z22.d
revh z21.d, p6/m, z21.d
mov z1.d, z21.d
zip2 z29.d, z29.d, z22.d
revh z22.d, p6/m, z29.d
add x3, sp, #0x40
saddlb z29.s, z2.h, z22.h
ldr z21, [x3]
saddlb z21.s, z21.h, z10.h
add z21.s, z21.s, z29.s
ldr z29, [x3]
addvl x3, sp, #8
add x3, x3, #0x40
str z10, [x3]
ldr z17, [x3]
addvl x3, sp, #7
saddlt z10.s, z29.h, z17.h
saddlt z29.s, z2.h, z22.h
add x3, x3, #0x40
str z2, [x3]
add z10.s, z10.s, z29.s
addvl x3, sp, #0xb
saddlb z29.s, z0.h, z1.h
add x3, x3, #0x40
str z22, [x3]
saddlt z22.s, z0.h, z1.h
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
saddlb z17.s, z2.h, z9.h
addvl x3, sp, #9
add z17.s, z17.s, z29.s
add x3, x3, #0x40
str z9, [x3]
ldr z9, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
saddlt z29.s, z2.h, z9.h
addvl x3, sp, #6
add z22.s, z29.s, z22.s
add x3, x3, #0x40
str z0, [x3]
addvl x3, sp, #0xa
add x3, x3, #0x40
str z1, [x3]
revw z17.d, p6/m, z17.d
revw z22.d, p6/m, z22.d
zip1 z9.s, z22.s, z17.s
zip1 z29.s, z21.s, z10.s
zip2 z22.s, z22.s, z17.s
add z29.s, z29.s, z9.s
zip2 z21.s, z21.s, z10.s
add z22.s, z21.s, z22.s
uzp2 z17.d, z29.d, z22.d
revw z17.d, p6/m, z17.d
ptrue p5.s
uzp1 z29.d, z29.d, z22.d
ld1w {z22.s}, p7/z, [x2]
add z21.s, z17.s, z29.s
sub z29.s, z29.s, z17.s
movprfx z10, z21
mul z10.s, p7/m, z10.s, z22.s
addp z10.s, p5/m, z10.s, z10.s
cntb x3, all, mul #0xb
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
ldr z1, [x3]
movprfx z17, z1
mul z17.s, p7/m, z17.s, z29.s
addp z17.s, p5/m, z17.s, z17.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z9, [x3]
mul z21.s, p7/m, z21.s, z9.s
mov z9.d, z21.d
addp z9.s, p5/m, z9.s, z21.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z21, [x3]
movprfx z2, z29
mul z2.s, p7/m, z2.s, z21.s
addp z2.s, p5/m, z2.s, z2.s
zip1 z29.d, z23.d, z3.d
zip1 z21.d, z18.d, z4.d
zip2 z23.d, z23.d, z3.d
zip2 z18.d, z18.d, z4.d
zip1 z3.d, z29.d, z21.d
zip2 z0.d, z29.d, z21.d
zip1 z29.d, z23.d, z18.d
revh z4.d, p6/m, z29.d
addvl x3, sp, #2
zip2 z23.d, z23.d, z18.d
add x3, x3, #0x40
str z4, [x3]
revh z21.d, p6/m, z23.d
zip1 z29.d, z30.d, z11.d
zip1 z23.d, z24.d, z12.d
zip2 z30.d, z30.d, z11.d
zip2 z24.d, z24.d, z12.d
zip1 z4.d, z29.d, z23.d
zip2 z18.d, z29.d, z23.d
zip1 z29.d, z30.d, z24.d
revh z29.d, p6/m, z29.d
zip2 z30.d, z30.d, z24.d
revh z30.d, p6/m, z30.d
addvl x3, sp, #0xc
mov z11.d, z30.d
saddlb z30.s, z21.h, z30.h
add x3, x3, #0x40
saddlb z24.s, z3.h, z4.h
add z24.s, z24.s, z30.s
str z3, [x3]
ldr z30, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
mov z12.d, z21.d
str z12, [x3]
addvl x3, sp, #0x10
saddlt z21.s, z30.h, z4.h
saddlt z30.s, z12.h, z11.h
add x3, x3, #0x40
str z11, [x3]
add z21.s, z21.s, z30.s
addvl x3, sp, #2
saddlb z23.s, z0.h, z18.h
add x3, x3, #0x40
ldr z12, [x3]
saddlb z30.s, z12.h, z29.h
addvl x3, sp, #0xe
add z23.s, z23.s, z30.s
add x3, x3, #0x40
str z18, [x3]
ldr z30, [x3]
addvl x3, sp, #0xf
saddlt z30.s, z0.h, z30.h
add x3, x3, #0x40
str z29, [x3]
saddlt z29.s, z12.h, z29.h
add z29.s, z30.s, z29.s
revw z23.d, p6/m, z23.d
revw z29.d, p6/m, z29.d
zip1 z30.s, z24.s, z21.s
zip2 z24.s, z24.s, z21.s
zip1 z18.s, z29.s, z23.s
zip2 z29.s, z29.s, z23.s
add z30.s, z30.s, z18.s
add z29.s, z24.s, z29.s
uzp2 z24.d, z30.d, z29.d
revw z24.d, p6/m, z24.d
uzp1 z30.d, z30.d, z29.d
add z29.s, z24.s, z30.s
sub z30.s, z30.s, z24.s
movprfx z23, z29
mul z23.s, p7/m, z23.s, z22.s
addp z23.s, p5/m, z23.s, z23.s
mov z12.d, z1.d
movprfx z24, z1
mul z24.s, p7/m, z24.s, z30.s
addp z24.s, p5/m, z24.s, z24.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z11, [x3]
mul z29.s, p7/m, z29.s, z11.s
addp z29.s, p5/m, z29.s, z29.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z1, [x3]
mul z30.s, p7/m, z30.s, z1.s
addp z30.s, p5/m, z30.s, z30.s
zip1 z21.d, z25.d, z5.d
zip1 z18.d, z19.d, z6.d
zip2 z25.d, z25.d, z5.d
zip2 z19.d, z19.d, z6.d
zip1 z6.d, z21.d, z18.d
zip2 z18.d, z21.d, z18.d
zip1 z21.d, z25.d, z19.d
revh z21.d, p6/m, z21.d
addvl x3, sp, #3
zip2 z25.d, z25.d, z19.d
add x3, x3, #0x40
str z21, [x3]
revh z5.d, p6/m, z25.d
zip1 z25.d, z31.d, z13.d
zip1 z21.d, z26.d, z14.d
zip2 z31.d, z31.d, z13.d
zip2 z26.d, z26.d, z14.d
mov z19.d, z5.d
zip2 z14.d, z25.d, z21.d
zip1 z21.d, z25.d, z21.d
zip1 z25.d, z31.d, z26.d
revh z5.d, p6/m, z25.d
zip2 z31.d, z31.d, z26.d
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x11
saddlb z31.s, z19.h, z3.h
saddlb z25.s, z6.h, z21.h
add x3, x3, #0x40
add z25.s, z25.s, z31.s
str z6, [x3]
ldr z31, [x3]
addvl x3, sp, #0x14
mov z13.d, z19.d
add x3, x3, #0x40
str z21, [x3]
ldr z21, [x3]
addvl x3, sp, #0x13
saddlt z19.s, z31.h, z21.h
saddlt z31.s, z13.h, z3.h
add x3, x3, #0x40
str z13, [x3]
add z19.s, z19.s, z31.s
addvl x3, sp, #3
saddlb z21.s, z18.h, z14.h
add x3, x3, #0x40
ldr z6, [x3]
saddlb z31.s, z6.h, z5.h
addvl x3, sp, #0x12
add z21.s, z21.s, z31.s
saddlt z26.s, z6.h, z5.h
add x3, x3, #0x40
str z18, [x3]
ldr z31, [x3]
addvl x3, sp, #0x15
add x3, x3, #0x40
str z14, [x3]
ldr z18, [x3]
saddlt z31.s, z31.h, z18.h
add z26.s, z31.s, z26.s
revw z21.d, p6/m, z21.d
revw z26.d, p6/m, z26.d
zip1 z31.s, z25.s, z19.s
zip2 z25.s, z25.s, z19.s
zip1 z18.s, z26.s, z21.s
zip2 z26.s, z26.s, z21.s
add z31.s, z31.s, z18.s
add z26.s, z25.s, z26.s
uzp2 z25.d, z31.d, z26.d
revw z25.d, p6/m, z25.d
uzp1 z31.d, z31.d, z26.d
add z26.s, z25.s, z31.s
sub z31.s, z31.s, z25.s
movprfx z21, z26
mul z21.s, p7/m, z21.s, z22.s
addp z21.s, p5/m, z21.s, z21.s
mov z14.d, z12.d
movprfx z25, z12
mul z25.s, p7/m, z25.s, z31.s
addp z25.s, p5/m, z25.s, z25.s
mov z13.d, z11.d
mul z26.s, p7/m, z26.s, z11.s
addp z26.s, p5/m, z26.s, z26.s
mov z12.d, z1.d
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z19.d, z27.d, z7.d
zip1 z18.d, z20.d, z8.d
zip2 z27.d, z27.d, z7.d
zip2 z20.d, z20.d, z8.d
zip2 z1.d, z19.d, z18.d
zip1 z8.d, z19.d, z18.d
zip1 z19.d, z27.d, z20.d
revh z7.d, p6/m, z19.d
addvl x3, sp, #4
zip2 z27.d, z27.d, z20.d
add x3, x3, #0x40
str z7, [x3]
revh z7.d, p6/m, z27.d
addvl x3, sp, #5
zip1 z19.d, z28.d, z16.d
zip2 z28.d, z28.d, z16.d
add x3, x3, #0x40
ldr z20, [x3]
zip1 z27.d, z20.d, z15.d
zip2 z20.d, z20.d, z15.d
zip1 z16.d, z27.d, z19.d
zip2 z19.d, z27.d, z19.d
zip1 z27.d, z20.d, z28.d
revh z6.d, p6/m, z27.d
mov z27.d, z6.d
zip2 z20.d, z20.d, z28.d
revh z6.d, p6/m, z20.d
saddlb z28.s, z7.h, z6.h
saddlb z20.s, z8.h, z16.h
add z20.s, z20.s, z28.s
str z8, [x3]
ldr z28, [x3]
addvl x3, sp, #0x17
add x3, x3, #0x40
str z16, [x3]
ldr z11, [x3]
addvl x3, sp, #4
saddlt z18.s, z28.h, z11.h
saddlt z28.s, z7.h, z6.h
add x3, x3, #0x40
ldr z15, [x3]
add z18.s, z18.s, z28.s
addvl x3, sp, #0x16
saddlb z28.s, z15.h, z27.h
mov z11.d, z19.d
add x3, x3, #0x40
saddlb z19.s, z1.h, z19.h
add z19.s, z19.s, z28.s
str z1, [x3]
ldr z28, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
str z11, [x3]
ldr z11, [x3]
addvl x3, sp, #0x19
saddlt z28.s, z28.h, z11.h
add x3, x3, #0x40
str z27, [x3]
saddlt z27.s, z15.h, z27.h
add z27.s, z28.s, z27.s
revw z19.d, p6/m, z19.d
revw z27.d, p6/m, z27.d
zip1 z28.s, z20.s, z18.s
zip2 z20.s, z20.s, z18.s
zip1 z16.s, z27.s, z19.s
zip2 z27.s, z27.s, z19.s
add z28.s, z28.s, z16.s
add z27.s, z20.s, z27.s
uzp2 z20.d, z28.d, z27.d
revw z20.d, p6/m, z20.d
uzp1 z28.d, z28.d, z27.d
add z27.s, z20.s, z28.s
sub z28.s, z28.s, z20.s
mul z22.s, p7/m, z22.s, z27.s
addp z22.s, p5/m, z22.s, z22.s
movprfx z20, z14
mul z20.s, p7/m, z20.s, z28.s
addp z20.s, p5/m, z20.s, z20.s
mul z27.s, p7/m, z27.s, z13.s
addp z27.s, p5/m, z27.s, z27.s
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
addvl x3, sp, #0x1c
uzp1 z10.s, z10.s, z23.s
uzp1 z21.s, z21.s, z22.s
add x3, x3, #0x40
uzp1 z17.s, z17.s, z24.s
uzp1 z25.s, z25.s, z20.s
uzp1 z26.s, z26.s, z27.s
rshrnb z10.h, z10.s, #0xb
rshrnb z21.h, z21.s, #0xb
uzp1 z10.h, z10.h, z10.h
uzp1 z21.h, z21.h, z21.h
rshrnb z17.h, z17.s, #0xb
rshrnb z25.h, z25.s, #0xb
uzp1 z17.h, z17.h, z17.h
uzp1 z25.h, z25.h, z25.h
stp q10, q21, [x1]
rshrnb z26.h, z26.s, #0xb
uzp1 z26.h, z26.h, z26.h
uzp1 z9.s, z9.s, z29.s
uzp1 z31.s, z31.s, z28.s
rshrnb z31.h, z31.s, #0xb
stp q17, q25, [x1, #0x200]
ldr z27, [x3]
addvl x3, sp, #0x1e
add x3, x3, #0x40
ldr z23, [x3]
uzp1 z31.h, z31.h, z31.h
addvl x3, sp, #0x1d
str q26, [x1, #0x410]
zip1 z29.d, z27.d, z23.d
add x3, x3, #0x40
ldr z26, [x3]
uzp1 z2.s, z2.s, z30.s
addvl x3, sp, #0x1f
str q31, [x1, #0x610]
trn2 z31.d, z27.d, z23.d
add x3, x3, #0x40
ldr z22, [x3]
zip1 z28.d, z26.d, z22.d
cntb x3
zip1 z24.d, z29.d, z28.d
trn1 z29.d, z27.d, z23.d
lsl x3, x3, #5
cntb x6
trn2 z30.d, z26.d, z22.d
add x3, sp, x3
lsl x6, x6, #5
trn1 z28.d, z26.d, z22.d
add x3, x3, #0x40
ldr z27, [x3]
zip2 z23.d, z29.d, z28.d
rdvl x3, #0x11
zip1 z25.d, z31.d, z30.d
zip2 z22.d, z31.d, z30.d
lsl x3, x3, #1
rshrnb z9.h, z9.s, #0xb
uzp1 z9.h, z9.h, z9.h
add x3, sp, x3
str q9, [x1, #0x400]
rshrnb z2.h, z2.s, #0xb
add x3, x3, #0x40
ldr z19, [x3]
zip1 z29.d, z27.d, z19.d
addvl x3, x6, #1
rdvl x6, #0x11
trn2 z31.d, z27.d, z19.d
add x3, x3, #0x40
lsl x6, x6, #1
uzp1 z2.h, z2.h, z2.h
add x3, sp, x3
ldr z26, [x3]
str q2, [x1, #0x600]
addvl x3, x6, #1
ld1h {z10.h}, p7/z, [x4]
add x3, x3, #0x40
cntb x6, all, mul #9
add x3, sp, x3
ldr z18, [x3]
zip1 z28.d, z26.d, z18.d
cntb x3, all, mul #9
zip1 z20.d, z29.d, z28.d
trn1 z29.d, z27.d, z19.d
lsl x3, x3, #2
lsl x6, x6, #2
trn2 z30.d, z26.d, z18.d
add x3, sp, x3
trn1 z28.d, z26.d, z18.d
zip2 z19.d, z29.d, z28.d
add x3, x3, #0x40
ldr z27, [x3]
zip1 z21.d, z31.d, z30.d
rdvl x3, #0x13
zip2 z18.d, z31.d, z30.d
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
zip1 z29.d, z27.d, z15.d
addvl x3, x6, #1
cntb x6, all, mul #5
trn2 z31.d, z27.d, z15.d
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
ldr z26, [x3]
addvl x3, x6, #0xffffffffffffffff
cntb x6, all, mul #5
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
ldr z14, [x3]
zip1 z28.d, z26.d, z14.d
cntb x3, all, mul #5
zip1 z16.d, z29.d, z28.d
trn1 z29.d, z27.d, z15.d
lsl x3, x3, #3
trn2 z30.d, z26.d, z14.d
trn1 z28.d, z26.d, z14.d
add x3, sp, x3
zip2 z8.d, z29.d, z28.d
zip1 z17.d, z31.d, z30.d
add x3, x3, #0x40
ldr z27, [x3]
zip2 z11.d, z31.d, z30.d
rdvl x3, #0x15
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
zip1 z29.d, z27.d, z15.d
addvl x3, x6, #1
rdvl x6, #0x15
trn2 z31.d, z27.d, z15.d
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
ldr z26, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
ldr z14, [x3]
zip1 z28.d, z26.d, z14.d
cntb x3, all, mul #3
zip1 z13.d, z29.d, z28.d
trn2 z30.d, z26.d, z14.d
lsl x6, x3, #4
trn1 z29.d, z27.d, z15.d
trn1 z28.d, z26.d, z14.d
sub x3, x6, x3
cntb x6, all, mul #3
zip1 z12.d, z31.d, z30.d
add x3, x3, #0x40
lsl x6, x6, #4
zip2 z14.d, z29.d, z28.d
add x3, sp, x3
ldr z9, [x3]
zip2 z15.d, z31.d, z30.d
rdvl x3, #0x17
movi d31, #0000000000000000
movprfx z30, z31
sdot z30.d, z25.h, z9.h[0]
lsl x3, x3, #1
movprfx z27, z31
sdot z27.d, z21.h, z9.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z9.h[0]
add x3, sp, x3
movprfx z28, z31
sdot z28.d, z12.h, z9.h[0]
sdot z30.d, z24.h, z10.h[0]
add x3, x3, #0x40
ldr z2, [x3]
sdot z27.d, z20.h, z10.h[0]
addvl x3, x6, #0xffffffffffffffff
cntb x6, all, mul #3
sdot z30.d, z23.h, z2.h[0]
add x3, x3, #0x40
sdot z27.d, z19.h, z2.h[0]
sdot z29.d, z16.h, z10.h[0]
add x3, sp, x3
ldr z1, [x3]
sdot z29.d, z8.h, z2.h[0]
add x3, x1, #0x40
sdot z27.d, z18.h, z1.h[0]
sdot z30.d, z22.h, z1.h[0]
sdot z29.d, z11.h, z1.h[0]
sdot z28.d, z13.h, z10.h[0]
lsl x6, x6, #4
sdot z28.d, z14.h, z2.h[0]
uzp1 z30.s, z30.s, z27.s
sdot z28.d, z15.h, z1.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z25.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z21.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z9.h[1]
sdot z30.d, z24.h, z10.h[1]
sdot z27.d, z20.h, z10.h[1]
sdot z30.d, z23.h, z2.h[1]
sdot z27.d, z19.h, z2.h[1]
sdot z30.d, z22.h, z1.h[1]
sdot z27.d, z18.h, z1.h[1]
sdot z29.d, z16.h, z10.h[1]
sdot z28.d, z13.h, z10.h[1]
sdot z29.d, z8.h, z2.h[1]
sdot z28.d, z14.h, z2.h[1]
sdot z29.d, z11.h, z1.h[1]
sdot z28.d, z15.h, z1.h[1]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
ldr z10, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
cntb x3, all, mul #3
movprfx z27, z31
sdot z27.d, z21.h, z10.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z10.h[0]
lsl x3, x3, #4
movprfx z28, z31
sdot z28.d, z12.h, z10.h[0]
add x3, sp, x3
add x3, x3, #0x40
ldr z9, [x3]
sdot z30.d, z24.h, z9.h[0]
rdvl x3, #0x19
sdot z27.d, z20.h, z9.h[0]
sdot z29.d, z16.h, z9.h[0]
lsl x3, x3, #1
sdot z28.d, z13.h, z9.h[0]
add x3, sp, x3
add x3, x3, #0x40
ldr z2, [x3]
sdot z30.d, z23.h, z2.h[0]
cntb x3, all, mul #3
sdot z27.d, z19.h, z2.h[0]
sdot z29.d, z8.h, z2.h[0]
add x3, x3, x3, lsl #4
sdot z28.d, z14.h, z2.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z1, [x3]
sdot z27.d, z18.h, z1.h[0]
add x3, x1, #0x140
sdot z28.d, z15.h, z1.h[0]
sdot z30.d, z22.h, z1.h[0]
sdot z29.d, z11.h, z1.h[0]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z25.h, z10.h[1]
movprfx z27, z31
sdot z27.d, z21.h, z10.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z10.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z10.h[1]
sdot z30.d, z24.h, z9.h[1]
sdot z27.d, z20.h, z9.h[1]
sdot z30.d, z23.h, z2.h[1]
sdot z27.d, z19.h, z2.h[1]
sdot z30.d, z22.h, z1.h[1]
sdot z27.d, z18.h, z1.h[1]
sdot z29.d, z16.h, z9.h[1]
sdot z28.d, z13.h, z9.h[1]
sdot z29.d, z8.h, z2.h[1]
sdot z28.d, z14.h, z2.h[1]
sdot z29.d, z11.h, z1.h[1]
sdot z28.d, z15.h, z1.h[1]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xc0
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x2c0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x3c0
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x240
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x2e0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x3e0
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x340
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z2.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z2.h[0]
add x3, x2, #0x300
ld1h {z9.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z21.h, z2.h[0]
add x3, x2, #0x400
ld1h {z10.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z17.h, z2.h[0]
cntb x3, all, mul #0xd
movprfx z28, z31
sdot z28.d, z12.h, z2.h[0]
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
ldr z1, [x3]
sdot z30.d, z24.h, z1.h[0]
add x3, x1, #0x440
sdot z30.d, z23.h, z9.h[0]
sdot z27.d, z20.h, z1.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z27.d, z19.h, z9.h[0]
sdot z29.d, z16.h, z1.h[0]
sdot z27.d, z18.h, z10.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z28.d, z13.h, z1.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z28.d, z14.h, z9.h[0]
uzp1 z30.s, z30.s, z27.s
sdot z28.d, z15.h, z10.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z25.h, z2.h[1]
movprfx z27, z31
sdot z27.d, z21.h, z2.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z2.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z2.h[1]
sdot z30.d, z24.h, z1.h[1]
sdot z27.d, z20.h, z1.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z27.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z27.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z1.h[1]
sdot z28.d, z13.h, z1.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z28.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z28.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z28.h}, p7/z, [x3]
add x3, x2, #0x320
mov z10.d, z28.d
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x420
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
ld1h {z10.h}, p7/z, [x3]
add x3, x1, #0x540
mov z1.d, z28.d
sdot z30.d, z24.h, z2.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z14.h, z9.h[0]
uzp1 z30.s, z30.s, z26.s
sdot z27.d, z15.h, z10.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z27.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x340
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x440
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x640
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x360
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x460
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x740
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #8
add x3, x3, #0x40
ldr z26, [x3]
add x3, sp, #0x40
ldr z25, [x3]
add z30.h, z26.h, z25.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z25, [x3]
add z29.h, z26.h, z25.h
addvl x3, sp, #6
add x3, x3, #0x40
ldr z28, [x3]
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z1, [x3]
add z27.h, z28.h, z1.h
addvl x3, sp, #7
sub z26.h, z29.h, z27.h
add z29.h, z29.h, z27.h
add x3, x3, #0x40
ldr z2, [x3]
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z22, [x3]
add z25.h, z2.h, z22.h
addvl x3, sp, #0xc
sub z28.h, z30.h, z25.h
add z30.h, z30.h, z25.h
add x3, x3, #0x40
ldr z23, [x3]
add z23.h, z4.h, z23.h
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z22, [x3]
add z21.h, z22.h, z0.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z12, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z24, [x3]
add z19.h, z12.h, z24.h
addvl x3, sp, #0xd
sub z18.h, z21.h, z19.h
add x3, x3, #0x40
ldr z12, [x3]
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z11, [x3]
add z17.h, z12.h, z11.h
addvl x3, sp, #0x14
add z11.h, z7.h, z6.h
sub z20.h, z23.h, z17.h
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z22, [x3]
add z22.h, z24.h, z22.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z14, [x3]
add z10.h, z24.h, z14.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z13, [x3]
add z5.h, z13.h, z5.h
addvl x3, sp, #0x13
sub z4.h, z10.h, z5.h
add x3, x3, #0x40
ldr z13, [x3]
add z3.h, z13.h, z3.h
addvl x3, sp, #0x17
sub z9.h, z22.h, z3.h
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z14, [x3]
add z24.h, z24.h, z14.h
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z13, [x3]
add z15.h, z14.h, z13.h
addvl x3, sp, #4
sub z14.h, z24.h, z11.h
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z8, [x3]
add z13.h, z16.h, z8.h
add x3, x2, #0x480
ld1h {z8.h}, p7/z, [x3]
sub z12.h, z15.h, z13.h
add x3, x2, #0x500
ld1h {z7.h}, p7/z, [x3]
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
add x3, x1, #0x80
sdot z16.d, z28.h, z8.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
sdot z1.d, z20.h, z8.h[0]
sdot z6.d, z9.h, z8.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
uzp1 z16.s, z16.s, z1.s
sdot z2.d, z14.h, z8.h[0]
rshrnb z16.h, z16.s, #0xb
uzp1 z6.s, z6.s, z2.s
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x1, #0x180
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[1]
sdot z16.d, z28.h, z8.h[1]
sdot z1.d, z20.h, z8.h[1]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[1]
sdot z6.d, z9.h, z8.h[1]
sdot z2.d, z14.h, z8.h[1]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z7.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
sdot z16.d, z28.h, z8.h[0]
sdot z1.d, z20.h, z8.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
sdot z6.d, z9.h, z8.h[0]
sdot z2.d, z14.h, z8.h[0]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x1, #0x380
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[1]
sdot z16.d, z28.h, z8.h[1]
sdot z1.d, z20.h, z8.h[1]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[1]
sdot z6.d, z9.h, z8.h[1]
sdot z2.d, z14.h, z8.h[1]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z7.h}, p7/z, [x3]
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
add x3, x1, #0x480
sdot z16.d, z28.h, z8.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
sdot z1.d, z20.h, z8.h[0]
sdot z6.d, z9.h, z8.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
uzp1 z16.s, z16.s, z1.s
sdot z2.d, z14.h, z8.h[0]
rshrnb z16.h, z16.s, #0xb
uzp1 z6.s, z6.s, z2.s
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x1, #0x580
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[1]
sdot z16.d, z28.h, z8.h[1]
sdot z1.d, z20.h, z8.h[1]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[1]
sdot z6.d, z9.h, z8.h[1]
sdot z2.d, z14.h, z8.h[1]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z7.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
sdot z16.d, z28.h, z8.h[0]
sdot z1.d, z20.h, z8.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
sdot z6.d, z9.h, z8.h[0]
sdot z2.d, z14.h, z8.h[0]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
add x3, x1, #0x780
sdot z16.d, z28.h, z8.h[1]
movprfx z26, z31
sdot z26.d, z4.h, z7.h[1]
movprfx z28, z31
sdot z28.d, z18.h, z7.h[1]
sdot z26.d, z9.h, z8.h[1]
sdot z28.d, z20.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z12.h, z7.h[1]
uzp1 z16.s, z16.s, z28.s
sdot z20.d, z14.h, z8.h[1]
rshrnb z16.h, z16.s, #0xb
uzp1 z26.s, z26.s, z20.s
rshrnb z26.h, z26.s, #0xb
uzp1 z16.h, z16.h, z26.h
st1h {z16.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z23.h, z23.h, z17.h
add z21.h, z21.h, z19.h
revh z21.d, p6/m, z21.d
sub z23.h, z23.h, z21.h
add z22.h, z22.h, z3.h
add z10.h, z10.h, z5.h
revh z10.d, p6/m, z10.d
sub z22.h, z22.h, z10.h
add z24.h, z24.h, z11.h
add z15.h, z15.h, z13.h
revh z15.d, p6/m, z15.d
add x3, x2, #0x580
sub z24.h, z24.h, z15.h
ld1h {z15.h}, p7/z, [x3]
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z24.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
movprfx z26, z31
sdot z26.d, z23.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z24.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[1]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0x5a0
ld1h {z15.h}, p7/z, [x3]
add x3, x1, #0x500
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z24.h, z15.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z23.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z24.h, z15.h[1]
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
add x3, x0, #0x20
ld1h {z29.h}, p7/z, [x3]
ld1h {z0.h}, p7/z, [x0]
addvl x3, sp, #0x1c
rev z29.h, z29.h
sub z27.h, z0.h, z29.h
add x3, x3, #0x40
str z27, [x3]
cntb x6
add x3, x0, #0x40
ld1h {z17.h}, p7/z, [x3]
lsl x6, x6, #5
add x3, x0, #0x60
ld1h {z22.h}, p7/z, [x3]
rev z22.h, z22.h
addvl x3, sp, #0x1d
sub z26.h, z17.h, z22.h
ptrue p6.d
add x3, x3, #0x40
str z26, [x3]
add x3, x0, #0x80
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0xa0
ld1h {z9.h}, p7/z, [x3]
rev z9.h, z9.h
addvl x3, sp, #0x1e
sub z23.h, z21.h, z9.h
add x3, x3, #0x40
str z23, [x3]
add x3, x0, #0xc0
ld1h {z2.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z10.h}, p7/z, [x3]
rev z10.h, z10.h
addvl x3, sp, #0x1f
sub z31.h, z2.h, z10.h
add x3, x3, #0x40
str z31, [x3]
add x3, x0, #0x100
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z30.h}, p7/z, [x3]
rev z30.h, z30.h
cntb x3
sub z28.h, z23.h, z30.h
lsl x3, x3, #5
add x3, sp, x3
add x3, x3, #0x40
str z28, [x3]
add x3, x0, #0x140
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z24.h}, p7/z, [x3]
rev z24.h, z24.h
addvl x3, x6, #1
sub z25.h, z18.h, z24.h
rdvl x6, #0x11
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z25, [x3]
add x3, x0, #0x180
ld1h {z3.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z11.h}, p7/z, [x3]
rev z11.h, z11.h
rdvl x3, #0x11
sub z19.h, z3.h, z11.h
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z19, [x3]
add x3, x0, #0x1c0
ld1h {z4.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z12.h}, p7/z, [x3]
rev z12.h, z12.h
addvl x3, x6, #1
sub z20.h, z4.h, z12.h
cntb x6, all, mul #9
add x3, x3, #0x40
lsl x6, x6, #2
add x3, sp, x3
str z20, [x3]
add x3, x0, #0x200
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z31.h}, p7/z, [x3]
rev z31.h, z31.h
cntb x3, all, mul #9
sub z16.h, z25.h, z31.h
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
str z16, [x3]
add x3, x0, #0x240
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z26.h}, p7/z, [x3]
rev z26.h, z26.h
addvl x3, x6, #1
sub z15.h, z19.h, z26.h
cntb x6, all, mul #5
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
str z15, [x3]
add x3, x0, #0x280
ld1h {z5.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z13.h}, p7/z, [x3]
rev z13.h, z13.h
rdvl x3, #0x13
sub z14.h, z5.h, z13.h
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z14, [x3]
add x3, x0, #0x2c0
ld1h {z6.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z14.h}, p7/z, [x3]
rev z14.h, z14.h
addvl x3, x6, #0xffffffffffffffff
sub z8.h, z6.h, z14.h
cntb x6, all, mul #5
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
str z8, [x3]
add x3, x0, #0x300
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z28.h}, p7/z, [x3]
rev z7.h, z28.h
addvl x3, sp, #5
sub z1.h, z27.h, z7.h
add x3, x3, #0x40
str z7, [x3]
cntb x3, all, mul #5
lsl x3, x3, #3
add x3, sp, x3
add x3, x3, #0x40
str z1, [x3]
add x3, x0, #0x340
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z28.h}, p7/z, [x3]
rev z28.h, z28.h
addvl x3, x6, #1
sub z16.h, z20.h, z28.h
rdvl x6, #0x15
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z16, [x3]
add x3, x0, #0x380
ld1h {z7.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z15.h}, p7/z, [x3]
rev z15.h, z15.h
rdvl x3, #0x15
sub z8.h, z7.h, z15.h
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z8, [x3]
add x3, x0, #0x3c0
ld1h {z8.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z16.h}, p7/z, [x3]
rev z16.h, z16.h
addvl x3, x6, #1
sub z1.h, z8.h, z16.h
add x3, x3, #0x40
add x3, sp, x3
str z1, [x3]
zip1 z1.d, z0.d, z21.d
add x3, sp, #0x40
zip2 z21.d, z0.d, z21.d
zip1 z0.d, z17.d, z2.d
zip2 z17.d, z17.d, z2.d
zip1 z2.d, z1.d, z0.d
str z2, [x3]
zip2 z2.d, z1.d, z0.d
addvl x3, sp, #1
add x3, x3, #0x40
str z2, [x3]
zip1 z2.d, z21.d, z17.d
revh z0.d, p6/m, z2.d
zip2 z21.d, z21.d, z17.d
revh z21.d, p6/m, z21.d
mov z2.d, z21.d
zip1 z21.d, z29.d, z9.d
zip1 z17.d, z22.d, z10.d
zip2 z29.d, z29.d, z9.d
zip2 z22.d, z22.d, z10.d
zip2 z9.d, z21.d, z17.d
zip1 z10.d, z21.d, z17.d
zip1 z21.d, z29.d, z22.d
revh z21.d, p6/m, z21.d
mov z1.d, z21.d
zip2 z29.d, z29.d, z22.d
revh z22.d, p6/m, z29.d
add x3, sp, #0x40
saddlb z29.s, z2.h, z22.h
ldr z21, [x3]
saddlb z21.s, z21.h, z10.h
add z21.s, z21.s, z29.s
ldr z29, [x3]
addvl x3, sp, #8
add x3, x3, #0x40
str z10, [x3]
ldr z17, [x3]
addvl x3, sp, #7
saddlt z10.s, z29.h, z17.h
saddlt z29.s, z2.h, z22.h
add x3, x3, #0x40
str z2, [x3]
add z10.s, z10.s, z29.s
addvl x3, sp, #0xb
saddlb z29.s, z0.h, z1.h
add x3, x3, #0x40
str z22, [x3]
saddlt z22.s, z0.h, z1.h
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
saddlb z17.s, z2.h, z9.h
addvl x3, sp, #9
add z17.s, z17.s, z29.s
add x3, x3, #0x40
str z9, [x3]
ldr z9, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
saddlt z29.s, z2.h, z9.h
addvl x3, sp, #6
add z22.s, z29.s, z22.s
add x3, x3, #0x40
str z0, [x3]
addvl x3, sp, #0xa
add x3, x3, #0x40
str z1, [x3]
revw z17.d, p6/m, z17.d
revw z22.d, p6/m, z22.d
zip1 z9.s, z22.s, z17.s
zip1 z29.s, z21.s, z10.s
zip2 z22.s, z22.s, z17.s
add z29.s, z29.s, z9.s
zip2 z21.s, z21.s, z10.s
add z22.s, z21.s, z22.s
uzp2 z17.d, z29.d, z22.d
revw z17.d, p6/m, z17.d
ptrue p5.s
uzp1 z29.d, z29.d, z22.d
ld1w {z22.s}, p7/z, [x2]
add z21.s, z17.s, z29.s
sub z29.s, z29.s, z17.s
movprfx z10, z21
mul z10.s, p7/m, z10.s, z22.s
addp z10.s, p5/m, z10.s, z10.s
cntb x3, all, mul #0xb
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
ldr z1, [x3]
movprfx z17, z1
mul z17.s, p7/m, z17.s, z29.s
addp z17.s, p5/m, z17.s, z17.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z9, [x3]
mul z21.s, p7/m, z21.s, z9.s
mov z9.d, z21.d
addp z9.s, p5/m, z9.s, z21.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z21, [x3]
movprfx z2, z29
mul z2.s, p7/m, z2.s, z21.s
addp z2.s, p5/m, z2.s, z2.s
zip1 z29.d, z23.d, z3.d
zip1 z21.d, z18.d, z4.d
zip2 z23.d, z23.d, z3.d
zip2 z18.d, z18.d, z4.d
zip1 z3.d, z29.d, z21.d
zip2 z0.d, z29.d, z21.d
zip1 z29.d, z23.d, z18.d
revh z4.d, p6/m, z29.d
addvl x3, sp, #2
zip2 z23.d, z23.d, z18.d
add x3, x3, #0x40
str z4, [x3]
revh z21.d, p6/m, z23.d
zip1 z29.d, z30.d, z11.d
zip1 z23.d, z24.d, z12.d
zip2 z30.d, z30.d, z11.d
zip2 z24.d, z24.d, z12.d
zip1 z4.d, z29.d, z23.d
zip2 z18.d, z29.d, z23.d
zip1 z29.d, z30.d, z24.d
revh z29.d, p6/m, z29.d
zip2 z30.d, z30.d, z24.d
revh z30.d, p6/m, z30.d
addvl x3, sp, #0xc
mov z11.d, z30.d
saddlb z30.s, z21.h, z30.h
add x3, x3, #0x40
saddlb z24.s, z3.h, z4.h
add z24.s, z24.s, z30.s
str z3, [x3]
ldr z30, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
mov z12.d, z21.d
str z12, [x3]
addvl x3, sp, #0x10
saddlt z21.s, z30.h, z4.h
saddlt z30.s, z12.h, z11.h
add x3, x3, #0x40
str z11, [x3]
add z21.s, z21.s, z30.s
addvl x3, sp, #2
saddlb z23.s, z0.h, z18.h
add x3, x3, #0x40
ldr z12, [x3]
saddlb z30.s, z12.h, z29.h
addvl x3, sp, #0xe
add z23.s, z23.s, z30.s
add x3, x3, #0x40
str z18, [x3]
ldr z30, [x3]
addvl x3, sp, #0xf
saddlt z30.s, z0.h, z30.h
add x3, x3, #0x40
str z29, [x3]
saddlt z29.s, z12.h, z29.h
add z29.s, z30.s, z29.s
revw z23.d, p6/m, z23.d
revw z29.d, p6/m, z29.d
zip1 z30.s, z24.s, z21.s
zip2 z24.s, z24.s, z21.s
zip1 z18.s, z29.s, z23.s
zip2 z29.s, z29.s, z23.s
add z30.s, z30.s, z18.s
add z29.s, z24.s, z29.s
uzp2 z24.d, z30.d, z29.d
revw z24.d, p6/m, z24.d
uzp1 z30.d, z30.d, z29.d
add z29.s, z24.s, z30.s
sub z30.s, z30.s, z24.s
movprfx z23, z29
mul z23.s, p7/m, z23.s, z22.s
addp z23.s, p5/m, z23.s, z23.s
mov z12.d, z1.d
movprfx z24, z1
mul z24.s, p7/m, z24.s, z30.s
addp z24.s, p5/m, z24.s, z24.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z11, [x3]
mul z29.s, p7/m, z29.s, z11.s
addp z29.s, p5/m, z29.s, z29.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z1, [x3]
mul z30.s, p7/m, z30.s, z1.s
addp z30.s, p5/m, z30.s, z30.s
zip1 z21.d, z25.d, z5.d
zip1 z18.d, z19.d, z6.d
zip2 z25.d, z25.d, z5.d
zip2 z19.d, z19.d, z6.d
zip1 z6.d, z21.d, z18.d
zip2 z18.d, z21.d, z18.d
zip1 z21.d, z25.d, z19.d
revh z21.d, p6/m, z21.d
addvl x3, sp, #3
zip2 z25.d, z25.d, z19.d
add x3, x3, #0x40
str z21, [x3]
revh z5.d, p6/m, z25.d
zip1 z25.d, z31.d, z13.d
zip1 z21.d, z26.d, z14.d
zip2 z31.d, z31.d, z13.d
zip2 z26.d, z26.d, z14.d
mov z19.d, z5.d
zip2 z14.d, z25.d, z21.d
zip1 z21.d, z25.d, z21.d
zip1 z25.d, z31.d, z26.d
revh z5.d, p6/m, z25.d
zip2 z31.d, z31.d, z26.d
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x11
saddlb z31.s, z19.h, z3.h
saddlb z25.s, z6.h, z21.h
add x3, x3, #0x40
add z25.s, z25.s, z31.s
str z6, [x3]
ldr z31, [x3]
addvl x3, sp, #0x14
mov z13.d, z19.d
add x3, x3, #0x40
str z21, [x3]
ldr z21, [x3]
addvl x3, sp, #0x13
saddlt z19.s, z31.h, z21.h
saddlt z31.s, z13.h, z3.h
add x3, x3, #0x40
str z13, [x3]
add z19.s, z19.s, z31.s
addvl x3, sp, #3
saddlb z21.s, z18.h, z14.h
add x3, x3, #0x40
ldr z6, [x3]
saddlb z31.s, z6.h, z5.h
addvl x3, sp, #0x12
add z21.s, z21.s, z31.s
saddlt z26.s, z6.h, z5.h
add x3, x3, #0x40
str z18, [x3]
ldr z31, [x3]
addvl x3, sp, #0x15
add x3, x3, #0x40
str z14, [x3]
ldr z18, [x3]
saddlt z31.s, z31.h, z18.h
add z26.s, z31.s, z26.s
revw z21.d, p6/m, z21.d
revw z26.d, p6/m, z26.d
zip1 z31.s, z25.s, z19.s
zip2 z25.s, z25.s, z19.s
zip1 z18.s, z26.s, z21.s
zip2 z26.s, z26.s, z21.s
add z31.s, z31.s, z18.s
add z26.s, z25.s, z26.s
uzp2 z25.d, z31.d, z26.d
revw z25.d, p6/m, z25.d
uzp1 z31.d, z31.d, z26.d
add z26.s, z25.s, z31.s
sub z31.s, z31.s, z25.s
movprfx z21, z26
mul z21.s, p7/m, z21.s, z22.s
addp z21.s, p5/m, z21.s, z21.s
mov z14.d, z12.d
movprfx z25, z12
mul z25.s, p7/m, z25.s, z31.s
addp z25.s, p5/m, z25.s, z25.s
mov z13.d, z11.d
mul z26.s, p7/m, z26.s, z11.s
addp z26.s, p5/m, z26.s, z26.s
mov z12.d, z1.d
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z19.d, z27.d, z7.d
zip1 z18.d, z20.d, z8.d
zip2 z27.d, z27.d, z7.d
zip2 z20.d, z20.d, z8.d
zip2 z1.d, z19.d, z18.d
zip1 z8.d, z19.d, z18.d
zip1 z19.d, z27.d, z20.d
revh z7.d, p6/m, z19.d
addvl x3, sp, #4
zip2 z27.d, z27.d, z20.d
add x3, x3, #0x40
str z7, [x3]
revh z7.d, p6/m, z27.d
addvl x3, sp, #5
zip1 z19.d, z28.d, z16.d
zip2 z28.d, z28.d, z16.d
add x3, x3, #0x40
ldr z20, [x3]
zip1 z27.d, z20.d, z15.d
zip2 z20.d, z20.d, z15.d
zip1 z16.d, z27.d, z19.d
zip2 z19.d, z27.d, z19.d
zip1 z27.d, z20.d, z28.d
revh z6.d, p6/m, z27.d
mov z27.d, z6.d
zip2 z20.d, z20.d, z28.d
revh z6.d, p6/m, z20.d
saddlb z28.s, z7.h, z6.h
saddlb z20.s, z8.h, z16.h
add z20.s, z20.s, z28.s
str z8, [x3]
ldr z28, [x3]
addvl x3, sp, #0x17
add x3, x3, #0x40
str z16, [x3]
ldr z11, [x3]
addvl x3, sp, #4
saddlt z18.s, z28.h, z11.h
saddlt z28.s, z7.h, z6.h
add x3, x3, #0x40
ldr z15, [x3]
add z18.s, z18.s, z28.s
addvl x3, sp, #0x16
saddlb z28.s, z15.h, z27.h
mov z11.d, z19.d
add x3, x3, #0x40
saddlb z19.s, z1.h, z19.h
add z19.s, z19.s, z28.s
str z1, [x3]
ldr z28, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
str z11, [x3]
ldr z11, [x3]
addvl x3, sp, #0x19
saddlt z28.s, z28.h, z11.h
add x3, x3, #0x40
str z27, [x3]
saddlt z27.s, z15.h, z27.h
add z27.s, z28.s, z27.s
revw z19.d, p6/m, z19.d
revw z27.d, p6/m, z27.d
zip1 z28.s, z20.s, z18.s
zip2 z20.s, z20.s, z18.s
zip1 z16.s, z27.s, z19.s
zip2 z27.s, z27.s, z19.s
add z28.s, z28.s, z16.s
add z27.s, z20.s, z27.s
uzp2 z20.d, z28.d, z27.d
revw z20.d, p6/m, z20.d
uzp1 z28.d, z28.d, z27.d
add z27.s, z20.s, z28.s
sub z28.s, z28.s, z20.s
mul z22.s, p7/m, z22.s, z27.s
addp z22.s, p5/m, z22.s, z22.s
movprfx z20, z14
mul z20.s, p7/m, z20.s, z28.s
addp z20.s, p5/m, z20.s, z20.s
mul z27.s, p7/m, z27.s, z13.s
addp z27.s, p5/m, z27.s, z27.s
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
addvl x3, sp, #0x1c
uzp1 z10.s, z10.s, z23.s
uzp1 z21.s, z21.s, z22.s
add x3, x3, #0x40
uzp1 z17.s, z17.s, z24.s
uzp1 z25.s, z25.s, z20.s
uzp1 z26.s, z26.s, z27.s
rshrnb z10.h, z10.s, #0xb
rshrnb z21.h, z21.s, #0xb
uzp1 z10.h, z10.h, z10.h
uzp1 z21.h, z21.h, z21.h
rshrnb z17.h, z17.s, #0xb
rshrnb z25.h, z25.s, #0xb
uzp1 z17.h, z17.h, z17.h
uzp1 z25.h, z25.h, z25.h
stp q10, q21, [x1]
rshrnb z26.h, z26.s, #0xb
uzp1 z26.h, z26.h, z26.h
uzp1 z9.s, z9.s, z29.s
uzp1 z31.s, z31.s, z28.s
rshrnb z31.h, z31.s, #0xb
stp q17, q25, [x1, #0x200]
ldr z27, [x3]
addvl x3, sp, #0x1e
add x3, x3, #0x40
ldr z23, [x3]
uzp1 z31.h, z31.h, z31.h
addvl x3, sp, #0x1d
str q26, [x1, #0x410]
zip1 z29.d, z27.d, z23.d
add x3, x3, #0x40
ldr z26, [x3]
uzp1 z2.s, z2.s, z30.s
addvl x3, sp, #0x1f
str q31, [x1, #0x610]
trn2 z31.d, z27.d, z23.d
add x3, x3, #0x40
ldr z22, [x3]
zip1 z28.d, z26.d, z22.d
cntb x3
zip1 z24.d, z29.d, z28.d
trn1 z29.d, z27.d, z23.d
lsl x3, x3, #5
cntb x6
trn2 z30.d, z26.d, z22.d
add x3, sp, x3
lsl x6, x6, #5
trn1 z28.d, z26.d, z22.d
add x3, x3, #0x40
ldr z27, [x3]
zip2 z23.d, z29.d, z28.d
rdvl x3, #0x11
zip1 z25.d, z31.d, z30.d
zip2 z22.d, z31.d, z30.d
lsl x3, x3, #1
rshrnb z9.h, z9.s, #0xb
uzp1 z9.h, z9.h, z9.h
add x3, sp, x3
str q9, [x1, #0x400]
rshrnb z2.h, z2.s, #0xb
add x3, x3, #0x40
ldr z19, [x3]
zip1 z29.d, z27.d, z19.d
addvl x3, x6, #1
rdvl x6, #0x11
trn2 z31.d, z27.d, z19.d
add x3, x3, #0x40
lsl x6, x6, #1
uzp1 z2.h, z2.h, z2.h
add x3, sp, x3
ldr z26, [x3]
str q2, [x1, #0x600]
addvl x3, x6, #1
ld1h {z10.h}, p7/z, [x4]
add x3, x3, #0x40
cntb x6, all, mul #9
add x3, sp, x3
ldr z18, [x3]
zip1 z28.d, z26.d, z18.d
cntb x3, all, mul #9
zip1 z20.d, z29.d, z28.d
trn1 z29.d, z27.d, z19.d
lsl x3, x3, #2
lsl x6, x6, #2
trn2 z30.d, z26.d, z18.d
add x3, sp, x3
trn1 z28.d, z26.d, z18.d
zip2 z19.d, z29.d, z28.d
add x3, x3, #0x40
ldr z27, [x3]
zip1 z21.d, z31.d, z30.d
rdvl x3, #0x13
zip2 z18.d, z31.d, z30.d
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
zip1 z29.d, z27.d, z15.d
addvl x3, x6, #1
cntb x6, all, mul #5
trn2 z31.d, z27.d, z15.d
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
ldr z26, [x3]
addvl x3, x6, #0xffffffffffffffff
cntb x6, all, mul #5
add x3, x3, #0x40
lsl x6, x6, #3
add x3, sp, x3
ldr z14, [x3]
zip1 z28.d, z26.d, z14.d
cntb x3, all, mul #5
zip1 z16.d, z29.d, z28.d
trn1 z29.d, z27.d, z15.d
lsl x3, x3, #3
trn2 z30.d, z26.d, z14.d
trn1 z28.d, z26.d, z14.d
add x3, sp, x3
zip2 z8.d, z29.d, z28.d
zip1 z17.d, z31.d, z30.d
add x3, x3, #0x40
ldr z27, [x3]
zip2 z11.d, z31.d, z30.d
rdvl x3, #0x15
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
zip1 z29.d, z27.d, z15.d
addvl x3, x6, #1
rdvl x6, #0x15
trn2 z31.d, z27.d, z15.d
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
ldr z26, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
ldr z14, [x3]
zip1 z28.d, z26.d, z14.d
cntb x3, all, mul #3
zip1 z13.d, z29.d, z28.d
trn2 z30.d, z26.d, z14.d
lsl x6, x3, #4
trn1 z29.d, z27.d, z15.d
trn1 z28.d, z26.d, z14.d
sub x3, x6, x3
cntb x6, all, mul #3
zip1 z12.d, z31.d, z30.d
add x3, x3, #0x40
lsl x6, x6, #4
zip2 z14.d, z29.d, z28.d
add x3, sp, x3
ldr z9, [x3]
zip2 z15.d, z31.d, z30.d
rdvl x3, #0x17
movi d31, #0000000000000000
movprfx z30, z31
sdot z30.d, z25.h, z9.h[0]
lsl x3, x3, #1
movprfx z27, z31
sdot z27.d, z21.h, z9.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z9.h[0]
add x3, sp, x3
movprfx z28, z31
sdot z28.d, z12.h, z9.h[0]
sdot z30.d, z24.h, z10.h[0]
add x3, x3, #0x40
ldr z2, [x3]
sdot z27.d, z20.h, z10.h[0]
addvl x3, x6, #0xffffffffffffffff
cntb x6, all, mul #3
sdot z30.d, z23.h, z2.h[0]
add x3, x3, #0x40
sdot z27.d, z19.h, z2.h[0]
sdot z29.d, z16.h, z10.h[0]
add x3, sp, x3
ldr z1, [x3]
sdot z29.d, z8.h, z2.h[0]
add x3, x1, #0x40
sdot z27.d, z18.h, z1.h[0]
sdot z30.d, z22.h, z1.h[0]
sdot z29.d, z11.h, z1.h[0]
sdot z28.d, z13.h, z10.h[0]
lsl x6, x6, #4
sdot z28.d, z14.h, z2.h[0]
uzp1 z30.s, z30.s, z27.s
sdot z28.d, z15.h, z1.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z25.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z21.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z9.h[1]
sdot z30.d, z24.h, z10.h[1]
sdot z27.d, z20.h, z10.h[1]
sdot z30.d, z23.h, z2.h[1]
sdot z27.d, z19.h, z2.h[1]
sdot z30.d, z22.h, z1.h[1]
sdot z27.d, z18.h, z1.h[1]
sdot z29.d, z16.h, z10.h[1]
sdot z28.d, z13.h, z10.h[1]
sdot z29.d, z8.h, z2.h[1]
sdot z28.d, z14.h, z2.h[1]
sdot z29.d, z11.h, z1.h[1]
sdot z28.d, z15.h, z1.h[1]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
ldr z10, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
cntb x3, all, mul #3
movprfx z27, z31
sdot z27.d, z21.h, z10.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z10.h[0]
lsl x3, x3, #4
movprfx z28, z31
sdot z28.d, z12.h, z10.h[0]
add x3, sp, x3
add x3, x3, #0x40
ldr z9, [x3]
sdot z30.d, z24.h, z9.h[0]
rdvl x3, #0x19
sdot z27.d, z20.h, z9.h[0]
sdot z29.d, z16.h, z9.h[0]
lsl x3, x3, #1
sdot z28.d, z13.h, z9.h[0]
add x3, sp, x3
add x3, x3, #0x40
ldr z2, [x3]
sdot z30.d, z23.h, z2.h[0]
cntb x3, all, mul #3
sdot z27.d, z19.h, z2.h[0]
sdot z29.d, z8.h, z2.h[0]
add x3, x3, x3, lsl #4
sdot z28.d, z14.h, z2.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z1, [x3]
sdot z27.d, z18.h, z1.h[0]
add x3, x1, #0x140
sdot z28.d, z15.h, z1.h[0]
sdot z30.d, z22.h, z1.h[0]
sdot z29.d, z11.h, z1.h[0]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z25.h, z10.h[1]
movprfx z27, z31
sdot z27.d, z21.h, z10.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z10.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z10.h[1]
sdot z30.d, z24.h, z9.h[1]
sdot z27.d, z20.h, z9.h[1]
sdot z30.d, z23.h, z2.h[1]
sdot z27.d, z19.h, z2.h[1]
sdot z30.d, z22.h, z1.h[1]
sdot z27.d, z18.h, z1.h[1]
sdot z29.d, z16.h, z9.h[1]
sdot z28.d, z13.h, z9.h[1]
sdot z29.d, z8.h, z2.h[1]
sdot z28.d, z14.h, z2.h[1]
sdot z29.d, z11.h, z1.h[1]
sdot z28.d, z15.h, z1.h[1]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xc0
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x2c0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x3c0
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x240
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x2e0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x3e0
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x340
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z2.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z2.h[0]
add x3, x2, #0x300
ld1h {z9.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z21.h, z2.h[0]
add x3, x2, #0x400
ld1h {z10.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z17.h, z2.h[0]
cntb x3, all, mul #0xd
movprfx z28, z31
sdot z28.d, z12.h, z2.h[0]
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
ldr z1, [x3]
sdot z30.d, z24.h, z1.h[0]
add x3, x1, #0x440
sdot z30.d, z23.h, z9.h[0]
sdot z27.d, z20.h, z1.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z27.d, z19.h, z9.h[0]
sdot z29.d, z16.h, z1.h[0]
sdot z27.d, z18.h, z10.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z28.d, z13.h, z1.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z28.d, z14.h, z9.h[0]
uzp1 z30.s, z30.s, z27.s
sdot z28.d, z15.h, z10.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z25.h, z2.h[1]
movprfx z27, z31
sdot z27.d, z21.h, z2.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z2.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z2.h[1]
sdot z30.d, z24.h, z1.h[1]
sdot z27.d, z20.h, z1.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z27.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z27.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z1.h[1]
sdot z28.d, z13.h, z1.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z28.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z28.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z27.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z28.h}, p7/z, [x3]
add x3, x2, #0x320
mov z10.d, z28.d
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x420
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
ld1h {z10.h}, p7/z, [x3]
add x3, x1, #0x540
mov z1.d, z28.d
sdot z30.d, z24.h, z2.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z14.h, z9.h[0]
uzp1 z30.s, z30.s, z26.s
sdot z27.d, z15.h, z10.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z27.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x340
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x440
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x640
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z2.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z28.h}, p7/z, [x3]
mov z10.d, z28.d
add x3, x2, #0x360
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z25.h, z10.h[0]
add x3, x2, #0x460
ld1h {z10.h}, p7/z, [x3]
mov z1.d, z28.d
add x3, x1, #0x740
movprfx z26, z31
sdot z26.d, z21.h, z1.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[0]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z26.d, z20.h, z2.h[0]
sdot z30.d, z23.h, z9.h[0]
sdot z26.d, z19.h, z9.h[0]
sdot z30.d, z22.h, z10.h[0]
sdot z26.d, z18.h, z10.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z27.d, z13.h, z2.h[0]
sdot z29.d, z8.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z29.d, z11.h, z10.h[0]
sdot z27.d, z15.h, z10.h[0]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z25.h, z1.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z1.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z1.h[1]
movprfx z27, z31
sdot z27.d, z12.h, z1.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z26.d, z20.h, z2.h[1]
sdot z30.d, z23.h, z9.h[1]
sdot z26.d, z19.h, z9.h[1]
sdot z30.d, z22.h, z10.h[1]
sdot z26.d, z18.h, z10.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z27.d, z13.h, z2.h[1]
sdot z29.d, z8.h, z9.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z29.d, z11.h, z10.h[1]
sdot z27.d, z15.h, z10.h[1]
uzp1 z30.s, z30.s, z26.s
uzp1 z29.s, z29.s, z27.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #8
add x3, x3, #0x40
ldr z26, [x3]
add x3, sp, #0x40
ldr z25, [x3]
add z30.h, z26.h, z25.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z25, [x3]
add z29.h, z26.h, z25.h
addvl x3, sp, #6
add x3, x3, #0x40
ldr z28, [x3]
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z1, [x3]
add z27.h, z28.h, z1.h
addvl x3, sp, #7
sub z26.h, z29.h, z27.h
add z29.h, z29.h, z27.h
add x3, x3, #0x40
ldr z2, [x3]
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z22, [x3]
add z25.h, z2.h, z22.h
addvl x3, sp, #0xc
sub z28.h, z30.h, z25.h
add z30.h, z30.h, z25.h
add x3, x3, #0x40
ldr z23, [x3]
add z23.h, z4.h, z23.h
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z22, [x3]
add z21.h, z22.h, z0.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z12, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z24, [x3]
add z19.h, z12.h, z24.h
addvl x3, sp, #0xd
sub z18.h, z21.h, z19.h
add x3, x3, #0x40
ldr z12, [x3]
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z11, [x3]
add z17.h, z12.h, z11.h
addvl x3, sp, #0x14
add z11.h, z7.h, z6.h
sub z20.h, z23.h, z17.h
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z22, [x3]
add z22.h, z24.h, z22.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z14, [x3]
add z10.h, z24.h, z14.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z13, [x3]
add z5.h, z13.h, z5.h
addvl x3, sp, #0x13
sub z4.h, z10.h, z5.h
add x3, x3, #0x40
ldr z13, [x3]
add z3.h, z13.h, z3.h
addvl x3, sp, #0x17
sub z9.h, z22.h, z3.h
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z14, [x3]
add z24.h, z24.h, z14.h
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z13, [x3]
add z15.h, z14.h, z13.h
addvl x3, sp, #4
sub z14.h, z24.h, z11.h
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z8, [x3]
add z13.h, z16.h, z8.h
add x3, x2, #0x480
ld1h {z8.h}, p7/z, [x3]
sub z12.h, z15.h, z13.h
add x3, x2, #0x500
ld1h {z7.h}, p7/z, [x3]
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
add x3, x1, #0x80
sdot z16.d, z28.h, z8.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
sdot z1.d, z20.h, z8.h[0]
sdot z6.d, z9.h, z8.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
uzp1 z16.s, z16.s, z1.s
sdot z2.d, z14.h, z8.h[0]
rshrnb z16.h, z16.s, #0xb
uzp1 z6.s, z6.s, z2.s
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x1, #0x180
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[1]
sdot z16.d, z28.h, z8.h[1]
sdot z1.d, z20.h, z8.h[1]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[1]
sdot z6.d, z9.h, z8.h[1]
sdot z2.d, z14.h, z8.h[1]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z7.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
sdot z16.d, z28.h, z8.h[0]
sdot z1.d, z20.h, z8.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
sdot z6.d, z9.h, z8.h[0]
sdot z2.d, z14.h, z8.h[0]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x1, #0x380
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[1]
sdot z16.d, z28.h, z8.h[1]
sdot z1.d, z20.h, z8.h[1]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[1]
sdot z6.d, z9.h, z8.h[1]
sdot z2.d, z14.h, z8.h[1]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z7.h}, p7/z, [x3]
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
add x3, x1, #0x480
sdot z16.d, z28.h, z8.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
sdot z1.d, z20.h, z8.h[0]
sdot z6.d, z9.h, z8.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
uzp1 z16.s, z16.s, z1.s
sdot z2.d, z14.h, z8.h[0]
rshrnb z16.h, z16.s, #0xb
uzp1 z6.s, z6.s, z2.s
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x1, #0x580
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[1]
sdot z16.d, z28.h, z8.h[1]
sdot z1.d, z20.h, z8.h[1]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[1]
sdot z6.d, z9.h, z8.h[1]
sdot z2.d, z14.h, z8.h[1]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z7.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z16, z31
sdot z16.d, z26.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z18.h, z7.h[0]
sdot z16.d, z28.h, z8.h[0]
sdot z1.d, z20.h, z8.h[0]
movprfx z6, z31
sdot z6.d, z4.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z12.h, z7.h[0]
sdot z6.d, z9.h, z8.h[0]
sdot z2.d, z14.h, z8.h[0]
uzp1 z16.s, z16.s, z1.s
uzp1 z6.s, z6.s, z2.s
rshrnb z16.h, z16.s, #0xb
rshrnb z6.h, z6.s, #0xb
uzp1 z16.h, z16.h, z6.h
st1h {z16.h}, p7, [x3]
movprfx z16, z31
sdot z16.d, z26.h, z7.h[1]
add x3, x1, #0x780
sdot z16.d, z28.h, z8.h[1]
movprfx z26, z31
sdot z26.d, z4.h, z7.h[1]
movprfx z28, z31
sdot z28.d, z18.h, z7.h[1]
sdot z26.d, z9.h, z8.h[1]
sdot z28.d, z20.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z12.h, z7.h[1]
uzp1 z16.s, z16.s, z28.s
sdot z20.d, z14.h, z8.h[1]
rshrnb z16.h, z16.s, #0xb
uzp1 z26.s, z26.s, z20.s
rshrnb z26.h, z26.s, #0xb
uzp1 z16.h, z16.h, z26.h
st1h {z16.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z23.h, z23.h, z17.h
add z21.h, z21.h, z19.h
revh z21.d, p6/m, z21.d
sub z23.h, z23.h, z21.h
add z22.h, z22.h, z3.h
add z10.h, z10.h, z5.h
revh z10.d, p6/m, z10.d
sub z22.h, z22.h, z10.h
add z24.h, z24.h, z11.h
add z15.h, z15.h, z13.h
revh z15.d, p6/m, z15.d
add x3, x2, #0x580
sub z24.h, z24.h, z15.h
ld1h {z15.h}, p7/z, [x3]
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z24.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
movprfx z26, z31
sdot z26.d, z23.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z24.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[1]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0x5a0
ld1h {z15.h}, p7/z, [x3]
add x3, x1, #0x500
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z24.h, z15.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z23.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z24.h, z15.h[1]
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
mov x13, #0x35
cntb x12
ldp d8, d9, [sp]
mul x12, x12, x13
ldp d10, d11, [sp, #0x10]
ldp d12, d13, [sp, #0x20]
ldp d14, d15, [sp, #0x30]
add sp, sp, x12
add sp, sp, #0x40
ldr x19, [sp, #0x10]
ldp x29, x30, [sp]
add sp, sp, #0x820
stp x29, x30, [sp, #-0x20]!
