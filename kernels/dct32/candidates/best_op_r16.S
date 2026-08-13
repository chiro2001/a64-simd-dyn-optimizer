	.arch armv8.2-a+crc+sve2
	.file	"best_op_r16.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB9:
	.cfi_startproc
	rdvl	x12, #25
	adrp	x3, .LANCHOR0
	ptrue	p7.b, all
	lsl	x12, x12, 1
	add	x3, x3, :lo12:.LANCHOR0
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0x90,0x1,0x1e,0x22
	add	x11, x3, 96
	sub	sp, sp, #112
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0x90,0x1,0x1e,0x23,0x70,0x22
	add	x5, x2, x2, lsl 1
	add	x7, x2, x2, lsl 2
	lsl	x18, x2, 3
	lsl	x8, x2, 4
	sub	x9, x18, x2
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x10, x18, x2
	ld1w	z31.s, p7/z, [x11]
	add	x11, sp, 112
	stp	x19, x20, [sp, 16]
	add	x4, x3, 32
	ld1h	z5.h, p7/z, [x4]
	sub	x8, x8, x2
	ld1w	z4.s, p7/z, [x3]
	mov	z6.d, z4.d
	stp	x21, x22, [sp, 32]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	rdvl	x22, #21
	lsl	x22, x22, 1
	stp	d8, d9, [sp, 48]
	add	x17, x0, x5, lsl 1
	add	x16, x0, x7, lsl 1
	stp	d10, d11, [sp, 64]
	add	x15, x0, x5, lsl 2
	add	x13, x0, x7, lsl 2
	stp	d12, d13, [sp, 80]
	add	x7, x2, x7, lsl 1
	add	x12, x0, x5, lsl 3
	stp	d14, d15, [sp, 96]
	.cfi_escape 0x10,0x48,0x2,0x8f,0x30
	.cfi_escape 0x10,0x49,0x2,0x8f,0x38
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xe8,0
	add	x5, x2, x5, lsl 2
	str	z31, [x11]
	add	x11, x3, 128
	ld1w	z31.s, p7/z, [x11]
	addvl	x11, sp, #1
	lsl	x4, x2, 5
	add	x11, x11, 112
	str	z31, [x11]
	add	x19, x0, x2, lsl 1
	add	x11, x3, 160
	ld1w	z31.s, p7/z, [x11]
	add	x30, x0, x2, lsl 2
	addvl	x11, sp, #2
	add	x2, x0, x2, lsl 3
	add	x11, x11, 112
	str	z31, [x11]
	add	x14, x0, x9, lsl 1
	add	x11, x3, 192
	ld1h	z31.h, p7/z, [x11]
	add	x10, x0, x10, lsl 1
	rdvl	x11, #21
	add	x7, x0, x7, lsl 1
	lsl	x11, x11, 1
	add	x5, x0, x5, lsl 1
	add	x11, sp, x11
	add	x9, x0, x9, lsl 2
	add	x11, x11, 112
	str	z31, [x11]
	add	x8, x0, x8, lsl 1
	add	x11, x3, 224
	ld1h	z31.h, p7/z, [x11]
	add	x20, x1, 64
	addvl	x11, x22, #1
	add	x18, x18, x2
	add	x11, x11, 112
	add	x21, x3, 64
	add	x11, sp, x11
	str	z31, [x11]
	mov	x6, 0
	add	x11, x3, 256
	ld1h	z0.h, p7/z, [x11]
	add	x11, x3, 288
	ld1h	z1.h, p7/z, [x11]
	add	x11, x3, 320
	ld1h	z2.h, p7/z, [x11]
	add	x11, x3, 352
	ld1h	z3.h, p7/z, [x11]
	add	x11, x3, 384
	ld1h	z31.h, p7/z, [x11]
	cntb	x11, all, mul #11
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	str	z31, [x11]
	add	x11, x3, 416
	ld1h	z31.h, p7/z, [x11]
	cntb	x11, all, mul #3
	lsl	x22, x11, 4
	sub	x11, x22, x11
	cntb	x22, all, mul #3
	add	x11, x11, 112
	lsl	x22, x22, 4
	add	x11, sp, x11
	str	z31, [x11]
	rdvl	x11, #23
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	str	z0, [x11]
	addvl	x11, x22, #-1
	cntb	x22, all, mul #3
	add	x11, x11, 112
	lsl	x22, x22, 4
	add	x11, sp, x11
	str	z1, [x11]
	cntb	x11, all, mul #3
	lsl	x11, x11, 4
	add	x11, sp, x11
	add	x11, x11, 112
	str	z2, [x11]
	addvl	x11, x22, #1
	add	x11, x11, 112
	add	x11, sp, x11
	str	z3, [x11]
.L2:
	add	x11, x0, x6
	ld1h	z19.h, p7/z, [x11]
	ld1h	z16.h, p7/z, [x17]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #5
	sub	z29.h, z19.h, z31.h
	add	z19.h, z19.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z19.h
	sub	z30.h, z19.h, z31.h
	str	z30, [x11]
	addvl	x11, sp, #6
	add	z31.h, z19.h, z31.h
	add	x11, x11, 112
	tbl	z30.h, {z31.h}, z5.h
	sub	z31.h, z31.h, z30.h
	str	z31, [x11]
	add	x11, x19, x6
	ld1h	z26.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #7
	sub	z30.h, z26.h, z31.h
	add	z26.h, z26.h, z31.h
	add	x11, x11, 112
	str	z30, [x11]
	rev	z31.h, z26.h
	addvl	x11, sp, #8
	sub	z27.h, z26.h, z31.h
	add	z31.h, z26.h, z31.h
	add	x11, x11, 112
	str	z27, [x11]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x11, sp, #9
	sub	z28.h, z31.h, z30.h
	ld1h	z17.h, p7/z, [x16]
	add	x11, x11, 112
	str	z28, [x11]
	cntb	x22
	add	x11, x30, x6
	ld1h	z23.h, p7/z, [x11]
	lsl	x22, x22, 5
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #10
	sub	z25.h, z23.h, z31.h
	add	z23.h, z23.h, z31.h
	add	x11, x11, 112
	str	z25, [x11]
	rev	z31.h, z23.h
	addvl	x11, sp, #11
	sub	z28.h, z23.h, z31.h
	add	z31.h, z23.h, z31.h
	add	x11, x11, 112
	str	z28, [x11]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x11, sp, #12
	sub	z24.h, z31.h, z30.h
	ptrue	p6.d, all
	add	x11, x11, 112
	str	z24, [x11]
	add	x11, x17, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #13
	sub	z7.h, z16.h, z31.h
	add	z16.h, z16.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z16.h
	sub	z24.h, z16.h, z31.h
	str	z24, [x11]
	addvl	x11, sp, #14
	add	z31.h, z16.h, z31.h
	add	x11, x11, 112
	tbl	z30.h, {z31.h}, z5.h
	sub	z22.h, z31.h, z30.h
	str	z22, [x11]
	add	x11, x2, x6
	ld1h	z25.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #15
	sub	z28.h, z25.h, z31.h
	add	z25.h, z25.h, z31.h
	add	x11, x11, 112
	str	z28, [x11]
	rev	z31.h, z25.h
	addvl	x11, sp, #16
	sub	z22.h, z25.h, z31.h
	add	z31.h, z25.h, z31.h
	add	x11, x11, 112
	str	z22, [x11]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x11, sp, #17
	sub	z21.h, z31.h, z30.h
	ld1h	z24.h, p7/z, [x15]
	add	x11, x11, 112
	str	z21, [x11]
	add	x11, x16, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #18
	sub	z27.h, z17.h, z31.h
	add	z17.h, z17.h, z31.h
	add	x11, x11, 112
	str	z27, [x11]
	rev	z31.h, z17.h
	addvl	x11, sp, #19
	sub	z21.h, z17.h, z31.h
	add	z31.h, z17.h, z31.h
	add	x11, x11, 112
	str	z21, [x11]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x11, sp, #20
	sub	z20.h, z31.h, z30.h
	add	x11, x11, 112
	str	z20, [x11]
	add	x11, x15, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #21
	sub	z18.h, z24.h, z31.h
	add	z24.h, z24.h, z31.h
	add	x11, x11, 112
	str	z18, [x11]
	rev	z31.h, z24.h
	addvl	x11, sp, #22
	sub	z20.h, z24.h, z31.h
	add	z31.h, z24.h, z31.h
	add	x11, x11, 112
	str	z20, [x11]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x11, sp, #23
	sub	z15.h, z31.h, z30.h
	add	x11, x11, 112
	str	z15, [x11]
	ld1h	z20.h, p7/z, [x14]
	add	x11, x14, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #24
	sub	z8.h, z20.h, z31.h
	add	z20.h, z20.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z20.h
	sub	z15.h, z20.h, z31.h
	str	z15, [x11]
	addvl	x11, sp, #25
	add	z31.h, z20.h, z31.h
	add	x11, x11, 112
	tbl	z30.h, {z31.h}, z5.h
	sub	z14.h, z31.h, z30.h
	str	z14, [x11]
	add	x11, x18, x6
	ld1h	z0.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #26
	sub	z30.h, z0.h, z31.h
	add	z0.h, z0.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z0.h
	sub	z14.h, z0.h, z31.h
	str	z14, [x11]
	addvl	x11, sp, #27
	add	z31.h, z0.h, z31.h
	add	x11, x11, 112
	tbl	z28.h, {z31.h}, z5.h
	sub	z13.h, z31.h, z28.h
	str	z13, [x11]
	add	x11, x10, 32
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, sp, #28
	rev	z31.h, z31.h
	ld1h	z1.h, p7/z, [x10]
	add	x11, x11, 112
	sub	z13.h, z1.h, z31.h
	add	z1.h, z1.h, z31.h
	rev	z31.h, z1.h
	sub	z12.h, z1.h, z31.h
	str	z12, [x11]
	addvl	x11, sp, #29
	add	z31.h, z1.h, z31.h
	tbl	z28.h, {z31.h}, z5.h
	add	x11, x11, 112
	sub	z11.h, z31.h, z28.h
	str	z11, [x11]
	add	x11, x13, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #30
	ld1h	z27.h, p7/z, [x13]
	sub	z9.h, z27.h, z31.h
	add	x11, x11, 112
	add	z27.h, z27.h, z31.h
	rev	z31.h, z27.h
	sub	z11.h, z27.h, z31.h
	str	z11, [x11]
	addvl	x11, sp, #31
	add	x11, x11, 112
	add	z31.h, z27.h, z31.h
	tbl	z28.h, {z31.h}, z5.h
	sub	z10.h, z31.h, z28.h
	str	z10, [x11]
	add	x11, x7, 32
	ld1h	z31.h, p7/z, [x11]
	cntb	x11
	rev	z31.h, z31.h
	lsl	x11, x11, 5
	ld1h	z2.h, p7/z, [x7]
	sub	z10.h, z2.h, z31.h
	add	x11, sp, x11
	add	z2.h, z2.h, z31.h
	rev	z31.h, z2.h
	add	x11, x11, 112
	sub	z4.h, z2.h, z31.h
	str	z4, [x11]
	addvl	x11, x22, #1
	add	z31.h, z2.h, z31.h
	tbl	z28.h, {z31.h}, z5.h
	add	x11, x11, 112
	sub	z3.h, z31.h, z28.h
	rdvl	x22, #17
	add	x11, sp, x11
	str	z3, [x11]
	lsl	x22, x22, 1
	add	x11, x12, 32
	ld1h	z28.h, p7/z, [x11]
	rev	z28.h, z28.h
	rdvl	x11, #17
	ld1h	z3.h, p7/z, [x12]
	sub	z31.h, z3.h, z28.h
	lsl	x11, x11, 1
	add	z3.h, z3.h, z28.h
	rev	z28.h, z3.h
	add	x11, sp, x11
	sub	z15.h, z3.h, z28.h
	add	z28.h, z3.h, z28.h
	add	x11, x11, 112
	str	z15, [x11]
	tbl	z22.h, {z28.h}, z5.h
	addvl	x11, x22, #1
	sub	z12.h, z28.h, z22.h
	cntb	x22, all, mul #9
	add	x11, x11, 112
	lsl	x22, x22, 2
	ld1h	z18.h, p7/z, [x5]
	add	x11, sp, x11
	str	z12, [x11]
	add	x11, x5, 32
	ld1h	z28.h, p7/z, [x11]
	rev	z28.h, z28.h
	cntb	x11, all, mul #9
	sub	z14.h, z18.h, z28.h
	add	z18.h, z18.h, z28.h
	lsl	x11, x11, 2
	rev	z28.h, z18.h
	sub	z12.h, z18.h, z28.h
	add	x11, sp, x11
	add	z28.h, z18.h, z28.h
	tbl	z22.h, {z28.h}, z5.h
	add	x11, x11, 112
	str	z12, [x11]
	sub	z4.h, z28.h, z22.h
	addvl	x11, x22, #1
	cntb	x22, all, mul #5
	ld1h	z28.h, p7/z, [x9]
	add	x11, x11, 112
	lsl	x22, x22, 3
	add	x11, sp, x11
	str	z4, [x11]
	add	x11, x9, 32
	ld1h	z22.h, p7/z, [x11]
	rev	z22.h, z22.h
	rdvl	x11, #19
	sub	z11.h, z28.h, z22.h
	add	z28.h, z28.h, z22.h
	lsl	x11, x11, 1
	rev	z22.h, z28.h
	sub	z4.h, z28.h, z22.h
	add	x11, sp, x11
	add	z22.h, z28.h, z22.h
	tbl	z21.h, {z22.h}, z5.h
	add	x11, x11, 112
	str	z4, [x11]
	sub	z15.h, z22.h, z21.h
	addvl	x11, x22, #-1
	cntb	x22, all, mul #5
	add	x11, x11, 112
	lsl	x22, x22, 3
	add	x11, sp, x11
	str	z15, [x11]
	ld1h	z21.h, p7/z, [x8]
	add	x11, x8, 32
	ld1h	z22.h, p7/z, [x11]
	rev	z22.h, z22.h
	cntb	x11, all, mul #5
	sub	z12.h, z21.h, z22.h
	add	z21.h, z21.h, z22.h
	lsl	x11, x11, 3
	rev	z22.h, z21.h
	sub	z15.h, z21.h, z22.h
	add	x11, sp, x11
	add	z22.h, z21.h, z22.h
	add	x11, x11, 112
	str	z15, [x11]
	tbl	z15.h, {z22.h}, z5.h
	addvl	x11, x22, #1
	sub	z4.h, z22.h, z15.h
	zip1	z22.d, z19.d, z23.d
	add	x11, x11, 112
	zip2	z19.d, z19.d, z23.d
	zip1	z23.d, z26.d, z16.d
	add	x11, sp, x11
	zip1	z15.d, z22.d, z23.d
	zip2	z26.d, z26.d, z16.d
	zip2	z22.d, z22.d, z23.d
	zip1	z23.d, z19.d, z26.d
	str	z4, [x11]
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	zip2	z19.d, z19.d, z26.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	saddlb	z16.s, z15.h, z19.h
	saddlt	z19.s, z15.h, z19.h
	saddlb	z15.s, z22.h, z23.h
	saddlt	z22.s, z22.h, z23.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z15.d, p6/m, z15.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z16.s, z19.s
	zip2	z16.s, z16.s, z19.s
	zip1	z23.s, z22.s, z15.s
	zip2	z22.s, z22.s, z15.s
	add	z26.s, z26.s, z23.s
	add	z22.s, z16.s, z22.s
	uzp2	z16.d, z26.d, z22.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z16.d, p6/m, z16.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z26.d, z26.d, z22.d
	ld1w	z22.s, p7/z, [x21]
	add	z19.s, z16.s, z26.s
	sub	z23.s, z26.s, z16.s
	movprfx	z15, z19
	mul	z15.s, p7/m, z15.s, z22.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z15.s, p5/m, z15.s, z15.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z16, [x11]
	mul	z16.s, p7/m, z16.s, z23.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z16.s, p5/m, z16.s, z16.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z26, [x11]
	mul	z19.s, p7/m, z19.s, z26.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #2
	add	x11, x11, 112
	ldr	z4, [x11]
	mul	z23.s, p7/m, z23.s, z4.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	zip1	z26.d, z25.d, z24.d
	zip2	z25.d, z25.d, z24.d
	zip1	z24.d, z17.d, z20.d
	zip2	z17.d, z17.d, z20.d
	zip1	z20.d, z26.d, z24.d
	zip2	z26.d, z26.d, z24.d
	zip1	z24.d, z25.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z25.d, z25.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	saddlb	z17.s, z20.h, z25.h
	saddlb	z4.s, z26.h, z24.h
	saddlt	z20.s, z20.h, z25.h
	saddlt	z26.s, z26.h, z24.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z4.d, p6/m, z4.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	zip1	z25.s, z17.s, z20.s
	zip2	z17.s, z17.s, z20.s
	zip1	z24.s, z26.s, z4.s
	zip2	z26.s, z26.s, z4.s
	add	z25.s, z25.s, z24.s
	add	z26.s, z17.s, z26.s
	uzp2	z17.d, z25.d, z26.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	uzp1	z25.d, z25.d, z26.d
	add	z20.s, z17.s, z25.s
	sub	z24.s, z25.s, z17.s
	movprfx	z4, z20
	mul	z4.s, p7/m, z4.s, z22.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z4.s, p5/m, z4.s, z4.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z17, [x11]
	mul	z17.s, p7/m, z17.s, z24.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z17.s, p5/m, z17.s, z17.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z26, [x11]
	mul	z20.s, p7/m, z20.s, z26.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #2
	add	x11, x11, 112
	ldr	z25, [x11]
	mul	z24.s, p7/m, z24.s, z25.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	zip1	z26.d, z0.d, z27.d
	zip1	z25.d, z1.d, z2.d
	zip2	z27.d, z0.d, z27.d
	zip2	z2.d, z1.d, z2.d
	zip1	z1.d, z26.d, z25.d
	zip2	z25.d, z26.d, z25.d
	zip1	z26.d, z27.d, z2.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z2.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	saddlb	z2.s, z1.h, z27.h
	saddlt	z27.s, z1.h, z27.h
	saddlb	z1.s, z25.h, z26.h
	saddlt	z25.s, z25.h, z26.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z1.d, p6/m, z1.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z2.s, z27.s
	zip1	z0.s, z25.s, z1.s
	zip2	z2.s, z2.s, z27.s
	add	z26.s, z26.s, z0.s
	zip2	z25.s, z25.s, z1.s
	add	z25.s, z2.s, z25.s
	uzp2	z27.d, z26.d, z25.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	uzp1	z26.d, z26.d, z25.d
	add	z2.s, z27.s, z26.s
	sub	z26.s, z26.s, z27.s
	movprfx	z0, z2
	mul	z0.s, p7/m, z0.s, z22.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z0.s, p5/m, z0.s, z0.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z1, [x11]
	mul	z1.s, p7/m, z1.s, z26.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z1.s, p5/m, z1.s, z1.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z27, [x11]
	mul	z2.s, p7/m, z2.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z2.s, p5/m, z2.s, z2.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #2
	add	x11, x11, 112
	ldr	z25, [x11]
	mul	z26.s, p7/m, z26.s, z25.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z26.s, p5/m, z26.s, z26.s
// 0 "" 2
#NO_APP
	zip1	z27.d, z3.d, z28.d
	zip1	z25.d, z18.d, z21.d
	zip2	z28.d, z3.d, z28.d
	zip2	z21.d, z18.d, z21.d
	zip1	z18.d, z27.d, z25.d
	zip2	z25.d, z27.d, z25.d
	zip1	z27.d, z28.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z21.s, z18.h, z28.h
	saddlt	z28.s, z18.h, z28.h
	saddlb	z18.s, z25.h, z27.h
	saddlt	z25.s, z25.h, z27.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z18.d, p6/m, z18.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	zip1	z27.s, z21.s, z28.s
	zip2	z21.s, z21.s, z28.s
	zip1	z3.s, z25.s, z18.s
	zip2	z25.s, z25.s, z18.s
	add	z27.s, z27.s, z3.s
	add	z25.s, z21.s, z25.s
	uzp2	z21.d, z27.d, z25.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	uzp1	z27.d, z27.d, z25.d
	add	z28.s, z21.s, z27.s
	sub	z27.s, z27.s, z21.s
	mul	z22.s, p7/m, z22.s, z28.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z22.s, p5/m, z22.s, z22.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z25, [x11]
	mul	z25.s, p7/m, z25.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z21, [x11]
	mul	z28.s, p7/m, z28.s, z21.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #2
	add	x11, x11, 112
	ldr	z21, [x11]
	mul	z27.s, p7/m, z27.s, z21.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #3
	uzp1	z3.s, z15.s, z15.s
	rdvl	x22, #21
	add	x11, x11, 112
	str	z3, [x11]
	uzp1	z3.s, z4.s, z4.s
	addvl	x11, sp, #4
	lsl	x22, x22, 1
	add	x11, x11, 112
	str	z3, [x11]
	add	x17, x17, x4
	addvl	x11, sp, #3
	add	x16, x16, x4
	add	x11, x11, 112
	ldr	z3, [x11]
	ldr	z4, [x11, #1, mul vl]
	tbl	z21.s, {z3.s - z4.s}, z6.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	uzp1	z4.s, z22.s, z22.s
	addvl	x11, sp, #10
	uzp1	z22.s, z17.s, z17.s
	uzp1	z3.s, z0.s, z0.s
	tbl	z3.s, {z3.s - z4.s}, z6.s
	rshrnb	z3.h, z3.s, #4
	uzp1	z3.h, z3.h, z3.h
	stp	q21, q3, [x1]
	uzp1	z21.s, z16.s, z16.s
	tbl	z21.s, {z21.s - z22.s}, z6.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	uzp1	z17.s, z25.s, z25.s
	add	x11, x11, 112
	uzp1	z25.s, z27.s, z27.s
	uzp1	z16.s, z1.s, z1.s
	tbl	z16.s, {z16.s - z17.s}, z6.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	stp	q21, q16, [x1, 512]
	uzp1	z21.s, z28.s, z28.s
	uzp1	z17.s, z20.s, z20.s
	uzp1	z20.s, z2.s, z2.s
	tbl	z20.s, {z20.s - z21.s}, z6.s
	uzp1	z21.s, z24.s, z24.s
	uzp1	z24.s, z26.s, z26.s
	tbl	z24.s, {z24.s - z25.s}, z6.s
	ldr	z25, [x11]
	addvl	x11, sp, #7
	rshrnb	z24.h, z24.s, #4
	add	x11, x11, 112
	ldr	z26, [x11]
	uzp1	z24.h, z24.h, z24.h
	addvl	x11, sp, #15
	zip1	z27.d, z26.d, z7.d
	trn2	z28.d, z26.d, z7.d
	add	x11, x11, 112
	str	q24, [x1, 1552]
	zip1	z24.d, z29.d, z25.d
	zip1	z24.d, z24.d, z27.d
	trn1	z27.d, z26.d, z7.d
	ldr	z26, [x11]
	addvl	x11, sp, #21
	rshrnb	z20.h, z20.s, #4
	uzp1	z20.h, z20.h, z20.h
	add	x11, x11, 112
	ldr	z18, [x11]
	str	q20, [x1, 1040]
	addvl	x11, sp, #18
	uzp1	z20.s, z23.s, z23.s
	tbl	z20.s, {z20.s - z21.s}, z6.s
	add	x11, x11, 112
	trn2	z21.d, z29.d, z25.d
	trn1	z29.d, z29.d, z25.d
	ldr	z25, [x11]
	addvl	x11, x22, #1
	zip1	z23.d, z21.d, z28.d
	add	x11, x11, 112
	zip2	z21.d, z21.d, z28.d
	trn2	z28.d, z25.d, z8.d
	zip2	z29.d, z29.d, z27.d
	trn2	z22.d, z26.d, z18.d
	zip1	z27.d, z25.d, z8.d
	add	x11, sp, x11
	uzp1	z16.s, z19.s, z19.s
	rshrnb	z20.h, z20.s, #4
	zip1	z19.d, z22.d, z28.d
	tbl	z16.s, {z16.s - z17.s}, z6.s
	zip2	z22.d, z22.d, z28.d
	uzp1	z20.h, z20.h, z20.h
	trn2	z28.d, z13.d, z10.d
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	str	q16, [x1, 1024]
	zip1	z17.d, z30.d, z9.d
	zip1	z16.d, z14.d, z12.d
	cntb	x22, all, mul #3
	str	q20, [x1, 1536]
	zip1	z20.d, z26.d, z18.d
	zip1	z20.d, z20.d, z27.d
	trn1	z27.d, z26.d, z18.d
	trn1	z26.d, z25.d, z8.d
	trn2	z25.d, z30.d, z9.d
	zip1	z15.d, z25.d, z28.d
	zip2	z25.d, z25.d, z28.d
	trn2	z28.d, z14.d, z12.d
	trn1	z14.d, z14.d, z12.d
	ldr	z12, [x11]
	rdvl	x11, #21
	lsl	x11, x11, 1
	trn1	z30.d, z30.d, z9.d
	lsl	x22, x22, 4
	add	x11, sp, x11
	zip2	z27.d, z27.d, z26.d
	zip1	z26.d, z13.d, z10.d
	add	x11, x11, 112
	ldr	z9, [x11]
	trn1	z13.d, z13.d, z10.d
	rdvl	x11, #23
	zip1	z17.d, z17.d, z26.d
	zip2	z30.d, z30.d, z13.d
	lsl	x11, x11, 1
	trn2	z26.d, z31.d, z11.d
	zip1	z18.d, z31.d, z11.d
	add	x11, sp, x11
	zip1	z18.d, z18.d, z16.d
	trn1	z31.d, z31.d, z11.d
	add	x11, x11, 112
	ldr	z8, [x11]
	zip1	z16.d, z26.d, z28.d
	addvl	x11, x22, #-1
	cntb	x22, all, mul #3
	zip2	z31.d, z31.d, z14.d
	add	x11, x11, 112
	lsl	x22, x22, 4
	zip2	z26.d, z26.d, z28.d
	add	x11, sp, x11
	ldr	z7, [x11]
	movi	d28, #0
	add	x11, x1, 64
	movprfx	z14, z28
	sdot	z14.d, z23.h, z12.h
	movprfx	z11, z28
	sdot	z11.d, z19.h, z12.h
	sdot	z14.d, z24.h, z9.h
	sdot	z11.d, z20.h, z9.h
	sdot	z14.d, z29.h, z8.h
	sdot	z11.d, z27.h, z8.h
	sdot	z14.d, z21.h, z7.h
	sdot	z11.d, z22.h, z7.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z12.h
	mov	z10.d, z12.d
	sdot	z13.d, z17.h, z9.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z10.h
	sdot	z13.d, z30.h, z8.h
	sdot	z12.d, z18.h, z9.h
	sdot	z13.d, z25.h, z7.h
	sdot	z12.d, z31.h, z8.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z7.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	addvl	x11, x22, #1
	add	x15, x15, x4
	add	x11, x11, 112
	add	x14, x14, x4
	add	x11, sp, x11
	ldr	z12, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z12.h
	cntb	x11, all, mul #3
	movprfx	z11, z28
	sdot	z11.d, z19.h, z12.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z12.h
	lsl	x11, x11, 4
	mov	z10.d, z12.d
	movprfx	z12, z28
	sdot	z12.d, z16.h, z10.h
	add	x11, sp, x11
	add	x10, x10, x4
	add	x11, x11, 112
	ldr	z9, [x11]
	sdot	z14.d, z24.h, z9.h
	cntb	x11, all, mul #11
	sdot	z11.d, z20.h, z9.h
	sdot	z13.d, z17.h, z9.h
	lsl	x11, x11, 2
	sdot	z12.d, z18.h, z9.h
	add	x13, x13, x4
	add	x11, sp, x11
	add	x7, x7, x4
	add	x11, x11, 112
	ldr	z8, [x11]
	sdot	z14.d, z29.h, z8.h
	cntb	x11, all, mul #3
	sdot	z11.d, z27.h, z8.h
	sdot	z13.d, z30.h, z8.h
	lsl	x22, x11, 4
	sdot	z12.d, z31.h, z8.h
	add	x12, x12, x4
	sub	x11, x22, x11
	cntb	x22
	add	x11, x11, 112
	lsl	x22, x22, 5
	add	x11, sp, x11
	ldr	z7, [x11]
	sdot	z11.d, z22.h, z7.h
	add	x11, x1, 192
	sdot	z12.d, z26.h, z7.h
	sdot	z14.d, z21.h, z7.h
	sdot	z13.d, z25.h, z7.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 448
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 480
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 512
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 544
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 320
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 576
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 608
	ld1h	z7.h, p7/z, [x11]
	add	x11, x3, 640
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 672
	ld1h	z10.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x1, 448
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z27.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z31.h, z9.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z26.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 704
	ld1h	z8.h, p7/z, [x11]
	add	x5, x5, x4
	add	x11, x3, 736
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 768
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 800
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 576
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 832
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 864
	ld1h	z7.h, p7/z, [x11]
	add	x11, x3, 896
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 928
	ld1h	z10.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x1, 704
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z27.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z31.h, z9.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z26.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 960
	ld1h	z8.h, p7/z, [x11]
	add	x9, x9, x4
	add	x11, x3, 992
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1024
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 1056
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 832
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1088
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 1120
	ld1h	z7.h, p7/z, [x11]
	add	x11, x3, 1152
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1184
	ld1h	z10.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x1, 960
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z27.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z31.h, z9.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z26.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1216
	ld1h	z8.h, p7/z, [x11]
	add	x8, x8, x4
	add	x11, x3, 1248
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1280
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 1312
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 1088
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1344
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 1376
	ld1h	z7.h, p7/z, [x11]
	add	x11, x3, 1408
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1440
	ld1h	z10.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x1, 1216
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z27.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z31.h, z9.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z26.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1472
	ld1h	z8.h, p7/z, [x11]
	add	x6, x6, x4
	add	x11, x3, 1504
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1536
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 1568
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 1344
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1600
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 1632
	ld1h	z7.h, p7/z, [x11]
	add	x11, x3, 1664
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1696
	ld1h	z10.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x1, 1472
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z27.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z31.h, z9.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z26.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1728
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 1760
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1792
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 1824
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 1600
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1856
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 1888
	ld1h	z7.h, p7/z, [x11]
	add	x11, x3, 1920
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 1952
	ld1h	z10.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x1, 1728
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z27.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z31.h, z9.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z26.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 1984
	ld1h	z8.h, p7/z, [x11]
	add	x11, x3, 2016
	ld1h	z7.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z7.h
	add	x11, x3, 2048
	ld1h	z9.h, p7/z, [x11]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z7.h
	add	x11, x3, 2080
	ld1h	z10.h, p7/z, [x11]
	sdot	z14.d, z24.h, z8.h
	add	x11, x1, 1856
	sdot	z14.d, z29.h, z9.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z27.h, z9.h
	movprfx	z13, z28
	sdot	z13.d, z15.h, z7.h
	sdot	z11.d, z22.h, z10.h
	sdot	z13.d, z17.h, z8.h
	movprfx	z12, z28
	sdot	z12.d, z16.h, z7.h
	sdot	z13.d, z30.h, z9.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z25.h, z10.h
	sdot	z12.d, z31.h, z9.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z10.h
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 2112
	ld1h	z11.h, p7/z, [x11]
	add	x11, x3, 2144
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 2176
	ld1h	z12.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z10.h
	add	x11, x3, 2208
	ld1h	z13.h, p7/z, [x11]
	sdot	z14.d, z24.h, z11.h
	add	x11, x1, 1984
	sdot	z14.d, z29.h, z12.h
	movprfx	z29, z28
	sdot	z29.d, z19.h, z10.h
	sdot	z14.d, z21.h, z13.h
	sdot	z29.d, z20.h, z11.h
	sdot	z29.d, z27.h, z12.h
	movprfx	z27, z28
	sdot	z27.d, z15.h, z10.h
	sdot	z29.d, z22.h, z13.h
	sdot	z27.d, z17.h, z11.h
	uzp1	z14.s, z14.s, z29.s
	sdot	z27.d, z30.h, z12.h
	rshrnb	z14.h, z14.s, #4
	sdot	z27.d, z25.h, z13.h
	movprfx	z30, z28
	sdot	z30.d, z16.h, z10.h
	sdot	z30.d, z18.h, z11.h
	sdot	z30.d, z31.h, z12.h
	sdot	z30.d, z26.h, z13.h
	uzp1	z27.s, z27.s, z30.s
	rshrnb	z27.h, z27.s, #4
	uzp1	z14.h, z14.h, z27.h
	st1h	z14.h, p7, [x11]
	addvl	x11, sp, #5
	add	x11, x11, 112
	ldr	z29, [x11]
	addvl	x11, sp, #11
	add	x11, x11, 112
	ldr	z26, [x11]
	zip1	z31.d, z29.d, z26.d
	addvl	x11, sp, #8
	trn2	z29.d, z29.d, z26.d
	add	x11, x11, 112
	ldr	z27, [x11]
	addvl	x11, sp, #13
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z30.d, z27.d, z18.d
	zip1	z31.d, z31.d, z30.d
	mov	z30.d, z27.d
	ldr	z27, [x11]
	addvl	x11, sp, #16
	trn2	z30.d, z30.d, z27.d
	zip1	z30.d, z29.d, z30.d
	add	x11, x11, 112
	ldr	z26, [x11]
	addvl	x11, sp, #22
	add	x11, x11, 112
	ldr	z24, [x11]
	zip1	z29.d, z26.d, z24.d
	addvl	x11, sp, #19
	trn2	z26.d, z26.d, z24.d
	add	x11, x11, 112
	ldr	z25, [x11]
	addvl	x11, sp, #24
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z27.d, z25.d, z18.d
	zip1	z29.d, z29.d, z27.d
	mov	z27.d, z25.d
	ldr	z25, [x11]
	addvl	x11, sp, #26
	trn2	z27.d, z27.d, z25.d
	zip1	z26.d, z26.d, z27.d
	add	x11, x11, 112
	ldr	z24, [x11]
	addvl	x11, sp, #30
	add	x11, x11, 112
	ldr	z22, [x11]
	zip1	z25.d, z24.d, z22.d
	addvl	x11, sp, #28
	trn2	z24.d, z24.d, z22.d
	add	x11, x11, 112
	ldr	z23, [x11]
	cntb	x11
	lsl	x11, x11, 5
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z27.d, z23.d, z18.d
	zip1	z25.d, z25.d, z27.d
	mov	z27.d, z23.d
	ldr	z23, [x11]
	rdvl	x11, #17
	trn2	z27.d, z27.d, z23.d
	zip1	z24.d, z24.d, z27.d
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z22, [x11]
	rdvl	x11, #19
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z20, [x11]
	zip1	z23.d, z22.d, z20.d
	cntb	x11, all, mul #9
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z21, [x11]
	cntb	x11, all, mul #5
	lsl	x11, x11, 3
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z19, [x11]
	zip1	z27.d, z21.d, z19.d
	add	x11, x3, 2240
	zip1	z23.d, z23.d, z27.d
	trn2	z27.d, z22.d, z20.d
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2272
	trn2	z22.d, z21.d, z19.d
	ld1h	z19.h, p7/z, [x11]
	add	x11, x1, 128
	zip1	z27.d, z27.d, z22.d
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	sdot	z17.d, z29.h, z20.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z31.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2304
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2336
	ld1h	z19.h, p7/z, [x11]
	add	x11, x1, 384
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z29.h, z20.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z31.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2368
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2400
	ld1h	z19.h, p7/z, [x11]
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	add	x11, x1, 640
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z29.h, z20.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z31.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2432
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2464
	ld1h	z19.h, p7/z, [x11]
	add	x11, x1, 896
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z29.h, z20.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z31.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2496
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2528
	ld1h	z19.h, p7/z, [x11]
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	add	x11, x1, 1152
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z29.h, z20.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z31.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2560
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2592
	ld1h	z19.h, p7/z, [x11]
	add	x11, x1, 1408
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z29.h, z20.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z31.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2624
	ld1h	z20.h, p7/z, [x11]
	add	x11, x3, 2656
	ld1h	z19.h, p7/z, [x11]
	movprfx	z22, z28
	sdot	z22.d, z30.h, z19.h
	add	x11, x1, 1664
	sdot	z22.d, z31.h, z20.h
	movprfx	z17, z28
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z28
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z29.h, z20.h
	sdot	z21.d, z25.h, z20.h
	movprfx	z18, z28
	sdot	z18.d, z27.h, z19.h
	uzp1	z22.s, z22.s, z17.s
	sdot	z18.d, z23.h, z20.h
	rshrnb	z22.h, z22.s, #4
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 2688
	ld1h	z21.h, p7/z, [x11]
	add	x11, x3, 2720
	ld1h	z20.h, p7/z, [x11]
	add	x11, x1, 1920
	movprfx	z22, z28
	sdot	z22.d, z30.h, z20.h
	movprfx	z30, z28
	sdot	z30.d, z24.h, z20.h
	sdot	z22.d, z31.h, z21.h
	sdot	z30.d, z25.h, z21.h
	movprfx	z31, z28
	sdot	z31.d, z26.h, z20.h
	sdot	z31.d, z29.h, z21.h
	movprfx	z29, z28
	sdot	z29.d, z27.h, z20.h
	uzp1	z22.s, z22.s, z31.s
	sdot	z29.d, z23.h, z21.h
	rshrnb	z22.h, z22.s, #4
	uzp1	z30.s, z30.s, z29.s
	rshrnb	z30.h, z30.s, #4
	uzp1	z22.h, z22.h, z30.h
	st1h	z22.h, p7, [x11]
	addvl	x11, sp, #6
	add	x11, x11, 112
	ldr	z31, [x11]
	addvl	x11, sp, #12
	add	x11, x11, 112
	ldr	z30, [x11]
	zip1	z27.d, z31.d, z30.d
	addvl	x11, sp, #9
	add	x11, x11, 112
	ldr	z31, [x11]
	addvl	x11, sp, #14
	add	x11, x11, 112
	ldr	z30, [x11]
	zip1	z31.d, z31.d, z30.d
	addvl	x11, sp, #17
	zip1	z27.d, z27.d, z31.d
	add	x11, x11, 112
	ldr	z31, [x11]
	addvl	x11, sp, #23
	add	x11, x11, 112
	ldr	z30, [x11]
	zip1	z29.d, z31.d, z30.d
	addvl	x11, sp, #20
	add	x11, x11, 112
	ldr	z31, [x11]
	addvl	x11, sp, #25
	add	x11, x11, 112
	ldr	z30, [x11]
	zip1	z31.d, z31.d, z30.d
	addvl	x11, sp, #27
	zip1	z29.d, z29.d, z31.d
	add	x11, x11, 112
	ldr	z31, [x11]
	addvl	x11, sp, #31
	add	x11, x11, 112
	ldr	z30, [x11]
	zip1	z30.d, z31.d, z30.d
	addvl	x11, sp, #29
	add	x11, x11, 112
	ldr	z31, [x11]
	addvl	x11, x22, #1
	rdvl	x22, #17
	add	x11, x11, 112
	lsl	x22, x22, 1
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z31.d, z31.d, z26.d
	addvl	x11, x22, #1
	cntb	x22, all, mul #5
	zip1	z30.d, z30.d, z31.d
	add	x11, x11, 112
	lsl	x22, x22, 3
	add	x11, sp, x11
	ldr	z31, [x11]
	addvl	x11, x22, #-1
	cntb	x22, all, mul #9
	add	x11, x11, 112
	lsl	x22, x22, 2
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z31.d, z31.d, z26.d
	addvl	x11, x22, #1
	cntb	x22, all, mul #5
	add	x11, x11, 112
	lsl	x22, x22, 3
	add	x11, sp, x11
	ldr	z26, [x11]
	addvl	x11, x22, #1
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z25, [x11]
	zip1	z26.d, z26.d, z25.d
	add	x11, x3, 2752
	ld1h	z24.h, p7/z, [x11]
	zip1	z31.d, z31.d, z26.d
	add	x11, x1, 256
	movprfx	z22, z28
	sdot	z22.d, z29.h, z24.h
	movprfx	z23, z28
	sdot	z23.d, z31.h, z24.h
	movprfx	z26, z28
	sdot	z26.d, z27.h, z24.h
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	uzp1	z26.s, z26.s, z22.s
	uzp1	z25.s, z25.s, z23.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x3, 2784
	ld1h	z24.h, p7/z, [x11]
	add	x11, x1, 768
	movprfx	z22, z28
	sdot	z22.d, z29.h, z24.h
	movprfx	z23, z28
	sdot	z23.d, z31.h, z24.h
	movprfx	z26, z28
	sdot	z26.d, z27.h, z24.h
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	uzp1	z26.s, z26.s, z22.s
	uzp1	z25.s, z25.s, z23.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x3, 2816
	ld1h	z24.h, p7/z, [x11]
	movprfx	z26, z28
	sdot	z26.d, z27.h, z24.h
	add	x11, x1, 1280
	movprfx	z22, z28
	sdot	z22.d, z29.h, z24.h
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	movprfx	z23, z28
	sdot	z23.d, z31.h, z24.h
	uzp1	z26.s, z26.s, z22.s
	uzp1	z25.s, z25.s, z23.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x3, 2848
	ld1h	z25.h, p7/z, [x11]
	add	x11, x1, 1792
	add	x1, x1, 32
	movprfx	z26, z28
	sdot	z26.d, z27.h, z25.h
	movprfx	z27, z28
	sdot	z27.d, z29.h, z25.h
	movprfx	z29, z28
	sdot	z29.d, z30.h, z25.h
	sdot	z28.d, z31.h, z25.h
	uzp1	z31.s, z26.s, z27.s
	uzp1	z30.s, z29.s, z28.s
	rshrnb	z31.h, z31.s, #4
	rshrnb	z30.h, z30.s, #4
	uzp1	z31.h, z31.h, z30.h
	st1h	z31.h, p7, [x11]
	cmp	x20, x1
	bne	.L2
	rdvl	x12, #25
	lsl	x12, x12, 1
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 48]
	ldp	d10, d11, [sp, 64]
	ldp	d12, d13, [sp, 80]
	ldp	d14, d15, [sp, 96]
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	add	sp, sp, x12
	.cfi_def_cfa_offset 112
	add	sp, sp, 112
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL9op_pass_4PKsPsl, .-_ZL9op_pass_4PKsPsl
	.align	2
	.p2align 5,,15
	.type	_ZL10op_pass_11PKsPsl.constprop.0, %function
_ZL10op_pass_11PKsPsl.constprop.0:
.LFB12:
	.cfi_startproc
	cntb	x12
	adrp	x2, .LANCHOR0
	ptrue	p7.b, all
	add	x2, x2, :lo12:.LANCHOR0
	lsl	x12, x12, 6
	ld1w	z5.s, p7/z, [x2]
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0,0x2,0x1e,0x22
	add	x3, x2, 32
	ld1h	z6.h, p7/z, [x3]
	cntb	x6, all, mul #13
	sub	sp, sp, #64
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0,0x2,0x1e,0x23,0x40,0x22
	add	x3, x2, 96
	lsl	x6, x6, 2
	ld1w	z31.s, p7/z, [x3]
	addvl	x3, x6, #1
	cntb	x6, all, mul #7
	add	x3, x3, 64
	stp	d8, d9, [sp]
	add	x3, sp, x3
	stp	d10, d11, [sp, 16]
	lsl	x6, x6, 3
	add	x5, x0, 2048
	stp	d12, d13, [sp, 32]
	add	x4, x2, 64
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	str	z31, [x3]
	add	x3, x2, 128
	ld1w	z31.s, p7/z, [x3]
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 160
	ld1w	z31.s, p7/z, [x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 192
	ld1h	z31.h, p7/z, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 224
	ld1h	z0.h, p7/z, [x3]
	add	x3, x2, 256
	ld1h	z1.h, p7/z, [x3]
	add	x3, x2, 288
	ld1h	z2.h, p7/z, [x3]
	add	x3, x2, 320
	ld1h	z3.h, p7/z, [x3]
	add	x3, x2, 352
	ld1h	z4.h, p7/z, [x3]
	add	x3, x2, 384
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x6, #1
	cntb	x6, all, mul #15
	add	x3, x3, 64
	lsl	x6, x6, 2
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 416
	ld1h	z31.h, p7/z, [x3]
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	mov	z31.d, z6.d
	addvl	x3, x6, #-1
	cntb	x6, all, mul #15
	mov	z6.d, z5.d
	add	x3, x3, 64
	lsl	x6, x6, 2
	mov	z5.d, z31.d
	add	x3, sp, x3
	str	z0, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z1, [x3]
	addvl	x3, x6, #1
	cntb	x6
	add	x3, x3, 64
	lsl	x6, x6, 6
	add	x3, sp, x3
	str	z2, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z3, [x3]
	addvl	x3, x6, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z4, [x3]
.L7:
	add	x3, x0, 32
	ld1h	z23.h, p7/z, [x3]
	ld1h	z28.h, p7/z, [x0]
	addvl	x3, sp, #5
	rev	z31.h, z23.h
	sub	z29.h, z28.h, z31.h
	add	x3, x3, 64
	str	z29, [x3]
	add	z31.h, z28.h, z31.h
	addvl	x3, sp, #6
	rev	z30.h, z31.h
	sub	z27.h, z31.h, z30.h
	add	x3, x3, 64
	str	z27, [x3]
	add	z31.h, z31.h, z30.h
	addvl	x3, sp, #7
	tbl	z30.h, {z31.h}, z5.h
	sub	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z31, [x3]
	cntb	x6
	add	x3, x0, 64
	ld1h	z14.h, p7/z, [x3]
	lsl	x6, x6, 5
	add	x3, x0, 96
	ld1h	z15.h, p7/z, [x3]
	rev	z31.h, z15.h
	add	x3, sp, 64
	str	z15, [x3]
	sub	z30.h, z14.h, z31.h
	addvl	x3, sp, #8
	add	z31.h, z14.h, z31.h
	ptrue	p6.d, all
	add	x3, x3, 64
	str	z30, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #9
	sub	z26.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z26, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #10
	sub	z25.h, z31.h, z30.h
	add	x3, x3, 64
	str	z25, [x3]
	add	x3, x0, 128
	ld1h	z0.h, p7/z, [x3]
	add	x3, x0, 160
	ld1h	z2.h, p7/z, [x3]
	rev	z31.h, z2.h
	addvl	x3, sp, #11
	sub	z27.h, z0.h, z31.h
	add	z31.h, z0.h, z31.h
	add	x3, x3, 64
	str	z27, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #12
	sub	z25.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z25, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #13
	sub	z24.h, z31.h, z30.h
	add	x3, x3, 64
	str	z24, [x3]
	add	x3, x0, 192
	ld1h	z7.h, p7/z, [x3]
	add	x3, x0, 224
	ld1h	z1.h, p7/z, [x3]
	rev	z31.h, z1.h
	addvl	x3, sp, #14
	sub	z26.h, z7.h, z31.h
	add	z31.h, z7.h, z31.h
	add	x3, x3, 64
	str	z26, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #15
	sub	z24.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z24, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #16
	sub	z22.h, z31.h, z30.h
	add	x3, x3, 64
	str	z22, [x3]
	add	x3, x0, 256
	ld1h	z8.h, p7/z, [x3]
	add	x3, x0, 288
	ld1h	z3.h, p7/z, [x3]
	rev	z31.h, z3.h
	addvl	x3, sp, #17
	sub	z25.h, z8.h, z31.h
	add	z31.h, z8.h, z31.h
	add	x3, x3, 64
	str	z25, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #18
	sub	z22.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z22, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #19
	sub	z21.h, z31.h, z30.h
	add	x3, x3, 64
	str	z21, [x3]
	add	x3, x0, 320
	ld1h	z9.h, p7/z, [x3]
	add	x3, x0, 352
	ld1h	z4.h, p7/z, [x3]
	rev	z31.h, z4.h
	addvl	x3, sp, #20
	sub	z24.h, z9.h, z31.h
	add	z31.h, z9.h, z31.h
	add	x3, x3, 64
	str	z24, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #21
	sub	z21.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z21, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #22
	sub	z20.h, z31.h, z30.h
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 384
	ld1h	z29.h, p7/z, [x3]
	add	x3, x0, 416
	ld1h	z24.h, p7/z, [x3]
	rev	z31.h, z24.h
	addvl	x3, sp, #23
	sub	z22.h, z29.h, z31.h
	add	z31.h, z29.h, z31.h
	add	x3, x3, 64
	str	z22, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #24
	sub	z20.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z20, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #25
	sub	z19.h, z31.h, z30.h
	add	x3, x3, 64
	str	z19, [x3]
	add	x3, x0, 448
	ld1h	z20.h, p7/z, [x3]
	add	x3, x0, 480
	ld1h	z16.h, p7/z, [x3]
	rev	z31.h, z16.h
	addvl	x3, sp, #26
	sub	z21.h, z20.h, z31.h
	add	z31.h, z20.h, z31.h
	add	x3, x3, 64
	str	z21, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #27
	sub	z19.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z19, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #28
	sub	z18.h, z31.h, z30.h
	add	x3, x3, 64
	str	z18, [x3]
	add	x3, x0, 512
	ld1h	z10.h, p7/z, [x3]
	add	x3, x0, 544
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z31, [x3]
	rev	z31.h, z31.h
	addvl	x3, sp, #29
	sub	z19.h, z10.h, z31.h
	add	z31.h, z10.h, z31.h
	add	x3, x3, 64
	str	z19, [x3]
	rev	z30.h, z31.h
	addvl	x3, sp, #30
	sub	z18.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	str	z18, [x3]
	tbl	z30.h, {z31.h}, z5.h
	addvl	x3, sp, #31
	sub	z17.h, z31.h, z30.h
	add	x3, x3, 64
	str	z17, [x3]
	add	x3, x0, 576
	ld1h	z11.h, p7/z, [x3]
	add	x3, x0, 608
	ld1h	z18.h, p7/z, [x3]
	rev	z31.h, z18.h
	addvl	x3, sp, #2
	sub	z17.h, z11.h, z31.h
	add	z31.h, z11.h, z31.h
	add	x3, x3, 64
	str	z18, [x3]
	rev	z30.h, z31.h
	cntb	x3
	sub	z13.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	lsl	x3, x3, 5
	tbl	z30.h, {z31.h}, z5.h
	sub	z15.h, z31.h, z30.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z17, [x3]
	addvl	x3, x6, #1
	rdvl	x6, #17
	add	x3, x3, 64
	lsl	x6, x6, 1
	add	x3, sp, x3
	str	z13, [x3]
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z15, [x3]
	add	x3, x0, 640
	ld1h	z30.h, p7/z, [x3]
	add	x3, x0, 672
	ld1h	z25.h, p7/z, [x3]
	rev	z31.h, z25.h
	addvl	x3, x6, #1
	sub	z13.h, z30.h, z31.h
	cntb	x6, all, mul #9
	add	x3, x3, 64
	lsl	x6, x6, 2
	add	z31.h, z30.h, z31.h
	add	x3, sp, x3
	str	z13, [x3]
	rev	z27.h, z31.h
	cntb	x3, all, mul #9
	sub	z12.h, z31.h, z27.h
	add	z31.h, z31.h, z27.h
	lsl	x3, x3, 2
	tbl	z27.h, {z31.h}, z5.h
	sub	z15.h, z31.h, z27.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z12, [x3]
	addvl	x3, x6, #1
	cntb	x6, all, mul #5
	add	x3, x3, 64
	lsl	x6, x6, 3
	add	x3, sp, x3
	str	z15, [x3]
	add	x3, x0, 704
	ld1h	z21.h, p7/z, [x3]
	add	x3, x0, 736
	ld1h	z17.h, p7/z, [x3]
	rev	z31.h, z17.h
	rdvl	x3, #19
	sub	z12.h, z21.h, z31.h
	add	z31.h, z21.h, z31.h
	lsl	x3, x3, 1
	rev	z27.h, z31.h
	sub	z19.h, z31.h, z27.h
	add	x3, sp, x3
	add	z31.h, z31.h, z27.h
	tbl	z27.h, {z31.h}, z5.h
	add	x3, x3, 64
	str	z12, [x3]
	sub	z15.h, z31.h, z27.h
	addvl	x3, x6, #-1
	cntb	x6, all, mul #5
	add	x3, x3, 64
	lsl	x6, x6, 3
	add	x3, sp, x3
	str	z19, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z15, [x3]
	add	x3, x0, 768
	ld1h	z12.h, p7/z, [x3]
	add	x3, x0, 800
	ld1h	z22.h, p7/z, [x3]
	rev	z31.h, z22.h
	addvl	x3, sp, #3
	sub	z19.h, z12.h, z31.h
	add	z31.h, z12.h, z31.h
	add	x3, x3, 64
	str	z22, [x3]
	rev	z27.h, z31.h
	addvl	x3, x6, #1
	rdvl	x6, #21
	sub	z13.h, z31.h, z27.h
	add	x3, x3, 64
	lsl	x6, x6, 1
	add	z31.h, z31.h, z27.h
	add	x3, sp, x3
	str	z19, [x3]
	tbl	z27.h, {z31.h}, z5.h
	rdvl	x3, #21
	sub	z15.h, z31.h, z27.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z13, [x3]
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	add	x3, x0, 832
	ld1h	z13.h, p7/z, [x3]
	add	x3, x0, 864
	ld1h	z19.h, p7/z, [x3]
	rev	z31.h, z19.h
	addvl	x3, sp, #4
	sub	z27.h, z13.h, z31.h
	add	z31.h, z13.h, z31.h
	add	x3, x3, 64
	str	z19, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z27, [x3]
	rev	z27.h, z31.h
	cntb	x3, all, mul #3
	sub	z18.h, z31.h, z27.h
	add	z31.h, z31.h, z27.h
	lsl	x6, x3, 4
	tbl	z27.h, {z31.h}, z5.h
	sub	z31.h, z31.h, z27.h
	sub	x3, x6, x3
	cntb	x6, all, mul #3
	add	x3, x3, 64
	lsl	x6, x6, 4
	add	x3, sp, x3
	str	z18, [x3]
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 896
	ld1h	z31.h, p7/z, [x3]
	add	x3, x0, 928
	ld1h	z26.h, p7/z, [x3]
	rev	z27.h, z26.h
	addvl	x3, x6, #-1
	sub	z22.h, z31.h, z27.h
	cntb	x6, all, mul #3
	add	x3, x3, 64
	lsl	x6, x6, 4
	add	z27.h, z31.h, z27.h
	add	x3, sp, x3
	str	z22, [x3]
	rev	z22.h, z27.h
	cntb	x3, all, mul #3
	sub	z18.h, z27.h, z22.h
	add	z27.h, z27.h, z22.h
	lsl	x3, x3, 4
	tbl	z22.h, {z27.h}, z5.h
	sub	z15.h, z27.h, z22.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z18, [x3]
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	add	x3, x0, 960
	ld1h	z22.h, p7/z, [x3]
	add	x3, x0, 992
	ld1h	z18.h, p7/z, [x3]
	rev	z27.h, z18.h
	rdvl	x3, #25
	sub	z19.h, z22.h, z27.h
	add	z27.h, z22.h, z27.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z19, [x3]
	rev	z19.h, z27.h
	cntb	x3, all, mul #3
	sub	z15.h, z27.h, z19.h
	add	z27.h, z27.h, z19.h
	add	x3, x3, x3, lsl 4
	tbl	z19.h, {z27.h}, z5.h
	sub	z27.h, z27.h, z19.h
	add	x3, x3, 64
	zip1	z19.d, z28.d, z0.d
	zip2	z28.d, z28.d, z0.d
	add	x3, sp, x3
	str	z15, [x3]
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z27, [x3]
	zip1	z27.d, z14.d, z7.d
	zip2	z14.d, z14.d, z7.d
	zip1	z7.d, z19.d, z27.d
	zip2	z19.d, z19.d, z27.d
	zip1	z27.d, z28.d, z14.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z14.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	zip1	z14.d, z23.d, z2.d
	add	x3, sp, 64
	ldr	z15, [x3]
	zip2	z23.d, z23.d, z2.d
	zip1	z2.d, z15.d, z1.d
	zip2	z15.d, z15.d, z1.d
	zip1	z1.d, z14.d, z2.d
	zip2	z14.d, z14.d, z2.d
	zip1	z2.d, z23.d, z15.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z2.d, p6/m, z2.d
// 0 "" 2
#NO_APP
	zip2	z23.d, z23.d, z15.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	saddlb	z15.s, z7.h, z23.h
	saddlt	z7.s, z7.h, z23.h
	saddlb	z0.s, z28.h, z1.h
	saddlb	z23.s, z19.h, z2.h
	saddlt	z28.s, z28.h, z1.h
	saddlt	z19.s, z19.h, z2.h
	add	z28.s, z7.s, z28.s
	add	z15.s, z15.s, z0.s
	saddlb	z7.s, z27.h, z14.h
	saddlt	z27.s, z27.h, z14.h
	add	z23.s, z23.s, z7.s
	add	z27.s, z19.s, z27.s
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z14.s, z27.s, z23.s
	zip1	z19.s, z15.s, z28.s
	zip2	z27.s, z27.s, z23.s
	add	z19.s, z19.s, z14.s
	zip2	z15.s, z15.s, z28.s
	add	z27.s, z15.s, z27.s
	uzp2	z23.d, z19.d, z27.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z28.d, z19.d, z27.d
	add	z19.s, z23.s, z28.s
	sub	z28.s, z28.s, z23.s
	ld1w	z23.s, p7/z, [x4]
	movprfx	z14, z19
	mul	z14.s, p7/m, z14.s, z23.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z14.s, p5/m, z14.s, z14.s
// 0 "" 2
#NO_APP
	cntb	x6, all, mul #13
	lsl	x6, x6, 2
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
	movprfx	z15, z2
	mul	z15.s, p7/m, z15.s, z28.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z15.s, p5/m, z15.s, z15.s
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
	mul	z19.s, p7/m, z19.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
	mul	z28.s, p7/m, z28.s, z0.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	zip1	z27.d, z8.d, z29.d
	zip2	z29.d, z8.d, z29.d
	zip1	z8.d, z9.d, z20.d
	zip2	z20.d, z9.d, z20.d
	zip1	z9.d, z27.d, z8.d
	zip2	z8.d, z27.d, z8.d
	zip1	z27.d, z29.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z29.d, z29.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip1	z20.d, z3.d, z24.d
	zip1	z7.d, z4.d, z16.d
	zip2	z24.d, z3.d, z24.d
	zip2	z16.d, z4.d, z16.d
	zip1	z4.d, z20.d, z7.d
	zip2	z7.d, z20.d, z7.d
	zip1	z20.d, z24.d, z16.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z20.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	zip2	z24.d, z24.d, z16.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	saddlb	z16.s, z9.h, z24.h
	saddlt	z9.s, z9.h, z24.h
	saddlb	z3.s, z29.h, z4.h
	saddlb	z24.s, z8.h, z20.h
	saddlt	z29.s, z29.h, z4.h
	saddlt	z8.s, z8.h, z20.h
	add	z29.s, z9.s, z29.s
	add	z16.s, z16.s, z3.s
	saddlb	z9.s, z27.h, z7.h
	saddlt	z27.s, z27.h, z7.h
	add	z24.s, z24.s, z9.s
	add	z27.s, z8.s, z27.s
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z20.s, z16.s, z29.s
	zip2	z16.s, z16.s, z29.s
	zip1	z9.s, z27.s, z24.s
	zip2	z27.s, z27.s, z24.s
	add	z20.s, z20.s, z9.s
	add	z27.s, z16.s, z27.s
	uzp2	z16.d, z20.d, z27.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z16.d, p6/m, z16.d
// 0 "" 2
#NO_APP
	uzp1	z20.d, z20.d, z27.d
	add	z24.s, z16.s, z20.s
	sub	z29.s, z20.s, z16.s
	movprfx	z16, z24
	mul	z16.s, p7/m, z16.s, z23.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z16.s, p5/m, z16.s, z16.s
// 0 "" 2
#NO_APP
	movprfx	z20, z2
	mul	z20.s, p7/m, z20.s, z29.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	mul	z24.s, p7/m, z24.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	mul	z29.s, p7/m, z29.s, z0.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	zip1	z27.d, z10.d, z30.d
	zip2	z30.d, z10.d, z30.d
	zip1	z10.d, z11.d, z21.d
	zip2	z21.d, z11.d, z21.d
	zip1	z11.d, z27.d, z10.d
	zip2	z10.d, z27.d, z10.d
	zip1	z27.d, z30.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z9, [x3]
	zip1	z21.d, z9.d, z25.d
	addvl	x3, sp, #2
	zip2	z25.d, z9.d, z25.d
	add	x3, x3, 64
	ldr	z8, [x3]
	zip1	z9.d, z8.d, z17.d
	zip2	z17.d, z8.d, z17.d
	zip1	z8.d, z21.d, z9.d
	zip2	z9.d, z21.d, z9.d
	zip1	z21.d, z25.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip2	z25.d, z25.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	saddlb	z17.s, z11.h, z25.h
	saddlt	z11.s, z11.h, z25.h
	saddlb	z7.s, z30.h, z8.h
	saddlb	z25.s, z10.h, z21.h
	saddlt	z30.s, z30.h, z8.h
	saddlt	z10.s, z10.h, z21.h
	add	z30.s, z11.s, z30.s
	add	z17.s, z17.s, z7.s
	saddlb	z11.s, z27.h, z9.h
	saddlt	z27.s, z27.h, z9.h
	add	z25.s, z25.s, z11.s
	add	z27.s, z10.s, z27.s
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z21.s, z17.s, z30.s
	zip2	z17.s, z17.s, z30.s
	zip1	z11.s, z27.s, z25.s
	zip2	z27.s, z27.s, z25.s
	add	z21.s, z21.s, z11.s
	add	z27.s, z17.s, z27.s
	uzp2	z17.d, z21.d, z27.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	uzp1	z21.d, z21.d, z27.d
	add	z25.s, z17.s, z21.s
	sub	z30.s, z21.s, z17.s
	movprfx	z17, z25
	mul	z17.s, p7/m, z17.s, z23.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z17.s, p5/m, z17.s, z17.s
// 0 "" 2
#NO_APP
	movprfx	z21, z2
	mul	z21.s, p7/m, z21.s, z30.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z21.s, p5/m, z21.s, z21.s
// 0 "" 2
#NO_APP
	mul	z25.s, p7/m, z25.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	mul	z30.s, p7/m, z30.s, z0.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	zip1	z27.d, z12.d, z31.d
	zip2	z31.d, z12.d, z31.d
	zip1	z12.d, z13.d, z22.d
	zip2	z22.d, z13.d, z22.d
	zip1	z13.d, z27.d, z12.d
	zip2	z12.d, z27.d, z12.d
	zip1	z27.d, z31.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z9, [x3]
	zip1	z22.d, z9.d, z26.d
	addvl	x3, sp, #4
	zip2	z26.d, z9.d, z26.d
	add	x3, x3, 64
	ldr	z10, [x3]
	zip1	z11.d, z10.d, z18.d
	zip2	z18.d, z10.d, z18.d
	zip1	z10.d, z22.d, z11.d
	zip2	z11.d, z22.d, z11.d
	zip1	z22.d, z26.d, z18.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	zip2	z26.d, z26.d, z18.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	saddlb	z18.s, z13.h, z26.h
	saddlt	z13.s, z13.h, z26.h
	saddlb	z9.s, z31.h, z10.h
	saddlb	z26.s, z12.h, z22.h
	saddlt	z31.s, z31.h, z10.h
	saddlt	z12.s, z12.h, z22.h
	add	z31.s, z13.s, z31.s
	add	z18.s, z18.s, z9.s
	saddlb	z13.s, z27.h, z11.h
	saddlt	z27.s, z27.h, z11.h
	add	z26.s, z26.s, z13.s
	add	z27.s, z12.s, z27.s
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z13.s, z27.s, z26.s
	zip1	z22.s, z18.s, z31.s
	zip2	z27.s, z27.s, z26.s
	add	z22.s, z22.s, z13.s
	zip2	z18.s, z18.s, z31.s
	add	z27.s, z18.s, z27.s
	uzp2	z26.d, z22.d, z27.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	uzp1	z22.d, z22.d, z27.d
	add	z31.s, z26.s, z22.s
	sub	z22.s, z22.s, z26.s
	mul	z23.s, p7/m, z23.s, z31.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	movprfx	z18, z2
	mul	z18.s, p7/m, z18.s, z22.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z18.s, p5/m, z18.s, z18.s
// 0 "" 2
#NO_APP
	mul	z31.s, p7/m, z31.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	mul	z22.s, p7/m, z22.s, z0.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z22.s, p5/m, z22.s, z22.s
// 0 "" 2
#NO_APP
	uzp1	z27.s, z16.s, z16.s
	uzp1	z26.s, z14.s, z14.s
	tbl	z26.s, {z26.s - z27.s}, z6.s
	uzp1	z27.s, z20.s, z20.s
	rshrnb	z26.h, z26.s, #11
	uzp1	z26.h, z26.h, z26.h
	uzp1	z13.s, z23.s, z23.s
	uzp1	z12.s, z17.s, z17.s
	tbl	z12.s, {z12.s - z13.s}, z6.s
	rshrnb	z12.h, z12.s, #11
	uzp1	z12.h, z12.h, z12.h
	stp	q26, q12, [x1]
	uzp1	z26.s, z15.s, z15.s
	tbl	z26.s, {z26.s - z27.s}, z6.s
	uzp1	z27.s, z24.s, z24.s
	rshrnb	z26.h, z26.s, #11
	uzp1	z26.h, z26.h, z26.h
	uzp1	z17.s, z18.s, z18.s
	uzp1	z16.s, z21.s, z21.s
	addvl	x3, sp, #5
	tbl	z16.s, {z16.s - z17.s}, z6.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	stp	q26, q16, [x1, 512]
	uzp1	z26.s, z19.s, z19.s
	tbl	z26.s, {z26.s - z27.s}, z6.s
	uzp1	z27.s, z31.s, z31.s
	rshrnb	z26.h, z26.s, #11
	uzp1	z26.h, z26.h, z26.h
	add	x3, x3, 64
	str	q26, [x1, 1024]
	uzp1	z26.s, z25.s, z25.s
	tbl	z26.s, {z26.s - z27.s}, z6.s
	uzp1	z27.s, z29.s, z29.s
	rshrnb	z26.h, z26.s, #11
	uzp1	z29.s, z22.s, z22.s
	uzp1	z26.h, z26.h, z26.h
	str	q26, [x1, 1040]
	rdvl	x6, #17
	uzp1	z26.s, z28.s, z28.s
	uzp1	z28.s, z30.s, z30.s
	tbl	z28.s, {z28.s - z29.s}, z6.s
	ldr	z29, [x3]
	addvl	x3, sp, #11
	tbl	z26.s, {z26.s - z27.s}, z6.s
	add	x3, x3, 64
	ldr	z27, [x3]
	rshrnb	z28.h, z28.s, #11
	addvl	x3, sp, #8
	uzp1	z28.h, z28.h, z28.h
	str	q28, [x1, 1552]
	add	x3, x3, 64
	ldr	z28, [x3]
	rshrnb	z26.h, z26.s, #11
	addvl	x3, sp, #14
	uzp1	z26.h, z26.h, z26.h
	str	q26, [x1, 1536]
	add	x3, x3, 64
	ldr	z26, [x3]
	trn2	z21.d, z29.d, z27.d
	addvl	x3, sp, #17
	zip1	z24.d, z29.d, z27.d
	trn1	z27.d, z29.d, z27.d
	add	x3, x3, 64
	ldr	z29, [x3]
	zip1	z30.d, z28.d, z26.d
	addvl	x3, sp, #23
	zip1	z24.d, z24.d, z30.d
	trn2	z31.d, z28.d, z26.d
	add	x3, x3, 64
	trn1	z30.d, z28.d, z26.d
	ldr	z28, [x3]
	addvl	x3, sp, #20
	lsl	x6, x6, 1
	trn2	z22.d, z29.d, z28.d
	add	x3, x3, 64
	ldr	z26, [x3]
	zip1	z20.d, z29.d, z28.d
	addvl	x3, sp, #26
	trn1	z28.d, z29.d, z28.d
	zip2	z27.d, z27.d, z30.d
	add	x3, x3, 64
	ldr	z25, [x3]
	zip1	z30.d, z26.d, z25.d
	addvl	x3, sp, #29
	zip1	z23.d, z21.d, z31.d
	zip1	z20.d, z20.d, z30.d
	add	x3, x3, 64
	ldr	z29, [x3]
	zip2	z21.d, z21.d, z31.d
	addvl	x3, x6, #1
	trn2	z31.d, z26.d, z25.d
	trn1	z30.d, z26.d, z25.d
	add	x3, x3, 64
	cntb	x6, all, mul #5
	zip2	z28.d, z28.d, z30.d
	add	x3, sp, x3
	ldr	z18, [x3]
	lsl	x6, x6, 3
	cntb	x3
	zip1	z17.d, z29.d, z18.d
	trn2	z25.d, z29.d, z18.d
	lsl	x3, x3, 5
	trn1	z29.d, z29.d, z18.d
	zip1	z19.d, z22.d, z31.d
	add	x3, sp, x3
	zip2	z22.d, z22.d, z31.d
	add	x0, x0, 1024
	add	x3, x3, 64
	ldr	z26, [x3]
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
	zip1	z30.d, z26.d, z16.d
	addvl	x3, x6, #1
	cntb	x6, all, mul #3
	zip1	z17.d, z17.d, z30.d
	add	x3, x3, 64
	lsl	x6, x6, 4
	trn1	z30.d, z26.d, z16.d
	add	x3, sp, x3
	ldr	z14, [x3]
	zip2	z29.d, z29.d, z30.d
	addvl	x3, x6, #-1
	cntb	x6, all, mul #15
	trn2	z31.d, z26.d, z16.d
	add	x3, x3, 64
	lsl	x6, x6, 2
	zip1	z15.d, z25.d, z31.d
	add	x3, sp, x3
	ldr	z12, [x3]
	trn2	z26.d, z14.d, z12.d
	cntb	x3, all, mul #11
	zip1	z18.d, z14.d, z12.d
	zip2	z25.d, z25.d, z31.d
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	zip1	z30.d, z13.d, z11.d
	addvl	x3, x6, #-1
	zip1	z18.d, z18.d, z30.d
	trn1	z30.d, z14.d, z12.d
	add	x3, x3, 64
	cntb	x6, all, mul #15
	trn2	z31.d, z13.d, z11.d
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x6, x6, 2
	cntb	x3, all, mul #7
	trn1	z14.d, z13.d, z11.d
	zip1	z16.d, z26.d, z31.d
	lsl	x3, x3, 3
	zip2	z30.d, z30.d, z14.d
	zip2	z26.d, z26.d, z31.d
	add	x3, sp, x3
	movi	d31, #0
	mov	z10.d, z12.d
	add	x3, x3, 64
	ldr	z9, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z12.h
	cntb	x3, all, mul #15
	movprfx	z11, z31
	sdot	z11.d, z19.h, z12.h
	sdot	z14.d, z24.h, z9.h
	lsl	x3, x3, 2
	sdot	z11.d, z20.h, z9.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z12.h
	add	x3, sp, x3
	movprfx	z12, z31
	sdot	z12.d, z16.h, z10.h
	sdot	z13.d, z17.h, z9.h
	add	x3, x3, 64
	ldr	z8, [x3]
	sdot	z12.d, z18.h, z9.h
	addvl	x3, x6, #1
	cntb	x6
	sdot	z14.d, z27.h, z8.h
	add	x3, x3, 64
	lsl	x6, x6, 6
	sdot	z11.d, z28.h, z8.h
	add	x3, sp, x3
	ldr	z7, [x3]
	sdot	z13.d, z29.h, z8.h
	add	x3, x1, 64
	sdot	z11.d, z22.h, z7.h
	sdot	z14.d, z21.h, z7.h
	sdot	z13.d, z25.h, z7.h
	sdot	z12.d, z30.h, z8.h
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z26.h, z7.h
	rshrnb	z14.h, z14.s, #11
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	addvl	x3, x6, #-1
	cntb	x6, all, mul #7
	add	x3, x3, 64
	lsl	x6, x6, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z12.h
	rdvl	x3, #31
	movprfx	z11, z31
	sdot	z11.d, z19.h, z12.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z12.h
	lsl	x3, x3, 1
	mov	z10.d, z12.d
	movprfx	z12, z31
	sdot	z12.d, z16.h, z10.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	sdot	z14.d, z24.h, z9.h
	addvl	x3, x6, #1
	sdot	z11.d, z20.h, z9.h
	sdot	z13.d, z17.h, z9.h
	add	x3, x3, 64
	sdot	z12.d, z18.h, z9.h
	cntb	x6
	add	x3, sp, x3
	ldr	z8, [x3]
	sdot	z14.d, z27.h, z8.h
	rdvl	x3, #29
	sdot	z11.d, z28.h, z8.h
	sdot	z13.d, z29.h, z8.h
	lsl	x3, x3, 1
	sdot	z12.d, z30.h, z8.h
	lsl	x6, x6, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z7, [x3]
	sdot	z11.d, z22.h, z7.h
	add	x3, x1, 192
	sdot	z12.d, z26.h, z7.h
	sdot	z14.d, z21.h, z7.h
	sdot	z13.d, z25.h, z7.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 448
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 480
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 512
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 544
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 320
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 576
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 608
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 640
	ld1h	z9.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 672
	ld1h	z10.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x1, 448
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 704
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 736
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 768
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 800
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 576
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 832
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 864
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 896
	ld1h	z9.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 928
	ld1h	z10.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x1, 704
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 960
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 992
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1024
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 1056
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 832
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1088
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1120
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 1152
	ld1h	z9.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1184
	ld1h	z10.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x1, 960
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1216
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1248
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1280
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 1312
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 1088
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1344
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1376
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 1408
	ld1h	z9.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1440
	ld1h	z10.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x1, 1216
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1472
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1504
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1536
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 1568
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 1344
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1600
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1632
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 1664
	ld1h	z9.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1696
	ld1h	z10.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x1, 1472
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1728
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1760
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1792
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 1824
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 1600
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1856
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 1888
	ld1h	z7.h, p7/z, [x3]
	add	x3, x2, 1920
	ld1h	z9.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 1952
	ld1h	z10.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x1, 1728
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 1984
	ld1h	z8.h, p7/z, [x3]
	add	x3, x2, 2016
	ld1h	z7.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z7.h
	add	x3, x2, 2048
	ld1h	z9.h, p7/z, [x3]
	movprfx	z11, z31
	sdot	z11.d, z19.h, z7.h
	add	x3, x2, 2080
	ld1h	z10.h, p7/z, [x3]
	movprfx	z12, z31
	sdot	z12.d, z16.h, z7.h
	add	x3, x1, 1856
	sdot	z14.d, z24.h, z8.h
	sdot	z11.d, z20.h, z8.h
	sdot	z14.d, z27.h, z9.h
	sdot	z11.d, z28.h, z9.h
	sdot	z14.d, z21.h, z10.h
	sdot	z11.d, z22.h, z10.h
	movprfx	z13, z31
	sdot	z13.d, z15.h, z7.h
	sdot	z12.d, z18.h, z8.h
	sdot	z13.d, z17.h, z8.h
	sdot	z12.d, z30.h, z9.h
	sdot	z13.d, z29.h, z9.h
	sdot	z12.d, z26.h, z10.h
	sdot	z13.d, z25.h, z10.h
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z13.h, z13.s, #11
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x3]
	add	x3, x2, 2112
	ld1h	z11.h, p7/z, [x3]
	add	x3, x2, 2144
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 2176
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z31
	sdot	z14.d, z23.h, z10.h
	add	x3, x2, 2208
	ld1h	z13.h, p7/z, [x3]
	sdot	z14.d, z24.h, z11.h
	add	x3, x1, 1984
	sdot	z14.d, z27.h, z12.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z10.h
	sdot	z14.d, z21.h, z13.h
	sdot	z27.d, z20.h, z11.h
	sdot	z27.d, z28.h, z12.h
	movprfx	z28, z31
	sdot	z28.d, z15.h, z10.h
	sdot	z27.d, z22.h, z13.h
	sdot	z28.d, z17.h, z11.h
	uzp1	z14.s, z14.s, z27.s
	sdot	z28.d, z29.h, z12.h
	rshrnb	z14.h, z14.s, #11
	movprfx	z29, z31
	sdot	z29.d, z16.h, z10.h
	sdot	z28.d, z25.h, z13.h
	sdot	z29.d, z18.h, z11.h
	sdot	z29.d, z30.h, z12.h
	sdot	z29.d, z26.h, z13.h
	uzp1	z28.s, z28.s, z29.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z14.h, z14.h, z28.h
	st1h	z14.h, p7, [x3]
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z25, [x3]
	zip1	z30.d, z28.d, z25.d
	addvl	x3, sp, #9
	trn2	z28.d, z28.d, z25.d
	add	x3, x3, 64
	ldr	z27, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z16, [x3]
	zip1	z29.d, z27.d, z16.d
	addvl	x3, sp, #18
	zip1	z30.d, z30.d, z29.d
	trn2	z29.d, z27.d, z16.d
	add	x3, x3, 64
	ldr	z26, [x3]
	zip1	z29.d, z28.d, z29.d
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z24, [x3]
	zip1	z28.d, z26.d, z24.d
	addvl	x3, sp, #21
	trn2	z26.d, z26.d, z24.d
	add	x3, x3, 64
	ldr	z25, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z14, [x3]
	zip1	z27.d, z25.d, z14.d
	addvl	x3, sp, #30
	zip1	z28.d, z28.d, z27.d
	trn2	z27.d, z25.d, z14.d
	add	x3, x3, 64
	ldr	z24, [x3]
	zip1	z26.d, z26.d, z27.d
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
	zip1	z25.d, z24.d, z22.d
	addvl	x3, x6, #1
	cntb	x6, all, mul #5
	trn2	z24.d, z24.d, z22.d
	add	x3, x3, 64
	lsl	x6, x6, 3
	add	x3, sp, x3
	ldr	z23, [x3]
	addvl	x3, x6, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	ldr	z16, [x3]
	rdvl	x3, #21
	zip1	z27.d, z23.d, z14.d
	zip1	z25.d, z25.d, z27.d
	lsl	x3, x3, 1
	trn2	z27.d, z23.d, z16.d
	zip1	z24.d, z24.d, z27.d
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
	zip1	z23.d, z22.d, z20.d
	cntb	x3, all, mul #3
	lsl	x6, x3, 4
	sub	x3, x6, x3
	cntb	x6, all, mul #9
	add	x3, x3, 64
	lsl	x6, x6, 2
	add	x3, sp, x3
	ldr	z21, [x3]
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	zip1	z27.d, z21.d, z14.d
	ldr	z14, [x3]
	add	x3, x2, 2240
	zip1	z23.d, z23.d, z27.d
	trn2	z27.d, z22.d, z20.d
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2272
	trn2	z22.d, z21.d, z14.d
	ld1h	z19.h, p7/z, [x3]
	add	x3, x1, 128
	zip1	z27.d, z27.d, z22.d
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2304
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2336
	ld1h	z19.h, p7/z, [x3]
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	add	x3, x1, 384
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2368
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2400
	ld1h	z19.h, p7/z, [x3]
	add	x3, x1, 640
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2432
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2464
	ld1h	z19.h, p7/z, [x3]
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	add	x3, x1, 896
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2496
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2528
	ld1h	z19.h, p7/z, [x3]
	add	x3, x1, 1152
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2560
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2592
	ld1h	z19.h, p7/z, [x3]
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	add	x3, x1, 1408
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z18.d, z23.h, z20.h
	sdot	z21.d, z25.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2624
	ld1h	z20.h, p7/z, [x3]
	add	x3, x2, 2656
	ld1h	z19.h, p7/z, [x3]
	add	x3, x1, 1664
	movprfx	z22, z31
	sdot	z22.d, z29.h, z19.h
	movprfx	z17, z31
	sdot	z17.d, z26.h, z19.h
	sdot	z22.d, z30.h, z20.h
	sdot	z17.d, z28.h, z20.h
	movprfx	z21, z31
	sdot	z21.d, z24.h, z19.h
	movprfx	z18, z31
	sdot	z18.d, z27.h, z19.h
	sdot	z21.d, z25.h, z20.h
	sdot	z18.d, z23.h, z20.h
	uzp1	z22.s, z22.s, z17.s
	uzp1	z21.s, z21.s, z18.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 2688
	ld1h	z21.h, p7/z, [x3]
	add	x3, x2, 2720
	ld1h	z20.h, p7/z, [x3]
	movprfx	z22, z31
	sdot	z22.d, z29.h, z20.h
	add	x3, x1, 1920
	movprfx	z29, z31
	sdot	z29.d, z24.h, z20.h
	sdot	z22.d, z30.h, z21.h
	sdot	z29.d, z25.h, z21.h
	movprfx	z30, z31
	sdot	z30.d, z26.h, z20.h
	sdot	z30.d, z28.h, z21.h
	movprfx	z28, z31
	sdot	z28.d, z27.h, z20.h
	uzp1	z22.s, z22.s, z30.s
	sdot	z28.d, z23.h, z21.h
	rshrnb	z22.h, z22.s, #11
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z29.h, z29.s, #11
	uzp1	z22.h, z22.h, z29.h
	st1h	z22.h, p7, [x3]
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z30, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z29, [x3]
	zip1	z27.d, z30.d, z29.d
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z30, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z29, [x3]
	zip1	z30.d, z30.d, z29.d
	addvl	x3, sp, #19
	zip1	z27.d, z27.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z29, [x3]
	zip1	z28.d, z30.d, z29.d
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z30, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z29, [x3]
	zip1	z30.d, z30.d, z29.d
	addvl	x3, sp, #31
	zip1	z28.d, z28.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
	addvl	x3, x6, #1
	rdvl	x6, #21
	add	x3, x3, 64
	lsl	x6, x6, 1
	add	x3, sp, x3
	ldr	z29, [x3]
	zip1	z29.d, z30.d, z29.d
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
	zip1	z30.d, z30.d, z26.d
	addvl	x3, x6, #1
	cntb	x6, all, mul #3
	zip1	z29.d, z29.d, z30.d
	add	x3, x3, 64
	lsl	x6, x6, 4
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z30.d, z30.d, z26.d
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z26, [x3]
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
	zip1	z26.d, z26.d, z25.d
	add	x3, x2, 2752
	ld1h	z24.h, p7/z, [x3]
	zip1	z30.d, z30.d, z26.d
	add	x3, x1, 256
	movprfx	z22, z31
	sdot	z22.d, z28.h, z24.h
	movprfx	z23, z31
	sdot	z23.d, z30.h, z24.h
	movprfx	z26, z31
	sdot	z26.d, z27.h, z24.h
	movprfx	z25, z31
	sdot	z25.d, z29.h, z24.h
	uzp1	z26.s, z26.s, z22.s
	uzp1	z25.s, z25.s, z23.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z25.h, z25.s, #11
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x3]
	add	x3, x2, 2784
	ld1h	z24.h, p7/z, [x3]
	add	x3, x1, 768
	movprfx	z22, z31
	sdot	z22.d, z28.h, z24.h
	movprfx	z23, z31
	sdot	z23.d, z30.h, z24.h
	movprfx	z26, z31
	sdot	z26.d, z27.h, z24.h
	movprfx	z25, z31
	sdot	z25.d, z29.h, z24.h
	uzp1	z26.s, z26.s, z22.s
	uzp1	z25.s, z25.s, z23.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z25.h, z25.s, #11
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x3]
	add	x3, x2, 2816
	ld1h	z24.h, p7/z, [x3]
	movprfx	z26, z31
	sdot	z26.d, z27.h, z24.h
	add	x3, x1, 1280
	movprfx	z22, z31
	sdot	z22.d, z28.h, z24.h
	movprfx	z23, z31
	sdot	z23.d, z30.h, z24.h
	movprfx	z25, z31
	sdot	z25.d, z29.h, z24.h
	uzp1	z26.s, z26.s, z22.s
	uzp1	z25.s, z25.s, z23.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z25.h, z25.s, #11
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x3]
	add	x3, x2, 2848
	ld1h	z25.h, p7/z, [x3]
	add	x3, x1, 1792
	movprfx	z26, z31
	sdot	z26.d, z27.h, z25.h
	movprfx	z27, z31
	sdot	z27.d, z28.h, z25.h
	movprfx	z28, z31
	sdot	z28.d, z29.h, z25.h
	sdot	z31.d, z30.h, z25.h
	uzp1	z30.s, z26.s, z27.s
	uzp1	z31.s, z28.s, z31.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z31.h, z31.s, #11
	uzp1	z31.h, z30.h, z31.h
	st1h	z31.h, p7, [x3]
	add	x1, x1, 32
	cmp	x5, x0
	bne	.L7
	cntb	x12
	lsl	x12, x12, 6
	ldp	d8, d9, [sp]
	ldp	d10, d11, [sp, 16]
	ldp	d12, d13, [sp, 32]
	ldp	d14, d15, [sp, 48]
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	add	sp, sp, x12
	.cfi_def_cfa_offset 64
	add	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL10op_pass_11PKsPsl.constprop.0, .-_ZL10op_pass_11PKsPsl.constprop.0
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB11:
	.cfi_startproc
	sub	sp, sp, #2080
	.cfi_def_cfa_offset 2080
	stp	x29, x30, [sp]
	.cfi_offset 29, -2080
	.cfi_offset 30, -2072
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -2064
	mov	x19, x1
	add	x1, sp, 32
	bl	_ZL9op_pass_4PKsPsl
	mov	x1, x19
	add	x0, sp, 32
	bl	_ZL10op_pass_11PKsPsl.constprop.0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp]
	add	sp, sp, 2080
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11:
	.size	dynopt_dct32_sve2_shared, .-dynopt_dct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL6IDX_S8, %object
	.size	_ZL6IDX_S8, 32
_ZL6IDX_S8:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	8
	.word	9
	.word	10
	.word	11
	.type	_ZL8IDX_REV8, %object
	.size	_ZL8IDX_REV8, 32
_ZL8IDX_REV8:
	.hword	7
	.hword	6
	.hword	5
	.hword	4
	.hword	3
	.hword	2
	.hword	1
	.hword	0
	.hword	15
	.hword	14
	.hword	13
	.hword	12
	.hword	11
	.hword	10
	.hword	9
	.hword	8
	.type	_ZL6K0EVEN, %object
	.size	_ZL6K0EVEN, 128
_ZL6K0EVEN:
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	83
	.word	36
	.word	83
	.word	36
	.word	83
	.word	36
	.word	83
	.word	36
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	36
	.word	-83
	.word	36
	.word	-83
	.word	36
	.word	-83
	.word	36
	.word	-83
	.type	_ZL4CODD, %object
	.size	_ZL4CODD, 2048
_ZL4CODD:
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.type	_ZL3K2S, %object
	.size	_ZL3K2S, 512
_ZL3K2S:
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.type	_ZL3K4S, %object
	.size	_ZL3K4S, 128
_ZL3K4S:
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
