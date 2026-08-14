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
add x3, x3, #0xd30
add x11, x3, #0x20
add x5, x2, x2, lsl #1
add x7, x2, x2, lsl #2
lsl x18, x2, #3
stp x29, x30, [sp]
mov x29, sp
lsl x8, x2, #4
ld1w {z31.s}, p7/z, [x11]
addvl x11, sp, #2
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
add x11, x3, #0x60
ld1w {z31.s}, p7/z, [x11]
addvl x11, sp, #3
add x5, x2, x5, lsl #2
add x11, x11, #0x70
str z31, [x11]
lsl x4, x2, #5
add x11, x3, #0x180
ld1h {z4.h}, p7/z, [x11]
add x19, x0, x2, lsl #1
add x11, x3, #0x280
ld1h {z3.h}, p7/z, [x11]
add x30, x0, x2, lsl #2
add x11, x3, #0x380
ld1h {z2.h}, p7/z, [x11]
add x2, x0, x2, lsl #3
add x11, x3, #0xa0
ld1h {z6.h}, p7/z, [x11]
add x14, x0, x9, lsl #1
add x11, x3, #0x1a0
ld1h {z5.h}, p7/z, [x11]
add x10, x0, x10, lsl #1
add x11, x3, #0x2a0
ld1h {z0.h}, p7/z, [x11]
add x7, x0, x7, lsl #1
add x11, x3, #0x3a0
ld1h {z31.h}, p7/z, [x11]
add x5, x0, x5, lsl #1
addvl x11, sp, #0x1b
add x9, x0, x9, lsl #2
add x11, x11, #0x70
str z31, [x11]
add x8, x0, x8, lsl #1
add x11, x3, #0xc0
ld1h {z31.h}, p7/z, [x11]
add x20, x1, #0x40
addvl x11, sp, #0x1c
add x18, x18, x2
add x11, x11, #0x70
add x21, x3, #0x80
str z31, [x11]
mov x6, #0
add x11, x3, #0x100
ld1h {z31.h}, p7/z, [x11]
addvl x11, sp, #0x1d
add x11, x11, #0x70
str z31, [x11]
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
addvl x11, sp, #0x12
rev z30.h, z30.h
add x11, x11, #0x70
sub z25.h, z1.h, z30.h
str z25, [x11]
add x11, x17, #0x20
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
rev z30.h, z30.h
sub z14.h, z11.h, z30.h
add x11, x11, #0x70
str z14, [x11]
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
addvl x11, sp, #0x14
ld1h {z12.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z29.h, z12.h, z30.h
str z29, [x11]
add x11, x14, #0x20
add z12.h, z12.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x15
ld1h {z13.h}, p7/z, [x14]
rev z30.h, z30.h
add x11, x11, #0x70
sub z26.h, z13.h, z30.h
str z26, [x11]
add x11, x18, x6
ld1h {z29.h}, p7/z, [x11]
add z13.h, z13.h, z30.h
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x16
sub z15.h, z29.h, z30.h
add z29.h, z29.h, z30.h
add x11, x11, #0x70
str z15, [x11]
ld1h {z25.h}, p7/z, [x10]
add x11, x10, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x17
sub z23.h, z25.h, z30.h
add z25.h, z25.h, z30.h
add x11, x11, #0x70
str z23, [x11]
ld1h {z14.h}, p7/z, [x13]
add x11, x13, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x18
sub z17.h, z14.h, z30.h
add z14.h, z14.h, z30.h
add x11, x11, #0x70
str z17, [x11]
ld1h {z15.h}, p7/z, [x7]
add x11, x7, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x12, #0x20
sub z7.h, z15.h, z30.h
add z15.h, z15.h, z30.h
ld1h {z30.h}, p7/z, [x12]
ld1h {z26.h}, p7/z, [x11]
add x11, x5, #0x20
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x19
rev z26.h, z26.h
add x11, x11, #0x70
sub z23.h, z30.h, z26.h
rev z17.h, z17.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
sub z16.h, z26.h, z17.h
str z16, [x11]
add x11, x9, #0x20
add z26.h, z26.h, z17.h
ld1h {z17.h}, p7/z, [x11]
add x11, x8, #0x20
rev z17.h, z17.h
ld1h {z10.h}, p7/z, [x11]
rev z10.h, z10.h
ld1h {z16.h}, p7/z, [x9]
sub z8.h, z16.h, z17.h
add z16.h, z16.h, z17.h
ld1h {z17.h}, p7/z, [x8]
sub z9.h, z17.h, z10.h
add z17.h, z17.h, z10.h
zip1 z10.d, z31.d, z1.d
zip2 z31.d, z31.d, z1.d
zip1 z1.d, z27.d, z11.d
zip2 z27.d, z27.d, z11.d
zip1 z11.d, z10.d, z1.d
add x11, sp, #0x70
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
addvl x11, sp, #0xb
saddlb z11.s, z11.h, z27.h
saddlt z1.s, z1.h, z27.h
add x11, x11, #0x70
str z27, [x11]
mov z27.d, z10.d
addvl x11, sp, #9
saddlb z10.s, z10.h, z31.h
add x11, x11, #0x70
str z27, [x11]
ldr z27, [x11]
addvl x11, sp, #0xa
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
addvl x11, sp, #2
uzp1 z31.d, z31.d, z27.d
add z27.s, z11.s, z31.s
sub z31.s, z31.s, z11.s
ld1w {z11.s}, p7/z, [x3]
mul z27.s, p7/m, z27.s, z11.s
uzp1 z10.s, z27.s, z27.s
uzp2 z27.s, z27.s, z27.s
add x11, x11, #0x70
add z1.s, z10.s, z27.s
sub z22.s, z10.s, z27.s
ldr z27, [x11]
ptrue p5.s
mul z27.s, p7/m, z27.s, z31.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #3
uzp1 z10.s, z27.s, z27.s
add x11, x11, #0x70
ldr z27, [x11]
mul z31.s, p7/m, z31.s, z27.s
addp z31.s, p5/m, z31.s, z31.s
addvl x11, sp, #0x1a
uzp1 z31.s, z31.s, z31.s
zip1 z27.d, z24.d, z13.d
add x11, x11, #0x70
str z31, [x11]
zip1 z31.d, z28.d, z12.d
addvl x11, sp, #1
zip2 z28.d, z28.d, z12.d
zip2 z24.d, z24.d, z13.d
add x11, x11, #0x70
zip2 z13.d, z31.d, z27.d
zip1 z12.d, z31.d, z27.d
zip1 z31.d, z28.d, z24.d
str z13, [x11]
revh z31.d, p6/m, z31.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
addvl x11, sp, #0xc
saddlb z27.s, z12.h, z24.h
add x11, x11, #0x70
str z12, [x11]
ldr z28, [x11]
addvl x11, sp, #0xe
saddlt z13.s, z28.h, z24.h
add x11, x11, #0x70
str z24, [x11]
addvl x11, sp, #1
add x11, x11, #0x70
ldr z12, [x11]
saddlb z24.s, z12.h, z31.h
ldr z12, [x11]
addvl x11, sp, #0xd
saddlt z28.s, z12.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z24.d, p6/m, z24.d
revw z28.d, p6/m, z28.d
zip1 z31.s, z27.s, z13.s
zip2 z27.s, z27.s, z13.s
zip1 z12.s, z28.s, z24.s
zip2 z28.s, z28.s, z24.s
add z31.s, z31.s, z12.s
add z28.s, z27.s, z28.s
uzp2 z27.d, z31.d, z28.d
revw z27.d, p6/m, z27.d
addvl x11, sp, #2
uzp1 z28.d, z31.d, z28.d
add z31.s, z27.s, z28.s
add x11, x11, #0x70
sub z28.s, z28.s, z27.s
ldr z27, [x11]
mul z31.s, p7/m, z31.s, z11.s
mul z27.s, p7/m, z27.s, z28.s
uzp1 z24.s, z31.s, z31.s
uzp2 z31.s, z31.s, z31.s
add z13.s, z24.s, z31.s
sub z24.s, z24.s, z31.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #3
uzp1 z27.s, z27.s, z27.s
add x11, x11, #0x70
ldr z12, [x11]
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z31.d, z29.d, z14.d
uzp1 z28.s, z28.s, z28.s
zip2 z29.d, z29.d, z14.d
zip1 z14.d, z25.d, z15.d
zip2 z25.d, z25.d, z15.d
zip2 z12.d, z31.d, z14.d
zip1 z15.d, z31.d, z14.d
zip1 z31.d, z29.d, z25.d
revh z14.d, p6/m, z31.d
mov z31.d, z14.d
zip2 z29.d, z29.d, z25.d
revh z29.d, p6/m, z29.d
addvl x11, sp, #0xf
saddlb z25.s, z15.h, z29.h
add x11, x11, #0x70
str z15, [x11]
ldr z15, [x11]
addvl x11, sp, #4
saddlt z14.s, z15.h, z29.h
saddlb z15.s, z12.h, z31.h
add x11, x11, #0x70
str z29, [x11]
addvl x11, sp, #0x10
add x11, x11, #0x70
str z12, [x11]
ldr z12, [x11]
addvl x11, sp, #0x11
saddlt z29.s, z12.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z15.d, p6/m, z15.d
revw z29.d, p6/m, z29.d
zip1 z31.s, z25.s, z14.s
zip2 z25.s, z25.s, z14.s
zip1 z12.s, z29.s, z15.s
zip2 z29.s, z29.s, z15.s
add z31.s, z31.s, z12.s
add z29.s, z25.s, z29.s
uzp2 z25.d, z31.d, z29.d
revw z25.d, p6/m, z25.d
addvl x11, sp, #2
uzp1 z29.d, z31.d, z29.d
add z31.s, z25.s, z29.s
add x11, x11, #0x70
sub z29.s, z29.s, z25.s
ldr z25, [x11]
mul z31.s, p7/m, z31.s, z11.s
mul z25.s, p7/m, z25.s, z29.s
uzp1 z15.s, z31.s, z31.s
uzp2 z31.s, z31.s, z31.s
add z14.s, z15.s, z31.s
sub z15.s, z15.s, z31.s
addp z25.s, p5/m, z25.s, z25.s
addvl x11, sp, #3
uzp1 z25.s, z25.s, z25.s
add x11, x11, #0x70
ldr z12, [x11]
mul z29.s, p7/m, z29.s, z12.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z31.d, z30.d, z16.d
uzp1 z29.s, z29.s, z29.s
zip2 z30.d, z30.d, z16.d
zip1 z16.d, z26.d, z17.d
zip2 z26.d, z26.d, z17.d
zip2 z12.d, z31.d, z16.d
zip1 z17.d, z31.d, z16.d
zip1 z31.d, z30.d, z26.d
revh z16.d, p6/m, z31.d
mov z31.d, z16.d
zip2 z30.d, z30.d, z26.d
revh z26.d, p6/m, z30.d
addvl x11, sp, #5
mov z16.d, z26.d
saddlb z26.s, z17.h, z26.h
add x11, x11, #0x70
str z17, [x11]
ldr z30, [x11]
addvl x11, sp, #8
saddlb z17.s, z12.h, z31.h
add x11, x11, #0x70
str z16, [x11]
saddlt z16.s, z30.h, z16.h
addvl x11, sp, #6
add x11, x11, #0x70
str z12, [x11]
ldr z12, [x11]
addvl x11, sp, #7
saddlt z30.s, z12.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z17.d, p6/m, z17.d
revw z30.d, p6/m, z30.d
zip1 z31.s, z26.s, z16.s
zip2 z26.s, z26.s, z16.s
zip1 z12.s, z30.s, z17.s
zip2 z30.s, z30.s, z17.s
add z31.s, z31.s, z12.s
add z30.s, z26.s, z30.s
uzp2 z26.d, z31.d, z30.d
revw z26.d, p6/m, z26.d
addvl x11, sp, #2
uzp1 z31.d, z31.d, z30.d
add z30.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
mul z30.s, p7/m, z30.s, z11.s
uzp1 z26.s, z30.s, z30.s
uzp2 z30.s, z30.s, z30.s
add x11, x11, #0x70
add z17.s, z26.s, z30.s
sub z26.s, z26.s, z30.s
ldr z30, [x11]
mul z30.s, p7/m, z30.s, z31.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #3
uzp1 z30.s, z30.s, z30.s
add x11, x11, #0x70
ldr z12, [x11]
mul z31.s, p7/m, z31.s, z12.s
addp z31.s, p5/m, z31.s, z31.s
addvl x11, sp, #0x1a
rshrnb z30.h, z30.s, #4
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
rshrnb z1.h, z1.s, #4
rshrnb z13.h, z13.s, #4
uzp1 z1.h, z1.h, z1.h
uzp1 z13.h, z13.h, z13.h
rshrnb z14.h, z14.s, #4
rshrnb z17.h, z17.s, #4
uzp1 z14.h, z14.h, z14.h
uzp1 z17.h, z17.h, z17.h
stp d1, d13, [x1]
rshrnb z25.h, z25.s, #4
uzp1 z25.h, z25.h, z25.h
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
uzp1 z31.s, z31.s, z31.s
stp d14, d17, [x1, #0x10]
rshrnb z27.h, z27.s, #4
rshrnb z24.h, z24.s, #4
uzp1 z27.h, z27.h, z27.h
uzp1 z24.h, z24.h, z24.h
rshrnb z26.h, z26.s, #4
str d30, [x1, #0x218]
rshrnb z30.h, z22.s, #4
ldr z22, [x11]
addvl x11, sp, #0x12
str d25, [x1, #0x210]
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
ldr z25, [x11]
uzp1 z26.h, z26.h, z26.h
addvl x11, sp, #0x13
rshrnb z29.h, z29.s, #4
rshrnb z31.h, z31.s, #4
add x11, x11, #0x70
ldr z14, [x11]
str d30, [x1, #0x400]
addvl x11, sp, #0x14
rshrnb z30.h, z22.s, #4
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
str d30, [x1, #0x600]
trn2 z30.d, z18.d, z14.d
str d28, [x1, #0x608]
zip1 z28.d, z18.d, z14.d
trn1 z18.d, z18.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x15
uzp1 z29.h, z29.h, z29.h
add x11, x11, #0x70
ldr z13, [x11]
uzp1 z31.h, z31.h, z31.h
addvl x11, sp, #0x18
str d27, [x1, #0x208]
rshrnb z15.h, z15.s, #4
add x11, x11, #0x70
str d24, [x1, #0x408]
uzp1 z15.h, z15.h, z15.h
str d26, [x1, #0x418]
rshrnb z10.h, z10.s, #4
uzp1 z10.h, z10.h, z10.h
str d29, [x1, #0x610]
zip1 z29.d, z19.d, z25.d
zip1 z26.d, z29.d, z28.d
zip1 z28.d, z20.d, z13.d
str d31, [x1, #0x618]
trn2 z31.d, z19.d, z25.d
zip1 z27.d, z31.d, z30.d
zip2 z24.d, z31.d, z30.d
trn2 z30.d, z20.d, z13.d
trn1 z20.d, z20.d, z13.d
ldr z13, [x11]
addvl x11, sp, #0x16
add x11, x11, #0x70
zip1 z29.d, z21.d, z14.d
str d15, [x1, #0x410]
ldr z15, [x11]
addvl x11, sp, #0x17
trn1 z19.d, z19.d, z25.d
add x11, x11, #0x70
zip2 z25.d, z19.d, z18.d
zip1 z18.d, z29.d, z28.d
zip1 z29.d, z15.d, z13.d
trn2 z31.d, z21.d, z14.d
trn1 z21.d, z21.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x19
zip1 z28.d, z14.d, z7.d
zip1 z16.d, z29.d, z28.d
trn1 z29.d, z14.d, z7.d
zip1 z19.d, z31.d, z30.d
zip2 z21.d, z21.d, z20.d
trn1 z22.d, z15.d, z13.d
zip2 z20.d, z31.d, z30.d
zip2 z22.d, z22.d, z29.d
trn2 z31.d, z15.d, z13.d
trn2 z30.d, z14.d, z7.d
zip1 z29.d, z23.d, z8.d
add x11, x11, #0x70
ldr z14, [x11]
zip1 z17.d, z31.d, z30.d
zip2 z11.d, z31.d, z30.d
zip1 z28.d, z14.d, z9.d
trn2 z30.d, z14.d, z9.d
zip1 z7.d, z29.d, z28.d
trn2 z31.d, z23.d, z8.d
add x11, x1, #0x40
trn1 z23.d, z23.d, z8.d
trn1 z29.d, z14.d, z9.d
str d10, [x1, #0x200]
zip2 z9.d, z23.d, z29.d
zip1 z10.d, z31.d, z30.d
zip2 z8.d, z31.d, z30.d
ld1h {z15.h}, p7/z, [x21]
movi d31, #0000000000000000
movprfx z30, z31
sdot z30.d, z27.h, z4.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[0]
sdot z30.d, z26.h, z15.h[0]
sdot z23.d, z18.h, z15.h[0]
sdot z30.d, z25.h, z3.h[0]
sdot z23.d, z21.h, z3.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z23.d, z20.h, z2.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[0]
sdot z29.d, z16.h, z15.h[0]
sdot z28.d, z7.h, z15.h[0]
sdot z29.d, z22.h, z3.h[0]
sdot z28.d, z9.h, z3.h[0]
sdot z29.d, z11.h, z2.h[0]
sdot z28.d, z8.h, z2.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z4.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[1]
sdot z30.d, z26.h, z15.h[1]
sdot z23.d, z18.h, z15.h[1]
sdot z30.d, z25.h, z3.h[1]
sdot z23.d, z21.h, z3.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z23.d, z20.h, z2.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[1]
sdot z29.d, z16.h, z15.h[1]
sdot z28.d, z7.h, z15.h[1]
sdot z29.d, z22.h, z3.h[1]
sdot z28.d, z9.h, z3.h[1]
sdot z29.d, z11.h, z2.h[1]
sdot z28.d, z8.h, z2.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #0x1b
movprfx z30, z31
sdot z30.d, z27.h, z5.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z5.h[0]
add x11, x11, #0x70
ldr z15, [x11]
sdot z30.d, z26.h, z6.h[0]
add x11, x1, #0x140
sdot z30.d, z25.h, z0.h[0]
sdot z23.d, z18.h, z6.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z21.h, z0.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z5.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z6.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z5.h[0]
sdot z29.d, z22.h, z0.h[0]
sdot z28.d, z7.h, z6.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z9.h, z0.h[0]
uzp1 z30.s, z30.s, z23.s
sdot z28.d, z8.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z27.h, z5.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z5.h[1]
sdot z30.d, z26.h, z6.h[1]
sdot z23.d, z18.h, z6.h[1]
sdot z30.d, z25.h, z0.h[1]
sdot z23.d, z21.h, z0.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z5.h[1]
sdot z29.d, z16.h, z6.h[1]
sdot z28.d, z7.h, z6.h[1]
sdot z29.d, z22.h, z0.h[1]
sdot z28.d, z9.h, z0.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x1c0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x2c0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x3, #0x3c0
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
addvl x11, sp, #0x1c
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[0]
add x11, x11, #0x70
ldr z12, [x11]
sdot z30.d, z26.h, z12.h[0]
add x11, x1, #0x240
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z18.h, z12.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z29.d, z16.h, z12.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z7.h, z12.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z9.h, z14.h[0]
uzp1 z30.s, z30.s, z23.s
sdot z28.d, z8.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z29.s, z29.s, z28.s
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
sdot z28.d, z10.h, z13.h[1]
sdot z30.d, z26.h, z12.h[1]
sdot z23.d, z18.h, z12.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z12.h[1]
sdot z28.d, z7.h, z12.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
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
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z28.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
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
addvl x11, sp, #0x1d
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
add x11, x11, #0x70
ldr z12, [x11]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[0]
add x11, x1, #0x440
sdot z30.d, z26.h, z12.h[0]
sdot z23.d, z18.h, z12.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z12.h[0]
sdot z28.d, z7.h, z12.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z27.h, z13.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[1]
sdot z30.d, z26.h, z12.h[1]
sdot z23.d, z18.h, z12.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z12.h[1]
sdot z28.d, z7.h, z12.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
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
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x540
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z28.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
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
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x640
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z28.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
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
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x740
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z27.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z29.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z29.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z29.d, z20.h, z15.h[1]
sdot z28.d, z16.h, z13.h[1]
sdot z27.d, z7.h, z13.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z27.d, z9.h, z14.h[1]
sdot z28.d, z11.h, z15.h[1]
sdot z27.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
uzp1 z28.s, z28.s, z27.s
rshrnb z30.h, z30.s, #4
rshrnb z28.h, z28.s, #4
uzp1 z30.h, z30.h, z28.h
st1h {z30.h}, p7, [x11]
add x11, sp, #0x70
ldr z18, [x11]
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z18.h, z13.h
addvl x11, sp, #9
add x11, x11, #0x70
ldr z17, [x11]
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z16, [x11]
sub z22.h, z17.h, z16.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #1
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0xf
add x11, x11, #0x70
ldr z8, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z30, [x11]
sub z27.h, z8.h, z30.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #0x11
add x11, x11, #0x70
ldr z1, [x11]
sub z26.h, z7.h, z1.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z21, [x11]
addvl x11, sp, #8
add x11, x11, #0x70
ldr z28, [x11]
sub z29.h, z21.h, z28.h
addvl x11, sp, #6
add x11, x11, #0x70
ldr z21, [x11]
addvl x11, sp, #7
add x11, x11, #0x70
ldr z28, [x11]
sub z28.h, z21.h, z28.h
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
add z30.h, z1.h, z7.h
add x11, x11, #0x70
ldr z29, [x11]
add z29.h, z29.h, z8.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #8
sub z29.h, z29.h, z30.h
add x11, x11, #0x70
ldr z16, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z25, [x11]
add z30.h, z16.h, z25.h
addvl x11, sp, #7
add x11, x11, #0x70
ldr z26, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
ldr z25, [x11]
add z26.h, z26.h, z25.h
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
addvl x11, sp, #0x12
rev z30.h, z30.h
add x11, x11, #0x70
sub z25.h, z1.h, z30.h
str z25, [x11]
add x11, x17, #0x20
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x13
rev z30.h, z30.h
sub z14.h, z11.h, z30.h
add x11, x11, #0x70
str z14, [x11]
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
addvl x11, sp, #0x14
ld1h {z12.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z29.h, z12.h, z30.h
str z29, [x11]
add x11, x14, #0x20
add z12.h, z12.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x15
ld1h {z13.h}, p7/z, [x14]
rev z30.h, z30.h
add x11, x11, #0x70
sub z26.h, z13.h, z30.h
str z26, [x11]
add x11, x18, x6
ld1h {z29.h}, p7/z, [x11]
add z13.h, z13.h, z30.h
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x16
sub z15.h, z29.h, z30.h
add z29.h, z29.h, z30.h
add x11, x11, #0x70
str z15, [x11]
ld1h {z25.h}, p7/z, [x10]
add x11, x10, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x17
sub z23.h, z25.h, z30.h
add z25.h, z25.h, z30.h
add x11, x11, #0x70
str z23, [x11]
ld1h {z14.h}, p7/z, [x13]
add x11, x13, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x18
sub z17.h, z14.h, z30.h
add z14.h, z14.h, z30.h
add x11, x11, #0x70
str z17, [x11]
ld1h {z15.h}, p7/z, [x7]
add x11, x7, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x12, #0x20
sub z7.h, z15.h, z30.h
add z15.h, z15.h, z30.h
ld1h {z30.h}, p7/z, [x12]
ld1h {z26.h}, p7/z, [x11]
add x11, x5, #0x20
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x19
rev z26.h, z26.h
add x11, x11, #0x70
sub z23.h, z30.h, z26.h
rev z17.h, z17.h
add z30.h, z30.h, z26.h
ld1h {z26.h}, p7/z, [x5]
sub z16.h, z26.h, z17.h
str z16, [x11]
add x11, x9, #0x20
add z26.h, z26.h, z17.h
ld1h {z17.h}, p7/z, [x11]
add x11, x8, #0x20
rev z17.h, z17.h
ld1h {z10.h}, p7/z, [x11]
rev z10.h, z10.h
ld1h {z16.h}, p7/z, [x9]
sub z8.h, z16.h, z17.h
add z16.h, z16.h, z17.h
ld1h {z17.h}, p7/z, [x8]
sub z9.h, z17.h, z10.h
add z17.h, z17.h, z10.h
zip1 z10.d, z31.d, z1.d
zip2 z31.d, z31.d, z1.d
zip1 z1.d, z27.d, z11.d
zip2 z27.d, z27.d, z11.d
zip1 z11.d, z10.d, z1.d
add x11, sp, #0x70
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
addvl x11, sp, #0xb
saddlb z11.s, z11.h, z27.h
saddlt z1.s, z1.h, z27.h
add x11, x11, #0x70
str z27, [x11]
mov z27.d, z10.d
addvl x11, sp, #9
saddlb z10.s, z10.h, z31.h
add x11, x11, #0x70
str z27, [x11]
ldr z27, [x11]
addvl x11, sp, #0xa
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
addvl x11, sp, #2
uzp1 z31.d, z31.d, z27.d
add z27.s, z11.s, z31.s
sub z31.s, z31.s, z11.s
ld1w {z11.s}, p7/z, [x3]
mul z27.s, p7/m, z27.s, z11.s
uzp1 z10.s, z27.s, z27.s
uzp2 z27.s, z27.s, z27.s
add x11, x11, #0x70
add z1.s, z10.s, z27.s
sub z22.s, z10.s, z27.s
ldr z27, [x11]
ptrue p5.s
mul z27.s, p7/m, z27.s, z31.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #3
uzp1 z10.s, z27.s, z27.s
add x11, x11, #0x70
ldr z27, [x11]
mul z31.s, p7/m, z31.s, z27.s
addp z31.s, p5/m, z31.s, z31.s
addvl x11, sp, #0x1a
uzp1 z31.s, z31.s, z31.s
zip1 z27.d, z24.d, z13.d
add x11, x11, #0x70
str z31, [x11]
zip1 z31.d, z28.d, z12.d
addvl x11, sp, #1
zip2 z28.d, z28.d, z12.d
zip2 z24.d, z24.d, z13.d
add x11, x11, #0x70
zip2 z13.d, z31.d, z27.d
zip1 z12.d, z31.d, z27.d
zip1 z31.d, z28.d, z24.d
str z13, [x11]
revh z31.d, p6/m, z31.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
addvl x11, sp, #0xc
saddlb z27.s, z12.h, z24.h
add x11, x11, #0x70
str z12, [x11]
ldr z28, [x11]
addvl x11, sp, #0xe
saddlt z13.s, z28.h, z24.h
add x11, x11, #0x70
str z24, [x11]
addvl x11, sp, #1
add x11, x11, #0x70
ldr z12, [x11]
saddlb z24.s, z12.h, z31.h
ldr z12, [x11]
addvl x11, sp, #0xd
saddlt z28.s, z12.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z24.d, p6/m, z24.d
revw z28.d, p6/m, z28.d
zip1 z31.s, z27.s, z13.s
zip2 z27.s, z27.s, z13.s
zip1 z12.s, z28.s, z24.s
zip2 z28.s, z28.s, z24.s
add z31.s, z31.s, z12.s
add z28.s, z27.s, z28.s
uzp2 z27.d, z31.d, z28.d
revw z27.d, p6/m, z27.d
addvl x11, sp, #2
uzp1 z28.d, z31.d, z28.d
add z31.s, z27.s, z28.s
add x11, x11, #0x70
sub z28.s, z28.s, z27.s
ldr z27, [x11]
mul z31.s, p7/m, z31.s, z11.s
mul z27.s, p7/m, z27.s, z28.s
uzp1 z24.s, z31.s, z31.s
uzp2 z31.s, z31.s, z31.s
add z13.s, z24.s, z31.s
sub z24.s, z24.s, z31.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #3
uzp1 z27.s, z27.s, z27.s
add x11, x11, #0x70
ldr z12, [x11]
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z31.d, z29.d, z14.d
uzp1 z28.s, z28.s, z28.s
zip2 z29.d, z29.d, z14.d
zip1 z14.d, z25.d, z15.d
zip2 z25.d, z25.d, z15.d
zip2 z12.d, z31.d, z14.d
zip1 z15.d, z31.d, z14.d
zip1 z31.d, z29.d, z25.d
revh z14.d, p6/m, z31.d
mov z31.d, z14.d
zip2 z29.d, z29.d, z25.d
revh z29.d, p6/m, z29.d
addvl x11, sp, #0xf
saddlb z25.s, z15.h, z29.h
add x11, x11, #0x70
str z15, [x11]
ldr z15, [x11]
addvl x11, sp, #4
saddlt z14.s, z15.h, z29.h
saddlb z15.s, z12.h, z31.h
add x11, x11, #0x70
str z29, [x11]
addvl x11, sp, #0x10
add x11, x11, #0x70
str z12, [x11]
ldr z12, [x11]
addvl x11, sp, #0x11
saddlt z29.s, z12.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z15.d, p6/m, z15.d
revw z29.d, p6/m, z29.d
zip1 z31.s, z25.s, z14.s
zip2 z25.s, z25.s, z14.s
zip1 z12.s, z29.s, z15.s
zip2 z29.s, z29.s, z15.s
add z31.s, z31.s, z12.s
add z29.s, z25.s, z29.s
uzp2 z25.d, z31.d, z29.d
revw z25.d, p6/m, z25.d
addvl x11, sp, #2
uzp1 z29.d, z31.d, z29.d
add z31.s, z25.s, z29.s
add x11, x11, #0x70
sub z29.s, z29.s, z25.s
ldr z25, [x11]
mul z31.s, p7/m, z31.s, z11.s
mul z25.s, p7/m, z25.s, z29.s
uzp1 z15.s, z31.s, z31.s
uzp2 z31.s, z31.s, z31.s
add z14.s, z15.s, z31.s
sub z15.s, z15.s, z31.s
addp z25.s, p5/m, z25.s, z25.s
addvl x11, sp, #3
uzp1 z25.s, z25.s, z25.s
add x11, x11, #0x70
ldr z12, [x11]
mul z29.s, p7/m, z29.s, z12.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z31.d, z30.d, z16.d
uzp1 z29.s, z29.s, z29.s
zip2 z30.d, z30.d, z16.d
zip1 z16.d, z26.d, z17.d
zip2 z26.d, z26.d, z17.d
zip2 z12.d, z31.d, z16.d
zip1 z17.d, z31.d, z16.d
zip1 z31.d, z30.d, z26.d
revh z16.d, p6/m, z31.d
mov z31.d, z16.d
zip2 z30.d, z30.d, z26.d
revh z26.d, p6/m, z30.d
addvl x11, sp, #5
mov z16.d, z26.d
saddlb z26.s, z17.h, z26.h
add x11, x11, #0x70
str z17, [x11]
ldr z30, [x11]
addvl x11, sp, #8
saddlb z17.s, z12.h, z31.h
add x11, x11, #0x70
str z16, [x11]
saddlt z16.s, z30.h, z16.h
addvl x11, sp, #6
add x11, x11, #0x70
str z12, [x11]
ldr z12, [x11]
addvl x11, sp, #7
saddlt z30.s, z12.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z17.d, p6/m, z17.d
revw z30.d, p6/m, z30.d
zip1 z31.s, z26.s, z16.s
zip2 z26.s, z26.s, z16.s
zip1 z12.s, z30.s, z17.s
zip2 z30.s, z30.s, z17.s
add z31.s, z31.s, z12.s
add z30.s, z26.s, z30.s
uzp2 z26.d, z31.d, z30.d
revw z26.d, p6/m, z26.d
addvl x11, sp, #2
uzp1 z31.d, z31.d, z30.d
add z30.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
mul z30.s, p7/m, z30.s, z11.s
uzp1 z26.s, z30.s, z30.s
uzp2 z30.s, z30.s, z30.s
add x11, x11, #0x70
add z17.s, z26.s, z30.s
sub z26.s, z26.s, z30.s
ldr z30, [x11]
mul z30.s, p7/m, z30.s, z31.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #3
uzp1 z30.s, z30.s, z30.s
add x11, x11, #0x70
ldr z12, [x11]
mul z31.s, p7/m, z31.s, z12.s
addp z31.s, p5/m, z31.s, z31.s
addvl x11, sp, #0x1a
rshrnb z30.h, z30.s, #4
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
rshrnb z1.h, z1.s, #4
rshrnb z13.h, z13.s, #4
uzp1 z1.h, z1.h, z1.h
uzp1 z13.h, z13.h, z13.h
rshrnb z14.h, z14.s, #4
rshrnb z17.h, z17.s, #4
uzp1 z14.h, z14.h, z14.h
uzp1 z17.h, z17.h, z17.h
stp d1, d13, [x1]
rshrnb z25.h, z25.s, #4
uzp1 z25.h, z25.h, z25.h
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
uzp1 z31.s, z31.s, z31.s
stp d14, d17, [x1, #0x10]
rshrnb z27.h, z27.s, #4
rshrnb z24.h, z24.s, #4
uzp1 z27.h, z27.h, z27.h
uzp1 z24.h, z24.h, z24.h
rshrnb z26.h, z26.s, #4
str d30, [x1, #0x218]
rshrnb z30.h, z22.s, #4
ldr z22, [x11]
addvl x11, sp, #0x12
str d25, [x1, #0x210]
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
ldr z25, [x11]
uzp1 z26.h, z26.h, z26.h
addvl x11, sp, #0x13
rshrnb z29.h, z29.s, #4
rshrnb z31.h, z31.s, #4
add x11, x11, #0x70
ldr z14, [x11]
str d30, [x1, #0x400]
addvl x11, sp, #0x14
rshrnb z30.h, z22.s, #4
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
str d30, [x1, #0x600]
trn2 z30.d, z18.d, z14.d
str d28, [x1, #0x608]
zip1 z28.d, z18.d, z14.d
trn1 z18.d, z18.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x15
uzp1 z29.h, z29.h, z29.h
add x11, x11, #0x70
ldr z13, [x11]
uzp1 z31.h, z31.h, z31.h
addvl x11, sp, #0x18
str d27, [x1, #0x208]
rshrnb z15.h, z15.s, #4
add x11, x11, #0x70
str d24, [x1, #0x408]
uzp1 z15.h, z15.h, z15.h
str d26, [x1, #0x418]
rshrnb z10.h, z10.s, #4
uzp1 z10.h, z10.h, z10.h
str d29, [x1, #0x610]
zip1 z29.d, z19.d, z25.d
zip1 z26.d, z29.d, z28.d
zip1 z28.d, z20.d, z13.d
str d31, [x1, #0x618]
trn2 z31.d, z19.d, z25.d
zip1 z27.d, z31.d, z30.d
zip2 z24.d, z31.d, z30.d
trn2 z30.d, z20.d, z13.d
trn1 z20.d, z20.d, z13.d
ldr z13, [x11]
addvl x11, sp, #0x16
add x11, x11, #0x70
zip1 z29.d, z21.d, z14.d
str d15, [x1, #0x410]
ldr z15, [x11]
addvl x11, sp, #0x17
trn1 z19.d, z19.d, z25.d
add x11, x11, #0x70
zip2 z25.d, z19.d, z18.d
zip1 z18.d, z29.d, z28.d
zip1 z29.d, z15.d, z13.d
trn2 z31.d, z21.d, z14.d
trn1 z21.d, z21.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x19
zip1 z28.d, z14.d, z7.d
zip1 z16.d, z29.d, z28.d
trn1 z29.d, z14.d, z7.d
zip1 z19.d, z31.d, z30.d
zip2 z21.d, z21.d, z20.d
trn1 z22.d, z15.d, z13.d
zip2 z20.d, z31.d, z30.d
zip2 z22.d, z22.d, z29.d
trn2 z31.d, z15.d, z13.d
trn2 z30.d, z14.d, z7.d
zip1 z29.d, z23.d, z8.d
add x11, x11, #0x70
ldr z14, [x11]
zip1 z17.d, z31.d, z30.d
zip2 z11.d, z31.d, z30.d
zip1 z28.d, z14.d, z9.d
trn2 z30.d, z14.d, z9.d
zip1 z7.d, z29.d, z28.d
trn2 z31.d, z23.d, z8.d
add x11, x1, #0x40
trn1 z23.d, z23.d, z8.d
trn1 z29.d, z14.d, z9.d
str d10, [x1, #0x200]
zip2 z9.d, z23.d, z29.d
zip1 z10.d, z31.d, z30.d
zip2 z8.d, z31.d, z30.d
ld1h {z15.h}, p7/z, [x21]
movi d31, #0000000000000000
movprfx z30, z31
sdot z30.d, z27.h, z4.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[0]
sdot z30.d, z26.h, z15.h[0]
sdot z23.d, z18.h, z15.h[0]
sdot z30.d, z25.h, z3.h[0]
sdot z23.d, z21.h, z3.h[0]
sdot z30.d, z24.h, z2.h[0]
sdot z23.d, z20.h, z2.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[0]
sdot z29.d, z16.h, z15.h[0]
sdot z28.d, z7.h, z15.h[0]
sdot z29.d, z22.h, z3.h[0]
sdot z28.d, z9.h, z3.h[0]
sdot z29.d, z11.h, z2.h[0]
sdot z28.d, z8.h, z2.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z4.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[1]
sdot z30.d, z26.h, z15.h[1]
sdot z23.d, z18.h, z15.h[1]
sdot z30.d, z25.h, z3.h[1]
sdot z23.d, z21.h, z3.h[1]
sdot z30.d, z24.h, z2.h[1]
sdot z23.d, z20.h, z2.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[1]
sdot z29.d, z16.h, z15.h[1]
sdot z28.d, z7.h, z15.h[1]
sdot z29.d, z22.h, z3.h[1]
sdot z28.d, z9.h, z3.h[1]
sdot z29.d, z11.h, z2.h[1]
sdot z28.d, z8.h, z2.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #0x1b
movprfx z30, z31
sdot z30.d, z27.h, z5.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z5.h[0]
add x11, x11, #0x70
ldr z15, [x11]
sdot z30.d, z26.h, z6.h[0]
add x11, x1, #0x140
sdot z30.d, z25.h, z0.h[0]
sdot z23.d, z18.h, z6.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z21.h, z0.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z5.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z6.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z5.h[0]
sdot z29.d, z22.h, z0.h[0]
sdot z28.d, z7.h, z6.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z9.h, z0.h[0]
uzp1 z30.s, z30.s, z23.s
sdot z28.d, z8.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z27.h, z5.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z5.h[1]
sdot z30.d, z26.h, z6.h[1]
sdot z23.d, z18.h, z6.h[1]
sdot z30.d, z25.h, z0.h[1]
sdot z23.d, z21.h, z0.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z5.h[1]
sdot z29.d, z16.h, z6.h[1]
sdot z28.d, z7.h, z6.h[1]
sdot z29.d, z22.h, z0.h[1]
sdot z28.d, z9.h, z0.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x3, #0x1c0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x2c0
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x3, #0x3c0
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
addvl x11, sp, #0x1c
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[0]
add x11, x11, #0x70
ldr z12, [x11]
sdot z30.d, z26.h, z12.h[0]
add x11, x1, #0x240
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z18.h, z12.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z29.d, z16.h, z12.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z7.h, z12.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z9.h, z14.h[0]
uzp1 z30.s, z30.s, z23.s
sdot z28.d, z8.h, z15.h[0]
rshrnb z30.h, z30.s, #4
uzp1 z29.s, z29.s, z28.s
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
sdot z28.d, z10.h, z13.h[1]
sdot z30.d, z26.h, z12.h[1]
sdot z23.d, z18.h, z12.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z12.h[1]
sdot z28.d, z7.h, z12.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
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
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x340
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z28.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z23.s
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
addvl x11, sp, #0x1d
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
add x11, x11, #0x70
ldr z12, [x11]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[0]
add x11, x1, #0x440
sdot z30.d, z26.h, z12.h[0]
sdot z23.d, z18.h, z12.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z12.h[0]
sdot z28.d, z7.h, z12.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z27.h, z13.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z13.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[1]
sdot z30.d, z26.h, z12.h[1]
sdot z23.d, z18.h, z12.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z12.h[1]
sdot z28.d, z7.h, z12.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
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
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x540
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z28.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
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
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x640
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z28.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z23.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z13.h[1]
sdot z28.d, z7.h, z13.h[1]
sdot z29.d, z22.h, z14.h[1]
sdot z28.d, z9.h, z14.h[1]
sdot z29.d, z11.h, z15.h[1]
sdot z28.d, z8.h, z15.h[1]
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
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x740
movprfx z28, z31
sdot z28.d, z10.h, z12.h[0]
sdot z30.d, z26.h, z13.h[0]
sdot z23.d, z18.h, z13.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z13.h[0]
sdot z28.d, z7.h, z13.h[0]
sdot z29.d, z22.h, z14.h[0]
sdot z28.d, z9.h, z14.h[0]
sdot z29.d, z11.h, z15.h[0]
sdot z28.d, z8.h, z15.h[0]
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
sdot z27.d, z10.h, z12.h[1]
sdot z30.d, z26.h, z13.h[1]
sdot z29.d, z18.h, z13.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z29.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z29.d, z20.h, z15.h[1]
sdot z28.d, z16.h, z13.h[1]
sdot z27.d, z7.h, z13.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z27.d, z9.h, z14.h[1]
sdot z28.d, z11.h, z15.h[1]
sdot z27.d, z8.h, z15.h[1]
uzp1 z30.s, z30.s, z29.s
uzp1 z28.s, z28.s, z27.s
rshrnb z30.h, z30.s, #4
rshrnb z28.h, z28.s, #4
uzp1 z30.h, z30.h, z28.h
st1h {z30.h}, p7, [x11]
add x11, sp, #0x70
ldr z18, [x11]
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z18.h, z13.h
addvl x11, sp, #9
add x11, x11, #0x70
ldr z17, [x11]
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z16, [x11]
sub z22.h, z17.h, z16.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #1
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0xf
add x11, x11, #0x70
ldr z8, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z30, [x11]
sub z27.h, z8.h, z30.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #0x11
add x11, x11, #0x70
ldr z1, [x11]
sub z26.h, z7.h, z1.h
addvl x11, sp, #5
add x11, x11, #0x70
ldr z21, [x11]
addvl x11, sp, #8
add x11, x11, #0x70
ldr z28, [x11]
sub z29.h, z21.h, z28.h
addvl x11, sp, #6
add x11, x11, #0x70
ldr z21, [x11]
addvl x11, sp, #7
add x11, x11, #0x70
ldr z28, [x11]
sub z28.h, z21.h, z28.h
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
add z30.h, z1.h, z7.h
add x11, x11, #0x70
ldr z29, [x11]
add z29.h, z29.h, z8.h
revh z30.d, p6/m, z30.d
addvl x11, sp, #8
sub z29.h, z29.h, z30.h
add x11, x11, #0x70
ldr z16, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z25, [x11]
add z30.h, z16.h, z25.h
addvl x11, sp, #7
add x11, x11, #0x70
ldr z26, [x11]
addvl x11, sp, #6
add x11, x11, #0x70
ldr z25, [x11]
add z26.h, z26.h, z25.h
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
add x2, x2, #0xd30
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
add x3, x2, #0x60
ld1w {z31.s}, p7/z, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x180
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1b
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x280
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1c
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x380
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1d
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0xa0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1e
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x1a0
ld1h {z31.h}, p7/z, [x3]
addvl x3, sp, #0x1f
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x2a0
ld1h {z31.h}, p7/z, [x3]
cntb x3
lsl x3, x3, #5
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x3a0
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
rdvl x6, #0x11
add x3, x3, #0x40
lsl x6, x6, #1
add x3, sp, x3
str z31, [x3]
add x3, x2, #0xc0
ld1h {z31.h}, p7/z, [x3]
rdvl x3, #0x11
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
str z31, [x3]
add x3, x2, #0x100
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
str z31, [x3]
add x3, x0, #0x20
ld1h {z25.h}, p7/z, [x3]
ld1h {z18.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z19.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z30.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z28.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z14.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z12.h}, p7/z, [x3]
zip1 z13.d, z18.d, z12.d
add x3, x0, #0xc0
ld1h {z11.h}, p7/z, [x3]
zip2 z18.d, z18.d, z12.d
zip1 z12.d, z14.d, z11.d
zip2 z14.d, z14.d, z11.d
zip1 z11.d, z13.d, z12.d
zip2 z12.d, z13.d, z12.d
zip1 z13.d, z18.d, z14.d
revh z13.d, p6/m, z13.d
zip2 z18.d, z18.d, z14.d
revh z14.d, p6/m, z18.d
rev z17.h, z17.h
rev z15.h, z15.h
rev z25.h, z25.h
zip1 z18.d, z25.d, z17.d
rev z19.h, z19.h
zip2 z25.d, z25.d, z17.d
zip1 z17.d, z19.d, z15.d
zip2 z19.d, z19.d, z15.d
zip1 z15.d, z18.d, z17.d
zip2 z17.d, z18.d, z17.d
zip1 z18.d, z25.d, z19.d
revh z10.d, p6/m, z18.d
zip2 z25.d, z25.d, z19.d
revh z19.d, p6/m, z25.d
add x3, sp, #0x40
saddlb z25.s, z14.h, z19.h
saddlb z18.s, z11.h, z15.h
add z18.s, z18.s, z25.s
str z11, [x3]
ldr z25, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str z15, [x3]
ldr z9, [x3]
addvl x3, sp, #3
saddlt z15.s, z25.h, z9.h
saddlt z25.s, z14.h, z19.h
add x3, x3, #0x40
str z14, [x3]
add z15.s, z15.s, z25.s
addvl x3, sp, #7
saddlb z25.s, z13.h, z10.h
add x3, x3, #0x40
str z19, [x3]
mov z19.d, z17.d
addvl x3, sp, #1
saddlb z17.s, z12.h, z17.h
add z17.s, z17.s, z25.s
add x3, x3, #0x40
str z12, [x3]
ldr z25, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z19, [x3]
ldr z9, [x3]
addvl x3, sp, #2
saddlt z25.s, z25.h, z9.h
saddlt z19.s, z13.h, z10.h
add x3, x3, #0x40
str z13, [x3]
add z19.s, z25.s, z19.s
addvl x3, sp, #6
add x3, x3, #0x40
str z10, [x3]
revw z17.d, p6/m, z17.d
revw z19.d, p6/m, z19.d
zip1 z25.s, z18.s, z15.s
zip2 z18.s, z18.s, z15.s
zip1 z14.s, z19.s, z17.s
zip2 z19.s, z19.s, z17.s
add z25.s, z25.s, z14.s
add z19.s, z18.s, z19.s
uzp2 z18.d, z25.d, z19.d
revw z18.d, p6/m, z18.d
addvl x3, sp, #0x19
uzp1 z25.d, z25.d, z19.d
ld1w {z2.s}, p7/z, [x2]
add z19.s, z18.s, z25.s
sub z25.s, z25.s, z18.s
mul z19.s, p7/m, z19.s, z2.s
uzp1 z18.s, z19.s, z19.s
add x3, x3, #0x40
ldr z11, [x3]
uzp2 z19.s, z19.s, z19.s
ptrue p5.s
add z8.s, z18.s, z19.s
sub z3.s, z18.s, z19.s
movprfx z18, z11
mul z18.s, p7/m, z18.s, z25.s
addp z18.s, p5/m, z18.s, z18.s
addvl x3, sp, #0x1a
uzp1 z18.s, z18.s, z18.s
add x3, x3, #0x40
ldr z6, [x3]
mul z25.s, p7/m, z25.s, z6.s
addp z25.s, p5/m, z25.s, z25.s
add x3, x0, #0x100
uzp1 z4.s, z25.s, z25.s
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z15.h}, p7/z, [x3]
zip1 z17.d, z25.d, z15.d
add x3, x0, #0x1c0
zip2 z25.d, z25.d, z15.d
ld1h {z14.h}, p7/z, [x3]
zip1 z15.d, z19.d, z14.d
zip2 z19.d, z19.d, z14.d
zip1 z9.d, z17.d, z15.d
zip2 z7.d, z17.d, z15.d
zip1 z17.d, z25.d, z19.d
revh z5.d, p6/m, z17.d
zip2 z25.d, z25.d, z19.d
revh z1.d, p6/m, z25.d
rev z25.h, z21.h
rev z24.h, z24.h
rev z27.h, z27.h
rev z29.h, z29.h
zip1 z21.d, z27.d, z25.d
zip2 z27.d, z27.d, z25.d
zip1 z25.d, z29.d, z24.d
zip2 z29.d, z29.d, z24.d
zip1 z24.d, z21.d, z25.d
zip1 z14.d, z27.d, z29.d
zip2 z21.d, z21.d, z25.d
revh z14.d, p6/m, z14.d
zip2 z27.d, z27.d, z29.d
revh z27.d, p6/m, z27.d
addvl x3, sp, #8
saddlb z29.s, z1.h, z27.h
saddlb z19.s, z9.h, z24.h
add x3, x3, #0x40
add z19.s, z19.s, z29.s
str z9, [x3]
ldr z29, [x3]
addvl x3, sp, #0xc
saddlb z17.s, z7.h, z21.h
add x3, x3, #0x40
str z24, [x3]
ldr z24, [x3]
addvl x3, sp, #0xb
saddlt z15.s, z29.h, z24.h
saddlt z29.s, z1.h, z27.h
add x3, x3, #0x40
str z1, [x3]
add z15.s, z15.s, z29.s
addvl x3, sp, #9
saddlb z29.s, z5.h, z14.h
add z17.s, z17.s, z29.s
add x3, x3, #0x40
str z7, [x3]
ldr z29, [x3]
addvl x3, sp, #0xa
saddlt z29.s, z29.h, z21.h
saddlt z25.s, z5.h, z14.h
add x3, x3, #0x40
add z25.s, z29.s, z25.s
str z5, [x3]
revw z17.d, p6/m, z17.d
revw z25.d, p6/m, z25.d
zip1 z29.s, z19.s, z15.s
zip2 z19.s, z19.s, z15.s
zip1 z13.s, z25.s, z17.s
zip2 z25.s, z25.s, z17.s
add z29.s, z29.s, z13.s
add z25.s, z19.s, z25.s
uzp2 z19.d, z29.d, z25.d
revw z19.d, p6/m, z19.d
uzp1 z29.d, z29.d, z25.d
mov z24.d, z11.d
add z25.s, z19.s, z29.s
sub z29.s, z29.s, z19.s
mul z25.s, p7/m, z25.s, z2.s
movprfx z19, z11
mul z19.s, p7/m, z19.s, z29.s
uzp1 z12.s, z25.s, z25.s
uzp2 z25.s, z25.s, z25.s
add z7.s, z12.s, z25.s
sub z12.s, z12.s, z25.s
addp z19.s, p5/m, z19.s, z19.s
uzp1 z19.s, z19.s, z19.s
mul z29.s, p7/m, z29.s, z6.s
addp z29.s, p5/m, z29.s, z29.s
add x3, x0, #0x200
ld1h {z25.h}, p7/z, [x3]
uzp1 z29.s, z29.s, z29.s
add x3, x0, #0x240
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z13.h}, p7/z, [x3]
zip1 z15.d, z25.d, z13.d
add x3, x0, #0x2c0
ld1h {z11.h}, p7/z, [x3]
zip2 z25.d, z25.d, z13.d
zip1 z13.d, z17.d, z11.d
zip2 z17.d, z17.d, z11.d
zip1 z0.d, z15.d, z13.d
zip2 z11.d, z15.d, z13.d
zip1 z15.d, z25.d, z17.d
revh z9.d, p6/m, z15.d
zip2 z25.d, z25.d, z17.d
revh z17.d, p6/m, z25.d
rev z20.h, z20.h
rev z25.h, z22.h
rev z30.h, z30.h
rev z23.h, z23.h
zip1 z22.d, z30.d, z20.d
zip2 z30.d, z30.d, z20.d
zip1 z20.d, z23.d, z25.d
zip2 z23.d, z23.d, z25.d
zip1 z25.d, z22.d, z20.d
zip2 z22.d, z22.d, z20.d
zip1 z20.d, z30.d, z23.d
revh z20.d, p6/m, z20.d
mov z5.d, z20.d
zip2 z30.d, z30.d, z23.d
revh z23.d, p6/m, z30.d
addvl x3, sp, #0xd
saddlb z30.s, z17.h, z23.h
saddlb z20.s, z0.h, z25.h
add x3, x3, #0x40
add z20.s, z20.s, z30.s
str z0, [x3]
ldr z30, [x3]
addvl x3, sp, #0x11
add x3, x3, #0x40
str z25, [x3]
ldr z15, [x3]
addvl x3, sp, #0x10
saddlt z15.s, z30.h, z15.h
saddlt z30.s, z17.h, z23.h
add x3, x3, #0x40
str z17, [x3]
add z15.s, z15.s, z30.s
addvl x3, sp, #0x13
saddlb z30.s, z9.h, z5.h
saddlb z17.s, z11.h, z22.h
add x3, x3, #0x40
str z23, [x3]
add z17.s, z17.s, z30.s
addvl x3, sp, #0xe
saddlt z23.s, z9.h, z5.h
add x3, x3, #0x40
str z11, [x3]
ldr z30, [x3]
addvl x3, sp, #0xf
saddlt z30.s, z30.h, z22.h
add z23.s, z30.s, z23.s
add x3, x3, #0x40
str z9, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
str z5, [x3]
revw z17.d, p6/m, z17.d
revw z23.d, p6/m, z23.d
zip1 z30.s, z20.s, z15.s
zip2 z20.s, z20.s, z15.s
zip1 z13.s, z23.s, z17.s
zip2 z23.s, z23.s, z17.s
add z30.s, z30.s, z13.s
add z23.s, z20.s, z23.s
uzp2 z20.d, z30.d, z23.d
revw z20.d, p6/m, z20.d
uzp1 z30.d, z30.d, z23.d
add z23.s, z20.s, z30.s
sub z30.s, z30.s, z20.s
mul z23.s, p7/m, z23.s, z2.s
movprfx z20, z24
mul z20.s, p7/m, z20.s, z30.s
uzp1 z13.s, z23.s, z23.s
uzp2 z23.s, z23.s, z23.s
add z9.s, z13.s, z23.s
sub z13.s, z13.s, z23.s
addp z20.s, p5/m, z20.s, z20.s
uzp1 z20.s, z20.s, z20.s
mov z25.d, z6.d
mul z30.s, p7/m, z30.s, z6.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x300
ld1h {z17.h}, p7/z, [x3]
uzp1 z30.s, z30.s, z30.s
add x3, x0, #0x340
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z15.h}, p7/z, [x3]
zip1 z11.d, z17.d, z15.d
add x3, x0, #0x3c0
ld1h {z10.h}, p7/z, [x3]
zip2 z17.d, z17.d, z15.d
zip1 z15.d, z23.d, z10.d
zip2 z23.d, z23.d, z10.d
zip1 z6.d, z11.d, z15.d
zip1 z10.d, z17.d, z23.d
zip2 z11.d, z11.d, z15.d
revh z15.d, p6/m, z10.d
mov z0.d, z15.d
zip2 z17.d, z17.d, z23.d
revh z15.d, p6/m, z17.d
rev z16.h, z16.h
rev z26.h, z26.h
mov z5.d, z15.d
rev z28.h, z28.h
rev z31.h, z31.h
zip1 z23.d, z28.d, z16.d
zip2 z28.d, z28.d, z16.d
zip1 z16.d, z31.d, z26.d
zip2 z31.d, z31.d, z26.d
zip1 z1.d, z23.d, z16.d
zip1 z15.d, z28.d, z31.d
zip2 z23.d, z23.d, z16.d
revh z15.d, p6/m, z15.d
zip2 z28.d, z28.d, z31.d
revh z28.d, p6/m, z28.d
addvl x3, sp, #0x14
saddlb z31.s, z5.h, z28.h
mov z16.d, z6.d
add x3, x3, #0x40
saddlb z6.s, z6.h, z1.h
add z6.s, z6.s, z31.s
str z16, [x3]
ldr z31, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
str z1, [x3]
ldr z16, [x3]
addvl x3, sp, #0x17
saddlt z1.s, z31.h, z16.h
saddlt z31.s, z5.h, z28.h
add x3, x3, #0x40
str z5, [x3]
add z1.s, z1.s, z31.s
addvl x3, sp, #0x15
saddlb z31.s, z0.h, z15.h
saddlb z5.s, z11.h, z23.h
add x3, x3, #0x40
add z5.s, z5.s, z31.s
str z11, [x3]
ldr z31, [x3]
addvl x3, sp, #0x16
saddlt z31.s, z31.h, z23.h
add x3, x3, #0x40
saddlt z16.s, z0.h, z15.h
add z16.s, z31.s, z16.s
str z0, [x3]
revw z5.d, p6/m, z5.d
revw z16.d, p6/m, z16.d
zip1 z31.s, z6.s, z1.s
zip2 z6.s, z6.s, z1.s
zip1 z0.s, z16.s, z5.s
zip2 z16.s, z16.s, z5.s
add z31.s, z31.s, z0.s
add z16.s, z6.s, z16.s
uzp2 z6.d, z31.d, z16.d
revw z6.d, p6/m, z6.d
uzp1 z31.d, z31.d, z16.d
add z16.s, z6.s, z31.s
sub z31.s, z31.s, z6.s
mul z16.s, p7/m, z16.s, z2.s
uzp1 z6.s, z16.s, z16.s
uzp2 z16.s, z16.s, z16.s
add z5.s, z6.s, z16.s
sub z6.s, z6.s, z16.s
movprfx z16, z24
mul z16.s, p7/m, z16.s, z31.s
addp z16.s, p5/m, z16.s, z16.s
uzp1 z16.s, z16.s, z16.s
mul z31.s, p7/m, z31.s, z25.s
addp z31.s, p5/m, z31.s, z31.s
add x3, sp, #0x40
rshrnb z18.h, z18.s, #0xb
uzp1 z18.h, z18.h, z18.h
rshrnb z8.h, z8.s, #0xb
rshrnb z7.h, z7.s, #0xb
uzp1 z8.h, z8.h, z8.h
uzp1 z7.h, z7.h, z7.h
rshrnb z9.h, z9.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z9.h, z9.h, z9.h
uzp1 z5.h, z5.h, z5.h
stp d8, d7, [x1]
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
rshrnb z20.h, z20.s, #0xb
stp d9, d5, [x1, #0x10]
uzp1 z20.h, z20.h, z20.h
rshrnb z13.h, z13.s, #0xb
uzp1 z13.h, z13.h, z13.h
uzp1 z31.s, z31.s, z31.s
rshrnb z31.h, z31.s, #0xb
str d18, [x1, #0x200]
ldr z18, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z8, [x3]
str d16, [x1, #0x218]
addvl x3, sp, #1
sub z16.h, z18.h, z8.h
uzp1 z31.h, z31.h, z31.h
add x3, x3, #0x40
ldr z18, [x3]
str d20, [x1, #0x210]
addvl x3, sp, #5
rshrnb z20.h, z3.s, #0xb
uzp1 z20.h, z20.h, z20.h
add x3, x3, #0x40
ldr z8, [x3]
str d13, [x1, #0x410]
addvl x3, sp, #2
rshrnb z19.h, z19.s, #0xb
rshrnb z12.h, z12.s, #0xb
add x3, x3, #0x40
ldr z13, [x3]
uzp1 z19.h, z19.h, z19.h
addvl x3, sp, #6
uzp1 z12.h, z12.h, z12.h
rshrnb z6.h, z6.s, #0xb
add x3, x3, #0x40
ldr z10, [x3]
uzp1 z6.h, z6.h, z6.h
rshrnb z29.h, z29.s, #0xb
rshrnb z30.h, z30.s, #0xb
uzp1 z29.h, z29.h, z29.h
uzp1 z30.h, z30.h, z30.h
sub z18.h, z18.h, z8.h
str d19, [x1, #0x208]
str d20, [x1, #0x400]
rshrnb z20.h, z4.s, #0xb
uzp1 z20.h, z20.h, z20.h
str d12, [x1, #0x408]
str d6, [x1, #0x418]
str d20, [x1, #0x600]
str d29, [x1, #0x608]
str d30, [x1, #0x610]
str d31, [x1, #0x618]
sub z31.h, z13.h, z10.h
revh z7.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z31, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z31.h, z30.h
revh z6.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z8, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z3, [x3]
sub z2.h, z8.h, z3.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z8, [x3]
sub z5.h, z8.h, z21.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z29, [x3]
sub z31.h, z29.h, z14.h
revh z1.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z26, [x3]
sub z31.h, z26.h, z27.h
revh z0.d, p6/m, z31.d
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z8, [x3]
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z3, [x3]
sub z11.h, z8.h, z3.h
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z8, [x3]
sub z10.h, z8.h, z22.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z8, [x3]
sub z31.h, z24.h, z8.h
revh z17.d, p6/m, z31.d
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z20, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z4, [x3]
sub z31.h, z20.h, z4.h
revh z24.d, p6/m, z31.d
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z3, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z12, [x3]
sub z26.h, z3.h, z12.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z3, [x3]
sub z25.h, z3.h, z23.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z3.h, z15.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z12, [x3]
sub z31.h, z12.h, z28.h
revh z4.d, p6/m, z31.d
addvl x3, sp, #0x1b
movi d31, #0000000000000000
ld1h {z13.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z12.h[0]
addvl x3, sp, #0x1c
movprfx z19, z31
sdot z19.d, z5.h, z12.h[0]
movprfx z29, z31
sdot z29.d, z10.h, z12.h[0]
add x3, x3, #0x40
ldr z9, [x3]
movprfx z20, z31
sdot z20.d, z25.h, z12.h[0]
addvl x3, sp, #0x1d
sdot z30.d, z16.h, z13.h[0]
sdot z19.d, z2.h, z13.h[0]
add x3, x3, #0x40
ldr z8, [x3]
sdot z30.d, z7.h, z9.h[0]
add x3, x1, #0x40
sdot z30.d, z6.h, z8.h[0]
sdot z19.d, z1.h, z9.h[0]
sdot z29.d, z11.h, z13.h[0]
sdot z19.d, z0.h, z8.h[0]
sdot z29.d, z17.h, z9.h[0]
sdot z20.d, z26.h, z13.h[0]
sdot z29.d, z24.h, z8.h[0]
sdot z20.d, z3.h, z9.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z4.h, z8.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z20.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z18.h, z12.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z12.h[1]
sdot z30.d, z16.h, z13.h[1]
sdot z19.d, z2.h, z13.h[1]
sdot z30.d, z7.h, z9.h[1]
sdot z19.d, z1.h, z9.h[1]
sdot z30.d, z6.h, z8.h[1]
sdot z19.d, z0.h, z8.h[1]
sdot z29.d, z11.h, z13.h[1]
sdot z20.d, z26.h, z13.h[1]
sdot z29.d, z17.h, z9.h[1]
sdot z20.d, z3.h, z9.h[1]
sdot z29.d, z24.h, z8.h[1]
sdot z20.d, z4.h, z8.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #0x1f
cntb x6
add x3, x3, #0x40
ldr z13, [x3]
lsl x6, x6, #5
addvl x3, sp, #0x1e
movprfx z30, z31
sdot z30.d, z18.h, z13.h[0]
movprfx z19, z31
sdot z19.d, z5.h, z13.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z29, z31
sdot z29.d, z10.h, z13.h[0]
cntb x3
movprfx z20, z31
sdot z20.d, z25.h, z13.h[0]
sdot z30.d, z16.h, z12.h[0]
lsl x3, x3, #5
sdot z19.d, z2.h, z12.h[0]
sdot z29.d, z11.h, z12.h[0]
add x3, sp, x3
sdot z20.d, z26.h, z12.h[0]
add x3, x3, #0x40
ldr z9, [x3]
sdot z30.d, z7.h, z9.h[0]
addvl x3, x6, #1
sdot z19.d, z1.h, z9.h[0]
sdot z29.d, z17.h, z9.h[0]
add x3, x3, #0x40
sdot z20.d, z3.h, z9.h[0]
rdvl x6, #0x11
add x3, sp, x3
ldr z8, [x3]
sdot z19.d, z0.h, z8.h[0]
add x3, x1, #0x140
sdot z20.d, z4.h, z8.h[0]
sdot z30.d, z6.h, z8.h[0]
sdot z29.d, z24.h, z8.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z18.h, z13.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z13.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z13.h[1]
sdot z30.d, z16.h, z12.h[1]
sdot z19.d, z2.h, z12.h[1]
sdot z30.d, z7.h, z9.h[1]
sdot z19.d, z1.h, z9.h[1]
sdot z30.d, z6.h, z8.h[1]
sdot z19.d, z0.h, z8.h[1]
sdot z29.d, z11.h, z12.h[1]
sdot z20.d, z26.h, z12.h[1]
sdot z29.d, z17.h, z9.h[1]
sdot z20.d, z3.h, z9.h[1]
sdot z29.d, z24.h, z8.h[1]
sdot z20.d, z4.h, z8.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x1c0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z9.h[0]
add x3, x2, #0x2c0
ld1h {z12.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z9.h[0]
add x3, x2, #0x3c0
ld1h {z13.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[0]
rdvl x3, #0x11
movprfx z20, z31
sdot z20.d, z25.h, z9.h[0]
lsl x6, x6, #1
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z8, [x3]
sdot z30.d, z16.h, z8.h[0]
add x3, x1, #0x240
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z2.h, z8.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z29.d, z11.h, z8.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z26.h, z8.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z3.h, z12.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z4.h, z13.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z20.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z18.h, z9.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z9.h[1]
sdot z30.d, z16.h, z8.h[1]
sdot z19.d, z2.h, z8.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z8.h[1]
sdot z20.d, z26.h, z8.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x2e0
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x3e0
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x340
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x400
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z9.h[0]
addvl x3, x6, #1
movprfx z19, z31
sdot z19.d, z5.h, z9.h[0]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[0]
add x3, x3, #0x40
movprfx z20, z31
sdot z20.d, z25.h, z9.h[0]
add x3, sp, x3
ldr z8, [x3]
sdot z30.d, z16.h, z8.h[0]
add x3, x1, #0x440
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z2.h, z8.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z29.d, z11.h, z8.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z26.h, z8.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z3.h, z12.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z4.h, z13.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z20.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z18.h, z9.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z9.h[1]
sdot z30.d, z16.h, z8.h[1]
sdot z19.d, z2.h, z8.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z8.h[1]
sdot z20.d, z26.h, z8.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x420
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x540
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x440
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x640
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x460
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x740
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z18, [x3]
add x3, sp, #0x40
ldr z2, [x3]
add z30.h, z18.h, z2.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
add z29.h, z18.h, z2.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z10, [x3]
add z19.h, z13.h, z10.h
addvl x3, sp, #3
sub z18.h, z29.h, z19.h
add z29.h, z29.h, z19.h
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z25, [x3]
add z16.h, z26.h, z25.h
addvl x3, sp, #0xc
sub z20.h, z30.h, z16.h
add z30.h, z30.h, z16.h
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #8
add x3, x3, #0x40
ldr z10, [x3]
add z24.h, z13.h, z10.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z13, [x3]
add z21.h, z21.h, z13.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z5, [x3]
add z14.h, z5.h, z14.h
addvl x3, sp, #0xb
sub z12.h, z21.h, z14.h
add x3, x3, #0x40
ldr z1, [x3]
add z27.h, z1.h, z27.h
addvl x3, sp, #0x11
sub z13.h, z24.h, z27.h
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z10, [x3]
add z25.h, z25.h, z10.h
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z10, [x3]
add z22.h, z22.h, z10.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z9, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z8, [x3]
add z8.h, z9.h, z8.h
addvl x3, sp, #0x10
sub z7.h, z22.h, z8.h
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z4, [x3]
add z6.h, z17.h, z4.h
addvl x3, sp, #0x18
sub z9.h, z25.h, z6.h
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z10, [x3]
add z26.h, z17.h, z10.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z17, [x3]
add z23.h, z23.h, z17.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z3, [x3]
add z15.h, z3.h, z15.h
addvl x3, sp, #0x17
sub z10.h, z23.h, z15.h
add x3, x3, #0x40
ldr z17, [x3]
add z28.h, z17.h, z28.h
add x3, x2, #0x480
ld1h {z5.h}, p7/z, [x3]
sub z11.h, z26.h, z28.h
add x3, x2, #0x500
ld1h {z4.h}, p7/z, [x3]
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
add x3, x1, #0x80
sdot z17.d, z20.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
sdot z1.d, z13.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
uzp1 z17.s, z17.s, z1.s
sdot z2.d, z11.h, z5.h[0]
rshrnb z17.h, z17.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x1, #0x180
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z17.d, z20.h, z5.h[1]
sdot z1.d, z13.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z11.h, z5.h[1]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z17.d, z20.h, z5.h[0]
sdot z1.d, z13.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z11.h, z5.h[0]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x1, #0x380
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z17.d, z20.h, z5.h[1]
sdot z1.d, z13.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z11.h, z5.h[1]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z4.h}, p7/z, [x3]
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
add x3, x1, #0x480
sdot z17.d, z20.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
sdot z1.d, z13.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
uzp1 z17.s, z17.s, z1.s
sdot z2.d, z11.h, z5.h[0]
rshrnb z17.h, z17.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x1, #0x580
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z17.d, z20.h, z5.h[1]
sdot z1.d, z13.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z11.h, z5.h[1]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z17.d, z20.h, z5.h[0]
sdot z1.d, z13.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z11.h, z5.h[0]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
add x3, x1, #0x780
sdot z17.d, z20.h, z5.h[1]
movprfx z18, z31
sdot z18.d, z7.h, z4.h[1]
movprfx z20, z31
sdot z20.d, z12.h, z4.h[1]
sdot z18.d, z9.h, z5.h[1]
sdot z20.d, z13.h, z5.h[1]
movprfx z13, z31
sdot z13.d, z10.h, z4.h[1]
uzp1 z17.s, z17.s, z20.s
sdot z13.d, z11.h, z5.h[1]
rshrnb z17.h, z17.s, #0xb
uzp1 z18.s, z18.s, z13.s
rshrnb z18.h, z18.s, #0xb
uzp1 z17.h, z17.h, z18.h
st1h {z17.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z24.h, z24.h, z27.h
add z21.h, z21.h, z14.h
revh z21.d, p6/m, z21.d
sub z24.h, z24.h, z21.h
add z25.h, z25.h, z6.h
add z22.h, z22.h, z8.h
revh z22.d, p6/m, z22.d
sub z25.h, z25.h, z22.h
add z26.h, z26.h, z28.h
add z23.h, z23.h, z15.h
revh z23.d, p6/m, z23.d
add x3, x2, #0x580
ld1h {z15.h}, p7/z, [x3]
sub z26.h, z26.h, z23.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z23, z31
sdot z23.d, z24.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z26.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[0]
uzp1 z29.s, z29.s, z23.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
movprfx z23, z31
sdot z23.d, z24.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z26.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[1]
uzp1 z29.s, z29.s, z23.s
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
movprfx z23, z31
sdot z23.d, z24.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z26.h, z15.h[0]
uzp1 z29.s, z29.s, z23.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z24.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z26.h, z15.h[1]
uzp1 z30.s, z29.s, z30.s
uzp1 z31.s, z28.s, z31.s
rshrnb z30.h, z30.s, #0xb
rshrnb z31.h, z31.s, #0xb
uzp1 z31.h, z30.h, z31.h
st1h {z31.h}, p7, [x3]
add x1, x1, #0x20
cmp x5, x0
add x3, x0, #0x20
ld1h {z25.h}, p7/z, [x3]
ld1h {z18.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z19.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z30.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z28.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z14.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z12.h}, p7/z, [x3]
zip1 z13.d, z18.d, z12.d
add x3, x0, #0xc0
ld1h {z11.h}, p7/z, [x3]
zip2 z18.d, z18.d, z12.d
zip1 z12.d, z14.d, z11.d
zip2 z14.d, z14.d, z11.d
zip1 z11.d, z13.d, z12.d
zip2 z12.d, z13.d, z12.d
zip1 z13.d, z18.d, z14.d
revh z13.d, p6/m, z13.d
zip2 z18.d, z18.d, z14.d
revh z14.d, p6/m, z18.d
rev z17.h, z17.h
rev z15.h, z15.h
rev z25.h, z25.h
zip1 z18.d, z25.d, z17.d
rev z19.h, z19.h
zip2 z25.d, z25.d, z17.d
zip1 z17.d, z19.d, z15.d
zip2 z19.d, z19.d, z15.d
zip1 z15.d, z18.d, z17.d
zip2 z17.d, z18.d, z17.d
zip1 z18.d, z25.d, z19.d
revh z10.d, p6/m, z18.d
zip2 z25.d, z25.d, z19.d
revh z19.d, p6/m, z25.d
add x3, sp, #0x40
saddlb z25.s, z14.h, z19.h
saddlb z18.s, z11.h, z15.h
add z18.s, z18.s, z25.s
str z11, [x3]
ldr z25, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str z15, [x3]
ldr z9, [x3]
addvl x3, sp, #3
saddlt z15.s, z25.h, z9.h
saddlt z25.s, z14.h, z19.h
add x3, x3, #0x40
str z14, [x3]
add z15.s, z15.s, z25.s
addvl x3, sp, #7
saddlb z25.s, z13.h, z10.h
add x3, x3, #0x40
str z19, [x3]
mov z19.d, z17.d
addvl x3, sp, #1
saddlb z17.s, z12.h, z17.h
add z17.s, z17.s, z25.s
add x3, x3, #0x40
str z12, [x3]
ldr z25, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z19, [x3]
ldr z9, [x3]
addvl x3, sp, #2
saddlt z25.s, z25.h, z9.h
saddlt z19.s, z13.h, z10.h
add x3, x3, #0x40
str z13, [x3]
add z19.s, z25.s, z19.s
addvl x3, sp, #6
add x3, x3, #0x40
str z10, [x3]
revw z17.d, p6/m, z17.d
revw z19.d, p6/m, z19.d
zip1 z25.s, z18.s, z15.s
zip2 z18.s, z18.s, z15.s
zip1 z14.s, z19.s, z17.s
zip2 z19.s, z19.s, z17.s
add z25.s, z25.s, z14.s
add z19.s, z18.s, z19.s
uzp2 z18.d, z25.d, z19.d
revw z18.d, p6/m, z18.d
addvl x3, sp, #0x19
uzp1 z25.d, z25.d, z19.d
ld1w {z2.s}, p7/z, [x2]
add z19.s, z18.s, z25.s
sub z25.s, z25.s, z18.s
mul z19.s, p7/m, z19.s, z2.s
uzp1 z18.s, z19.s, z19.s
add x3, x3, #0x40
ldr z11, [x3]
uzp2 z19.s, z19.s, z19.s
ptrue p5.s
add z8.s, z18.s, z19.s
sub z3.s, z18.s, z19.s
movprfx z18, z11
mul z18.s, p7/m, z18.s, z25.s
addp z18.s, p5/m, z18.s, z18.s
addvl x3, sp, #0x1a
uzp1 z18.s, z18.s, z18.s
add x3, x3, #0x40
ldr z6, [x3]
mul z25.s, p7/m, z25.s, z6.s
addp z25.s, p5/m, z25.s, z25.s
add x3, x0, #0x100
uzp1 z4.s, z25.s, z25.s
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z15.h}, p7/z, [x3]
zip1 z17.d, z25.d, z15.d
add x3, x0, #0x1c0
zip2 z25.d, z25.d, z15.d
ld1h {z14.h}, p7/z, [x3]
zip1 z15.d, z19.d, z14.d
zip2 z19.d, z19.d, z14.d
zip1 z9.d, z17.d, z15.d
zip2 z7.d, z17.d, z15.d
zip1 z17.d, z25.d, z19.d
revh z5.d, p6/m, z17.d
zip2 z25.d, z25.d, z19.d
revh z1.d, p6/m, z25.d
rev z25.h, z21.h
rev z24.h, z24.h
rev z27.h, z27.h
rev z29.h, z29.h
zip1 z21.d, z27.d, z25.d
zip2 z27.d, z27.d, z25.d
zip1 z25.d, z29.d, z24.d
zip2 z29.d, z29.d, z24.d
zip1 z24.d, z21.d, z25.d
zip1 z14.d, z27.d, z29.d
zip2 z21.d, z21.d, z25.d
revh z14.d, p6/m, z14.d
zip2 z27.d, z27.d, z29.d
revh z27.d, p6/m, z27.d
addvl x3, sp, #8
saddlb z29.s, z1.h, z27.h
saddlb z19.s, z9.h, z24.h
add x3, x3, #0x40
add z19.s, z19.s, z29.s
str z9, [x3]
ldr z29, [x3]
addvl x3, sp, #0xc
saddlb z17.s, z7.h, z21.h
add x3, x3, #0x40
str z24, [x3]
ldr z24, [x3]
addvl x3, sp, #0xb
saddlt z15.s, z29.h, z24.h
saddlt z29.s, z1.h, z27.h
add x3, x3, #0x40
str z1, [x3]
add z15.s, z15.s, z29.s
addvl x3, sp, #9
saddlb z29.s, z5.h, z14.h
add z17.s, z17.s, z29.s
add x3, x3, #0x40
str z7, [x3]
ldr z29, [x3]
addvl x3, sp, #0xa
saddlt z29.s, z29.h, z21.h
saddlt z25.s, z5.h, z14.h
add x3, x3, #0x40
add z25.s, z29.s, z25.s
str z5, [x3]
revw z17.d, p6/m, z17.d
revw z25.d, p6/m, z25.d
zip1 z29.s, z19.s, z15.s
zip2 z19.s, z19.s, z15.s
zip1 z13.s, z25.s, z17.s
zip2 z25.s, z25.s, z17.s
add z29.s, z29.s, z13.s
add z25.s, z19.s, z25.s
uzp2 z19.d, z29.d, z25.d
revw z19.d, p6/m, z19.d
uzp1 z29.d, z29.d, z25.d
mov z24.d, z11.d
add z25.s, z19.s, z29.s
sub z29.s, z29.s, z19.s
mul z25.s, p7/m, z25.s, z2.s
movprfx z19, z11
mul z19.s, p7/m, z19.s, z29.s
uzp1 z12.s, z25.s, z25.s
uzp2 z25.s, z25.s, z25.s
add z7.s, z12.s, z25.s
sub z12.s, z12.s, z25.s
addp z19.s, p5/m, z19.s, z19.s
uzp1 z19.s, z19.s, z19.s
mul z29.s, p7/m, z29.s, z6.s
addp z29.s, p5/m, z29.s, z29.s
add x3, x0, #0x200
ld1h {z25.h}, p7/z, [x3]
uzp1 z29.s, z29.s, z29.s
add x3, x0, #0x240
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z13.h}, p7/z, [x3]
zip1 z15.d, z25.d, z13.d
add x3, x0, #0x2c0
ld1h {z11.h}, p7/z, [x3]
zip2 z25.d, z25.d, z13.d
zip1 z13.d, z17.d, z11.d
zip2 z17.d, z17.d, z11.d
zip1 z0.d, z15.d, z13.d
zip2 z11.d, z15.d, z13.d
zip1 z15.d, z25.d, z17.d
revh z9.d, p6/m, z15.d
zip2 z25.d, z25.d, z17.d
revh z17.d, p6/m, z25.d
rev z20.h, z20.h
rev z25.h, z22.h
rev z30.h, z30.h
rev z23.h, z23.h
zip1 z22.d, z30.d, z20.d
zip2 z30.d, z30.d, z20.d
zip1 z20.d, z23.d, z25.d
zip2 z23.d, z23.d, z25.d
zip1 z25.d, z22.d, z20.d
zip2 z22.d, z22.d, z20.d
zip1 z20.d, z30.d, z23.d
revh z20.d, p6/m, z20.d
mov z5.d, z20.d
zip2 z30.d, z30.d, z23.d
revh z23.d, p6/m, z30.d
addvl x3, sp, #0xd
saddlb z30.s, z17.h, z23.h
saddlb z20.s, z0.h, z25.h
add x3, x3, #0x40
add z20.s, z20.s, z30.s
str z0, [x3]
ldr z30, [x3]
addvl x3, sp, #0x11
add x3, x3, #0x40
str z25, [x3]
ldr z15, [x3]
addvl x3, sp, #0x10
saddlt z15.s, z30.h, z15.h
saddlt z30.s, z17.h, z23.h
add x3, x3, #0x40
str z17, [x3]
add z15.s, z15.s, z30.s
addvl x3, sp, #0x13
saddlb z30.s, z9.h, z5.h
saddlb z17.s, z11.h, z22.h
add x3, x3, #0x40
str z23, [x3]
add z17.s, z17.s, z30.s
addvl x3, sp, #0xe
saddlt z23.s, z9.h, z5.h
add x3, x3, #0x40
str z11, [x3]
ldr z30, [x3]
addvl x3, sp, #0xf
saddlt z30.s, z30.h, z22.h
add z23.s, z30.s, z23.s
add x3, x3, #0x40
str z9, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
str z5, [x3]
revw z17.d, p6/m, z17.d
revw z23.d, p6/m, z23.d
zip1 z30.s, z20.s, z15.s
zip2 z20.s, z20.s, z15.s
zip1 z13.s, z23.s, z17.s
zip2 z23.s, z23.s, z17.s
add z30.s, z30.s, z13.s
add z23.s, z20.s, z23.s
uzp2 z20.d, z30.d, z23.d
revw z20.d, p6/m, z20.d
uzp1 z30.d, z30.d, z23.d
add z23.s, z20.s, z30.s
sub z30.s, z30.s, z20.s
mul z23.s, p7/m, z23.s, z2.s
movprfx z20, z24
mul z20.s, p7/m, z20.s, z30.s
uzp1 z13.s, z23.s, z23.s
uzp2 z23.s, z23.s, z23.s
add z9.s, z13.s, z23.s
sub z13.s, z13.s, z23.s
addp z20.s, p5/m, z20.s, z20.s
uzp1 z20.s, z20.s, z20.s
mov z25.d, z6.d
mul z30.s, p7/m, z30.s, z6.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x300
ld1h {z17.h}, p7/z, [x3]
uzp1 z30.s, z30.s, z30.s
add x3, x0, #0x340
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z15.h}, p7/z, [x3]
zip1 z11.d, z17.d, z15.d
add x3, x0, #0x3c0
ld1h {z10.h}, p7/z, [x3]
zip2 z17.d, z17.d, z15.d
zip1 z15.d, z23.d, z10.d
zip2 z23.d, z23.d, z10.d
zip1 z6.d, z11.d, z15.d
zip1 z10.d, z17.d, z23.d
zip2 z11.d, z11.d, z15.d
revh z15.d, p6/m, z10.d
mov z0.d, z15.d
zip2 z17.d, z17.d, z23.d
revh z15.d, p6/m, z17.d
rev z16.h, z16.h
rev z26.h, z26.h
mov z5.d, z15.d
rev z28.h, z28.h
rev z31.h, z31.h
zip1 z23.d, z28.d, z16.d
zip2 z28.d, z28.d, z16.d
zip1 z16.d, z31.d, z26.d
zip2 z31.d, z31.d, z26.d
zip1 z1.d, z23.d, z16.d
zip1 z15.d, z28.d, z31.d
zip2 z23.d, z23.d, z16.d
revh z15.d, p6/m, z15.d
zip2 z28.d, z28.d, z31.d
revh z28.d, p6/m, z28.d
addvl x3, sp, #0x14
saddlb z31.s, z5.h, z28.h
mov z16.d, z6.d
add x3, x3, #0x40
saddlb z6.s, z6.h, z1.h
add z6.s, z6.s, z31.s
str z16, [x3]
ldr z31, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
str z1, [x3]
ldr z16, [x3]
addvl x3, sp, #0x17
saddlt z1.s, z31.h, z16.h
saddlt z31.s, z5.h, z28.h
add x3, x3, #0x40
str z5, [x3]
add z1.s, z1.s, z31.s
addvl x3, sp, #0x15
saddlb z31.s, z0.h, z15.h
saddlb z5.s, z11.h, z23.h
add x3, x3, #0x40
add z5.s, z5.s, z31.s
str z11, [x3]
ldr z31, [x3]
addvl x3, sp, #0x16
saddlt z31.s, z31.h, z23.h
add x3, x3, #0x40
saddlt z16.s, z0.h, z15.h
add z16.s, z31.s, z16.s
str z0, [x3]
revw z5.d, p6/m, z5.d
revw z16.d, p6/m, z16.d
zip1 z31.s, z6.s, z1.s
zip2 z6.s, z6.s, z1.s
zip1 z0.s, z16.s, z5.s
zip2 z16.s, z16.s, z5.s
add z31.s, z31.s, z0.s
add z16.s, z6.s, z16.s
uzp2 z6.d, z31.d, z16.d
revw z6.d, p6/m, z6.d
uzp1 z31.d, z31.d, z16.d
add z16.s, z6.s, z31.s
sub z31.s, z31.s, z6.s
mul z16.s, p7/m, z16.s, z2.s
uzp1 z6.s, z16.s, z16.s
uzp2 z16.s, z16.s, z16.s
add z5.s, z6.s, z16.s
sub z6.s, z6.s, z16.s
movprfx z16, z24
mul z16.s, p7/m, z16.s, z31.s
addp z16.s, p5/m, z16.s, z16.s
uzp1 z16.s, z16.s, z16.s
mul z31.s, p7/m, z31.s, z25.s
addp z31.s, p5/m, z31.s, z31.s
add x3, sp, #0x40
rshrnb z18.h, z18.s, #0xb
uzp1 z18.h, z18.h, z18.h
rshrnb z8.h, z8.s, #0xb
rshrnb z7.h, z7.s, #0xb
uzp1 z8.h, z8.h, z8.h
uzp1 z7.h, z7.h, z7.h
rshrnb z9.h, z9.s, #0xb
rshrnb z5.h, z5.s, #0xb
uzp1 z9.h, z9.h, z9.h
uzp1 z5.h, z5.h, z5.h
stp d8, d7, [x1]
rshrnb z16.h, z16.s, #0xb
uzp1 z16.h, z16.h, z16.h
rshrnb z20.h, z20.s, #0xb
stp d9, d5, [x1, #0x10]
uzp1 z20.h, z20.h, z20.h
rshrnb z13.h, z13.s, #0xb
uzp1 z13.h, z13.h, z13.h
uzp1 z31.s, z31.s, z31.s
rshrnb z31.h, z31.s, #0xb
str d18, [x1, #0x200]
ldr z18, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z8, [x3]
str d16, [x1, #0x218]
addvl x3, sp, #1
sub z16.h, z18.h, z8.h
uzp1 z31.h, z31.h, z31.h
add x3, x3, #0x40
ldr z18, [x3]
str d20, [x1, #0x210]
addvl x3, sp, #5
rshrnb z20.h, z3.s, #0xb
uzp1 z20.h, z20.h, z20.h
add x3, x3, #0x40
ldr z8, [x3]
str d13, [x1, #0x410]
addvl x3, sp, #2
rshrnb z19.h, z19.s, #0xb
rshrnb z12.h, z12.s, #0xb
add x3, x3, #0x40
ldr z13, [x3]
uzp1 z19.h, z19.h, z19.h
addvl x3, sp, #6
uzp1 z12.h, z12.h, z12.h
rshrnb z6.h, z6.s, #0xb
add x3, x3, #0x40
ldr z10, [x3]
uzp1 z6.h, z6.h, z6.h
rshrnb z29.h, z29.s, #0xb
rshrnb z30.h, z30.s, #0xb
uzp1 z29.h, z29.h, z29.h
uzp1 z30.h, z30.h, z30.h
sub z18.h, z18.h, z8.h
str d19, [x1, #0x208]
str d20, [x1, #0x400]
rshrnb z20.h, z4.s, #0xb
uzp1 z20.h, z20.h, z20.h
str d12, [x1, #0x408]
str d6, [x1, #0x418]
str d20, [x1, #0x600]
str d29, [x1, #0x608]
str d30, [x1, #0x610]
str d31, [x1, #0x618]
sub z31.h, z13.h, z10.h
revh z7.d, p6/m, z31.d
addvl x3, sp, #3
add x3, x3, #0x40
ldr z31, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z30, [x3]
sub z31.h, z31.h, z30.h
revh z6.d, p6/m, z31.d
addvl x3, sp, #8
add x3, x3, #0x40
ldr z8, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z3, [x3]
sub z2.h, z8.h, z3.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z8, [x3]
sub z5.h, z8.h, z21.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z29, [x3]
sub z31.h, z29.h, z14.h
revh z1.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z26, [x3]
sub z31.h, z26.h, z27.h
revh z0.d, p6/m, z31.d
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z8, [x3]
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z3, [x3]
sub z11.h, z8.h, z3.h
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z8, [x3]
sub z10.h, z8.h, z22.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z24, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z8, [x3]
sub z31.h, z24.h, z8.h
revh z17.d, p6/m, z31.d
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z20, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z4, [x3]
sub z31.h, z20.h, z4.h
revh z24.d, p6/m, z31.d
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z3, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z12, [x3]
sub z26.h, z3.h, z12.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z3, [x3]
sub z25.h, z3.h, z23.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z3.h, z15.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z12, [x3]
sub z31.h, z12.h, z28.h
revh z4.d, p6/m, z31.d
addvl x3, sp, #0x1b
movi d31, #0000000000000000
ld1h {z13.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z12.h[0]
addvl x3, sp, #0x1c
movprfx z19, z31
sdot z19.d, z5.h, z12.h[0]
movprfx z29, z31
sdot z29.d, z10.h, z12.h[0]
add x3, x3, #0x40
ldr z9, [x3]
movprfx z20, z31
sdot z20.d, z25.h, z12.h[0]
addvl x3, sp, #0x1d
sdot z30.d, z16.h, z13.h[0]
sdot z19.d, z2.h, z13.h[0]
add x3, x3, #0x40
ldr z8, [x3]
sdot z30.d, z7.h, z9.h[0]
add x3, x1, #0x40
sdot z30.d, z6.h, z8.h[0]
sdot z19.d, z1.h, z9.h[0]
sdot z29.d, z11.h, z13.h[0]
sdot z19.d, z0.h, z8.h[0]
sdot z29.d, z17.h, z9.h[0]
sdot z20.d, z26.h, z13.h[0]
sdot z29.d, z24.h, z8.h[0]
sdot z20.d, z3.h, z9.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z4.h, z8.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z20.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z18.h, z12.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z12.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z12.h[1]
sdot z30.d, z16.h, z13.h[1]
sdot z19.d, z2.h, z13.h[1]
sdot z30.d, z7.h, z9.h[1]
sdot z19.d, z1.h, z9.h[1]
sdot z30.d, z6.h, z8.h[1]
sdot z19.d, z0.h, z8.h[1]
sdot z29.d, z11.h, z13.h[1]
sdot z20.d, z26.h, z13.h[1]
sdot z29.d, z17.h, z9.h[1]
sdot z20.d, z3.h, z9.h[1]
sdot z29.d, z24.h, z8.h[1]
sdot z20.d, z4.h, z8.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #0x1f
cntb x6
add x3, x3, #0x40
ldr z13, [x3]
lsl x6, x6, #5
addvl x3, sp, #0x1e
movprfx z30, z31
sdot z30.d, z18.h, z13.h[0]
movprfx z19, z31
sdot z19.d, z5.h, z13.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z29, z31
sdot z29.d, z10.h, z13.h[0]
cntb x3
movprfx z20, z31
sdot z20.d, z25.h, z13.h[0]
sdot z30.d, z16.h, z12.h[0]
lsl x3, x3, #5
sdot z19.d, z2.h, z12.h[0]
sdot z29.d, z11.h, z12.h[0]
add x3, sp, x3
sdot z20.d, z26.h, z12.h[0]
add x3, x3, #0x40
ldr z9, [x3]
sdot z30.d, z7.h, z9.h[0]
addvl x3, x6, #1
sdot z19.d, z1.h, z9.h[0]
sdot z29.d, z17.h, z9.h[0]
add x3, x3, #0x40
sdot z20.d, z3.h, z9.h[0]
rdvl x6, #0x11
add x3, sp, x3
ldr z8, [x3]
sdot z19.d, z0.h, z8.h[0]
add x3, x1, #0x140
sdot z20.d, z4.h, z8.h[0]
sdot z30.d, z6.h, z8.h[0]
sdot z29.d, z24.h, z8.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z18.h, z13.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z13.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z13.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z13.h[1]
sdot z30.d, z16.h, z12.h[1]
sdot z19.d, z2.h, z12.h[1]
sdot z30.d, z7.h, z9.h[1]
sdot z19.d, z1.h, z9.h[1]
sdot z30.d, z6.h, z8.h[1]
sdot z19.d, z0.h, z8.h[1]
sdot z29.d, z11.h, z12.h[1]
sdot z20.d, z26.h, z12.h[1]
sdot z29.d, z17.h, z9.h[1]
sdot z20.d, z3.h, z9.h[1]
sdot z29.d, z24.h, z8.h[1]
sdot z20.d, z4.h, z8.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x1c0
ld1h {z9.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z9.h[0]
add x3, x2, #0x2c0
ld1h {z12.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z9.h[0]
add x3, x2, #0x3c0
ld1h {z13.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[0]
rdvl x3, #0x11
movprfx z20, z31
sdot z20.d, z25.h, z9.h[0]
lsl x6, x6, #1
lsl x3, x3, #1
add x3, sp, x3
add x3, x3, #0x40
ldr z8, [x3]
sdot z30.d, z16.h, z8.h[0]
add x3, x1, #0x240
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z2.h, z8.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z29.d, z11.h, z8.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z26.h, z8.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z3.h, z12.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z4.h, z13.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z20.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z18.h, z9.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z9.h[1]
sdot z30.d, z16.h, z8.h[1]
sdot z19.d, z2.h, z8.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z8.h[1]
sdot z20.d, z26.h, z8.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x2e0
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x3e0
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x340
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x400
ld1h {z13.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z9.h[0]
addvl x3, x6, #1
movprfx z19, z31
sdot z19.d, z5.h, z9.h[0]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[0]
add x3, x3, #0x40
movprfx z20, z31
sdot z20.d, z25.h, z9.h[0]
add x3, sp, x3
ldr z8, [x3]
sdot z30.d, z16.h, z8.h[0]
add x3, x1, #0x440
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z2.h, z8.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z29.d, z11.h, z8.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z26.h, z8.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z3.h, z12.h[0]
uzp1 z30.s, z30.s, z19.s
sdot z20.d, z4.h, z13.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z20.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z18.h, z9.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z9.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z9.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z9.h[1]
sdot z30.d, z16.h, z8.h[1]
sdot z19.d, z2.h, z8.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z8.h[1]
sdot z20.d, z26.h, z8.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x420
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x540
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x440
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x640
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z9.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z8.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z12.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z18.h, z8.h[0]
add x3, x2, #0x460
ld1h {z13.h}, p7/z, [x3]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[0]
add x3, x1, #0x740
movprfx z29, z31
sdot z29.d, z10.h, z8.h[0]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[0]
sdot z30.d, z16.h, z9.h[0]
sdot z19.d, z2.h, z9.h[0]
sdot z30.d, z7.h, z12.h[0]
sdot z19.d, z1.h, z12.h[0]
sdot z30.d, z6.h, z13.h[0]
sdot z19.d, z0.h, z13.h[0]
sdot z29.d, z11.h, z9.h[0]
sdot z20.d, z26.h, z9.h[0]
sdot z29.d, z17.h, z12.h[0]
sdot z20.d, z3.h, z12.h[0]
sdot z29.d, z24.h, z13.h[0]
sdot z20.d, z4.h, z13.h[0]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z18.h, z8.h[1]
movprfx z19, z31
sdot z19.d, z5.h, z8.h[1]
movprfx z29, z31
sdot z29.d, z10.h, z8.h[1]
movprfx z20, z31
sdot z20.d, z25.h, z8.h[1]
sdot z30.d, z16.h, z9.h[1]
sdot z19.d, z2.h, z9.h[1]
sdot z30.d, z7.h, z12.h[1]
sdot z19.d, z1.h, z12.h[1]
sdot z30.d, z6.h, z13.h[1]
sdot z19.d, z0.h, z13.h[1]
sdot z29.d, z11.h, z9.h[1]
sdot z20.d, z26.h, z9.h[1]
sdot z29.d, z17.h, z12.h[1]
sdot z20.d, z3.h, z12.h[1]
sdot z29.d, z24.h, z13.h[1]
sdot z20.d, z4.h, z13.h[1]
uzp1 z30.s, z30.s, z19.s
uzp1 z29.s, z29.s, z20.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z18, [x3]
add x3, sp, #0x40
ldr z2, [x3]
add z30.h, z18.h, z2.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z18, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z2, [x3]
add z29.h, z18.h, z2.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z10, [x3]
add z19.h, z13.h, z10.h
addvl x3, sp, #3
sub z18.h, z29.h, z19.h
add z29.h, z29.h, z19.h
add x3, x3, #0x40
ldr z26, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z25, [x3]
add z16.h, z26.h, z25.h
addvl x3, sp, #0xc
sub z20.h, z30.h, z16.h
add z30.h, z30.h, z16.h
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #8
add x3, x3, #0x40
ldr z10, [x3]
add z24.h, z13.h, z10.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z13, [x3]
add z21.h, z21.h, z13.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z5, [x3]
add z14.h, z5.h, z14.h
addvl x3, sp, #0xb
sub z12.h, z21.h, z14.h
add x3, x3, #0x40
ldr z1, [x3]
add z27.h, z1.h, z27.h
addvl x3, sp, #0x11
sub z13.h, z24.h, z27.h
add x3, x3, #0x40
ldr z25, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z10, [x3]
add z25.h, z25.h, z10.h
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z10, [x3]
add z22.h, z22.h, z10.h
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z9, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z8, [x3]
add z8.h, z9.h, z8.h
addvl x3, sp, #0x10
sub z7.h, z22.h, z8.h
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z4, [x3]
add z6.h, z17.h, z4.h
addvl x3, sp, #0x18
sub z9.h, z25.h, z6.h
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z10, [x3]
add z26.h, z17.h, z10.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z17, [x3]
add z23.h, z23.h, z17.h
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z3, [x3]
add z15.h, z3.h, z15.h
addvl x3, sp, #0x17
sub z10.h, z23.h, z15.h
add x3, x3, #0x40
ldr z17, [x3]
add z28.h, z17.h, z28.h
add x3, x2, #0x480
ld1h {z5.h}, p7/z, [x3]
sub z11.h, z26.h, z28.h
add x3, x2, #0x500
ld1h {z4.h}, p7/z, [x3]
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
add x3, x1, #0x80
sdot z17.d, z20.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
sdot z1.d, z13.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
uzp1 z17.s, z17.s, z1.s
sdot z2.d, z11.h, z5.h[0]
rshrnb z17.h, z17.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x1, #0x180
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z17.d, z20.h, z5.h[1]
sdot z1.d, z13.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z11.h, z5.h[1]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z17.d, z20.h, z5.h[0]
sdot z1.d, z13.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z11.h, z5.h[0]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x1, #0x380
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z17.d, z20.h, z5.h[1]
sdot z1.d, z13.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z11.h, z5.h[1]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z4.h}, p7/z, [x3]
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
add x3, x1, #0x480
sdot z17.d, z20.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
sdot z1.d, z13.h, z5.h[0]
sdot z3.d, z9.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
uzp1 z17.s, z17.s, z1.s
sdot z2.d, z11.h, z5.h[0]
rshrnb z17.h, z17.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x1, #0x580
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z17.d, z20.h, z5.h[1]
sdot z1.d, z13.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[1]
sdot z3.d, z9.h, z5.h[1]
sdot z2.d, z11.h, z5.h[1]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z17, z31
sdot z17.d, z18.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z17.d, z20.h, z5.h[0]
sdot z1.d, z13.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z7.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z10.h, z4.h[0]
sdot z3.d, z9.h, z5.h[0]
sdot z2.d, z11.h, z5.h[0]
uzp1 z17.s, z17.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z17.h, z17.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z17.h, z17.h, z3.h
st1h {z17.h}, p7, [x3]
movprfx z17, z31
sdot z17.d, z18.h, z4.h[1]
add x3, x1, #0x780
sdot z17.d, z20.h, z5.h[1]
movprfx z18, z31
sdot z18.d, z7.h, z4.h[1]
movprfx z20, z31
sdot z20.d, z12.h, z4.h[1]
sdot z18.d, z9.h, z5.h[1]
sdot z20.d, z13.h, z5.h[1]
movprfx z13, z31
sdot z13.d, z10.h, z4.h[1]
uzp1 z17.s, z17.s, z20.s
sdot z13.d, z11.h, z5.h[1]
rshrnb z17.h, z17.s, #0xb
uzp1 z18.s, z18.s, z13.s
rshrnb z18.h, z18.s, #0xb
uzp1 z17.h, z17.h, z18.h
st1h {z17.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z24.h, z24.h, z27.h
add z21.h, z21.h, z14.h
revh z21.d, p6/m, z21.d
sub z24.h, z24.h, z21.h
add z25.h, z25.h, z6.h
add z22.h, z22.h, z8.h
revh z22.d, p6/m, z22.d
sub z25.h, z25.h, z22.h
add z26.h, z26.h, z28.h
add z23.h, z23.h, z15.h
revh z23.d, p6/m, z23.d
add x3, x2, #0x580
ld1h {z15.h}, p7/z, [x3]
sub z26.h, z26.h, z23.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z23, z31
sdot z23.d, z24.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z26.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[0]
uzp1 z29.s, z29.s, z23.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
add x3, x1, #0x300
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
movprfx z23, z31
sdot z23.d, z24.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z26.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[1]
uzp1 z29.s, z29.s, z23.s
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
movprfx z23, z31
sdot z23.d, z24.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z26.h, z15.h[0]
uzp1 z29.s, z29.s, z23.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z25.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z24.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z26.h, z15.h[1]
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
