	.arch armv8.2-a+crc+sve2
	.file	"best_op_r16.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB9:
	.cfi_startproc
	addvl	sp, sp, #-31
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xf8,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #112
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0xf8,0x1e,0x23,0x70,0x22
	add	x3, x3, :lo12:.LANCHOR0
	add	x11, x3, 64
	addvl	x4, sp, #24
	add	x4, x4, 112
	add	x5, x2, x2, lsl 1
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x7, x2, x2, lsl 2
	ld1w	z31.s, p7/z, [x3]
	lsl	x18, x2, 3
	stp	x19, x20, [sp, 16]
	lsl	x8, x2, 4
	sub	x9, x18, x2
	str	x21, [sp, 32]
	add	x10, x18, x2
	stp	d8, d9, [sp, 48]
	sub	x8, x8, x2
	add	x17, x0, x5, lsl 1
	stp	d10, d11, [sp, 64]
	add	x16, x0, x7, lsl 1
	add	x15, x0, x5, lsl 2
	stp	d12, d13, [sp, 80]
	add	x13, x0, x7, lsl 2
	add	x12, x0, x5, lsl 3
	stp	d14, d15, [sp, 96]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x48,0x2,0x8f,0x30
	.cfi_escape 0x10,0x49,0x2,0x8f,0x38
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xe8,0
	add	x7, x2, x7, lsl 1
	str	z31, [x4]
	ld1w	z31.s, p7/z, [x11]
	add	x11, sp, 112
	str	z31, [x11]
	add	x11, x3, 96
	ld1w	z31.s, p7/z, [x11]
	addvl	x11, sp, #1
	add	x5, x2, x5, lsl 2
	add	x11, x11, 112
	str	z31, [x11]
	add	x19, x0, x2, lsl 1
	add	x11, x3, 128
	ld1w	z31.s, p7/z, [x11]
	add	x30, x0, x2, lsl 2
	addvl	x11, sp, #2
	lsl	x4, x2, 5
	add	x11, x11, 112
	str	z31, [x11]
	add	x2, x0, x2, lsl 3
	add	x11, x3, 160
	ld1h	z31.h, p7/z, [x11]
	add	x14, x0, x9, lsl 1
	addvl	x11, sp, #25
	add	x10, x0, x10, lsl 1
	add	x11, x11, 112
	str	z31, [x11]
	add	x7, x0, x7, lsl 1
	add	x11, x3, 416
	ld1h	z31.h, p7/z, [x11]
	add	x5, x0, x5, lsl 1
	addvl	x11, sp, #26
	add	x9, x0, x9, lsl 2
	add	x11, x11, 112
	str	z31, [x11]
	add	x8, x0, x8, lsl 1
	add	x11, x3, 672
	ld1h	z31.h, p7/z, [x11]
	add	x20, x1, 64
	addvl	x11, sp, #27
	add	x18, x18, x2
	add	x11, x11, 112
	str	z31, [x11]
	add	x21, x3, 32
	add	x11, x3, 928
	ld1h	z12.h, p7/z, [x11]
	mov	x6, 0
	add	x11, x3, 192
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 448
	ld1h	z9.h, p7/z, [x11]
	add	x11, x3, 704
	ld1h	z10.h, p7/z, [x11]
	add	x11, x3, 960
	ld1h	z11.h, p7/z, [x11]
	addvl	x11, sp, #28
	add	x11, x11, 112
	str	z9, [x11]
	addvl	x11, sp, #29
	add	x11, x11, 112
	str	z10, [x11]
	mov	z10.d, z13.d
	addvl	x11, sp, #30
	add	x11, x11, 112
	str	z11, [x11]
	mov	z11.d, z12.d
.L2:
	add	x11, x0, x6
	ld1h	z31.h, p7/z, [x11]
	ld1h	z27.h, p7/z, [x17]
	add	x11, x11, 32
	ld1h	z30.h, p7/z, [x11]
	rev	z30.h, z30.h
	add	x11, x19, x6
	ld1h	z28.h, p7/z, [x11]
	sub	z13.h, z31.h, z30.h
	add	x11, x11, 32
	add	z31.h, z31.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x30, x6
	rev	z30.h, z30.h
	ld1h	z20.h, p7/z, [x11]
	add	x11, x11, 32
	sub	z12.h, z28.h, z30.h
	add	z28.h, z28.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x17, 32
	rev	z30.h, z30.h
	sub	z5.h, z20.h, z30.h
	add	z20.h, z20.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x2, x6
	rev	z30.h, z30.h
	ld1h	z29.h, p7/z, [x11]
	add	x11, x11, 32
	sub	z6.h, z27.h, z30.h
	add	z27.h, z27.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x16, 32
	rev	z30.h, z30.h
	sub	z15.h, z29.h, z30.h
	add	z29.h, z29.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x15, 32
	rev	z30.h, z30.h
	ld1h	z26.h, p7/z, [x16]
	sub	z14.h, z26.h, z30.h
	add	z26.h, z26.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x14, 32
	rev	z30.h, z30.h
	ld1h	z21.h, p7/z, [x15]
	sub	z7.h, z21.h, z30.h
	add	z21.h, z21.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x18, x6
	rev	z30.h, z30.h
	ld1h	z25.h, p7/z, [x14]
	sub	z8.h, z25.h, z30.h
	add	z25.h, z25.h, z30.h
	ld1h	z30.h, p7/z, [x11]
	add	x11, x11, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z24.h, z24.h
	addvl	x11, sp, #18
	sub	z23.h, z30.h, z24.h
	add	z30.h, z30.h, z24.h
	add	x11, x11, 112
	str	z23, [x11]
	ld1h	z2.h, p7/z, [x10]
	add	x11, x10, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z24.h, z24.h
	addvl	x11, sp, #19
	sub	z22.h, z2.h, z24.h
	add	z2.h, z2.h, z24.h
	add	x11, x11, 112
	str	z22, [x11]
	ld1h	z0.h, p7/z, [x13]
	add	x11, x13, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z24.h, z24.h
	addvl	x11, sp, #20
	sub	z19.h, z0.h, z24.h
	add	z0.h, z0.h, z24.h
	add	x11, x11, 112
	str	z19, [x11]
	ld1h	z1.h, p7/z, [x7]
	add	x11, x7, 32
	ld1h	z24.h, p7/z, [x11]
	rev	z24.h, z24.h
	add	x11, x12, 32
	sub	z9.h, z1.h, z24.h
	add	z1.h, z1.h, z24.h
	ld1h	z24.h, p7/z, [x11]
	add	x11, x5, 32
	rev	z24.h, z24.h
	ld1h	z23.h, p7/z, [x12]
	sub	z17.h, z23.h, z24.h
	add	z23.h, z23.h, z24.h
	ld1h	z24.h, p7/z, [x11]
	add	x11, x9, 32
	rev	z24.h, z24.h
	ld1h	z22.h, p7/z, [x5]
	ld1h	z3.h, p7/z, [x9]
	sub	z16.h, z22.h, z24.h
	add	z22.h, z22.h, z24.h
	ld1h	z24.h, p7/z, [x11]
	addvl	x11, sp, #21
	add	x11, x11, 112
	rev	z24.h, z24.h
	sub	z18.h, z3.h, z24.h
	str	z18, [x11]
	add	x11, x8, 32
	add	z3.h, z3.h, z24.h
	ld1h	z24.h, p7/z, [x11]
	addvl	x11, sp, #22
	rev	z24.h, z24.h
	ld1h	z4.h, p7/z, [x8]
	add	x11, x11, 112
	sub	z19.h, z4.h, z24.h
	ptrue	p6.d, all
	add	z4.h, z4.h, z24.h
	zip1	z24.d, z31.d, z20.d
	zip2	z31.d, z31.d, z20.d
	zip1	z20.d, z28.d, z27.d
	zip2	z28.d, z28.d, z27.d
	zip1	z18.d, z24.d, z20.d
	zip1	z27.d, z31.d, z28.d
	zip2	z20.d, z24.d, z20.d
	str	z19, [x11]
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z28.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #4
	saddlb	z24.s, z18.h, z31.h
	add	x11, x11, 112
	str	z18, [x11]
	ldr	z28, [x11]
	addvl	x11, sp, #7
	saddlt	z19.s, z28.h, z31.h
	add	x11, x11, 112
	str	z31, [x11]
	mov	z31.d, z20.d
	addvl	x11, sp, #5
	saddlb	z20.s, z20.h, z27.h
	add	x11, x11, 112
	str	z31, [x11]
	ldr	z28, [x11]
	addvl	x11, sp, #6
	add	x11, x11, 112
	str	z27, [x11]
	saddlt	z27.s, z28.h, z27.h
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	zip1	z28.s, z27.s, z20.s
	zip1	z31.s, z24.s, z19.s
	zip2	z27.s, z27.s, z20.s
	add	z31.s, z31.s, z28.s
	zip2	z24.s, z24.s, z19.s
	add	z27.s, z24.s, z27.s
	uzp2	z20.d, z31.d, z27.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z31.d, z31.d, z27.d
	ld1w	z27.s, p7/z, [x21]
	add	z24.s, z20.s, z31.s
	sub	z28.s, z31.s, z20.s
	movprfx	z18, z24
	mul	z18.s, p7/m, z18.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z18.s, p5/m, z18.s, z18.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z20, [x11]
	mul	z20.s, p7/m, z20.s, z28.s
	mov	z31.d, z20.d
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z31.s, p5/m, z31.s, z20.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #23
	add	x11, x11, 112
	str	z31, [x11]
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z19, [x11]
	mul	z24.s, p7/m, z24.s, z19.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #2
	add	x11, x11, 112
	ldr	z20, [x11]
	mul	z28.s, p7/m, z28.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	zip1	z31.d, z29.d, z21.d
	zip2	z29.d, z29.d, z21.d
	zip1	z21.d, z26.d, z25.d
	zip2	z26.d, z26.d, z25.d
	zip1	z25.d, z31.d, z21.d
	zip2	z21.d, z31.d, z21.d
	zip1	z31.d, z29.d, z26.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z29.d, z29.d, z26.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #8
	mov	z29.d, z25.d
	saddlb	z25.s, z25.h, z26.h
	add	x11, x11, 112
	str	z29, [x11]
	ldr	z29, [x11]
	addvl	x11, sp, #11
	saddlt	z19.s, z29.h, z26.h
	mov	z29.d, z21.d
	add	x11, x11, 112
	str	z26, [x11]
	saddlb	z21.s, z21.h, z31.h
	addvl	x11, sp, #9
	add	x11, x11, 112
	str	z29, [x11]
	ldr	z29, [x11]
	addvl	x11, sp, #10
	saddlt	z26.s, z29.h, z31.h
	add	x11, x11, 112
	str	z31, [x11]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	zip1	z29.s, z26.s, z21.s
	zip1	z31.s, z25.s, z19.s
	zip2	z26.s, z26.s, z21.s
	add	z31.s, z31.s, z29.s
	zip2	z25.s, z25.s, z19.s
	add	z26.s, z25.s, z26.s
	uzp2	z21.d, z31.d, z26.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z31.d, z26.d
	add	z25.s, z21.s, z31.s
	sub	z29.s, z31.s, z21.s
	movprfx	z19, z25
	mul	z19.s, p7/m, z19.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z21, [x11]
	mul	z21.s, p7/m, z21.s, z29.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z21.s, p5/m, z21.s, z21.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z26, [x11]
	mul	z25.s, p7/m, z25.s, z26.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	mul	z29.s, p7/m, z29.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	zip1	z31.d, z30.d, z0.d
	zip1	z26.d, z2.d, z1.d
	zip2	z30.d, z30.d, z0.d
	zip2	z2.d, z2.d, z1.d
	zip1	z1.d, z31.d, z26.d
	zip2	z26.d, z31.d, z26.d
	zip1	z31.d, z30.d, z2.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z0.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	mov	z31.d, z0.d
	zip2	z30.d, z30.d, z2.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #12
	saddlb	z2.s, z1.h, z30.h
	add	x11, x11, 112
	str	z1, [x11]
	ldr	z0, [x11]
	addvl	x11, sp, #15
	saddlb	z1.s, z26.h, z31.h
	saddlt	z0.s, z0.h, z30.h
	add	x11, x11, 112
	str	z30, [x11]
	addvl	x11, sp, #13
	add	x11, x11, 112
	str	z26, [x11]
	ldr	z26, [x11]
	addvl	x11, sp, #14
	saddlt	z26.s, z26.h, z31.h
	add	x11, x11, 112
	str	z31, [x11]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z1.d, p6/m, z1.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z2.s, z0.s
	zip2	z2.s, z2.s, z0.s
	zip1	z30.s, z26.s, z1.s
	zip2	z26.s, z26.s, z1.s
	add	z31.s, z31.s, z30.s
	add	z26.s, z2.s, z26.s
	uzp2	z2.d, z31.d, z26.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z2.d, p6/m, z2.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z31.d, z26.d
	add	z26.s, z2.s, z31.s
	sub	z30.s, z31.s, z2.s
	movprfx	z1, z26
	mul	z1.s, p7/m, z1.s, z27.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z1.s, p5/m, z1.s, z1.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z2, [x11]
	mul	z2.s, p7/m, z2.s, z30.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z2.s, p5/m, z2.s, z2.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z0, [x11]
	mul	z26.s, p7/m, z26.s, z0.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z26.s, p5/m, z26.s, z26.s
// 0 "" 2
#NO_APP
	mul	z30.s, p7/m, z30.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	zip1	z31.d, z23.d, z3.d
	zip2	z23.d, z23.d, z3.d
	zip1	z3.d, z22.d, z4.d
	zip2	z22.d, z22.d, z4.d
	zip2	z0.d, z31.d, z3.d
	zip1	z4.d, z31.d, z3.d
	zip1	z31.d, z23.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z3.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	mov	z31.d, z3.d
	zip2	z23.d, z23.d, z22.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z3.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #16
	saddlb	z22.s, z4.h, z3.h
	add	x11, x11, 112
	str	z4, [x11]
	ldr	z23, [x11]
	addvl	x11, sp, #3
	saddlb	z4.s, z0.h, z31.h
	add	x11, x11, 112
	str	z3, [x11]
	saddlt	z3.s, z23.h, z3.h
	addvl	x11, sp, #17
	saddlt	z23.s, z0.h, z31.h
	add	x11, x11, 112
	str	z31, [x11]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z4.d, p6/m, z4.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z22.s, z3.s
	zip2	z22.s, z22.s, z3.s
	zip1	z20.s, z23.s, z4.s
	zip2	z23.s, z23.s, z4.s
	add	z31.s, z31.s, z20.s
	add	z23.s, z22.s, z23.s
	uzp2	z22.d, z31.d, z23.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z31.d, z23.d
	add	z23.s, z22.s, z31.s
	sub	z31.s, z31.s, z22.s
	mul	z27.s, p7/m, z27.s, z23.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	add	x11, sp, 112
	ldr	z22, [x11]
	mul	z22.s, p7/m, z22.s, z31.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z22.s, p5/m, z22.s, z22.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	add	x11, x11, 112
	ldr	z4, [x11]
	mul	z23.s, p7/m, z23.s, z4.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #2
	add	x11, x11, 112
	ldr	z4, [x11]
	mul	z31.s, p7/m, z31.s, z4.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	addvl	x11, sp, #24
	uzp1	z4.s, z19.s, z19.s
	uzp1	z3.s, z18.s, z18.s
	add	x11, x11, 112
	ldr	z19, [x11]
	tbl	z3.s, {z3.s - z4.s}, z19.s
	uzp1	z19.s, z27.s, z27.s
	ldr	z27, [x11]
	addvl	x11, sp, #23
	add	x11, x11, 112
	uzp1	z18.s, z1.s, z1.s
	rshrnb	z3.h, z3.s, #4
	tbl	z18.s, {z18.s - z19.s}, z27.s
	uzp1	z3.h, z3.h, z3.h
	uzp1	z19.s, z21.s, z21.s
	rshrnb	z18.h, z18.s, #4
	uzp1	z21.s, z22.s, z22.s
	uzp1	z18.h, z18.h, z18.h
	stp	q3, q18, [x1]
	ldr	z20, [x11]
	addvl	x11, sp, #18
	uzp1	z18.s, z20.s, z20.s
	uzp1	z20.s, z2.s, z2.s
	tbl	z20.s, {z20.s - z21.s}, z27.s
	uzp1	z21.s, z25.s, z25.s
	rshrnb	z20.h, z20.s, #4
	uzp1	z25.s, z23.s, z23.s
	uzp1	z20.h, z20.h, z20.h
	tbl	z18.s, {z18.s - z19.s}, z27.s
	add	x11, x11, 112
	rshrnb	z18.h, z18.s, #4
	uzp1	z18.h, z18.h, z18.h
	stp	q18, q20, [x1, 512]
	uzp1	z20.s, z24.s, z24.s
	uzp1	z24.s, z26.s, z26.s
	tbl	z20.s, {z20.s - z21.s}, z27.s
	tbl	z24.s, {z24.s - z25.s}, z27.s
	uzp1	z26.s, z28.s, z28.s
	mov	z25.d, z27.d
	uzp1	z28.s, z30.s, z30.s
	uzp1	z27.s, z29.s, z29.s
	uzp1	z29.s, z31.s, z31.s
	tbl	z28.s, {z28.s - z29.s}, z25.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	ldr	z21, [x11]
	trn2	z30.d, z12.d, z6.d
	tbl	z26.s, {z26.s - z27.s}, z25.s
	addvl	x11, sp, #20
	rshrnb	z24.h, z24.s, #4
	rshrnb	z26.h, z26.s, #4
	uzp1	z24.h, z24.h, z24.h
	uzp1	z26.h, z26.h, z26.h
	str	q28, [x1, 1552]
	zip1	z28.d, z12.d, z6.d
	trn2	z31.d, z13.d, z5.d
	zip1	z29.d, z13.d, z5.d
	zip1	z27.d, z31.d, z30.d
	add	x11, x11, 112
	rshrnb	z20.h, z20.s, #4
	uzp1	z20.h, z20.h, z20.h
	str	q24, [x1, 1040]
	zip2	z24.d, z31.d, z30.d
	trn2	z30.d, z14.d, z8.d
	trn2	z31.d, z15.d, z7.d
	zip1	z23.d, z31.d, z30.d
	str	q26, [x1, 1536]
	zip1	z26.d, z29.d, z28.d
	zip1	z28.d, z14.d, z8.d
	trn1	z14.d, z14.d, z8.d
	zip1	z29.d, z15.d, z7.d
	trn1	z15.d, z15.d, z7.d
	str	q20, [x1, 1024]
	zip2	z20.d, z15.d, z14.d
	ldr	z14, [x11]
	addvl	x11, sp, #19
	zip1	z22.d, z29.d, z28.d
	zip1	z29.d, z21.d, z14.d
	add	x11, x11, 112
	ldr	z15, [x11]
	zip2	z19.d, z31.d, z30.d
	addvl	x11, sp, #21
	trn2	z31.d, z21.d, z14.d
	zip1	z28.d, z15.d, z9.d
	add	x11, x11, 112
	zip1	z8.d, z29.d, z28.d
	trn1	z29.d, z21.d, z14.d
	ldr	z21, [x11]
	addvl	x11, sp, #22
	trn2	z30.d, z15.d, z9.d
	add	x11, x11, 112
	trn1	z28.d, z15.d, z9.d
	ldr	z15, [x11]
	addvl	x11, sp, #26
	zip1	z18.d, z31.d, z30.d
	zip2	z9.d, z29.d, z28.d
	add	x11, x11, 112
	zip2	z7.d, z31.d, z30.d
	zip1	z28.d, z16.d, z15.d
	trn2	z30.d, z16.d, z15.d
	trn1	z16.d, z16.d, z15.d
	ldr	z15, [x11]
	addvl	x11, sp, #25
	trn1	z13.d, z13.d, z5.d
	trn2	z31.d, z17.d, z21.d
	add	x11, x11, 112
	ldr	z14, [x11]
	zip1	z29.d, z17.d, z21.d
	addvl	x11, sp, #27
	trn1	z12.d, z12.d, z6.d
	zip2	z25.d, z13.d, z12.d
	add	x11, x11, 112
	ldr	z13, [x11]
	zip1	z5.d, z29.d, z28.d
	add	x11, x1, 64
	zip1	z6.d, z31.d, z30.d
	trn1	z17.d, z17.d, z21.d
	zip2	z17.d, z17.d, z16.d
	zip2	z16.d, z31.d, z30.d
	movi	d31, #0
	movprfx	z30, z31
	sdot	z30.d, z27.h, z15.h[0]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z15.h[0]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z15.h[0]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z15.h[0]
	sdot	z30.d, z26.h, z14.h[0]
	sdot	z21.d, z22.h, z14.h[0]
	sdot	z30.d, z25.h, z13.h[0]
	sdot	z21.d, z20.h, z13.h[0]
	sdot	z30.d, z24.h, z11.h[0]
	sdot	z21.d, z19.h, z11.h[0]
	sdot	z29.d, z8.h, z14.h[0]
	sdot	z28.d, z5.h, z14.h[0]
	sdot	z29.d, z9.h, z13.h[0]
	sdot	z28.d, z17.h, z13.h[0]
	sdot	z29.d, z7.h, z11.h[0]
	sdot	z28.d, z16.h, z11.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 192
	movprfx	z30, z31
	sdot	z30.d, z27.h, z15.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z15.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z15.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z15.h[1]
	sdot	z30.d, z26.h, z14.h[1]
	sdot	z21.d, z22.h, z14.h[1]
	sdot	z30.d, z25.h, z13.h[1]
	sdot	z21.d, z20.h, z13.h[1]
	sdot	z30.d, z24.h, z11.h[1]
	sdot	z21.d, z19.h, z11.h[1]
	sdot	z29.d, z8.h, z14.h[1]
	sdot	z28.d, z5.h, z14.h[1]
	sdot	z29.d, z9.h, z13.h[1]
	sdot	z28.d, z17.h, z13.h[1]
	sdot	z29.d, z7.h, z11.h[1]
	sdot	z28.d, z16.h, z11.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	addvl	x11, sp, #28
	add	x11, x11, 112
	ldr	z15, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z15.h[0]
	addvl	x11, sp, #29
	movprfx	z21, z31
	sdot	z21.d, z23.h, z15.h[0]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z15.h[0]
	add	x11, x11, 112
	ldr	z14, [x11]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z15.h[0]
	addvl	x11, sp, #30
	sdot	z30.d, z26.h, z10.h[0]
	sdot	z21.d, z22.h, z10.h[0]
	add	x11, x11, 112
	ldr	z13, [x11]
	sdot	z30.d, z25.h, z14.h[0]
	add	x11, x1, 320
	sdot	z30.d, z24.h, z13.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z29.d, z8.h, z10.h[0]
	sdot	z21.d, z19.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z5.h, z10.h[0]
	sdot	z29.d, z7.h, z13.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	uzp1	z30.s, z30.s, z21.s
	sdot	z28.d, z16.h, z13.h[0]
	rshrnb	z30.h, z30.s, #4
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 448
	movprfx	z30, z31
	sdot	z30.d, z27.h, z15.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z15.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z15.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z15.h[1]
	sdot	z30.d, z26.h, z10.h[1]
	sdot	z21.d, z22.h, z10.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z21.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z13.h[1]
	sdot	z21.d, z19.h, z13.h[1]
	sdot	z29.d, z8.h, z10.h[1]
	sdot	z28.d, z5.h, z10.h[1]
	sdot	z29.d, z9.h, z14.h[1]
	sdot	z28.d, z17.h, z14.h[1]
	sdot	z29.d, z7.h, z13.h[1]
	sdot	z28.d, z16.h, z13.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 224
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 480
	ld1h	z12.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[0]
	add	x11, x3, 736
	ld1h	z14.h, p7/z, [x11]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[0]
	add	x11, x3, 992
	ld1h	z15.h, p7/z, [x11]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[0]
	add	x11, x1, 576
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[0]
	sdot	z30.d, z26.h, z13.h[0]
	sdot	z21.d, z22.h, z13.h[0]
	sdot	z30.d, z25.h, z14.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z30.d, z24.h, z15.h[0]
	sdot	z21.d, z19.h, z15.h[0]
	sdot	z29.d, z8.h, z13.h[0]
	sdot	z28.d, z5.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	sdot	z29.d, z7.h, z15.h[0]
	sdot	z28.d, z16.h, z15.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 704
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[1]
	sdot	z30.d, z26.h, z13.h[1]
	sdot	z21.d, z22.h, z13.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z21.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z15.h[1]
	sdot	z21.d, z19.h, z15.h[1]
	sdot	z29.d, z8.h, z13.h[1]
	sdot	z28.d, z5.h, z13.h[1]
	sdot	z29.d, z9.h, z14.h[1]
	sdot	z28.d, z17.h, z14.h[1]
	sdot	z29.d, z7.h, z15.h[1]
	sdot	z28.d, z16.h, z15.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 256
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 512
	ld1h	z12.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[0]
	add	x11, x3, 768
	ld1h	z14.h, p7/z, [x11]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[0]
	add	x11, x3, 1024
	ld1h	z15.h, p7/z, [x11]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[0]
	add	x11, x1, 832
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[0]
	sdot	z30.d, z26.h, z13.h[0]
	sdot	z21.d, z22.h, z13.h[0]
	sdot	z30.d, z25.h, z14.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z30.d, z24.h, z15.h[0]
	sdot	z21.d, z19.h, z15.h[0]
	sdot	z29.d, z8.h, z13.h[0]
	sdot	z28.d, z5.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	sdot	z29.d, z7.h, z15.h[0]
	sdot	z28.d, z16.h, z15.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 960
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[1]
	sdot	z30.d, z26.h, z13.h[1]
	sdot	z21.d, z22.h, z13.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z21.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z15.h[1]
	sdot	z21.d, z19.h, z15.h[1]
	sdot	z29.d, z8.h, z13.h[1]
	sdot	z28.d, z5.h, z13.h[1]
	sdot	z29.d, z9.h, z14.h[1]
	sdot	z28.d, z17.h, z14.h[1]
	sdot	z29.d, z7.h, z15.h[1]
	sdot	z28.d, z16.h, z15.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 288
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 544
	ld1h	z12.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[0]
	add	x11, x3, 800
	ld1h	z14.h, p7/z, [x11]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[0]
	add	x11, x3, 1056
	ld1h	z15.h, p7/z, [x11]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[0]
	add	x11, x1, 1088
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[0]
	sdot	z30.d, z26.h, z13.h[0]
	sdot	z21.d, z22.h, z13.h[0]
	sdot	z30.d, z25.h, z14.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z30.d, z24.h, z15.h[0]
	sdot	z21.d, z19.h, z15.h[0]
	sdot	z29.d, z8.h, z13.h[0]
	sdot	z28.d, z5.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	sdot	z29.d, z7.h, z15.h[0]
	sdot	z28.d, z16.h, z15.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 1216
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[1]
	sdot	z30.d, z26.h, z13.h[1]
	sdot	z21.d, z22.h, z13.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z21.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z15.h[1]
	sdot	z21.d, z19.h, z15.h[1]
	sdot	z29.d, z8.h, z13.h[1]
	sdot	z28.d, z5.h, z13.h[1]
	sdot	z29.d, z9.h, z14.h[1]
	sdot	z28.d, z17.h, z14.h[1]
	sdot	z29.d, z7.h, z15.h[1]
	sdot	z28.d, z16.h, z15.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 320
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 576
	ld1h	z12.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[0]
	add	x11, x3, 832
	ld1h	z14.h, p7/z, [x11]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[0]
	add	x11, x3, 1088
	ld1h	z15.h, p7/z, [x11]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[0]
	add	x11, x1, 1344
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[0]
	sdot	z30.d, z26.h, z13.h[0]
	sdot	z21.d, z22.h, z13.h[0]
	sdot	z30.d, z25.h, z14.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z30.d, z24.h, z15.h[0]
	sdot	z21.d, z19.h, z15.h[0]
	sdot	z29.d, z8.h, z13.h[0]
	sdot	z28.d, z5.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	sdot	z29.d, z7.h, z15.h[0]
	sdot	z28.d, z16.h, z15.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 1472
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[1]
	sdot	z30.d, z26.h, z13.h[1]
	sdot	z21.d, z22.h, z13.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z21.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z15.h[1]
	sdot	z21.d, z19.h, z15.h[1]
	sdot	z29.d, z8.h, z13.h[1]
	sdot	z28.d, z5.h, z13.h[1]
	sdot	z29.d, z9.h, z14.h[1]
	sdot	z28.d, z17.h, z14.h[1]
	sdot	z29.d, z7.h, z15.h[1]
	sdot	z28.d, z16.h, z15.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 352
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 608
	ld1h	z12.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[0]
	add	x11, x3, 864
	ld1h	z14.h, p7/z, [x11]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[0]
	add	x11, x3, 1120
	ld1h	z15.h, p7/z, [x11]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[0]
	add	x11, x1, 1600
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[0]
	sdot	z30.d, z26.h, z13.h[0]
	sdot	z21.d, z22.h, z13.h[0]
	sdot	z30.d, z25.h, z14.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z30.d, z24.h, z15.h[0]
	sdot	z21.d, z19.h, z15.h[0]
	sdot	z29.d, z8.h, z13.h[0]
	sdot	z28.d, z5.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	sdot	z29.d, z7.h, z15.h[0]
	sdot	z28.d, z16.h, z15.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 1728
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[1]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[1]
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[1]
	sdot	z30.d, z26.h, z13.h[1]
	sdot	z21.d, z22.h, z13.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z21.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z15.h[1]
	sdot	z21.d, z19.h, z15.h[1]
	sdot	z29.d, z8.h, z13.h[1]
	sdot	z28.d, z5.h, z13.h[1]
	sdot	z29.d, z9.h, z14.h[1]
	sdot	z28.d, z17.h, z14.h[1]
	sdot	z29.d, z7.h, z15.h[1]
	sdot	z28.d, z16.h, z15.h[1]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 384
	ld1h	z13.h, p7/z, [x11]
	add	x11, x3, 640
	ld1h	z12.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[0]
	add	x11, x3, 896
	ld1h	z14.h, p7/z, [x11]
	movprfx	z21, z31
	sdot	z21.d, z23.h, z12.h[0]
	add	x11, x3, 1152
	ld1h	z15.h, p7/z, [x11]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z12.h[0]
	add	x11, x1, 1856
	movprfx	z28, z31
	sdot	z28.d, z6.h, z12.h[0]
	sdot	z30.d, z26.h, z13.h[0]
	sdot	z21.d, z22.h, z13.h[0]
	sdot	z30.d, z25.h, z14.h[0]
	sdot	z21.d, z20.h, z14.h[0]
	sdot	z30.d, z24.h, z15.h[0]
	sdot	z21.d, z19.h, z15.h[0]
	sdot	z29.d, z8.h, z13.h[0]
	sdot	z28.d, z5.h, z13.h[0]
	sdot	z29.d, z9.h, z14.h[0]
	sdot	z28.d, z17.h, z14.h[0]
	sdot	z29.d, z7.h, z15.h[0]
	sdot	z28.d, z16.h, z15.h[0]
	uzp1	z30.s, z30.s, z21.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z29.h, z29.s, #4
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 1984
	movprfx	z30, z31
	sdot	z30.d, z27.h, z12.h[1]
	movprfx	z29, z31
	sdot	z29.d, z23.h, z12.h[1]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z12.h[1]
	movprfx	z27, z31
	sdot	z27.d, z6.h, z12.h[1]
	sdot	z30.d, z26.h, z13.h[1]
	sdot	z29.d, z22.h, z13.h[1]
	sdot	z30.d, z25.h, z14.h[1]
	sdot	z29.d, z20.h, z14.h[1]
	sdot	z30.d, z24.h, z15.h[1]
	sdot	z29.d, z19.h, z15.h[1]
	sdot	z28.d, z8.h, z13.h[1]
	sdot	z27.d, z5.h, z13.h[1]
	sdot	z28.d, z9.h, z14.h[1]
	sdot	z27.d, z17.h, z14.h[1]
	sdot	z28.d, z7.h, z15.h[1]
	sdot	z27.d, z16.h, z15.h[1]
	uzp1	z30.s, z30.s, z29.s
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z28.h, z28.s, #4
	uzp1	z30.h, z30.h, z28.h
	st1h	z30.h, p7, [x11]
	addvl	x11, sp, #4
	add	x11, x11, 112
	ldr	z18, [x11]
	addvl	x11, sp, #7
	add	x11, x11, 112
	ldr	z13, [x11]
	sub	z23.h, z18.h, z13.h
	addvl	x11, sp, #5
	add	x11, x11, 112
	ldr	z17, [x11]
	addvl	x11, sp, #6
	add	x11, x11, 112
	ldr	z16, [x11]
	sub	z22.h, z17.h, z16.h
	addvl	x11, sp, #8
	add	x11, x11, 112
	ldr	z12, [x11]
	addvl	x11, sp, #11
	add	x11, x11, 112
	ldr	z7, [x11]
	sub	z25.h, z12.h, z7.h
	addvl	x11, sp, #9
	add	x11, x11, 112
	ldr	z9, [x11]
	addvl	x11, sp, #10
	add	x11, x11, 112
	ldr	z8, [x11]
	sub	z24.h, z9.h, z8.h
	addvl	x11, sp, #12
	add	x11, x11, 112
	ldr	z6, [x11]
	addvl	x11, sp, #15
	add	x11, x11, 112
	ldr	z3, [x11]
	sub	z27.h, z6.h, z3.h
	addvl	x11, sp, #13
	add	x11, x11, 112
	ldr	z5, [x11]
	addvl	x11, sp, #14
	add	x11, x11, 112
	ldr	z4, [x11]
	sub	z26.h, z5.h, z4.h
	addvl	x11, sp, #16
	add	x11, x11, 112
	ldr	z2, [x11]
	addvl	x11, sp, #3
	add	x11, x11, 112
	ldr	z30, [x11]
	sub	z29.h, z2.h, z30.h
	addvl	x11, sp, #17
	add	x11, x11, 112
	ldr	z1, [x11]
	sub	z28.h, z0.h, z1.h
	add	x11, x3, 1184
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1312
	ld1h	z14.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[0]
	add	x11, x1, 128
	sdot	z30.d, z23.h, z15.h[0]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[0]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[0]
	sdot	z19.d, z25.h, z15.h[0]
	sdot	z21.d, z27.h, z15.h[0]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[0]
	uzp1	z30.s, z30.s, z19.s
	sdot	z20.d, z29.h, z15.h[0]
	rshrnb	z30.h, z30.s, #4
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 384
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[1]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[1]
	sdot	z30.d, z23.h, z15.h[1]
	sdot	z19.d, z25.h, z15.h[1]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[1]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[1]
	sdot	z21.d, z27.h, z15.h[1]
	sdot	z20.d, z29.h, z15.h[1]
	uzp1	z30.s, z30.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 1216
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1344
	ld1h	z14.h, p7/z, [x11]
	add	x11, x1, 640
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[0]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[0]
	sdot	z30.d, z23.h, z15.h[0]
	sdot	z19.d, z25.h, z15.h[0]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[0]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[0]
	sdot	z21.d, z27.h, z15.h[0]
	sdot	z20.d, z29.h, z15.h[0]
	uzp1	z30.s, z30.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 896
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[1]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[1]
	sdot	z30.d, z23.h, z15.h[1]
	sdot	z19.d, z25.h, z15.h[1]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[1]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[1]
	sdot	z21.d, z27.h, z15.h[1]
	sdot	z20.d, z29.h, z15.h[1]
	uzp1	z30.s, z30.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 1248
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1376
	ld1h	z14.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[0]
	add	x11, x1, 1152
	sdot	z30.d, z23.h, z15.h[0]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[0]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[0]
	sdot	z19.d, z25.h, z15.h[0]
	sdot	z21.d, z27.h, z15.h[0]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[0]
	uzp1	z30.s, z30.s, z19.s
	sdot	z20.d, z29.h, z15.h[0]
	rshrnb	z30.h, z30.s, #4
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	st1h	z30.h, p7, [x11]
	add	x11, x1, 1408
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[1]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[1]
	sdot	z30.d, z23.h, z15.h[1]
	sdot	z19.d, z25.h, z15.h[1]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[1]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[1]
	sdot	z21.d, z27.h, z15.h[1]
	sdot	z20.d, z29.h, z15.h[1]
	uzp1	z30.s, z30.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	st1h	z30.h, p7, [x11]
	add	x11, x3, 1280
	ld1h	z15.h, p7/z, [x11]
	add	x11, x3, 1408
	ld1h	z14.h, p7/z, [x11]
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[0]
	movprfx	z19, z31
	sdot	z19.d, z24.h, z14.h[0]
	sdot	z30.d, z23.h, z15.h[0]
	sdot	z19.d, z25.h, z15.h[0]
	movprfx	z21, z31
	sdot	z21.d, z26.h, z14.h[0]
	movprfx	z20, z31
	sdot	z20.d, z28.h, z14.h[0]
	sdot	z21.d, z27.h, z15.h[0]
	sdot	z20.d, z29.h, z15.h[0]
	uzp1	z30.s, z30.s, z19.s
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z21.h, z21.s, #4
	uzp1	z30.h, z30.h, z21.h
	add	x11, x1, 1664
	st1h	z30.h, p7, [x11]
	movprfx	z30, z31
	sdot	z30.d, z22.h, z14.h[1]
	sdot	z30.d, z23.h, z15.h[1]
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[1]
	sdot	z23.d, z25.h, z15.h[1]
	movprfx	z25, z31
	sdot	z25.d, z26.h, z14.h[1]
	uzp1	z30.s, z30.s, z23.s
	sdot	z25.d, z27.h, z15.h[1]
	rshrnb	z30.h, z30.s, #4
	movprfx	z27, z31
	sdot	z27.d, z28.h, z14.h[1]
	sdot	z27.d, z29.h, z15.h[1]
	uzp1	z25.s, z25.s, z27.s
	rshrnb	z25.h, z25.s, #4
	uzp1	z30.h, z30.h, z25.h
	add	x11, x1, 1920
	add	z27.h, z13.h, z18.h
	st1h	z30.h, p7, [x11]
	add	z30.h, z16.h, z17.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	sub	z27.h, z27.h, z30.h
	add	z28.h, z7.h, z12.h
	add	z30.h, z8.h, z9.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	sub	z28.h, z28.h, z30.h
	add	z29.h, z3.h, z6.h
	add	z30.h, z4.h, z5.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x11, sp, #3
	sub	z29.h, z29.h, z30.h
	add	z26.h, z1.h, z0.h
	add	x11, x11, 112
	ldr	z3, [x11]
	add	z30.h, z3.h, z2.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	add	x11, x3, 1440
	ld1h	z15.h, p7/z, [x11]
	sub	z30.h, z30.h, z26.h
	add	x11, x1, 256
	movprfx	z23, z31
	sdot	z23.d, z28.h, z15.h[0]
	movprfx	z24, z31
	sdot	z24.d, z30.h, z15.h[0]
	movprfx	z26, z31
	sdot	z26.d, z27.h, z15.h[0]
	movprfx	z25, z31
	sdot	z25.d, z29.h, z15.h[0]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x1, 768
	movprfx	z23, z31
	sdot	z23.d, z28.h, z15.h[1]
	movprfx	z24, z31
	sdot	z24.d, z30.h, z15.h[1]
	movprfx	z26, z31
	sdot	z26.d, z27.h, z15.h[1]
	movprfx	z25, z31
	sdot	z25.d, z29.h, z15.h[1]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x3, 1472
	ld1h	z15.h, p7/z, [x11]
	add	x11, x1, 1280
	movprfx	z26, z31
	sdot	z26.d, z27.h, z15.h[0]
	movprfx	z23, z31
	sdot	z23.d, z28.h, z15.h[0]
	movprfx	z24, z31
	sdot	z24.d, z30.h, z15.h[0]
	movprfx	z25, z31
	sdot	z25.d, z29.h, z15.h[0]
	uzp1	z26.s, z26.s, z23.s
	uzp1	z25.s, z25.s, z24.s
	rshrnb	z26.h, z26.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z26.h, z26.h, z25.h
	st1h	z26.h, p7, [x11]
	add	x11, x1, 1792
	movprfx	z26, z31
	sdot	z26.d, z27.h, z15.h[1]
	add	x1, x1, 32
	movprfx	z27, z31
	sdot	z27.d, z28.h, z15.h[1]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z15.h[1]
	sdot	z31.d, z30.h, z15.h[1]
	uzp1	z30.s, z26.s, z27.s
	uzp1	z31.s, z28.s, z31.s
	rshrnb	z30.h, z30.s, #4
	rshrnb	z31.h, z31.s, #4
	uzp1	z31.h, z30.h, z31.h
	st1h	z31.h, p7, [x11]
	add	x17, x17, x4
	add	x16, x16, x4
	add	x15, x15, x4
	add	x14, x14, x4
	add	x10, x10, x4
	add	x13, x13, x4
	add	x7, x7, x4
	add	x12, x12, x4
	add	x5, x5, x4
	add	x9, x9, x4
	add	x8, x8, x4
	add	x6, x6, x4
	cmp	x20, x1
	bne	.L2
	ldr	x21, [sp, 32]
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
	addvl	sp, sp, #31
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
	mov	x13, 37
	ptrue	p7.b, all
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	ld1w	z31.s, p7/z, [x2]
	mul	x12, x12, x13
	cntb	x6
	lsl	x6, x6, 5
	add	x5, x0, 2048
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0x28,0x1,0x1e,0x22
	add	x4, x2, 32
	sub	sp, sp, #64
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0xa,0x28,0x1,0x1e,0x23,0x40,0x22
	addvl	x3, sp, #28
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
	add	x3, x2, 64
	ld1w	z31.s, p7/z, [x3]
	addvl	x3, sp, #29
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 96
	ld1w	z31.s, p7/z, [x3]
	add	x3, sp, 64
	str	z31, [x3]
	add	x3, x2, 128
	ld1w	z31.s, p7/z, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 160
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #30
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 416
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, sp, #31
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 672
	ld1h	z31.h, p7/z, [x3]
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 928
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x6, #1
	rdvl	x6, #17
	add	x3, x3, 64
	lsl	x6, x6, 1
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 192
	ld1h	z31.h, p7/z, [x3]
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 448
	ld1h	z31.h, p7/z, [x3]
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, x2, 704
	ld1h	z31.h, p7/z, [x3]
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x2, 960
	ld1h	z10.h, p7/z, [x3]
	mov	z13.d, z10.d
.L7:
	add	x3, x0, 32
	ld1h	z28.h, p7/z, [x3]
	ld1h	z20.h, p7/z, [x0]
	add	x3, x0, 96
	ld1h	z24.h, p7/z, [x3]
	ptrue	p6.d, all
	add	x3, x0, 160
	ld1h	z17.h, p7/z, [x3]
	add	x3, x0, 224
	ld1h	z16.h, p7/z, [x3]
	add	x3, x0, 288
	ld1h	z26.h, p7/z, [x3]
	add	x3, x0, 352
	ld1h	z29.h, p7/z, [x3]
	add	x3, x0, 416
	ld1h	z21.h, p7/z, [x3]
	add	x3, x0, 480
	ld1h	z22.h, p7/z, [x3]
	add	x3, x0, 544
	ld1h	z30.h, p7/z, [x3]
	add	x3, x0, 608
	ld1h	z23.h, p7/z, [x3]
	add	x3, x0, 672
	ld1h	z18.h, p7/z, [x3]
	add	x3, x0, 736
	ld1h	z15.h, p7/z, [x3]
	add	x3, x0, 800
	ld1h	z27.h, p7/z, [x3]
	add	x3, x0, 864
	ld1h	z31.h, p7/z, [x3]
	add	x3, x0, 928
	ld1h	z19.h, p7/z, [x3]
	add	x3, x0, 992
	ld1h	z25.h, p7/z, [x3]
	add	x3, x0, 64
	ld1h	z14.h, p7/z, [x3]
	add	x3, x0, 128
	ld1h	z11.h, p7/z, [x3]
	zip1	z12.d, z20.d, z11.d
	add	x3, x0, 192
	zip2	z20.d, z20.d, z11.d
	ld1h	z10.h, p7/z, [x3]
	zip1	z11.d, z14.d, z10.d
	zip2	z14.d, z14.d, z10.d
	zip1	z2.d, z12.d, z11.d
	zip2	z11.d, z12.d, z11.d
	zip1	z12.d, z20.d, z14.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z12.d, p6/m, z12.d
// 0 "" 2
#NO_APP
	zip2	z20.d, z20.d, z14.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z14.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	rev	z17.h, z17.h
	rev	z16.h, z16.h
	rev	z28.h, z28.h
	zip1	z20.d, z28.d, z17.d
	rev	z24.h, z24.h
	zip2	z28.d, z28.d, z17.d
	zip1	z17.d, z24.d, z16.d
	zip2	z24.d, z24.d, z16.d
	zip1	z16.d, z20.d, z17.d
	zip2	z17.d, z20.d, z17.d
	zip1	z20.d, z28.d, z24.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z10.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z24.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z24.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	saddlb	z28.s, z14.h, z24.h
	saddlb	z20.s, z2.h, z16.h
	add	x3, x3, 64
	str	z16, [x3]
	ldr	z9, [x3]
	addvl	x3, sp, #4
	add	z20.s, z20.s, z28.s
	saddlt	z28.s, z14.h, z24.h
	add	x3, x3, 64
	str	z14, [x3]
	saddlt	z16.s, z2.h, z9.h
	addvl	x3, sp, #8
	add	z16.s, z16.s, z28.s
	saddlb	z28.s, z12.h, z10.h
	add	x3, x3, 64
	str	z24, [x3]
	mov	z24.d, z17.d
	addvl	x3, sp, #2
	saddlb	z17.s, z11.h, z17.h
	add	z17.s, z17.s, z28.s
	add	x3, x3, 64
	str	z11, [x3]
	ldr	z28, [x3]
	addvl	x3, sp, #6
	add	x3, x3, 64
	str	z24, [x3]
	ldr	z9, [x3]
	addvl	x3, sp, #3
	saddlt	z28.s, z28.h, z9.h
	saddlt	z24.s, z12.h, z10.h
	add	x3, x3, 64
	str	z12, [x3]
	add	z24.s, z28.s, z24.s
	addvl	x3, sp, #7
	add	x3, x3, 64
	str	z10, [x3]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z17.d, p6/m, z17.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z28.s, z20.s, z16.s
	zip2	z20.s, z20.s, z16.s
	zip1	z14.s, z24.s, z17.s
	zip2	z24.s, z24.s, z17.s
	add	z28.s, z28.s, z14.s
	add	z24.s, z20.s, z24.s
	uzp2	z20.d, z28.d, z24.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z20.d, p6/m, z20.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z28.d, z28.d, z24.d
	add	z16.s, z20.s, z28.s
	sub	z28.s, z28.s, z20.s
	ld1w	z20.s, p7/z, [x4]
	movprfx	z6, z16
	mul	z6.s, p7/m, z6.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z6.s, p5/m, z6.s, z6.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z8, [x3]
	movprfx	z9, z8
	mul	z9.s, p7/m, z9.s, z28.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z9.s, p5/m, z9.s, z9.s
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z4, [x3]
	mul	z16.s, p7/m, z16.s, z4.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z16.s, p5/m, z16.s, z16.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z3, [x3]
	mul	z28.s, p7/m, z28.s, z3.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	add	x3, x0, 256
	ld1h	z24.h, p7/z, [x3]
	add	x3, x0, 320
	ld1h	z17.h, p7/z, [x3]
	add	x3, x0, 384
	ld1h	z12.h, p7/z, [x3]
	zip1	z14.d, z24.d, z12.d
	add	x3, x0, 448
	zip2	z24.d, z24.d, z12.d
	ld1h	z11.h, p7/z, [x3]
	zip1	z12.d, z17.d, z11.d
	zip2	z17.d, z17.d, z11.d
	zip1	z7.d, z14.d, z12.d
	zip2	z5.d, z14.d, z12.d
	zip1	z14.d, z24.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z1.d, p6/m, z14.d
// 0 "" 2
#NO_APP
	zip2	z24.d, z24.d, z17.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z0.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	rev	z21.h, z21.h
	rev	z24.h, z22.h
	rev	z26.h, z26.h
	rev	z29.h, z29.h
	zip1	z22.d, z26.d, z21.d
	zip2	z26.d, z26.d, z21.d
	zip1	z21.d, z29.d, z24.d
	zip2	z29.d, z29.d, z24.d
	zip1	z17.d, z22.d, z21.d
	zip1	z14.d, z26.d, z29.d
	zip2	z22.d, z22.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z14.d, p6/m, z14.d
// 0 "" 2
#NO_APP
	zip2	z26.d, z26.d, z29.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	saddlb	z29.s, z0.h, z26.h
	mov	z21.d, z17.d
	add	x3, x3, 64
	saddlb	z17.s, z7.h, z17.h
	add	z17.s, z17.s, z29.s
	str	z7, [x3]
	ldr	z29, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	str	z21, [x3]
	ldr	z21, [x3]
	addvl	x3, sp, #12
	saddlt	z11.s, z29.h, z21.h
	saddlt	z29.s, z0.h, z26.h
	add	x3, x3, 64
	str	z0, [x3]
	add	z11.s, z11.s, z29.s
	addvl	x3, sp, #10
	saddlb	z29.s, z1.h, z14.h
	saddlb	z12.s, z5.h, z22.h
	add	x3, x3, 64
	add	z12.s, z12.s, z29.s
	str	z5, [x3]
	ldr	z29, [x3]
	addvl	x3, sp, #11
	saddlt	z29.s, z29.h, z22.h
	add	x3, x3, 64
	saddlt	z21.s, z1.h, z14.h
	add	z21.s, z29.s, z21.s
	str	z1, [x3]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z12.d, p6/m, z12.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip1	z10.s, z21.s, z12.s
	zip1	z29.s, z17.s, z11.s
	zip2	z21.s, z21.s, z12.s
	add	z29.s, z29.s, z10.s
	zip2	z17.s, z17.s, z11.s
	add	z21.s, z17.s, z21.s
	uzp2	z12.d, z29.d, z21.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z12.d, p6/m, z12.d
// 0 "" 2
#NO_APP
	uzp1	z29.d, z29.d, z21.d
	add	z17.s, z12.s, z29.s
	sub	z29.s, z29.s, z12.s
	movprfx	z7, z17
	mul	z7.s, p7/m, z7.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z7.s, p5/m, z7.s, z7.s
// 0 "" 2
#NO_APP
	mov	z24.d, z8.d
	movprfx	z10, z8
	mul	z10.s, p7/m, z10.s, z29.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z10.s, p5/m, z10.s, z10.s
// 0 "" 2
#NO_APP
	mul	z17.s, p7/m, z17.s, z4.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z17.s, p5/m, z17.s, z17.s
// 0 "" 2
#NO_APP
	mul	z29.s, p7/m, z29.s, z3.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	add	x3, x0, 512
	ld1h	z21.h, p7/z, [x3]
	add	x3, x0, 576
	ld1h	z12.h, p7/z, [x3]
	add	x3, x0, 640
	ld1h	z8.h, p7/z, [x3]
	zip1	z11.d, z21.d, z8.d
	add	x3, x0, 704
	ld1h	z5.h, p7/z, [x3]
	zip2	z21.d, z21.d, z8.d
	zip1	z8.d, z12.d, z5.d
	zip2	z12.d, z12.d, z5.d
	zip1	z5.d, z11.d, z8.d
	zip2	z8.d, z11.d, z8.d
	zip1	z11.d, z21.d, z12.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z11.d, p6/m, z11.d
// 0 "" 2
#NO_APP
	zip2	z21.d, z21.d, z12.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	rev	z18.h, z18.h
	rev	z15.h, z15.h
	mov	z12.d, z21.d
	rev	z30.h, z30.h
	zip1	z21.d, z30.d, z18.d
	rev	z23.h, z23.h
	zip2	z30.d, z30.d, z18.d
	zip1	z18.d, z23.d, z15.d
	zip2	z23.d, z23.d, z15.d
	zip2	z1.d, z21.d, z18.d
	zip1	z15.d, z21.d, z18.d
	zip1	z21.d, z30.d, z23.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z18.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	mov	z0.d, z18.d
	zip2	z30.d, z30.d, z23.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	mov	z23.d, z5.d
	saddlb	z21.s, z5.h, z15.h
	add	x3, x3, 64
	mov	z5.d, z30.d
	saddlb	z30.s, z12.h, z30.h
	add	z21.s, z21.s, z30.s
	str	z23, [x3]
	ldr	z30, [x3]
	addvl	x3, sp, #18
	saddlb	z18.s, z8.h, z1.h
	add	x3, x3, 64
	str	z15, [x3]
	ldr	z23, [x3]
	addvl	x3, sp, #17
	saddlt	z15.s, z30.h, z23.h
	saddlt	z30.s, z12.h, z5.h
	add	x3, x3, 64
	str	z12, [x3]
	add	z15.s, z15.s, z30.s
	addvl	x3, sp, #21
	saddlb	z30.s, z11.h, z0.h
	add	z18.s, z18.s, z30.s
	add	x3, x3, 64
	str	z5, [x3]
	saddlt	z23.s, z11.h, z0.h
	addvl	x3, sp, #15
	add	x3, x3, 64
	str	z8, [x3]
	ldr	z30, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z1, [x3]
	ldr	z8, [x3]
	addvl	x3, sp, #16
	saddlt	z30.s, z30.h, z8.h
	add	z23.s, z30.s, z23.s
	add	x3, x3, 64
	str	z11, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z0, [x3]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z18.d, p6/m, z18.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	zip1	z30.s, z21.s, z15.s
	zip2	z21.s, z21.s, z15.s
	zip1	z12.s, z23.s, z18.s
	zip2	z23.s, z23.s, z18.s
	add	z30.s, z30.s, z12.s
	add	z23.s, z21.s, z23.s
	uzp2	z21.d, z30.d, z23.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	uzp1	z30.d, z30.d, z23.d
	add	z18.s, z21.s, z30.s
	sub	z30.s, z30.s, z21.s
	movprfx	z8, z18
	mul	z8.s, p7/m, z8.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z8.s, p5/m, z8.s, z8.s
// 0 "" 2
#NO_APP
	movprfx	z11, z24
	mul	z11.s, p7/m, z11.s, z30.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z11.s, p5/m, z11.s, z11.s
// 0 "" 2
#NO_APP
	mul	z18.s, p7/m, z18.s, z4.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z18.s, p5/m, z18.s, z18.s
// 0 "" 2
#NO_APP
	mul	z30.s, p7/m, z30.s, z3.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	add	x3, x0, 768
	ld1h	z21.h, p7/z, [x3]
	add	x3, x0, 832
	ld1h	z23.h, p7/z, [x3]
	add	x3, x0, 896
	ld1h	z15.h, p7/z, [x3]
	zip1	z12.d, z21.d, z15.d
	add	x3, x0, 960
	ld1h	z5.h, p7/z, [x3]
	zip2	z21.d, z21.d, z15.d
	zip1	z15.d, z23.d, z5.d
	zip2	z23.d, z23.d, z5.d
	zip1	z4.d, z12.d, z15.d
	zip2	z3.d, z12.d, z15.d
	zip1	z5.d, z21.d, z23.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z15.d, p6/m, z5.d
// 0 "" 2
#NO_APP
	mov	z0.d, z15.d
	zip2	z21.d, z21.d, z23.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	rev	z19.h, z19.h
	rev	z25.h, z25.h
	rev	z27.h, z27.h
	rev	z31.h, z31.h
	zip1	z23.d, z27.d, z19.d
	mov	z12.d, z21.d
	zip2	z27.d, z27.d, z19.d
	zip1	z19.d, z31.d, z25.d
	zip2	z31.d, z31.d, z25.d
	zip1	z25.d, z23.d, z19.d
	zip1	z15.d, z27.d, z31.d
	zip2	z23.d, z23.d, z19.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z15.d, p6/m, z15.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z31.d
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	mov	z21.d, z4.d
	saddlb	z4.s, z4.h, z25.h
	add	x3, x3, 64
	str	z25, [x3]
	ldr	z25, [x3]
	addvl	x3, sp, #24
	saddlb	z31.s, z12.h, z27.h
	add	z4.s, z4.s, z31.s
	add	x3, x3, 64
	saddlt	z31.s, z12.h, z27.h
	str	z12, [x3]
	addvl	x3, sp, #22
	saddlt	z1.s, z21.h, z25.h
	add	z1.s, z1.s, z31.s
	add	x3, x3, 64
	saddlb	z31.s, z0.h, z15.h
	mov	z19.d, z3.d
	saddlb	z3.s, z3.h, z23.h
	add	z3.s, z3.s, z31.s
	str	z19, [x3]
	ldr	z31, [x3]
	addvl	x3, sp, #23
	saddlt	z31.s, z31.h, z23.h
	add	x3, x3, 64
	saddlt	z19.s, z0.h, z15.h
	add	z19.s, z31.s, z19.s
	str	z0, [x3]
#APP
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z3.d, p6/m, z3.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z4.s, z1.s
	zip2	z4.s, z4.s, z1.s
	zip1	z0.s, z19.s, z3.s
	zip2	z19.s, z19.s, z3.s
	add	z31.s, z31.s, z0.s
	add	z19.s, z4.s, z19.s
	uzp2	z4.d, z31.d, z19.d
#APP
// 43 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revw z4.d, p6/m, z4.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z31.d, z19.d
	add	z19.s, z4.s, z31.s
	sub	z31.s, z31.s, z4.s
	mul	z20.s, p7/m, z20.s, z19.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	movprfx	z4, z24
	mul	z4.s, p7/m, z4.s, z31.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z4.s, p5/m, z4.s, z4.s
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z25, [x3]
	mul	z19.s, p7/m, z19.s, z25.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z3, [x3]
	mul	z31.s, p7/m, z31.s, z3.s
#APP
// 52 "kernels/dct32/candidates/best_op_r16.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	uzp1	z1.s, z7.s, z7.s
	uzp1	z0.s, z6.s, z6.s
	add	x3, x3, 64
	ldr	z25, [x3]
	uzp1	z7.s, z20.s, z20.s
	addvl	x3, sp, #26
	uzp1	z6.s, z8.s, z8.s
	tbl	z6.s, {z6.s - z7.s}, z25.s
	rshrnb	z6.h, z6.s, #11
	uzp1	z6.h, z6.h, z6.h
	add	x3, x3, 64
	uzp1	z7.s, z10.s, z10.s
	tbl	z0.s, {z0.s - z1.s}, z25.s
	uzp1	z8.s, z11.s, z11.s
	uzp1	z10.s, z16.s, z16.s
	uzp1	z11.s, z17.s, z17.s
	uzp1	z16.s, z18.s, z18.s
	uzp1	z17.s, z19.s, z19.s
	tbl	z10.s, {z10.s - z11.s}, z25.s
	uzp1	z19.s, z29.s, z29.s
	tbl	z16.s, {z16.s - z17.s}, z25.s
	uzp1	z29.s, z31.s, z31.s
	uzp1	z18.s, z28.s, z28.s
	rshrnb	z0.h, z0.s, #11
	tbl	z18.s, {z18.s - z19.s}, z25.s
	uzp1	z0.h, z0.h, z0.h
	uzp1	z28.s, z30.s, z30.s
	rshrnb	z10.h, z10.s, #11
	tbl	z28.s, {z28.s - z29.s}, z25.s
	uzp1	z10.h, z10.h, z10.h
	rshrnb	z16.h, z16.s, #11
	rshrnb	z18.h, z18.s, #11
	uzp1	z16.h, z16.h, z16.h
	uzp1	z18.h, z18.h, z18.h
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z28.h
	stp	q0, q6, [x1]
	uzp1	z6.s, z9.s, z9.s
	uzp1	z9.s, z4.s, z4.s
	tbl	z6.s, {z6.s - z7.s}, z25.s
	tbl	z8.s, {z8.s - z9.s}, z25.s
	rshrnb	z6.h, z6.s, #11
	rshrnb	z8.h, z8.s, #11
	uzp1	z6.h, z6.h, z6.h
	uzp1	z8.h, z8.h, z8.h
	stp	q6, q8, [x1, 512]
	str	q10, [x1, 1024]
	str	q16, [x1, 1040]
	str	q18, [x1, 1536]
	str	q28, [x1, 1552]
	str	z2, [x3]
	ldr	z28, [x3]
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z18.h, z28.h, z20.h
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z19.h, z28.h, z20.h
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z12, [x3]
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z10, [x3]
	sub	z31.h, z12.h, z10.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z17.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z31, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z30, [x3]
	sub	z31.h, z31.h, z30.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z16.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z6.h, z28.h, z20.h
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z28, [x3]
	sub	z7.h, z28.h, z22.h
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z1, [x3]
	sub	z31.h, z1.h, z14.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z4.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z0, [x3]
	sub	z31.h, z0.h, z26.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z3.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z0.h, z28.h, z20.h
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z1.h, z28.h, z20.h
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z29, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z28, [x3]
	sub	z31.h, z29.h, z28.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z5.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z25, [x3]
	sub	z31.h, z28.h, z25.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z12.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	str	z21, [x3]
	ldr	z20, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z9, [x3]
	sub	z24.h, z20.h, z9.h
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z21.h, z20.h, z23.h
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z31.h, z20.h, z15.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z25.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z9, [x3]
	sub	z31.h, z9.h, z27.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z2.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	cntb	x6
	movi	d31, #0
	add	x3, x3, 64
	ldr	z11, [x3]
	lsl	x6, x6, 5
	addvl	x3, sp, #30
	movprfx	z30, z31
	sdot	z30.d, z19.h, z11.h[0]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z11.h[0]
	add	x3, x3, 64
	ldr	z10, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z11.h[0]
	cntb	x3
	movprfx	z28, z31
	sdot	z28.d, z21.h, z11.h[0]
	sdot	z30.d, z18.h, z10.h[0]
	lsl	x3, x3, 5
	sdot	z20.d, z6.h, z10.h[0]
	sdot	z29.d, z0.h, z10.h[0]
	add	x3, sp, x3
	sdot	z28.d, z24.h, z10.h[0]
	add	x3, x3, 64
	ldr	z9, [x3]
	sdot	z30.d, z17.h, z9.h[0]
	addvl	x3, x6, #1
	rdvl	x6, #17
	sdot	z20.d, z4.h, z9.h[0]
	add	x3, x3, 64
	sdot	z29.d, z5.h, z9.h[0]
	sdot	z28.d, z25.h, z9.h[0]
	add	x3, sp, x3
	ldr	z8, [x3]
	lsl	x6, x6, 1
	add	x3, x1, 64
	sdot	z20.d, z3.h, z8.h[0]
	sdot	z28.d, z2.h, z8.h[0]
	sdot	z30.d, z16.h, z8.h[0]
	sdot	z29.d, z12.h, z8.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 192
	movprfx	z30, z31
	sdot	z30.d, z19.h, z11.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z11.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z11.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z11.h[1]
	sdot	z30.d, z18.h, z10.h[1]
	sdot	z20.d, z6.h, z10.h[1]
	sdot	z30.d, z17.h, z9.h[1]
	sdot	z20.d, z4.h, z9.h[1]
	sdot	z30.d, z16.h, z8.h[1]
	sdot	z20.d, z3.h, z8.h[1]
	sdot	z29.d, z0.h, z10.h[1]
	sdot	z28.d, z24.h, z10.h[1]
	sdot	z29.d, z5.h, z9.h[1]
	sdot	z28.d, z25.h, z9.h[1]
	sdot	z29.d, z12.h, z8.h[1]
	sdot	z28.d, z2.h, z8.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	addvl	x3, x6, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z11.h[0]
	rdvl	x3, #17
	movprfx	z20, z31
	sdot	z20.d, z7.h, z11.h[0]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z11.h[0]
	lsl	x3, x3, 1
	movprfx	z28, z31
	sdot	z28.d, z21.h, z11.h[0]
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
	sdot	z30.d, z18.h, z10.h[0]
	cntb	x3, all, mul #9
	sdot	z20.d, z6.h, z10.h[0]
	sdot	z29.d, z0.h, z10.h[0]
	lsl	x3, x3, 2
	sdot	z28.d, z24.h, z10.h[0]
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	sdot	z30.d, z17.h, z9.h[0]
	add	x3, x1, 320
	sdot	z30.d, z16.h, z13.h[0]
	sdot	z20.d, z4.h, z9.h[0]
	sdot	z29.d, z5.h, z9.h[0]
	sdot	z20.d, z3.h, z13.h[0]
	sdot	z29.d, z12.h, z13.h[0]
	sdot	z28.d, z25.h, z9.h[0]
	uzp1	z30.s, z30.s, z20.s
	sdot	z28.d, z2.h, z13.h[0]
	rshrnb	z30.h, z30.s, #11
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 448
	movprfx	z30, z31
	sdot	z30.d, z19.h, z11.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z11.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z11.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z11.h[1]
	sdot	z30.d, z18.h, z10.h[1]
	sdot	z20.d, z6.h, z10.h[1]
	sdot	z30.d, z17.h, z9.h[1]
	sdot	z20.d, z4.h, z9.h[1]
	sdot	z30.d, z16.h, z13.h[1]
	sdot	z20.d, z3.h, z13.h[1]
	sdot	z29.d, z0.h, z10.h[1]
	sdot	z28.d, z24.h, z10.h[1]
	sdot	z29.d, z5.h, z9.h[1]
	sdot	z28.d, z25.h, z9.h[1]
	sdot	z29.d, z12.h, z13.h[1]
	sdot	z28.d, z2.h, z13.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x2, 224
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 480
	ld1h	z8.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[0]
	add	x3, x2, 736
	ld1h	z10.h, p7/z, [x3]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[0]
	add	x3, x2, 992
	ld1h	z11.h, p7/z, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[0]
	add	x3, x1, 576
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[0]
	sdot	z30.d, z18.h, z9.h[0]
	sdot	z20.d, z6.h, z9.h[0]
	sdot	z30.d, z17.h, z10.h[0]
	sdot	z20.d, z4.h, z10.h[0]
	sdot	z30.d, z16.h, z11.h[0]
	sdot	z20.d, z3.h, z11.h[0]
	sdot	z29.d, z0.h, z9.h[0]
	sdot	z28.d, z24.h, z9.h[0]
	sdot	z29.d, z5.h, z10.h[0]
	sdot	z28.d, z25.h, z10.h[0]
	sdot	z29.d, z12.h, z11.h[0]
	sdot	z28.d, z2.h, z11.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 704
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[1]
	sdot	z30.d, z18.h, z9.h[1]
	sdot	z20.d, z6.h, z9.h[1]
	sdot	z30.d, z17.h, z10.h[1]
	sdot	z20.d, z4.h, z10.h[1]
	sdot	z30.d, z16.h, z11.h[1]
	sdot	z20.d, z3.h, z11.h[1]
	sdot	z29.d, z0.h, z9.h[1]
	sdot	z28.d, z24.h, z9.h[1]
	sdot	z29.d, z5.h, z10.h[1]
	sdot	z28.d, z25.h, z10.h[1]
	sdot	z29.d, z12.h, z11.h[1]
	sdot	z28.d, z2.h, z11.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x2, 256
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 512
	ld1h	z8.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[0]
	add	x3, x2, 768
	ld1h	z10.h, p7/z, [x3]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[0]
	add	x3, x2, 1024
	ld1h	z11.h, p7/z, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[0]
	add	x3, x1, 832
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[0]
	sdot	z30.d, z18.h, z9.h[0]
	sdot	z20.d, z6.h, z9.h[0]
	sdot	z30.d, z17.h, z10.h[0]
	sdot	z20.d, z4.h, z10.h[0]
	sdot	z30.d, z16.h, z11.h[0]
	sdot	z20.d, z3.h, z11.h[0]
	sdot	z29.d, z0.h, z9.h[0]
	sdot	z28.d, z24.h, z9.h[0]
	sdot	z29.d, z5.h, z10.h[0]
	sdot	z28.d, z25.h, z10.h[0]
	sdot	z29.d, z12.h, z11.h[0]
	sdot	z28.d, z2.h, z11.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 960
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[1]
	sdot	z30.d, z18.h, z9.h[1]
	sdot	z20.d, z6.h, z9.h[1]
	sdot	z30.d, z17.h, z10.h[1]
	sdot	z20.d, z4.h, z10.h[1]
	sdot	z30.d, z16.h, z11.h[1]
	sdot	z20.d, z3.h, z11.h[1]
	sdot	z29.d, z0.h, z9.h[1]
	sdot	z28.d, z24.h, z9.h[1]
	sdot	z29.d, z5.h, z10.h[1]
	sdot	z28.d, z25.h, z10.h[1]
	sdot	z29.d, z12.h, z11.h[1]
	sdot	z28.d, z2.h, z11.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x2, 288
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 544
	ld1h	z8.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[0]
	add	x3, x2, 800
	ld1h	z10.h, p7/z, [x3]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[0]
	add	x3, x2, 1056
	ld1h	z11.h, p7/z, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[0]
	add	x3, x1, 1088
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[0]
	sdot	z30.d, z18.h, z9.h[0]
	sdot	z20.d, z6.h, z9.h[0]
	sdot	z30.d, z17.h, z10.h[0]
	sdot	z20.d, z4.h, z10.h[0]
	sdot	z30.d, z16.h, z11.h[0]
	sdot	z20.d, z3.h, z11.h[0]
	sdot	z29.d, z0.h, z9.h[0]
	sdot	z28.d, z24.h, z9.h[0]
	sdot	z29.d, z5.h, z10.h[0]
	sdot	z28.d, z25.h, z10.h[0]
	sdot	z29.d, z12.h, z11.h[0]
	sdot	z28.d, z2.h, z11.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 1216
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[1]
	sdot	z30.d, z18.h, z9.h[1]
	sdot	z20.d, z6.h, z9.h[1]
	sdot	z30.d, z17.h, z10.h[1]
	sdot	z20.d, z4.h, z10.h[1]
	sdot	z30.d, z16.h, z11.h[1]
	sdot	z20.d, z3.h, z11.h[1]
	sdot	z29.d, z0.h, z9.h[1]
	sdot	z28.d, z24.h, z9.h[1]
	sdot	z29.d, z5.h, z10.h[1]
	sdot	z28.d, z25.h, z10.h[1]
	sdot	z29.d, z12.h, z11.h[1]
	sdot	z28.d, z2.h, z11.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x2, 320
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 576
	ld1h	z8.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[0]
	add	x3, x2, 832
	ld1h	z10.h, p7/z, [x3]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[0]
	add	x3, x2, 1088
	ld1h	z11.h, p7/z, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[0]
	add	x3, x1, 1344
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[0]
	sdot	z30.d, z18.h, z9.h[0]
	sdot	z20.d, z6.h, z9.h[0]
	sdot	z30.d, z17.h, z10.h[0]
	sdot	z20.d, z4.h, z10.h[0]
	sdot	z30.d, z16.h, z11.h[0]
	sdot	z20.d, z3.h, z11.h[0]
	sdot	z29.d, z0.h, z9.h[0]
	sdot	z28.d, z24.h, z9.h[0]
	sdot	z29.d, z5.h, z10.h[0]
	sdot	z28.d, z25.h, z10.h[0]
	sdot	z29.d, z12.h, z11.h[0]
	sdot	z28.d, z2.h, z11.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 1472
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[1]
	sdot	z30.d, z18.h, z9.h[1]
	sdot	z20.d, z6.h, z9.h[1]
	sdot	z30.d, z17.h, z10.h[1]
	sdot	z20.d, z4.h, z10.h[1]
	sdot	z30.d, z16.h, z11.h[1]
	sdot	z20.d, z3.h, z11.h[1]
	sdot	z29.d, z0.h, z9.h[1]
	sdot	z28.d, z24.h, z9.h[1]
	sdot	z29.d, z5.h, z10.h[1]
	sdot	z28.d, z25.h, z10.h[1]
	sdot	z29.d, z12.h, z11.h[1]
	sdot	z28.d, z2.h, z11.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x2, 352
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 608
	ld1h	z8.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[0]
	add	x3, x2, 864
	ld1h	z10.h, p7/z, [x3]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[0]
	add	x3, x2, 1120
	ld1h	z11.h, p7/z, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[0]
	add	x3, x1, 1600
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[0]
	sdot	z30.d, z18.h, z9.h[0]
	sdot	z20.d, z6.h, z9.h[0]
	sdot	z30.d, z17.h, z10.h[0]
	sdot	z20.d, z4.h, z10.h[0]
	sdot	z30.d, z16.h, z11.h[0]
	sdot	z20.d, z3.h, z11.h[0]
	sdot	z29.d, z0.h, z9.h[0]
	sdot	z28.d, z24.h, z9.h[0]
	sdot	z29.d, z5.h, z10.h[0]
	sdot	z28.d, z25.h, z10.h[0]
	sdot	z29.d, z12.h, z11.h[0]
	sdot	z28.d, z2.h, z11.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 1728
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[1]
	sdot	z30.d, z18.h, z9.h[1]
	sdot	z20.d, z6.h, z9.h[1]
	sdot	z30.d, z17.h, z10.h[1]
	sdot	z20.d, z4.h, z10.h[1]
	sdot	z30.d, z16.h, z11.h[1]
	sdot	z20.d, z3.h, z11.h[1]
	sdot	z29.d, z0.h, z9.h[1]
	sdot	z28.d, z24.h, z9.h[1]
	sdot	z29.d, z5.h, z10.h[1]
	sdot	z28.d, z25.h, z10.h[1]
	sdot	z29.d, z12.h, z11.h[1]
	sdot	z28.d, z2.h, z11.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x2, 384
	ld1h	z9.h, p7/z, [x3]
	add	x3, x2, 640
	ld1h	z8.h, p7/z, [x3]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[0]
	add	x3, x2, 896
	ld1h	z10.h, p7/z, [x3]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[0]
	add	x3, x2, 1152
	ld1h	z11.h, p7/z, [x3]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[0]
	add	x3, x1, 1856
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[0]
	sdot	z30.d, z18.h, z9.h[0]
	sdot	z20.d, z6.h, z9.h[0]
	sdot	z30.d, z17.h, z10.h[0]
	sdot	z20.d, z4.h, z10.h[0]
	sdot	z30.d, z16.h, z11.h[0]
	sdot	z20.d, z3.h, z11.h[0]
	sdot	z29.d, z0.h, z9.h[0]
	sdot	z28.d, z24.h, z9.h[0]
	sdot	z29.d, z5.h, z10.h[0]
	sdot	z28.d, z25.h, z10.h[0]
	sdot	z29.d, z12.h, z11.h[0]
	sdot	z28.d, z2.h, z11.h[0]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	add	x3, x1, 1984
	movprfx	z30, z31
	sdot	z30.d, z19.h, z8.h[1]
	movprfx	z20, z31
	sdot	z20.d, z7.h, z8.h[1]
	movprfx	z29, z31
	sdot	z29.d, z1.h, z8.h[1]
	movprfx	z28, z31
	sdot	z28.d, z21.h, z8.h[1]
	sdot	z30.d, z18.h, z9.h[1]
	sdot	z20.d, z6.h, z9.h[1]
	sdot	z30.d, z17.h, z10.h[1]
	sdot	z20.d, z4.h, z10.h[1]
	sdot	z30.d, z16.h, z11.h[1]
	sdot	z20.d, z3.h, z11.h[1]
	sdot	z29.d, z0.h, z9.h[1]
	sdot	z28.d, z24.h, z9.h[1]
	sdot	z29.d, z5.h, z10.h[1]
	sdot	z28.d, z25.h, z10.h[1]
	sdot	z29.d, z12.h, z11.h[1]
	sdot	z28.d, z2.h, z11.h[1]
	uzp1	z30.s, z30.s, z20.s
	uzp1	z29.s, z29.s, z28.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x3]
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z16, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z6, [x3]
	add	z30.h, z16.h, z6.h
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z17, [x3]
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z16, [x3]
	add	z29.h, z17.h, z16.h
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z12, [x3]
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z20.h, z12.h, z10.h
	addvl	x3, sp, #4
	sub	z19.h, z29.h, z20.h
	add	z29.h, z29.h, z20.h
	add	x3, x3, 64
	ldr	z28, [x3]
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z24, [x3]
	add	z18.h, z28.h, z24.h
	addvl	x3, sp, #13
	sub	z28.h, z30.h, z18.h
	add	z30.h, z30.h, z18.h
	add	x3, x3, 64
	ldr	z24, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z17, [x3]
	add	z24.h, z24.h, z17.h
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z17, [x3]
	add	z22.h, z22.h, z17.h
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z1, [x3]
	add	z14.h, z1.h, z14.h
	addvl	x3, sp, #12
	sub	z11.h, z22.h, z14.h
	add	x3, x3, 64
	ldr	z0, [x3]
	add	z26.h, z0.h, z26.h
	addvl	x3, sp, #18
	sub	z16.h, z24.h, z26.h
	add	x3, x3, 64
	ldr	z17, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z12, [x3]
	add	z17.h, z17.h, z12.h
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z12, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z10.h, z12.h, z10.h
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z25, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z8.h, z25.h, z5.h
	addvl	x3, sp, #17
	sub	z7.h, z10.h, z8.h
	add	x3, x3, 64
	ldr	z25, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z6.h, z25.h, z5.h
	addvl	x3, sp, #25
	sub	z9.h, z17.h, z6.h
	add	x3, x3, 64
	ldr	z12, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z21, [x3]
	add	z25.h, z12.h, z21.h
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z21, [x3]
	add	z23.h, z23.h, z21.h
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z21, [x3]
	add	z15.h, z21.h, z15.h
	addvl	x3, sp, #24
	sub	z5.h, z23.h, z15.h
	add	x3, x3, 64
	ldr	z21, [x3]
	add	z27.h, z21.h, z27.h
	add	x3, x2, 1184
	ld1h	z4.h, p7/z, [x3]
	sub	z12.h, z25.h, z27.h
	add	x3, x2, 1312
	ld1h	z3.h, p7/z, [x3]
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[0]
	add	x3, x1, 128
	sdot	z21.d, z28.h, z4.h[0]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[0]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[0]
	sdot	z0.d, z16.h, z4.h[0]
	sdot	z2.d, z9.h, z4.h[0]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[0]
	uzp1	z21.s, z21.s, z0.s
	sdot	z1.d, z12.h, z4.h[0]
	rshrnb	z21.h, z21.s, #11
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	add	x3, x1, 384
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[1]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[1]
	sdot	z21.d, z28.h, z4.h[1]
	sdot	z0.d, z16.h, z4.h[1]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[1]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[1]
	sdot	z2.d, z9.h, z4.h[1]
	sdot	z1.d, z12.h, z4.h[1]
	uzp1	z21.s, z21.s, z0.s
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z21.h, z21.s, #11
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	add	x3, x2, 1216
	ld1h	z4.h, p7/z, [x3]
	add	x3, x2, 1344
	ld1h	z3.h, p7/z, [x3]
	add	x3, x1, 640
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[0]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[0]
	sdot	z21.d, z28.h, z4.h[0]
	sdot	z0.d, z16.h, z4.h[0]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[0]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[0]
	sdot	z2.d, z9.h, z4.h[0]
	sdot	z1.d, z12.h, z4.h[0]
	uzp1	z21.s, z21.s, z0.s
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z21.h, z21.s, #11
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	add	x3, x1, 896
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[1]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[1]
	sdot	z21.d, z28.h, z4.h[1]
	sdot	z0.d, z16.h, z4.h[1]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[1]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[1]
	sdot	z2.d, z9.h, z4.h[1]
	sdot	z1.d, z12.h, z4.h[1]
	uzp1	z21.s, z21.s, z0.s
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z21.h, z21.s, #11
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	add	x3, x2, 1248
	ld1h	z4.h, p7/z, [x3]
	add	x3, x2, 1376
	ld1h	z3.h, p7/z, [x3]
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[0]
	add	x3, x1, 1152
	sdot	z21.d, z28.h, z4.h[0]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[0]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[0]
	sdot	z0.d, z16.h, z4.h[0]
	sdot	z2.d, z9.h, z4.h[0]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[0]
	uzp1	z21.s, z21.s, z0.s
	sdot	z1.d, z12.h, z4.h[0]
	rshrnb	z21.h, z21.s, #11
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	add	x3, x1, 1408
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[1]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[1]
	sdot	z21.d, z28.h, z4.h[1]
	sdot	z0.d, z16.h, z4.h[1]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[1]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[1]
	sdot	z2.d, z9.h, z4.h[1]
	sdot	z1.d, z12.h, z4.h[1]
	uzp1	z21.s, z21.s, z0.s
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z21.h, z21.s, #11
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	add	x3, x2, 1280
	ld1h	z4.h, p7/z, [x3]
	add	x3, x2, 1408
	ld1h	z3.h, p7/z, [x3]
	add	x3, x1, 1664
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[0]
	movprfx	z0, z31
	sdot	z0.d, z11.h, z3.h[0]
	sdot	z21.d, z28.h, z4.h[0]
	sdot	z0.d, z16.h, z4.h[0]
	movprfx	z2, z31
	sdot	z2.d, z7.h, z3.h[0]
	movprfx	z1, z31
	sdot	z1.d, z5.h, z3.h[0]
	sdot	z2.d, z9.h, z4.h[0]
	sdot	z1.d, z12.h, z4.h[0]
	uzp1	z21.s, z21.s, z0.s
	uzp1	z2.s, z2.s, z1.s
	rshrnb	z21.h, z21.s, #11
	rshrnb	z2.h, z2.s, #11
	uzp1	z21.h, z21.h, z2.h
	st1h	z21.h, p7, [x3]
	movprfx	z21, z31
	sdot	z21.d, z19.h, z3.h[1]
	add	x3, x1, 1920
	sdot	z21.d, z28.h, z4.h[1]
	movprfx	z19, z31
	sdot	z19.d, z7.h, z3.h[1]
	movprfx	z28, z31
	sdot	z28.d, z11.h, z3.h[1]
	sdot	z19.d, z9.h, z4.h[1]
	sdot	z28.d, z16.h, z4.h[1]
	movprfx	z16, z31
	sdot	z16.d, z5.h, z3.h[1]
	uzp1	z21.s, z21.s, z28.s
	sdot	z16.d, z12.h, z4.h[1]
	rshrnb	z21.h, z21.s, #11
	uzp1	z19.s, z19.s, z16.s
	rshrnb	z19.h, z19.s, #11
	uzp1	z21.h, z21.h, z19.h
	st1h	z21.h, p7, [x3]
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	sub	z30.h, z30.h, z29.h
	add	z24.h, z24.h, z26.h
	add	z22.h, z22.h, z14.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	sub	z24.h, z24.h, z22.h
	add	z17.h, z17.h, z6.h
	add	z10.h, z10.h, z8.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z10.d, p6/m, z10.d
// 0 "" 2
#NO_APP
	sub	z17.h, z17.h, z10.h
	add	z25.h, z25.h, z27.h
	add	z23.h, z23.h, z15.h
#APP
// 25 "kernels/dct32/candidates/best_op_r16.cpp" 1
	revh z23.d, p6/m, z23.d
// 0 "" 2
#NO_APP
	add	x3, x2, 1440
	ld1h	z15.h, p7/z, [x3]
	sub	z25.h, z25.h, z23.h
	add	x3, x1, 256
	movprfx	z29, z31
	sdot	z29.d, z30.h, z15.h[0]
	movprfx	z26, z31
	sdot	z26.d, z24.h, z15.h[0]
	movprfx	z27, z31
	sdot	z27.d, z25.h, z15.h[0]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z15.h[0]
	uzp1	z29.s, z29.s, z26.s
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z29.h, z29.s, #11
	rshrnb	z28.h, z28.s, #11
	uzp1	z29.h, z29.h, z28.h
	st1h	z29.h, p7, [x3]
	add	x3, x1, 768
	movprfx	z29, z31
	sdot	z29.d, z30.h, z15.h[1]
	movprfx	z26, z31
	sdot	z26.d, z24.h, z15.h[1]
	movprfx	z27, z31
	sdot	z27.d, z25.h, z15.h[1]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z15.h[1]
	uzp1	z29.s, z29.s, z26.s
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z29.h, z29.s, #11
	rshrnb	z28.h, z28.s, #11
	uzp1	z29.h, z29.h, z28.h
	st1h	z29.h, p7, [x3]
	add	x3, x2, 1472
	ld1h	z15.h, p7/z, [x3]
	add	x3, x1, 1280
	movprfx	z29, z31
	sdot	z29.d, z30.h, z15.h[0]
	movprfx	z26, z31
	sdot	z26.d, z24.h, z15.h[0]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z15.h[0]
	movprfx	z27, z31
	sdot	z27.d, z25.h, z15.h[0]
	uzp1	z29.s, z29.s, z26.s
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z29.h, z29.s, #11
	rshrnb	z28.h, z28.s, #11
	uzp1	z29.h, z29.h, z28.h
	st1h	z29.h, p7, [x3]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z15.h[1]
	movprfx	z29, z31
	sdot	z29.d, z30.h, z15.h[1]
	add	x3, x1, 1792
	movprfx	z30, z31
	sdot	z30.d, z24.h, z15.h[1]
	add	x0, x0, 1024
	sdot	z31.d, z25.h, z15.h[1]
	uzp1	z30.s, z29.s, z30.s
	uzp1	z31.s, z28.s, z31.s
	rshrnb	z30.h, z30.s, #11
	rshrnb	z31.h, z31.s, #11
	uzp1	z31.h, z30.h, z31.h
	st1h	z31.h, p7, [x3]
	add	x1, x1, 32
	cmp	x5, x0
	bne	.L7
	mov	x13, 37
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
