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
add x3, x3, #0xcb0
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
cntb x12, all, mul #9
adrp x2, #0x457000
ptrue p7.b
lsl x12, x12, #2
add x2, x2, #0xcb0
sub sp, sp, x12
add x3, x2, #0x20
ld1w {z31.s}, p7/z, [x3]
sub sp, sp, #0x40
cntb x6
addvl x3, sp, #0x1a
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
addvl x3, sp, #0x1b
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x60
ld1w {z31.s}, p7/z, [x3]
add x3, sp, #0x40
str z31, [x3]
add x3, x2, #0x180
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1c
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x280
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1d
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x380
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1e
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xa0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1f
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x1a0
ld1h {z31.h}, p7/z, [x3]
cntb x3
lsl x3, x3, #5
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x2a0
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
rdvl x6, #0x11
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x3a0
ld1h {z31.h}, p7/z, [x3]
rdvl x3, #0x11
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x100
ld1h {z10.h}, p7/z, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
str z10, [x3]
add x3, x0, #0x20
ld1h {z30.h}, p7/z, [x3]
ld1h {z21.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z28.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z12.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z21.d, z13.d
add x3, x0, #0xc0
zip2 z21.d, z21.d, z13.d
ld1h {z11.h}, p7/z, [x3]
zip1 z13.d, z15.d, z11.d
zip2 z15.d, z15.d, z11.d
zip1 z2.d, z14.d, z13.d
zip2 z13.d, z14.d, z13.d
zip1 z14.d, z21.d, z15.d
revh z14.d, p6/m, z14.d
zip2 z21.d, z21.d, z15.d
revh z15.d, p6/m, z21.d
rev z18.h, z18.h
rev z16.h, z16.h
rev z30.h, z30.h
zip1 z21.d, z30.d, z18.d
rev z24.h, z24.h
zip2 z30.d, z30.d, z18.d
zip1 z18.d, z24.d, z16.d
zip2 z24.d, z24.d, z16.d
zip1 z16.d, z21.d, z18.d
zip2 z18.d, z21.d, z18.d
zip1 z21.d, z30.d, z24.d
revh z11.d, p6/m, z21.d
zip2 z30.d, z30.d, z24.d
revh z24.d, p6/m, z30.d
addvl x3, sp, #4
saddlb z21.s, z2.h, z16.h
saddlb z30.s, z15.h, z24.h
add x3, x3, #0x40
str z16, [x3]
ldr z10, [x3]
addvl x3, sp, #3
saddlt z16.s, z2.h, z10.h
add z21.s, z21.s, z30.s
add x3, x3, #0x40
str z15, [x3]
saddlt z30.s, z15.h, z24.h
addvl x3, sp, #7
add z16.s, z16.s, z30.s
saddlb z30.s, z14.h, z11.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z18.d
addvl x3, sp, #1
saddlb z18.s, z13.h, z18.h
add z18.s, z18.s, z30.s
add x3, x3, #0x40
str z13, [x3]
ldr z10, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z9, [x3]
addvl x3, sp, #2
saddlt z30.s, z10.h, z9.h
saddlt z24.s, z14.h, z11.h
add x3, x3, #0x40
str z14, [x3]
add z24.s, z30.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z11, [x3]
revw z18.d, p6/m, z18.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z21.s, z16.s
zip2 z21.s, z21.s, z16.s
zip1 z15.s, z24.s, z18.s
zip2 z24.s, z24.s, z18.s
add z30.s, z30.s, z15.s
add z24.s, z21.s, z24.s
uzp2 z21.d, z30.d, z24.d
revw z21.d, p6/m, z21.d
ptrue p5.s
uzp1 z30.d, z30.d, z24.d
ld1w {z13.s}, p7/z, [x2]
add z24.s, z21.s, z30.s
sub z30.s, z30.s, z21.s
movprfx z16, z24
mul z16.s, p7/m, z16.s, z13.s
addp z16.s, p5/m, z16.s, z16.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z8, [x3]
movprfx z18, z8
mul z18.s, p7/m, z18.s, z30.s
addp z18.s, p5/m, z18.s, z18.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z7, [x3]
mul z24.s, p7/m, z24.s, z7.s
addp z24.s, p5/m, z24.s, z24.s
add x3, sp, #0x40
ldr z4, [x3]
mul z30.s, p7/m, z30.s, z4.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x100
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z11.h}, p7/z, [x3]
zip1 z14.d, z21.d, z11.d
add x3, x0, #0x1c0
ld1h {z10.h}, p7/z, [x3]
zip2 z21.d, z21.d, z11.d
zip1 z11.d, z15.d, z10.d
zip2 z15.d, z15.d, z10.d
zip2 z9.d, z14.d, z11.d
zip1 z10.d, z14.d, z11.d
zip1 z14.d, z21.d, z15.d
revh z6.d, p6/m, z14.d
zip2 z21.d, z21.d, z15.d
revh z5.d, p6/m, z21.d
rev z21.h, z19.h
rev z17.h, z17.h
rev z26.h, z26.h
zip1 z19.d, z26.d, z17.d
rev z25.h, z25.h
zip2 z26.d, z26.d, z17.d
zip1 z17.d, z25.d, z21.d
zip2 z25.d, z25.d, z21.d
zip1 z21.d, z19.d, z17.d
zip2 z17.d, z19.d, z17.d
zip1 z19.d, z26.d, z25.d
revh z3.d, p6/m, z19.d
zip2 z26.d, z26.d, z25.d
revh z25.d, p6/m, z26.d
addvl x3, sp, #8
saddlb z26.s, z5.h, z25.h
saddlb z19.s, z10.h, z21.h
add x3, x3, #0x40
add z19.s, z19.s, z26.s
str z10, [x3]
ldr z26, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
str z21, [x3]
ldr z1, [x3]
addvl x3, sp, #0xb
saddlt z15.s, z26.h, z1.h
saddlt z26.s, z5.h, z25.h
add x3, x3, #0x40
str z5, [x3]
add z15.s, z15.s, z26.s
addvl x3, sp, #0xf
saddlb z26.s, z6.h, z3.h
add x3, x3, #0x40
str z25, [x3]
mov z25.d, z17.d
addvl x3, sp, #9
saddlb z17.s, z9.h, z17.h
add z17.s, z17.s, z26.s
add x3, x3, #0x40
str z9, [x3]
ldr z1, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
str z25, [x3]
ldr z0, [x3]
addvl x3, sp, #0xa
saddlt z26.s, z1.h, z0.h
saddlt z25.s, z6.h, z3.h
add x3, x3, #0x40
str z6, [x3]
add z25.s, z26.s, z25.s
addvl x3, sp, #0xe
add x3, x3, #0x40
str z3, [x3]
revw z17.d, p6/m, z17.d
revw z25.d, p6/m, z25.d
zip1 z26.s, z19.s, z15.s
zip2 z19.s, z19.s, z15.s
zip1 z14.s, z25.s, z17.s
zip2 z25.s, z25.s, z17.s
add z26.s, z26.s, z14.s
add z25.s, z19.s, z25.s
uzp2 z19.d, z26.d, z25.d
revw z19.d, p6/m, z19.d
uzp1 z26.d, z26.d, z25.d
add z9.s, z19.s, z26.s
sub z26.s, z26.s, z19.s
movprfx z5, z9
mul z5.s, p7/m, z5.s, z13.s
addp z5.s, p5/m, z5.s, z5.s
movprfx z6, z8
mul z6.s, p7/m, z6.s, z26.s
addp z6.s, p5/m, z6.s, z6.s
mul z9.s, p7/m, z9.s, z7.s
addp z9.s, p5/m, z9.s, z9.s
mul z26.s, p7/m, z26.s, z4.s
addp z26.s, p5/m, z26.s, z26.s
add x3, x0, #0x200
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x240
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z15.h}, p7/z, [x3]
zip1 z17.d, z25.d, z15.d
add x3, x0, #0x2c0
zip2 z25.d, z25.d, z15.d
ld1h {z14.h}, p7/z, [x3]
zip1 z15.d, z19.d, z14.d
zip2 z19.d, z19.d, z14.d
zip1 z1.d, z17.d, z15.d
zip2 z0.d, z17.d, z15.d
zip1 z17.d, z25.d, z19.d
revh z21.d, p6/m, z17.d
zip2 z25.d, z25.d, z19.d
revh z17.d, p6/m, z25.d
rev z25.h, z20.h
rev z22.h, z22.h
rev z28.h, z28.h
rev z31.h, z31.h
zip1 z19.d, z28.d, z25.d
zip2 z28.d, z28.d, z25.d
zip1 z25.d, z31.d, z22.d
zip2 z31.d, z31.d, z22.d
zip1 z22.d, z19.d, z25.d
zip1 z10.d, z28.d, z31.d
zip2 z19.d, z19.d, z25.d
revh z10.d, p6/m, z10.d
zip2 z28.d, z28.d, z31.d
revh z28.d, p6/m, z28.d
addvl x3, sp, #0x10
saddlb z31.s, z17.h, z28.h
saddlb z20.s, z1.h, z22.h
add x3, x3, #0x40
add z20.s, z20.s, z31.s
str z1, [x3]
ldr z31, [x3]
addvl x3, sp, #0x14
saddlt z25.s, z21.h, z10.h
add x3, x3, #0x40
str z22, [x3]
ldr z22, [x3]
addvl x3, sp, #0x13
saddlt z15.s, z31.h, z22.h
saddlt z31.s, z17.h, z28.h
add x3, x3, #0x40
str z17, [x3]
add z15.s, z15.s, z31.s
addvl x3, sp, #0x11
saddlb z31.s, z21.h, z10.h
saddlb z17.s, z0.h, z19.h
add x3, x3, #0x40
add z17.s, z17.s, z31.s
str z0, [x3]
ldr z31, [x3]
addvl x3, sp, #0x12
saddlt z31.s, z31.h, z19.h
add x3, x3, #0x40
add z25.s, z31.s, z25.s
str z21, [x3]
revw z17.d, p6/m, z17.d
revw z25.d, p6/m, z25.d
zip1 z31.s, z20.s, z15.s
zip2 z20.s, z20.s, z15.s
zip1 z14.s, z25.s, z17.s
zip2 z25.s, z25.s, z17.s
add z31.s, z31.s, z14.s
add z25.s, z20.s, z25.s
uzp2 z20.d, z31.d, z25.d
revw z20.d, p6/m, z20.d
uzp1 z31.d, z31.d, z25.d
add z25.s, z20.s, z31.s
sub z31.s, z31.s, z20.s
movprfx z15, z25
mul z15.s, p7/m, z15.s, z13.s
addp z15.s, p5/m, z15.s, z15.s
mov z22.d, z8.d
movprfx z17, z8
mul z17.s, p7/m, z17.s, z31.s
addp z17.s, p5/m, z17.s, z17.s
mov z21.d, z7.d
mul z25.s, p7/m, z25.s, z7.s
addp z25.s, p5/m, z25.s, z25.s
mul z31.s, p7/m, z31.s, z4.s
addp z31.s, p5/m, z31.s, z31.s
add x3, x0, #0x300
ld1h {z14.h}, p7/z, [x3]
add x3, x0, #0x340
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z11.h}, p7/z, [x3]
zip1 z8.d, z14.d, z11.d
add x3, x0, #0x3c0
ld1h {z7.h}, p7/z, [x3]
zip2 z14.d, z14.d, z11.d
zip1 z11.d, z20.d, z7.d
zip2 z20.d, z20.d, z7.d
zip1 z1.d, z8.d, z11.d
zip2 z0.d, z8.d, z11.d
zip1 z7.d, z14.d, z20.d
revh z7.d, p6/m, z7.d
zip2 z14.d, z14.d, z20.d
revh z20.d, p6/m, z14.d
rev z12.h, z12.h
rev z23.h, z23.h
mov z14.d, z20.d
rev z29.h, z29.h
rev z27.h, z27.h
zip1 z20.d, z29.d, z12.d
zip2 z29.d, z29.d, z12.d
zip1 z12.d, z27.d, z23.d
zip2 z27.d, z27.d, z23.d
zip1 z23.d, z20.d, z12.d
zip1 z11.d, z29.d, z27.d
zip2 z20.d, z20.d, z12.d
revh z11.d, p6/m, z11.d
zip2 z29.d, z29.d, z27.d
revh z29.d, p6/m, z29.d
addvl x3, sp, #0x15
saddlb z27.s, z14.h, z29.h
saddlb z4.s, z1.h, z23.h
add x3, x3, #0x40
add z4.s, z4.s, z27.s
str z1, [x3]
ldr z27, [x3]
addvl x3, sp, #0x18
saddlb z3.s, z0.h, z20.h
add x3, x3, #0x40
str z23, [x3]
ldr z8, [x3]
addvl x3, sp, #0x17
saddlt z1.s, z27.h, z8.h
saddlt z27.s, z14.h, z29.h
add x3, x3, #0x40
add z1.s, z1.s, z27.s
saddlb z27.s, z7.h, z11.h
str z14, [x3]
addvl x3, sp, #0x16
add z3.s, z3.s, z27.s
add x3, x3, #0x40
saddlt z12.s, z7.h, z11.h
str z0, [x3]
ldr z27, [x3]
saddlt z27.s, z27.h, z20.h
add z12.s, z27.s, z12.s
revw z3.d, p6/m, z3.d
revw z12.d, p6/m, z12.d
zip1 z27.s, z4.s, z1.s
zip2 z4.s, z4.s, z1.s
zip1 z0.s, z12.s, z3.s
zip2 z12.s, z12.s, z3.s
add z27.s, z27.s, z0.s
add z12.s, z4.s, z12.s
uzp2 z4.d, z27.d, z12.d
revw z4.d, p6/m, z4.d
uzp1 z27.d, z27.d, z12.d
add z12.s, z4.s, z27.s
sub z27.s, z27.s, z4.s
mul z13.s, p7/m, z13.s, z12.s
addp z13.s, p5/m, z13.s, z13.s
movprfx z4, z22
mul z4.s, p7/m, z4.s, z27.s
addp z4.s, p5/m, z4.s, z4.s
mul z12.s, p7/m, z12.s, z21.s
addp z12.s, p5/m, z12.s, z12.s
add x3, sp, #0x40
ldr z23, [x3]
mul z27.s, p7/m, z27.s, z23.s
addp z27.s, p5/m, z27.s, z27.s
addvl x3, sp, #0x19
uzp1 z16.s, z16.s, z5.s
uzp1 z15.s, z15.s, z13.s
add x3, x3, #0x40
uzp1 z18.s, z18.s, z6.s
uzp1 z17.s, z17.s, z4.s
uzp1 z24.s, z24.s, z9.s
uzp1 z25.s, z25.s, z12.s
uzp1 z30.s, z30.s, z26.s
uzp1 z31.s, z31.s, z27.s
rshrnb z16.h, z16.s, #0xb
rshrnb z15.h, z15.s, #0xb
uzp1 z16.h, z16.h, z16.h
uzp1 z15.h, z15.h, z15.h
rshrnb z18.h, z18.s, #0xb
rshrnb z17.h, z17.s, #0xb
uzp1 z18.h, z18.h, z18.h
uzp1 z17.h, z17.h, z17.h
rshrnb z24.h, z24.s, #0xb
rshrnb z25.h, z25.s, #0xb
uzp1 z24.h, z24.h, z24.h
uzp1 z25.h, z25.h, z25.h
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z30.h, z30.h, z30.h
uzp1 z31.h, z31.h, z31.h
stp q16, q15, [x1]
stp q18, q17, [x1, #0x200]
str q24, [x1, #0x400]
str q25, [x1, #0x410]
str q30, [x1, #0x600]
str q31, [x1, #0x610]
str z2, [x3]
ldr z4, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z31, [x3]
sub z18.h, z4.h, z31.h
addvl x3, sp, #1
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z31, [x3]
sub z24.h, z4.h, z31.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z31, [x3]
sub z31.h, z14.h, z31.h
revh z17.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z15.h, z30.h
revh z16.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z27, [x3]
sub z5.h, z4.h, z27.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z27, [x3]
sub z6.h, z4.h, z27.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z27, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z27.h, z3.h
revh z4.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
sub z31.h, z26.h, z23.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z9, [x3]
sub z0.h, z13.h, z9.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z13, [x3]
sub z1.h, z13.h, z19.h
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z22, [x3]
sub z31.h, z22.h, z10.h
revh z8.d, p6/m, z31.d
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z12, [x3]
sub z31.h, z12.h, z28.h
revh z14.d, p6/m, z31.d
addvl x3, sp, #0x15
sub z31.h, z7.h, z11.h
add x3, x3, #0x40
ldr z21, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z13, [x3]
sub z22.h, z21.h, z13.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z21, [x3]
sub z21.h, z21.h, z20.h
revh z23.d, p6/m, z31.d
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z13, [x3]
sub z31.h, z13.h, z29.h
revh z2.d, p6/m, z31.d
addvl x3, sp, #0x1c
movi d31, #0000000000000000
ld1h {z15.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z13, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z13.h[0]
addvl x3, sp, #0x1d
movprfx z25, z31
sdot z25.d, z6.h, z13.h[0]
movprfx z27, z31
sdot z27.d, z1.h, z13.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z26, z31
sdot z26.d, z21.h, z13.h[0]
addvl x3, sp, #0x1e
sdot z30.d, z18.h, z15.h[0]
sdot z25.d, z5.h, z15.h[0]
add x3, x3, #0x40
ldr z9, [x3]
sdot z30.d, z17.h, z12.h[0]
add x3, x1, #0x40
sdot z30.d, z16.h, z9.h[0]
sdot z25.d, z4.h, z12.h[0]
sdot z27.d, z0.h, z15.h[0]
sdot z25.d, z3.h, z9.h[0]
sdot z27.d, z8.h, z12.h[0]
sdot z26.d, z22.h, z15.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z26.d, z23.h, z12.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z2.h, z9.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z24.h, z13.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z13.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z13.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z13.h[1]
sdot z30.d, z18.h, z15.h[1]
sdot z25.d, z5.h, z15.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z4.h, z12.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z25.d, z3.h, z9.h[1]
sdot z27.d, z0.h, z15.h[1]
sdot z26.d, z22.h, z15.h[1]
sdot z27.d, z8.h, z12.h[1]
sdot z26.d, z23.h, z12.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z26.d, z2.h, z9.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
cntb x3
cntb x6
add z11.h, z7.h, z11.h
lsl x3, x3, #5
lsl x6, x6, #5
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z15.h[0]
addvl x3, sp, #0x1f
movprfx z25, z31
sdot z25.d, z6.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z1.h, z15.h[0]
add x3, x3, #0x40
ldr z13, [x3]
movprfx z26, z31
sdot z26.d, z21.h, z15.h[0]
addvl x3, x6, #1
sdot z30.d, z18.h, z13.h[0]
sdot z25.d, z5.h, z13.h[0]
add x3, x3, #0x40
sdot z27.d, z0.h, z13.h[0]
sdot z26.d, z22.h, z13.h[0]
add x3, sp, x3
ldr z12, [x3]
sdot z30.d, z17.h, z12.h[0]
rdvl x3, #0x11
sdot z25.d, z4.h, z12.h[0]
sdot z27.d, z8.h, z12.h[0]
lsl x3, x3, #1
sdot z26.d, z23.h, z12.h[0]
rdvl x6, #0x11
add x3, sp, x3
lsl x6, x6, #1
add x3, x3, #0x40
ldr z9, [x3]
sdot z25.d, z3.h, z9.h[0]
add x3, x1, #0x140
sdot z26.d, z2.h, z9.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z24.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z15.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z15.h[1]
sdot z30.d, z18.h, z13.h[1]
sdot z25.d, z5.h, z13.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z4.h, z12.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z25.d, z3.h, z9.h[1]
sdot z27.d, z0.h, z13.h[1]
sdot z26.d, z22.h, z13.h[1]
sdot z27.d, z8.h, z12.h[1]
sdot z26.d, z23.h, z12.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z26.d, z2.h, z9.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xc0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x2c0
ld1h {z13.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x2, #0x3c0
ld1h {z15.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
add x3, x1, #0x240
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x2e0
ld1h {z13.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x2, #0x3e0
ld1h {z15.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
add x3, x1, #0x340
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z12.h[0]
add x3, x2, #0x400
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z12.h[0]
addvl x3, x6, #1
movprfx z27, z31
sdot z27.d, z1.h, z12.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z12.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z9, [x3]
sdot z30.d, z18.h, z9.h[0]
add x3, x1, #0x440
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z5.h, z9.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z27.d, z0.h, z9.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z22.h, z9.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z23.h, z13.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z2.h, z15.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z24.h, z12.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z12.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z12.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z12.h[1]
sdot z30.d, z18.h, z9.h[1]
sdot z25.d, z5.h, z9.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z9.h[1]
sdot z26.d, z22.h, z9.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x420
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x1, #0x540
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x440
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x1, #0x640
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x460
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x1, #0x740
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z4, [x3]
add z30.h, z16.h, z4.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z16, [x3]
add z27.h, z18.h, z16.h
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
add z18.h, z15.h, z24.h
addvl x3, sp, #0xc
sub z26.h, z30.h, z18.h
sub z24.h, z27.h, z25.h
add x3, x3, #0x40
ldr z21, [x3]
add z30.h, z30.h, z18.h
addvl x3, sp, #8
add z27.h, z27.h, z25.h
add x3, x3, #0x40
ldr z16, [x3]
add z21.h, z21.h, z16.h
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
ldr z15, [x3]
add z17.h, z16.h, z15.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z6, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z3, [x3]
add z15.h, z6.h, z3.h
addvl x3, sp, #0xb
sub z13.h, z17.h, z15.h
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
add z12.h, z5.h, z23.h
addvl x3, sp, #0x14
sub z16.h, z21.h, z12.h
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z9, [x3]
add z22.h, z14.h, z9.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z14, [x3]
add z19.h, z19.h, z14.h
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z23, [x3]
add z10.h, z23.h, z10.h
addvl x3, sp, #0x13
sub z6.h, z19.h, z10.h
add x3, x3, #0x40
ldr z23, [x3]
add z28.h, z23.h, z28.h
addvl x3, sp, #0x18
sub z9.h, z22.h, z28.h
add x3, x3, #0x40
ldr z23, [x3]
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z14, [x3]
add z23.h, z23.h, z14.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z14, [x3]
add z20.h, z20.h, z14.h
addvl x3, sp, #0x17
sub z7.h, z20.h, z11.h
add x3, x3, #0x40
ldr z14, [x3]
add z29.h, z14.h, z29.h
add x3, x2, #0x480
ld1h {z5.h}, p7/z, [x3]
sub z8.h, z23.h, z29.h
add x3, x2, #0x500
ld1h {z4.h}, p7/z, [x3]
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
add x3, x1, #0x80
sdot z14.d, z26.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z16.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z14.s, z14.s, z1.s
sdot z2.d, z8.h, z5.h[0]
rshrnb z14.h, z14.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x1, #0x180
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[1]
sdot z14.d, z26.h, z5.h[1]
sdot z1.d, z16.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z8.h, z5.h[1]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
sdot z14.d, z26.h, z5.h[0]
sdot z1.d, z16.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z8.h, z5.h[0]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x1, #0x380
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[1]
sdot z14.d, z26.h, z5.h[1]
sdot z1.d, z16.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z8.h, z5.h[1]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z4.h}, p7/z, [x3]
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
add x3, x1, #0x480
sdot z14.d, z26.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z16.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z14.s, z14.s, z1.s
sdot z2.d, z8.h, z5.h[0]
rshrnb z14.h, z14.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x1, #0x580
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[1]
sdot z14.d, z26.h, z5.h[1]
sdot z1.d, z16.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z8.h, z5.h[1]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
sdot z14.d, z26.h, z5.h[0]
sdot z1.d, z16.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z8.h, z5.h[0]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
add x3, x1, #0x780
sdot z14.d, z26.h, z5.h[1]
movprfx z24, z31
sdot z24.d, z6.h, z4.h[1]
movprfx z26, z31
sdot z26.d, z13.h, z4.h[1]
sdot z24.d, z9.h, z5.h[1]
sdot z26.d, z16.h, z5.h[1]
movprfx z16, z31
sdot z16.d, z7.h, z4.h[1]
uzp1 z14.s, z14.s, z26.s
sdot z16.d, z8.h, z5.h[1]
rshrnb z14.h, z14.s, #0xb
uzp1 z24.s, z24.s, z16.s
rshrnb z24.h, z24.s, #0xb
uzp1 z14.h, z14.h, z24.h
st1h {z14.h}, p7, [x3]
revh z27.d, p6/m, z27.d
sub z30.h, z30.h, z27.h
add z21.h, z21.h, z12.h
add z17.h, z17.h, z15.h
revh z17.d, p6/m, z17.d
sub z21.h, z21.h, z17.h
add z22.h, z22.h, z28.h
add z19.h, z19.h, z10.h
revh z19.d, p6/m, z19.d
sub z22.h, z22.h, z19.h
add z23.h, z23.h, z29.h
add z20.h, z20.h, z11.h
revh z20.d, p6/m, z20.d
add x3, x2, #0x580
ld1h {z15.h}, p7/z, [x3]
sub z23.h, z23.h, z20.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z23.h, z15.h[0]
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
sdot z26.d, z21.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z23.h, z15.h[1]
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
sdot z26.d, z21.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z23.h, z15.h[0]
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
sdot z30.d, z21.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z23.h, z15.h[1]
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
ld1h {z21.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z28.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z12.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z21.d, z13.d
add x3, x0, #0xc0
zip2 z21.d, z21.d, z13.d
ld1h {z11.h}, p7/z, [x3]
zip1 z13.d, z15.d, z11.d
zip2 z15.d, z15.d, z11.d
zip1 z2.d, z14.d, z13.d
zip2 z13.d, z14.d, z13.d
zip1 z14.d, z21.d, z15.d
revh z14.d, p6/m, z14.d
zip2 z21.d, z21.d, z15.d
revh z15.d, p6/m, z21.d
rev z18.h, z18.h
rev z16.h, z16.h
rev z30.h, z30.h
zip1 z21.d, z30.d, z18.d
rev z24.h, z24.h
zip2 z30.d, z30.d, z18.d
zip1 z18.d, z24.d, z16.d
zip2 z24.d, z24.d, z16.d
zip1 z16.d, z21.d, z18.d
zip2 z18.d, z21.d, z18.d
zip1 z21.d, z30.d, z24.d
revh z11.d, p6/m, z21.d
zip2 z30.d, z30.d, z24.d
revh z24.d, p6/m, z30.d
addvl x3, sp, #4
saddlb z21.s, z2.h, z16.h
saddlb z30.s, z15.h, z24.h
add x3, x3, #0x40
str z16, [x3]
ldr z10, [x3]
addvl x3, sp, #3
saddlt z16.s, z2.h, z10.h
add z21.s, z21.s, z30.s
add x3, x3, #0x40
str z15, [x3]
saddlt z30.s, z15.h, z24.h
addvl x3, sp, #7
add z16.s, z16.s, z30.s
saddlb z30.s, z14.h, z11.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z18.d
addvl x3, sp, #1
saddlb z18.s, z13.h, z18.h
add z18.s, z18.s, z30.s
add x3, x3, #0x40
str z13, [x3]
ldr z10, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z9, [x3]
addvl x3, sp, #2
saddlt z30.s, z10.h, z9.h
saddlt z24.s, z14.h, z11.h
add x3, x3, #0x40
str z14, [x3]
add z24.s, z30.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z11, [x3]
revw z18.d, p6/m, z18.d
revw z24.d, p6/m, z24.d
zip1 z30.s, z21.s, z16.s
zip2 z21.s, z21.s, z16.s
zip1 z15.s, z24.s, z18.s
zip2 z24.s, z24.s, z18.s
add z30.s, z30.s, z15.s
add z24.s, z21.s, z24.s
uzp2 z21.d, z30.d, z24.d
revw z21.d, p6/m, z21.d
ptrue p5.s
uzp1 z30.d, z30.d, z24.d
ld1w {z13.s}, p7/z, [x2]
add z24.s, z21.s, z30.s
sub z30.s, z30.s, z21.s
movprfx z16, z24
mul z16.s, p7/m, z16.s, z13.s
addp z16.s, p5/m, z16.s, z16.s
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z8, [x3]
movprfx z18, z8
mul z18.s, p7/m, z18.s, z30.s
addp z18.s, p5/m, z18.s, z18.s
addvl x3, sp, #0x1b
add x3, x3, #0x40
ldr z7, [x3]
mul z24.s, p7/m, z24.s, z7.s
addp z24.s, p5/m, z24.s, z24.s
add x3, sp, #0x40
ldr z4, [x3]
mul z30.s, p7/m, z30.s, z4.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x100
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z11.h}, p7/z, [x3]
zip1 z14.d, z21.d, z11.d
add x3, x0, #0x1c0
ld1h {z10.h}, p7/z, [x3]
zip2 z21.d, z21.d, z11.d
zip1 z11.d, z15.d, z10.d
zip2 z15.d, z15.d, z10.d
zip2 z9.d, z14.d, z11.d
zip1 z10.d, z14.d, z11.d
zip1 z14.d, z21.d, z15.d
revh z6.d, p6/m, z14.d
zip2 z21.d, z21.d, z15.d
revh z5.d, p6/m, z21.d
rev z21.h, z19.h
rev z17.h, z17.h
rev z26.h, z26.h
zip1 z19.d, z26.d, z17.d
rev z25.h, z25.h
zip2 z26.d, z26.d, z17.d
zip1 z17.d, z25.d, z21.d
zip2 z25.d, z25.d, z21.d
zip1 z21.d, z19.d, z17.d
zip2 z17.d, z19.d, z17.d
zip1 z19.d, z26.d, z25.d
revh z3.d, p6/m, z19.d
zip2 z26.d, z26.d, z25.d
revh z25.d, p6/m, z26.d
addvl x3, sp, #8
saddlb z26.s, z5.h, z25.h
saddlb z19.s, z10.h, z21.h
add x3, x3, #0x40
add z19.s, z19.s, z26.s
str z10, [x3]
ldr z26, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
str z21, [x3]
ldr z1, [x3]
addvl x3, sp, #0xb
saddlt z15.s, z26.h, z1.h
saddlt z26.s, z5.h, z25.h
add x3, x3, #0x40
str z5, [x3]
add z15.s, z15.s, z26.s
addvl x3, sp, #0xf
saddlb z26.s, z6.h, z3.h
add x3, x3, #0x40
str z25, [x3]
mov z25.d, z17.d
addvl x3, sp, #9
saddlb z17.s, z9.h, z17.h
add z17.s, z17.s, z26.s
add x3, x3, #0x40
str z9, [x3]
ldr z1, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
str z25, [x3]
ldr z0, [x3]
addvl x3, sp, #0xa
saddlt z26.s, z1.h, z0.h
saddlt z25.s, z6.h, z3.h
add x3, x3, #0x40
str z6, [x3]
add z25.s, z26.s, z25.s
addvl x3, sp, #0xe
add x3, x3, #0x40
str z3, [x3]
revw z17.d, p6/m, z17.d
revw z25.d, p6/m, z25.d
zip1 z26.s, z19.s, z15.s
zip2 z19.s, z19.s, z15.s
zip1 z14.s, z25.s, z17.s
zip2 z25.s, z25.s, z17.s
add z26.s, z26.s, z14.s
add z25.s, z19.s, z25.s
uzp2 z19.d, z26.d, z25.d
revw z19.d, p6/m, z19.d
uzp1 z26.d, z26.d, z25.d
add z9.s, z19.s, z26.s
sub z26.s, z26.s, z19.s
movprfx z5, z9
mul z5.s, p7/m, z5.s, z13.s
addp z5.s, p5/m, z5.s, z5.s
movprfx z6, z8
mul z6.s, p7/m, z6.s, z26.s
addp z6.s, p5/m, z6.s, z6.s
mul z9.s, p7/m, z9.s, z7.s
addp z9.s, p5/m, z9.s, z9.s
mul z26.s, p7/m, z26.s, z4.s
addp z26.s, p5/m, z26.s, z26.s
add x3, x0, #0x200
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x240
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z15.h}, p7/z, [x3]
zip1 z17.d, z25.d, z15.d
add x3, x0, #0x2c0
zip2 z25.d, z25.d, z15.d
ld1h {z14.h}, p7/z, [x3]
zip1 z15.d, z19.d, z14.d
zip2 z19.d, z19.d, z14.d
zip1 z1.d, z17.d, z15.d
zip2 z0.d, z17.d, z15.d
zip1 z17.d, z25.d, z19.d
revh z21.d, p6/m, z17.d
zip2 z25.d, z25.d, z19.d
revh z17.d, p6/m, z25.d
rev z25.h, z20.h
rev z22.h, z22.h
rev z28.h, z28.h
rev z31.h, z31.h
zip1 z19.d, z28.d, z25.d
zip2 z28.d, z28.d, z25.d
zip1 z25.d, z31.d, z22.d
zip2 z31.d, z31.d, z22.d
zip1 z22.d, z19.d, z25.d
zip1 z10.d, z28.d, z31.d
zip2 z19.d, z19.d, z25.d
revh z10.d, p6/m, z10.d
zip2 z28.d, z28.d, z31.d
revh z28.d, p6/m, z28.d
addvl x3, sp, #0x10
saddlb z31.s, z17.h, z28.h
saddlb z20.s, z1.h, z22.h
add x3, x3, #0x40
add z20.s, z20.s, z31.s
str z1, [x3]
ldr z31, [x3]
addvl x3, sp, #0x14
saddlt z25.s, z21.h, z10.h
add x3, x3, #0x40
str z22, [x3]
ldr z22, [x3]
addvl x3, sp, #0x13
saddlt z15.s, z31.h, z22.h
saddlt z31.s, z17.h, z28.h
add x3, x3, #0x40
str z17, [x3]
add z15.s, z15.s, z31.s
addvl x3, sp, #0x11
saddlb z31.s, z21.h, z10.h
saddlb z17.s, z0.h, z19.h
add x3, x3, #0x40
add z17.s, z17.s, z31.s
str z0, [x3]
ldr z31, [x3]
addvl x3, sp, #0x12
saddlt z31.s, z31.h, z19.h
add x3, x3, #0x40
add z25.s, z31.s, z25.s
str z21, [x3]
revw z17.d, p6/m, z17.d
revw z25.d, p6/m, z25.d
zip1 z31.s, z20.s, z15.s
zip2 z20.s, z20.s, z15.s
zip1 z14.s, z25.s, z17.s
zip2 z25.s, z25.s, z17.s
add z31.s, z31.s, z14.s
add z25.s, z20.s, z25.s
uzp2 z20.d, z31.d, z25.d
revw z20.d, p6/m, z20.d
uzp1 z31.d, z31.d, z25.d
add z25.s, z20.s, z31.s
sub z31.s, z31.s, z20.s
movprfx z15, z25
mul z15.s, p7/m, z15.s, z13.s
addp z15.s, p5/m, z15.s, z15.s
mov z22.d, z8.d
movprfx z17, z8
mul z17.s, p7/m, z17.s, z31.s
addp z17.s, p5/m, z17.s, z17.s
mov z21.d, z7.d
mul z25.s, p7/m, z25.s, z7.s
addp z25.s, p5/m, z25.s, z25.s
mul z31.s, p7/m, z31.s, z4.s
addp z31.s, p5/m, z31.s, z31.s
add x3, x0, #0x300
ld1h {z14.h}, p7/z, [x3]
add x3, x0, #0x340
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z11.h}, p7/z, [x3]
zip1 z8.d, z14.d, z11.d
add x3, x0, #0x3c0
ld1h {z7.h}, p7/z, [x3]
zip2 z14.d, z14.d, z11.d
zip1 z11.d, z20.d, z7.d
zip2 z20.d, z20.d, z7.d
zip1 z1.d, z8.d, z11.d
zip2 z0.d, z8.d, z11.d
zip1 z7.d, z14.d, z20.d
revh z7.d, p6/m, z7.d
zip2 z14.d, z14.d, z20.d
revh z20.d, p6/m, z14.d
rev z12.h, z12.h
rev z23.h, z23.h
mov z14.d, z20.d
rev z29.h, z29.h
rev z27.h, z27.h
zip1 z20.d, z29.d, z12.d
zip2 z29.d, z29.d, z12.d
zip1 z12.d, z27.d, z23.d
zip2 z27.d, z27.d, z23.d
zip1 z23.d, z20.d, z12.d
zip1 z11.d, z29.d, z27.d
zip2 z20.d, z20.d, z12.d
revh z11.d, p6/m, z11.d
zip2 z29.d, z29.d, z27.d
revh z29.d, p6/m, z29.d
addvl x3, sp, #0x15
saddlb z27.s, z14.h, z29.h
saddlb z4.s, z1.h, z23.h
add x3, x3, #0x40
add z4.s, z4.s, z27.s
str z1, [x3]
ldr z27, [x3]
addvl x3, sp, #0x18
saddlb z3.s, z0.h, z20.h
add x3, x3, #0x40
str z23, [x3]
ldr z8, [x3]
addvl x3, sp, #0x17
saddlt z1.s, z27.h, z8.h
saddlt z27.s, z14.h, z29.h
add x3, x3, #0x40
add z1.s, z1.s, z27.s
saddlb z27.s, z7.h, z11.h
str z14, [x3]
addvl x3, sp, #0x16
add z3.s, z3.s, z27.s
add x3, x3, #0x40
saddlt z12.s, z7.h, z11.h
str z0, [x3]
ldr z27, [x3]
saddlt z27.s, z27.h, z20.h
add z12.s, z27.s, z12.s
revw z3.d, p6/m, z3.d
revw z12.d, p6/m, z12.d
zip1 z27.s, z4.s, z1.s
zip2 z4.s, z4.s, z1.s
zip1 z0.s, z12.s, z3.s
zip2 z12.s, z12.s, z3.s
add z27.s, z27.s, z0.s
add z12.s, z4.s, z12.s
uzp2 z4.d, z27.d, z12.d
revw z4.d, p6/m, z4.d
uzp1 z27.d, z27.d, z12.d
add z12.s, z4.s, z27.s
sub z27.s, z27.s, z4.s
mul z13.s, p7/m, z13.s, z12.s
addp z13.s, p5/m, z13.s, z13.s
movprfx z4, z22
mul z4.s, p7/m, z4.s, z27.s
addp z4.s, p5/m, z4.s, z4.s
mul z12.s, p7/m, z12.s, z21.s
addp z12.s, p5/m, z12.s, z12.s
add x3, sp, #0x40
ldr z23, [x3]
mul z27.s, p7/m, z27.s, z23.s
addp z27.s, p5/m, z27.s, z27.s
addvl x3, sp, #0x19
uzp1 z16.s, z16.s, z5.s
uzp1 z15.s, z15.s, z13.s
add x3, x3, #0x40
uzp1 z18.s, z18.s, z6.s
uzp1 z17.s, z17.s, z4.s
uzp1 z24.s, z24.s, z9.s
uzp1 z25.s, z25.s, z12.s
uzp1 z30.s, z30.s, z26.s
uzp1 z31.s, z31.s, z27.s
rshrnb z16.h, z16.s, #0xb
rshrnb z15.h, z15.s, #0xb
uzp1 z16.h, z16.h, z16.h
uzp1 z15.h, z15.h, z15.h
rshrnb z18.h, z18.s, #0xb
rshrnb z17.h, z17.s, #0xb
uzp1 z18.h, z18.h, z18.h
uzp1 z17.h, z17.h, z17.h
rshrnb z24.h, z24.s, #0xb
rshrnb z25.h, z25.s, #0xb
uzp1 z24.h, z24.h, z24.h
uzp1 z25.h, z25.h, z25.h
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z30.h, z30.h, z30.h
uzp1 z31.h, z31.h, z31.h
stp q16, q15, [x1]
stp q18, q17, [x1, #0x200]
str q24, [x1, #0x400]
str q25, [x1, #0x410]
str q30, [x1, #0x600]
str q31, [x1, #0x610]
str z2, [x3]
ldr z4, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z31, [x3]
sub z18.h, z4.h, z31.h
addvl x3, sp, #1
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z31, [x3]
sub z24.h, z4.h, z31.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z31, [x3]
sub z31.h, z14.h, z31.h
revh z17.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z15.h, z30.h
revh z16.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z27, [x3]
sub z5.h, z4.h, z27.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z27, [x3]
sub z6.h, z4.h, z27.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z27, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z27.h, z3.h
revh z4.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
sub z31.h, z26.h, z23.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z9, [x3]
sub z0.h, z13.h, z9.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z13, [x3]
sub z1.h, z13.h, z19.h
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z22, [x3]
sub z31.h, z22.h, z10.h
revh z8.d, p6/m, z31.d
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z12, [x3]
sub z31.h, z12.h, z28.h
revh z14.d, p6/m, z31.d
addvl x3, sp, #0x15
sub z31.h, z7.h, z11.h
add x3, x3, #0x40
ldr z21, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z13, [x3]
sub z22.h, z21.h, z13.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z21, [x3]
sub z21.h, z21.h, z20.h
revh z23.d, p6/m, z31.d
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z13, [x3]
sub z31.h, z13.h, z29.h
revh z2.d, p6/m, z31.d
addvl x3, sp, #0x1c
movi d31, #0000000000000000
ld1h {z15.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z13, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z13.h[0]
addvl x3, sp, #0x1d
movprfx z25, z31
sdot z25.d, z6.h, z13.h[0]
movprfx z27, z31
sdot z27.d, z1.h, z13.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z26, z31
sdot z26.d, z21.h, z13.h[0]
addvl x3, sp, #0x1e
sdot z30.d, z18.h, z15.h[0]
sdot z25.d, z5.h, z15.h[0]
add x3, x3, #0x40
ldr z9, [x3]
sdot z30.d, z17.h, z12.h[0]
add x3, x1, #0x40
sdot z30.d, z16.h, z9.h[0]
sdot z25.d, z4.h, z12.h[0]
sdot z27.d, z0.h, z15.h[0]
sdot z25.d, z3.h, z9.h[0]
sdot z27.d, z8.h, z12.h[0]
sdot z26.d, z22.h, z15.h[0]
sdot z27.d, z14.h, z9.h[0]
sdot z26.d, z23.h, z12.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z2.h, z9.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z24.h, z13.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z13.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z13.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z13.h[1]
sdot z30.d, z18.h, z15.h[1]
sdot z25.d, z5.h, z15.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z4.h, z12.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z25.d, z3.h, z9.h[1]
sdot z27.d, z0.h, z15.h[1]
sdot z26.d, z22.h, z15.h[1]
sdot z27.d, z8.h, z12.h[1]
sdot z26.d, z23.h, z12.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z26.d, z2.h, z9.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
cntb x3
cntb x6
add z11.h, z7.h, z11.h
lsl x3, x3, #5
lsl x6, x6, #5
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z15.h[0]
addvl x3, sp, #0x1f
movprfx z25, z31
sdot z25.d, z6.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z1.h, z15.h[0]
add x3, x3, #0x40
ldr z13, [x3]
movprfx z26, z31
sdot z26.d, z21.h, z15.h[0]
addvl x3, x6, #1
sdot z30.d, z18.h, z13.h[0]
sdot z25.d, z5.h, z13.h[0]
add x3, x3, #0x40
sdot z27.d, z0.h, z13.h[0]
sdot z26.d, z22.h, z13.h[0]
add x3, sp, x3
ldr z12, [x3]
sdot z30.d, z17.h, z12.h[0]
rdvl x3, #0x11
sdot z25.d, z4.h, z12.h[0]
sdot z27.d, z8.h, z12.h[0]
lsl x3, x3, #1
sdot z26.d, z23.h, z12.h[0]
rdvl x6, #0x11
add x3, sp, x3
lsl x6, x6, #1
add x3, x3, #0x40
ldr z9, [x3]
sdot z25.d, z3.h, z9.h[0]
add x3, x1, #0x140
sdot z26.d, z2.h, z9.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z27.d, z14.h, z9.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z24.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z15.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z15.h[1]
sdot z30.d, z18.h, z13.h[1]
sdot z25.d, z5.h, z13.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z4.h, z12.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z25.d, z3.h, z9.h[1]
sdot z27.d, z0.h, z13.h[1]
sdot z26.d, z22.h, z13.h[1]
sdot z27.d, z8.h, z12.h[1]
sdot z26.d, z23.h, z12.h[1]
sdot z27.d, z14.h, z9.h[1]
sdot z26.d, z2.h, z9.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xc0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x2c0
ld1h {z13.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x2, #0x3c0
ld1h {z15.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
add x3, x1, #0x240
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x2e0
ld1h {z13.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x2, #0x3e0
ld1h {z15.h}, p7/z, [x3]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
add x3, x1, #0x340
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z12.h[0]
add x3, x2, #0x400
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z12.h[0]
addvl x3, x6, #1
movprfx z27, z31
sdot z27.d, z1.h, z12.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z12.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z9, [x3]
sdot z30.d, z18.h, z9.h[0]
add x3, x1, #0x440
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z5.h, z9.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z27.d, z0.h, z9.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z22.h, z9.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z23.h, z13.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z26.d, z2.h, z15.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z27.s, z27.s, z26.s
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z24.h, z12.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z12.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z12.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z12.h[1]
sdot z30.d, z18.h, z9.h[1]
sdot z25.d, z5.h, z9.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z9.h[1]
sdot z26.d, z22.h, z9.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x420
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x1, #0x540
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x440
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x1, #0x640
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z9.h[0]
add x3, x2, #0x460
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[0]
add x3, x1, #0x740
movprfx z27, z31
sdot z27.d, z1.h, z9.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z5.h, z12.h[0]
sdot z30.d, z17.h, z13.h[0]
sdot z25.d, z4.h, z13.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z3.h, z15.h[0]
sdot z27.d, z0.h, z12.h[0]
sdot z26.d, z22.h, z12.h[0]
sdot z27.d, z8.h, z13.h[0]
sdot z26.d, z23.h, z13.h[0]
sdot z27.d, z14.h, z15.h[0]
sdot z26.d, z2.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z24.h, z9.h[1]
movprfx z25, z31
sdot z25.d, z6.h, z9.h[1]
movprfx z27, z31
sdot z27.d, z1.h, z9.h[1]
movprfx z26, z31
sdot z26.d, z21.h, z9.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z5.h, z12.h[1]
sdot z30.d, z17.h, z13.h[1]
sdot z25.d, z4.h, z13.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z3.h, z15.h[1]
sdot z27.d, z0.h, z12.h[1]
sdot z26.d, z22.h, z12.h[1]
sdot z27.d, z8.h, z13.h[1]
sdot z26.d, z23.h, z13.h[1]
sdot z27.d, z14.h, z15.h[1]
sdot z26.d, z2.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z27.s, z27.s, z26.s
rshrnb z30.h, z30.s, #0xb
rshrnb z27.h, z27.s, #0xb
uzp1 z30.h, z30.h, z27.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z4, [x3]
add z30.h, z16.h, z4.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z16, [x3]
add z27.h, z18.h, z16.h
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
add z18.h, z15.h, z24.h
addvl x3, sp, #0xc
sub z26.h, z30.h, z18.h
sub z24.h, z27.h, z25.h
add x3, x3, #0x40
ldr z21, [x3]
add z30.h, z30.h, z18.h
addvl x3, sp, #8
add z27.h, z27.h, z25.h
add x3, x3, #0x40
ldr z16, [x3]
add z21.h, z21.h, z16.h
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
ldr z15, [x3]
add z17.h, z16.h, z15.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z6, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z3, [x3]
add z15.h, z6.h, z3.h
addvl x3, sp, #0xb
sub z13.h, z17.h, z15.h
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z23, [x3]
add z12.h, z5.h, z23.h
addvl x3, sp, #0x14
sub z16.h, z21.h, z12.h
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z9, [x3]
add z22.h, z14.h, z9.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z14, [x3]
add z19.h, z19.h, z14.h
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z23, [x3]
add z10.h, z23.h, z10.h
addvl x3, sp, #0x13
sub z6.h, z19.h, z10.h
add x3, x3, #0x40
ldr z23, [x3]
add z28.h, z23.h, z28.h
addvl x3, sp, #0x18
sub z9.h, z22.h, z28.h
add x3, x3, #0x40
ldr z23, [x3]
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z14, [x3]
add z23.h, z23.h, z14.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z14, [x3]
add z20.h, z20.h, z14.h
addvl x3, sp, #0x17
sub z7.h, z20.h, z11.h
add x3, x3, #0x40
ldr z14, [x3]
add z29.h, z14.h, z29.h
add x3, x2, #0x480
ld1h {z5.h}, p7/z, [x3]
sub z8.h, z23.h, z29.h
add x3, x2, #0x500
ld1h {z4.h}, p7/z, [x3]
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
add x3, x1, #0x80
sdot z14.d, z26.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z16.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z14.s, z14.s, z1.s
sdot z2.d, z8.h, z5.h[0]
rshrnb z14.h, z14.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x1, #0x180
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[1]
sdot z14.d, z26.h, z5.h[1]
sdot z1.d, z16.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z8.h, z5.h[1]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
sdot z14.d, z26.h, z5.h[0]
sdot z1.d, z16.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z8.h, z5.h[0]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x1, #0x380
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[1]
sdot z14.d, z26.h, z5.h[1]
sdot z1.d, z16.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z8.h, z5.h[1]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z4.h}, p7/z, [x3]
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
add x3, x1, #0x480
sdot z14.d, z26.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z16.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z14.s, z14.s, z1.s
sdot z2.d, z8.h, z5.h[0]
rshrnb z14.h, z14.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x1, #0x580
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[1]
sdot z14.d, z26.h, z5.h[1]
sdot z1.d, z16.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z8.h, z5.h[1]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z14, z31
sdot z14.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z13.h, z4.h[0]
sdot z14.d, z26.h, z5.h[0]
sdot z1.d, z16.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z8.h, z5.h[0]
uzp1 z14.s, z14.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z14.h, z14.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z14.h, z14.h, z3.h
st1h {z14.h}, p7, [x3]
movprfx z14, z31
sdot z14.d, z24.h, z4.h[1]
add x3, x1, #0x780
sdot z14.d, z26.h, z5.h[1]
movprfx z24, z31
sdot z24.d, z6.h, z4.h[1]
movprfx z26, z31
sdot z26.d, z13.h, z4.h[1]
sdot z24.d, z9.h, z5.h[1]
sdot z26.d, z16.h, z5.h[1]
movprfx z16, z31
sdot z16.d, z7.h, z4.h[1]
uzp1 z14.s, z14.s, z26.s
sdot z16.d, z8.h, z5.h[1]
rshrnb z14.h, z14.s, #0xb
uzp1 z24.s, z24.s, z16.s
rshrnb z24.h, z24.s, #0xb
uzp1 z14.h, z14.h, z24.h
st1h {z14.h}, p7, [x3]
revh z27.d, p6/m, z27.d
sub z30.h, z30.h, z27.h
add z21.h, z21.h, z12.h
add z17.h, z17.h, z15.h
revh z17.d, p6/m, z17.d
sub z21.h, z21.h, z17.h
add z22.h, z22.h, z28.h
add z19.h, z19.h, z10.h
revh z19.d, p6/m, z19.d
sub z22.h, z22.h, z19.h
add z23.h, z23.h, z29.h
add z20.h, z20.h, z11.h
revh z20.d, p6/m, z20.d
add x3, x2, #0x580
ld1h {z15.h}, p7/z, [x3]
sub z23.h, z23.h, z20.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z21.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z23.h, z15.h[0]
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
sdot z26.d, z21.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z23.h, z15.h[1]
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
sdot z26.d, z21.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z22.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z23.h, z15.h[0]
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
sdot z30.d, z21.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z23.h, z15.h[1]
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
