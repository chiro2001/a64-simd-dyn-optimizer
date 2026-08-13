	.arch armv8.2-a+crc+sve2
	.file	"best_op_r16.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB9:
	.cfi_startproc
	mov	x13, 49
	cntb	x12
	ptrue	p7.b, all
	rdvl	x4, #21
	adrp	x3, .LANCHOR0
	ptrue	p6.d, all
	mul	x12, x12, x13
	add	x3, x3, :lo12:.LANCHOR0
	lsl	x4, x4, 1
	add	x11, x3, 64
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0x88,0x1,0x1e,0x22
	add	x5, x2, x2, lsl 1
	sub	sp, sp, #112
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0x88,0x1,0x1e,0x23,0x70,0x22
	add	x7, x2, x2, lsl 2
	add	x4, sp, x4
	lsl	x8, x2, 4
	add	x4, x4, 112
	sub	x8, x8, x2
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x17, x0, x5, lsl 1
	ld1w	z31.s, p7/z, [x3]
	add	x16, x0, x7, lsl 1
	stp	x19, x20, [sp, 16]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	lsl	x20, x2, 3
	sub	x9, x20, x2
	str	x21, [sp, 32]
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	rdvl	x21, #21
	stp	d8, d9, [sp, 48]
	lsl	x21, x21, 1
	add	x10, x20, x2
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
	str	z31, [x4]
	ld1w	z31.s, p7/z, [x11]
	addvl	x11, sp, #1
	add	x11, x11, 112
	str	z31, [x11]
	add	x4, x3, 32
	add	x11, x3, 96
	ld1w	z31.s, p7/z, [x11]
	add	x30, x0, x2, lsl 1
	addvl	x11, x21, #1
	add	x18, x0, x2, lsl 2
	ld1h	z3.h, p7/z, [x4]
	add	x11, x11, 112
	lsl	x4, x2, 5
	add	x11, sp, x11
	str	z31, [x11]
	add	x2, x0, x2, lsl 3
	add	x11, x3, 160
	ld1w	z31.s, p7/z, [x11]
	add	x14, x0, x9, lsl 1
	add	x11, sp, 112
	str	z31, [x11]
	add	x10, x0, x10, lsl 1
	add	x11, x3, 192
	ld1h	z31.h, p7/z, [x11]
	add	x7, x0, x7, lsl 1
	cntb	x11, all, mul #11
	add	x5, x0, x5, lsl 1
	lsl	x11, x11, 2
	add	x9, x0, x9, lsl 2
	add	x11, sp, x11
	add	x8, x0, x8, lsl 1
	add	x11, x11, 112
	str	z31, [x11]
	add	x19, x1, 64
	add	x11, x3, 448
	ld1h	z31.h, p7/z, [x11]
	add	x20, x20, x2
	cntb	x11, all, mul #3
	mov	x6, 0
	lsl	x21, x11, 4
	sub	x11, x21, x11
	cntb	x21, all, mul #3
	add	x11, x11, 112
	lsl	x21, x21, 4
	add	x11, sp, x11
	str	z31, [x11]
	add	x11, x3, 704
	ld1h	z31.h, p7/z, [x11]
	rdvl	x11, #23
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	str	z31, [x11]
	add	x11, x3, 960
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, x21, #-1
	add	x11, x11, 112
	add	x11, sp, x11
	str	z31, [x11]
	add	x11, x3, 224
	ld1h	z0.h, p7/z, [x11]
	mov	z6.d, z0.d
	add	x11, x3, 480
	ld1h	z1.h, p7/z, [x11]
	mov	z5.d, z1.d
	add	x11, x3, 736
	ld1h	z2.h, p7/z, [x11]
	mov	z4.d, z2.d
	add	x11, x3, 992
	ld1h	z31.h, p7/z, [x11]
	cntb	x11, all, mul #3
	lsl	x11, x11, 4
	add	x11, sp, x11
	add	x11, x11, 112
	str	z31, [x11]
.L2:
	add	x11, x0, x6
	ld1h	z23.h, p7/z, [x11]
	ld1h	z1.h, p7/z, [x17]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #2
	sub	z29.h, z23.h, z31.h
	add	z23.h, z23.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z23.h
	sub	z30.h, z23.h, z31.h
	str	z30, [x11]
	addvl	x11, sp, #3
	add	z31.h, z23.h, z31.h
	add	x11, x11, 112
	tbl	z30.h, {z31.h}, z3.h
	sub	z31.h, z31.h, z30.h
	str	z31, [x11]
	add	x11, x30, x6
	ld1h	z25.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #4
	sub	z26.h, z25.h, z31.h
	add	z25.h, z25.h, z31.h
	add	x11, x11, 112
	str	z26, [x11]
	rev	z31.h, z25.h
	addvl	x11, sp, #5
	sub	z27.h, z25.h, z31.h
	add	z31.h, z25.h, z31.h
	add	x11, x11, 112
	str	z27, [x11]
	tbl	z30.h, {z31.h}, z3.h
	addvl	x11, sp, #6
	sub	z28.h, z31.h, z30.h
	ld1h	z15.h, p7/z, [x16]
	add	x11, x11, 112
	str	z28, [x11]
	ld1h	z26.h, p7/z, [x15]
	add	x11, x18, x6
	ld1h	z2.h, p7/z, [x11]
	cntb	x21
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #7
	sub	z30.h, z2.h, z31.h
	add	z2.h, z2.h, z31.h
	add	x11, x11, 112
	str	z30, [x11]
	rev	z31.h, z2.h
	addvl	x11, sp, #8
	sub	z28.h, z2.h, z31.h
	add	z31.h, z2.h, z31.h
	add	x11, x11, 112
	str	z28, [x11]
	tbl	z30.h, {z31.h}, z3.h
	addvl	x11, sp, #9
	sub	z24.h, z31.h, z30.h
	lsl	x21, x21, 5
	add	x11, x11, 112
	str	z24, [x11]
	add	x11, x17, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #10
	sub	z22.h, z1.h, z31.h
	add	z1.h, z1.h, z31.h
	add	x11, x11, 112
	str	z22, [x11]
	rev	z31.h, z1.h
	addvl	x11, sp, #11
	sub	z24.h, z1.h, z31.h
	add	z31.h, z1.h, z31.h
	add	x11, x11, 112
	str	z24, [x11]
	tbl	z30.h, {z31.h}, z3.h
	addvl	x11, sp, #12
	sub	z21.h, z31.h, z30.h
	add	x11, x11, 112
	str	z21, [x11]
	add	x11, x2, x6
	ld1h	z14.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #13
	sub	z28.h, z14.h, z31.h
	add	z14.h, z14.h, z31.h
	add	x11, x11, 112
	str	z28, [x11]
	rev	z31.h, z14.h
	addvl	x11, sp, #14
	sub	z21.h, z14.h, z31.h
	add	z31.h, z14.h, z31.h
	add	x11, x11, 112
	str	z21, [x11]
	tbl	z30.h, {z31.h}, z3.h
	addvl	x11, sp, #15
	sub	z20.h, z31.h, z30.h
	add	x11, x11, 112
	str	z20, [x11]
	add	x11, x16, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #16
	sub	z27.h, z15.h, z31.h
	add	z15.h, z15.h, z31.h
	add	x11, x11, 112
	str	z27, [x11]
	rev	z31.h, z15.h
	addvl	x11, sp, #17
	sub	z20.h, z15.h, z31.h
	add	z31.h, z15.h, z31.h
	add	x11, x11, 112
	str	z20, [x11]
	tbl	z30.h, {z31.h}, z3.h
	addvl	x11, sp, #18
	sub	z19.h, z31.h, z30.h
	add	x11, x11, 112
	str	z19, [x11]
	add	x11, x15, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #19
	sub	z18.h, z26.h, z31.h
	add	z26.h, z26.h, z31.h
	add	x11, x11, 112
	str	z18, [x11]
	rev	z31.h, z26.h
	addvl	x11, sp, #20
	sub	z19.h, z26.h, z31.h
	add	z31.h, z26.h, z31.h
	add	x11, x11, 112
	str	z19, [x11]
	tbl	z30.h, {z31.h}, z3.h
	addvl	x11, sp, #21
	sub	z17.h, z31.h, z30.h
	ld1h	z20.h, p7/z, [x14]
	add	x11, x11, 112
	str	z17, [x11]
	ld1h	z27.h, p7/z, [x13]
	add	x11, x14, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #22
	sub	z7.h, z20.h, z31.h
	add	z20.h, z20.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z20.h
	sub	z17.h, z20.h, z31.h
	str	z17, [x11]
	addvl	x11, sp, #23
	add	z31.h, z20.h, z31.h
	add	x11, x11, 112
	tbl	z30.h, {z31.h}, z3.h
	sub	z16.h, z31.h, z30.h
	str	z16, [x11]
	add	x11, x20, x6
	ld1h	z16.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #24
	sub	z30.h, z16.h, z31.h
	add	z16.h, z16.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z16.h
	sub	z13.h, z16.h, z31.h
	str	z13, [x11]
	addvl	x11, sp, #25
	add	z31.h, z16.h, z31.h
	add	x11, x11, 112
	tbl	z28.h, {z31.h}, z3.h
	sub	z12.h, z31.h, z28.h
	str	z12, [x11]
	add	x11, x10, 32
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, sp, #26
	rev	z31.h, z31.h
	ld1h	z17.h, p7/z, [x10]
	add	x11, x11, 112
	sub	z12.h, z17.h, z31.h
	add	z17.h, z17.h, z31.h
	rev	z31.h, z17.h
	sub	z11.h, z17.h, z31.h
	str	z11, [x11]
	addvl	x11, sp, #27
	add	z31.h, z17.h, z31.h
	tbl	z28.h, {z31.h}, z3.h
	add	x11, x11, 112
	sub	z10.h, z31.h, z28.h
	str	z10, [x11]
	add	x11, x13, 32
	ld1h	z31.h, p7/z, [x11]
	rev	z31.h, z31.h
	addvl	x11, sp, #28
	sub	z8.h, z27.h, z31.h
	add	z27.h, z27.h, z31.h
	add	x11, x11, 112
	rev	z31.h, z27.h
	sub	z10.h, z27.h, z31.h
	str	z10, [x11]
	addvl	x11, sp, #29
	add	z31.h, z27.h, z31.h
	add	x11, x11, 112
	tbl	z28.h, {z31.h}, z3.h
	sub	z9.h, z31.h, z28.h
	str	z9, [x11]
	add	x11, x7, 32
	ld1h	z31.h, p7/z, [x11]
	addvl	x11, sp, #30
	rev	z31.h, z31.h
	ld1h	z21.h, p7/z, [x7]
	add	x11, x11, 112
	sub	z9.h, z21.h, z31.h
	add	z21.h, z21.h, z31.h
	rev	z31.h, z21.h
	sub	z0.h, z21.h, z31.h
	str	z0, [x11]
	addvl	x11, sp, #31
	add	z31.h, z21.h, z31.h
	tbl	z28.h, {z31.h}, z3.h
	add	x11, x11, 112
	sub	z31.h, z31.h, z28.h
	str	z31, [x11]
	add	x11, x12, 32
	ld1h	z28.h, p7/z, [x11]
	rev	z28.h, z28.h
	cntb	x11
	ld1h	z18.h, p7/z, [x12]
	sub	z31.h, z18.h, z28.h
	lsl	x11, x11, 5
	add	z18.h, z18.h, z28.h
	rev	z28.h, z18.h
	add	x11, sp, x11
	sub	z19.h, z18.h, z28.h
	add	z28.h, z18.h, z28.h
	add	x11, x11, 112
	str	z19, [x11]
	tbl	z24.h, {z28.h}, z3.h
	addvl	x11, x21, #1
	sub	z13.h, z28.h, z24.h
	rdvl	x21, #17
	add	x11, x11, 112
	lsl	x21, x21, 1
	ld1h	z19.h, p7/z, [x5]
	add	x11, sp, x11
	str	z13, [x11]
	add	x11, x5, 32
	ld1h	z28.h, p7/z, [x11]
	rev	z28.h, z28.h
	rdvl	x11, #17
	sub	z13.h, z19.h, z28.h
	add	z19.h, z19.h, z28.h
	lsl	x11, x11, 1
	rev	z28.h, z19.h
	sub	z11.h, z19.h, z28.h
	add	x11, sp, x11
	add	z28.h, z19.h, z28.h
	tbl	z24.h, {z28.h}, z3.h
	add	x11, x11, 112
	str	z11, [x11]
	sub	z0.h, z28.h, z24.h
	addvl	x11, x21, #1
	cntb	x21, all, mul #9
	ld1h	z28.h, p7/z, [x9]
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	str	z0, [x11]
	add	x11, x9, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z24.h, z24.h
	cntb	x11, all, mul #9
	sub	z10.h, z28.h, z24.h
	add	z28.h, z28.h, z24.h
	lsl	x11, x11, 2
	rev	z24.h, z28.h
	sub	z0.h, z28.h, z24.h
	add	x11, sp, x11
	add	z24.h, z28.h, z24.h
	tbl	z22.h, {z24.h}, z3.h
	add	x11, x11, 112
	str	z0, [x11]
	sub	z11.h, z24.h, z22.h
	addvl	x11, x21, #1
	cntb	x21, all, mul #5
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	str	z11, [x11]
	ld1h	z22.h, p7/z, [x8]
	add	x11, x8, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z24.h, z24.h
	rdvl	x11, #19
	sub	z11.h, z22.h, z24.h
	add	z22.h, z22.h, z24.h
	lsl	x11, x11, 1
	rev	z24.h, z22.h
	sub	z0.h, z22.h, z24.h
	add	x11, sp, x11
	add	z24.h, z22.h, z24.h
	add	x11, x11, 112
	str	z0, [x11]
	tbl	z0.h, {z24.h}, z3.h
	addvl	x11, x21, #-1
	sub	z24.h, z24.h, z0.h
	add	x11, x11, 112
	add	x11, sp, x11
	str	z24, [x11]
	zip1	z24.d, z23.d, z2.d
	zip2	z23.d, z23.d, z2.d
	zip1	z2.d, z25.d, z1.d
	zip2	z25.d, z25.d, z1.d
	zip1	z0.d, z24.d, z2.d
	zip1	z1.d, z23.d, z25.d
	zip2	z24.d, z24.d, z2.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z1.d, p6/m, z1.d
// 0 "" 2
#NO_APP
	zip2	z23.d, z23.d, z25.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	saddlb	z2.s, z0.h, z23.h
	saddlb	z25.s, z24.h, z1.h
	saddlt	z23.s, z0.h, z23.h
	saddlt	z24.s, z24.h, z1.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z1.d, p6/m, z25.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z25.s, z2.s, z23.s
	zip1	z0.s, z24.s, z1.s
	zip2	z2.s, z2.s, z23.s
	add	z25.s, z25.s, z0.s
	zip2	z24.s, z24.s, z1.s
	add	z24.s, z2.s, z24.s
	uzp2	z23.d, z25.d, z24.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	uzp1	z25.d, z25.d, z24.d
	add	z24.s, z23.s, z25.s
	add	x11, x11, 112
	sub	z25.s, z25.s, z23.s
	ldr	z23, [x11]
	cntb	x11, all, mul #5
	rdvl	x21, #21
	mul	z24.s, p7/m, z24.s, z23.s
	lsl	x11, x11, 3
	lsl	x21, x21, 1
	uzp1	z23.s, z24.s, z24.s
	add	x11, sp, x11
	uzp2	z24.s, z24.s, z24.s
	sub	z2.s, z23.s, z24.s
	add	x11, x11, 112
	str	z2, [x11]
	add	z1.s, z23.s, z24.s
	addvl	x11, x21, #1
	ptrue	p5.s, all
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z0, [x11]
	movprfx	z2, z0
	mul	z2.s, p7/m, z2.s, z25.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z2.s, p5/m, z2.s, z2.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z24, [x11]
	mul	z25.s, p7/m, z25.s, z24.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	zip1	z24.d, z14.d, z26.d
	zip1	z23.d, z15.d, z20.d
	zip2	z26.d, z14.d, z26.d
	zip2	z20.d, z15.d, z20.d
	zip1	z15.d, z24.d, z23.d
	zip2	z23.d, z24.d, z23.d
	zip1	z24.d, z26.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z26.d, z26.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	saddlb	z20.s, z15.h, z26.h
	saddlt	z26.s, z15.h, z26.h
	saddlb	z15.s, z23.h, z24.h
	saddlt	z23.s, z23.h, z24.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z15.d, p6/m, z15.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	zip1	z24.s, z20.s, z26.s
	zip2	z20.s, z20.s, z26.s
	zip1	z14.s, z23.s, z15.s
	zip2	z23.s, z23.s, z15.s
	add	z24.s, z24.s, z14.s
	add	z23.s, z20.s, z23.s
	uzp2	z20.d, z24.d, z23.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	cntb	x21, all, mul #5
	addvl	x11, sp, #1
	uzp1	z24.d, z24.d, z23.d
	add	x11, x11, 112
	lsl	x21, x21, 3
	ldr	z14, [x11]
	addvl	x11, x21, #1
	add	z26.s, z20.s, z24.s
	sub	z24.s, z24.s, z20.s
	mul	z26.s, p7/m, z26.s, z14.s
	add	x11, x11, 112
	uzp1	z20.s, z26.s, z26.s
	uzp2	z26.s, z26.s, z26.s
	add	x11, sp, x11
	sub	z15.s, z20.s, z26.s
	add	z23.s, z20.s, z26.s
	movprfx	z26, z0
	mul	z26.s, p7/m, z26.s, z24.s
	str	z15, [x11]
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z26.s, p5/m, z26.s, z26.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z20, [x11]
	mul	z24.s, p7/m, z24.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	zip1	z15.d, z16.d, z27.d
	zip1	z20.d, z17.d, z21.d
	zip2	z27.d, z16.d, z27.d
	zip2	z21.d, z17.d, z21.d
	zip1	z16.d, z15.d, z20.d
	zip2	z20.d, z15.d, z20.d
	zip1	z15.d, z27.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z15.d, p6/m, z15.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	saddlb	z17.s, z16.h, z27.h
	saddlt	z27.s, z16.h, z27.h
	saddlb	z16.s, z20.h, z15.h
	saddlt	z20.s, z20.h, z15.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z16.d, p6/m, z16.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	zip1	z21.s, z17.s, z27.s
	zip2	z17.s, z17.s, z27.s
	zip1	z15.s, z20.s, z16.s
	zip2	z20.s, z20.s, z16.s
	add	z21.s, z21.s, z15.s
	add	z20.s, z17.s, z20.s
	uzp2	z17.d, z21.d, z20.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	uzp1	z21.d, z21.d, z20.d
	add	z27.s, z17.s, z21.s
	sub	z21.s, z21.s, z17.s
	mul	z27.s, p7/m, z27.s, z14.s
	movprfx	z20, z0
	mul	z20.s, p7/m, z20.s, z21.s
	uzp1	z17.s, z27.s, z27.s
	uzp2	z27.s, z27.s, z27.s
	add	z16.s, z17.s, z27.s
	sub	z17.s, z17.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	ldr	z27, [x11]
	mul	z21.s, p7/m, z21.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z21.s, p5/m, z21.s, z21.s
// 0 "" 2
#NO_APP
	zip1	z15.d, z18.d, z28.d
	zip1	z27.d, z19.d, z22.d
	zip2	z28.d, z18.d, z28.d
	zip2	z22.d, z19.d, z22.d
	zip1	z18.d, z15.d, z27.d
	zip2	z27.d, z15.d, z27.d
	zip1	z15.d, z28.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z15.d, p6/m, z15.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z19.s, z18.h, z28.h
	saddlt	z22.s, z27.h, z15.h
	saddlt	z28.s, z18.h, z28.h
	saddlb	z18.s, z27.h, z15.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z18.d, p6/m, z18.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	zip1	z27.s, z19.s, z28.s
	zip2	z19.s, z19.s, z28.s
	zip1	z15.s, z22.s, z18.s
	zip2	z22.s, z22.s, z18.s
	add	z27.s, z27.s, z15.s
	add	z22.s, z19.s, z22.s
	uzp2	z19.d, z27.d, z22.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	uzp1	z28.d, z27.d, z22.d
	add	z27.s, z19.s, z28.s
	sub	z28.s, z28.s, z19.s
	mul	z27.s, p7/m, z27.s, z14.s
	movprfx	z22, z0
	mul	z22.s, p7/m, z22.s, z28.s
	uzp1	z15.s, z27.s, z27.s
	uzp2	z27.s, z27.s, z27.s
	add	z14.s, z15.s, z27.s
	sub	z15.s, z15.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z22.s, p5/m, z22.s, z22.s
// 0 "" 2
#NO_APP
	ldr	z27, [x11]
	mul	z28.s, p7/m, z28.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	rdvl	x11, #21
	mov	z19.d, z23.d
	cntb	x21, all, mul #5
	lsl	x11, x11, 1
	uzp1	z27.s, z22.s, z22.s
	lsl	x21, x21, 3
	add	x11, sp, x11
	mov	z18.d, z1.d
	mov	z0.d, z16.d
	add	x11, x11, 112
	ldr	z23, [x11]
	tbl	z18.s, {z18.s - z19.s}, z23.s
	cntb	x11, all, mul #5
	uzp1	z19.s, z26.s, z26.s
	rshrnb	z18.h, z18.s, #4
	lsl	x11, x11, 3
	uzp1	z18.h, z18.h, z18.h
	uzp1	z26.s, z20.s, z20.s
	add	x11, sp, x11
	tbl	z26.s, {z26.s - z27.s}, z23.s
	rshrnb	z26.h, z26.s, #4
	add	x11, x11, 112
	uzp1	z26.h, z26.h, z26.h
	mov	z1.d, z14.d
	tbl	z0.s, {z0.s - z1.s}, z23.s
	rshrnb	z0.h, z0.s, #4
	uzp1	z0.h, z0.h, z0.h
	stp	q18, q0, [x1]
	uzp1	z18.s, z2.s, z2.s
	tbl	z18.s, {z18.s - z19.s}, z23.s
	rshrnb	z18.h, z18.s, #4
	uzp1	z18.h, z18.h, z18.h
	zip1	z16.d, z13.d, z11.d
	stp	q18, q26, [x1, 512]
	ldr	z26, [x11]
	addvl	x11, x21, #1
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z27, [x11]
	tbl	z26.s, {z26.s - z27.s}, z23.s
	addvl	x11, sp, #7
	rshrnb	z26.h, z26.s, #4
	uzp1	z26.h, z26.h, z26.h
	mov	z27.d, z15.d
	add	x11, x11, 112
	str	q26, [x1, 1024]
	mov	z26.d, z17.d
	tbl	z26.s, {z26.s - z27.s}, z23.s
	rshrnb	z26.h, z26.s, #4
	uzp1	z26.h, z26.h, z26.h
	uzp1	z27.s, z24.s, z24.s
	str	q26, [x1, 1040]
	uzp1	z26.s, z25.s, z25.s
	ldr	z25, [x11]
	tbl	z26.s, {z26.s - z27.s}, z23.s
	addvl	x11, sp, #4
	rshrnb	z26.h, z26.s, #4
	uzp1	z26.h, z26.h, z26.h
	uzp1	z27.s, z28.s, z28.s
	add	x11, x11, 112
	str	q26, [x1, 1536]
	uzp1	z26.s, z21.s, z21.s
	tbl	z26.s, {z26.s - z27.s}, z23.s
	rshrnb	z26.h, z26.s, #4
	uzp1	z26.h, z26.h, z26.h
	str	q26, [x1, 1552]
	zip1	z24.d, z29.d, z25.d
	ldr	z26, [x11]
	addvl	x11, sp, #10
	trn2	z21.d, z29.d, z25.d
	add	x11, x11, 112
	ldr	z14, [x11]
	zip1	z27.d, z26.d, z14.d
	addvl	x11, sp, #13
	zip1	z24.d, z24.d, z27.d
	trn2	z28.d, z26.d, z14.d
	add	x11, x11, 112
	trn1	z27.d, z26.d, z14.d
	ldr	z26, [x11]
	addvl	x11, sp, #19
	trn1	z29.d, z29.d, z25.d
	zip2	z29.d, z29.d, z27.d
	add	x11, x11, 112
	ldr	z18, [x11]
	trn2	z22.d, z26.d, z18.d
	addvl	x11, sp, #16
	zip1	z20.d, z26.d, z18.d
	zip1	z17.d, z30.d, z8.d
	add	x11, x11, 112
	ldr	z25, [x11]
	zip1	z27.d, z25.d, z7.d
	cntb	x11, all, mul #3
	zip1	z20.d, z20.d, z27.d
	trn1	z27.d, z26.d, z18.d
	lsl	x21, x11, 4
	trn1	z26.d, z25.d, z7.d
	zip2	z27.d, z27.d, z26.d
	sub	x11, x21, x11
	zip1	z26.d, z12.d, z9.d
	zip1	z18.d, z31.d, z10.d
	add	x11, x11, 112
	zip1	z17.d, z17.d, z26.d
	trn2	z26.d, z31.d, z10.d
	add	x11, sp, x11
	trn1	z31.d, z31.d, z10.d
	ldr	z10, [x11]
	cntb	x11, all, mul #11
	zip1	z23.d, z21.d, z28.d
	zip2	z21.d, z21.d, z28.d
	lsl	x11, x11, 2
	trn2	z28.d, z25.d, z7.d
	zip1	z19.d, z22.d, z28.d
	add	x11, sp, x11
	zip2	z22.d, z22.d, z28.d
	trn2	z28.d, z12.d, z9.d
	add	x11, x11, 112
	trn1	z12.d, z12.d, z9.d
	ldr	z9, [x11]
	rdvl	x11, #23
	cntb	x21, all, mul #3
	trn2	z25.d, z30.d, z8.d
	lsl	x11, x11, 1
	lsl	x21, x21, 4
	trn1	z30.d, z30.d, z8.d
	add	x11, sp, x11
	zip1	z15.d, z25.d, z28.d
	zip2	z25.d, z25.d, z28.d
	add	x11, x11, 112
	ldr	z8, [x11]
	trn2	z28.d, z13.d, z11.d
	addvl	x11, x21, #-1
	trn1	z13.d, z13.d, z11.d
	zip2	z30.d, z30.d, z12.d
	add	x11, x11, 112
	zip1	z18.d, z18.d, z16.d
	zip2	z31.d, z31.d, z13.d
	add	x11, sp, x11
	ldr	z7, [x11]
	zip1	z16.d, z26.d, z28.d
	add	x11, x1, 64
	zip2	z26.d, z26.d, z28.d
	movi	d28, #0
	movprfx	z14, z28
	sdot	z14.d, z23.h, z10.h[0]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z10.h[0]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z10.h[0]
	sdot	z14.d, z24.h, z9.h[0]
	sdot	z11.d, z20.h, z9.h[0]
	sdot	z14.d, z29.h, z8.h[0]
	sdot	z11.d, z27.h, z8.h[0]
	sdot	z14.d, z21.h, z7.h[0]
	sdot	z11.d, z22.h, z7.h[0]
	movprfx	z12, z28
	sdot	z12.d, z16.h, z10.h[0]
	sdot	z13.d, z17.h, z9.h[0]
	sdot	z12.d, z18.h, z9.h[0]
	sdot	z13.d, z30.h, z8.h[0]
	sdot	z12.d, z31.h, z8.h[0]
	sdot	z13.d, z25.h, z7.h[0]
	sdot	z12.d, z26.h, z7.h[0]
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 192
	movprfx	z14, z28
	sdot	z14.d, z23.h, z10.h[1]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z10.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z10.h[1]
	sdot	z14.d, z24.h, z9.h[1]
	sdot	z11.d, z20.h, z9.h[1]
	sdot	z14.d, z29.h, z8.h[1]
	sdot	z11.d, z27.h, z8.h[1]
	sdot	z14.d, z21.h, z7.h[1]
	sdot	z11.d, z22.h, z7.h[1]
	movprfx	z12, z28
	sdot	z12.d, z16.h, z10.h[1]
	sdot	z13.d, z17.h, z9.h[1]
	sdot	z12.d, z18.h, z9.h[1]
	sdot	z13.d, z30.h, z8.h[1]
	sdot	z12.d, z31.h, z8.h[1]
	sdot	z13.d, z25.h, z7.h[1]
	sdot	z12.d, z26.h, z7.h[1]
	uzp1	z14.s, z14.s, z11.s
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	cntb	x11, all, mul #3
	movprfx	z14, z28
	sdot	z14.d, z23.h, z5.h[0]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z5.h[0]
	lsl	x11, x11, 4
	movprfx	z13, z28
	sdot	z13.d, z15.h, z5.h[0]
	sdot	z14.d, z24.h, z6.h[0]
	add	x11, sp, x11
	sdot	z14.d, z29.h, z4.h[0]
	sdot	z11.d, z20.h, z6.h[0]
	add	x11, x11, 112
	ldr	z10, [x11]
	sdot	z11.d, z27.h, z4.h[0]
	add	x11, x1, 320
	sdot	z11.d, z22.h, z10.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	movprfx	z12, z28
	sdot	z12.d, z16.h, z5.h[0]
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z18.h, z6.h[0]
	sdot	z13.d, z17.h, z6.h[0]
	sdot	z12.d, z31.h, z4.h[0]
	sdot	z13.d, z30.h, z4.h[0]
	sdot	z12.d, z26.h, z10.h[0]
	sdot	z13.d, z25.h, z10.h[0]
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 448
	movprfx	z14, z28
	sdot	z14.d, z23.h, z5.h[1]
	movprfx	z11, z28
	sdot	z11.d, z19.h, z5.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z5.h[1]
	sdot	z14.d, z24.h, z6.h[1]
	sdot	z11.d, z20.h, z6.h[1]
	sdot	z14.d, z29.h, z4.h[1]
	sdot	z11.d, z27.h, z4.h[1]
	sdot	z14.d, z21.h, z10.h[1]
	sdot	z11.d, z22.h, z10.h[1]
	movprfx	z12, z28
	sdot	z12.d, z16.h, z5.h[1]
	uzp1	z14.s, z14.s, z11.s
	sdot	z12.d, z18.h, z6.h[1]
	sdot	z13.d, z17.h, z6.h[1]
	sdot	z12.d, z31.h, z4.h[1]
	sdot	z13.d, z30.h, z4.h[1]
	sdot	z12.d, z26.h, z10.h[1]
	sdot	z13.d, z25.h, z10.h[1]
	rshrnb	z14.h, z14.s, #4
	uzp1	z13.s, z13.s, z12.s
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 256
	ld1h	z10.h, p7/z, [x11]
	cntb	x21
	add	x11, x3, 512
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[0]
	add	x11, x3, 768
	ld1h	z11.h, p7/z, [x11]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[0]
	add	x11, x3, 1024
	ld1h	z12.h, p7/z, [x11]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[0]
	add	x11, x1, 576
	sdot	z14.d, z24.h, z10.h[0]
	sdot	z7.d, z20.h, z10.h[0]
	sdot	z14.d, z29.h, z11.h[0]
	sdot	z7.d, z27.h, z11.h[0]
	sdot	z14.d, z21.h, z12.h[0]
	sdot	z7.d, z22.h, z12.h[0]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[0]
	sdot	z13.d, z17.h, z10.h[0]
	sdot	z8.d, z18.h, z10.h[0]
	sdot	z13.d, z30.h, z11.h[0]
	sdot	z8.d, z31.h, z11.h[0]
	sdot	z13.d, z25.h, z12.h[0]
	sdot	z8.d, z26.h, z12.h[0]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 704
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[1]
	sdot	z14.d, z24.h, z10.h[1]
	sdot	z7.d, z20.h, z10.h[1]
	sdot	z14.d, z29.h, z11.h[1]
	sdot	z7.d, z27.h, z11.h[1]
	sdot	z14.d, z21.h, z12.h[1]
	sdot	z7.d, z22.h, z12.h[1]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[1]
	sdot	z13.d, z17.h, z10.h[1]
	sdot	z8.d, z18.h, z10.h[1]
	sdot	z13.d, z30.h, z11.h[1]
	sdot	z8.d, z31.h, z11.h[1]
	sdot	z13.d, z25.h, z12.h[1]
	sdot	z8.d, z26.h, z12.h[1]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 288
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 544
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[0]
	add	x11, x3, 800
	ld1h	z11.h, p7/z, [x11]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[0]
	add	x11, x3, 1056
	ld1h	z12.h, p7/z, [x11]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[0]
	add	x11, x1, 832
	sdot	z14.d, z24.h, z10.h[0]
	sdot	z7.d, z20.h, z10.h[0]
	sdot	z14.d, z29.h, z11.h[0]
	sdot	z7.d, z27.h, z11.h[0]
	sdot	z14.d, z21.h, z12.h[0]
	sdot	z7.d, z22.h, z12.h[0]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[0]
	sdot	z13.d, z17.h, z10.h[0]
	sdot	z8.d, z18.h, z10.h[0]
	sdot	z13.d, z30.h, z11.h[0]
	sdot	z8.d, z31.h, z11.h[0]
	sdot	z13.d, z25.h, z12.h[0]
	sdot	z8.d, z26.h, z12.h[0]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 960
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[1]
	sdot	z14.d, z24.h, z10.h[1]
	sdot	z7.d, z20.h, z10.h[1]
	sdot	z14.d, z29.h, z11.h[1]
	sdot	z7.d, z27.h, z11.h[1]
	sdot	z14.d, z21.h, z12.h[1]
	sdot	z7.d, z22.h, z12.h[1]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[1]
	sdot	z13.d, z17.h, z10.h[1]
	sdot	z8.d, z18.h, z10.h[1]
	sdot	z13.d, z30.h, z11.h[1]
	sdot	z8.d, z31.h, z11.h[1]
	sdot	z13.d, z25.h, z12.h[1]
	sdot	z8.d, z26.h, z12.h[1]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 320
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 576
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[0]
	add	x11, x3, 832
	ld1h	z11.h, p7/z, [x11]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[0]
	add	x11, x3, 1088
	ld1h	z12.h, p7/z, [x11]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[0]
	add	x11, x1, 1088
	sdot	z14.d, z24.h, z10.h[0]
	sdot	z7.d, z20.h, z10.h[0]
	sdot	z14.d, z29.h, z11.h[0]
	sdot	z7.d, z27.h, z11.h[0]
	sdot	z14.d, z21.h, z12.h[0]
	sdot	z7.d, z22.h, z12.h[0]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[0]
	sdot	z13.d, z17.h, z10.h[0]
	sdot	z8.d, z18.h, z10.h[0]
	sdot	z13.d, z30.h, z11.h[0]
	sdot	z8.d, z31.h, z11.h[0]
	sdot	z13.d, z25.h, z12.h[0]
	sdot	z8.d, z26.h, z12.h[0]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 1216
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[1]
	sdot	z14.d, z24.h, z10.h[1]
	sdot	z7.d, z20.h, z10.h[1]
	sdot	z14.d, z29.h, z11.h[1]
	sdot	z7.d, z27.h, z11.h[1]
	sdot	z14.d, z21.h, z12.h[1]
	sdot	z7.d, z22.h, z12.h[1]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[1]
	sdot	z13.d, z17.h, z10.h[1]
	sdot	z8.d, z18.h, z10.h[1]
	sdot	z13.d, z30.h, z11.h[1]
	sdot	z8.d, z31.h, z11.h[1]
	sdot	z13.d, z25.h, z12.h[1]
	sdot	z8.d, z26.h, z12.h[1]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 352
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 608
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[0]
	add	x11, x3, 864
	ld1h	z11.h, p7/z, [x11]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[0]
	add	x11, x3, 1120
	ld1h	z12.h, p7/z, [x11]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[0]
	add	x11, x1, 1344
	sdot	z14.d, z24.h, z10.h[0]
	sdot	z7.d, z20.h, z10.h[0]
	sdot	z14.d, z29.h, z11.h[0]
	sdot	z7.d, z27.h, z11.h[0]
	sdot	z14.d, z21.h, z12.h[0]
	sdot	z7.d, z22.h, z12.h[0]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[0]
	sdot	z13.d, z17.h, z10.h[0]
	sdot	z8.d, z18.h, z10.h[0]
	sdot	z13.d, z30.h, z11.h[0]
	sdot	z8.d, z31.h, z11.h[0]
	sdot	z13.d, z25.h, z12.h[0]
	sdot	z8.d, z26.h, z12.h[0]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 1472
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[1]
	sdot	z14.d, z24.h, z10.h[1]
	sdot	z7.d, z20.h, z10.h[1]
	sdot	z14.d, z29.h, z11.h[1]
	sdot	z7.d, z27.h, z11.h[1]
	sdot	z14.d, z21.h, z12.h[1]
	sdot	z7.d, z22.h, z12.h[1]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[1]
	sdot	z13.d, z17.h, z10.h[1]
	sdot	z8.d, z18.h, z10.h[1]
	sdot	z13.d, z30.h, z11.h[1]
	sdot	z8.d, z31.h, z11.h[1]
	sdot	z13.d, z25.h, z12.h[1]
	sdot	z8.d, z26.h, z12.h[1]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 384
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 640
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[0]
	add	x11, x3, 896
	ld1h	z11.h, p7/z, [x11]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[0]
	add	x11, x3, 1152
	ld1h	z12.h, p7/z, [x11]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[0]
	add	x11, x1, 1600
	sdot	z14.d, z24.h, z10.h[0]
	sdot	z7.d, z20.h, z10.h[0]
	sdot	z14.d, z29.h, z11.h[0]
	sdot	z7.d, z27.h, z11.h[0]
	sdot	z14.d, z21.h, z12.h[0]
	sdot	z7.d, z22.h, z12.h[0]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[0]
	sdot	z13.d, z17.h, z10.h[0]
	sdot	z8.d, z18.h, z10.h[0]
	sdot	z13.d, z30.h, z11.h[0]
	sdot	z8.d, z31.h, z11.h[0]
	sdot	z13.d, z25.h, z12.h[0]
	sdot	z8.d, z26.h, z12.h[0]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 1728
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[1]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[1]
	sdot	z14.d, z24.h, z10.h[1]
	sdot	z7.d, z20.h, z10.h[1]
	sdot	z14.d, z29.h, z11.h[1]
	sdot	z7.d, z27.h, z11.h[1]
	sdot	z14.d, z21.h, z12.h[1]
	sdot	z7.d, z22.h, z12.h[1]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[1]
	sdot	z13.d, z17.h, z10.h[1]
	sdot	z8.d, z18.h, z10.h[1]
	sdot	z13.d, z30.h, z11.h[1]
	sdot	z8.d, z31.h, z11.h[1]
	sdot	z13.d, z25.h, z12.h[1]
	sdot	z8.d, z26.h, z12.h[1]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x3, 416
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 672
	ld1h	z9.h, p7/z, [x11]
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[0]
	add	x11, x3, 928
	ld1h	z11.h, p7/z, [x11]
	movprfx	z7, z28
	sdot	z7.d, z19.h, z9.h[0]
	add	x11, x3, 1184
	ld1h	z12.h, p7/z, [x11]
	movprfx	z13, z28
	sdot	z13.d, z15.h, z9.h[0]
	add	x11, x1, 1856
	sdot	z14.d, z24.h, z10.h[0]
	sdot	z7.d, z20.h, z10.h[0]
	sdot	z14.d, z29.h, z11.h[0]
	sdot	z7.d, z27.h, z11.h[0]
	sdot	z14.d, z21.h, z12.h[0]
	sdot	z7.d, z22.h, z12.h[0]
	movprfx	z8, z28
	sdot	z8.d, z16.h, z9.h[0]
	sdot	z13.d, z17.h, z10.h[0]
	sdot	z8.d, z18.h, z10.h[0]
	sdot	z13.d, z30.h, z11.h[0]
	sdot	z8.d, z31.h, z11.h[0]
	sdot	z13.d, z25.h, z12.h[0]
	sdot	z8.d, z26.h, z12.h[0]
	uzp1	z14.s, z14.s, z7.s
	uzp1	z13.s, z13.s, z8.s
	rshrnb	z14.h, z14.s, #4
	rshrnb	z13.h, z13.s, #4
	uzp1	z14.h, z14.h, z13.h
	st1h	z14.h, p7, [x11]
	add	x11, x1, 1984
	movprfx	z14, z28
	sdot	z14.d, z23.h, z9.h[1]
	sdot	z14.d, z24.h, z10.h[1]
	sdot	z14.d, z29.h, z11.h[1]
	movprfx	z29, z28
	sdot	z29.d, z19.h, z9.h[1]
	sdot	z14.d, z21.h, z12.h[1]
	sdot	z29.d, z20.h, z10.h[1]
	sdot	z29.d, z27.h, z11.h[1]
	movprfx	z27, z28
	sdot	z27.d, z15.h, z9.h[1]
	sdot	z29.d, z22.h, z12.h[1]
	sdot	z27.d, z17.h, z10.h[1]
	uzp1	z14.s, z14.s, z29.s
	sdot	z27.d, z30.h, z11.h[1]
	rshrnb	z14.h, z14.s, #4
	sdot	z27.d, z25.h, z12.h[1]
	movprfx	z30, z28
	sdot	z30.d, z16.h, z9.h[1]
	sdot	z30.d, z18.h, z10.h[1]
	sdot	z30.d, z31.h, z11.h[1]
	sdot	z30.d, z26.h, z12.h[1]
	uzp1	z27.s, z27.s, z30.s
	rshrnb	z27.h, z27.s, #4
	uzp1	z14.h, z14.h, z27.h
	st1h	z14.h, p7, [x11]
	addvl	x11, sp, #2
	lsl	x21, x21, 5
	add	x11, x11, 112
	ldr	z29, [x11]
	add	x17, x17, x4
	addvl	x11, sp, #8
	add	x16, x16, x4
	add	x11, x11, 112
	ldr	z26, [x11]
	zip1	z31.d, z29.d, z26.d
	addvl	x11, sp, #5
	trn2	z29.d, z29.d, z26.d
	add	x15, x15, x4
	add	x11, x11, 112
	ldr	z27, [x11]
	add	x14, x14, x4
	addvl	x11, sp, #11
	add	x10, x10, x4
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z30.d, z27.d, z18.d
	zip1	z31.d, z31.d, z30.d
	mov	z30.d, z27.d
	ldr	z27, [x11]
	addvl	x11, sp, #14
	trn2	z30.d, z30.d, z27.d
	zip1	z30.d, z29.d, z30.d
	add	x11, x11, 112
	ldr	z26, [x11]
	add	x13, x13, x4
	addvl	x11, sp, #20
	add	x7, x7, x4
	add	x11, x11, 112
	ldr	z24, [x11]
	zip1	z29.d, z26.d, z24.d
	addvl	x11, sp, #17
	trn2	z26.d, z26.d, z24.d
	add	x12, x12, x4
	add	x11, x11, 112
	ldr	z25, [x11]
	add	x5, x5, x4
	addvl	x11, sp, #22
	add	x9, x9, x4
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z27.d, z25.d, z18.d
	zip1	z29.d, z29.d, z27.d
	mov	z27.d, z25.d
	ldr	z25, [x11]
	addvl	x11, sp, #24
	trn2	z27.d, z27.d, z25.d
	zip1	z26.d, z26.d, z27.d
	add	x11, x11, 112
	ldr	z24, [x11]
	add	x8, x8, x4
	addvl	x11, sp, #28
	add	x6, x6, x4
	add	x11, x11, 112
	ldr	z22, [x11]
	zip1	z25.d, z24.d, z22.d
	addvl	x11, sp, #26
	trn2	z24.d, z24.d, z22.d
	add	x11, x11, 112
	ldr	z23, [x11]
	addvl	x11, sp, #30
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z27.d, z23.d, z18.d
	zip1	z25.d, z25.d, z27.d
	mov	z27.d, z23.d
	ldr	z23, [x11]
	cntb	x11
	trn2	z27.d, z27.d, z23.d
	zip1	z24.d, z24.d, z27.d
	lsl	x11, x11, 5
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z22, [x11]
	cntb	x11, all, mul #9
	lsl	x11, x11, 2
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z20, [x11]
	zip1	z23.d, z22.d, z20.d
	rdvl	x11, #17
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z21, [x11]
	rdvl	x11, #19
	lsl	x11, x11, 1
	add	x11, sp, x11
	add	x11, x11, 112
	ldr	z18, [x11]
	zip1	z27.d, z21.d, z18.d
	add	x11, x3, 1216
	ld1h	z15.h, p7/z, [x11]
	zip1	z23.d, z23.d, z27.d
	add	x11, x3, 1344
	trn2	z27.d, z22.d, z20.d
	ld1h	z14.h, p7/z, [x11]
	trn2	z22.d, z21.d, z18.d
	add	x11, x1, 128
	zip1	z27.d, z27.d, z22.d
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[0]
	sdot	z19.d, z29.h, z15.h[0]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[0]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x1, 384
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[1]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[1]
	sdot	z19.d, z29.h, z15.h[1]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z20.d, z23.h, z15.h[1]
	sdot	z21.d, z25.h, z15.h[1]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 1248
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1376
	ld1h	z14.h, p7/z, [x11]
	add	x11, x1, 640
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[0]
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[0]
	sdot	z19.d, z29.h, z15.h[0]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x1, 896
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[1]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[1]
	sdot	z19.d, z29.h, z15.h[1]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z20.d, z23.h, z15.h[1]
	sdot	z21.d, z25.h, z15.h[1]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 1280
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1408
	ld1h	z14.h, p7/z, [x11]
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[0]
	add	x11, x1, 1152
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[0]
	sdot	z19.d, z29.h, z15.h[0]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x1, 1408
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[1]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[1]
	sdot	z19.d, z29.h, z15.h[1]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z20.d, z23.h, z15.h[1]
	sdot	z21.d, z25.h, z15.h[1]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x3, 1312
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1440
	ld1h	z14.h, p7/z, [x11]
	add	x11, x1, 1664
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[0]
	movprfx	z19, z28
	sdot	z19.d, z26.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z19.d, z29.h, z15.h[0]
	movprfx	z21, z28
	sdot	z21.d, z24.h, z14.h[0]
	movprfx	z20, z28
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x11]
	add	x11, x1, 1920
	movprfx	z22, z28
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z30, z28
	sdot	z30.d, z24.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z30.d, z25.h, z15.h[1]
	movprfx	z31, z28
	sdot	z31.d, z26.h, z14.h[1]
	sdot	z31.d, z29.h, z15.h[1]
	movprfx	z29, z28
	sdot	z29.d, z27.h, z14.h[1]
	uzp1	z22.s, z22.s, z31.s
	sdot	z29.d, z23.h, z15.h[1]
	rshrnb	z22.h, z22.s, #4
	uzp1	z30.s, z30.s, z29.s
	rshrnb	z30.h, z30.s, #4
	uzp1	z22.h, z22.h, z30.h
	st1h	z22.h, p7, [x11]
	addvl	x11, sp, #3
	add	x11, x11, 112
	ldr	z30, [x11]
	addvl	x11, sp, #9
	add	x11, x11, 112
	ldr	z29, [x11]
	zip1	z27.d, z30.d, z29.d
	addvl	x11, sp, #6
	add	x11, x11, 112
	ldr	z30, [x11]
	addvl	x11, sp, #12
	add	x11, x11, 112
	ldr	z29, [x11]
	zip1	z31.d, z30.d, z29.d
	addvl	x11, sp, #15
	zip1	z27.d, z27.d, z31.d
	add	x11, x11, 112
	ldr	z30, [x11]
	addvl	x11, sp, #21
	add	x11, x11, 112
	ldr	z29, [x11]
	zip1	z29.d, z30.d, z29.d
	addvl	x11, sp, #18
	add	x11, x11, 112
	ldr	z30, [x11]
	addvl	x11, sp, #23
	add	x11, x11, 112
	ldr	z26, [x11]
	zip1	z31.d, z30.d, z26.d
	addvl	x11, sp, #25
	zip1	z29.d, z29.d, z31.d
	add	x11, x11, 112
	ldr	z30, [x11]
	addvl	x11, sp, #29
	add	x11, x11, 112
	ldr	z26, [x11]
	zip1	z30.d, z30.d, z26.d
	addvl	x11, sp, #27
	add	x11, x11, 112
	ldr	z26, [x11]
	addvl	x11, sp, #31
	add	x11, x11, 112
	ldr	z31, [x11]
	zip1	z31.d, z26.d, z31.d
	addvl	x11, x21, #1
	cntb	x21, all, mul #9
	zip1	z30.d, z30.d, z31.d
	add	x11, x11, 112
	lsl	x21, x21, 2
	add	x11, sp, x11
	ldr	z31, [x11]
	addvl	x11, x21, #1
	rdvl	x21, #17
	add	x11, x11, 112
	lsl	x21, x21, 1
	add	x11, sp, x11
	ldr	z26, [x11]
	zip1	z31.d, z31.d, z26.d
	addvl	x11, x21, #1
	cntb	x21, all, mul #5
	add	x11, x11, 112
	lsl	x21, x21, 3
	add	x11, sp, x11
	ldr	z26, [x11]
	addvl	x11, x21, #-1
	add	x11, x11, 112
	add	x11, sp, x11
	ldr	z25, [x11]
	zip1	z26.d, z26.d, z25.d
	add	x11, x3, 1472
	ld1h	z15.h, p7/z, [x11]
	zip1	z31.d, z31.d, z26.d
	add	x11, x1, 256
	movprfx	z23, z28
	sdot	z23.d, z29.h, z15.h[0]
	movprfx	z24, z28
	sdot	z24.d, z31.h, z15.h[0]
	movprfx	z26, z28
	sdot	z26.d, z27.h, z15.h[0]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z15.h[0]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x1, 768
	movprfx	z23, z28
	sdot	z23.d, z29.h, z15.h[1]
	movprfx	z24, z28
	sdot	z24.d, z31.h, z15.h[1]
	movprfx	z26, z28
	sdot	z26.d, z27.h, z15.h[1]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z15.h[1]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x3, 1504
	ld1h	z15.h, p7/z, [x11]
	add	x11, x1, 1280
	movprfx	z26, z28
	sdot	z26.d, z27.h, z15.h[0]
	movprfx	z23, z28
	sdot	z23.d, z29.h, z15.h[0]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z15.h[0]
	movprfx	z24, z28
	sdot	z24.d, z31.h, z15.h[0]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x1, 1792
	movprfx	z26, z28
	sdot	z26.d, z27.h, z15.h[1]
	add	x1, x1, 32
	movprfx	z27, z28
	sdot	z27.d, z29.h, z15.h[1]
	movprfx	z29, z28
	sdot	z29.d, z30.h, z15.h[1]
	sdot	z28.d, z31.h, z15.h[1]
	uzp1	z31.s, z26.s, z27.s
	uzp1	z30.s, z29.s, z28.s
	rshrnb	z31.h, z31.s, #4
	rshrnb	z30.h, z30.s, #4
	uzp1	z31.h, z31.h, z30.h
	st1h	z31.h, p7, [x11]
	cmp	x19, x1
	bne	.L2
	mov	x13, 49
	cntb	x12
	ldr	x21, [sp, 32]
	mul	x12, x12, x13
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 48]
	ldp	d10, d11, [sp, 64]
	ldp	d12, d13, [sp, 80]
	ldp	d14, d15, [sp, 96]
	.cfi_restore 21
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
	mov	x13, 65
	ptrue	p7.b, all
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	ptrue	p6.d, all
	mul	x12, x12, x13
	add	x3, x2, 32
	ld1h	z5.h, p7/z, [x3]
	add	x3, x2, 64
	ld1w	z31.s, p7/z, [x3]
	cntb	x5, all, mul #7
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0x8,0x2,0x1e,0x22
	lsl	x5, x5, 3
	ld1w	z0.s, p7/z, [x2]
	sub	sp, sp, #64
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0x8,0x2,0x1e,0x23,0x40,0x22
	add	x4, x0, 2048
	mov	z6.d, z5.d
	addvl	x3, sp, #1
	add	x3, x3, 64
	stp	d8, d9, [sp]
	stp	d10, d11, [sp, 16]
	stp	d12, d13, [sp, 32]
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
	add	x3, x2, 96
	ld1w	z31.s, p7/z, [x3]
	addvl	x3, sp, #2
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 160
	ld1w	z31.s, p7/z, [x3]
	addvl	x3, sp, #3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 192
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #15
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 448
	ld1h	z31.h, p7/z, [x3]
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 704
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #-1
	cntb	x5, all, mul #15
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 960
	ld1h	z31.h, p7/z, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 224
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #1
	cntb	x5
	add	x3, x3, 64
	lsl	x5, x5, 6
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 480
	ld1h	z31.h, p7/z, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 736
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x5, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 992
	ld1h	z31.h, p7/z, [x3]
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
.L7:
	add	x3, x0, 32
	ld1h	z10.h, p7/z, [x3]
	ld1h	z21.h, p7/z, [x0]
	addvl	x3, sp, #20
	rev	z10.h, z10.h
	add	z31.h, z21.h, z10.h
	add	x3, x3, 64
	rev	z30.h, z31.h
	sub	z28.h, z31.h, z30.h
	str	z28, [x3]
	addvl	x3, sp, #21
	add	z31.h, z31.h, z30.h
	add	x3, x3, 64
	tbl	z30.h, {z31.h}, z6.h
	sub	z31.h, z31.h, z30.h
	str	z31, [x3]
	add	x3, x0, 64
	ld1h	z17.h, p7/z, [x3]
	add	x3, x0, 96
	ld1h	z22.h, p7/z, [x3]
	rev	z22.h, z22.h
	addvl	x3, sp, #22
	add	z31.h, z17.h, z22.h
	rev	z30.h, z31.h
	add	x3, x3, 64
	sub	z27.h, z31.h, z30.h
	str	z27, [x3]
	addvl	x3, sp, #23
	add	z31.h, z31.h, z30.h
	tbl	z30.h, {z31.h}, z6.h
	add	x3, x3, 64
	sub	z30.h, z31.h, z30.h
	str	z30, [x3]
	add	x3, x0, 128
	ld1h	z1.h, p7/z, [x3]
	cntb	x5
	add	x3, x0, 160
	ld1h	z26.h, p7/z, [x3]
	rev	z26.h, z26.h
	addvl	x3, sp, #24
	add	z31.h, z1.h, z26.h
	rev	z30.h, z31.h
	add	x3, x3, 64
	sub	z29.h, z31.h, z30.h
	str	z29, [x3]
	addvl	x3, sp, #25
	add	z31.h, z31.h, z30.h
	tbl	z30.h, {z31.h}, z6.h
	add	x3, x3, 64
	sub	z25.h, z31.h, z30.h
	str	z25, [x3]
	add	x3, x0, 192
	ld1h	z2.h, p7/z, [x3]
	lsl	x5, x5, 5
	add	x3, x0, 224
	ld1h	z11.h, p7/z, [x3]
	rev	z11.h, z11.h
	addvl	x3, sp, #26
	add	z31.h, z2.h, z11.h
	rev	z30.h, z31.h
	add	x3, x3, 64
	sub	z25.h, z31.h, z30.h
	str	z25, [x3]
	addvl	x3, sp, #27
	add	z31.h, z31.h, z30.h
	tbl	z30.h, {z31.h}, z6.h
	add	x3, x3, 64
	sub	z24.h, z31.h, z30.h
	str	z24, [x3]
	add	x3, x0, 256
	ld1h	z3.h, p7/z, [x3]
	add	x3, x0, 288
	ld1h	z12.h, p7/z, [x3]
	rev	z12.h, z12.h
	addvl	x3, sp, #28
	add	z30.h, z3.h, z12.h
	rev	z31.h, z30.h
	add	x3, x3, 64
	sub	z24.h, z30.h, z31.h
	str	z24, [x3]
	addvl	x3, sp, #29
	add	z31.h, z30.h, z31.h
	tbl	z30.h, {z31.h}, z6.h
	add	x3, x3, 64
	sub	z23.h, z31.h, z30.h
	str	z23, [x3]
	add	x3, x0, 320
	ld1h	z18.h, p7/z, [x3]
	add	x3, x0, 352
	ld1h	z24.h, p7/z, [x3]
	rev	z24.h, z24.h
	addvl	x3, sp, #30
	add	z30.h, z18.h, z24.h
	rev	z31.h, z30.h
	add	x3, x3, 64
	sub	z23.h, z30.h, z31.h
	str	z23, [x3]
	addvl	x3, sp, #31
	add	z31.h, z30.h, z31.h
	tbl	z30.h, {z31.h}, z6.h
	add	x3, x3, 64
	sub	z20.h, z31.h, z30.h
	str	z20, [x3]
	add	x3, x0, 384
	ld1h	z23.h, p7/z, [x3]
	add	x3, x0, 416
	ld1h	z27.h, p7/z, [x3]
	rev	z27.h, z27.h
	cntb	x3
	add	z30.h, z23.h, z27.h
	rev	z31.h, z30.h
	lsl	x3, x3, 5
	sub	z20.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	add	x3, sp, x3
	tbl	z30.h, {z31.h}, z6.h
	sub	z19.h, z31.h, z30.h
	add	x3, x3, 64
	str	z20, [x3]
	addvl	x3, x5, #1
	rdvl	x5, #17
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	str	z19, [x3]
	add	x3, x0, 448
	ld1h	z4.h, p7/z, [x3]
	add	x3, x0, 480
	ld1h	z13.h, p7/z, [x3]
	rev	z13.h, z13.h
	rdvl	x3, #17
	add	z30.h, z4.h, z13.h
	rev	z31.h, z30.h
	lsl	x3, x3, 1
	sub	z19.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	add	x3, sp, x3
	tbl	z30.h, {z31.h}, z6.h
	sub	z16.h, z31.h, z30.h
	add	x3, x3, 64
	str	z19, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #9
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	str	z16, [x3]
	add	x3, x0, 512
	ld1h	z5.h, p7/z, [x3]
	add	x3, x0, 544
	ld1h	z14.h, p7/z, [x3]
	rev	z14.h, z14.h
	cntb	x3, all, mul #9
	add	z30.h, z5.h, z14.h
	rev	z31.h, z30.h
	lsl	x3, x3, 2
	sub	z16.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	add	x3, sp, x3
	tbl	z30.h, {z31.h}, z6.h
	sub	z15.h, z31.h, z30.h
	add	x3, x3, 64
	str	z16, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #5
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	str	z15, [x3]
	add	x3, x0, 576
	ld1h	z19.h, p7/z, [x3]
	add	x3, x0, 608
	ld1h	z25.h, p7/z, [x3]
	rev	z25.h, z25.h
	rdvl	x3, #19
	add	z30.h, z19.h, z25.h
	rev	z31.h, z30.h
	lsl	x3, x3, 1
	sub	z15.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	add	x3, sp, x3
	tbl	z30.h, {z31.h}, z6.h
	sub	z9.h, z31.h, z30.h
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, x5, #-1
	cntb	x5, all, mul #5
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	str	z9, [x3]
	add	x3, x0, 640
	ld1h	z31.h, p7/z, [x3]
	add	x3, x0, 672
	ld1h	z28.h, p7/z, [x3]
	rev	z28.h, z28.h
	addvl	x3, sp, #6
	add	z29.h, z31.h, z28.h
	add	x3, x3, 64
	str	z31, [x3]
	rev	z31.h, z29.h
	cntb	x3, all, mul #5
	sub	z9.h, z29.h, z31.h
	add	z31.h, z29.h, z31.h
	lsl	x3, x3, 3
	tbl	z29.h, {z31.h}, z6.h
	sub	z8.h, z31.h, z29.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z9, [x3]
	addvl	x3, x5, #1
	rdvl	x5, #21
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	str	z8, [x3]
	add	x3, x0, 704
	ld1h	z31.h, p7/z, [x3]
	add	x3, x0, 736
	ld1h	z15.h, p7/z, [x3]
	rev	z15.h, z15.h
	addvl	x3, sp, #7
	add	z29.h, z31.h, z15.h
	add	x3, x3, 64
	str	z31, [x3]
	rev	z31.h, z29.h
	rdvl	x3, #21
	sub	z8.h, z29.h, z31.h
	add	z31.h, z29.h, z31.h
	lsl	x3, x3, 1
	tbl	z29.h, {z31.h}, z6.h
	sub	z7.h, z31.h, z29.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z8, [x3]
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z7, [x3]
	add	x3, x0, 768
	ld1h	z7.h, p7/z, [x3]
	add	x3, x0, 800
	ld1h	z31.h, p7/z, [x3]
	rev	z29.h, z31.h
	addvl	x3, sp, #4
	add	x3, x3, 64
	str	z29, [x3]
	add	z29.h, z7.h, z29.h
	cntb	x3, all, mul #11
	rev	z31.h, z29.h
	sub	z20.h, z29.h, z31.h
	lsl	x3, x3, 2
	add	z31.h, z29.h, z31.h
	tbl	z29.h, {z31.h}, z6.h
	add	x3, sp, x3
	sub	z30.h, z31.h, z29.h
	add	x3, x3, 64
	str	z20, [x3]
	cntb	x3, all, mul #3
	lsl	x5, x3, 4
	sub	x3, x5, x3
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	str	z30, [x3]
	add	x3, x0, 832
	ld1h	z20.h, p7/z, [x3]
	add	x3, x0, 864
	ld1h	z31.h, p7/z, [x3]
	rev	z16.h, z31.h
	addvl	x3, sp, #5
	add	z29.h, z20.h, z16.h
	rev	z31.h, z29.h
	add	x3, x3, 64
	str	z16, [x3]
	sub	z9.h, z29.h, z31.h
	rdvl	x3, #23
	add	z31.h, z29.h, z31.h
	tbl	z29.h, {z31.h}, z6.h
	lsl	x3, x3, 1
	sub	z30.h, z31.h, z29.h
	add	x3, sp, x3
	add	x3, x3, 64
	str	z9, [x3]
	addvl	x3, x5, #-1
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	str	z30, [x3]
	add	x3, x0, 896
	ld1h	z31.h, p7/z, [x3]
	add	x3, x0, 928
	ld1h	z29.h, p7/z, [x3]
	rev	z29.h, z29.h
	cntb	x3, all, mul #3
	add	z9.h, z31.h, z29.h
	rev	z16.h, z9.h
	lsl	x3, x3, 4
	sub	z8.h, z9.h, z16.h
	add	z16.h, z9.h, z16.h
	add	x3, sp, x3
	tbl	z9.h, {z16.h}, z6.h
	sub	z30.h, z16.h, z9.h
	add	x3, x3, 64
	str	z8, [x3]
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	add	x3, x0, 960
	ld1h	z8.h, p7/z, [x3]
	add	x3, x0, 992
	ld1h	z16.h, p7/z, [x3]
	rev	z16.h, z16.h
	add	x3, sp, 64
	add	z9.h, z8.h, z16.h
	rev	z30.h, z9.h
	str	z30, [x3]
	rdvl	x3, #25
	sub	z30.h, z9.h, z30.h
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, sp, 64
	ldr	z30, [x3]
	add	z9.h, z9.h, z30.h
	cntb	x3, all, mul #3
	tbl	z30.h, {z9.h}, z6.h
	sub	z9.h, z9.h, z30.h
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z9, [x3]
	zip1	z9.d, z21.d, z1.d
	zip2	z21.d, z21.d, z1.d
	zip1	z1.d, z17.d, z2.d
	zip2	z17.d, z17.d, z2.d
	zip1	z2.d, z9.d, z1.d
	zip2	z1.d, z9.d, z1.d
	zip1	z9.d, z21.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z9.d, p6/m, z9.d
// 0 "" 2
#NO_APP
	zip2	z21.d, z21.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z17.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip1	z21.d, z10.d, z26.d
	add	x3, sp, 64
	zip2	z26.d, z10.d, z26.d
	str	z17, [x3]
	zip1	z17.d, z22.d, z11.d
	zip2	z22.d, z22.d, z11.d
	zip2	z10.d, z21.d, z17.d
	zip1	z11.d, z21.d, z17.d
	zip1	z21.d, z26.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	mov	z30.d, z21.d
	zip2	z26.d, z26.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	ldr	z17, [x3]
	addvl	x3, sp, #8
	mov	z22.d, z26.d
	add	x3, x3, 64
	saddlb	z26.s, z17.h, z26.h
	saddlb	z21.s, z2.h, z11.h
	add	z21.s, z21.s, z26.s
	str	z2, [x3]
	ldr	z26, [x3]
	addvl	x3, sp, #11
	add	x3, x3, 64
	str	z11, [x3]
	ldr	z11, [x3]
	addvl	x3, sp, #14
	saddlt	z11.s, z26.h, z11.h
	saddlt	z26.s, z17.h, z22.h
	add	x3, x3, 64
	str	z22, [x3]
	saddlb	z17.s, z1.h, z10.h
	addvl	x3, sp, #9
	add	z11.s, z11.s, z26.s
	saddlb	z26.s, z9.h, z30.h
	add	x3, x3, 64
	str	z1, [x3]
	ldr	z1, [x3]
	addvl	x3, sp, #12
	add	z17.s, z17.s, z26.s
	saddlt	z22.s, z9.h, z30.h
	add	x3, x3, 64
	str	z10, [x3]
	ldr	z10, [x3]
	addvl	x3, sp, #10
	saddlt	z26.s, z1.h, z10.h
	add	z22.s, z26.s, z22.s
	add	x3, x3, 64
	str	z9, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	str	z30, [x3]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z21.s, z11.s
	zip2	z21.s, z21.s, z11.s
	zip1	z10.s, z22.s, z17.s
	zip2	z22.s, z22.s, z17.s
	add	z26.s, z26.s, z10.s
	add	z22.s, z21.s, z22.s
	uzp2	z21.d, z26.d, z22.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	cntb	x5, all, mul #13
	uzp1	z26.d, z26.d, z22.d
	add	x3, x3, 64
	ldr	z2, [x3]
	lsl	x5, x5, 2
	cntb	x3, all, mul #13
	add	z22.s, z21.s, z26.s
	sub	z26.s, z26.s, z21.s
	lsl	x3, x3, 2
	mul	z22.s, p7/m, z22.s, z2.s
	uzp1	z21.s, z22.s, z22.s
	add	x3, sp, x3
	uzp2	z22.s, z22.s, z22.s
	add	z11.s, z21.s, z22.s
	add	x3, x3, 64
	str	z11, [x3]
	sub	z10.s, z21.s, z22.s
	addvl	x3, x5, #1
	ptrue	p5.s, all
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z9, [x3]
	movprfx	z17, z9
	mul	z17.s, p7/m, z17.s, z26.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z17.s, p5/m, z17.s, z17.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z1, [x3]
	movprfx	z10, z26
	mul	z10.s, p7/m, z10.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z10.s, p5/m, z10.s, z10.s
// 0 "" 2
#NO_APP
	zip1	z26.d, z3.d, z23.d
	zip1	z22.d, z18.d, z4.d
	zip2	z23.d, z3.d, z23.d
	zip2	z18.d, z18.d, z4.d
	zip1	z21.d, z26.d, z22.d
	zip2	z4.d, z26.d, z22.d
	zip1	z26.d, z23.d, z18.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z3.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	zip2	z23.d, z23.d, z18.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	zip1	z26.d, z12.d, z27.d
	mov	z18.d, z23.d
	zip2	z27.d, z12.d, z27.d
	zip1	z23.d, z24.d, z13.d
	zip2	z24.d, z24.d, z13.d
	zip2	z12.d, z26.d, z23.d
	zip1	z13.d, z26.d, z23.d
	zip1	z11.d, z27.d, z24.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z11.d, p6/m, z11.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z24.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	saddlb	z26.s, z18.h, z27.h
	saddlb	z23.s, z21.h, z13.h
	add	x3, x3, 64
	add	z23.s, z23.s, z26.s
	str	z21, [x3]
	ldr	z26, [x3]
	addvl	x3, sp, #19
	saddlb	z22.s, z4.h, z12.h
	add	x3, x3, 64
	str	z13, [x3]
	ldr	z13, [x3]
	addvl	x3, sp, #18
	saddlt	z21.s, z26.h, z13.h
	saddlt	z26.s, z18.h, z27.h
	add	x3, x3, 64
	str	z18, [x3]
	add	z21.s, z21.s, z26.s
	addvl	x3, sp, #16
	saddlb	z26.s, z3.h, z11.h
	saddlt	z24.s, z3.h, z11.h
	add	x3, x3, 64
	str	z4, [x3]
	ldr	z4, [x3]
	addvl	x3, sp, #17
	add	z22.s, z22.s, z26.s
	saddlt	z26.s, z4.h, z12.h
	add	x3, x3, 64
	add	z24.s, z26.s, z24.s
	str	z3, [x3]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z23.s, z21.s
	zip2	z23.s, z23.s, z21.s
	zip1	z18.s, z24.s, z22.s
	zip2	z24.s, z24.s, z22.s
	add	z26.s, z26.s, z18.s
	add	z24.s, z23.s, z24.s
	uzp2	z23.d, z26.d, z24.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	uzp1	z18.d, z26.d, z24.d
	add	z26.s, z23.s, z18.s
	lsl	x3, x3, 1
	mul	z26.s, p7/m, z26.s, z2.s
	uzp1	z24.s, z26.s, z26.s
	add	x3, sp, x3
	uzp2	z26.s, z26.s, z26.s
	add	z4.s, z24.s, z26.s
	add	x3, x3, 64
	str	z4, [x3]
	sub	z13.s, z24.s, z26.s
	cntb	x3, all, mul #11
	sub	z18.s, z18.s, z23.s
	mov	z4.d, z9.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	movprfx	z13, z9
	mul	z13.s, p7/m, z13.s, z18.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z13.s, p5/m, z13.s, z13.s
// 0 "" 2
#NO_APP
	mul	z18.s, p7/m, z18.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z18.s, p5/m, z18.s, z18.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z30, [x3]
	zip1	z9.d, z5.d, z30.d
	addvl	x3, sp, #7
	zip2	z30.d, z5.d, z30.d
	add	x3, x3, 64
	ldr	z5, [x3]
	zip1	z26.d, z19.d, z5.d
	zip2	z19.d, z19.d, z5.d
	zip1	z5.d, z9.d, z26.d
	zip1	z24.d, z30.d, z19.d
	zip2	z9.d, z9.d, z26.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z19.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z23.d, z14.d, z28.d
	zip1	z26.d, z25.d, z15.d
	zip2	z28.d, z14.d, z28.d
	zip2	z25.d, z25.d, z15.d
	zip1	z21.d, z23.d, z26.d
	zip1	z14.d, z28.d, z25.d
	zip2	z23.d, z23.d, z26.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z14.d, p6/m, z14.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z25.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z26.s, z30.h, z28.h
	saddlb	z22.s, z5.h, z21.h
	addvl	x3, sp, #6
	add	z22.s, z22.s, z26.s
	saddlt	z26.s, z30.h, z28.h
	add	x3, x3, 64
	str	z5, [x3]
	ldr	z5, [x3]
	saddlt	z5.s, z5.h, z21.h
	add	z5.s, z5.s, z26.s
	saddlb	z26.s, z24.h, z14.h
	saddlb	z15.s, z9.h, z23.h
	saddlt	z25.s, z24.h, z14.h
	add	z15.s, z15.s, z26.s
	saddlt	z26.s, z9.h, z23.h
	add	z25.s, z26.s, z25.s
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z15.d, p6/m, z15.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	zip1	z26.s, z22.s, z5.s
	zip2	z22.s, z22.s, z5.s
	zip1	z19.s, z25.s, z15.s
	zip2	z25.s, z25.s, z15.s
	add	z26.s, z26.s, z19.s
	add	z25.s, z22.s, z25.s
	uzp2	z22.d, z26.d, z25.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	uzp1	z19.d, z26.d, z25.d
	add	z26.s, z22.s, z19.s
	add	x3, x3, 64
	mul	z26.s, p7/m, z26.s, z2.s
	uzp1	z25.s, z26.s, z26.s
	uzp2	z26.s, z26.s, z26.s
	add	z15.s, z25.s, z26.s
	str	z15, [x3]
	cntb	x3, all, mul #7
	sub	z19.s, z19.s, z22.s
	sub	z5.s, z25.s, z26.s
	lsl	x3, x3, 3
	movprfx	z15, z4
	mul	z15.s, p7/m, z15.s, z19.s
	add	x3, sp, x3
	add	x3, x3, 64
	str	z5, [x3]
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z15.s, p5/m, z15.s, z15.s
// 0 "" 2
#NO_APP
	mul	z19.s, p7/m, z19.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	zip1	z26.d, z7.d, z31.d
	zip1	z25.d, z20.d, z8.d
	zip2	z31.d, z7.d, z31.d
	zip2	z20.d, z20.d, z8.d
	zip1	z7.d, z26.d, z25.d
	zip2	z8.d, z26.d, z25.d
	zip1	z26.d, z31.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z5, [x3]
	zip1	z25.d, z5.d, z29.d
	addvl	x3, sp, #5
	zip2	z29.d, z5.d, z29.d
	add	x3, x3, 64
	ldr	z22, [x3]
	zip1	z5.d, z22.d, z16.d
	zip2	z20.d, z22.d, z16.d
	zip1	z22.d, z25.d, z5.d
	zip1	z2.d, z29.d, z20.d
	zip2	z25.d, z25.d, z5.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z2.d, p6/m, z2.d
// 0 "" 2
#NO_APP
	zip2	z29.d, z29.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	saddlb	z20.s, z31.h, z29.h
	saddlb	z5.s, z7.h, z22.h
	add	z5.s, z5.s, z20.s
	saddlt	z20.s, z31.h, z29.h
	saddlt	z3.s, z7.h, z22.h
	add	z3.s, z3.s, z20.s
	saddlb	z20.s, z26.h, z2.h
	saddlb	z4.s, z8.h, z25.h
	saddlt	z16.s, z26.h, z2.h
	add	z4.s, z4.s, z20.s
	saddlt	z20.s, z8.h, z25.h
	add	z16.s, z20.s, z16.s
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z4.d, p6/m, z4.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z16.d, p6/m, z16.d
// 0 "" 2
#NO_APP
	zip1	z20.s, z5.s, z3.s
	zip2	z5.s, z5.s, z3.s
	zip1	z1.s, z16.s, z4.s
	zip2	z16.s, z16.s, z4.s
	add	z20.s, z20.s, z1.s
	add	z16.s, z5.s, z16.s
	uzp2	z5.d, z20.d, z16.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z5.d, p6/m, z5.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	uzp1	z20.d, z20.d, z16.d
	add	z16.s, z5.s, z20.s
	add	x3, x3, 64
	sub	z20.s, z20.s, z5.s
	ldr	z5, [x3]
	addvl	x3, sp, #4
	mul	z16.s, p7/m, z16.s, z5.s
	uzp1	z1.s, z16.s, z16.s
	add	x3, x3, 64
	uzp2	z16.s, z16.s, z16.s
	add	z5.s, z1.s, z16.s
	str	z5, [x3]
	addvl	x3, sp, #2
	sub	z1.s, z1.s, z16.s
	add	x3, x3, 64
	ldr	z3, [x3]
	mul	z3.s, p7/m, z3.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z3.s, p5/m, z3.s, z3.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z16, [x3]
	mul	z20.s, p7/m, z20.s, z16.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	cntb	x5, all, mul #13
	lsl	x3, x3, 2
	lsl	x5, x5, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z4, [x3]
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z5, [x3]
	tbl	z16.s, {z4.s - z5.s}, z0.s
	addvl	x3, sp, #7
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	add	x3, x3, 64
	ldr	z4, [x3]
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z5, [x3]
	tbl	z4.s, {z4.s - z5.s}, z0.s
	addvl	x3, x5, #1
	rshrnb	z4.h, z4.s, #11
	uzp1	z4.h, z4.h, z4.h
	uzp1	z5.s, z13.s, z13.s
	add	x3, x3, 64
	stp	q16, q4, [x1]
	uzp1	z4.s, z17.s, z17.s
	tbl	z4.s, {z4.s - z5.s}, z0.s
	rshrnb	z4.h, z4.s, #11
	add	x3, sp, x3
	uzp1	z17.h, z4.h, z4.h
	uzp1	z4.s, z15.s, z15.s
	uzp1	z5.s, z3.s, z3.s
	tbl	z16.s, {z4.s - z5.s}, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	stp	q17, q16, [x1, 512]
	ldr	z4, [x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z5, [x3]
	tbl	z4.s, {z4.s - z5.s}, z0.s
	cntb	x3, all, mul #7
	rshrnb	z4.h, z4.s, #11
	uzp1	z4.h, z4.h, z4.h
	lsl	x3, x3, 3
	str	q4, [x1, 1024]
	mov	z5.d, z1.d
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z4, [x3]
	tbl	z4.s, {z4.s - z5.s}, z0.s
	addvl	x3, sp, #8
	rshrnb	z4.h, z4.s, #11
	uzp1	z4.h, z4.h, z4.h
	add	x3, x3, 64
	uzp1	z5.s, z18.s, z18.s
	str	q4, [x1, 1040]
	uzp1	z4.s, z10.s, z10.s
	ldr	z10, [x3]
	addvl	x3, sp, #11
	tbl	z4.s, {z4.s - z5.s}, z0.s
	add	x3, x3, 64
	uzp1	z5.s, z20.s, z20.s
	rshrnb	z4.h, z4.s, #11
	uzp1	z4.h, z4.h, z4.h
	str	q4, [x1, 1536]
	uzp1	z4.s, z19.s, z19.s
	tbl	z4.s, {z4.s - z5.s}, z0.s
	ldr	z5, [x3]
	addvl	x3, sp, #9
	sub	z20.h, z10.h, z5.h
	rshrnb	z4.h, z4.s, #11
	add	x3, x3, 64
	ldr	z1, [x3]
	uzp1	z4.h, z4.h, z4.h
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z10, [x3]
	sub	z19.h, z1.h, z10.h
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z18, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z16, [x3]
	sub	z18.h, z18.h, z16.h
	str	q4, [x1, 1552]
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z17, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z16, [x3]
	sub	z16.h, z17.h, z16.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z16.d, p6/m, z16.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z17, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z10, [x3]
	sub	z17.h, z17.h, z10.h
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z10, [x3]
	sub	z15.h, z10.h, z12.h
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z3, [x3]
	sub	z13.h, z3.h, z11.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z13.d, p6/m, z13.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z27.h, z12.h, z27.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	sub	z23.h, z9.h, z23.h
	sub	z24.h, z24.h, z14.h
	add	x3, x3, 64
	ldr	z12, [x3]
	sub	z21.h, z12.h, z21.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	sub	z30.h, z30.h, z28.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	sub	z22.h, z7.h, z22.h
	sub	z25.h, z8.h, z25.h
	sub	z26.h, z26.h, z2.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	sub	z31.h, z31.h, z29.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	cntb	x5, all, mul #7
	movi	d29, #0
	lsl	x3, x3, 1
	lsl	x5, x5, 3
	add	x3, sp, x3
	add	x0, x0, 1024
	add	x3, x3, 64
	ldr	z10, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z10.h[0]
	addvl	x3, x5, #1
	cntb	x5, all, mul #15
	movprfx	z11, z29
	sdot	z11.d, z15.h, z10.h[0]
	add	x3, x3, 64
	lsl	x5, x5, 2
	movprfx	z14, z29
	sdot	z14.d, z23.h, z10.h[0]
	add	x3, sp, x3
	ldr	z9, [x3]
	movprfx	z12, z29
	sdot	z12.d, z25.h, z10.h[0]
	addvl	x3, x5, #-1
	sdot	z28.d, z20.h, z9.h[0]
	sdot	z11.d, z17.h, z9.h[0]
	add	x3, x3, 64
	sdot	z14.d, z21.h, z9.h[0]
	sdot	z12.d, z22.h, z9.h[0]
	add	x3, sp, x3
	ldr	z8, [x3]
	sdot	z28.d, z18.h, z8.h[0]
	cntb	x3, all, mul #15
	sdot	z14.d, z24.h, z8.h[0]
	sdot	z12.d, z26.h, z8.h[0]
	lsl	x3, x3, 2
	sdot	z11.d, z13.h, z8.h[0]
	cntb	x5, all, mul #15
	add	x3, sp, x3
	lsl	x5, x5, 2
	add	x3, x3, 64
	ldr	z7, [x3]
	sdot	z11.d, z27.h, z7.h[0]
	add	x3, x1, 64
	sdot	z12.d, z31.h, z7.h[0]
	sdot	z14.d, z30.h, z7.h[0]
	sdot	z28.d, z16.h, z7.h[0]
	uzp1	z14.s, z14.s, z12.s
	uzp1	z28.s, z28.s, z11.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 192
	movprfx	z28, z29
	sdot	z28.d, z19.h, z10.h[1]
	movprfx	z11, z29
	sdot	z11.d, z15.h, z10.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z10.h[1]
	movprfx	z12, z29
	sdot	z12.d, z25.h, z10.h[1]
	sdot	z28.d, z20.h, z9.h[1]
	sdot	z11.d, z17.h, z9.h[1]
	sdot	z28.d, z18.h, z8.h[1]
	sdot	z14.d, z21.h, z9.h[1]
	sdot	z12.d, z22.h, z9.h[1]
	sdot	z14.d, z24.h, z8.h[1]
	sdot	z12.d, z26.h, z8.h[1]
	sdot	z14.d, z30.h, z7.h[1]
	sdot	z12.d, z31.h, z7.h[1]
	sdot	z28.d, z16.h, z7.h[1]
	sdot	z11.d, z13.h, z8.h[1]
	uzp1	z14.s, z14.s, z12.s
	sdot	z11.d, z27.h, z7.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z11.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z10.h[0]
	addvl	x3, x5, #1
	cntb	x5
	movprfx	z11, z29
	sdot	z11.d, z15.h, z10.h[0]
	add	x3, x3, 64
	lsl	x5, x5, 6
	movprfx	z14, z29
	sdot	z14.d, z23.h, z10.h[0]
	add	x3, sp, x3
	ldr	z9, [x3]
	movprfx	z12, z29
	sdot	z12.d, z25.h, z10.h[0]
	addvl	x3, x5, #-1
	sdot	z28.d, z20.h, z9.h[0]
	sdot	z11.d, z17.h, z9.h[0]
	add	x3, x3, 64
	sdot	z14.d, z21.h, z9.h[0]
	sdot	z12.d, z22.h, z9.h[0]
	add	x3, sp, x3
	ldr	z8, [x3]
	sdot	z28.d, z18.h, z8.h[0]
	cntb	x3
	sdot	z14.d, z24.h, z8.h[0]
	sdot	z12.d, z26.h, z8.h[0]
	lsl	x3, x3, 6
	sdot	z11.d, z13.h, z8.h[0]
	cntb	x5
	add	x3, sp, x3
	lsl	x5, x5, 5
	add	x3, x3, 64
	ldr	z7, [x3]
	sdot	z11.d, z27.h, z7.h[0]
	add	x3, x1, 320
	sdot	z12.d, z31.h, z7.h[0]
	sdot	z14.d, z30.h, z7.h[0]
	sdot	z28.d, z16.h, z7.h[0]
	uzp1	z14.s, z14.s, z12.s
	uzp1	z28.s, z28.s, z11.s
	rshrnb	z14.h, z14.s, #11
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 448
	movprfx	z28, z29
	sdot	z28.d, z19.h, z10.h[1]
	movprfx	z11, z29
	sdot	z11.d, z15.h, z10.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z10.h[1]
	movprfx	z12, z29
	sdot	z12.d, z25.h, z10.h[1]
	sdot	z28.d, z20.h, z9.h[1]
	sdot	z11.d, z17.h, z9.h[1]
	sdot	z28.d, z18.h, z8.h[1]
	sdot	z14.d, z21.h, z9.h[1]
	sdot	z12.d, z22.h, z9.h[1]
	sdot	z14.d, z24.h, z8.h[1]
	sdot	z12.d, z26.h, z8.h[1]
	sdot	z14.d, z30.h, z7.h[1]
	sdot	z12.d, z31.h, z7.h[1]
	sdot	z28.d, z16.h, z7.h[1]
	sdot	z11.d, z13.h, z8.h[1]
	uzp1	z14.s, z14.s, z12.s
	sdot	z11.d, z27.h, z7.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z11.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x2, 256
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 512
	ld1h	z9.h, p7/z, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[0]
	add	x3, x2, 768
	ld1h	z11.h, p7/z, [x3]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[0]
	add	x3, x2, 1024
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[0]
	add	x3, x1, 576
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[0]
	sdot	z28.d, z20.h, z10.h[0]
	sdot	z7.d, z17.h, z10.h[0]
	sdot	z28.d, z18.h, z11.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	sdot	z8.d, z22.h, z10.h[0]
	sdot	z14.d, z24.h, z11.h[0]
	sdot	z8.d, z26.h, z11.h[0]
	sdot	z14.d, z30.h, z12.h[0]
	sdot	z8.d, z31.h, z12.h[0]
	sdot	z28.d, z16.h, z12.h[0]
	sdot	z7.d, z13.h, z11.h[0]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[0]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 704
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[1]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[1]
	sdot	z28.d, z20.h, z10.h[1]
	sdot	z7.d, z17.h, z10.h[1]
	sdot	z28.d, z18.h, z11.h[1]
	sdot	z14.d, z21.h, z10.h[1]
	sdot	z8.d, z22.h, z10.h[1]
	sdot	z14.d, z24.h, z11.h[1]
	sdot	z8.d, z26.h, z11.h[1]
	sdot	z14.d, z30.h, z12.h[1]
	sdot	z8.d, z31.h, z12.h[1]
	sdot	z28.d, z16.h, z12.h[1]
	sdot	z7.d, z13.h, z11.h[1]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x2, 288
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 544
	ld1h	z9.h, p7/z, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[0]
	add	x3, x2, 800
	ld1h	z11.h, p7/z, [x3]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[0]
	add	x3, x2, 1056
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[0]
	add	x3, x1, 832
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[0]
	sdot	z28.d, z20.h, z10.h[0]
	sdot	z7.d, z17.h, z10.h[0]
	sdot	z28.d, z18.h, z11.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	sdot	z8.d, z22.h, z10.h[0]
	sdot	z14.d, z24.h, z11.h[0]
	sdot	z8.d, z26.h, z11.h[0]
	sdot	z14.d, z30.h, z12.h[0]
	sdot	z8.d, z31.h, z12.h[0]
	sdot	z28.d, z16.h, z12.h[0]
	sdot	z7.d, z13.h, z11.h[0]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[0]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 960
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[1]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[1]
	sdot	z28.d, z20.h, z10.h[1]
	sdot	z7.d, z17.h, z10.h[1]
	sdot	z28.d, z18.h, z11.h[1]
	sdot	z14.d, z21.h, z10.h[1]
	sdot	z8.d, z22.h, z10.h[1]
	sdot	z14.d, z24.h, z11.h[1]
	sdot	z8.d, z26.h, z11.h[1]
	sdot	z14.d, z30.h, z12.h[1]
	sdot	z8.d, z31.h, z12.h[1]
	sdot	z28.d, z16.h, z12.h[1]
	sdot	z7.d, z13.h, z11.h[1]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x2, 320
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 576
	ld1h	z9.h, p7/z, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[0]
	add	x3, x2, 832
	ld1h	z11.h, p7/z, [x3]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[0]
	add	x3, x2, 1088
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[0]
	add	x3, x1, 1088
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[0]
	sdot	z28.d, z20.h, z10.h[0]
	sdot	z7.d, z17.h, z10.h[0]
	sdot	z28.d, z18.h, z11.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	sdot	z8.d, z22.h, z10.h[0]
	sdot	z14.d, z24.h, z11.h[0]
	sdot	z8.d, z26.h, z11.h[0]
	sdot	z14.d, z30.h, z12.h[0]
	sdot	z8.d, z31.h, z12.h[0]
	sdot	z28.d, z16.h, z12.h[0]
	sdot	z7.d, z13.h, z11.h[0]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[0]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 1216
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[1]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[1]
	sdot	z28.d, z20.h, z10.h[1]
	sdot	z7.d, z17.h, z10.h[1]
	sdot	z28.d, z18.h, z11.h[1]
	sdot	z14.d, z21.h, z10.h[1]
	sdot	z8.d, z22.h, z10.h[1]
	sdot	z14.d, z24.h, z11.h[1]
	sdot	z8.d, z26.h, z11.h[1]
	sdot	z14.d, z30.h, z12.h[1]
	sdot	z8.d, z31.h, z12.h[1]
	sdot	z28.d, z16.h, z12.h[1]
	sdot	z7.d, z13.h, z11.h[1]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x2, 352
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 608
	ld1h	z9.h, p7/z, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[0]
	add	x3, x2, 864
	ld1h	z11.h, p7/z, [x3]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[0]
	add	x3, x2, 1120
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[0]
	add	x3, x1, 1344
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[0]
	sdot	z28.d, z20.h, z10.h[0]
	sdot	z7.d, z17.h, z10.h[0]
	sdot	z28.d, z18.h, z11.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	sdot	z8.d, z22.h, z10.h[0]
	sdot	z14.d, z24.h, z11.h[0]
	sdot	z8.d, z26.h, z11.h[0]
	sdot	z14.d, z30.h, z12.h[0]
	sdot	z8.d, z31.h, z12.h[0]
	sdot	z28.d, z16.h, z12.h[0]
	sdot	z7.d, z13.h, z11.h[0]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[0]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 1472
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[1]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[1]
	sdot	z28.d, z20.h, z10.h[1]
	sdot	z7.d, z17.h, z10.h[1]
	sdot	z28.d, z18.h, z11.h[1]
	sdot	z14.d, z21.h, z10.h[1]
	sdot	z8.d, z22.h, z10.h[1]
	sdot	z14.d, z24.h, z11.h[1]
	sdot	z8.d, z26.h, z11.h[1]
	sdot	z14.d, z30.h, z12.h[1]
	sdot	z8.d, z31.h, z12.h[1]
	sdot	z28.d, z16.h, z12.h[1]
	sdot	z7.d, z13.h, z11.h[1]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x2, 384
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 640
	ld1h	z9.h, p7/z, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[0]
	add	x3, x2, 896
	ld1h	z11.h, p7/z, [x3]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[0]
	add	x3, x2, 1152
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[0]
	add	x3, x1, 1600
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[0]
	sdot	z28.d, z20.h, z10.h[0]
	sdot	z7.d, z17.h, z10.h[0]
	sdot	z28.d, z18.h, z11.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	sdot	z8.d, z22.h, z10.h[0]
	sdot	z14.d, z24.h, z11.h[0]
	sdot	z8.d, z26.h, z11.h[0]
	sdot	z14.d, z30.h, z12.h[0]
	sdot	z8.d, z31.h, z12.h[0]
	sdot	z28.d, z16.h, z12.h[0]
	sdot	z7.d, z13.h, z11.h[0]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[0]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 1728
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[1]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[1]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[1]
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[1]
	sdot	z28.d, z20.h, z10.h[1]
	sdot	z7.d, z17.h, z10.h[1]
	sdot	z28.d, z18.h, z11.h[1]
	sdot	z14.d, z21.h, z10.h[1]
	sdot	z8.d, z22.h, z10.h[1]
	sdot	z14.d, z24.h, z11.h[1]
	sdot	z8.d, z26.h, z11.h[1]
	sdot	z14.d, z30.h, z12.h[1]
	sdot	z8.d, z31.h, z12.h[1]
	sdot	z28.d, z16.h, z12.h[1]
	sdot	z7.d, z13.h, z11.h[1]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[1]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x2, 416
	ld1h	z10.h, p7/z, [x3]
	add	x3, x2, 672
	ld1h	z9.h, p7/z, [x3]
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[0]
	add	x3, x2, 928
	ld1h	z11.h, p7/z, [x3]
	movprfx	z7, z29
	sdot	z7.d, z15.h, z9.h[0]
	add	x3, x2, 1184
	ld1h	z12.h, p7/z, [x3]
	movprfx	z14, z29
	sdot	z14.d, z23.h, z9.h[0]
	add	x3, x1, 1856
	movprfx	z8, z29
	sdot	z8.d, z25.h, z9.h[0]
	sdot	z28.d, z20.h, z10.h[0]
	sdot	z7.d, z17.h, z10.h[0]
	sdot	z28.d, z18.h, z11.h[0]
	sdot	z14.d, z21.h, z10.h[0]
	sdot	z8.d, z22.h, z10.h[0]
	sdot	z14.d, z24.h, z11.h[0]
	sdot	z8.d, z26.h, z11.h[0]
	sdot	z14.d, z30.h, z12.h[0]
	sdot	z8.d, z31.h, z12.h[0]
	sdot	z28.d, z16.h, z12.h[0]
	sdot	z7.d, z13.h, z11.h[0]
	uzp1	z14.s, z14.s, z8.s
	sdot	z7.d, z27.h, z12.h[0]
	rshrnb	z14.h, z14.s, #11
	uzp1	z28.s, z28.s, z7.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z14.h
	st1h	z28.h, p7, [x3]
	add	x3, x1, 1984
	movprfx	z28, z29
	sdot	z28.d, z19.h, z9.h[1]
	sdot	z28.d, z20.h, z10.h[1]
	movprfx	z20, z29
	sdot	z20.d, z15.h, z9.h[1]
	sdot	z28.d, z18.h, z11.h[1]
	sdot	z20.d, z17.h, z10.h[1]
	sdot	z28.d, z16.h, z12.h[1]
	sdot	z20.d, z13.h, z11.h[1]
	sdot	z20.d, z27.h, z12.h[1]
	movprfx	z27, z29
	sdot	z27.d, z23.h, z9.h[1]
	uzp1	z28.s, z28.s, z20.s
	sdot	z27.d, z21.h, z10.h[1]
	rshrnb	z28.h, z28.s, #11
	sdot	z27.d, z24.h, z11.h[1]
	sdot	z27.d, z30.h, z12.h[1]
	movprfx	z30, z29
	sdot	z30.d, z25.h, z9.h[1]
	sdot	z30.d, z22.h, z10.h[1]
	sdot	z30.d, z26.h, z11.h[1]
	sdot	z30.d, z31.h, z12.h[1]
	uzp1	z27.s, z27.s, z30.s
	rshrnb	z27.h, z27.s, #11
	uzp1	z28.h, z28.h, z27.h
	st1h	z28.h, p7, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z26, [x3]
	zip1	z31.d, z28.d, z26.d
	addvl	x3, sp, #22
	trn2	z28.d, z28.d, z26.d
	add	x3, x3, 64
	ldr	z27, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z18, [x3]
	ldr	z17, [x3]
	addvl	x3, sp, #28
	zip1	z30.d, z27.d, z17.d
	zip1	z31.d, z31.d, z30.d
	add	x3, x3, 64
	ldr	z26, [x3]
	trn2	z30.d, z27.d, z18.d
	cntb	x3
	zip1	z30.d, z28.d, z30.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
	zip1	z28.d, z26.d, z24.d
	addvl	x3, sp, #30
	trn2	z26.d, z26.d, z24.d
	add	x3, x3, 64
	ldr	z25, [x3]
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
	zip1	z27.d, z25.d, z18.d
	cntb	x3, all, mul #9
	zip1	z28.d, z28.d, z27.d
	trn2	z27.d, z25.d, z18.d
	lsl	x3, x3, 2
	zip1	z26.d, z26.d, z27.d
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
	zip1	z25.d, z24.d, z22.d
	rdvl	x3, #19
	trn2	z24.d, z24.d, z22.d
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z23, [x3]
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
	zip1	z27.d, z23.d, z18.d
	ldr	z18, [x3]
	cntb	x3, all, mul #11
	zip1	z25.d, z25.d, z27.d
	lsl	x3, x3, 2
	trn2	z27.d, z23.d, z18.d
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
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
	zip1	z27.d, z21.d, z18.d
	zip1	z23.d, z23.d, z27.d
	trn2	z27.d, z22.d, z20.d
	mov	z22.d, z21.d
	ldr	z21, [x3]
	add	x3, x2, 1216
	ld1h	z15.h, p7/z, [x3]
	add	x3, x2, 1344
	trn2	z22.d, z22.d, z21.d
	ld1h	z14.h, p7/z, [x3]
	add	x3, x1, 128
	zip1	z27.d, z27.d, z22.d
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[0]
	sdot	z19.d, z28.h, z15.h[0]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[0]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x1, 384
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[1]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[1]
	sdot	z19.d, z28.h, z15.h[1]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z20.d, z23.h, z15.h[1]
	sdot	z21.d, z25.h, z15.h[1]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 1248
	ld1h	z15.h, p7/z, [x3]
	add	x3, x2, 1376
	ld1h	z14.h, p7/z, [x3]
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[0]
	add	x3, x1, 640
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[0]
	sdot	z19.d, z28.h, z15.h[0]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x1, 896
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[1]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[1]
	sdot	z19.d, z28.h, z15.h[1]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z20.d, z23.h, z15.h[1]
	sdot	z21.d, z25.h, z15.h[1]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 1280
	ld1h	z15.h, p7/z, [x3]
	add	x3, x2, 1408
	ld1h	z14.h, p7/z, [x3]
	add	x3, x1, 1152
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[0]
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[0]
	sdot	z19.d, z28.h, z15.h[0]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[0]
	sdot	z22.d, z31.h, z15.h[0]
	sdot	z20.d, z23.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x1, 1408
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[1]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[1]
	sdot	z19.d, z28.h, z15.h[1]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z20.d, z23.h, z15.h[1]
	sdot	z21.d, z25.h, z15.h[1]
	uzp1	z22.s, z22.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x2, 1312
	ld1h	z15.h, p7/z, [x3]
	add	x3, x2, 1440
	ld1h	z14.h, p7/z, [x3]
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[0]
	add	x3, x1, 1664
	sdot	z22.d, z31.h, z15.h[0]
	movprfx	z19, z29
	sdot	z19.d, z26.h, z14.h[0]
	movprfx	z21, z29
	sdot	z21.d, z24.h, z14.h[0]
	sdot	z19.d, z28.h, z15.h[0]
	sdot	z21.d, z25.h, z15.h[0]
	movprfx	z20, z29
	sdot	z20.d, z27.h, z14.h[0]
	uzp1	z22.s, z22.s, z19.s
	sdot	z20.d, z23.h, z15.h[0]
	rshrnb	z22.h, z22.s, #11
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #11
	uzp1	z22.h, z22.h, z21.h
	st1h	z22.h, p7, [x3]
	add	x3, x1, 1920
	movprfx	z22, z29
	sdot	z22.d, z30.h, z14.h[1]
	movprfx	z30, z29
	sdot	z30.d, z24.h, z14.h[1]
	sdot	z22.d, z31.h, z15.h[1]
	sdot	z30.d, z25.h, z15.h[1]
	movprfx	z31, z29
	sdot	z31.d, z26.h, z14.h[1]
	sdot	z31.d, z28.h, z15.h[1]
	movprfx	z28, z29
	sdot	z28.d, z27.h, z14.h[1]
	uzp1	z22.s, z22.s, z31.s
	sdot	z28.d, z23.h, z15.h[1]
	rshrnb	z22.h, z22.s, #11
	uzp1	z30.s, z30.s, z28.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z22.h, z22.h, z30.h
	st1h	z22.h, p7, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z31, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z28, [x3]
	zip1	z27.d, z31.d, z28.d
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z31, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z28, [x3]
	zip1	z31.d, z31.d, z28.d
	addvl	x3, sp, #29
	zip1	z27.d, z27.d, z31.d
	add	x3, x3, 64
	ldr	z31, [x3]
	addvl	x3, x5, #1
	rdvl	x5, #17
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	ldr	z28, [x3]
	zip1	z28.d, z31.d, z28.d
	addvl	x3, sp, #31
	add	x3, x3, 64
	ldr	z31, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #9
	add	x3, x3, 64
	lsl	x5, x5, 2
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z31.d, z31.d, z26.d
	addvl	x3, x5, #1
	cntb	x5, all, mul #5
	zip1	z28.d, z28.d, z31.d
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #5
	add	x3, x3, 64
	lsl	x5, x5, 3
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z30.d, z31.d, z26.d
	addvl	x3, x5, #-1
	rdvl	x5, #21
	add	x3, x3, 64
	lsl	x5, x5, 1
	add	x3, sp, x3
	ldr	z31, [x3]
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z31.d, z31.d, z26.d
	cntb	x3, all, mul #3
	zip1	z30.d, z30.d, z31.d
	lsl	x5, x3, 4
	sub	x3, x5, x3
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	ldr	z31, [x3]
	addvl	x3, x5, #1
	cntb	x5, all, mul #3
	add	x3, x3, 64
	lsl	x5, x5, 4
	add	x3, sp, x3
	ldr	z26, [x3]
	zip1	z31.d, z31.d, z26.d
	addvl	x3, x5, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
	zip1	z26.d, z26.d, z25.d
	add	x3, x2, 1472
	ld1h	z15.h, p7/z, [x3]
	zip1	z31.d, z31.d, z26.d
	add	x3, x1, 256
	movprfx	z23, z29
	sdot	z23.d, z28.h, z15.h[0]
	movprfx	z24, z29
	sdot	z24.d, z31.h, z15.h[0]
	movprfx	z26, z29
	sdot	z26.d, z27.h, z15.h[0]
	movprfx	z25, z29
	sdot	z25.d, z30.h, z15.h[0]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z25.h, z25.s, #11
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x3]
	add	x3, x1, 768
	movprfx	z23, z29
	sdot	z23.d, z28.h, z15.h[1]
	movprfx	z24, z29
	sdot	z24.d, z31.h, z15.h[1]
	movprfx	z26, z29
	sdot	z26.d, z27.h, z15.h[1]
	movprfx	z25, z29
	sdot	z25.d, z30.h, z15.h[1]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z25.h, z25.s, #11
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x3]
	add	x3, x2, 1504
	ld1h	z15.h, p7/z, [x3]
	add	x3, x1, 1280
	movprfx	z26, z29
	sdot	z26.d, z27.h, z15.h[0]
	movprfx	z23, z29
	sdot	z23.d, z28.h, z15.h[0]
	movprfx	z25, z29
	sdot	z25.d, z30.h, z15.h[0]
	movprfx	z24, z29
	sdot	z24.d, z31.h, z15.h[0]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #11
	rshrnb	z25.h, z25.s, #11
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x3]
	add	x3, x1, 1792
	movprfx	z26, z29
	sdot	z26.d, z27.h, z15.h[1]
	movprfx	z27, z29
	sdot	z27.d, z28.h, z15.h[1]
	movprfx	z28, z29
	sdot	z28.d, z30.h, z15.h[1]
	sdot	z29.d, z31.h, z15.h[1]
	uzp1	z31.s, z26.s, z27.s
	uzp1	z30.s, z28.s, z29.s
	rshrnb	z31.h, z31.s, #11
	rshrnb	z30.h, z30.s, #11
	uzp1	z31.h, z31.h, z30.h
	st1h	z31.h, p7, [x3]
	add	x1, x1, 32
	cmp	x4, x0
	bne	.L7
	mov	x13, 65
	cntb	x12
	ldp	d8, d9, [sp]
	mul	x12, x12, x13
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
	.type	_ZL5CODDI, %object
	.size	_ZL5CODDI, 1024
_ZL5CODDI:
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.type	_ZL4K2SI, %object
	.size	_ZL4K2SI, 256
_ZL4K2SI:
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.type	_ZL4K4SI, %object
	.size	_ZL4K4SI, 64
_ZL4K4SI:
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
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
