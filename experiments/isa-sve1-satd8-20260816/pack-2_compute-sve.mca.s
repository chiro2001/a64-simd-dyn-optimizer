.arch armv8.2-a+sve2
.text
ptrue p1.h, vl8
lsl x9, x1, #2
mov w10, #6
ptrue p0.h
lsl x11, x3, #2
madd x13, x1, x10, x0
mov x8, #-8
add x12, x0, x9
ld1b {z0.h}, p1/z, [x0]
not p2.b, p0/z, p1.b
madd x10, x3, x10, x2
add x14, x0, x1
add x9, x14, x9
ld1b {z5.h}, p1/z, [x0, x1]
ld1b {z1.h}, p2/z, [x12, x8]
add x12, x2, x11
ld1b {z3.h}, p2/z, [x9, x8]
ld1b {z2.h}, p2/z, [x12, x8]
add x12, x2, x3
ld1b {z7.h}, p2/z, [x13, x8]
add x9, x12, x11
lsl x11, x1, #1
sub x12, x2, x3
ld1b {z4.h}, p2/z, [x9, x8]
mov z0.h, p2/m, z1.h
ld1b {z1.h}, p1/z, [x2]
lsl x9, x3, #1
ld1b {z16.h}, p2/z, [x10, x8]
sub x10, x0, x1
add x10, x10, x1, lsl #3
add x12, x12, x3, lsl #3
ld1b {z6.h}, p1/z, [x0, x11]
add x11, x11, x1
ld1b {z17.h}, p1/z, [x2, x9]
add x9, x9, x3
mov z1.h, p2/m, z2.h
ld1b {z2.h}, p1/z, [x2, x3]
ld1b {z18.h}, p1/z, [x0, x11]
ld1b {z19.h}, p2/z, [x10, x8]
ld1b {z20.h}, p1/z, [x2, x9]
ld1b {z21.h}, p2/z, [x12, x8]
adrp x8, #0x455000
add x8, x8, #0xe0
sub z0.h, z0.h, z1.h
sel z1.h, p2, z3.h, z5.h
mov z2.h, p2/m, z4.h
sel z3.h, p2, z7.h, z6.h
sel z4.h, p2, z16.h, z17.h
sel z5.h, p2, z19.h, z18.h
sel z6.h, p2, z21.h, z20.h
ldr z7, [x8]
adrp x8, #0x455000
add x8, x8, #0xc0
sub z1.h, z1.h, z2.h
sub z2.h, z3.h, z4.h
sub z3.h, z5.h, z6.h
tbl z4.h, {z0.h}, z7.h
ldr z5, [x8]
tbl z6.h, {z1.h}, z7.h
adrp x8, #0x455000
add x8, x8, #0xa0
tbl z16.h, {z2.h}, z7.h
tbl z17.h, {z3.h}, z7.h
mla z0.h, p0/m, z4.h, z5.h
ldr z4, [x8]
mla z1.h, p0/m, z6.h, z5.h
mla z2.h, p0/m, z16.h, z5.h
mla z3.h, p0/m, z17.h, z5.h
tbl z0.h, {z0.h}, z4.h
tbl z1.h, {z1.h}, z4.h
tbl z2.h, {z2.h}, z4.h
tbl z3.h, {z3.h}, z4.h
tbl z4.h, {z0.h}, z7.h
tbl z6.h, {z1.h}, z7.h
tbl z16.h, {z2.h}, z7.h
tbl z7.h, {z3.h}, z7.h
mla z0.h, p0/m, z4.h, z5.h
mla z1.h, p0/m, z6.h, z5.h
mla z2.h, p0/m, z16.h, z5.h
mla z3.h, p0/m, z7.h, z5.h
add z4.h, z0.h, z1.h
sabd z0.h, p0/m, z0.h, z1.h
add z5.h, z2.h, z3.h
sabd z2.h, p0/m, z2.h, z3.h
abs z4.h, p0/m, z4.h
abs z5.h, p0/m, z5.h
smax z0.h, p0/m, z0.h, z2.h
smax z4.h, p0/m, z4.h, z5.h
add z0.h, z4.h, z0.h
uaddv d0, p0, z0.h
fmov w0, s0
