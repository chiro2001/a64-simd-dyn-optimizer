.arch armv8.2-a+sve2
.text
stp d8, d9, [sp, #-0x10]!
stp d10, d11, [sp, #-0x10]!
stp d12, d13, [sp, #-0x10]!
stp d14, d15, [sp, #-0x10]!
sub sp, sp, #0x800
mov x5, sp
adr x6, #0x400814
adr x7, #0x400c14
adr x8, #0x400e14
mov x9, x6
mov x10, x7
adr x13, #0x400e94
add x14, x13, #0x40
mov w11, #8
mov w17, #8
ptrue p0.h
ptrue p1.d, vl2
add x2, x2, x2
mov z31.h, #0
ld1d {z29.d}, p0/z, [x13, #2, mul vl]
ld1d {z28.d}, p0/z, [x13, #3, mul vl]
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z2.h}, p0/z, [x0]
ld1h {z3.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z4.h}, p0/z, [x0]
ld1h {z5.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
ld1h {z6.h}, p0/z, [x0]
ld1h {z7.h}, p0/z, [x0, #1, mul vl]
add x0, x0, x2
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
add z20.h, z0.h, z1.h
add z21.h, z2.h, z3.h
add z22.h, z4.h, z5.h
add z23.h, z6.h, z7.h
zip1 z10.d, z20.d, z22.d
zip2 z11.d, z20.d, z22.d
zip1 z12.d, z21.d, z23.d
zip2 z13.d, z21.d, z23.d
zip1 z24.d, z10.d, z12.d
zip2 z25.d, z10.d, z12.d
zip1 z26.d, z11.d, z13.d
zip2 z27.d, z11.d, z13.d
revh z26.d, p0/m, z26.d
revh z27.d, p0/m, z27.d
sub z20.h, z24.h, z27.h
sub z21.h, z25.h, z26.h
add z0.h, z24.h, z27.h
add z1.h, z25.h, z26.h
revh z1.d, p0/m, z1.d
sub z26.h, z0.h, z1.h
add z27.h, z0.h, z1.h
ld1d {z30.d}, p0/z, [x13]
mov w12, #4
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
ld1h {z10.h}, p0/z, [x9, #4, mul vl]
ld1h {z11.h}, p0/z, [x9, #5, mul vl]
ld1h {z12.h}, p0/z, [x9, #6, mul vl]
ld1h {z13.h}, p0/z, [x9, #7, mul vl]
add x9, x9, #0x100
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
movprfx z6, z31
sdot z6.d, z18.h, z10.h[0]
movprfx z7, z31
sdot z7.d, z18.h, z12.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
sdot z6.d, z19.h, z10.h[1]
sdot z7.d, z19.h, z12.h[1]
sdot z6.d, z14.h, z11.h[0]
sdot z7.d, z14.h, z13.h[0]
sdot z6.d, z15.h, z11.h[1]
sdot z7.d, z15.h, z13.h[1]
uzp1 z4.s, z4.s, z5.s
uzp1 z6.s, z6.s, z7.s
rshrnb z4.h, z4.s, #4
rshrnb z6.h, z6.s, #4
uzp1 z4.h, z4.h, z6.h
st1d {z4.d}, p0, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z20.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z20.h, z1.h[0]
sdot z4.d, z21.h, z0.h[1]
sdot z5.d, z21.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #4
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1h {z0.h}, p0/z, [x10, #4, mul vl]
ld1h {z1.h}, p0/z, [x10, #5, mul vl]
ld1h {z2.h}, p0/z, [x10, #6, mul vl]
ld1h {z3.h}, p0/z, [x10, #7, mul vl]
movprfx z4, z31
sdot z4.d, z27.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z27.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z27.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z27.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #4
rshrnb z9.h, z9.s, #4
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w11, w11, #1
mov x5, x1
mov x0, sp
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
ld1h {z0.h}, p0/z, [x0]
ld1h {z1.h}, p0/z, [x0, #1, mul vl]
ld1h {z2.h}, p0/z, [x0, #2, mul vl]
ld1h {z3.h}, p0/z, [x0, #3, mul vl]
ld1h {z4.h}, p0/z, [x0, #4, mul vl]
ld1h {z5.h}, p0/z, [x0, #5, mul vl]
ld1h {z6.h}, p0/z, [x0, #6, mul vl]
ld1h {z7.h}, p0/z, [x0, #7, mul vl]
add x0, x0, #0x100
rev z1.h, z1.h
rev z3.h, z3.h
rev z5.h, z5.h
rev z7.h, z7.h
sub z10.h, z0.h, z1.h
sub z11.h, z2.h, z3.h
sub z12.h, z4.h, z5.h
sub z13.h, z6.h, z7.h
zip1 z14.d, z10.d, z12.d
zip2 z15.d, z10.d, z12.d
zip1 z16.d, z11.d, z13.d
zip2 z17.d, z11.d, z13.d
zip1 z18.d, z14.d, z16.d
zip2 z19.d, z14.d, z16.d
zip1 z14.d, z15.d, z17.d
zip2 z15.d, z15.d, z17.d
saddlb z10.s, z0.h, z1.h
saddlt z11.s, z0.h, z1.h
saddlb z12.s, z2.h, z3.h
saddlt z13.s, z2.h, z3.h
saddlb z20.s, z4.h, z5.h
saddlt z21.s, z4.h, z5.h
saddlb z22.s, z6.h, z7.h
saddlt z23.s, z6.h, z7.h
zip1 z24.s, z10.s, z11.s
zip2 z25.s, z10.s, z11.s
zip1 z26.s, z12.s, z13.s
zip2 z27.s, z12.s, z13.s
zip1 z10.s, z20.s, z21.s
zip2 z11.s, z20.s, z21.s
zip1 z12.s, z22.s, z23.s
zip2 z13.s, z22.s, z23.s
rev z25.s, z25.s
rev z27.s, z27.s
rev z11.s, z11.s
rev z13.s, z13.s
sub z8.s, z24.s, z25.s
sub z9.s, z26.s, z27.s
sub z16.s, z10.s, z11.s
sub z17.s, z12.s, z13.s
add z24.s, z24.s, z25.s
add z25.s, z26.s, z27.s
add z26.s, z10.s, z11.s
add z27.s, z12.s, z13.s
uzp1 z20.h, z8.h, z9.h
uzp1 z21.h, z16.h, z17.h
uzp1 z22.d, z20.d, z21.d
uzp2 z23.d, z20.d, z21.d
zip1 z10.d, z24.d, z26.d
zip2 z11.d, z26.d, z24.d
zip1 z12.d, z25.d, z27.d
zip2 z13.d, z27.d, z25.d
rev z11.s, z11.s
rev z13.s, z13.s
add z20.s, z10.s, z11.s
add z21.s, z12.s, z13.s
sub z24.s, z10.s, z11.s
sub z25.s, z12.s, z13.s
uzp1 z26.d, z24.d, z25.d
uzp2 z27.d, z24.d, z25.d
uzp1 z26.h, z26.h, z27.h
zip1 z12.d, z20.d, z21.d
zip2 z13.d, z20.d, z21.d
revw z13.d, p0/m, z13.d
add z16.s, z12.s, z13.s
sub z17.s, z12.s, z13.s
mov z31.h, #0
mov w12, #8
ld1d {z30.d}, p0/z, [x13]
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x9]
ld1h {z1.h}, p0/z, [x9, #1, mul vl]
ld1h {z2.h}, p0/z, [x9, #2, mul vl]
ld1h {z3.h}, p0/z, [x9, #3, mul vl]
add x9, x9, #0x80
movprfx z4, z31
sdot z4.d, z18.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z18.h, z2.h[0]
sdot z4.d, z19.h, z0.h[1]
sdot z5.d, z19.h, z2.h[1]
sdot z4.d, z14.h, z1.h[0]
sdot z5.d, z14.h, z3.h[0]
sdot z4.d, z15.h, z1.h[1]
sdot z5.d, z15.h, z3.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x100
sub w12, w12, #1
mov w12, #4
ld1d {z30.d}, p0/z, [x13, #1, mul vl]
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
add x10, x10, #0x40
movprfx z4, z31
sdot z4.d, z22.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z22.h, z1.h[0]
sdot z4.d, z23.h, z0.h[1]
sdot z5.d, z23.h, z1.h[1]
uzp1 z6.s, z4.s, z5.s
rshrnb z6.h, z6.s, #0xb
uzp1 z6.h, z6.h, z31.h
st1d {z6.d}, p1, [x5, z30.d]
add z30.d, z30.d, #0x200
sub w12, w12, #1
ld1h {z0.h}, p0/z, [x10]
ld1h {z1.h}, p0/z, [x10, #1, mul vl]
ld1h {z2.h}, p0/z, [x10, #2, mul vl]
ld1h {z3.h}, p0/z, [x10, #3, mul vl]
movprfx z4, z31
sdot z4.d, z26.h, z0.h[0]
movprfx z5, z31
sdot z5.d, z26.h, z1.h[0]
movprfx z6, z31
sdot z6.d, z26.h, z2.h[0]
movprfx z7, z31
sdot z7.d, z26.h, z3.h[0]
uzp1 z8.s, z4.s, z5.s
uzp1 z9.s, z6.s, z7.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z29.d]
ld1w {z0.s}, p0/z, [x8]
ld1w {z1.s}, p0/z, [x8, #1, mul vl]
ld1w {z2.s}, p0/z, [x8, #2, mul vl]
ld1w {z3.s}, p0/z, [x8, #3, mul vl]
mul z4.s, z16.s, z0.s
mul z5.s, z17.s, z1.s
mul z6.s, z16.s, z2.s
mul z7.s, z17.s, z3.s
addp z4.s, p0/m, z4.s, z6.s
addp z5.s, p0/m, z5.s, z7.s
uzp1 z8.s, z4.s, z5.s
uzp2 z9.s, z4.s, z5.s
rshrnb z8.h, z8.s, #0xb
rshrnb z9.h, z9.s, #0xb
uzp1 z10.h, z8.h, z9.h
st1d {z10.d}, p0, [x5, z28.d]
mov x9, x6
mov x10, x7
add x5, x5, #8
sub w17, w17, #1
add sp, sp, #0x800
ldp d14, d15, [sp], #0x10
ldp d12, d13, [sp], #0x10
ldp d10, d11, [sp], #0x10
ldp d8, d9, [sp], #0x10
