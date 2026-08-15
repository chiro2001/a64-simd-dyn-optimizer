.arch armv8.2-a+sve2
.text
ptrue p0.h, vl8
lsl x8, x1, #1
lsl x9, x3, #1
lsl x13, x1, #3
lsl x15, x3, #3
ptrue p1.h
add x10, x8, x1
ld1b {z4.h}, p0/z, [x0, x8]
mov w8, #6
add x11, x9, x3
ld1b {z5.h}, p0/z, [x2, x9]
mul x9, x1, x8
ld1b {z0.h}, p0/z, [x0]
ld1b {z1.h}, p0/z, [x2]
ld1b {z2.h}, p0/z, [x0, x1]
mul x8, x3, x8
ld1b {z3.h}, p0/z, [x2, x3]
ld1b {z6.h}, p0/z, [x0, x10]
ld1b {z7.h}, p0/z, [x2, x11]
lsl x10, x1, #2
lsl x11, x3, #2
sub z0.h, z0.h, z1.h
sub z1.h, z2.h, z3.h
sub z2.h, z4.h, z5.h
add x12, x10, x1
add x14, x11, x3
ld1b {z4.h}, p0/z, [x0, x10]
ld1b {z5.h}, p0/z, [x2, x11]
sub x10, x0, x1
sub x11, x2, x3
sub z3.h, z6.h, z7.h
ld1b {z6.h}, p0/z, [x0, x12]
ld1b {z7.h}, p0/z, [x2, x14]
ld1b {z16.h}, p0/z, [x0, x9]
ld1b {z17.h}, p0/z, [x2, x8]
ld1b {z18.h}, p0/z, [x10, x13]
ld1b {z19.h}, p0/z, [x11, x15]
sub z4.h, z4.h, z5.h
sub z5.h, z6.h, z7.h
add z6.h, z1.h, z0.h
sub z0.h, z0.h, z1.h
add z1.h, z3.h, z2.h
sub z2.h, z2.h, z3.h
sub z3.h, z16.h, z17.h
sub z7.h, z18.h, z19.h
add z18.h, z5.h, z4.h
sub z4.h, z4.h, z5.h
add z16.h, z1.h, z6.h
add z17.h, z2.h, z0.h
sub z1.h, z6.h, z1.h
add z5.h, z7.h, z3.h
sub z3.h, z3.h, z7.h
sub z0.h, z0.h, z2.h
trn1 z7.h, z16.h, z17.h
trn2 z16.h, z16.h, z17.h
add z2.h, z5.h, z18.h
add z6.h, z3.h, z4.h
trn1 z17.h, z1.h, z0.h
trn2 z0.h, z1.h, z0.h
sub z1.h, z18.h, z5.h
sub z3.h, z4.h, z3.h
add z4.h, z16.h, z7.h
sabd z7.h, p1/m, z7.h, z16.h
trn1 z18.h, z2.h, z6.h
trn2 z2.h, z2.h, z6.h
add z5.h, z0.h, z17.h
trn1 z6.h, z1.h, z3.h
trn2 z1.h, z1.h, z3.h
abs z4.h, p1/m, z4.h
sabd z0.h, p1/m, z0.h, z17.h
add z3.h, z2.h, z18.h
sabd z2.h, p1/m, z2.h, z18.h
abs z5.h, p1/m, z5.h
add z19.h, z1.h, z6.h
sabd z1.h, p1/m, z1.h, z6.h
abs z3.h, p1/m, z3.h
trn1 z16.s, z4.s, z5.s
abs z19.h, p1/m, z19.h
trn2 z4.s, z4.s, z5.s
trn1 z5.s, z7.s, z0.s
trn2 z0.s, z7.s, z0.s
trn1 z6.s, z3.s, z19.s
trn2 z3.s, z3.s, z19.s
umax z4.h, p1/m, z4.h, z16.h
umax z0.h, p1/m, z0.h, z5.h
trn1 z5.s, z2.s, z1.s
trn2 z1.s, z2.s, z1.s
umax z3.h, p1/m, z3.h, z6.h
add z0.h, z0.h, z4.h
umax z1.h, p1/m, z1.h, z5.h
add z0.h, z0.h, z3.h
add z0.h, z0.h, z1.h
uaddv d0, p0, z0.h
fmov w8, s0
and w0, w8, #0xffff
