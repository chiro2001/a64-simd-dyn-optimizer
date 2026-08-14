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
add x3, x3, #0xdf0
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
addvl x11, sp, #3
add x30, x0, x2, lsl #2
add x11, x11, #0x70
str z31, [x11]
add x2, x0, x2, lsl #3
add x11, x3, #0x180
ld1h {z3.h}, p7/z, [x11]
add x14, x0, x9, lsl #1
add x11, x3, #0x280
ld1h {z2.h}, p7/z, [x11]
add x10, x0, x10, lsl #1
add x11, x3, #0x380
ld1h {z31.h}, p7/z, [x11]
add x7, x0, x7, lsl #1
addvl x11, sp, #0x1d
add x5, x0, x5, lsl #1
add x11, x11, #0x70
str z31, [x11]
add x9, x0, x9, lsl #2
add x11, x3, #0xa0
ld1h {z5.h}, p7/z, [x11]
add x8, x0, x8, lsl #1
add x11, x3, #0x1a0
ld1h {z4.h}, p7/z, [x11]
add x20, x1, #0x40
add x11, x3, #0x2a0
add x18, x18, x2
ld1h {z0.h}, p7/z, [x11]
add x21, x3, #0x80
add x11, x3, #0x3a0
ld1h {z31.h}, p7/z, [x11]
mov x6, #0
addvl x11, sp, #0x1e
add x11, x11, #0x70
str z31, [x11]
add x11, x3, #0x100
ld1h {z9.h}, p7/z, [x11]
mov z6.d, z9.d
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
addvl x11, sp, #0x13
rev z30.h, z30.h
add x11, x11, #0x70
sub z24.h, z1.h, z30.h
str z24, [x11]
add x11, x17, #0x20
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x14
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
addvl x11, sp, #0x15
ld1h {z12.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z29.h, z12.h, z30.h
str z29, [x11]
add x11, x14, #0x20
add z12.h, z12.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x16
ld1h {z13.h}, p7/z, [x14]
rev z30.h, z30.h
add x11, x11, #0x70
sub z16.h, z13.h, z30.h
str z16, [x11]
add x11, x18, x6
ld1h {z29.h}, p7/z, [x11]
add z13.h, z13.h, z30.h
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x17
sub z23.h, z29.h, z30.h
add z29.h, z29.h, z30.h
add x11, x11, #0x70
str z23, [x11]
ld1h {z25.h}, p7/z, [x10]
add x11, x10, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x13, #0x20
sub z22.h, z25.h, z30.h
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x18
ld1h {z14.h}, p7/z, [x13]
add x11, x11, #0x70
rev z30.h, z30.h
sub z26.h, z14.h, z30.h
str z26, [x11]
add x11, x7, #0x20
add z14.h, z14.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x12, #0x20
ld1h {z26.h}, p7/z, [x11]
addvl x11, sp, #0x19
rev z30.h, z30.h
ld1h {z15.h}, p7/z, [x7]
add x11, x11, #0x70
sub z7.h, z15.h, z30.h
rev z26.h, z26.h
add z15.h, z15.h, z30.h
ld1h {z30.h}, p7/z, [x12]
sub z23.h, z30.h, z26.h
str z23, [x11]
add x11, x5, #0x20
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x1a
rev z17.h, z17.h
add z30.h, z30.h, z26.h
add x11, x11, #0x70
ld1h {z26.h}, p7/z, [x5]
sub z10.h, z26.h, z17.h
str z10, [x11]
add x11, x9, #0x20
add z26.h, z26.h, z17.h
ld1h {z17.h}, p7/z, [x11]
add x11, x8, #0x20
rev z17.h, z17.h
ld1h {z10.h}, p7/z, [x11]
rev z10.h, z10.h
ld1h {z16.h}, p7/z, [x9]
ptrue p6.d
sub z8.h, z16.h, z17.h
add z16.h, z16.h, z17.h
ld1h {z17.h}, p7/z, [x8]
sub z9.h, z17.h, z10.h
add z17.h, z17.h, z10.h
zip1 z10.d, z31.d, z1.d
zip2 z31.d, z31.d, z1.d
zip1 z1.d, z27.d, z11.d
zip2 z27.d, z27.d, z11.d
zip1 z23.d, z10.d, z1.d
zip1 z11.d, z31.d, z27.d
zip2 z10.d, z10.d, z1.d
revh z1.d, p6/m, z11.d
add x11, sp, #0x70
zip2 z31.d, z31.d, z27.d
str z1, [x11]
revh z27.d, p6/m, z31.d
addvl x11, sp, #9
saddlb z11.s, z23.h, z27.h
add x11, x11, #0x70
str z23, [x11]
ldr z23, [x11]
addvl x11, sp, #0xb
saddlt z1.s, z23.h, z27.h
add x11, x11, #0x70
str z27, [x11]
mov z27.d, z10.d
add x11, sp, #0x70
ldr z31, [x11]
saddlb z10.s, z10.h, z31.h
addvl x11, sp, #0xa
add x11, x11, #0x70
str z27, [x11]
ldr z23, [x11]
saddlt z27.s, z23.h, z31.h
revw z10.d, p6/m, z10.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z11.s, z1.s
zip2 z11.s, z11.s, z1.s
zip1 z23.s, z27.s, z10.s
zip2 z27.s, z27.s, z10.s
add z31.s, z31.s, z23.s
add z27.s, z11.s, z27.s
uzp2 z11.d, z31.d, z27.d
revw z11.d, p6/m, z11.d
ptrue p5.s
uzp1 z31.d, z31.d, z27.d
ld1w {z27.s}, p7/z, [x3]
add z10.s, z11.s, z31.s
sub z31.s, z31.s, z11.s
movprfx z11, z10
mul z11.s, p7/m, z11.s, z27.s
addp z11.s, p5/m, z11.s, z11.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z1, [x11]
mul z1.s, p7/m, z1.s, z31.s
addp z1.s, p5/m, z1.s, z1.s
addvl x11, sp, #2
uzp1 z1.s, z1.s, z1.s
add x11, x11, #0x70
ldr z23, [x11]
mul z10.s, p7/m, z10.s, z23.s
addp z10.s, p5/m, z10.s, z10.s
addvl x11, sp, #0x1b
uzp1 z10.s, z10.s, z10.s
add x11, x11, #0x70
str z10, [x11]
addvl x11, sp, #3
add x11, x11, #0x70
ldr z10, [x11]
mul z31.s, p7/m, z31.s, z10.s
addp z31.s, p5/m, z31.s, z31.s
uzp1 z23.s, z31.s, z31.s
addvl x11, sp, #0x1c
zip1 z31.d, z28.d, z12.d
add x11, x11, #0x70
zip2 z28.d, z28.d, z12.d
zip1 z12.d, z24.d, z13.d
zip2 z24.d, z24.d, z13.d
zip1 z13.d, z31.d, z12.d
str z23, [x11]
zip2 z23.d, z31.d, z12.d
zip1 z31.d, z28.d, z24.d
revh z12.d, p6/m, z31.d
mov z10.d, z12.d
zip2 z28.d, z28.d, z24.d
revh z28.d, p6/m, z28.d
addvl x11, sp, #0xc
saddlb z24.s, z13.h, z28.h
add x11, x11, #0x70
str z13, [x11]
ldr z13, [x11]
addvl x11, sp, #0xf
saddlt z12.s, z13.h, z28.h
saddlb z13.s, z23.h, z10.h
add x11, x11, #0x70
str z28, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
str z23, [x11]
ldr z31, [x11]
addvl x11, sp, #0xe
saddlt z28.s, z31.h, z10.h
add x11, x11, #0x70
str z10, [x11]
revw z13.d, p6/m, z13.d
revw z28.d, p6/m, z28.d
zip1 z10.s, z28.s, z13.s
zip1 z31.s, z24.s, z12.s
zip2 z28.s, z28.s, z13.s
add z31.s, z31.s, z10.s
zip2 z24.s, z24.s, z12.s
add z28.s, z24.s, z28.s
uzp2 z13.d, z31.d, z28.d
revw z13.d, p6/m, z13.d
uzp1 z31.d, z31.d, z28.d
add z24.s, z13.s, z31.s
sub z28.s, z31.s, z13.s
movprfx z12, z24
mul z12.s, p7/m, z12.s, z27.s
addp z12.s, p5/m, z12.s, z12.s
addvl x11, sp, #1
uzp1 z12.s, z12.s, z12.s
add x11, x11, #0x70
ldr z13, [x11]
mul z13.s, p7/m, z13.s, z28.s
addp z13.s, p5/m, z13.s, z13.s
addvl x11, sp, #2
uzp1 z13.s, z13.s, z13.s
add x11, x11, #0x70
ldr z23, [x11]
mul z24.s, p7/m, z24.s, z23.s
addp z24.s, p5/m, z24.s, z24.s
addvl x11, sp, #3
uzp1 z24.s, z24.s, z24.s
add x11, x11, #0x70
ldr z10, [x11]
mul z28.s, p7/m, z28.s, z10.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z31.d, z29.d, z14.d
uzp1 z28.s, z28.s, z28.s
zip2 z29.d, z29.d, z14.d
zip1 z14.d, z25.d, z15.d
zip2 z25.d, z25.d, z15.d
zip2 z23.d, z31.d, z14.d
zip1 z15.d, z31.d, z14.d
zip1 z31.d, z29.d, z25.d
revh z14.d, p6/m, z31.d
mov z31.d, z14.d
zip2 z29.d, z29.d, z25.d
revh z29.d, p6/m, z29.d
addvl x11, sp, #0x10
saddlb z25.s, z15.h, z29.h
add x11, x11, #0x70
str z15, [x11]
ldr z15, [x11]
addvl x11, sp, #4
saddlt z14.s, z15.h, z29.h
saddlb z15.s, z23.h, z31.h
add x11, x11, #0x70
str z29, [x11]
addvl x11, sp, #0x11
add x11, x11, #0x70
str z23, [x11]
ldr z23, [x11]
addvl x11, sp, #0x12
saddlt z29.s, z23.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z15.d, p6/m, z15.d
revw z29.d, p6/m, z29.d
zip1 z10.s, z29.s, z15.s
zip1 z31.s, z25.s, z14.s
zip2 z29.s, z29.s, z15.s
add z31.s, z31.s, z10.s
zip2 z25.s, z25.s, z14.s
add z29.s, z25.s, z29.s
uzp2 z15.d, z31.d, z29.d
revw z15.d, p6/m, z15.d
uzp1 z31.d, z31.d, z29.d
add z25.s, z15.s, z31.s
sub z29.s, z31.s, z15.s
movprfx z14, z25
mul z14.s, p7/m, z14.s, z27.s
addp z14.s, p5/m, z14.s, z14.s
addvl x11, sp, #1
uzp1 z14.s, z14.s, z14.s
add x11, x11, #0x70
ldr z15, [x11]
mul z15.s, p7/m, z15.s, z29.s
addp z15.s, p5/m, z15.s, z15.s
addvl x11, sp, #2
uzp1 z15.s, z15.s, z15.s
add x11, x11, #0x70
ldr z23, [x11]
mul z25.s, p7/m, z25.s, z23.s
addp z25.s, p5/m, z25.s, z25.s
addvl x11, sp, #3
uzp1 z25.s, z25.s, z25.s
add x11, x11, #0x70
ldr z10, [x11]
mul z29.s, p7/m, z29.s, z10.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z31.d, z30.d, z16.d
uzp1 z29.s, z29.s, z29.s
zip2 z30.d, z30.d, z16.d
zip1 z16.d, z26.d, z17.d
zip2 z26.d, z26.d, z17.d
zip2 z23.d, z31.d, z16.d
zip1 z17.d, z31.d, z16.d
zip1 z31.d, z30.d, z26.d
revh z16.d, p6/m, z31.d
mov z31.d, z16.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
addvl x11, sp, #5
saddlb z26.s, z17.h, z30.h
add x11, x11, #0x70
str z17, [x11]
ldr z17, [x11]
addvl x11, sp, #8
saddlt z16.s, z17.h, z30.h
add x11, x11, #0x70
str z30, [x11]
mov z30.d, z23.d
addvl x11, sp, #6
mov z23.d, z31.d
saddlb z17.s, z30.h, z31.h
add x11, x11, #0x70
str z30, [x11]
ldr z31, [x11]
addvl x11, sp, #7
saddlt z30.s, z31.h, z23.h
add x11, x11, #0x70
str z23, [x11]
revw z17.d, p6/m, z17.d
revw z30.d, p6/m, z30.d
zip1 z31.s, z26.s, z16.s
zip2 z26.s, z26.s, z16.s
zip1 z10.s, z30.s, z17.s
zip2 z30.s, z30.s, z17.s
add z31.s, z31.s, z10.s
add z30.s, z26.s, z30.s
uzp2 z26.d, z31.d, z30.d
revw z26.d, p6/m, z26.d
uzp1 z31.d, z31.d, z30.d
add z30.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
mul z27.s, p7/m, z27.s, z30.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #1
uzp1 z27.s, z27.s, z27.s
add x11, x11, #0x70
ldr z26, [x11]
mul z26.s, p7/m, z26.s, z31.s
addp z26.s, p5/m, z26.s, z26.s
addvl x11, sp, #2
uzp1 z26.s, z26.s, z26.s
add x11, x11, #0x70
ldr z23, [x11]
mul z30.s, p7/m, z30.s, z23.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #3
uzp1 z30.s, z30.s, z30.s
add x11, x11, #0x70
ldr z10, [x11]
mul z31.s, p7/m, z31.s, z10.s
addp z31.s, p5/m, z31.s, z31.s
addvl x11, sp, #0x1b
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
add x11, x11, #0x70
uzp1 z11.s, z11.s, z11.s
rshrnb z12.h, z12.s, #4
rshrnb z11.h, z11.s, #4
uzp1 z12.h, z12.h, z12.h
uzp1 z11.h, z11.h, z11.h
rshrnb z14.h, z14.s, #4
rshrnb z27.h, z27.s, #4
uzp1 z14.h, z14.h, z14.h
uzp1 z27.h, z27.h, z27.h
stp d11, d12, [x1]
rshrnb z25.h, z25.s, #4
uzp1 z25.h, z25.h, z25.h
rshrnb z24.h, z24.s, #4
uzp1 z24.h, z24.h, z24.h
stp d14, d27, [x1, #0x10]
rshrnb z30.h, z30.s, #4
uzp1 z30.h, z30.h, z30.h
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
uzp1 z31.s, z31.s, z31.s
str d26, [x1, #0x218]
ldr z26, [x11]
addvl x11, sp, #0x1c
add x11, x11, #0x70
str d25, [x1, #0x410]
ldr z25, [x11]
addvl x11, sp, #0x13
str d24, [x1, #0x408]
rshrnb z27.h, z26.s, #4
add x11, x11, #0x70
ldr z24, [x11]
str d30, [x1, #0x418]
addvl x11, sp, #0x14
rshrnb z30.h, z25.s, #4
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
ldr z14, [x11]
str d30, [x1, #0x600]
addvl x11, sp, #0x15
trn2 z30.d, z18.d, z14.d
str d28, [x1, #0x608]
add x11, x11, #0x70
zip1 z28.d, z18.d, z14.d
trn1 z18.d, z18.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x16
uzp1 z27.h, z27.h, z27.h
add x11, x11, #0x70
ldr z16, [x11]
rshrnb z29.h, z29.s, #4
addvl x11, sp, #0x18
uzp1 z29.h, z29.h, z29.h
rshrnb z31.h, z31.s, #4
add x11, x11, #0x70
uzp1 z31.h, z31.h, z31.h
ldr z11, [x11]
str d27, [x1, #0x400]
rshrnb z1.h, z1.s, #4
uzp1 z1.h, z1.h, z1.h
str d29, [x1, #0x610]
zip1 z29.d, z19.d, z24.d
zip1 z26.d, z29.d, z28.d
zip1 z28.d, z20.d, z16.d
str d31, [x1, #0x618]
trn2 z31.d, z19.d, z24.d
trn1 z19.d, z19.d, z24.d
zip1 z27.d, z31.d, z30.d
zip2 z24.d, z31.d, z30.d
trn2 z30.d, z20.d, z16.d
trn1 z20.d, z20.d, z16.d
ldr z16, [x11]
addvl x11, sp, #0x17
trn2 z31.d, z21.d, z14.d
zip1 z29.d, z21.d, z14.d
add x11, x11, #0x70
ldr z23, [x11]
trn1 z21.d, z21.d, z14.d
addvl x11, sp, #0x19
zip2 z25.d, z19.d, z18.d
zip1 z18.d, z29.d, z28.d
add x11, x11, #0x70
ldr z14, [x11]
zip1 z28.d, z22.d, z7.d
addvl x11, sp, #0x1a
zip1 z29.d, z23.d, z16.d
str d1, [x1, #0x200]
add x11, x11, #0x70
ldr z1, [x11]
zip1 z19.d, z31.d, z30.d
addvl x11, sp, #0x1d
zip2 z21.d, z21.d, z20.d
zip2 z20.d, z31.d, z30.d
add x11, x11, #0x70
trn2 z31.d, z23.d, z16.d
trn2 z30.d, z22.d, z7.d
zip1 z16.d, z29.d, z28.d
zip1 z29.d, z14.d, z8.d
zip1 z28.d, z1.d, z9.d
zip1 z17.d, z31.d, z30.d
trn1 z23.d, z23.d, z11.d
trn1 z22.d, z22.d, z7.d
zip2 z11.d, z31.d, z30.d
zip1 z7.d, z29.d, z28.d
trn2 z30.d, z1.d, z9.d
trn2 z31.d, z14.d, z8.d
trn1 z29.d, z14.d, z8.d
ldr z14, [x11]
trn1 z28.d, z1.d, z9.d
add x11, x1, #0x40
rshrnb z13.h, z13.s, #4
rshrnb z15.h, z15.s, #4
uzp1 z13.h, z13.h, z13.h
uzp1 z15.h, z15.h, z15.h
str d13, [x1, #0x208]
zip1 z10.d, z31.d, z30.d
zip2 z9.d, z29.d, z28.d
str d15, [x1, #0x210]
zip2 z8.d, z31.d, z30.d
zip2 z22.d, z23.d, z22.d
movi d31, #0000000000000000
ld1h {z15.h}, p7/z, [x21]
movprfx z30, z31
sdot z30.d, z27.h, z3.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z3.h[0]
sdot z30.d, z26.h, z15.h[0]
sdot z23.d, z18.h, z15.h[0]
sdot z30.d, z25.h, z2.h[0]
sdot z23.d, z21.h, z2.h[0]
sdot z30.d, z24.h, z14.h[0]
sdot z23.d, z20.h, z14.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z3.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z3.h[0]
sdot z29.d, z16.h, z15.h[0]
sdot z28.d, z7.h, z15.h[0]
sdot z29.d, z22.h, z2.h[0]
sdot z28.d, z9.h, z2.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z8.h, z14.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z3.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z3.h[1]
sdot z30.d, z26.h, z15.h[1]
sdot z23.d, z18.h, z15.h[1]
sdot z30.d, z25.h, z2.h[1]
sdot z23.d, z21.h, z2.h[1]
sdot z30.d, z24.h, z14.h[1]
sdot z23.d, z20.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z3.h[1]
sdot z29.d, z16.h, z15.h[1]
sdot z28.d, z7.h, z15.h[1]
sdot z29.d, z22.h, z2.h[1]
sdot z28.d, z9.h, z2.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z8.h, z14.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #0x1e
add x11, x11, #0x70
ldr z15, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z4.h[0]
add x11, x1, #0x140
sdot z30.d, z26.h, z5.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[0]
sdot z30.d, z25.h, z0.h[0]
sdot z23.d, z18.h, z5.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z21.h, z0.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[0]
sdot z29.d, z22.h, z0.h[0]
sdot z28.d, z7.h, z5.h[0]
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
sdot z30.d, z27.h, z4.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[1]
sdot z30.d, z26.h, z5.h[1]
sdot z23.d, z18.h, z5.h[1]
sdot z30.d, z25.h, z0.h[1]
sdot z23.d, z21.h, z0.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[1]
sdot z29.d, z16.h, z5.h[1]
sdot z28.d, z7.h, z5.h[1]
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
add x11, x3, #0xc0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1c0
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x2c0
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x3c0
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x240
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
add x11, x1, #0x2c0
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
add x11, x3, #0xe0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1e0
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x2e0
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x3e0
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x340
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
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x3, #0x400
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
add x11, x1, #0x440
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[0]
sdot z30.d, z26.h, z6.h[0]
sdot z23.d, z18.h, z6.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z6.h[0]
sdot z28.d, z7.h, z6.h[0]
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
sdot z30.d, z26.h, z6.h[1]
sdot z23.d, z18.h, z6.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z6.h[1]
sdot z28.d, z7.h, z6.h[1]
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
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x540
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
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x640
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
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x740
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
addvl x11, sp, #9
add x11, x11, #0x70
ldr z18, [x11]
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z18.h, z13.h
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z17, [x11]
add x11, sp, #0x70
ldr z16, [x11]
sub z22.h, z17.h, z16.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xf
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z8, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z30, [x11]
sub z27.h, z8.h, z30.h
addvl x11, sp, #0x11
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #0x12
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
ldr z25, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z24, [x11]
add z30.h, z25.h, z24.h
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
addvl x11, sp, #0x13
rev z30.h, z30.h
add x11, x11, #0x70
sub z24.h, z1.h, z30.h
str z24, [x11]
add x11, x17, #0x20
add z1.h, z1.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x14
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
addvl x11, sp, #0x15
ld1h {z12.h}, p7/z, [x15]
rev z30.h, z30.h
add x11, x11, #0x70
sub z29.h, z12.h, z30.h
str z29, [x11]
add x11, x14, #0x20
add z12.h, z12.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x16
ld1h {z13.h}, p7/z, [x14]
rev z30.h, z30.h
add x11, x11, #0x70
sub z16.h, z13.h, z30.h
str z16, [x11]
add x11, x18, x6
ld1h {z29.h}, p7/z, [x11]
add z13.h, z13.h, z30.h
add x11, x11, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
addvl x11, sp, #0x17
sub z23.h, z29.h, z30.h
add z29.h, z29.h, z30.h
add x11, x11, #0x70
str z23, [x11]
ld1h {z25.h}, p7/z, [x10]
add x11, x10, #0x20
ld1h {z30.h}, p7/z, [x11]
rev z30.h, z30.h
add x11, x13, #0x20
sub z22.h, z25.h, z30.h
add z25.h, z25.h, z30.h
ld1h {z30.h}, p7/z, [x11]
addvl x11, sp, #0x18
ld1h {z14.h}, p7/z, [x13]
add x11, x11, #0x70
rev z30.h, z30.h
sub z26.h, z14.h, z30.h
str z26, [x11]
add x11, x7, #0x20
add z14.h, z14.h, z30.h
ld1h {z30.h}, p7/z, [x11]
add x11, x12, #0x20
ld1h {z26.h}, p7/z, [x11]
addvl x11, sp, #0x19
rev z30.h, z30.h
ld1h {z15.h}, p7/z, [x7]
add x11, x11, #0x70
sub z7.h, z15.h, z30.h
rev z26.h, z26.h
add z15.h, z15.h, z30.h
ld1h {z30.h}, p7/z, [x12]
sub z23.h, z30.h, z26.h
str z23, [x11]
add x11, x5, #0x20
ld1h {z17.h}, p7/z, [x11]
addvl x11, sp, #0x1a
rev z17.h, z17.h
add z30.h, z30.h, z26.h
add x11, x11, #0x70
ld1h {z26.h}, p7/z, [x5]
sub z10.h, z26.h, z17.h
str z10, [x11]
add x11, x9, #0x20
add z26.h, z26.h, z17.h
ld1h {z17.h}, p7/z, [x11]
add x11, x8, #0x20
rev z17.h, z17.h
ld1h {z10.h}, p7/z, [x11]
rev z10.h, z10.h
ld1h {z16.h}, p7/z, [x9]
ptrue p6.d
sub z8.h, z16.h, z17.h
add z16.h, z16.h, z17.h
ld1h {z17.h}, p7/z, [x8]
sub z9.h, z17.h, z10.h
add z17.h, z17.h, z10.h
zip1 z10.d, z31.d, z1.d
zip2 z31.d, z31.d, z1.d
zip1 z1.d, z27.d, z11.d
zip2 z27.d, z27.d, z11.d
zip1 z23.d, z10.d, z1.d
zip1 z11.d, z31.d, z27.d
zip2 z10.d, z10.d, z1.d
revh z1.d, p6/m, z11.d
add x11, sp, #0x70
zip2 z31.d, z31.d, z27.d
str z1, [x11]
revh z27.d, p6/m, z31.d
addvl x11, sp, #9
saddlb z11.s, z23.h, z27.h
add x11, x11, #0x70
str z23, [x11]
ldr z23, [x11]
addvl x11, sp, #0xb
saddlt z1.s, z23.h, z27.h
add x11, x11, #0x70
str z27, [x11]
mov z27.d, z10.d
add x11, sp, #0x70
ldr z31, [x11]
saddlb z10.s, z10.h, z31.h
addvl x11, sp, #0xa
add x11, x11, #0x70
str z27, [x11]
ldr z23, [x11]
saddlt z27.s, z23.h, z31.h
revw z10.d, p6/m, z10.d
revw z27.d, p6/m, z27.d
zip1 z31.s, z11.s, z1.s
zip2 z11.s, z11.s, z1.s
zip1 z23.s, z27.s, z10.s
zip2 z27.s, z27.s, z10.s
add z31.s, z31.s, z23.s
add z27.s, z11.s, z27.s
uzp2 z11.d, z31.d, z27.d
revw z11.d, p6/m, z11.d
ptrue p5.s
uzp1 z31.d, z31.d, z27.d
ld1w {z27.s}, p7/z, [x3]
add z10.s, z11.s, z31.s
sub z31.s, z31.s, z11.s
movprfx z11, z10
mul z11.s, p7/m, z11.s, z27.s
addp z11.s, p5/m, z11.s, z11.s
addvl x11, sp, #1
add x11, x11, #0x70
ldr z1, [x11]
mul z1.s, p7/m, z1.s, z31.s
addp z1.s, p5/m, z1.s, z1.s
addvl x11, sp, #2
uzp1 z1.s, z1.s, z1.s
add x11, x11, #0x70
ldr z23, [x11]
mul z10.s, p7/m, z10.s, z23.s
addp z10.s, p5/m, z10.s, z10.s
addvl x11, sp, #0x1b
uzp1 z10.s, z10.s, z10.s
add x11, x11, #0x70
str z10, [x11]
addvl x11, sp, #3
add x11, x11, #0x70
ldr z10, [x11]
mul z31.s, p7/m, z31.s, z10.s
addp z31.s, p5/m, z31.s, z31.s
uzp1 z23.s, z31.s, z31.s
addvl x11, sp, #0x1c
zip1 z31.d, z28.d, z12.d
add x11, x11, #0x70
zip2 z28.d, z28.d, z12.d
zip1 z12.d, z24.d, z13.d
zip2 z24.d, z24.d, z13.d
zip1 z13.d, z31.d, z12.d
str z23, [x11]
zip2 z23.d, z31.d, z12.d
zip1 z31.d, z28.d, z24.d
revh z12.d, p6/m, z31.d
mov z10.d, z12.d
zip2 z28.d, z28.d, z24.d
revh z28.d, p6/m, z28.d
addvl x11, sp, #0xc
saddlb z24.s, z13.h, z28.h
add x11, x11, #0x70
str z13, [x11]
ldr z13, [x11]
addvl x11, sp, #0xf
saddlt z12.s, z13.h, z28.h
saddlb z13.s, z23.h, z10.h
add x11, x11, #0x70
str z28, [x11]
addvl x11, sp, #0xd
add x11, x11, #0x70
str z23, [x11]
ldr z31, [x11]
addvl x11, sp, #0xe
saddlt z28.s, z31.h, z10.h
add x11, x11, #0x70
str z10, [x11]
revw z13.d, p6/m, z13.d
revw z28.d, p6/m, z28.d
zip1 z10.s, z28.s, z13.s
zip1 z31.s, z24.s, z12.s
zip2 z28.s, z28.s, z13.s
add z31.s, z31.s, z10.s
zip2 z24.s, z24.s, z12.s
add z28.s, z24.s, z28.s
uzp2 z13.d, z31.d, z28.d
revw z13.d, p6/m, z13.d
uzp1 z31.d, z31.d, z28.d
add z24.s, z13.s, z31.s
sub z28.s, z31.s, z13.s
movprfx z12, z24
mul z12.s, p7/m, z12.s, z27.s
addp z12.s, p5/m, z12.s, z12.s
addvl x11, sp, #1
uzp1 z12.s, z12.s, z12.s
add x11, x11, #0x70
ldr z13, [x11]
mul z13.s, p7/m, z13.s, z28.s
addp z13.s, p5/m, z13.s, z13.s
addvl x11, sp, #2
uzp1 z13.s, z13.s, z13.s
add x11, x11, #0x70
ldr z23, [x11]
mul z24.s, p7/m, z24.s, z23.s
addp z24.s, p5/m, z24.s, z24.s
addvl x11, sp, #3
uzp1 z24.s, z24.s, z24.s
add x11, x11, #0x70
ldr z10, [x11]
mul z28.s, p7/m, z28.s, z10.s
addp z28.s, p5/m, z28.s, z28.s
zip1 z31.d, z29.d, z14.d
uzp1 z28.s, z28.s, z28.s
zip2 z29.d, z29.d, z14.d
zip1 z14.d, z25.d, z15.d
zip2 z25.d, z25.d, z15.d
zip2 z23.d, z31.d, z14.d
zip1 z15.d, z31.d, z14.d
zip1 z31.d, z29.d, z25.d
revh z14.d, p6/m, z31.d
mov z31.d, z14.d
zip2 z29.d, z29.d, z25.d
revh z29.d, p6/m, z29.d
addvl x11, sp, #0x10
saddlb z25.s, z15.h, z29.h
add x11, x11, #0x70
str z15, [x11]
ldr z15, [x11]
addvl x11, sp, #4
saddlt z14.s, z15.h, z29.h
saddlb z15.s, z23.h, z31.h
add x11, x11, #0x70
str z29, [x11]
addvl x11, sp, #0x11
add x11, x11, #0x70
str z23, [x11]
ldr z23, [x11]
addvl x11, sp, #0x12
saddlt z29.s, z23.h, z31.h
add x11, x11, #0x70
str z31, [x11]
revw z15.d, p6/m, z15.d
revw z29.d, p6/m, z29.d
zip1 z10.s, z29.s, z15.s
zip1 z31.s, z25.s, z14.s
zip2 z29.s, z29.s, z15.s
add z31.s, z31.s, z10.s
zip2 z25.s, z25.s, z14.s
add z29.s, z25.s, z29.s
uzp2 z15.d, z31.d, z29.d
revw z15.d, p6/m, z15.d
uzp1 z31.d, z31.d, z29.d
add z25.s, z15.s, z31.s
sub z29.s, z31.s, z15.s
movprfx z14, z25
mul z14.s, p7/m, z14.s, z27.s
addp z14.s, p5/m, z14.s, z14.s
addvl x11, sp, #1
uzp1 z14.s, z14.s, z14.s
add x11, x11, #0x70
ldr z15, [x11]
mul z15.s, p7/m, z15.s, z29.s
addp z15.s, p5/m, z15.s, z15.s
addvl x11, sp, #2
uzp1 z15.s, z15.s, z15.s
add x11, x11, #0x70
ldr z23, [x11]
mul z25.s, p7/m, z25.s, z23.s
addp z25.s, p5/m, z25.s, z25.s
addvl x11, sp, #3
uzp1 z25.s, z25.s, z25.s
add x11, x11, #0x70
ldr z10, [x11]
mul z29.s, p7/m, z29.s, z10.s
addp z29.s, p5/m, z29.s, z29.s
zip1 z31.d, z30.d, z16.d
uzp1 z29.s, z29.s, z29.s
zip2 z30.d, z30.d, z16.d
zip1 z16.d, z26.d, z17.d
zip2 z26.d, z26.d, z17.d
zip2 z23.d, z31.d, z16.d
zip1 z17.d, z31.d, z16.d
zip1 z31.d, z30.d, z26.d
revh z16.d, p6/m, z31.d
mov z31.d, z16.d
zip2 z30.d, z30.d, z26.d
revh z30.d, p6/m, z30.d
addvl x11, sp, #5
saddlb z26.s, z17.h, z30.h
add x11, x11, #0x70
str z17, [x11]
ldr z17, [x11]
addvl x11, sp, #8
saddlt z16.s, z17.h, z30.h
add x11, x11, #0x70
str z30, [x11]
mov z30.d, z23.d
addvl x11, sp, #6
mov z23.d, z31.d
saddlb z17.s, z30.h, z31.h
add x11, x11, #0x70
str z30, [x11]
ldr z31, [x11]
addvl x11, sp, #7
saddlt z30.s, z31.h, z23.h
add x11, x11, #0x70
str z23, [x11]
revw z17.d, p6/m, z17.d
revw z30.d, p6/m, z30.d
zip1 z31.s, z26.s, z16.s
zip2 z26.s, z26.s, z16.s
zip1 z10.s, z30.s, z17.s
zip2 z30.s, z30.s, z17.s
add z31.s, z31.s, z10.s
add z30.s, z26.s, z30.s
uzp2 z26.d, z31.d, z30.d
revw z26.d, p6/m, z26.d
uzp1 z31.d, z31.d, z30.d
add z30.s, z26.s, z31.s
sub z31.s, z31.s, z26.s
mul z27.s, p7/m, z27.s, z30.s
addp z27.s, p5/m, z27.s, z27.s
addvl x11, sp, #1
uzp1 z27.s, z27.s, z27.s
add x11, x11, #0x70
ldr z26, [x11]
mul z26.s, p7/m, z26.s, z31.s
addp z26.s, p5/m, z26.s, z26.s
addvl x11, sp, #2
uzp1 z26.s, z26.s, z26.s
add x11, x11, #0x70
ldr z23, [x11]
mul z30.s, p7/m, z30.s, z23.s
addp z30.s, p5/m, z30.s, z30.s
addvl x11, sp, #3
uzp1 z30.s, z30.s, z30.s
add x11, x11, #0x70
ldr z10, [x11]
mul z31.s, p7/m, z31.s, z10.s
addp z31.s, p5/m, z31.s, z31.s
addvl x11, sp, #0x1b
rshrnb z26.h, z26.s, #4
uzp1 z26.h, z26.h, z26.h
add x11, x11, #0x70
uzp1 z11.s, z11.s, z11.s
rshrnb z12.h, z12.s, #4
rshrnb z11.h, z11.s, #4
uzp1 z12.h, z12.h, z12.h
uzp1 z11.h, z11.h, z11.h
rshrnb z14.h, z14.s, #4
rshrnb z27.h, z27.s, #4
uzp1 z14.h, z14.h, z14.h
uzp1 z27.h, z27.h, z27.h
stp d11, d12, [x1]
rshrnb z25.h, z25.s, #4
uzp1 z25.h, z25.h, z25.h
rshrnb z24.h, z24.s, #4
uzp1 z24.h, z24.h, z24.h
stp d14, d27, [x1, #0x10]
rshrnb z30.h, z30.s, #4
uzp1 z30.h, z30.h, z30.h
rshrnb z28.h, z28.s, #4
uzp1 z28.h, z28.h, z28.h
uzp1 z31.s, z31.s, z31.s
str d26, [x1, #0x218]
ldr z26, [x11]
addvl x11, sp, #0x1c
add x11, x11, #0x70
str d25, [x1, #0x410]
ldr z25, [x11]
addvl x11, sp, #0x13
str d24, [x1, #0x408]
rshrnb z27.h, z26.s, #4
add x11, x11, #0x70
ldr z24, [x11]
str d30, [x1, #0x418]
addvl x11, sp, #0x14
rshrnb z30.h, z25.s, #4
uzp1 z30.h, z30.h, z30.h
add x11, x11, #0x70
ldr z14, [x11]
str d30, [x1, #0x600]
addvl x11, sp, #0x15
trn2 z30.d, z18.d, z14.d
str d28, [x1, #0x608]
add x11, x11, #0x70
zip1 z28.d, z18.d, z14.d
trn1 z18.d, z18.d, z14.d
ldr z14, [x11]
addvl x11, sp, #0x16
uzp1 z27.h, z27.h, z27.h
add x11, x11, #0x70
ldr z16, [x11]
rshrnb z29.h, z29.s, #4
addvl x11, sp, #0x18
uzp1 z29.h, z29.h, z29.h
rshrnb z31.h, z31.s, #4
add x11, x11, #0x70
uzp1 z31.h, z31.h, z31.h
ldr z11, [x11]
str d27, [x1, #0x400]
rshrnb z1.h, z1.s, #4
uzp1 z1.h, z1.h, z1.h
str d29, [x1, #0x610]
zip1 z29.d, z19.d, z24.d
zip1 z26.d, z29.d, z28.d
zip1 z28.d, z20.d, z16.d
str d31, [x1, #0x618]
trn2 z31.d, z19.d, z24.d
trn1 z19.d, z19.d, z24.d
zip1 z27.d, z31.d, z30.d
zip2 z24.d, z31.d, z30.d
trn2 z30.d, z20.d, z16.d
trn1 z20.d, z20.d, z16.d
ldr z16, [x11]
addvl x11, sp, #0x17
trn2 z31.d, z21.d, z14.d
zip1 z29.d, z21.d, z14.d
add x11, x11, #0x70
ldr z23, [x11]
trn1 z21.d, z21.d, z14.d
addvl x11, sp, #0x19
zip2 z25.d, z19.d, z18.d
zip1 z18.d, z29.d, z28.d
add x11, x11, #0x70
ldr z14, [x11]
zip1 z28.d, z22.d, z7.d
addvl x11, sp, #0x1a
zip1 z29.d, z23.d, z16.d
str d1, [x1, #0x200]
add x11, x11, #0x70
ldr z1, [x11]
zip1 z19.d, z31.d, z30.d
addvl x11, sp, #0x1d
zip2 z21.d, z21.d, z20.d
zip2 z20.d, z31.d, z30.d
add x11, x11, #0x70
trn2 z31.d, z23.d, z16.d
trn2 z30.d, z22.d, z7.d
zip1 z16.d, z29.d, z28.d
zip1 z29.d, z14.d, z8.d
zip1 z28.d, z1.d, z9.d
zip1 z17.d, z31.d, z30.d
trn1 z23.d, z23.d, z11.d
trn1 z22.d, z22.d, z7.d
zip2 z11.d, z31.d, z30.d
zip1 z7.d, z29.d, z28.d
trn2 z30.d, z1.d, z9.d
trn2 z31.d, z14.d, z8.d
trn1 z29.d, z14.d, z8.d
ldr z14, [x11]
trn1 z28.d, z1.d, z9.d
add x11, x1, #0x40
rshrnb z13.h, z13.s, #4
rshrnb z15.h, z15.s, #4
uzp1 z13.h, z13.h, z13.h
uzp1 z15.h, z15.h, z15.h
str d13, [x1, #0x208]
zip1 z10.d, z31.d, z30.d
zip2 z9.d, z29.d, z28.d
str d15, [x1, #0x210]
zip2 z8.d, z31.d, z30.d
zip2 z22.d, z23.d, z22.d
movi d31, #0000000000000000
ld1h {z15.h}, p7/z, [x21]
movprfx z30, z31
sdot z30.d, z27.h, z3.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z3.h[0]
sdot z30.d, z26.h, z15.h[0]
sdot z23.d, z18.h, z15.h[0]
sdot z30.d, z25.h, z2.h[0]
sdot z23.d, z21.h, z2.h[0]
sdot z30.d, z24.h, z14.h[0]
sdot z23.d, z20.h, z14.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z3.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z3.h[0]
sdot z29.d, z16.h, z15.h[0]
sdot z28.d, z7.h, z15.h[0]
sdot z29.d, z22.h, z2.h[0]
sdot z28.d, z9.h, z2.h[0]
sdot z29.d, z11.h, z14.h[0]
sdot z28.d, z8.h, z14.h[0]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
add x11, x1, #0xc0
movprfx z30, z31
sdot z30.d, z27.h, z3.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z3.h[1]
sdot z30.d, z26.h, z15.h[1]
sdot z23.d, z18.h, z15.h[1]
sdot z30.d, z25.h, z2.h[1]
sdot z23.d, z21.h, z2.h[1]
sdot z30.d, z24.h, z14.h[1]
sdot z23.d, z20.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z3.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z3.h[1]
sdot z29.d, z16.h, z15.h[1]
sdot z28.d, z7.h, z15.h[1]
sdot z29.d, z22.h, z2.h[1]
sdot z28.d, z9.h, z2.h[1]
sdot z29.d, z11.h, z14.h[1]
sdot z28.d, z8.h, z14.h[1]
uzp1 z30.s, z30.s, z23.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #4
rshrnb z29.h, z29.s, #4
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x11]
addvl x11, sp, #0x1e
add x11, x11, #0x70
ldr z15, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z4.h[0]
add x11, x1, #0x140
sdot z30.d, z26.h, z5.h[0]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[0]
sdot z30.d, z25.h, z0.h[0]
sdot z23.d, z18.h, z5.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z21.h, z0.h[0]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[0]
sdot z29.d, z22.h, z0.h[0]
sdot z28.d, z7.h, z5.h[0]
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
sdot z30.d, z27.h, z4.h[1]
movprfx z23, z31
sdot z23.d, z19.h, z4.h[1]
sdot z30.d, z26.h, z5.h[1]
sdot z23.d, z18.h, z5.h[1]
sdot z30.d, z25.h, z0.h[1]
sdot z23.d, z21.h, z0.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z17.h, z4.h[1]
movprfx z28, z31
sdot z28.d, z10.h, z4.h[1]
sdot z29.d, z16.h, z5.h[1]
sdot z28.d, z7.h, z5.h[1]
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
add x11, x3, #0xc0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1c0
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x2c0
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x3c0
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x240
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
add x11, x1, #0x2c0
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
add x11, x3, #0xe0
ld1h {z13.h}, p7/z, [x11]
add x11, x3, #0x1e0
ld1h {z12.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x2e0
ld1h {z14.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x3, #0x3e0
ld1h {z15.h}, p7/z, [x11]
movprfx z29, z31
sdot z29.d, z17.h, z12.h[0]
add x11, x1, #0x340
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
movprfx z30, z31
sdot z30.d, z27.h, z13.h[0]
add x11, x3, #0x400
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z13.h[0]
add x11, x1, #0x440
movprfx z29, z31
sdot z29.d, z17.h, z13.h[0]
movprfx z28, z31
sdot z28.d, z10.h, z13.h[0]
sdot z30.d, z26.h, z6.h[0]
sdot z23.d, z18.h, z6.h[0]
sdot z30.d, z25.h, z14.h[0]
sdot z23.d, z21.h, z14.h[0]
sdot z30.d, z24.h, z15.h[0]
sdot z23.d, z20.h, z15.h[0]
sdot z29.d, z16.h, z6.h[0]
sdot z28.d, z7.h, z6.h[0]
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
sdot z30.d, z26.h, z6.h[1]
sdot z23.d, z18.h, z6.h[1]
sdot z30.d, z25.h, z14.h[1]
sdot z23.d, z21.h, z14.h[1]
sdot z30.d, z24.h, z15.h[1]
sdot z23.d, z20.h, z15.h[1]
sdot z29.d, z16.h, z6.h[1]
sdot z28.d, z7.h, z6.h[1]
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
add x11, x3, #0x320
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x420
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x540
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
add x11, x3, #0x340
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x440
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x640
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
add x11, x3, #0x360
ld1h {z14.h}, p7/z, [x11]
movprfx z30, z31
sdot z30.d, z27.h, z12.h[0]
add x11, x3, #0x460
ld1h {z15.h}, p7/z, [x11]
movprfx z23, z31
sdot z23.d, z19.h, z12.h[0]
add x11, x1, #0x740
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
addvl x11, sp, #9
add x11, x11, #0x70
ldr z18, [x11]
addvl x11, sp, #0xb
add x11, x11, #0x70
ldr z13, [x11]
sub z23.h, z18.h, z13.h
addvl x11, sp, #0xa
add x11, x11, #0x70
ldr z17, [x11]
add x11, sp, #0x70
ldr z16, [x11]
sub z22.h, z17.h, z16.h
addvl x11, sp, #0xc
add x11, x11, #0x70
ldr z12, [x11]
addvl x11, sp, #0xf
add x11, x11, #0x70
ldr z9, [x11]
sub z25.h, z12.h, z9.h
addvl x11, sp, #0xd
add x11, x11, #0x70
ldr z11, [x11]
addvl x11, sp, #0xe
add x11, x11, #0x70
ldr z10, [x11]
sub z24.h, z11.h, z10.h
addvl x11, sp, #0x10
add x11, x11, #0x70
ldr z8, [x11]
addvl x11, sp, #4
add x11, x11, #0x70
ldr z30, [x11]
sub z27.h, z8.h, z30.h
addvl x11, sp, #0x11
add x11, x11, #0x70
ldr z7, [x11]
addvl x11, sp, #0x12
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
ldr z25, [x11]
addvl x11, sp, #5
add x11, x11, #0x70
ldr z24, [x11]
add z30.h, z25.h, z24.h
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
addvl sp, sp, #0x1f
add sp, sp, #0x70
mov x1, x19
add x0, sp, #0x20
cntb x12, all, mul #9
adrp x2, #0x457000
ptrue p7.b
lsl x12, x12, #2
add x2, x2, #0xdf0
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
ld1h {z31.h}, p7/z, [x3]
addvl x3, x6, #1
add x3, x3, #0x40
add x3, sp, x3
str z31, [x3]
add x3, x0, #0x20
ld1h {z28.h}, p7/z, [x3]
ld1h {z18.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z30.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z12.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z18.d, z13.d
add x3, x0, #0xc0
ld1h {z11.h}, p7/z, [x3]
zip2 z18.d, z18.d, z13.d
zip1 z13.d, z15.d, z11.d
zip2 z15.d, z15.d, z11.d
zip1 z11.d, z14.d, z13.d
zip2 z13.d, z14.d, z13.d
zip1 z14.d, z18.d, z15.d
revh z14.d, p6/m, z14.d
zip2 z18.d, z18.d, z15.d
revh z15.d, p6/m, z18.d
rev z17.h, z17.h
rev z16.h, z16.h
rev z28.h, z28.h
zip1 z18.d, z28.d, z17.d
rev z24.h, z24.h
zip2 z28.d, z28.d, z17.d
zip1 z17.d, z24.d, z16.d
zip2 z24.d, z24.d, z16.d
zip1 z16.d, z18.d, z17.d
zip2 z17.d, z18.d, z17.d
zip1 z18.d, z28.d, z24.d
revh z10.d, p6/m, z18.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
add x3, sp, #0x40
saddlb z28.s, z15.h, z24.h
saddlb z18.s, z11.h, z16.h
add z18.s, z18.s, z28.s
str z11, [x3]
ldr z28, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str z16, [x3]
ldr z9, [x3]
addvl x3, sp, #3
saddlt z16.s, z28.h, z9.h
saddlt z28.s, z15.h, z24.h
add x3, x3, #0x40
str z15, [x3]
add z16.s, z16.s, z28.s
addvl x3, sp, #7
saddlb z28.s, z14.h, z10.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z17.d
addvl x3, sp, #1
saddlb z17.s, z13.h, z17.h
add z17.s, z17.s, z28.s
add x3, x3, #0x40
str z13, [x3]
ldr z28, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z9, [x3]
addvl x3, sp, #2
saddlt z28.s, z28.h, z9.h
saddlt z24.s, z14.h, z10.h
add x3, x3, #0x40
str z14, [x3]
add z24.s, z28.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z10, [x3]
revw z17.d, p6/m, z17.d
revw z24.d, p6/m, z24.d
zip1 z15.s, z24.s, z17.s
zip1 z28.s, z18.s, z16.s
zip2 z24.s, z24.s, z17.s
add z28.s, z28.s, z15.s
zip2 z18.s, z18.s, z16.s
add z24.s, z18.s, z24.s
uzp2 z17.d, z28.d, z24.d
revw z17.d, p6/m, z17.d
uzp1 z28.d, z28.d, z24.d
ptrue p5.s
add z18.s, z17.s, z28.s
sub z24.s, z28.s, z17.s
ld1w {z28.s}, p7/z, [x2]
movprfx z15, z18
mul z15.s, p7/m, z15.s, z28.s
addp z15.s, p5/m, z15.s, z15.s
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z11, [x3]
movprfx z17, z11
mul z17.s, p7/m, z17.s, z24.s
addp z17.s, p5/m, z17.s, z17.s
addvl x3, sp, #0x18
uzp1 z9.s, z17.s, z17.s
add x3, x3, #0x40
str z9, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z9, [x3]
mul z18.s, p7/m, z18.s, z9.s
addp z18.s, p5/m, z18.s, z18.s
addvl x3, sp, #0x1b
uzp1 z2.s, z18.s, z18.s
add x3, x3, #0x40
ldr z8, [x3]
mul z24.s, p7/m, z24.s, z8.s
addp z24.s, p5/m, z24.s, z24.s
add x3, x0, #0x100
uzp1 z3.s, z24.s, z24.s
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z16.h}, p7/z, [x3]
zip1 z17.d, z24.d, z16.d
add x3, x0, #0x1c0
zip2 z24.d, z24.d, z16.d
ld1h {z14.h}, p7/z, [x3]
zip1 z16.d, z18.d, z14.d
zip2 z18.d, z18.d, z14.d
zip1 z7.d, z17.d, z16.d
zip2 z6.d, z17.d, z16.d
zip1 z17.d, z24.d, z18.d
revh z5.d, p6/m, z17.d
zip2 z24.d, z24.d, z18.d
revh z18.d, p6/m, z24.d
rev z23.h, z23.h
rev z26.h, z26.h
zip1 z24.d, z26.d, z23.d
rev z19.h, z19.h
zip2 z26.d, z26.d, z23.d
rev z29.h, z29.h
zip1 z23.d, z29.d, z19.d
zip2 z29.d, z29.d, z19.d
zip1 z4.d, z24.d, z23.d
zip2 z1.d, z24.d, z23.d
zip1 z24.d, z26.d, z29.d
revh z0.d, p6/m, z24.d
zip2 z26.d, z26.d, z29.d
revh z26.d, p6/m, z26.d
addvl x3, sp, #8
saddlb z29.s, z18.h, z26.h
saddlb z23.s, z7.h, z4.h
add x3, x3, #0x40
add z23.s, z23.s, z29.s
str z7, [x3]
ldr z29, [x3]
addvl x3, sp, #0xc
mov z19.d, z18.d
add x3, x3, #0x40
str z4, [x3]
ldr z18, [x3]
addvl x3, sp, #0xb
saddlt z18.s, z29.h, z18.h
saddlt z29.s, z19.h, z26.h
add x3, x3, #0x40
str z19, [x3]
add z18.s, z18.s, z29.s
addvl x3, sp, #9
saddlb z29.s, z5.h, z0.h
saddlb z19.s, z6.h, z1.h
add x3, x3, #0x40
add z19.s, z19.s, z29.s
str z6, [x3]
ldr z29, [x3]
addvl x3, sp, #0xd
saddlt z24.s, z5.h, z0.h
add x3, x3, #0x40
str z1, [x3]
ldr z17, [x3]
addvl x3, sp, #0xa
saddlt z29.s, z29.h, z17.h
add z24.s, z29.s, z24.s
add x3, x3, #0x40
str z5, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
str z0, [x3]
revw z19.d, p6/m, z19.d
revw z24.d, p6/m, z24.d
zip1 z29.s, z23.s, z18.s
zip2 z23.s, z23.s, z18.s
zip1 z17.s, z24.s, z19.s
zip2 z24.s, z24.s, z19.s
add z29.s, z29.s, z17.s
add z24.s, z23.s, z24.s
uzp2 z23.d, z29.d, z24.d
revw z23.d, p6/m, z23.d
uzp1 z29.d, z29.d, z24.d
add z24.s, z23.s, z29.s
sub z29.s, z29.s, z23.s
movprfx z14, z24
mul z14.s, p7/m, z14.s, z28.s
addp z14.s, p5/m, z14.s, z14.s
uzp1 z14.s, z14.s, z14.s
movprfx z17, z11
mul z17.s, p7/m, z17.s, z29.s
addp z17.s, p5/m, z17.s, z17.s
uzp1 z17.s, z17.s, z17.s
mul z24.s, p7/m, z24.s, z9.s
addp z24.s, p5/m, z24.s, z24.s
uzp1 z24.s, z24.s, z24.s
mov z7.d, z8.d
mul z29.s, p7/m, z29.s, z8.s
addp z29.s, p5/m, z29.s, z29.s
add x3, x0, #0x200
ld1h {z23.h}, p7/z, [x3]
uzp1 z29.s, z29.s, z29.s
add x3, x0, #0x240
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z18.h}, p7/z, [x3]
zip1 z8.d, z23.d, z18.d
add x3, x0, #0x2c0
zip2 z23.d, z23.d, z18.d
ld1h {z16.h}, p7/z, [x3]
zip1 z18.d, z19.d, z16.d
zip2 z19.d, z19.d, z16.d
zip1 z4.d, z8.d, z18.d
zip1 z6.d, z23.d, z19.d
zip2 z8.d, z8.d, z18.d
revh z18.d, p6/m, z6.d
mov z13.d, z18.d
zip2 z23.d, z23.d, z19.d
revh z23.d, p6/m, z23.d
rev z20.h, z20.h
rev z21.h, z21.h
rev z30.h, z30.h
rev z25.h, z25.h
zip1 z19.d, z30.d, z20.d
zip2 z30.d, z30.d, z20.d
zip1 z20.d, z25.d, z21.d
zip2 z25.d, z25.d, z21.d
zip1 z21.d, z19.d, z20.d
zip1 z10.d, z30.d, z25.d
zip2 z19.d, z19.d, z20.d
revh z10.d, p6/m, z10.d
zip2 z30.d, z30.d, z25.d
revh z18.d, p6/m, z30.d
addvl x3, sp, #0xf
saddlb z30.s, z23.h, z18.h
saddlb z20.s, z4.h, z21.h
add x3, x3, #0x40
add z20.s, z20.s, z30.s
str z4, [x3]
ldr z30, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
str z21, [x3]
ldr z25, [x3]
addvl x3, sp, #0x13
saddlt z16.s, z30.h, z25.h
saddlt z30.s, z23.h, z18.h
add x3, x3, #0x40
str z18, [x3]
add z16.s, z16.s, z30.s
addvl x3, sp, #0x10
saddlb z30.s, z13.h, z10.h
saddlb z18.s, z8.h, z19.h
add x3, x3, #0x40
add z18.s, z18.s, z30.s
str z8, [x3]
ldr z30, [x3]
addvl x3, sp, #0x11
saddlt z30.s, z30.h, z19.h
add x3, x3, #0x40
saddlt z25.s, z13.h, z10.h
add z25.s, z30.s, z25.s
str z13, [x3]
revw z18.d, p6/m, z18.d
revw z25.d, p6/m, z25.d
zip1 z30.s, z20.s, z16.s
zip2 z20.s, z20.s, z16.s
zip1 z13.s, z25.s, z18.s
zip2 z25.s, z25.s, z18.s
add z30.s, z30.s, z13.s
add z25.s, z20.s, z25.s
uzp2 z20.d, z30.d, z25.d
revw z20.d, p6/m, z20.d
uzp1 z30.d, z30.d, z25.d
add z25.s, z20.s, z30.s
sub z30.s, z30.s, z20.s
movprfx z16, z25
mul z16.s, p7/m, z16.s, z28.s
addp z16.s, p5/m, z16.s, z16.s
uzp1 z16.s, z16.s, z16.s
mov z21.d, z11.d
movprfx z18, z11
mul z18.s, p7/m, z18.s, z30.s
addp z18.s, p5/m, z18.s, z18.s
uzp1 z18.s, z18.s, z18.s
mov z8.d, z9.d
mul z25.s, p7/m, z25.s, z9.s
addp z25.s, p5/m, z25.s, z25.s
uzp1 z25.s, z25.s, z25.s
mov z6.d, z7.d
mul z30.s, p7/m, z30.s, z7.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x300
ld1h {z13.h}, p7/z, [x3]
uzp1 z30.s, z30.s, z30.s
add x3, x0, #0x340
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z11.h}, p7/z, [x3]
zip1 z9.d, z13.d, z11.d
add x3, x0, #0x3c0
ld1h {z7.h}, p7/z, [x3]
zip2 z13.d, z13.d, z11.d
zip1 z11.d, z20.d, z7.d
zip2 z20.d, z20.d, z7.d
zip1 z4.d, z9.d, z11.d
zip1 z7.d, z13.d, z20.d
zip2 z9.d, z9.d, z11.d
revh z7.d, p6/m, z7.d
zip2 z13.d, z13.d, z20.d
revh z20.d, p6/m, z13.d
rev z12.h, z12.h
rev z22.h, z22.h
mov z1.d, z20.d
rev z27.h, z27.h
rev z31.h, z31.h
zip1 z20.d, z27.d, z12.d
zip2 z27.d, z27.d, z12.d
zip1 z12.d, z31.d, z22.d
zip2 z31.d, z31.d, z22.d
zip1 z13.d, z20.d, z12.d
zip1 z11.d, z27.d, z31.d
zip2 z20.d, z20.d, z12.d
revh z11.d, p6/m, z11.d
zip2 z27.d, z27.d, z31.d
revh z27.d, p6/m, z27.d
addvl x3, sp, #0x17
mov z12.d, z1.d
saddlb z31.s, z1.h, z27.h
add x3, x3, #0x40
str z13, [x3]
ldr z1, [x3]
addvl x3, sp, #0x16
saddlb z5.s, z4.h, z13.h
add z5.s, z5.s, z31.s
add x3, x3, #0x40
saddlt z31.s, z12.h, z27.h
str z12, [x3]
addvl x3, sp, #0x14
saddlt z1.s, z4.h, z1.h
add z1.s, z1.s, z31.s
add x3, x3, #0x40
saddlb z31.s, z7.h, z11.h
mov z22.d, z4.d
saddlb z4.s, z9.h, z20.h
add z4.s, z4.s, z31.s
str z9, [x3]
ldr z31, [x3]
addvl x3, sp, #0x15
saddlt z31.s, z31.h, z20.h
add x3, x3, #0x40
saddlt z12.s, z7.h, z11.h
add z12.s, z31.s, z12.s
str z7, [x3]
revw z4.d, p6/m, z4.d
revw z12.d, p6/m, z12.d
zip1 z31.s, z5.s, z1.s
zip2 z5.s, z5.s, z1.s
zip1 z0.s, z12.s, z4.s
zip2 z12.s, z12.s, z4.s
add z31.s, z31.s, z0.s
add z12.s, z5.s, z12.s
uzp2 z5.d, z31.d, z12.d
revw z5.d, p6/m, z5.d
uzp1 z31.d, z31.d, z12.d
add z12.s, z5.s, z31.s
sub z31.s, z31.s, z5.s
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
uzp1 z28.s, z28.s, z28.s
movprfx z5, z21
mul z5.s, p7/m, z5.s, z31.s
addp z5.s, p5/m, z5.s, z5.s
uzp1 z5.s, z5.s, z5.s
mul z12.s, p7/m, z12.s, z8.s
addp z12.s, p5/m, z12.s, z12.s
uzp1 z12.s, z12.s, z12.s
mul z31.s, p7/m, z31.s, z6.s
addp z31.s, p5/m, z31.s, z31.s
addvl x3, sp, #0x18
rshrnb z28.h, z28.s, #0xb
uzp1 z28.h, z28.h, z28.h
add x3, x3, #0x40
uzp1 z15.s, z15.s, z15.s
rshrnb z14.h, z14.s, #0xb
rshrnb z15.h, z15.s, #0xb
uzp1 z14.h, z14.h, z14.h
uzp1 z15.h, z15.h, z15.h
rshrnb z16.h, z16.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z16.h, z16.h, z16.h
uzp1 z29.h, z29.h, z29.h
stp d15, d14, [x1]
rshrnb z18.h, z18.s, #0xb
uzp1 z18.h, z18.h, z18.h
uzp1 z31.s, z31.s, z31.s
rshrnb z24.h, z24.s, #0xb
stp d16, d28, [x1, #0x10]
ldr z28, [x3]
add x3, sp, #0x40
rshrnb z28.h, z28.s, #0xb
uzp1 z28.h, z28.h, z28.h
uzp1 z24.h, z24.h, z24.h
str d29, [x1, #0x608]
ldr z29, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str d28, [x1, #0x200]
rshrnb z28.h, z2.s, #0xb
uzp1 z28.h, z28.h, z28.h
str d28, [x1, #0x400]
rshrnb z31.h, z31.s, #0xb
rshrnb z28.h, z3.s, #0xb
ldr z3, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
str d18, [x1, #0x210]
sub z18.h, z29.h, z3.h
ldr z29, [x3]
addvl x3, sp, #5
uzp1 z31.h, z31.h, z31.h
add x3, x3, #0x40
ldr z3, [x3]
uzp1 z28.h, z28.h, z28.h
addvl x3, sp, #2
rshrnb z17.h, z17.s, #0xb
rshrnb z5.h, z5.s, #0xb
add x3, x3, #0x40
ldr z14, [x3]
uzp1 z17.h, z17.h, z17.h
addvl x3, sp, #6
uzp1 z5.h, z5.h, z5.h
rshrnb z25.h, z25.s, #0xb
add x3, x3, #0x40
uzp1 z25.h, z25.h, z25.h
rshrnb z12.h, z12.s, #0xb
rshrnb z30.h, z30.s, #0xb
uzp1 z12.h, z12.h, z12.h
uzp1 z30.h, z30.h, z30.h
str d17, [x1, #0x208]
str d5, [x1, #0x218]
str d24, [x1, #0x408]
sub z24.h, z29.h, z3.h
str d25, [x1, #0x410]
str d12, [x1, #0x418]
str d30, [x1, #0x610]
str d31, [x1, #0x618]
ldr z31, [x3]
sub z31.h, z14.h, z31.h
str d28, [x1, #0x600]
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
ldr z29, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z3, [x3]
sub z1.h, z29.h, z3.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z29, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z3, [x3]
sub z4.h, z29.h, z3.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z0, [x3]
sub z31.h, z5.h, z0.h
revh z0.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z29, [x3]
sub z31.h, z29.h, z26.h
revh z6.d, p6/m, z31.d
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z3, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z2, [x3]
sub z8.h, z3.h, z2.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z3, [x3]
sub z7.h, z3.h, z19.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z21, [x3]
sub z31.h, z21.h, z10.h
revh z9.d, p6/m, z31.d
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z28, [x3]
sub z31.h, z23.h, z28.h
revh z13.d, p6/m, z31.d
addvl x3, sp, #0x18
add x3, x3, #0x40
str z22, [x3]
ldr z3, [x3]
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z2, [x3]
sub z22.h, z3.h, z2.h
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z3, [x3]
sub z21.h, z3.h, z20.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z12, [x3]
sub z31.h, z12.h, z11.h
revh z2.d, p6/m, z31.d
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z3.h, z27.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x1c
movi d31, #0000000000000000
ld1h {z15.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z14, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z14.h[0]
addvl x3, sp, #0x1d
movprfx z25, z31
sdot z25.d, z4.h, z14.h[0]
movprfx z29, z31
sdot z29.d, z7.h, z14.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z28, z31
sdot z28.d, z21.h, z14.h[0]
addvl x3, sp, #0x1e
sdot z30.d, z18.h, z15.h[0]
sdot z25.d, z1.h, z15.h[0]
add x3, x3, #0x40
ldr z5, [x3]
sdot z30.d, z17.h, z12.h[0]
add x3, x1, #0x40
sdot z30.d, z16.h, z5.h[0]
sdot z25.d, z0.h, z12.h[0]
sdot z29.d, z8.h, z15.h[0]
sdot z25.d, z6.h, z5.h[0]
sdot z29.d, z9.h, z12.h[0]
sdot z28.d, z22.h, z15.h[0]
sdot z29.d, z13.h, z5.h[0]
sdot z28.d, z2.h, z12.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z28.d, z3.h, z5.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z24.h, z14.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z14.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z14.h[1]
sdot z30.d, z18.h, z15.h[1]
sdot z25.d, z1.h, z15.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z0.h, z12.h[1]
sdot z30.d, z16.h, z5.h[1]
sdot z25.d, z6.h, z5.h[1]
sdot z29.d, z8.h, z15.h[1]
sdot z28.d, z22.h, z15.h[1]
sdot z29.d, z9.h, z12.h[1]
sdot z28.d, z2.h, z12.h[1]
sdot z29.d, z13.h, z5.h[1]
sdot z28.d, z3.h, z5.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
cntb x3
cntb x6
lsl x3, x3, #5
lsl x6, x6, #5
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z15.h[0]
addvl x3, sp, #0x1f
movprfx z25, z31
sdot z25.d, z4.h, z15.h[0]
movprfx z29, z31
sdot z29.d, z7.h, z15.h[0]
add x3, x3, #0x40
ldr z14, [x3]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[0]
addvl x3, x6, #1
sdot z30.d, z18.h, z14.h[0]
sdot z25.d, z1.h, z14.h[0]
add x3, x3, #0x40
sdot z29.d, z8.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
add x3, sp, x3
ldr z12, [x3]
sdot z30.d, z17.h, z12.h[0]
rdvl x3, #0x11
sdot z25.d, z0.h, z12.h[0]
sdot z29.d, z9.h, z12.h[0]
lsl x3, x3, #1
sdot z28.d, z2.h, z12.h[0]
rdvl x6, #0x11
add x3, sp, x3
lsl x6, x6, #1
add x3, x3, #0x40
ldr z5, [x3]
sdot z25.d, z6.h, z5.h[0]
add x3, x1, #0x140
sdot z28.d, z3.h, z5.h[0]
sdot z30.d, z16.h, z5.h[0]
sdot z29.d, z13.h, z5.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z24.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[1]
sdot z30.d, z18.h, z14.h[1]
sdot z25.d, z1.h, z14.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z0.h, z12.h[1]
sdot z30.d, z16.h, z5.h[1]
sdot z25.d, z6.h, z5.h[1]
sdot z29.d, z8.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z9.h, z12.h[1]
sdot z28.d, z2.h, z12.h[1]
sdot z29.d, z13.h, z5.h[1]
sdot z28.d, z3.h, z5.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xc0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z5.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x2c0
ld1h {z14.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x2, #0x3c0
ld1h {z15.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
add x3, x1, #0x240
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z5.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x2e0
ld1h {z14.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x2, #0x3e0
ld1h {z15.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
add x3, x1, #0x340
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z12.h[0]
add x3, x2, #0x400
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z12.h[0]
addvl x3, x6, #1
movprfx z29, z31
sdot z29.d, z7.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z12.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z5, [x3]
sdot z30.d, z18.h, z5.h[0]
add x3, x1, #0x440
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z1.h, z5.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z29.d, z8.h, z5.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z22.h, z5.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z2.h, z14.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z28.d, z3.h, z15.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z24.h, z12.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z12.h[1]
sdot z30.d, z18.h, z5.h[1]
sdot z25.d, z1.h, z5.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z5.h[1]
sdot z28.d, z22.h, z5.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x420
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x1, #0x540
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x440
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x1, #0x640
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x460
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x1, #0x740
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z16, [x3]
add x3, sp, #0x40
ldr z2, [x3]
add z30.h, z16.h, z2.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z16, [x3]
add z29.h, z17.h, z16.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z28, [x3]
add z25.h, z14.h, z28.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z24, [x3]
add z18.h, z15.h, z24.h
addvl x3, sp, #0xc
sub z28.h, z30.h, z18.h
sub z24.h, z29.h, z25.h
add x3, x3, #0x40
ldr z17, [x3]
add z30.h, z30.h, z18.h
addvl x3, sp, #8
add z29.h, z29.h, z25.h
add x3, x3, #0x40
ldr z16, [x3]
add z17.h, z17.h, z16.h
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
ldr z15, [x3]
add z16.h, z16.h, z15.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z0, [x3]
add z14.h, z5.h, z0.h
addvl x3, sp, #0xb
sub z12.h, z16.h, z14.h
add x3, x3, #0x40
ldr z22, [x3]
add z26.h, z22.h, z26.h
addvl x3, sp, #0x12
sub z15.h, z17.h, z26.h
add x3, x3, #0x40
ldr z6, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z5, [x3]
add z21.h, z6.h, z5.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z8, [x3]
add z19.h, z19.h, z8.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z13, [x3]
add z10.h, z13.h, z10.h
addvl x3, sp, #0x13
sub z6.h, z19.h, z10.h
add x3, x3, #0x40
ldr z22, [x3]
add z23.h, z23.h, z22.h
addvl x3, sp, #0x17
sub z8.h, z21.h, z23.h
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z22, [x3]
add z22.h, z13.h, z22.h
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z13, [x3]
add z20.h, z20.h, z13.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z7, [x3]
add z11.h, z7.h, z11.h
addvl x3, sp, #0x16
sub z7.h, z20.h, z11.h
add x3, x3, #0x40
ldr z3, [x3]
add z27.h, z3.h, z27.h
add x3, x2, #0x480
ld1h {z5.h}, p7/z, [x3]
sub z9.h, z22.h, z27.h
add x3, x2, #0x500
ld1h {z4.h}, p7/z, [x3]
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
add x3, x1, #0x80
sdot z13.d, z28.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z15.h, z5.h[0]
sdot z3.d, z8.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z13.s, z13.s, z1.s
sdot z2.d, z9.h, z5.h[0]
rshrnb z13.h, z13.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x1, #0x180
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z13.d, z28.h, z5.h[1]
sdot z1.d, z15.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z8.h, z5.h[1]
sdot z2.d, z9.h, z5.h[1]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z13.d, z28.h, z5.h[0]
sdot z1.d, z15.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z8.h, z5.h[0]
sdot z2.d, z9.h, z5.h[0]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x1, #0x380
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z13.d, z28.h, z5.h[1]
sdot z1.d, z15.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z8.h, z5.h[1]
sdot z2.d, z9.h, z5.h[1]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z4.h}, p7/z, [x3]
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
add x3, x1, #0x480
sdot z13.d, z28.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z15.h, z5.h[0]
sdot z3.d, z8.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z13.s, z13.s, z1.s
sdot z2.d, z9.h, z5.h[0]
rshrnb z13.h, z13.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x1, #0x580
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z13.d, z28.h, z5.h[1]
sdot z1.d, z15.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z8.h, z5.h[1]
sdot z2.d, z9.h, z5.h[1]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z13.d, z28.h, z5.h[0]
sdot z1.d, z15.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z8.h, z5.h[0]
sdot z2.d, z9.h, z5.h[0]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
add x3, x1, #0x780
sdot z13.d, z28.h, z5.h[1]
movprfx z24, z31
sdot z24.d, z6.h, z4.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z4.h[1]
sdot z24.d, z8.h, z5.h[1]
sdot z28.d, z15.h, z5.h[1]
movprfx z15, z31
sdot z15.d, z7.h, z4.h[1]
uzp1 z13.s, z13.s, z28.s
sdot z15.d, z9.h, z5.h[1]
rshrnb z13.h, z13.s, #0xb
uzp1 z24.s, z24.s, z15.s
rshrnb z24.h, z24.s, #0xb
uzp1 z13.h, z13.h, z24.h
st1h {z13.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z17.h, z17.h, z26.h
add z16.h, z16.h, z14.h
revh z16.d, p6/m, z16.d
sub z17.h, z17.h, z16.h
add z21.h, z21.h, z23.h
add z19.h, z19.h, z10.h
revh z19.d, p6/m, z19.d
sub z21.h, z21.h, z19.h
add z22.h, z22.h, z27.h
add z20.h, z20.h, z11.h
revh z20.d, p6/m, z20.d
add x3, x2, #0x580
ld1h {z15.h}, p7/z, [x3]
sub z22.h, z22.h, z20.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z17.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z22.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[0]
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
sdot z26.d, z17.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z22.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[1]
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
sdot z26.d, z17.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z22.h, z15.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z17.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z22.h, z15.h[1]
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
ld1h {z18.h}, p7/z, [x0]
add x3, x0, #0x60
ld1h {z24.h}, p7/z, [x3]
ptrue p6.d
add x3, x0, #0xa0
ld1h {z17.h}, p7/z, [x3]
add x3, x0, #0xe0
ld1h {z16.h}, p7/z, [x3]
add x3, x0, #0x120
ld1h {z26.h}, p7/z, [x3]
add x3, x0, #0x160
ld1h {z29.h}, p7/z, [x3]
add x3, x0, #0x1a0
ld1h {z23.h}, p7/z, [x3]
add x3, x0, #0x1e0
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x220
ld1h {z30.h}, p7/z, [x3]
add x3, x0, #0x260
ld1h {z25.h}, p7/z, [x3]
add x3, x0, #0x2a0
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x2e0
ld1h {z21.h}, p7/z, [x3]
add x3, x0, #0x320
ld1h {z27.h}, p7/z, [x3]
add x3, x0, #0x360
ld1h {z31.h}, p7/z, [x3]
add x3, x0, #0x3a0
ld1h {z12.h}, p7/z, [x3]
add x3, x0, #0x3e0
ld1h {z22.h}, p7/z, [x3]
add x3, x0, #0x40
ld1h {z15.h}, p7/z, [x3]
add x3, x0, #0x80
ld1h {z13.h}, p7/z, [x3]
zip1 z14.d, z18.d, z13.d
add x3, x0, #0xc0
ld1h {z11.h}, p7/z, [x3]
zip2 z18.d, z18.d, z13.d
zip1 z13.d, z15.d, z11.d
zip2 z15.d, z15.d, z11.d
zip1 z11.d, z14.d, z13.d
zip2 z13.d, z14.d, z13.d
zip1 z14.d, z18.d, z15.d
revh z14.d, p6/m, z14.d
zip2 z18.d, z18.d, z15.d
revh z15.d, p6/m, z18.d
rev z17.h, z17.h
rev z16.h, z16.h
rev z28.h, z28.h
zip1 z18.d, z28.d, z17.d
rev z24.h, z24.h
zip2 z28.d, z28.d, z17.d
zip1 z17.d, z24.d, z16.d
zip2 z24.d, z24.d, z16.d
zip1 z16.d, z18.d, z17.d
zip2 z17.d, z18.d, z17.d
zip1 z18.d, z28.d, z24.d
revh z10.d, p6/m, z18.d
zip2 z28.d, z28.d, z24.d
revh z24.d, p6/m, z28.d
add x3, sp, #0x40
saddlb z28.s, z15.h, z24.h
saddlb z18.s, z11.h, z16.h
add z18.s, z18.s, z28.s
str z11, [x3]
ldr z28, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str z16, [x3]
ldr z9, [x3]
addvl x3, sp, #3
saddlt z16.s, z28.h, z9.h
saddlt z28.s, z15.h, z24.h
add x3, x3, #0x40
str z15, [x3]
add z16.s, z16.s, z28.s
addvl x3, sp, #7
saddlb z28.s, z14.h, z10.h
add x3, x3, #0x40
str z24, [x3]
mov z24.d, z17.d
addvl x3, sp, #1
saddlb z17.s, z13.h, z17.h
add z17.s, z17.s, z28.s
add x3, x3, #0x40
str z13, [x3]
ldr z28, [x3]
addvl x3, sp, #5
add x3, x3, #0x40
str z24, [x3]
ldr z9, [x3]
addvl x3, sp, #2
saddlt z28.s, z28.h, z9.h
saddlt z24.s, z14.h, z10.h
add x3, x3, #0x40
str z14, [x3]
add z24.s, z28.s, z24.s
addvl x3, sp, #6
add x3, x3, #0x40
str z10, [x3]
revw z17.d, p6/m, z17.d
revw z24.d, p6/m, z24.d
zip1 z15.s, z24.s, z17.s
zip1 z28.s, z18.s, z16.s
zip2 z24.s, z24.s, z17.s
add z28.s, z28.s, z15.s
zip2 z18.s, z18.s, z16.s
add z24.s, z18.s, z24.s
uzp2 z17.d, z28.d, z24.d
revw z17.d, p6/m, z17.d
uzp1 z28.d, z28.d, z24.d
ptrue p5.s
add z18.s, z17.s, z28.s
sub z24.s, z28.s, z17.s
ld1w {z28.s}, p7/z, [x2]
movprfx z15, z18
mul z15.s, p7/m, z15.s, z28.s
addp z15.s, p5/m, z15.s, z15.s
addvl x3, sp, #0x19
add x3, x3, #0x40
ldr z11, [x3]
movprfx z17, z11
mul z17.s, p7/m, z17.s, z24.s
addp z17.s, p5/m, z17.s, z17.s
addvl x3, sp, #0x18
uzp1 z9.s, z17.s, z17.s
add x3, x3, #0x40
str z9, [x3]
addvl x3, sp, #0x1a
add x3, x3, #0x40
ldr z9, [x3]
mul z18.s, p7/m, z18.s, z9.s
addp z18.s, p5/m, z18.s, z18.s
addvl x3, sp, #0x1b
uzp1 z2.s, z18.s, z18.s
add x3, x3, #0x40
ldr z8, [x3]
mul z24.s, p7/m, z24.s, z8.s
addp z24.s, p5/m, z24.s, z24.s
add x3, x0, #0x100
uzp1 z3.s, z24.s, z24.s
ld1h {z24.h}, p7/z, [x3]
add x3, x0, #0x140
ld1h {z18.h}, p7/z, [x3]
add x3, x0, #0x180
ld1h {z16.h}, p7/z, [x3]
zip1 z17.d, z24.d, z16.d
add x3, x0, #0x1c0
zip2 z24.d, z24.d, z16.d
ld1h {z14.h}, p7/z, [x3]
zip1 z16.d, z18.d, z14.d
zip2 z18.d, z18.d, z14.d
zip1 z7.d, z17.d, z16.d
zip2 z6.d, z17.d, z16.d
zip1 z17.d, z24.d, z18.d
revh z5.d, p6/m, z17.d
zip2 z24.d, z24.d, z18.d
revh z18.d, p6/m, z24.d
rev z23.h, z23.h
rev z26.h, z26.h
zip1 z24.d, z26.d, z23.d
rev z19.h, z19.h
zip2 z26.d, z26.d, z23.d
rev z29.h, z29.h
zip1 z23.d, z29.d, z19.d
zip2 z29.d, z29.d, z19.d
zip1 z4.d, z24.d, z23.d
zip2 z1.d, z24.d, z23.d
zip1 z24.d, z26.d, z29.d
revh z0.d, p6/m, z24.d
zip2 z26.d, z26.d, z29.d
revh z26.d, p6/m, z26.d
addvl x3, sp, #8
saddlb z29.s, z18.h, z26.h
saddlb z23.s, z7.h, z4.h
add x3, x3, #0x40
add z23.s, z23.s, z29.s
str z7, [x3]
ldr z29, [x3]
addvl x3, sp, #0xc
mov z19.d, z18.d
add x3, x3, #0x40
str z4, [x3]
ldr z18, [x3]
addvl x3, sp, #0xb
saddlt z18.s, z29.h, z18.h
saddlt z29.s, z19.h, z26.h
add x3, x3, #0x40
str z19, [x3]
add z18.s, z18.s, z29.s
addvl x3, sp, #9
saddlb z29.s, z5.h, z0.h
saddlb z19.s, z6.h, z1.h
add x3, x3, #0x40
add z19.s, z19.s, z29.s
str z6, [x3]
ldr z29, [x3]
addvl x3, sp, #0xd
saddlt z24.s, z5.h, z0.h
add x3, x3, #0x40
str z1, [x3]
ldr z17, [x3]
addvl x3, sp, #0xa
saddlt z29.s, z29.h, z17.h
add z24.s, z29.s, z24.s
add x3, x3, #0x40
str z5, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
str z0, [x3]
revw z19.d, p6/m, z19.d
revw z24.d, p6/m, z24.d
zip1 z29.s, z23.s, z18.s
zip2 z23.s, z23.s, z18.s
zip1 z17.s, z24.s, z19.s
zip2 z24.s, z24.s, z19.s
add z29.s, z29.s, z17.s
add z24.s, z23.s, z24.s
uzp2 z23.d, z29.d, z24.d
revw z23.d, p6/m, z23.d
uzp1 z29.d, z29.d, z24.d
add z24.s, z23.s, z29.s
sub z29.s, z29.s, z23.s
movprfx z14, z24
mul z14.s, p7/m, z14.s, z28.s
addp z14.s, p5/m, z14.s, z14.s
uzp1 z14.s, z14.s, z14.s
movprfx z17, z11
mul z17.s, p7/m, z17.s, z29.s
addp z17.s, p5/m, z17.s, z17.s
uzp1 z17.s, z17.s, z17.s
mul z24.s, p7/m, z24.s, z9.s
addp z24.s, p5/m, z24.s, z24.s
uzp1 z24.s, z24.s, z24.s
mov z7.d, z8.d
mul z29.s, p7/m, z29.s, z8.s
addp z29.s, p5/m, z29.s, z29.s
add x3, x0, #0x200
ld1h {z23.h}, p7/z, [x3]
uzp1 z29.s, z29.s, z29.s
add x3, x0, #0x240
ld1h {z19.h}, p7/z, [x3]
add x3, x0, #0x280
ld1h {z18.h}, p7/z, [x3]
zip1 z8.d, z23.d, z18.d
add x3, x0, #0x2c0
zip2 z23.d, z23.d, z18.d
ld1h {z16.h}, p7/z, [x3]
zip1 z18.d, z19.d, z16.d
zip2 z19.d, z19.d, z16.d
zip1 z4.d, z8.d, z18.d
zip1 z6.d, z23.d, z19.d
zip2 z8.d, z8.d, z18.d
revh z18.d, p6/m, z6.d
mov z13.d, z18.d
zip2 z23.d, z23.d, z19.d
revh z23.d, p6/m, z23.d
rev z20.h, z20.h
rev z21.h, z21.h
rev z30.h, z30.h
rev z25.h, z25.h
zip1 z19.d, z30.d, z20.d
zip2 z30.d, z30.d, z20.d
zip1 z20.d, z25.d, z21.d
zip2 z25.d, z25.d, z21.d
zip1 z21.d, z19.d, z20.d
zip1 z10.d, z30.d, z25.d
zip2 z19.d, z19.d, z20.d
revh z10.d, p6/m, z10.d
zip2 z30.d, z30.d, z25.d
revh z18.d, p6/m, z30.d
addvl x3, sp, #0xf
saddlb z30.s, z23.h, z18.h
saddlb z20.s, z4.h, z21.h
add x3, x3, #0x40
add z20.s, z20.s, z30.s
str z4, [x3]
ldr z30, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
str z21, [x3]
ldr z25, [x3]
addvl x3, sp, #0x13
saddlt z16.s, z30.h, z25.h
saddlt z30.s, z23.h, z18.h
add x3, x3, #0x40
str z18, [x3]
add z16.s, z16.s, z30.s
addvl x3, sp, #0x10
saddlb z30.s, z13.h, z10.h
saddlb z18.s, z8.h, z19.h
add x3, x3, #0x40
add z18.s, z18.s, z30.s
str z8, [x3]
ldr z30, [x3]
addvl x3, sp, #0x11
saddlt z30.s, z30.h, z19.h
add x3, x3, #0x40
saddlt z25.s, z13.h, z10.h
add z25.s, z30.s, z25.s
str z13, [x3]
revw z18.d, p6/m, z18.d
revw z25.d, p6/m, z25.d
zip1 z30.s, z20.s, z16.s
zip2 z20.s, z20.s, z16.s
zip1 z13.s, z25.s, z18.s
zip2 z25.s, z25.s, z18.s
add z30.s, z30.s, z13.s
add z25.s, z20.s, z25.s
uzp2 z20.d, z30.d, z25.d
revw z20.d, p6/m, z20.d
uzp1 z30.d, z30.d, z25.d
add z25.s, z20.s, z30.s
sub z30.s, z30.s, z20.s
movprfx z16, z25
mul z16.s, p7/m, z16.s, z28.s
addp z16.s, p5/m, z16.s, z16.s
uzp1 z16.s, z16.s, z16.s
mov z21.d, z11.d
movprfx z18, z11
mul z18.s, p7/m, z18.s, z30.s
addp z18.s, p5/m, z18.s, z18.s
uzp1 z18.s, z18.s, z18.s
mov z8.d, z9.d
mul z25.s, p7/m, z25.s, z9.s
addp z25.s, p5/m, z25.s, z25.s
uzp1 z25.s, z25.s, z25.s
mov z6.d, z7.d
mul z30.s, p7/m, z30.s, z7.s
addp z30.s, p5/m, z30.s, z30.s
add x3, x0, #0x300
ld1h {z13.h}, p7/z, [x3]
uzp1 z30.s, z30.s, z30.s
add x3, x0, #0x340
ld1h {z20.h}, p7/z, [x3]
add x3, x0, #0x380
ld1h {z11.h}, p7/z, [x3]
zip1 z9.d, z13.d, z11.d
add x3, x0, #0x3c0
ld1h {z7.h}, p7/z, [x3]
zip2 z13.d, z13.d, z11.d
zip1 z11.d, z20.d, z7.d
zip2 z20.d, z20.d, z7.d
zip1 z4.d, z9.d, z11.d
zip1 z7.d, z13.d, z20.d
zip2 z9.d, z9.d, z11.d
revh z7.d, p6/m, z7.d
zip2 z13.d, z13.d, z20.d
revh z20.d, p6/m, z13.d
rev z12.h, z12.h
rev z22.h, z22.h
mov z1.d, z20.d
rev z27.h, z27.h
rev z31.h, z31.h
zip1 z20.d, z27.d, z12.d
zip2 z27.d, z27.d, z12.d
zip1 z12.d, z31.d, z22.d
zip2 z31.d, z31.d, z22.d
zip1 z13.d, z20.d, z12.d
zip1 z11.d, z27.d, z31.d
zip2 z20.d, z20.d, z12.d
revh z11.d, p6/m, z11.d
zip2 z27.d, z27.d, z31.d
revh z27.d, p6/m, z27.d
addvl x3, sp, #0x17
mov z12.d, z1.d
saddlb z31.s, z1.h, z27.h
add x3, x3, #0x40
str z13, [x3]
ldr z1, [x3]
addvl x3, sp, #0x16
saddlb z5.s, z4.h, z13.h
add z5.s, z5.s, z31.s
add x3, x3, #0x40
saddlt z31.s, z12.h, z27.h
str z12, [x3]
addvl x3, sp, #0x14
saddlt z1.s, z4.h, z1.h
add z1.s, z1.s, z31.s
add x3, x3, #0x40
saddlb z31.s, z7.h, z11.h
mov z22.d, z4.d
saddlb z4.s, z9.h, z20.h
add z4.s, z4.s, z31.s
str z9, [x3]
ldr z31, [x3]
addvl x3, sp, #0x15
saddlt z31.s, z31.h, z20.h
add x3, x3, #0x40
saddlt z12.s, z7.h, z11.h
add z12.s, z31.s, z12.s
str z7, [x3]
revw z4.d, p6/m, z4.d
revw z12.d, p6/m, z12.d
zip1 z31.s, z5.s, z1.s
zip2 z5.s, z5.s, z1.s
zip1 z0.s, z12.s, z4.s
zip2 z12.s, z12.s, z4.s
add z31.s, z31.s, z0.s
add z12.s, z5.s, z12.s
uzp2 z5.d, z31.d, z12.d
revw z5.d, p6/m, z5.d
uzp1 z31.d, z31.d, z12.d
add z12.s, z5.s, z31.s
sub z31.s, z31.s, z5.s
mul z28.s, p7/m, z28.s, z12.s
addp z28.s, p5/m, z28.s, z28.s
uzp1 z28.s, z28.s, z28.s
movprfx z5, z21
mul z5.s, p7/m, z5.s, z31.s
addp z5.s, p5/m, z5.s, z5.s
uzp1 z5.s, z5.s, z5.s
mul z12.s, p7/m, z12.s, z8.s
addp z12.s, p5/m, z12.s, z12.s
uzp1 z12.s, z12.s, z12.s
mul z31.s, p7/m, z31.s, z6.s
addp z31.s, p5/m, z31.s, z31.s
addvl x3, sp, #0x18
rshrnb z28.h, z28.s, #0xb
uzp1 z28.h, z28.h, z28.h
add x3, x3, #0x40
uzp1 z15.s, z15.s, z15.s
rshrnb z14.h, z14.s, #0xb
rshrnb z15.h, z15.s, #0xb
uzp1 z14.h, z14.h, z14.h
uzp1 z15.h, z15.h, z15.h
rshrnb z16.h, z16.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z16.h, z16.h, z16.h
uzp1 z29.h, z29.h, z29.h
stp d15, d14, [x1]
rshrnb z18.h, z18.s, #0xb
uzp1 z18.h, z18.h, z18.h
uzp1 z31.s, z31.s, z31.s
rshrnb z24.h, z24.s, #0xb
stp d16, d28, [x1, #0x10]
ldr z28, [x3]
add x3, sp, #0x40
rshrnb z28.h, z28.s, #0xb
uzp1 z28.h, z28.h, z28.h
uzp1 z24.h, z24.h, z24.h
str d29, [x1, #0x608]
ldr z29, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
str d28, [x1, #0x200]
rshrnb z28.h, z2.s, #0xb
uzp1 z28.h, z28.h, z28.h
str d28, [x1, #0x400]
rshrnb z31.h, z31.s, #0xb
rshrnb z28.h, z3.s, #0xb
ldr z3, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
str d18, [x1, #0x210]
sub z18.h, z29.h, z3.h
ldr z29, [x3]
addvl x3, sp, #5
uzp1 z31.h, z31.h, z31.h
add x3, x3, #0x40
ldr z3, [x3]
uzp1 z28.h, z28.h, z28.h
addvl x3, sp, #2
rshrnb z17.h, z17.s, #0xb
rshrnb z5.h, z5.s, #0xb
add x3, x3, #0x40
ldr z14, [x3]
uzp1 z17.h, z17.h, z17.h
addvl x3, sp, #6
uzp1 z5.h, z5.h, z5.h
rshrnb z25.h, z25.s, #0xb
add x3, x3, #0x40
uzp1 z25.h, z25.h, z25.h
rshrnb z12.h, z12.s, #0xb
rshrnb z30.h, z30.s, #0xb
uzp1 z12.h, z12.h, z12.h
uzp1 z30.h, z30.h, z30.h
str d17, [x1, #0x208]
str d5, [x1, #0x218]
str d24, [x1, #0x408]
sub z24.h, z29.h, z3.h
str d25, [x1, #0x410]
str d12, [x1, #0x418]
str d30, [x1, #0x610]
str d31, [x1, #0x618]
ldr z31, [x3]
sub z31.h, z14.h, z31.h
str d28, [x1, #0x600]
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
ldr z29, [x3]
addvl x3, sp, #0xc
add x3, x3, #0x40
ldr z3, [x3]
sub z1.h, z29.h, z3.h
addvl x3, sp, #9
add x3, x3, #0x40
ldr z29, [x3]
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z3, [x3]
sub z4.h, z29.h, z3.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z0, [x3]
sub z31.h, z5.h, z0.h
revh z0.d, p6/m, z31.d
addvl x3, sp, #0xb
add x3, x3, #0x40
ldr z29, [x3]
sub z31.h, z29.h, z26.h
revh z6.d, p6/m, z31.d
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z3, [x3]
addvl x3, sp, #0x12
add x3, x3, #0x40
ldr z2, [x3]
sub z8.h, z3.h, z2.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z3, [x3]
sub z7.h, z3.h, z19.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z21, [x3]
sub z31.h, z21.h, z10.h
revh z9.d, p6/m, z31.d
addvl x3, sp, #0x13
add x3, x3, #0x40
ldr z28, [x3]
sub z31.h, z23.h, z28.h
revh z13.d, p6/m, z31.d
addvl x3, sp, #0x18
add x3, x3, #0x40
str z22, [x3]
ldr z3, [x3]
addvl x3, sp, #0x17
add x3, x3, #0x40
ldr z2, [x3]
sub z22.h, z3.h, z2.h
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z3, [x3]
sub z21.h, z3.h, z20.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z12, [x3]
sub z31.h, z12.h, z11.h
revh z2.d, p6/m, z31.d
addvl x3, sp, #0x16
add x3, x3, #0x40
ldr z3, [x3]
sub z31.h, z3.h, z27.h
revh z3.d, p6/m, z31.d
addvl x3, sp, #0x1c
movi d31, #0000000000000000
ld1h {z15.h}, p7/z, [x4]
add x3, x3, #0x40
ldr z14, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z14.h[0]
addvl x3, sp, #0x1d
movprfx z25, z31
sdot z25.d, z4.h, z14.h[0]
movprfx z29, z31
sdot z29.d, z7.h, z14.h[0]
add x3, x3, #0x40
ldr z12, [x3]
movprfx z28, z31
sdot z28.d, z21.h, z14.h[0]
addvl x3, sp, #0x1e
sdot z30.d, z18.h, z15.h[0]
sdot z25.d, z1.h, z15.h[0]
add x3, x3, #0x40
ldr z5, [x3]
sdot z30.d, z17.h, z12.h[0]
add x3, x1, #0x40
sdot z30.d, z16.h, z5.h[0]
sdot z25.d, z0.h, z12.h[0]
sdot z29.d, z8.h, z15.h[0]
sdot z25.d, z6.h, z5.h[0]
sdot z29.d, z9.h, z12.h[0]
sdot z28.d, z22.h, z15.h[0]
sdot z29.d, z13.h, z5.h[0]
sdot z28.d, z2.h, z12.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z28.d, z3.h, z5.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0xc0
movprfx z30, z31
sdot z30.d, z24.h, z14.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z14.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z14.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z14.h[1]
sdot z30.d, z18.h, z15.h[1]
sdot z25.d, z1.h, z15.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z0.h, z12.h[1]
sdot z30.d, z16.h, z5.h[1]
sdot z25.d, z6.h, z5.h[1]
sdot z29.d, z8.h, z15.h[1]
sdot z28.d, z22.h, z15.h[1]
sdot z29.d, z9.h, z12.h[1]
sdot z28.d, z2.h, z12.h[1]
sdot z29.d, z13.h, z5.h[1]
sdot z28.d, z3.h, z5.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
cntb x3
cntb x6
lsl x3, x3, #5
lsl x6, x6, #5
add x3, sp, x3
add x3, x3, #0x40
ldr z15, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z15.h[0]
addvl x3, sp, #0x1f
movprfx z25, z31
sdot z25.d, z4.h, z15.h[0]
movprfx z29, z31
sdot z29.d, z7.h, z15.h[0]
add x3, x3, #0x40
ldr z14, [x3]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[0]
addvl x3, x6, #1
sdot z30.d, z18.h, z14.h[0]
sdot z25.d, z1.h, z14.h[0]
add x3, x3, #0x40
sdot z29.d, z8.h, z14.h[0]
sdot z28.d, z22.h, z14.h[0]
add x3, sp, x3
ldr z12, [x3]
sdot z30.d, z17.h, z12.h[0]
rdvl x3, #0x11
sdot z25.d, z0.h, z12.h[0]
sdot z29.d, z9.h, z12.h[0]
lsl x3, x3, #1
sdot z28.d, z2.h, z12.h[0]
rdvl x6, #0x11
add x3, sp, x3
lsl x6, x6, #1
add x3, x3, #0x40
ldr z5, [x3]
sdot z25.d, z6.h, z5.h[0]
add x3, x1, #0x140
sdot z28.d, z3.h, z5.h[0]
sdot z30.d, z16.h, z5.h[0]
sdot z29.d, z13.h, z5.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x1c0
movprfx z30, z31
sdot z30.d, z24.h, z15.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[1]
sdot z30.d, z18.h, z14.h[1]
sdot z25.d, z1.h, z14.h[1]
sdot z30.d, z17.h, z12.h[1]
sdot z25.d, z0.h, z12.h[1]
sdot z30.d, z16.h, z5.h[1]
sdot z25.d, z6.h, z5.h[1]
sdot z29.d, z8.h, z14.h[1]
sdot z28.d, z22.h, z14.h[1]
sdot z29.d, z9.h, z12.h[1]
sdot z28.d, z2.h, z12.h[1]
sdot z29.d, z13.h, z5.h[1]
sdot z28.d, z3.h, z5.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xc0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1c0
ld1h {z5.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x2c0
ld1h {z14.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x2, #0x3c0
ld1h {z15.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
add x3, x1, #0x240
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x2c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0xe0
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x1e0
ld1h {z5.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x2e0
ld1h {z14.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x2, #0x3e0
ld1h {z15.h}, p7/z, [x3]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
add x3, x1, #0x340
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x3c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x200
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x300
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z12.h[0]
add x3, x2, #0x400
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z12.h[0]
addvl x3, x6, #1
movprfx z29, z31
sdot z29.d, z7.h, z12.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z12.h[0]
add x3, x3, #0x40
add x3, sp, x3
ldr z5, [x3]
sdot z30.d, z18.h, z5.h[0]
add x3, x1, #0x440
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z1.h, z5.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z29.d, z8.h, z5.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z22.h, z5.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z2.h, z14.h[0]
uzp1 z30.s, z30.s, z25.s
sdot z28.d, z3.h, z15.h[0]
rshrnb z30.h, z30.s, #0xb
uzp1 z29.s, z29.s, z28.s
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x4c0
movprfx z30, z31
sdot z30.d, z24.h, z12.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z12.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z12.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z12.h[1]
sdot z30.d, z18.h, z5.h[1]
sdot z25.d, z1.h, z5.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z5.h[1]
sdot z28.d, z22.h, z5.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x120
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x220
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x320
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x420
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x1, #0x540
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x5c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x140
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x240
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x340
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x440
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x1, #0x640
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x6c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x2, #0x160
ld1h {z12.h}, p7/z, [x3]
add x3, x2, #0x260
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x360
ld1h {z14.h}, p7/z, [x3]
movprfx z30, z31
sdot z30.d, z24.h, z5.h[0]
add x3, x2, #0x460
ld1h {z15.h}, p7/z, [x3]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[0]
add x3, x1, #0x740
movprfx z29, z31
sdot z29.d, z7.h, z5.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[0]
sdot z30.d, z18.h, z12.h[0]
sdot z25.d, z1.h, z12.h[0]
sdot z30.d, z17.h, z14.h[0]
sdot z25.d, z0.h, z14.h[0]
sdot z30.d, z16.h, z15.h[0]
sdot z25.d, z6.h, z15.h[0]
sdot z29.d, z8.h, z12.h[0]
sdot z28.d, z22.h, z12.h[0]
sdot z29.d, z9.h, z14.h[0]
sdot z28.d, z2.h, z14.h[0]
sdot z29.d, z13.h, z15.h[0]
sdot z28.d, z3.h, z15.h[0]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
add x3, x1, #0x7c0
movprfx z30, z31
sdot z30.d, z24.h, z5.h[1]
movprfx z25, z31
sdot z25.d, z4.h, z5.h[1]
movprfx z29, z31
sdot z29.d, z7.h, z5.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z5.h[1]
sdot z30.d, z18.h, z12.h[1]
sdot z25.d, z1.h, z12.h[1]
sdot z30.d, z17.h, z14.h[1]
sdot z25.d, z0.h, z14.h[1]
sdot z30.d, z16.h, z15.h[1]
sdot z25.d, z6.h, z15.h[1]
sdot z29.d, z8.h, z12.h[1]
sdot z28.d, z22.h, z12.h[1]
sdot z29.d, z9.h, z14.h[1]
sdot z28.d, z2.h, z14.h[1]
sdot z29.d, z13.h, z15.h[1]
sdot z28.d, z3.h, z15.h[1]
uzp1 z30.s, z30.s, z25.s
uzp1 z29.s, z29.s, z28.s
rshrnb z30.h, z30.s, #0xb
rshrnb z29.h, z29.s, #0xb
uzp1 z30.h, z30.h, z29.h
st1h {z30.h}, p7, [x3]
addvl x3, sp, #4
add x3, x3, #0x40
ldr z16, [x3]
add x3, sp, #0x40
ldr z2, [x3]
add z30.h, z16.h, z2.h
addvl x3, sp, #5
add x3, x3, #0x40
ldr z17, [x3]
addvl x3, sp, #1
add x3, x3, #0x40
ldr z16, [x3]
add z29.h, z17.h, z16.h
addvl x3, sp, #2
add x3, x3, #0x40
ldr z14, [x3]
addvl x3, sp, #6
add x3, x3, #0x40
ldr z28, [x3]
add z25.h, z14.h, z28.h
addvl x3, sp, #3
add x3, x3, #0x40
ldr z15, [x3]
addvl x3, sp, #7
add x3, x3, #0x40
ldr z24, [x3]
add z18.h, z15.h, z24.h
addvl x3, sp, #0xc
sub z28.h, z30.h, z18.h
sub z24.h, z29.h, z25.h
add x3, x3, #0x40
ldr z17, [x3]
add z30.h, z30.h, z18.h
addvl x3, sp, #8
add z29.h, z29.h, z25.h
add x3, x3, #0x40
ldr z16, [x3]
add z17.h, z17.h, z16.h
addvl x3, sp, #0xd
add x3, x3, #0x40
ldr z16, [x3]
addvl x3, sp, #9
add x3, x3, #0x40
ldr z15, [x3]
add z16.h, z16.h, z15.h
addvl x3, sp, #0xa
add x3, x3, #0x40
ldr z5, [x3]
addvl x3, sp, #0xe
add x3, x3, #0x40
ldr z0, [x3]
add z14.h, z5.h, z0.h
addvl x3, sp, #0xb
sub z12.h, z16.h, z14.h
add x3, x3, #0x40
ldr z22, [x3]
add z26.h, z22.h, z26.h
addvl x3, sp, #0x12
sub z15.h, z17.h, z26.h
add x3, x3, #0x40
ldr z6, [x3]
addvl x3, sp, #0xf
add x3, x3, #0x40
ldr z5, [x3]
add z21.h, z6.h, z5.h
addvl x3, sp, #0x10
add x3, x3, #0x40
ldr z8, [x3]
add z19.h, z19.h, z8.h
addvl x3, sp, #0x11
add x3, x3, #0x40
ldr z13, [x3]
add z10.h, z13.h, z10.h
addvl x3, sp, #0x13
sub z6.h, z19.h, z10.h
add x3, x3, #0x40
ldr z22, [x3]
add z23.h, z23.h, z22.h
addvl x3, sp, #0x17
sub z8.h, z21.h, z23.h
add x3, x3, #0x40
ldr z13, [x3]
addvl x3, sp, #0x18
add x3, x3, #0x40
ldr z22, [x3]
add z22.h, z13.h, z22.h
addvl x3, sp, #0x14
add x3, x3, #0x40
ldr z13, [x3]
add z20.h, z20.h, z13.h
addvl x3, sp, #0x15
add x3, x3, #0x40
ldr z7, [x3]
add z11.h, z7.h, z11.h
addvl x3, sp, #0x16
sub z7.h, z20.h, z11.h
add x3, x3, #0x40
ldr z3, [x3]
add z27.h, z3.h, z27.h
add x3, x2, #0x480
ld1h {z5.h}, p7/z, [x3]
sub z9.h, z22.h, z27.h
add x3, x2, #0x500
ld1h {z4.h}, p7/z, [x3]
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
add x3, x1, #0x80
sdot z13.d, z28.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z15.h, z5.h[0]
sdot z3.d, z8.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z13.s, z13.s, z1.s
sdot z2.d, z9.h, z5.h[0]
rshrnb z13.h, z13.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x1, #0x180
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z13.d, z28.h, z5.h[1]
sdot z1.d, z15.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z8.h, z5.h[1]
sdot z2.d, z9.h, z5.h[1]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x2, #0x4a0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x520
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x280
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z13.d, z28.h, z5.h[0]
sdot z1.d, z15.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z8.h, z5.h[0]
sdot z2.d, z9.h, z5.h[0]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x1, #0x380
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z13.d, z28.h, z5.h[1]
sdot z1.d, z15.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z8.h, z5.h[1]
sdot z2.d, z9.h, z5.h[1]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x2, #0x4c0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x540
ld1h {z4.h}, p7/z, [x3]
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
add x3, x1, #0x480
sdot z13.d, z28.h, z5.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
sdot z1.d, z15.h, z5.h[0]
sdot z3.d, z8.h, z5.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
uzp1 z13.s, z13.s, z1.s
sdot z2.d, z9.h, z5.h[0]
rshrnb z13.h, z13.s, #0xb
uzp1 z3.s, z3.s, z2.s
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x1, #0x580
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[1]
sdot z13.d, z28.h, z5.h[1]
sdot z1.d, z15.h, z5.h[1]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[1]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[1]
sdot z3.d, z8.h, z5.h[1]
sdot z2.d, z9.h, z5.h[1]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
add x3, x2, #0x4e0
ld1h {z5.h}, p7/z, [x3]
add x3, x2, #0x560
ld1h {z4.h}, p7/z, [x3]
add x3, x1, #0x680
movprfx z13, z31
sdot z13.d, z24.h, z4.h[0]
movprfx z1, z31
sdot z1.d, z12.h, z4.h[0]
sdot z13.d, z28.h, z5.h[0]
sdot z1.d, z15.h, z5.h[0]
movprfx z3, z31
sdot z3.d, z6.h, z4.h[0]
movprfx z2, z31
sdot z2.d, z7.h, z4.h[0]
sdot z3.d, z8.h, z5.h[0]
sdot z2.d, z9.h, z5.h[0]
uzp1 z13.s, z13.s, z1.s
uzp1 z3.s, z3.s, z2.s
rshrnb z13.h, z13.s, #0xb
rshrnb z3.h, z3.s, #0xb
uzp1 z13.h, z13.h, z3.h
st1h {z13.h}, p7, [x3]
movprfx z13, z31
sdot z13.d, z24.h, z4.h[1]
add x3, x1, #0x780
sdot z13.d, z28.h, z5.h[1]
movprfx z24, z31
sdot z24.d, z6.h, z4.h[1]
movprfx z28, z31
sdot z28.d, z12.h, z4.h[1]
sdot z24.d, z8.h, z5.h[1]
sdot z28.d, z15.h, z5.h[1]
movprfx z15, z31
sdot z15.d, z7.h, z4.h[1]
uzp1 z13.s, z13.s, z28.s
sdot z15.d, z9.h, z5.h[1]
rshrnb z13.h, z13.s, #0xb
uzp1 z24.s, z24.s, z15.s
rshrnb z24.h, z24.s, #0xb
uzp1 z13.h, z13.h, z24.h
st1h {z13.h}, p7, [x3]
revh z29.d, p6/m, z29.d
sub z30.h, z30.h, z29.h
add z17.h, z17.h, z26.h
add z16.h, z16.h, z14.h
revh z16.d, p6/m, z16.d
sub z17.h, z17.h, z16.h
add z21.h, z21.h, z23.h
add z19.h, z19.h, z10.h
revh z19.d, p6/m, z19.d
sub z21.h, z21.h, z19.h
add z22.h, z22.h, z27.h
add z20.h, z20.h, z11.h
revh z20.d, p6/m, z20.d
add x3, x2, #0x580
ld1h {z15.h}, p7/z, [x3]
sub z22.h, z22.h, z20.h
add x3, x1, #0x100
movprfx z29, z31
sdot z29.d, z30.h, z15.h[0]
movprfx z26, z31
sdot z26.d, z17.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z22.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[0]
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
sdot z26.d, z17.h, z15.h[1]
movprfx z27, z31
sdot z27.d, z22.h, z15.h[1]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[1]
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
sdot z26.d, z17.h, z15.h[0]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[0]
movprfx z27, z31
sdot z27.d, z22.h, z15.h[0]
uzp1 z29.s, z29.s, z26.s
uzp1 z28.s, z28.s, z27.s
rshrnb z29.h, z29.s, #0xb
rshrnb z28.h, z28.s, #0xb
uzp1 z29.h, z29.h, z28.h
st1h {z29.h}, p7, [x3]
movprfx z28, z31
sdot z28.d, z21.h, z15.h[1]
movprfx z29, z31
sdot z29.d, z30.h, z15.h[1]
add x3, x1, #0x700
movprfx z30, z31
sdot z30.d, z17.h, z15.h[1]
add x0, x0, #0x400
sdot z31.d, z22.h, z15.h[1]
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
