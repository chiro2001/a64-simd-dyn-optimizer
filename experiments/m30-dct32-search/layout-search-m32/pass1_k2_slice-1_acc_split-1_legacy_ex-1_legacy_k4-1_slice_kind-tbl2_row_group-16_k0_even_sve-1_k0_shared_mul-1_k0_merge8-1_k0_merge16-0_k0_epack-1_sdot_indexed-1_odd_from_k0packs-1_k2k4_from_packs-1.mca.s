.arch armv8.2-a+sve2
.text
sub sp, sp, #0x820
stp x29, x30, [sp]
mov x29, sp
str x19, [sp, #0x10]
mov x19, x1
add x1, sp, #0x20
addvl sp, sp, #0xffffffffffffffe1
adrp x3, #0x457000
ptrue p7.b
sub sp, sp, #0x70
add x3, x3, #0xdb0
add x11, x3, #0x40
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
ld1w {z0.s}, p7/z, [x3]
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
add x11, x3, #0x80
ld1w {z31.s}, p7/z, [x11]
addvl x11, sp, #3
add x5, x2, x5, lsl #2
add x11, x11, #0x70
str z31, [x11]
lsl x4, x2, #5
add x11, x3, #0xa0
ld1h {z31.h}, p7/z, [x11]
add x19, x0, x2, lsl #1
addvl x11, sp, #0x1b
add x30, x0, x2, lsl #2
add x11, x11, #0x70
str z31, [x11]
add x2, x0, x2, lsl #3
add x11, x3, #0x1a0
ld1h {z31.h}, p7/z, [x11]
add x14, x0, x9, lsl #1
addvl x11, sp, #0x1c
add x10, x0, x10, lsl #1
add x11, x11, #0x70
str z31, [x11]
add x7, x0, x7, lsl #1
add x11, x3, #0x2a0
ld1h {z31.h}, p7/z, [x11]
add x5, x0, x5, lsl #1
addvl x11, sp, #0x1d
add x9, x0, x9, lsl #2
add x11, x11, #0x70
str z31, [x11]
add x8, x0, x8, lsl #1
add x11, x3, #0x3a0
ld1h {z31.h}, p7/z, [x11]
add x20, x1, #0x40
addvl x11, sp, #0x1e
add x18, x18, x2
add x11, x11, #0x70
str z31, [x11]
add x21, x3, #0x20
add x11, x3, #0xc0
ld1h {z12.h}, p7/z, [x11]
mov x6, #0
add x11, x3, #0x1c0
ld1h {z13.h}, p7/z, [x11]
mov z5.d, z12.d
add x11, x3, #0x2c0
ld1h {z11.h}, p7/z, [x11]
mov z8.d, z13.d
add x11, x3, #0x3c0
mov z4.d, z11.d
ld1h {z9.h}, p7/z, [x11]
add x11, x3, #0xe0
mov z3.d, z9.d
ld1h {z10.h}, p7/z, [x11]
mov z2.d, z10.d
add x11, x0, x6
ld1h {z31.h}, p7/z, [x11]
ld1h {z11.h}, p7/z, [x17]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x19, x6
ld1h {z27.h}, p7/z, [x11]
sub z19.h, z31.h, z30.h
add x11, x11, #0x20
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x30, x6
rev z30.h, z30.h
ld1h {z1.h}, p7/z, [x11]
add x11, x11, #0x20
sub z18.h, z27.h, z30.h
add z27.h, z27.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x11
rev z30.h, z30.h
add x11, x11, #0x70
sub z24.h, z1.h, z30.h
str z24, [x11]
add x11, x17, #0x20
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x12
rev z30.h, z30.h
sub z15.h, z11.h, z30.h
add x11, x11, #0x70
str z15, [x11]
add z11.h, z11.h, z30.h
add x11, x2, x6
ld1h {z28.h}, p7/z, [x11]
ld1h {z24.h}, p7/z, [x16]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x16, #0x20
sub z21.h, z28.h, z30.h
add z28.h, z28.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x15, #0x20
rev z30.h, z30.h
sub z20.h, z24.h, z30.h
add z24.h, z24.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
ld1h {z12.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z29.h, z12.h, z30.h
str z29, [x11]
add x11, x14, #0x20
add z12.h, z12.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x14
ld1h {z13.h}, p7/z, [x14]
rev z30.h, z30.h
add x11, x11, #0x70
sub z14.h, z13.h, z30.h
str z14, [x11]
add x11, x18, x6
ld1h {z29.h}, p7/z, [x11]
add z13.h, z13.h, z30.h
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x15
sub z26.h, z29.h, z30.h
add z29.h, z29.h, z30.h
add x11, x11, #0x70
str z26, [x11]
ld1h {z25.h}, p7/z, [x10]
add x11, x10, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x16
sub z23.h, z25.h, z30.h
add z25.h, z25.h, z30.h
add x11, x11, #0x70
str z23, [x11]
ld1h {z14.h}, p7/z, [x13]
add x11, x13, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x7, #0x20
sub z6.h, z14.h, z30.h
add z14.h, z14.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x12, #0x20
rev z30.h, z30.h
ld1h {z26.h}, p7/z, [x11]
add x11, x5, #0x20
rev z26.h, z26.h
ld1h {z15.h}, p7/z, [x7]
sub z7.h, z15.h, z30.h
add z15.h, z15.h, z30.h
ld1h {z30.h}, p7/z, [x12]
sub z23.h, z30.h, z26.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x17
add x11, x11, #0x70
rev z17.h, z17.h
sub z22.h, z26.h, z17.h
str z22, [x11]
add x11, x9, #0x20
add z26.h, z26.h, z17.h
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x18
ld1h {z16.h}, p7/z, [x9]
rev z17.h, z17.h
add x11, x11, #0x70
sub z10.h, z16.h, z17.h
str z10, [x11]
add x11, x8, #0x20
ld1h {z10.h}, p7/z, [x11]
rev z10.h, z10.h
addvl x11, sp, #2
add z16.h, z16.h, z17.h
ld1h {z17.h}, p7/z, [x8]
sub z9.h, z17.h, z10.h
add z17.h, z17.h, z10.h
zip1 z10.d, z31.d, z1.d
zip2 z31.d, z31.d, z1.d
zip1 z1.d, z27.d, z11.d
zip2 z27.d, z27.d, z11.d
zip1 z11.d, z10.d, z1.d
add x11, x11, #0x70
zip2 z10.d, z10.d, z1.d
ptrue p6.d
str z11, [x11]
zip1 z11.d, z31.d, z27.d
revh z1.d, p6/m, z11.d
zip2 z31.d, z31.d, z27.d
revh z27.d, p6/m, z31.d
ldr z11, [x11]
mov z31.d, z1.d
ldr z1, [x11]
addvl x11, sp, #0xa
saddlb z11.s, z11.h, z27.h
saddlt z1.s, z1.h, z27.h
add x11, x11, #0x70
str z27, [x11]
mov z27.d, z10.d
addvl x11, sp, #8
saddlb z10.s, z10.h, z31.h
add x11, x11, #0x70
str z27, [x11]
ldr z27, [x11]
addvl x11, sp, #9
saddlt z27.s, z27.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z10.d, p6/m, z10.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z11.s, z1.s
zip2 z11.s, z11.s, z1.s
zip1 z22.s, z27.s, z10.s
zip2 z27.s, z27.s, z10.s
add z31.s, z31.s, z22.s
add z27.s, z11.s, z27.s
uzp2 z11.d, z31.d, z27.d
revw z11.d, p6/m, z11.d
addvl x11, sp, #0x19
uzp1 z31.d, z31.d, z27.d
ld1w {z10.s}, p7/z, [x21]
add x11, x11, #0x70
add z27.s, z11.s, z31.s
sub z31.s, z31.s, z11.s
mul z27.s, p7/m, z27.s, z10.s
uzp1 z11.s, z27.s, z27.s
uzp2 z27.s, z27.s, z27.s
add z22.s, z11.s, z27.s
sub z11.s, z11.s, z27.s
str z11, [x11]
addvl x11, sp, #1
ptrue p5.s
add x11, x11, #0x70
ldr z11, [x11]
mul z11.s, p7/m, z11.s, z31.s
addp z11.s, p5/m, z11.s, z11.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z1, [x11]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z27.d, z28.d, z12.d
zip2 z28.d, z28.d, z12.d
zip1 z12.d, z24.d, z13.d
zip2 z24.d, z24.d, z13.d
zip2 z1.d, z27.d, z12.d
zip1 z13.d, z27.d, z12.d
zip1 z27.d, z28.d, z24.d
revh z12.d, p6/m, z27.d
mov z27.d, z12.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
addvl x11, sp, #0xb
mov z28.d, z13.d
mov z13.d, z24.d
add x11, x11, #0x70
saddlb z24.s, z28.h, z24.h
str z28, [x11]
ldr z28, [x11]
addvl x11, sp, #0xe
saddlt z12.s, z28.h, z13.h
add x11, x11, #0x70
str z13, [x11]
saddlb z13.s, z1.h, z27.h
addvl x11, sp, #0xc
add x11, x11, #0x70
str z1, [x11]
ldr z1, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
str z27, [x11]
saddlt z27.s, z1.h, z27.h
revw z13.d, p6/m, z13.d
revw z27.d, p6/m, z27.d
zip1 z28.s, z24.s, z12.s
zip2 z24.s, z24.s, z12.s
zip1 z1.s, z27.s, z13.s
zip2 z27.s, z27.s, z13.s
add z28.s, z28.s, z1.s
add z27.s, z24.s, z27.s
uzp2 z24.d, z28.d, z27.d
revw z24.d, p6/m, z24.d
addvl x11, sp, #0x1a
uzp1 z28.d, z28.d, z27.d
add z27.s, z24.s, z28.s
add x11, x11, #0x70
mul z27.s, p7/m, z27.s, z10.s
uzp1 z13.s, z27.s, z27.s
uzp2 z27.s, z27.s, z27.s
sub z12.s, z13.s, z27.s
str z12, [x11]
addvl x11, sp, #1
sub z28.s, z28.s, z24.s
add z24.s, z13.s, z27.s
add x11, x11, #0x70
ldr z1, [x11]
movprfx z27, z1
mul z27.s, p7/m, z27.s, z28.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z12, [x11]
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z13.d, z29.d, z14.d
zip2 z29.d, z29.d, z14.d
zip1 z14.d, z25.d, z15.d
zip2 z25.d, z25.d, z15.d
zip1 z12.d, z13.d, z14.d
zip1 z15.d, z29.d, z25.d
zip2 z14.d, z13.d, z14.d
revh z15.d, p6/m, z15.d
add x11, sp, #0x70
zip2 z29.d, z29.d, z25.d
str z15, [x11]
revh z25.d, p6/m, z29.d
addvl x11, sp, #0xf
saddlb z15.s, z12.h, z25.h
add x11, x11, #0x70
str z12, [x11]
ldr z29, [x11]
addvl x11, sp, #4
saddlt z13.s, z29.h, z25.h
add x11, x11, #0x70
str z25, [x11]
mov z25.d, z14.d
add x11, sp, #0x70
ldr z29, [x11]
saddlb z14.s, z14.h, z29.h
addvl x11, sp, #0x10
add x11, x11, #0x70
str z25, [x11]
ldr z25, [x11]
saddlt z25.s, z25.h, z29.h
revw z14.d, p6/m, z14.d
revw z25.d, p6/m, z25.d
zip1 z29.s, z15.s, z13.s
zip2 z15.s, z15.s, z13.s
zip1 z12.s, z25.s, z14.s
zip2 z25.s, z25.s, z14.s
add z29.s, z29.s, z12.s
add z25.s, z15.s, z25.s
uzp2 z15.d, z29.d, z25.d
revw z15.d, p6/m, z15.d
uzp1 z29.d, z29.d, z25.d
add z25.s, z15.s, z29.s
sub z29.s, z29.s, z15.s
mul z25.s, p7/m, z25.s, z10.s
uzp1 z15.s, z25.s, z25.s
uzp2 z25.s, z25.s, z25.s
add z14.s, z15.s, z25.s
sub z15.s, z15.s, z25.s
movprfx z25, z1
mul z25.s, p7/m, z25.s, z29.s
addp z25.s, p5/m, z25.s, z25.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z12, [x11]
mul z29.s, p7/m, z29.s, z12.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z13.d, z30.d, z16.d
zip2 z30.d, z30.d, z16.d
zip1 z16.d, z26.d, z17.d
zip2 z26.d, z26.d, z17.d
zip1 z12.d, z13.d, z16.d
zip2 z1.d, z13.d, z16.d
zip1 z17.d, z30.d, z26.d
revh z16.d, p6/m, z17.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
addvl x11, sp, #5
saddlb z17.s, z12.h, z30.h
add x11, x11, #0x70
str z12, [x11]
ldr z26, [x11]
addvl x11, sp, #7
saddlt z13.s, z26.h, z30.h
add x11, x11, #0x70
str z30, [x11]
mov z30.d, z16.d
addvl x11, sp, #6
saddlb z16.s, z1.h, z16.h
saddlt z26.s, z1.h, z30.h
add x11, x11, #0x70
str z30, [x11]
revw z16.d, p6/m, z16.d
revw z26.d, p6/m, z26.d
zip1 z30.s, z17.s, z13.s
zip2 z17.s, z17.s, z13.s
zip1 z12.s, z26.s, z16.s
zip2 z26.s, z26.s, z16.s
add z30.s, z30.s, z12.s
add z26.s, z17.s, z26.s
uzp2 z17.d, z30.d, z26.d
revw z17.d, p6/m, z17.d
addvl x11, sp, #1
uzp1 z30.d, z30.d, z26.d
add z26.s, z17.s, z30.s
mul z26.s, p7/m, z26.s, z10.s
uzp1 z13.s, z26.s, z26.s
uzp2 z26.s, z26.s, z26.s
add x11, x11, #0x70
add z12.s, z13.s, z26.s
sub z30.s, z30.s, z17.s
sub z13.s, z13.s, z26.s
ldr z26, [x11]
mul z26.s, p7/m, z26.s, z30.s
addp z26.s, p5/m, z26.s, z26.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z10, [x11]
mul z30.s, p7/m, z30.s, z10.s
addp z30.s, p5/m, z30.s, z30.s
mov z17.d, z24.d
addvl x11, sp, #0x19
mov z16.d, z22.d
tbl z16.s, {z16.s, z17.s}, z0.s
rshrnb z16.h, z16.s, #4
mov z17.d, z12.d
uzp1 z10.h, z16.h, z16.h
add x11, x11, #0x70
mov z16.d, z14.d
tbl z24.s, {z16.s, z17.s}, z0.s
uzp1 z17.s, z27.s, z27.s
uzp1 z16.s, z11.s, z11.s
rshrnb z24.h, z24.s, #4
tbl z16.s, {z16.s, z17.s}, z0.s
uzp1 z11.s, z26.s, z26.s
uzp1 z24.h, z24.h, z24.h
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
stp q10, q24, [x1]
uzp1 z10.s, z25.s, z25.s
tbl z10.s, {z10.s, z11.s}, z0.s
rshrnb z10.h, z10.s, #4
uzp1 z10.h, z10.h, z10.h
stp q16, q10, [x1, #0x200]
ldr z26, [x11]
addvl x11, sp, #0x1a
add x11, x11, #0x70
ldr z27, [x11]
tbl z26.s, {z26.s, z27.s}, z0.s
addvl x11, sp, #0x11
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
add x11, x11, #0x70
ldr z24, [x11]
mov z27.d, z13.d
addvl x11, sp, #0x12
str q26, [x1, #0x400]
mov z26.d, z15.d
add x11, x11, #0x70
ldr z15, [x11]
tbl z26.s, {z26.s, z27.s}, z0.s
addvl x11, sp, #0x13
uzp1 z27.s, z28.s, z28.s
rshrnb z26.h, z26.s, #4
add x11, x11, #0x70
uzp1 z26.h, z26.h, z26.h
zip1 z28.d, z18.d, z15.d
str q26, [x1, #0x410]
uzp1 z26.s, z31.s, z31.s
tbl z26.s, {z26.s, z27.s}, z0.s
uzp1 z27.s, z30.s, z30.s
trn2 z30.d, z18.d, z15.d
trn1 z18.d, z18.d, z15.d
ldr z15, [x11]
addvl x11, sp, #0x14
rshrnb z26.h, z26.s, #4
add x11, x11, #0x70
ldr z14, [x11]
uzp1 z26.h, z26.h, z26.h
addvl x11, sp, #0x15
trn2 z31.d, z19.d, z24.d
str q26, [x1, #0x600]
add x11, x11, #0x70
uzp1 z26.s, z29.s, z29.s
zip1 z29.d, z19.d, z24.d
tbl z26.s, {z26.s, z27.s}, z0.s
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
zip1 z27.d, z31.d, z30.d
trn1 z19.d, z19.d, z24.d
zip2 z24.d, z31.d, z30.d
trn2 z31.d, z21.d, z15.d
str q26, [x1, #0x610]
zip1 z26.d, z29.d, z28.d
zip1 z29.d, z21.d, z15.d
trn1 z21.d, z21.d, z15.d
ldr z15, [x11]
addvl x11, sp, #0x16
trn2 z30.d, z20.d, z14.d
zip1 z28.d, z20.d, z14.d
add x11, x11, #0x70
trn1 z20.d, z20.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x18
zip2 z25.d, z19.d, z18.d
zip1 z18.d, z29.d, z28.d
add x11, x11, #0x70
zip1 z29.d, z15.d, z6.d
zip1 z19.d, z31.d, z30.d
zip2 z21.d, z21.d, z20.d
zip1 z28.d, z14.d, z7.d
zip2 z20.d, z31.d, z30.d
zip1 z16.d, z29.d, z28.d
trn2 z31.d, z15.d, z6.d
trn1 z29.d, z15.d, z6.d
ldr z15, [x11]
addvl x11, sp, #0x17
trn2 z30.d, z14.d, z7.d
add x11, x11, #0x70
trn1 z28.d, z14.d, z7.d
ldr z14, [x11]
addvl x11, sp, #0x1c
zip1 z17.d, z31.d, z30.d
zip2 z11.d, z29.d, z28.d
add x11, x11, #0x70
zip2 z10.d, z31.d, z30.d
zip1 z29.d, z23.d, z15.d
trn2 z31.d, z23.d, z15.d
trn1 z23.d, z23.d, z15.d
ldr z15, [x11]
addvl x11, sp, #0x1b
trn2 z30.d, z14.d, z9.d
zip1 z28.d, z14.d, z9.d
add x11, x11, #0x70
trn1 z22.d, z14.d, z9.d
ldr z14, [x11]
addvl x11, sp, #0x1d
zip1 z6.d, z29.d, z28.d
zip1 z7.d, z31.d, z30.d
add x11, x11, #0x70
ldr z13, [x11]
zip2 z9.d, z31.d, z30.d
addvl x11, sp, #0x1e
movi d31, #0000000000000000
zip2 z22.d, z23.d, z22.d
add x11, x11, #0x70
ldr z12, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z15.h[0]
add x11, x1, #0x40
movprfx z23, z31
sdot z23.d, z19.h, z15.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z15.h[0]
sdot z30.d, z26.h, z14.h[0]
sdot z23.d, z18.h, z14.h[0]
sdot z30.d, z25.h, z13.h[0]
sdot z23.d, z21.h, z13.h[0]
sdot z30.d, z24.h, z12.h[0]
sdot z23.d, z20.h, z12.h[0]
sdot z29.d, z16.h, z14.h[0]
sdot z28.d, z6.h, z14.h[0]
sdot z29.d, z11.h, z13.h[0]
sdot z28.d, z22.h, z13.h[0]
sdot z29.d, z10.h, z12.h[0]
sdot z28.d, z9.h, z12.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z15.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z15.h[1]
sdot z30.d, z26.h, z14.h[1]
sdot z23.d, z18.h, z14.h[1]
sdot z30.d, z25.h, z13.h[1]
sdot z23.d, z21.h, z13.h[1]
sdot z30.d, z24.h, z12.h[1]
sdot z23.d, z20.h, z12.h[1]
sdot z29.d, z16.h, z14.h[1]
sdot z28.d, z6.h, z14.h[1]
sdot z29.d, z11.h, z13.h[1]
sdot z28.d, z22.h, z13.h[1]
sdot z29.d, z10.h, z12.h[1]
sdot z28.d, z9.h, z12.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x140
movprfx z30, z31
sdot z30.d, z27.h, z8.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z8.h[0]
sdot z30.d, z26.h, z5.h[0]
sdot z23.d, z18.h, z5.h[0]
sdot z30.d, z25.h, z4.h[0]
sdot z23.d, z21.h, z4.h[0]
sdot z30.d, z24.h, z3.h[0]
sdot z23.d, z20.h, z3.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z8.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[0]
sdot z29.d, z16.h, z5.h[0]
sdot z28.d, z6.h, z5.h[0]
sdot z29.d, z11.h, z4.h[0]
sdot z28.d, z22.h, z4.h[0]
sdot z29.d, z10.h, z3.h[0]
sdot z28.d, z9.h, z3.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z27.h, z8.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z8.h[1]
sdot z30.d, z26.h, z5.h[1]
sdot z23.d, z18.h, z5.h[1]
sdot z30.d, z25.h, z4.h[1]
sdot z23.d, z21.h, z4.h[1]
sdot z30.d, z24.h, z3.h[1]
sdot z23.d, z20.h, z3.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z8.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[1]
sdot z29.d, z16.h, z5.h[1]
sdot z28.d, z6.h, z5.h[1]
sdot z29.d, z11.h, z4.h[1]
sdot z28.d, z22.h, z4.h[1]
sdot z29.d, z10.h, z3.h[1]
sdot z28.d, z9.h, z3.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x1e0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x2e0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x3, #0x3e0
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
add x11, x1, #0x240
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[0]
sdot z30.d, z26.h, z2.h[0]
sdot z23.d, z18.h, z2.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z28.d, z6.h, z2.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z27.h, z13.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[1]
sdot z30.d, z26.h, z2.h[1]
sdot z23.d, z18.h, z2.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z28.d, z6.h, z2.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x100
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x200
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x300
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x400
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x120
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x220
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x440
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x140
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x240
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x540
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x160
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x260
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x640
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x180
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x280
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x380
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x480
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x740
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z19.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z17.h, z12.h[1]
movprfx z27, z31
sdot z27.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z29.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z29.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z29.d, z20.h, z15.h[1]
sdot z28.d, z16.h, z13.h[1]
sdot z27.d, z6.h, z13.h[1]
sdot z28.d, z11.h, z14.h[1]
sdot z27.d, z22.h, z14.h[1]
sdot z28.d, z10.h, z15.h[1]
sdot z27.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
uzp1 z28.s, z28.s, z27.s
rshrnb z30.h, z30.s, #4
rshrnb z28.h, z28.s, #4
uzp1 z30.h, z30.h, z28.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #2
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
ldr z28, [x11]
sub z27.h, z7.h, z28.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z6, [x11]
add x11, sp, #0x70
ldr z30, [x11]
sub z26.h, z6.h, z30.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z20, [x11]
addvl x11, sp, #7
add x11, x11, #0x70
ldr z21, [x11]
sub z29.h, z20.h, z21.h
addvl x11, sp, #6
add x11, x11, #0x70
ldr z21, [x11]
sub z28.h, z1.h, z21.h
add x11, x3, #0x4a0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x520
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
add x11, x3, #0x4c0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x540
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
add x11, x3, #0x4e0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x560
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
add x11, x3, #0x500
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x580
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
ldr z25, [x11]
add z29.h, z25.h, z7.h
add x11, sp, #0x70
ldr z30, [x11]
add z30.h, z30.h, z6.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #7
sub z29.h, z29.h, z30.h
add x11, x11, #0x70
ldr z25, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z26, [x11]
add z30.h, z25.h, z26.h
addvl x11, sp, #6
add x11, x11, #0x70
ldr z21, [x11]
add z26.h, z21.h, z1.h
revh z26.d, p6/m, z26.d
add x11, x3, #0x5a0
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
add x11, x3, #0x5c0
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
ld1h {z11.h}, p7/z, [x17]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x19, x6
ld1h {z27.h}, p7/z, [x11]
sub z19.h, z31.h, z30.h
add x11, x11, #0x20
add z31.h, z31.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x30, x6
rev z30.h, z30.h
ld1h {z1.h}, p7/z, [x11]
add x11, x11, #0x20
sub z18.h, z27.h, z30.h
add z27.h, z27.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x11
rev z30.h, z30.h
add x11, x11, #0x70
sub z24.h, z1.h, z30.h
str z24, [x11]
add x11, x17, #0x20
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x12
rev z30.h, z30.h
sub z15.h, z11.h, z30.h
add x11, x11, #0x70
str z15, [x11]
add z11.h, z11.h, z30.h
add x11, x2, x6
ld1h {z28.h}, p7/z, [x11]
ld1h {z24.h}, p7/z, [x16]
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x16, #0x20
sub z21.h, z28.h, z30.h
add z28.h, z28.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x15, #0x20
rev z30.h, z30.h
sub z20.h, z24.h, z30.h
add z24.h, z24.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
ld1h {z12.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z29.h, z12.h, z30.h
str z29, [x11]
add x11, x14, #0x20
add z12.h, z12.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x14
ld1h {z13.h}, p7/z, [x14]
rev z30.h, z30.h
add x11, x11, #0x70
sub z14.h, z13.h, z30.h
str z14, [x11]
add x11, x18, x6
ld1h {z29.h}, p7/z, [x11]
add z13.h, z13.h, z30.h
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x15
sub z26.h, z29.h, z30.h
add z29.h, z29.h, z30.h
add x11, x11, #0x70
str z26, [x11]
ld1h {z25.h}, p7/z, [x10]
add x11, x10, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x16
sub z23.h, z25.h, z30.h
add z25.h, z25.h, z30.h
add x11, x11, #0x70
str z23, [x11]
ld1h {z14.h}, p7/z, [x13]
add x11, x13, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x7, #0x20
sub z6.h, z14.h, z30.h
add z14.h, z14.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x12, #0x20
rev z30.h, z30.h
ld1h {z26.h}, p7/z, [x11]
add x11, x5, #0x20
rev z26.h, z26.h
ld1h {z15.h}, p7/z, [x7]
sub z7.h, z15.h, z30.h
add z15.h, z15.h, z30.h
ld1h {z30.h}, p7/z, [x12]
sub z23.h, z30.h, z26.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x17
add x11, x11, #0x70
rev z17.h, z17.h
sub z22.h, z26.h, z17.h
str z22, [x11]
add x11, x9, #0x20
add z26.h, z26.h, z17.h
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x18
ld1h {z16.h}, p7/z, [x9]
rev z17.h, z17.h
add x11, x11, #0x70
sub z10.h, z16.h, z17.h
str z10, [x11]
add x11, x8, #0x20
ld1h {z10.h}, p7/z, [x11]
rev z10.h, z10.h
addvl x11, sp, #2
add z16.h, z16.h, z17.h
ld1h {z17.h}, p7/z, [x8]
sub z9.h, z17.h, z10.h
add z17.h, z17.h, z10.h
zip1 z10.d, z31.d, z1.d
zip2 z31.d, z31.d, z1.d
zip1 z1.d, z27.d, z11.d
zip2 z27.d, z27.d, z11.d
zip1 z11.d, z10.d, z1.d
add x11, x11, #0x70
zip2 z10.d, z10.d, z1.d
ptrue p6.d
str z11, [x11]
zip1 z11.d, z31.d, z27.d
revh z1.d, p6/m, z11.d
zip2 z31.d, z31.d, z27.d
revh z27.d, p6/m, z31.d
ldr z11, [x11]
mov z31.d, z1.d
ldr z1, [x11]
addvl x11, sp, #0xa
saddlb z11.s, z11.h, z27.h
saddlt z1.s, z1.h, z27.h
add x11, x11, #0x70
str z27, [x11]
mov z27.d, z10.d
addvl x11, sp, #8
saddlb z10.s, z10.h, z31.h
add x11, x11, #0x70
str z27, [x11]
ldr z27, [x11]
addvl x11, sp, #9
saddlt z27.s, z27.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z10.d, p6/m, z10.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z11.s, z1.s
zip2 z11.s, z11.s, z1.s
zip1 z22.s, z27.s, z10.s
zip2 z27.s, z27.s, z10.s
add z31.s, z31.s, z22.s
add z27.s, z11.s, z27.s
uzp2 z11.d, z31.d, z27.d
revw z11.d, p6/m, z11.d
addvl x11, sp, #0x19
uzp1 z31.d, z31.d, z27.d
ld1w {z10.s}, p7/z, [x21]
add x11, x11, #0x70
add z27.s, z11.s, z31.s
sub z31.s, z31.s, z11.s
mul z27.s, p7/m, z27.s, z10.s
uzp1 z11.s, z27.s, z27.s
uzp2 z27.s, z27.s, z27.s
add z22.s, z11.s, z27.s
sub z11.s, z11.s, z27.s
str z11, [x11]
addvl x11, sp, #1
ptrue p5.s
add x11, x11, #0x70
ldr z11, [x11]
mul z11.s, p7/m, z11.s, z31.s
addp z11.s, p5/m, z11.s, z11.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z1, [x11]
mul z31.s, p7/m, z31.s, z1.s
addp z31.s, p5/m, z31.s, z31.s
zip1 z27.d, z28.d, z12.d
zip2 z28.d, z28.d, z12.d
zip1 z12.d, z24.d, z13.d
zip2 z24.d, z24.d, z13.d
zip2 z1.d, z27.d, z12.d
zip1 z13.d, z27.d, z12.d
zip1 z27.d, z28.d, z24.d
revh z12.d, p6/m, z27.d
mov z27.d, z12.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
addvl x11, sp, #0xb
mov z28.d, z13.d
mov z13.d, z24.d
add x11, x11, #0x70
saddlb z24.s, z28.h, z24.h
str z28, [x11]
ldr z28, [x11]
addvl x11, sp, #0xe
saddlt z12.s, z28.h, z13.h
add x11, x11, #0x70
str z13, [x11]
saddlb z13.s, z1.h, z27.h
addvl x11, sp, #0xc
add x11, x11, #0x70
str z1, [x11]
ldr z1, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
str z27, [x11]
saddlt z27.s, z1.h, z27.h
revw z13.d, p6/m, z13.d
revw z27.d, p6/m, z27.d
zip1 z28.s, z24.s, z12.s
zip2 z24.s, z24.s, z12.s
zip1 z1.s, z27.s, z13.s
zip2 z27.s, z27.s, z13.s
add z28.s, z28.s, z1.s
add z27.s, z24.s, z27.s
uzp2 z24.d, z28.d, z27.d
revw z24.d, p6/m, z24.d
addvl x11, sp, #0x1a
uzp1 z28.d, z28.d, z27.d
add z27.s, z24.s, z28.s
add x11, x11, #0x70
mul z27.s, p7/m, z27.s, z10.s
uzp1 z13.s, z27.s, z27.s
uzp2 z27.s, z27.s, z27.s
sub z12.s, z13.s, z27.s
str z12, [x11]
addvl x11, sp, #1
sub z28.s, z28.s, z24.s
add z24.s, z13.s, z27.s
add x11, x11, #0x70
ldr z1, [x11]
movprfx z27, z1
mul z27.s, p7/m, z27.s, z28.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z12, [x11]
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z13.d, z29.d, z14.d
zip2 z29.d, z29.d, z14.d
zip1 z14.d, z25.d, z15.d
zip2 z25.d, z25.d, z15.d
zip1 z12.d, z13.d, z14.d
zip1 z15.d, z29.d, z25.d
zip2 z14.d, z13.d, z14.d
revh z15.d, p6/m, z15.d
add x11, sp, #0x70
zip2 z29.d, z29.d, z25.d
str z15, [x11]
revh z25.d, p6/m, z29.d
addvl x11, sp, #0xf
saddlb z15.s, z12.h, z25.h
add x11, x11, #0x70
str z12, [x11]
ldr z29, [x11]
addvl x11, sp, #4
saddlt z13.s, z29.h, z25.h
add x11, x11, #0x70
str z25, [x11]
mov z25.d, z14.d
add x11, sp, #0x70
ldr z29, [x11]
saddlb z14.s, z14.h, z29.h
addvl x11, sp, #0x10
add x11, x11, #0x70
str z25, [x11]
ldr z25, [x11]
saddlt z25.s, z25.h, z29.h
revw z14.d, p6/m, z14.d
revw z25.d, p6/m, z25.d
zip1 z29.s, z15.s, z13.s
zip2 z15.s, z15.s, z13.s
zip1 z12.s, z25.s, z14.s
zip2 z25.s, z25.s, z14.s
add z29.s, z29.s, z12.s
add z25.s, z15.s, z25.s
uzp2 z15.d, z29.d, z25.d
revw z15.d, p6/m, z15.d
uzp1 z29.d, z29.d, z25.d
add z25.s, z15.s, z29.s
sub z29.s, z29.s, z15.s
mul z25.s, p7/m, z25.s, z10.s
uzp1 z15.s, z25.s, z25.s
uzp2 z25.s, z25.s, z25.s
add z14.s, z15.s, z25.s
sub z15.s, z15.s, z25.s
movprfx z25, z1
mul z25.s, p7/m, z25.s, z29.s
addp z25.s, p5/m, z25.s, z25.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z12, [x11]
mul z29.s, p7/m, z29.s, z12.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z13.d, z30.d, z16.d
zip2 z30.d, z30.d, z16.d
zip1 z16.d, z26.d, z17.d
zip2 z26.d, z26.d, z17.d
zip1 z12.d, z13.d, z16.d
zip2 z1.d, z13.d, z16.d
zip1 z17.d, z30.d, z26.d
revh z16.d, p6/m, z17.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
addvl x11, sp, #5
saddlb z17.s, z12.h, z30.h
add x11, x11, #0x70
str z12, [x11]
ldr z26, [x11]
addvl x11, sp, #7
saddlt z13.s, z26.h, z30.h
add x11, x11, #0x70
str z30, [x11]
mov z30.d, z16.d
addvl x11, sp, #6
saddlb z16.s, z1.h, z16.h
saddlt z26.s, z1.h, z30.h
add x11, x11, #0x70
str z30, [x11]
revw z16.d, p6/m, z16.d
revw z26.d, p6/m, z26.d
zip1 z30.s, z17.s, z13.s
zip2 z17.s, z17.s, z13.s
zip1 z12.s, z26.s, z16.s
zip2 z26.s, z26.s, z16.s
add z30.s, z30.s, z12.s
add z26.s, z17.s, z26.s
uzp2 z17.d, z30.d, z26.d
revw z17.d, p6/m, z17.d
addvl x11, sp, #1
uzp1 z30.d, z30.d, z26.d
add z26.s, z17.s, z30.s
mul z26.s, p7/m, z26.s, z10.s
uzp1 z13.s, z26.s, z26.s
uzp2 z26.s, z26.s, z26.s
add x11, x11, #0x70
add z12.s, z13.s, z26.s
sub z30.s, z30.s, z17.s
sub z13.s, z13.s, z26.s
ldr z26, [x11]
mul z26.s, p7/m, z26.s, z30.s
addp z26.s, p5/m, z26.s, z26.s
addvl x11, sp, #3
add x11, x11, #0x70
ldr z10, [x11]
mul z30.s, p7/m, z30.s, z10.s
addp z30.s, p5/m, z30.s, z30.s
mov z17.d, z24.d
addvl x11, sp, #0x19
mov z16.d, z22.d
tbl z16.s, {z16.s, z17.s}, z0.s
rshrnb z16.h, z16.s, #4
mov z17.d, z12.d
uzp1 z10.h, z16.h, z16.h
add x11, x11, #0x70
mov z16.d, z14.d
tbl z24.s, {z16.s, z17.s}, z0.s
uzp1 z17.s, z27.s, z27.s
uzp1 z16.s, z11.s, z11.s
rshrnb z24.h, z24.s, #4
tbl z16.s, {z16.s, z17.s}, z0.s
uzp1 z11.s, z26.s, z26.s
uzp1 z24.h, z24.h, z24.h
rshrnb z16.h, z16.s, #4
uzp1 z16.h, z16.h, z16.h
stp q10, q24, [x1]
uzp1 z10.s, z25.s, z25.s
tbl z10.s, {z10.s, z11.s}, z0.s
rshrnb z10.h, z10.s, #4
uzp1 z10.h, z10.h, z10.h
stp q16, q10, [x1, #0x200]
ldr z26, [x11]
addvl x11, sp, #0x1a
add x11, x11, #0x70
ldr z27, [x11]
tbl z26.s, {z26.s, z27.s}, z0.s
addvl x11, sp, #0x11
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
add x11, x11, #0x70
ldr z24, [x11]
mov z27.d, z13.d
addvl x11, sp, #0x12
str q26, [x1, #0x400]
mov z26.d, z15.d
add x11, x11, #0x70
ldr z15, [x11]
tbl z26.s, {z26.s, z27.s}, z0.s
addvl x11, sp, #0x13
uzp1 z27.s, z28.s, z28.s
rshrnb z26.h, z26.s, #4
add x11, x11, #0x70
uzp1 z26.h, z26.h, z26.h
zip1 z28.d, z18.d, z15.d
str q26, [x1, #0x410]
uzp1 z26.s, z31.s, z31.s
tbl z26.s, {z26.s, z27.s}, z0.s
uzp1 z27.s, z30.s, z30.s
trn2 z30.d, z18.d, z15.d
trn1 z18.d, z18.d, z15.d
ldr z15, [x11]
addvl x11, sp, #0x14
rshrnb z26.h, z26.s, #4
add x11, x11, #0x70
ldr z14, [x11]
uzp1 z26.h, z26.h, z26.h
addvl x11, sp, #0x15
trn2 z31.d, z19.d, z24.d
str q26, [x1, #0x600]
add x11, x11, #0x70
uzp1 z26.s, z29.s, z29.s
zip1 z29.d, z19.d, z24.d
tbl z26.s, {z26.s, z27.s}, z0.s
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
zip1 z27.d, z31.d, z30.d
trn1 z19.d, z19.d, z24.d
zip2 z24.d, z31.d, z30.d
trn2 z31.d, z21.d, z15.d
str q26, [x1, #0x610]
zip1 z26.d, z29.d, z28.d
zip1 z29.d, z21.d, z15.d
trn1 z21.d, z21.d, z15.d
ldr z15, [x11]
addvl x11, sp, #0x16
trn2 z30.d, z20.d, z14.d
zip1 z28.d, z20.d, z14.d
add x11, x11, #0x70
trn1 z20.d, z20.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x18
zip2 z25.d, z19.d, z18.d
zip1 z18.d, z29.d, z28.d
add x11, x11, #0x70
zip1 z29.d, z15.d, z6.d
zip1 z19.d, z31.d, z30.d
zip2 z21.d, z21.d, z20.d
zip1 z28.d, z14.d, z7.d
zip2 z20.d, z31.d, z30.d
zip1 z16.d, z29.d, z28.d
trn2 z31.d, z15.d, z6.d
trn1 z29.d, z15.d, z6.d
ldr z15, [x11]
addvl x11, sp, #0x17
trn2 z30.d, z14.d, z7.d
add x11, x11, #0x70
trn1 z28.d, z14.d, z7.d
ldr z14, [x11]
addvl x11, sp, #0x1c
zip1 z17.d, z31.d, z30.d
zip2 z11.d, z29.d, z28.d
add x11, x11, #0x70
zip2 z10.d, z31.d, z30.d
zip1 z29.d, z23.d, z15.d
trn2 z31.d, z23.d, z15.d
trn1 z23.d, z23.d, z15.d
ldr z15, [x11]
addvl x11, sp, #0x1b
trn2 z30.d, z14.d, z9.d
zip1 z28.d, z14.d, z9.d
add x11, x11, #0x70
trn1 z22.d, z14.d, z9.d
ldr z14, [x11]
addvl x11, sp, #0x1d
zip1 z6.d, z29.d, z28.d
zip1 z7.d, z31.d, z30.d
add x11, x11, #0x70
ldr z13, [x11]
zip2 z9.d, z31.d, z30.d
addvl x11, sp, #0x1e
movi d31, #0000000000000000
zip2 z22.d, z23.d, z22.d
add x11, x11, #0x70
ldr z12, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z15.h[0]
add x11, x1, #0x40
movprfx z23, z31
sdot z23.d, z19.h, z15.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z15.h[0]
sdot z30.d, z26.h, z14.h[0]
sdot z23.d, z18.h, z14.h[0]
sdot z30.d, z25.h, z13.h[0]
sdot z23.d, z21.h, z13.h[0]
sdot z30.d, z24.h, z12.h[0]
sdot z23.d, z20.h, z12.h[0]
sdot z29.d, z16.h, z14.h[0]
sdot z28.d, z6.h, z14.h[0]
sdot z29.d, z11.h, z13.h[0]
sdot z28.d, z22.h, z13.h[0]
sdot z29.d, z10.h, z12.h[0]
sdot z28.d, z9.h, z12.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z15.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z15.h[1]
sdot z30.d, z26.h, z14.h[1]
sdot z23.d, z18.h, z14.h[1]
sdot z30.d, z25.h, z13.h[1]
sdot z23.d, z21.h, z13.h[1]
sdot z30.d, z24.h, z12.h[1]
sdot z23.d, z20.h, z12.h[1]
sdot z29.d, z16.h, z14.h[1]
sdot z28.d, z6.h, z14.h[1]
sdot z29.d, z11.h, z13.h[1]
sdot z28.d, z22.h, z13.h[1]
sdot z29.d, z10.h, z12.h[1]
sdot z28.d, z9.h, z12.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x140
movprfx z30, z31
sdot z30.d, z27.h, z8.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z8.h[0]
sdot z30.d, z26.h, z5.h[0]
sdot z23.d, z18.h, z5.h[0]
sdot z30.d, z25.h, z4.h[0]
sdot z23.d, z21.h, z4.h[0]
sdot z30.d, z24.h, z3.h[0]
sdot z23.d, z20.h, z3.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z8.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[0]
sdot z29.d, z16.h, z5.h[0]
sdot z28.d, z6.h, z5.h[0]
sdot z29.d, z11.h, z4.h[0]
sdot z28.d, z22.h, z4.h[0]
sdot z29.d, z10.h, z3.h[0]
sdot z28.d, z9.h, z3.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z27.h, z8.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z8.h[1]
sdot z30.d, z26.h, z5.h[1]
sdot z23.d, z18.h, z5.h[1]
sdot z30.d, z25.h, z4.h[1]
sdot z23.d, z21.h, z4.h[1]
sdot z30.d, z24.h, z3.h[1]
sdot z23.d, z20.h, z3.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z8.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z8.h[1]
sdot z29.d, z16.h, z5.h[1]
sdot z28.d, z6.h, z5.h[1]
sdot z29.d, z11.h, z4.h[1]
sdot z28.d, z22.h, z4.h[1]
sdot z29.d, z10.h, z3.h[1]
sdot z28.d, z9.h, z3.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x1e0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x2e0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x3, #0x3e0
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
add x11, x1, #0x240
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[0]
sdot z30.d, z26.h, z2.h[0]
sdot z23.d, z18.h, z2.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z2.h[0]
sdot z28.d, z6.h, z2.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z27.h, z13.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z13.h[1]
sdot z30.d, z26.h, z2.h[1]
sdot z23.d, z18.h, z2.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z2.h[1]
sdot z28.d, z6.h, z2.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x100
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x200
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x300
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x400
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x120
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x220
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x440
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x140
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x240
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x540
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x160
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x260
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x640
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z6.h, z13.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z10.h, z15.h[1]
sdot z28.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x180
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x280
ld1h {z12.h}, p7/z, [x11]
add x11, x3, #0x380
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x480
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x740
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z7.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z6.h, z13.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
sdot z29.d, z10.h, z15.h[0]
sdot z28.d, z9.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z27.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z19.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z17.h, z12.h[1]
movprfx z27, z31
sdot z27.d, z7.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z29.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z29.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z29.d, z20.h, z15.h[1]
sdot z28.d, z16.h, z13.h[1]
sdot z27.d, z6.h, z13.h[1]
sdot z28.d, z11.h, z14.h[1]
sdot z27.d, z22.h, z14.h[1]
sdot z28.d, z10.h, z15.h[1]
sdot z27.d, z9.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
uzp1 z28.s, z28.s, z27.s
rshrnb z30.h, z30.s, #4
rshrnb z28.h, z28.s, #4
uzp1 z30.h, z30.h, z28.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #2
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
ldr z28, [x11]
sub z27.h, z7.h, z28.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z6, [x11]
add x11, sp, #0x70
ldr z30, [x11]
sub z26.h, z6.h, z30.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z20, [x11]
addvl x11, sp, #7
add x11, x11, #0x70
ldr z21, [x11]
sub z29.h, z20.h, z21.h
addvl x11, sp, #6
add x11, x11, #0x70
ldr z21, [x11]
sub z28.h, z1.h, z21.h
add x11, x3, #0x4a0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x520
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
add x11, x3, #0x4c0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x540
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
add x11, x3, #0x4e0
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x560
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
add x11, x3, #0x500
ld1h {z15.h}, p7/z, [x11]
add x11, x3, #0x580
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
ldr z25, [x11]
add z29.h, z25.h, z7.h
add x11, sp, #0x70
ldr z30, [x11]
add z30.h, z30.h, z6.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #7
sub z29.h, z29.h, z30.h
add x11, x11, #0x70
ldr z25, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z26, [x11]
add z30.h, z25.h, z26.h
addvl x11, sp, #6
add x11, x11, #0x70
ldr z21, [x11]
add z26.h, z21.h, z1.h
revh z26.d, p6/m, z26.d
add x11, x3, #0x5a0
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
add x11, x3, #0x5c0
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
addvl sp, sp, #0x1f
add sp, sp, #0x70
mov x1, x19
add x0, sp, #0x20
rdvl x12, #0x13
adrp x2, #0x457000
ptrue p7.b
lsl x12, x12, #1
add x2, x2, #0xdb0
sub sp, sp, x12
add x3, x2, #0x40
ld1w {z31.s}, p7/z, [x3]
sub sp, sp, #0x40
cntb x6
addvl x3, sp, #0x1c
lsl x6, x6, #5
add x3, x3, #0x40
add x5, x0, #0x800
stp d8, d9, [sp]
add x4, x2, #0x20
stp d10, d11, [sp, #0x10]
stp d12, d13, [sp, #0x20]
stp d14, d15, [sp, #0x30]
ld1w {z15.s}, p7/z, [x2]
str z31, [x3]
add x3, x2, #0x80
ld1w {z31.s}, p7/z, [x3]
addvl x3, sp, #0x1d
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xa0
ld1h {z6.h}, p7/z, [x3]
add x3, x2, #0x1a0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1e
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x2a0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1f
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x3a0
ld1h {z31.h}, p7/z, [x3]
cntb x3
lsl x3, x3, #5
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xc0
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
rdvl x6, #0x11
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x1c0
ld1h {z31.h}, p7/z, [x3]
rdvl x3, #0x11
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x2c0
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
cntb x6, all, mul #9
add x3, x3, #0x40
lsl x6, x6, #2
add x3, sp, x3
str z31, [x3]
add x3, x2, #0x3c0
ld1h {z31.h}, p7/z, [x3]
cntb x3, all, mul #9
lsl x3, x3, #2
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xe0
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
str z31, [x3]
add x3, x0, #0x20
ld1h {z28.h}, p7/z, [x3]
ld1h {z17.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z14.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z30.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z13.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z11.h}, p7/z, [x3]
zip1 z12.d, z17.d, z11.d
add x3, x0, #0xc0
ld1h {z10.h}, p7/z, [x3]
zip2 z17.d, z17.d, z11.d
zip1 z11.d, z13.d, z10.d
zip2 z13.d, z13.d, z10.d
zip1 z10.d, z12.d, z11.d
zip2 z11.d, z12.d, z11.d
zip1 z12.d, z17.d, z13.d
revh z12.d, p6/m, z12.d
zip2 z17.d, z17.d, z13.d
revh z13.d, p6/m, z17.d
rev z16.h, z16.h
rev z14.h, z14.h
rev z28.h, z28.h
zip1 z17.d, z28.d, z16.d
rev z24.h, z24.h
zip2 z28.d, z28.d, z16.d
zip1 z16.d, z24.d, z14.d
zip2 z24.d, z24.d, z14.d
zip1 z14.d, z17.d, z16.d
zip2 z16.d, z17.d, z16.d
zip1 z17.d, z28.d, z24.d
revh z9.d, p6/m, z17.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
add x3, sp, #0x40
saddlb z28.s, z13.h, z24.h
saddlb z17.s, z10.h, z14.h
add z17.s, z17.s, z28.s
str z10, [x3]
ldr z28, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str z14, [x3]
ldr z8, [x3]
addvl x3, sp, #3
saddlt z14.s, z28.h, z8.h
saddlt z28.s, z13.h, z24.h
add x3, x3, #0x40
str z13, [x3]
add z14.s, z14.s, z28.s
addvl x3, sp, #7
saddlb z28.s, z12.h, z9.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z16.d
addvl x3, sp, #1
saddlb z16.s, z11.h, z16.h
add z16.s, z16.s, z28.s
add x3, x3, #0x40
str z11, [x3]
ldr z28, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z8, [x3]
addvl x3, sp, #2
saddlt z28.s, z28.h, z8.h
saddlt z24.s, z12.h, z9.h
add x3, x3, #0x40
str z12, [x3]
add z24.s, z28.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z9, [x3]
revw z16.d, p6/m, z16.d
revw z24.d, p6/m, z24.d
zip1 z28.s, z17.s, z14.s
zip2 z17.s, z17.s, z14.s
zip1 z13.s, z24.s, z16.s
zip2 z24.s, z24.s, z16.s
add z28.s, z28.s, z13.s
add z24.s, z17.s, z24.s
uzp2 z17.d, z28.d, z24.d
revw z17.d, p6/m, z17.d
addvl x3, sp, #0x1b
uzp1 z28.d, z28.d, z24.d
ld1w {z4.s}, p7/z, [x4]
add x3, x3, #0x40
add z24.s, z17.s, z28.s
sub z28.s, z28.s, z17.s
mul z24.s, p7/m, z24.s, z4.s
uzp1 z17.s, z24.s, z24.s
uzp2 z24.s, z24.s, z24.s
add z8.s, z17.s, z24.s
str z8, [x3]
addvl x3, sp, #0x1c
add x3, x3, #0x40
ldr z10, [x3]
sub z7.s, z17.s, z24.s
movprfx z11, z10
mul z11.s, p7/m, z11.s, z28.s
ptrue p5.s
addp z11.s, p5/m, z11.s, z11.s
addvl x3, sp, #0x1d
add x3, x3, #0x40
ldr z8, [x3]
mul z28.s, p7/m, z28.s, z8.s
addp z28.s, p5/m, z28.s, z28.s
add x3, x0, #0x100
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z14.h}, p7/z, [x3]
zip1 z16.d, z24.d, z14.d
add x3, x0, #0x1c0
zip2 z24.d, z24.d, z14.d
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z17.d, z13.d
zip2 z17.d, z17.d, z13.d
zip1 z5.d, z16.d, z14.d
zip2 z3.d, z16.d, z14.d
zip1 z16.d, z24.d, z17.d
revh z2.d, p6/m, z16.d
zip2 z24.d, z24.d, z17.d
revh z1.d, p6/m, z24.d
rev z24.h, z20.h
rev z23.h, z23.h
rev z26.h, z26.h
rev z29.h, z29.h
zip1 z20.d, z26.d, z24.d
zip2 z26.d, z26.d, z24.d
zip1 z24.d, z29.d, z23.d
zip2 z29.d, z29.d, z23.d
zip1 z23.d, z20.d, z24.d
zip1 z16.d, z26.d, z29.d
zip2 z20.d, z20.d, z24.d
revh z16.d, p6/m, z16.d
zip2 z26.d, z26.d, z29.d
revh z29.d, p6/m, z26.d
addvl x3, sp, #8
mov z26.d, z23.d
saddlb z17.s, z5.h, z23.h
add x3, x3, #0x40
mov z23.d, z29.d
saddlb z29.s, z1.h, z29.h
add z17.s, z17.s, z29.s
str z5, [x3]
ldr z29, [x3]
addvl x3, sp, #0xc
saddlb z14.s, z3.h, z20.h
saddlt z24.s, z2.h, z16.h
add x3, x3, #0x40
str z26, [x3]
ldr z0, [x3]
addvl x3, sp, #0xb
saddlt z13.s, z29.h, z0.h
saddlt z29.s, z1.h, z23.h
add x3, x3, #0x40
str z1, [x3]
add z13.s, z13.s, z29.s
addvl x3, sp, #0xd
saddlb z29.s, z2.h, z16.h
add z14.s, z14.s, z29.s
add x3, x3, #0x40
str z23, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
str z3, [x3]
ldr z0, [x3]
addvl x3, sp, #0xa
saddlt z29.s, z0.h, z20.h
add z24.s, z29.s, z24.s
add x3, x3, #0x40
str z2, [x3]
revw z14.d, p6/m, z14.d
revw z24.d, p6/m, z24.d
zip1 z29.s, z17.s, z13.s
zip2 z17.s, z17.s, z13.s
zip1 z12.s, z24.s, z14.s
zip2 z24.s, z24.s, z14.s
add z29.s, z29.s, z12.s
add z24.s, z17.s, z24.s
uzp2 z17.d, z29.d, z24.d
revw z17.d, p6/m, z17.d
uzp1 z29.d, z29.d, z24.d
mov z23.d, z10.d
add z24.s, z17.s, z29.s
sub z29.s, z29.s, z17.s
mul z24.s, p7/m, z24.s, z4.s
movprfx z12, z10
mul z12.s, p7/m, z12.s, z29.s
uzp1 z17.s, z24.s, z24.s
uzp2 z24.s, z24.s, z24.s
add z1.s, z17.s, z24.s
sub z26.s, z17.s, z24.s
addp z12.s, p5/m, z12.s, z12.s
mul z29.s, p7/m, z29.s, z8.s
addp z29.s, p5/m, z29.s, z29.s
add x3, x0, #0x200
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x240
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z24.d, z13.d
add x3, x0, #0x2c0
ld1h {z10.h}, p7/z, [x3]
zip2 z24.d, z24.d, z13.d
zip1 z13.d, z17.d, z10.d
zip2 z17.d, z17.d, z10.d
zip1 z0.d, z14.d, z13.d
zip2 z10.d, z14.d, z13.d
zip1 z14.d, z24.d, z17.d
revh z5.d, p6/m, z14.d
zip2 z24.d, z24.d, z17.d
revh z17.d, p6/m, z24.d
rev z19.h, z19.h
rev z24.h, z21.h
rev z30.h, z30.h
rev z22.h, z22.h
zip1 z21.d, z30.d, z19.d
zip2 z30.d, z30.d, z19.d
zip1 z19.d, z22.d, z24.d
zip2 z22.d, z22.d, z24.d
zip1 z14.d, z21.d, z19.d
zip2 z21.d, z21.d, z19.d
zip1 z19.d, z30.d, z22.d
revh z19.d, p6/m, z19.d
mov z3.d, z19.d
zip2 z30.d, z30.d, z22.d
revh z30.d, p6/m, z30.d
addvl x3, sp, #0xe
mov z2.d, z30.d
saddlb z30.s, z17.h, z30.h
add x3, x3, #0x40
saddlb z19.s, z0.h, z14.h
add z19.s, z19.s, z30.s
str z0, [x3]
ldr z30, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
str z14, [x3]
ldr z22, [x3]
addvl x3, sp, #0x11
saddlt z14.s, z30.h, z22.h
saddlt z30.s, z17.h, z2.h
add x3, x3, #0x40
str z17, [x3]
add z14.s, z14.s, z30.s
addvl x3, sp, #0x14
saddlb z30.s, z5.h, z3.h
saddlb z17.s, z10.h, z21.h
add x3, x3, #0x40
str z2, [x3]
add z17.s, z17.s, z30.s
addvl x3, sp, #0xf
saddlt z22.s, z5.h, z3.h
add x3, x3, #0x40
str z10, [x3]
ldr z30, [x3]
addvl x3, sp, #0x10
saddlt z30.s, z30.h, z21.h
add z22.s, z30.s, z22.s
add x3, x3, #0x40
str z5, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
str z3, [x3]
revw z17.d, p6/m, z17.d
revw z22.d, p6/m, z22.d
zip1 z30.s, z19.s, z14.s
zip2 z19.s, z19.s, z14.s
zip1 z13.s, z22.s, z17.s
zip2 z22.s, z22.s, z17.s
add z30.s, z30.s, z13.s
add z22.s, z19.s, z22.s
uzp2 z19.d, z30.d, z22.d
revw z19.d, p6/m, z19.d
uzp1 z30.d, z30.d, z22.d
add z22.s, z19.s, z30.s
sub z30.s, z30.s, z19.s
mul z22.s, p7/m, z22.s, z4.s
movprfx z13, z23
mul z13.s, p7/m, z13.s, z30.s
uzp1 z5.s, z22.s, z22.s
uzp2 z22.s, z22.s, z22.s
add z2.s, z5.s, z22.s
sub z5.s, z5.s, z22.s
addp z13.s, p5/m, z13.s, z13.s
mov z24.d, z8.d
mul z30.s, p7/m, z30.s, z8.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x300
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x340
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z17.h}, p7/z, [x3]
zip1 z14.d, z19.d, z17.d
add x3, x0, #0x3c0
ld1h {z10.h}, p7/z, [x3]
zip2 z19.d, z19.d, z17.d
zip1 z17.d, z22.d, z10.d
zip2 z22.d, z22.d, z10.d
zip1 z8.d, z14.d, z17.d
zip2 z0.d, z14.d, z17.d
zip1 z10.d, z19.d, z22.d
revh z14.d, p6/m, z10.d
zip2 z19.d, z19.d, z22.d
revh z19.d, p6/m, z19.d
rev z18.h, z18.h
rev z25.h, z25.h
rev z27.h, z27.h
rev z31.h, z31.h
zip1 z22.d, z27.d, z18.d
zip2 z27.d, z27.d, z18.d
zip1 z18.d, z31.d, z25.d
zip2 z31.d, z31.d, z25.d
zip1 z25.d, z22.d, z18.d
zip1 z17.d, z27.d, z31.d
zip2 z22.d, z22.d, z18.d
revh z17.d, p6/m, z17.d
zip2 z27.d, z27.d, z31.d
revh z27.d, p6/m, z27.d
addvl x3, sp, #0x15
saddlb z31.s, z19.h, z27.h
saddlb z9.s, z8.h, z25.h
add x3, x3, #0x40
add z9.s, z9.s, z31.s
str z8, [x3]
ldr z31, [x3]
addvl x3, sp, #0x19
saddlb z8.s, z0.h, z22.h
add x3, x3, #0x40
str z25, [x3]
ldr z25, [x3]
addvl x3, sp, #0x18
saddlt z3.s, z31.h, z25.h
saddlt z31.s, z19.h, z27.h
add x3, x3, #0x40
str z19, [x3]
add z3.s, z3.s, z31.s
addvl x3, sp, #0x1a
saddlb z31.s, z14.h, z17.h
add z8.s, z8.s, z31.s
add x3, x3, #0x40
str z27, [x3]
saddlt z18.s, z14.h, z17.h
addvl x3, sp, #0x16
add x3, x3, #0x40
str z0, [x3]
ldr z31, [x3]
addvl x3, sp, #0x17
saddlt z31.s, z31.h, z22.h
add z18.s, z31.s, z18.s
add x3, x3, #0x40
str z14, [x3]
revw z8.d, p6/m, z8.d
revw z18.d, p6/m, z18.d
zip1 z31.s, z9.s, z3.s
zip2 z9.s, z9.s, z3.s
zip1 z0.s, z18.s, z8.s
zip2 z18.s, z18.s, z8.s
add z31.s, z31.s, z0.s
add z18.s, z9.s, z18.s
uzp2 z9.d, z31.d, z18.d
revw z9.d, p6/m, z9.d
uzp1 z31.d, z31.d, z18.d
add z18.s, z9.s, z31.s
mul z18.s, p7/m, z18.s, z4.s
uzp1 z4.s, z18.s, z18.s
uzp2 z18.s, z18.s, z18.s
sub z31.s, z31.s, z9.s
add z3.s, z4.s, z18.s
sub z4.s, z4.s, z18.s
movprfx z18, z23
mul z18.s, p7/m, z18.s, z31.s
addp z18.s, p5/m, z18.s, z18.s
mul z31.s, p7/m, z31.s, z24.s
addp z31.s, p5/m, z31.s, z31.s
addvl x3, sp, #0x1b
mov z9.d, z1.d
mov z0.d, z2.d
add x3, x3, #0x40
ldr z8, [x3]
tbl z8.s, {z8.s, z9.s}, z15.s
add x3, sp, #0x40
rshrnb z8.h, z8.s, #0xb
uzp1 z8.h, z8.h, z8.h
mov z1.d, z3.d
uzp1 z9.s, z12.s, z12.s
tbl z0.s, {z0.s, z1.s}, z15.s
uzp1 z2.s, z13.s, z13.s
uzp1 z3.s, z18.s, z18.s
mov z12.d, z7.d
tbl z2.s, {z2.s, z3.s}, z15.s
rshrnb z0.h, z0.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z0.h, z0.h, z0.h
uzp1 z2.h, z2.h, z2.h
stp q8, q0, [x1]
uzp1 z8.s, z11.s, z11.s
tbl z8.s, {z8.s, z9.s}, z15.s
rshrnb z8.h, z8.s, #0xb
uzp1 z8.h, z8.h, z8.h
stp q8, q2, [x1, #0x200]
ldr z7, [x3]
addvl x3, sp, #4
mov z13.d, z26.d
tbl z12.s, {z12.s, z13.s}, z15.s
add x3, x3, #0x40
mov z13.d, z4.d
ldr z4, [x3]
addvl x3, sp, #1
rshrnb z12.h, z12.s, #0xb
uzp1 z12.h, z12.h, z12.h
add x3, x3, #0x40
str q12, [x1, #0x400]
mov z12.d, z5.d
sub z5.h, z7.h, z4.h
ldr z7, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z4, [x3]
tbl z12.s, {z12.s, z13.s}, z15.s
addvl x3, sp, #2
rshrnb z12.h, z12.s, #0xb
uzp1 z12.h, z12.h, z12.h
uzp1 z13.s, z29.s, z29.s
add x3, x3, #0x40
str q12, [x1, #0x410]
uzp1 z12.s, z28.s, z28.s
tbl z12.s, {z12.s, z13.s}, z15.s
rshrnb z12.h, z12.s, #0xb
uzp1 z12.h, z12.h, z12.h
str q12, [x1, #0x600]
uzp1 z29.s, z31.s, z31.s
ldr z12, [x3]
addvl x3, sp, #6
uzp1 z28.s, z30.s, z30.s
add x3, x3, #0x40
ldr z9, [x3]
tbl z28.s, {z28.s, z29.s}, z15.s
sub z8.h, z7.h, z4.h
rshrnb z28.h, z28.s, #0xb
sub z31.h, z12.h, z9.h
uzp1 z28.h, z28.h, z28.h
str q28, [x1, #0x610]
revh z4.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z31, [x3]
sub z31.h, z13.h, z31.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z7, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z29, [x3]
sub z1.h, z7.h, z29.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z7, [x3]
sub z2.h, z7.h, z20.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z30.h, z16.h
revh z0.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z29, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z23, [x3]
sub z31.h, z29.h, z23.h
revh z26.d, p6/m, z31.d
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z7, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z28, [x3]
sub z10.h, z7.h, z28.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z7, [x3]
sub z27.h, z7.h, z21.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z28, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z19, [x3]
sub z31.h, z28.h, z19.h
revh z14.d, p6/m, z31.d
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z18, [x3]
sub z31.h, z25.h, z18.h
revh z19.d, p6/m, z31.d
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z7, [x3]
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z30, [x3]
sub z24.h, z7.h, z30.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z7, [x3]
sub z23.h, z7.h, z22.h
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z7, [x3]
sub z31.h, z7.h, z17.h
revh z25.d, p6/m, z31.d
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z11, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z31, [x3]
sub z31.h, z11.h, z31.h
revh z7.d, p6/m, z31.d
addvl x3, sp, #0x1e
movi d31, #0000000000000000
cntb x6
add x3, x3, #0x40
ldr z13, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z13.h[0]
addvl x3, sp, #0x1f
movprfx z18, z31
sdot z18.d, z2.h, z13.h[0]
movprfx z29, z31
sdot z29.d, z27.h, z13.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[0]
cntb x3
sdot z30.d, z5.h, z6.h[0]
sdot z18.d, z1.h, z6.h[0]
lsl x3, x3, #5
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
add x3, sp, x3
sdot z29.d, z10.h, z6.h[0]
sdot z28.d, z24.h, z6.h[0]
add x3, x3, #0x40
ldr z11, [x3]
sdot z29.d, z14.h, z12.h[0]
add x3, x1, #0x40
sdot z18.d, z26.h, z11.h[0]
sdot z30.d, z3.h, z11.h[0]
sdot z29.d, z19.h, z11.h[0]
sdot z28.d, z25.h, z12.h[0]
uzp1 z30.s, z30.s, z18.s
sdot z28.d, z7.h, z11.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z8.h, z13.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[1]
sdot z30.d, z5.h, z6.h[1]
sdot z18.d, z1.h, z6.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z11.h[1]
sdot z18.d, z26.h, z11.h[1]
sdot z29.d, z10.h, z6.h[1]
sdot z28.d, z24.h, z6.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z11.h[1]
sdot z28.d, z7.h, z11.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
rdvl x3, #0x11
lsl x3, x3, #1
lsl x6, x6, #5
add x3, sp, x3
add x3, x3, #0x40
ldr z13, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z13.h[0]
addvl x3, x6, #1
rdvl x6, #0x11
movprfx z18, z31
sdot z18.d, z2.h, z13.h[0]
add x3, x3, #0x40
lsl x6, x6, #1
movprfx z29, z31
sdot z29.d, z27.h, z13.h[0]
add x3, sp, x3
ldr z12, [x3]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[0]
addvl x3, x6, #1
sdot z30.d, z5.h, z12.h[0]
sdot z18.d, z1.h, z12.h[0]
add x3, x3, #0x40
sdot z29.d, z10.h, z12.h[0]
sdot z28.d, z24.h, z12.h[0]
add x3, sp, x3
ldr z11, [x3]
sdot z30.d, z4.h, z11.h[0]
cntb x3, all, mul #9
sdot z18.d, z0.h, z11.h[0]
sdot z29.d, z14.h, z11.h[0]
lsl x3, x3, #2
sdot z28.d, z25.h, z11.h[0]
cntb x6, all, mul #9
add x3, sp, x3
lsl x6, x6, #2
add x3, x3, #0x40
ldr z9, [x3]
sdot z18.d, z26.h, z9.h[0]
add x3, x1, #0x140
sdot z28.d, z7.h, z9.h[0]
sdot z30.d, z3.h, z9.h[0]
sdot z29.d, z19.h, z9.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z8.h, z13.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[1]
sdot z30.d, z5.h, z12.h[1]
sdot z18.d, z1.h, z12.h[1]
sdot z30.d, z4.h, z11.h[1]
sdot z18.d, z0.h, z11.h[1]
sdot z30.d, z3.h, z9.h[1]
sdot z18.d, z26.h, z9.h[1]
sdot z29.d, z10.h, z12.h[1]
sdot z28.d, z24.h, z12.h[1]
sdot z29.d, z14.h, z11.h[1]
sdot z28.d, z25.h, z11.h[1]
sdot z29.d, z19.h, z9.h[1]
sdot z28.d, z7.h, z9.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x1e0
ld1h {z11.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z11.h[0]
add x3, x2, #0x2e0
ld1h {z12.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z11.h[0]
add x3, x2, #0x3e0
ld1h {z13.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z27.h, z11.h[0]
addvl x3, x6, #1
movprfx z28, z31
sdot z28.d, z23.h, z11.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z9, [x3]
sdot z30.d, z5.h, z9.h[0]
add x3, x1, #0x240
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z1.h, z9.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z29.d, z10.h, z9.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z24.h, z9.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z25.h, z12.h[0]
uzp1 z30.s, z30.s, z18.s
sdot z28.d, z7.h, z13.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z8.h, z11.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z11.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z11.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z11.h[1]
sdot z30.d, z5.h, z9.h[1]
sdot z18.d, z1.h, z9.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z9.h[1]
sdot z28.d, z24.h, z9.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x100
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x200
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x400
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x340
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x420
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x440
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x440
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x540
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x460
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x640
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x180
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x280
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x380
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x480
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x740
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z4, [x3]
add x3, sp, #0x40
ldr z14, [x3]
add z30.h, z4.h, z14.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z14, [x3]
add z29.h, z4.h, z14.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z12, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z9, [x3]
add z18.h, z12.h, z9.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z24, [x3]
add z12.h, z13.h, z24.h
addvl x3, sp, #0xc
sub z28.h, z30.h, z12.h
sub z13.h, z29.h, z18.h
add x3, x3, #0x40
ldr z26, [x3]
add z30.h, z30.h, z12.h
addvl x3, sp, #8
add z29.h, z29.h, z18.h
add x3, x3, #0x40
ldr z24, [x3]
add z23.h, z26.h, z24.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z26, [x3]
add z20.h, z20.h, z26.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z2, [x3]
add z16.h, z2.h, z16.h
addvl x3, sp, #0xb
sub z9.h, z20.h, z16.h
add x3, x3, #0x40
ldr z1, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z27, [x3]
add z26.h, z1.h, z27.h
addvl x3, sp, #0x12
sub z11.h, z23.h, z26.h
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z14, [x3]
add z24.h, z24.h, z14.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z14, [x3]
add z21.h, z21.h, z14.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z3, [x3]
add z14.h, z5.h, z3.h
addvl x3, sp, #0x11
sub z5.h, z21.h, z14.h
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z2, [x3]
add z4.h, z25.h, z2.h
add x3, sp, #0x40
str z14, [x3]
sub z8.h, z24.h, z4.h
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z10, [x3]
add z25.h, z25.h, z10.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z10, [x3]
add z22.h, z22.h, z10.h
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z7, [x3]
add z17.h, z7.h, z17.h
addvl x3, sp, #0x18
sub z10.h, z22.h, z17.h
add x3, x3, #0x40
ldr z19, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z27, [x3]
add z27.h, z19.h, z27.h
add x3, x2, #0x4a0
ld1h {z7.h}, p7/z, [x3]
sub z14.h, z25.h, z27.h
add x3, x2, #0x520
ld1h {z3.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
add x3, x1, #0x80
sdot z19.d, z28.h, z7.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
sdot z0.d, z11.h, z7.h[0]
sdot z2.d, z8.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
uzp1 z19.s, z19.s, z0.s
sdot z1.d, z14.h, z7.h[0]
rshrnb z19.h, z19.s, #0xb
uzp1 z2.s, z2.s, z1.s
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x1, #0x180
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[1]
sdot z19.d, z28.h, z7.h[1]
sdot z0.d, z11.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[1]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[1]
sdot z2.d, z8.h, z7.h[1]
sdot z1.d, z14.h, z7.h[1]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z7.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
sdot z19.d, z28.h, z7.h[0]
sdot z0.d, z11.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
sdot z2.d, z8.h, z7.h[0]
sdot z1.d, z14.h, z7.h[0]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x1, #0x380
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[1]
sdot z19.d, z28.h, z7.h[1]
sdot z0.d, z11.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[1]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[1]
sdot z2.d, z8.h, z7.h[1]
sdot z1.d, z14.h, z7.h[1]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z7.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z3.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
add x3, x1, #0x480
sdot z19.d, z28.h, z7.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
sdot z0.d, z11.h, z7.h[0]
sdot z2.d, z8.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
uzp1 z19.s, z19.s, z0.s
sdot z1.d, z14.h, z7.h[0]
rshrnb z19.h, z19.s, #0xb
uzp1 z2.s, z2.s, z1.s
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x1, #0x580
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[1]
sdot z19.d, z28.h, z7.h[1]
sdot z0.d, z11.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[1]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[1]
sdot z2.d, z8.h, z7.h[1]
sdot z1.d, z14.h, z7.h[1]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x2, #0x500
ld1h {z7.h}, p7/z, [x3]
add x3, x2, #0x580
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
sdot z19.d, z28.h, z7.h[0]
sdot z0.d, z11.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
sdot z2.d, z8.h, z7.h[0]
sdot z1.d, z14.h, z7.h[0]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
add x3, x1, #0x780
sdot z19.d, z28.h, z7.h[1]
movprfx z13, z31
sdot z13.d, z5.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z9.h, z3.h[1]
sdot z13.d, z8.h, z7.h[1]
sdot z28.d, z11.h, z7.h[1]
movprfx z11, z31
sdot z11.d, z10.h, z3.h[1]
uzp1 z19.s, z19.s, z28.s
sdot z11.d, z14.h, z7.h[1]
rshrnb z19.h, z19.s, #0xb
uzp1 z13.s, z13.s, z11.s
rshrnb z13.h, z13.s, #0xb
uzp1 z19.h, z19.h, z13.h
st1h {z19.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z23.h, z23.h, z26.h
add z20.h, z20.h, z16.h
revh z20.d, p6/m, z20.d
add x3, sp, #0x40
ldr z14, [x3]
sub z23.h, z23.h, z20.h
add z24.h, z24.h, z4.h
add z21.h, z21.h, z14.h
revh z21.d, p6/m, z21.d
sub z24.h, z24.h, z21.h
add z25.h, z25.h, z27.h
add z22.h, z22.h, z17.h
revh z22.d, p6/m, z22.d
add x3, x2, #0x5a0
ld1h {z14.h}, p7/z, [x3]
sub z25.h, z25.h, z22.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z14.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z14.h[0]
movprfx z27, z31
sdot z27.d, z25.h, z14.h[0]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z14.h[1]
movprfx z26, z31
sdot z26.d, z23.h, z14.h[1]
movprfx z27, z31
sdot z27.d, z25.h, z14.h[1]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[1]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0x5c0
ld1h {z14.h}, p7/z, [x3]
add x3, x1, #0x500
movprfx z29, z31
sdot z29.d, z30.h, z14.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z14.h[0]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[0]
movprfx z27, z31
sdot z27.d, z25.h, z14.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z14.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z23.h, z14.h[1]
add x0, x0, #0x400
sdot z31.d, z25.h, z14.h[1]
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
add x3, x0, #0x20
ld1h {z28.h}, p7/z, [x3]
ld1h {z17.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z14.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z30.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z13.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z11.h}, p7/z, [x3]
zip1 z12.d, z17.d, z11.d
add x3, x0, #0xc0
ld1h {z10.h}, p7/z, [x3]
zip2 z17.d, z17.d, z11.d
zip1 z11.d, z13.d, z10.d
zip2 z13.d, z13.d, z10.d
zip1 z10.d, z12.d, z11.d
zip2 z11.d, z12.d, z11.d
zip1 z12.d, z17.d, z13.d
revh z12.d, p6/m, z12.d
zip2 z17.d, z17.d, z13.d
revh z13.d, p6/m, z17.d
rev z16.h, z16.h
rev z14.h, z14.h
rev z28.h, z28.h
zip1 z17.d, z28.d, z16.d
rev z24.h, z24.h
zip2 z28.d, z28.d, z16.d
zip1 z16.d, z24.d, z14.d
zip2 z24.d, z24.d, z14.d
zip1 z14.d, z17.d, z16.d
zip2 z16.d, z17.d, z16.d
zip1 z17.d, z28.d, z24.d
revh z9.d, p6/m, z17.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
add x3, sp, #0x40
saddlb z28.s, z13.h, z24.h
saddlb z17.s, z10.h, z14.h
add z17.s, z17.s, z28.s
str z10, [x3]
ldr z28, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str z14, [x3]
ldr z8, [x3]
addvl x3, sp, #3
saddlt z14.s, z28.h, z8.h
saddlt z28.s, z13.h, z24.h
add x3, x3, #0x40
str z13, [x3]
add z14.s, z14.s, z28.s
addvl x3, sp, #7
saddlb z28.s, z12.h, z9.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z16.d
addvl x3, sp, #1
saddlb z16.s, z11.h, z16.h
add z16.s, z16.s, z28.s
add x3, x3, #0x40
str z11, [x3]
ldr z28, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z8, [x3]
addvl x3, sp, #2
saddlt z28.s, z28.h, z8.h
saddlt z24.s, z12.h, z9.h
add x3, x3, #0x40
str z12, [x3]
add z24.s, z28.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z9, [x3]
revw z16.d, p6/m, z16.d
revw z24.d, p6/m, z24.d
zip1 z28.s, z17.s, z14.s
zip2 z17.s, z17.s, z14.s
zip1 z13.s, z24.s, z16.s
zip2 z24.s, z24.s, z16.s
add z28.s, z28.s, z13.s
add z24.s, z17.s, z24.s
uzp2 z17.d, z28.d, z24.d
revw z17.d, p6/m, z17.d
addvl x3, sp, #0x1b
uzp1 z28.d, z28.d, z24.d
ld1w {z4.s}, p7/z, [x4]
add x3, x3, #0x40
add z24.s, z17.s, z28.s
sub z28.s, z28.s, z17.s
mul z24.s, p7/m, z24.s, z4.s
uzp1 z17.s, z24.s, z24.s
uzp2 z24.s, z24.s, z24.s
add z8.s, z17.s, z24.s
str z8, [x3]
addvl x3, sp, #0x1c
add x3, x3, #0x40
ldr z10, [x3]
sub z7.s, z17.s, z24.s
movprfx z11, z10
mul z11.s, p7/m, z11.s, z28.s
ptrue p5.s
addp z11.s, p5/m, z11.s, z11.s
addvl x3, sp, #0x1d
add x3, x3, #0x40
ldr z8, [x3]
mul z28.s, p7/m, z28.s, z8.s
addp z28.s, p5/m, z28.s, z28.s
add x3, x0, #0x100
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z14.h}, p7/z, [x3]
zip1 z16.d, z24.d, z14.d
add x3, x0, #0x1c0
zip2 z24.d, z24.d, z14.d
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z17.d, z13.d
zip2 z17.d, z17.d, z13.d
zip1 z5.d, z16.d, z14.d
zip2 z3.d, z16.d, z14.d
zip1 z16.d, z24.d, z17.d
revh z2.d, p6/m, z16.d
zip2 z24.d, z24.d, z17.d
revh z1.d, p6/m, z24.d
rev z24.h, z20.h
rev z23.h, z23.h
rev z26.h, z26.h
rev z29.h, z29.h
zip1 z20.d, z26.d, z24.d
zip2 z26.d, z26.d, z24.d
zip1 z24.d, z29.d, z23.d
zip2 z29.d, z29.d, z23.d
zip1 z23.d, z20.d, z24.d
zip1 z16.d, z26.d, z29.d
zip2 z20.d, z20.d, z24.d
revh z16.d, p6/m, z16.d
zip2 z26.d, z26.d, z29.d
revh z29.d, p6/m, z26.d
addvl x3, sp, #8
mov z26.d, z23.d
saddlb z17.s, z5.h, z23.h
add x3, x3, #0x40
mov z23.d, z29.d
saddlb z29.s, z1.h, z29.h
add z17.s, z17.s, z29.s
str z5, [x3]
ldr z29, [x3]
addvl x3, sp, #0xc
saddlb z14.s, z3.h, z20.h
saddlt z24.s, z2.h, z16.h
add x3, x3, #0x40
str z26, [x3]
ldr z0, [x3]
addvl x3, sp, #0xb
saddlt z13.s, z29.h, z0.h
saddlt z29.s, z1.h, z23.h
add x3, x3, #0x40
str z1, [x3]
add z13.s, z13.s, z29.s
addvl x3, sp, #0xd
saddlb z29.s, z2.h, z16.h
add z14.s, z14.s, z29.s
add x3, x3, #0x40
str z23, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
str z3, [x3]
ldr z0, [x3]
addvl x3, sp, #0xa
saddlt z29.s, z0.h, z20.h
add z24.s, z29.s, z24.s
add x3, x3, #0x40
str z2, [x3]
revw z14.d, p6/m, z14.d
revw z24.d, p6/m, z24.d
zip1 z29.s, z17.s, z13.s
zip2 z17.s, z17.s, z13.s
zip1 z12.s, z24.s, z14.s
zip2 z24.s, z24.s, z14.s
add z29.s, z29.s, z12.s
add z24.s, z17.s, z24.s
uzp2 z17.d, z29.d, z24.d
revw z17.d, p6/m, z17.d
uzp1 z29.d, z29.d, z24.d
mov z23.d, z10.d
add z24.s, z17.s, z29.s
sub z29.s, z29.s, z17.s
mul z24.s, p7/m, z24.s, z4.s
movprfx z12, z10
mul z12.s, p7/m, z12.s, z29.s
uzp1 z17.s, z24.s, z24.s
uzp2 z24.s, z24.s, z24.s
add z1.s, z17.s, z24.s
sub z26.s, z17.s, z24.s
addp z12.s, p5/m, z12.s, z12.s
mul z29.s, p7/m, z29.s, z8.s
addp z29.s, p5/m, z29.s, z29.s
add x3, x0, #0x200
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x240
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z24.d, z13.d
add x3, x0, #0x2c0
ld1h {z10.h}, p7/z, [x3]
zip2 z24.d, z24.d, z13.d
zip1 z13.d, z17.d, z10.d
zip2 z17.d, z17.d, z10.d
zip1 z0.d, z14.d, z13.d
zip2 z10.d, z14.d, z13.d
zip1 z14.d, z24.d, z17.d
revh z5.d, p6/m, z14.d
zip2 z24.d, z24.d, z17.d
revh z17.d, p6/m, z24.d
rev z19.h, z19.h
rev z24.h, z21.h
rev z30.h, z30.h
rev z22.h, z22.h
zip1 z21.d, z30.d, z19.d
zip2 z30.d, z30.d, z19.d
zip1 z19.d, z22.d, z24.d
zip2 z22.d, z22.d, z24.d
zip1 z14.d, z21.d, z19.d
zip2 z21.d, z21.d, z19.d
zip1 z19.d, z30.d, z22.d
revh z19.d, p6/m, z19.d
mov z3.d, z19.d
zip2 z30.d, z30.d, z22.d
revh z30.d, p6/m, z30.d
addvl x3, sp, #0xe
mov z2.d, z30.d
saddlb z30.s, z17.h, z30.h
add x3, x3, #0x40
saddlb z19.s, z0.h, z14.h
add z19.s, z19.s, z30.s
str z0, [x3]
ldr z30, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
str z14, [x3]
ldr z22, [x3]
addvl x3, sp, #0x11
saddlt z14.s, z30.h, z22.h
saddlt z30.s, z17.h, z2.h
add x3, x3, #0x40
str z17, [x3]
add z14.s, z14.s, z30.s
addvl x3, sp, #0x14
saddlb z30.s, z5.h, z3.h
saddlb z17.s, z10.h, z21.h
add x3, x3, #0x40
str z2, [x3]
add z17.s, z17.s, z30.s
addvl x3, sp, #0xf
saddlt z22.s, z5.h, z3.h
add x3, x3, #0x40
str z10, [x3]
ldr z30, [x3]
addvl x3, sp, #0x10
saddlt z30.s, z30.h, z21.h
add z22.s, z30.s, z22.s
add x3, x3, #0x40
str z5, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
str z3, [x3]
revw z17.d, p6/m, z17.d
revw z22.d, p6/m, z22.d
zip1 z30.s, z19.s, z14.s
zip2 z19.s, z19.s, z14.s
zip1 z13.s, z22.s, z17.s
zip2 z22.s, z22.s, z17.s
add z30.s, z30.s, z13.s
add z22.s, z19.s, z22.s
uzp2 z19.d, z30.d, z22.d
revw z19.d, p6/m, z19.d
uzp1 z30.d, z30.d, z22.d
add z22.s, z19.s, z30.s
sub z30.s, z30.s, z19.s
mul z22.s, p7/m, z22.s, z4.s
movprfx z13, z23
mul z13.s, p7/m, z13.s, z30.s
uzp1 z5.s, z22.s, z22.s
uzp2 z22.s, z22.s, z22.s
add z2.s, z5.s, z22.s
sub z5.s, z5.s, z22.s
addp z13.s, p5/m, z13.s, z13.s
mov z24.d, z8.d
mul z30.s, p7/m, z30.s, z8.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x300
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x340
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z17.h}, p7/z, [x3]
zip1 z14.d, z19.d, z17.d
add x3, x0, #0x3c0
ld1h {z10.h}, p7/z, [x3]
zip2 z19.d, z19.d, z17.d
zip1 z17.d, z22.d, z10.d
zip2 z22.d, z22.d, z10.d
zip1 z8.d, z14.d, z17.d
zip2 z0.d, z14.d, z17.d
zip1 z10.d, z19.d, z22.d
revh z14.d, p6/m, z10.d
zip2 z19.d, z19.d, z22.d
revh z19.d, p6/m, z19.d
rev z18.h, z18.h
rev z25.h, z25.h
rev z27.h, z27.h
rev z31.h, z31.h
zip1 z22.d, z27.d, z18.d
zip2 z27.d, z27.d, z18.d
zip1 z18.d, z31.d, z25.d
zip2 z31.d, z31.d, z25.d
zip1 z25.d, z22.d, z18.d
zip1 z17.d, z27.d, z31.d
zip2 z22.d, z22.d, z18.d
revh z17.d, p6/m, z17.d
zip2 z27.d, z27.d, z31.d
revh z27.d, p6/m, z27.d
addvl x3, sp, #0x15
saddlb z31.s, z19.h, z27.h
saddlb z9.s, z8.h, z25.h
add x3, x3, #0x40
add z9.s, z9.s, z31.s
str z8, [x3]
ldr z31, [x3]
addvl x3, sp, #0x19
saddlb z8.s, z0.h, z22.h
add x3, x3, #0x40
str z25, [x3]
ldr z25, [x3]
addvl x3, sp, #0x18
saddlt z3.s, z31.h, z25.h
saddlt z31.s, z19.h, z27.h
add x3, x3, #0x40
str z19, [x3]
add z3.s, z3.s, z31.s
addvl x3, sp, #0x1a
saddlb z31.s, z14.h, z17.h
add z8.s, z8.s, z31.s
add x3, x3, #0x40
str z27, [x3]
saddlt z18.s, z14.h, z17.h
addvl x3, sp, #0x16
add x3, x3, #0x40
str z0, [x3]
ldr z31, [x3]
addvl x3, sp, #0x17
saddlt z31.s, z31.h, z22.h
add z18.s, z31.s, z18.s
add x3, x3, #0x40
str z14, [x3]
revw z8.d, p6/m, z8.d
revw z18.d, p6/m, z18.d
zip1 z31.s, z9.s, z3.s
zip2 z9.s, z9.s, z3.s
zip1 z0.s, z18.s, z8.s
zip2 z18.s, z18.s, z8.s
add z31.s, z31.s, z0.s
add z18.s, z9.s, z18.s
uzp2 z9.d, z31.d, z18.d
revw z9.d, p6/m, z9.d
uzp1 z31.d, z31.d, z18.d
add z18.s, z9.s, z31.s
mul z18.s, p7/m, z18.s, z4.s
uzp1 z4.s, z18.s, z18.s
uzp2 z18.s, z18.s, z18.s
sub z31.s, z31.s, z9.s
add z3.s, z4.s, z18.s
sub z4.s, z4.s, z18.s
movprfx z18, z23
mul z18.s, p7/m, z18.s, z31.s
addp z18.s, p5/m, z18.s, z18.s
mul z31.s, p7/m, z31.s, z24.s
addp z31.s, p5/m, z31.s, z31.s
addvl x3, sp, #0x1b
mov z9.d, z1.d
mov z0.d, z2.d
add x3, x3, #0x40
ldr z8, [x3]
tbl z8.s, {z8.s, z9.s}, z15.s
add x3, sp, #0x40
rshrnb z8.h, z8.s, #0xb
uzp1 z8.h, z8.h, z8.h
mov z1.d, z3.d
uzp1 z9.s, z12.s, z12.s
tbl z0.s, {z0.s, z1.s}, z15.s
uzp1 z2.s, z13.s, z13.s
uzp1 z3.s, z18.s, z18.s
mov z12.d, z7.d
tbl z2.s, {z2.s, z3.s}, z15.s
rshrnb z0.h, z0.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z0.h, z0.h, z0.h
uzp1 z2.h, z2.h, z2.h
stp q8, q0, [x1]
uzp1 z8.s, z11.s, z11.s
tbl z8.s, {z8.s, z9.s}, z15.s
rshrnb z8.h, z8.s, #0xb
uzp1 z8.h, z8.h, z8.h
stp q8, q2, [x1, #0x200]
ldr z7, [x3]
addvl x3, sp, #4
mov z13.d, z26.d
tbl z12.s, {z12.s, z13.s}, z15.s
add x3, x3, #0x40
mov z13.d, z4.d
ldr z4, [x3]
addvl x3, sp, #1
rshrnb z12.h, z12.s, #0xb
uzp1 z12.h, z12.h, z12.h
add x3, x3, #0x40
str q12, [x1, #0x400]
mov z12.d, z5.d
sub z5.h, z7.h, z4.h
ldr z7, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
ldr z4, [x3]
tbl z12.s, {z12.s, z13.s}, z15.s
addvl x3, sp, #2
rshrnb z12.h, z12.s, #0xb
uzp1 z12.h, z12.h, z12.h
uzp1 z13.s, z29.s, z29.s
add x3, x3, #0x40
str q12, [x1, #0x410]
uzp1 z12.s, z28.s, z28.s
tbl z12.s, {z12.s, z13.s}, z15.s
rshrnb z12.h, z12.s, #0xb
uzp1 z12.h, z12.h, z12.h
str q12, [x1, #0x600]
uzp1 z29.s, z31.s, z31.s
ldr z12, [x3]
addvl x3, sp, #6
uzp1 z28.s, z30.s, z30.s
add x3, x3, #0x40
ldr z9, [x3]
tbl z28.s, {z28.s, z29.s}, z15.s
sub z8.h, z7.h, z4.h
rshrnb z28.h, z28.s, #0xb
sub z31.h, z12.h, z9.h
uzp1 z28.h, z28.h, z28.h
str q28, [x1, #0x610]
revh z4.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z31, [x3]
sub z31.h, z13.h, z31.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z7, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z29, [x3]
sub z1.h, z7.h, z29.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z7, [x3]
sub z2.h, z7.h, z20.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z30.h, z16.h
revh z0.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z29, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z23, [x3]
sub z31.h, z29.h, z23.h
revh z26.d, p6/m, z31.d
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z7, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z28, [x3]
sub z10.h, z7.h, z28.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z7, [x3]
sub z27.h, z7.h, z21.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z28, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z19, [x3]
sub z31.h, z28.h, z19.h
revh z14.d, p6/m, z31.d
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z18, [x3]
sub z31.h, z25.h, z18.h
revh z19.d, p6/m, z31.d
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z7, [x3]
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z30, [x3]
sub z24.h, z7.h, z30.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z7, [x3]
sub z23.h, z7.h, z22.h
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z7, [x3]
sub z31.h, z7.h, z17.h
revh z25.d, p6/m, z31.d
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z11, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z31, [x3]
sub z31.h, z11.h, z31.h
revh z7.d, p6/m, z31.d
addvl x3, sp, #0x1e
movi d31, #0000000000000000
cntb x6
add x3, x3, #0x40
ldr z13, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z13.h[0]
addvl x3, sp, #0x1f
movprfx z18, z31
sdot z18.d, z2.h, z13.h[0]
movprfx z29, z31
sdot z29.d, z27.h, z13.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[0]
cntb x3
sdot z30.d, z5.h, z6.h[0]
sdot z18.d, z1.h, z6.h[0]
lsl x3, x3, #5
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
add x3, sp, x3
sdot z29.d, z10.h, z6.h[0]
sdot z28.d, z24.h, z6.h[0]
add x3, x3, #0x40
ldr z11, [x3]
sdot z29.d, z14.h, z12.h[0]
add x3, x1, #0x40
sdot z18.d, z26.h, z11.h[0]
sdot z30.d, z3.h, z11.h[0]
sdot z29.d, z19.h, z11.h[0]
sdot z28.d, z25.h, z12.h[0]
uzp1 z30.s, z30.s, z18.s
sdot z28.d, z7.h, z11.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z8.h, z13.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[1]
sdot z30.d, z5.h, z6.h[1]
sdot z18.d, z1.h, z6.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z11.h[1]
sdot z18.d, z26.h, z11.h[1]
sdot z29.d, z10.h, z6.h[1]
sdot z28.d, z24.h, z6.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z11.h[1]
sdot z28.d, z7.h, z11.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
rdvl x3, #0x11
lsl x3, x3, #1
lsl x6, x6, #5
add x3, sp, x3
add x3, x3, #0x40
ldr z13, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z13.h[0]
addvl x3, x6, #1
rdvl x6, #0x11
movprfx z18, z31
sdot z18.d, z2.h, z13.h[0]
add x3, x3, #0x40
lsl x6, x6, #1
movprfx z29, z31
sdot z29.d, z27.h, z13.h[0]
add x3, sp, x3
ldr z12, [x3]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[0]
addvl x3, x6, #1
sdot z30.d, z5.h, z12.h[0]
sdot z18.d, z1.h, z12.h[0]
add x3, x3, #0x40
sdot z29.d, z10.h, z12.h[0]
sdot z28.d, z24.h, z12.h[0]
add x3, sp, x3
ldr z11, [x3]
sdot z30.d, z4.h, z11.h[0]
cntb x3, all, mul #9
sdot z18.d, z0.h, z11.h[0]
sdot z29.d, z14.h, z11.h[0]
lsl x3, x3, #2
sdot z28.d, z25.h, z11.h[0]
cntb x6, all, mul #9
add x3, sp, x3
lsl x6, x6, #2
add x3, x3, #0x40
ldr z9, [x3]
sdot z18.d, z26.h, z9.h[0]
add x3, x1, #0x140
sdot z28.d, z7.h, z9.h[0]
sdot z30.d, z3.h, z9.h[0]
sdot z29.d, z19.h, z9.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z8.h, z13.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z13.h[1]
sdot z30.d, z5.h, z12.h[1]
sdot z18.d, z1.h, z12.h[1]
sdot z30.d, z4.h, z11.h[1]
sdot z18.d, z0.h, z11.h[1]
sdot z30.d, z3.h, z9.h[1]
sdot z18.d, z26.h, z9.h[1]
sdot z29.d, z10.h, z12.h[1]
sdot z28.d, z24.h, z12.h[1]
sdot z29.d, z14.h, z11.h[1]
sdot z28.d, z25.h, z11.h[1]
sdot z29.d, z19.h, z9.h[1]
sdot z28.d, z7.h, z9.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x1e0
ld1h {z11.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z11.h[0]
add x3, x2, #0x2e0
ld1h {z12.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z11.h[0]
add x3, x2, #0x3e0
ld1h {z13.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z27.h, z11.h[0]
addvl x3, x6, #1
movprfx z28, z31
sdot z28.d, z23.h, z11.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z9, [x3]
sdot z30.d, z5.h, z9.h[0]
add x3, x1, #0x240
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z1.h, z9.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z29.d, z10.h, z9.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z24.h, z9.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z25.h, z12.h[0]
uzp1 z30.s, z30.s, z18.s
sdot z28.d, z7.h, z13.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z8.h, z11.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z11.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z11.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z11.h[1]
sdot z30.d, z5.h, z9.h[1]
sdot z18.d, z1.h, z9.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z9.h[1]
sdot z28.d, z24.h, z9.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x100
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x200
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x400
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x340
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x420
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x440
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x440
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x540
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x460
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x640
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x180
ld1h {z11.h}, p7/z, [x3]
add x3, x2, #0x280
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x380
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z8.h, z9.h[0]
add x3, x2, #0x480
ld1h {z13.h}, p7/z, [x3]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[0]
add x3, x1, #0x740
movprfx z29, z31
sdot z29.d, z27.h, z9.h[0]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[0]
sdot z30.d, z5.h, z11.h[0]
sdot z18.d, z1.h, z11.h[0]
sdot z30.d, z4.h, z12.h[0]
sdot z18.d, z0.h, z12.h[0]
sdot z30.d, z3.h, z13.h[0]
sdot z18.d, z26.h, z13.h[0]
sdot z29.d, z10.h, z11.h[0]
sdot z28.d, z24.h, z11.h[0]
sdot z29.d, z14.h, z12.h[0]
sdot z28.d, z25.h, z12.h[0]
sdot z29.d, z19.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z8.h, z9.h[1]
movprfx z18, z31
sdot z18.d, z2.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z27.h, z9.h[1]
movprfx z28, z31
sdot z28.d, z23.h, z9.h[1]
sdot z30.d, z5.h, z11.h[1]
sdot z18.d, z1.h, z11.h[1]
sdot z30.d, z4.h, z12.h[1]
sdot z18.d, z0.h, z12.h[1]
sdot z30.d, z3.h, z13.h[1]
sdot z18.d, z26.h, z13.h[1]
sdot z29.d, z10.h, z11.h[1]
sdot z28.d, z24.h, z11.h[1]
sdot z29.d, z14.h, z12.h[1]
sdot z28.d, z25.h, z12.h[1]
sdot z29.d, z19.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
uzp1 z30.s, z30.s, z18.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z4, [x3]
add x3, sp, #0x40
ldr z14, [x3]
add z30.h, z4.h, z14.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z4, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z14, [x3]
add z29.h, z4.h, z14.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z12, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z9, [x3]
add z18.h, z12.h, z9.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z24, [x3]
add z12.h, z13.h, z24.h
addvl x3, sp, #0xc
sub z28.h, z30.h, z12.h
sub z13.h, z29.h, z18.h
add x3, x3, #0x40
ldr z26, [x3]
add z30.h, z30.h, z12.h
addvl x3, sp, #8
add z29.h, z29.h, z18.h
add x3, x3, #0x40
ldr z24, [x3]
add z23.h, z26.h, z24.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z26, [x3]
add z20.h, z20.h, z26.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z2, [x3]
add z16.h, z2.h, z16.h
addvl x3, sp, #0xb
sub z9.h, z20.h, z16.h
add x3, x3, #0x40
ldr z1, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z27, [x3]
add z26.h, z1.h, z27.h
addvl x3, sp, #0x12
sub z11.h, z23.h, z26.h
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z14, [x3]
add z24.h, z24.h, z14.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z14, [x3]
add z21.h, z21.h, z14.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z3, [x3]
add z14.h, z5.h, z3.h
addvl x3, sp, #0x11
sub z5.h, z21.h, z14.h
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z2, [x3]
add z4.h, z25.h, z2.h
add x3, sp, #0x40
str z14, [x3]
sub z8.h, z24.h, z4.h
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z10, [x3]
add z25.h, z25.h, z10.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z10, [x3]
add z22.h, z22.h, z10.h
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z7, [x3]
add z17.h, z7.h, z17.h
addvl x3, sp, #0x18
sub z10.h, z22.h, z17.h
add x3, x3, #0x40
ldr z19, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z27, [x3]
add z27.h, z19.h, z27.h
add x3, x2, #0x4a0
ld1h {z7.h}, p7/z, [x3]
sub z14.h, z25.h, z27.h
add x3, x2, #0x520
ld1h {z3.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
add x3, x1, #0x80
sdot z19.d, z28.h, z7.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
sdot z0.d, z11.h, z7.h[0]
sdot z2.d, z8.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
uzp1 z19.s, z19.s, z0.s
sdot z1.d, z14.h, z7.h[0]
rshrnb z19.h, z19.s, #0xb
uzp1 z2.s, z2.s, z1.s
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x1, #0x180
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[1]
sdot z19.d, z28.h, z7.h[1]
sdot z0.d, z11.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[1]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[1]
sdot z2.d, z8.h, z7.h[1]
sdot z1.d, z14.h, z7.h[1]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z7.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
sdot z19.d, z28.h, z7.h[0]
sdot z0.d, z11.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
sdot z2.d, z8.h, z7.h[0]
sdot z1.d, z14.h, z7.h[0]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x1, #0x380
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[1]
sdot z19.d, z28.h, z7.h[1]
sdot z0.d, z11.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[1]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[1]
sdot z2.d, z8.h, z7.h[1]
sdot z1.d, z14.h, z7.h[1]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z7.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z3.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
add x3, x1, #0x480
sdot z19.d, z28.h, z7.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
sdot z0.d, z11.h, z7.h[0]
sdot z2.d, z8.h, z7.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
uzp1 z19.s, z19.s, z0.s
sdot z1.d, z14.h, z7.h[0]
rshrnb z19.h, z19.s, #0xb
uzp1 z2.s, z2.s, z1.s
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x1, #0x580
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[1]
sdot z19.d, z28.h, z7.h[1]
sdot z0.d, z11.h, z7.h[1]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[1]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[1]
sdot z2.d, z8.h, z7.h[1]
sdot z1.d, z14.h, z7.h[1]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
add x3, x2, #0x500
ld1h {z7.h}, p7/z, [x3]
add x3, x2, #0x580
ld1h {z3.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z19, z31
sdot z19.d, z13.h, z3.h[0]
movprfx z0, z31
sdot z0.d, z9.h, z3.h[0]
sdot z19.d, z28.h, z7.h[0]
sdot z0.d, z11.h, z7.h[0]
movprfx z2, z31
sdot z2.d, z5.h, z3.h[0]
movprfx z1, z31
sdot z1.d, z10.h, z3.h[0]
sdot z2.d, z8.h, z7.h[0]
sdot z1.d, z14.h, z7.h[0]
uzp1 z19.s, z19.s, z0.s
uzp1 z2.s, z2.s, z1.s
rshrnb z19.h, z19.s, #0xb
rshrnb z2.h, z2.s, #0xb
uzp1 z19.h, z19.h, z2.h
st1h {z19.h}, p7, [x3]
movprfx z19, z31
sdot z19.d, z13.h, z3.h[1]
add x3, x1, #0x780
sdot z19.d, z28.h, z7.h[1]
movprfx z13, z31
sdot z13.d, z5.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z9.h, z3.h[1]
sdot z13.d, z8.h, z7.h[1]
sdot z28.d, z11.h, z7.h[1]
movprfx z11, z31
sdot z11.d, z10.h, z3.h[1]
uzp1 z19.s, z19.s, z28.s
sdot z11.d, z14.h, z7.h[1]
rshrnb z19.h, z19.s, #0xb
uzp1 z13.s, z13.s, z11.s
rshrnb z13.h, z13.s, #0xb
uzp1 z19.h, z19.h, z13.h
st1h {z19.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z23.h, z23.h, z26.h
add z20.h, z20.h, z16.h
revh z20.d, p6/m, z20.d
add x3, sp, #0x40
ldr z14, [x3]
sub z23.h, z23.h, z20.h
add z24.h, z24.h, z4.h
add z21.h, z21.h, z14.h
revh z21.d, p6/m, z21.d
sub z24.h, z24.h, z21.h
add z25.h, z25.h, z27.h
add z22.h, z22.h, z17.h
revh z22.d, p6/m, z22.d
add x3, x2, #0x5a0
ld1h {z14.h}, p7/z, [x3]
sub z25.h, z25.h, z22.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z14.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z14.h[0]
movprfx z27, z31
sdot z27.d, z25.h, z14.h[0]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z14.h[1]
movprfx z26, z31
sdot z26.d, z23.h, z14.h[1]
movprfx z27, z31
sdot z27.d, z25.h, z14.h[1]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[1]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x2, #0x5c0
ld1h {z14.h}, p7/z, [x3]
add x3, x1, #0x500
movprfx z29, z31
sdot z29.d, z30.h, z14.h[0]
movprfx z26, z31
sdot z26.d, z23.h, z14.h[0]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[0]
movprfx z27, z31
sdot z27.d, z25.h, z14.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z24.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z14.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z23.h, z14.h[1]
add x0, x0, #0x400
sdot z31.d, z25.h, z14.h[1]
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
rdvl x12, #0x13
lsl x12, x12, #1
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
