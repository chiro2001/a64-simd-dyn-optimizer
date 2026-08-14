	.arch armv8.2-a+crc+sve2
	.file	"best_op_mca.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB9:
	.cfi_startproc
	addvl	sp, sp, #-6
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x30,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.b, all
	add	x3, x3, :lo12:.LANCHOR0
	sub	sp, sp, #64
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0x30,0x1e,0x23,0x40,0x22
	add	x5, x3, 32
	ld1w	z31.s, p7/z, [x5]
	add	x7, x0, x2, lsl 2
	addvl	x5, sp, #1
	add	x6, x7, x2, lsl 2
	add	x5, x5, 64
	stp	d8, d9, [sp]
	add	x8, x6, x2, lsl 2
	stp	d10, d11, [sp, 16]
	add	x14, x1, 64
	add	x13, x0, x2, lsl 1
	stp	d12, d13, [sp, 32]
	add	x12, x7, x2, lsl 1
	add	x11, x6, x2, lsl 1
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	add	x10, x8, x2, lsl 1
	str	z31, [x5]
	add	x5, x3, 64
	ld1w	z31.s, p7/z, [x5]
	addvl	x5, sp, #2
	add	x9, x3, 128
	add	x5, x5, 64
	str	z31, [x5]
	mov	x4, 0
	add	x5, x3, 96
	ld1w	z31.s, p7/z, [x5]
	addvl	x5, sp, #3
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 384
	ld1h	z14.h, p7/z, [x5]
	add	x5, x3, 640
	ld1h	z15.h, p7/z, [x5]
	mov	z5.d, z15.d
	add	x5, x3, 896
	ld1h	z0.h, p7/z, [x5]
	mov	z7.d, z0.d
	add	x5, x3, 160
	ld1h	z1.h, p7/z, [x5]
	mov	z0.d, z14.d
	add	x5, x3, 416
	ld1h	z2.h, p7/z, [x5]
	add	x5, x3, 672
	ld1h	z3.h, p7/z, [x5]
	add	x5, x3, 928
	ld1h	z4.h, p7/z, [x5]
	add	x5, x3, 256
	ld1h	z8.h, p7/z, [x5]
.L2:
	add	x5, x0, x4
	ld1h	z24.h, p7/z, [x5]
	ptrue	p6.d, all
	add	x5, x5, 32
	ld1h	z31.h, p7/z, [x5]
	rev	z31.h, z31.h
	add	x5, x13, x4
	sub	z27.h, z24.h, z31.h
	add	z24.h, z24.h, z31.h
	ld1h	z31.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z30.h, p7/z, [x5]
	add	x5, x7, x4
	rev	z30.h, z30.h
	ld1h	z29.h, p7/z, [x5]
	add	x5, x5, 32
	sub	z15.h, z31.h, z30.h
	add	z31.h, z31.h, z30.h
	ld1h	z30.h, p7/z, [x5]
	add	x5, x12, x4
	rev	z30.h, z30.h
	ld1h	z25.h, p7/z, [x5]
	add	x5, x5, 32
	sub	z6.h, z29.h, z30.h
	add	z29.h, z29.h, z30.h
	ld1h	z30.h, p7/z, [x5]
	addvl	x5, sp, #4
	add	x5, x5, 64
	rev	z30.h, z30.h
	sub	z20.h, z25.h, z30.h
	str	z20, [x5]
	add	x5, x6, x4
	add	z25.h, z25.h, z30.h
	ld1h	z30.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z26.h, p7/z, [x5]
	add	x5, x11, x4
	rev	z26.h, z26.h
	sub	z28.h, z30.h, z26.h
	add	z30.h, z30.h, z26.h
	ld1h	z26.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z23.h, p7/z, [x5]
	add	x5, x8, x4
	rev	z23.h, z23.h
	ld1h	z22.h, p7/z, [x5]
	add	x5, x5, 32
	sub	z16.h, z26.h, z23.h
	add	z26.h, z26.h, z23.h
	ld1h	z23.h, p7/z, [x5]
	add	x5, x10, x4
	rev	z23.h, z23.h
	ld1h	z19.h, p7/z, [x5]
	zip1	z17.d, z24.d, z29.d
	sub	z9.h, z22.h, z23.h
	zip2	z29.d, z24.d, z29.d
	add	x5, x5, 32
	zip1	z24.d, z31.d, z25.d
	add	z22.h, z22.h, z23.h
	zip2	z31.d, z31.d, z25.d
	ld1h	z23.h, p7/z, [x5]
	zip1	z13.d, z17.d, z24.d
	rev	z23.h, z23.h
	zip2	z17.d, z17.d, z24.d
	sub	z10.h, z19.h, z23.h
	zip1	z21.d, z29.d, z31.d
	add	z19.h, z19.h, z23.h
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip2	z29.d, z29.d, z31.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	saddlb	z25.s, z13.h, z29.h
	saddlt	z20.s, z13.h, z29.h
	saddlb	z23.s, z17.h, z21.h
	saddlt	z24.s, z17.h, z21.h
#APP
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z24.s, z23.s
	zip2	z24.s, z24.s, z23.s
	zip1	z18.s, z25.s, z20.s
	zip2	z25.s, z25.s, z20.s
	add	z31.s, z18.s, z31.s
	add	z25.s, z25.s, z24.s
	uzp2	z24.d, z31.d, z25.d
#APP
// 43 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z31.d, z31.d, z25.d
	ld1w	z20.s, p7/z, [x3]
	add	z25.s, z24.s, z31.s
	sub	z31.s, z31.s, z24.s
	movprfx	z23, z25
	mul	z23.s, p7/m, z23.s, z20.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #1
	add	x5, x5, 64
	ldr	z24, [x5]
	mul	z24.s, p7/m, z24.s, z31.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #2
	add	x5, x5, 64
	ldr	z18, [x5]
	mul	z25.s, p7/m, z25.s, z18.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #3
	add	x5, x5, 64
	ldr	z14, [x5]
	mul	z31.s, p7/m, z31.s, z14.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	zip1	z18.d, z30.d, z22.d
	addvl	x5, sp, #5
	zip2	z30.d, z30.d, z22.d
	zip1	z22.d, z26.d, z19.d
	add	x5, x5, 64
	zip1	z14.d, z18.d, z22.d
	zip2	z26.d, z26.d, z19.d
	zip2	z18.d, z18.d, z22.d
	zip1	z22.d, z30.d, z26.d
	str	z31, [x5]
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z26.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	saddlb	z12.s, z14.h, z30.h
	saddlt	z26.s, z14.h, z30.h
	saddlb	z11.s, z18.h, z22.h
	saddlt	z19.s, z18.h, z22.h
#APP
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z11.d, p6/m, z11.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z19.s, z11.s
	add	x5, sp, 64
	str	z26, [x5]
	zip1	z26.s, z12.s, z26.s
	add	z26.s, z26.s, z31.s
	ldr	z31, [x5]
	zip2	z12.s, z12.s, z31.s
	zip2	z19.s, z19.s, z11.s
	add	z19.s, z12.s, z19.s
	uzp2	z12.d, z26.d, z19.d
#APP
// 43 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z12.d, p6/m, z12.d
// 0 "" 2
#NO_APP
	uzp1	z26.d, z26.d, z19.d
	add	z19.s, z12.s, z26.s
	sub	z26.s, z26.s, z12.s
	mul	z20.s, p7/m, z20.s, z19.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z20.s, p5/m, z20.s, z20.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #1
	add	x5, x5, 64
	ldr	z12, [x5]
	mul	z12.s, p7/m, z12.s, z26.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z12.s, p5/m, z12.s, z12.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #2
	add	x5, x5, 64
	ldr	z11, [x5]
	mul	z19.s, p7/m, z19.s, z11.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z19.s, p5/m, z19.s, z19.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #3
	add	x5, x5, 64
	ldr	z11, [x5]
	mul	z26.s, p7/m, z26.s, z11.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z26.s, p5/m, z26.s, z26.s
// 0 "" 2
#NO_APP
	addvl	x5, sp, #5
	uzp1	z23.s, z23.s, z20.s
	uzp1	z25.s, z25.s, z19.s
	add	x5, x5, 64
	ldr	z31, [x5]
	uzp1	z31.s, z31.s, z26.s
	addvl	x5, sp, #4
	rshrnb	z31.h, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	add	x5, x5, 64
	ldr	z20, [x5]
	rshrnb	z23.h, z23.s, #4
	rshrnb	z25.h, z25.s, #4
	uzp1	z23.h, z23.h, z23.h
	uzp1	z25.h, z25.h, z25.h
	str	q31, [x1, 1536]
	trn2	z31.d, z15.d, z20.d
	zip1	z26.d, z15.d, z20.d
	zip1	z19.d, z16.d, z10.d
	trn1	z15.d, z15.d, z20.d
	uzp1	z24.s, z24.s, z12.s
	rshrnb	z24.h, z24.s, #4
	uzp1	z24.h, z24.h, z24.h
	str	q23, [x1]
	add	x5, x3, 192
	zip1	z20.d, z28.d, z9.d
	zip1	z20.d, z20.d, z19.d
	str	q25, [x1, 1024]
	trn2	z25.d, z27.d, z6.d
	zip1	z23.d, z25.d, z31.d
	zip2	z25.d, z25.d, z31.d
	trn2	z31.d, z16.d, z10.d
	trn1	z16.d, z16.d, z10.d
	str	q24, [x1, 512]
	zip1	z24.d, z27.d, z6.d
	trn1	z27.d, z27.d, z6.d
	zip1	z24.d, z24.d, z26.d
	zip2	z27.d, z27.d, z15.d
	trn2	z26.d, z28.d, z9.d
	ld1h	z15.h, p7/z, [x9]
	zip1	z19.d, z26.d, z31.d
	trn1	z28.d, z28.d, z9.d
	zip2	z26.d, z26.d, z31.d
	zip2	z28.d, z28.d, z16.d
	movi	d31, #0
	movprfx	z16, z31
	sdot	z16.d, z23.h, z0.h[0]
	movprfx	z12, z31
	sdot	z12.d, z19.h, z0.h[0]
	sdot	z16.d, z24.h, z15.h[0]
	sdot	z12.d, z20.h, z15.h[0]
	sdot	z16.d, z27.h, z5.h[0]
	sdot	z12.d, z28.h, z5.h[0]
	sdot	z16.d, z25.h, z7.h[0]
	sdot	z12.d, z26.h, z7.h[0]
	uzp1	z16.s, z16.s, z12.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z11.h, p7/z, [x5]
	movprfx	z12, z31
	sdot	z12.d, z19.h, z0.h[1]
	add	x5, x3, 448
	sdot	z12.d, z20.h, z15.h[1]
	str	q16, [x1, 64]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z0.h[1]
	sdot	z16.d, z24.h, z15.h[1]
	movprfx	z15, z12
	sdot	z15.d, z28.h, z5.h[1]
	sdot	z16.d, z27.h, z5.h[1]
	sdot	z15.d, z26.h, z7.h[1]
	sdot	z16.d, z25.h, z7.h[1]
	uzp1	z16.s, z16.s, z15.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z10.h, p7/z, [x5]
	movprfx	z15, z31
	sdot	z15.d, z19.h, z2.h[0]
	add	x5, x3, 704
	sdot	z15.d, z20.h, z1.h[0]
	sdot	z15.d, z28.h, z3.h[0]
	sdot	z15.d, z26.h, z4.h[0]
	str	q16, [x1, 192]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z2.h[0]
	sdot	z16.d, z24.h, z1.h[0]
	sdot	z16.d, z27.h, z3.h[0]
	sdot	z16.d, z25.h, z4.h[0]
	uzp1	z16.s, z16.s, z15.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z12.h, p7/z, [x5]
	movprfx	z15, z31
	sdot	z15.d, z19.h, z2.h[1]
	add	x5, x3, 960
	sdot	z15.d, z20.h, z1.h[1]
	sdot	z15.d, z28.h, z3.h[1]
	sdot	z15.d, z26.h, z4.h[1]
	str	q16, [x1, 320]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z2.h[1]
	sdot	z16.d, z24.h, z1.h[1]
	sdot	z16.d, z27.h, z3.h[1]
	sdot	z16.d, z25.h, z4.h[1]
	uzp1	z16.s, z16.s, z15.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z15.h, p7/z, [x5]
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[0]
	add	x5, x3, 224
	sdot	z9.d, z20.h, z11.h[0]
	sdot	z9.d, z28.h, z12.h[0]
	sdot	z9.d, z26.h, z15.h[0]
	str	q16, [x1, 448]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[0]
	sdot	z16.d, z24.h, z11.h[0]
	sdot	z16.d, z27.h, z12.h[0]
	sdot	z16.d, z25.h, z15.h[0]
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[1]
	sdot	z9.d, z20.h, z11.h[1]
	str	q16, [x1, 576]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[1]
	sdot	z16.d, z24.h, z11.h[1]
	ld1h	z11.h, p7/z, [x5]
	add	x5, x3, 480
	ld1h	z10.h, p7/z, [x5]
	add	x5, x3, 736
	sdot	z9.d, z28.h, z12.h[1]
	sdot	z16.d, z27.h, z12.h[1]
	sdot	z9.d, z26.h, z15.h[1]
	ld1h	z12.h, p7/z, [x5]
	sdot	z16.d, z25.h, z15.h[1]
	add	x5, x3, 992
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z15.h, p7/z, [x5]
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[0]
	add	x5, x3, 512
	sdot	z9.d, z20.h, z11.h[0]
	sdot	z9.d, z28.h, z12.h[0]
	sdot	z9.d, z26.h, z15.h[0]
	str	q16, [x1, 704]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[0]
	sdot	z16.d, z24.h, z11.h[0]
	sdot	z16.d, z27.h, z12.h[0]
	sdot	z16.d, z25.h, z15.h[0]
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[1]
	sdot	z9.d, z20.h, z11.h[1]
	str	q16, [x1, 832]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[1]
	sdot	z16.d, z24.h, z11.h[1]
	ld1h	z11.h, p7/z, [x5]
	add	x5, x3, 768
	sdot	z9.d, z28.h, z12.h[1]
	sdot	z16.d, z27.h, z12.h[1]
	sdot	z9.d, z26.h, z15.h[1]
	ld1h	z12.h, p7/z, [x5]
	sdot	z16.d, z25.h, z15.h[1]
	add	x5, x3, 1024
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z15.h, p7/z, [x5]
	movprfx	z10, z31
	sdot	z10.d, z19.h, z11.h[0]
	add	x5, x3, 288
	sdot	z10.d, z20.h, z8.h[0]
	sdot	z10.d, z28.h, z12.h[0]
	sdot	z10.d, z26.h, z15.h[0]
	str	q16, [x1, 960]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z11.h[0]
	sdot	z16.d, z24.h, z8.h[0]
	sdot	z16.d, z27.h, z12.h[0]
	sdot	z16.d, z25.h, z15.h[0]
	uzp1	z16.s, z16.s, z10.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	movprfx	z10, z31
	sdot	z10.d, z19.h, z11.h[1]
	sdot	z10.d, z20.h, z8.h[1]
	sdot	z10.d, z28.h, z12.h[1]
	sdot	z10.d, z26.h, z15.h[1]
	str	q16, [x1, 1088]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z11.h[1]
	ld1h	z11.h, p7/z, [x5]
	add	x5, x3, 544
	sdot	z16.d, z24.h, z8.h[1]
	sdot	z16.d, z27.h, z12.h[1]
	sdot	z16.d, z25.h, z15.h[1]
	uzp1	z16.s, z16.s, z10.s
	ld1h	z10.h, p7/z, [x5]
	add	x5, x3, 800
	rshrnb	z16.h, z16.s, #4
	ld1h	z12.h, p7/z, [x5]
	uzp1	z16.h, z16.h, z16.h
	add	x5, x3, 1056
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[0]
	ld1h	z15.h, p7/z, [x5]
	sdot	z9.d, z20.h, z11.h[0]
	add	x5, x3, 320
	sdot	z9.d, z28.h, z12.h[0]
	sdot	z9.d, z26.h, z15.h[0]
	str	q16, [x1, 1216]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[0]
	sdot	z16.d, z24.h, z11.h[0]
	sdot	z16.d, z27.h, z12.h[0]
	sdot	z16.d, z25.h, z15.h[0]
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[1]
	sdot	z9.d, z20.h, z11.h[1]
	str	q16, [x1, 1344]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[1]
	sdot	z16.d, z24.h, z11.h[1]
	ld1h	z11.h, p7/z, [x5]
	add	x5, x3, 576
	ld1h	z10.h, p7/z, [x5]
	add	x5, x3, 832
	sdot	z9.d, z28.h, z12.h[1]
	sdot	z16.d, z27.h, z12.h[1]
	sdot	z9.d, z26.h, z15.h[1]
	ld1h	z12.h, p7/z, [x5]
	sdot	z16.d, z25.h, z15.h[1]
	add	x5, x3, 1088
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	ld1h	z15.h, p7/z, [x5]
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[0]
	add	x5, x3, 352
	sdot	z9.d, z20.h, z11.h[0]
	sdot	z9.d, z28.h, z12.h[0]
	sdot	z9.d, z26.h, z15.h[0]
	str	q16, [x1, 1472]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[0]
	sdot	z16.d, z24.h, z11.h[0]
	sdot	z16.d, z27.h, z12.h[0]
	sdot	z16.d, z25.h, z15.h[0]
	uzp1	z16.s, z16.s, z9.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	movprfx	z9, z31
	sdot	z9.d, z19.h, z10.h[1]
	sdot	z9.d, z20.h, z11.h[1]
	sdot	z9.d, z28.h, z12.h[1]
	sdot	z9.d, z26.h, z15.h[1]
	str	q16, [x1, 1600]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z10.h[1]
	ld1h	z10.h, p7/z, [x5]
	add	x5, x3, 608
	sdot	z16.d, z24.h, z11.h[1]
	sdot	z16.d, z27.h, z12.h[1]
	sdot	z16.d, z25.h, z15.h[1]
	uzp1	z16.s, z16.s, z9.s
	ld1h	z9.h, p7/z, [x5]
	rshrnb	z16.h, z16.s, #4
	add	x5, x3, 864
	uzp1	z16.h, z16.h, z16.h
	ld1h	z11.h, p7/z, [x5]
	movprfx	z15, z31
	sdot	z15.d, z19.h, z9.h[0]
	add	x5, x3, 1120
	sdot	z15.d, z20.h, z10.h[0]
	ld1h	z12.h, p7/z, [x5]
	sdot	z15.d, z28.h, z11.h[0]
	sdot	z15.d, z26.h, z12.h[0]
	str	q16, [x1, 1728]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z9.h[0]
	sdot	z16.d, z24.h, z10.h[0]
	sdot	z16.d, z27.h, z11.h[0]
	sdot	z16.d, z25.h, z12.h[0]
	uzp1	z16.s, z16.s, z15.s
	rshrnb	z16.h, z16.s, #4
	uzp1	z16.h, z16.h, z16.h
	add	x5, x3, 1152
	str	q16, [x1, 1856]
	movprfx	z16, z31
	sdot	z16.d, z23.h, z9.h[1]
	sdot	z16.d, z24.h, z10.h[1]
	sdot	z16.d, z27.h, z11.h[1]
	movprfx	z27, z31
	sdot	z27.d, z19.h, z9.h[1]
	sdot	z16.d, z25.h, z12.h[1]
	sdot	z27.d, z20.h, z10.h[1]
	sdot	z27.d, z28.h, z11.h[1]
	movprfx	z28, z27
	sdot	z28.d, z26.h, z12.h[1]
	uzp1	z28.s, z16.s, z28.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	sub	z25.h, z13.h, z29.h
	sub	z24.h, z17.h, z21.h
	sub	z26.h, z18.h, z22.h
	sub	z27.h, z14.h, z30.h
	ld1h	z15.h, p7/z, [x5]
	add	x5, x3, 1280
	ld1h	z12.h, p7/z, [x5]
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q28, [x1, 1984]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[0]
	sdot	z28.d, z25.h, z15.h[0]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[1]
	add	x5, x3, 1184
	sdot	z23.d, z27.h, z15.h[1]
	str	q28, [x1, 128]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[1]
	sdot	z28.d, z25.h, z15.h[1]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	ld1h	z15.h, p7/z, [x5]
	add	x5, x3, 1312
	ld1h	z12.h, p7/z, [x5]
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q28, [x1, 384]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[0]
	sdot	z28.d, z25.h, z15.h[0]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[1]
	add	x5, x3, 1216
	sdot	z23.d, z27.h, z15.h[1]
	str	q28, [x1, 640]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[1]
	sdot	z28.d, z25.h, z15.h[1]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	ld1h	z15.h, p7/z, [x5]
	add	x5, x3, 1344
	ld1h	z12.h, p7/z, [x5]
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q28, [x1, 896]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[0]
	sdot	z28.d, z25.h, z15.h[0]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[1]
	add	x5, x3, 1248
	sdot	z23.d, z27.h, z15.h[1]
	str	q28, [x1, 1152]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[1]
	sdot	z28.d, z25.h, z15.h[1]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	ld1h	z15.h, p7/z, [x5]
	add	x5, x3, 1376
	ld1h	z12.h, p7/z, [x5]
	movprfx	z23, z31
	sdot	z23.d, z26.h, z12.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q28, [x1, 1408]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[0]
	sdot	z28.d, z25.h, z15.h[0]
	uzp1	z28.s, z28.s, z23.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	add	z29.h, z29.h, z13.h
	add	z21.h, z21.h, z17.h
	str	q28, [x1, 1664]
	movprfx	z28, z31
	sdot	z28.d, z24.h, z12.h[1]
	sdot	z28.d, z25.h, z15.h[1]
	movprfx	z25, z31
	sdot	z25.d, z26.h, z12.h[1]
	movprfx	z26, z25
	sdot	z26.d, z27.h, z15.h[1]
	uzp1	z28.s, z28.s, z26.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	str	q28, [x1, 1920]
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	sub	z29.h, z29.h, z21.h
	add	z30.h, z30.h, z14.h
	add	z22.h, z22.h, z18.h
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	sub	z30.h, z30.h, z22.h
	add	x5, x3, 1408
	ld1h	z15.h, p7/z, [x5]
	movprfx	z27, z31
	sdot	z27.d, z30.h, z15.h[0]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z15.h[0]
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z15.h[1]
	str	q28, [x1, 256]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z15.h[1]
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	add	x5, x3, 1440
	ld1h	z15.h, p7/z, [x5]
	movprfx	z27, z31
	sdot	z27.d, z30.h, z15.h[0]
	str	q28, [x1, 768]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z15.h[0]
	uzp1	z28.s, z28.s, z27.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	add	x1, x1, 16
	str	q28, [x1, 1264]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z15.h[1]
	sdot	z31.d, z30.h, z15.h[1]
	uzp1	z31.s, z28.s, z31.s
	rshrnb	z31.h, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	str	q31, [x1, 1776]
	add	x4, x4, x2, lsl 4
	cmp	x14, x1
	bne	.L2
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
	addvl	sp, sp, #6
	.cfi_def_cfa_offset 64
	add	sp, sp, 64
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
	addvl	sp, sp, #-10
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x50,0x1e,0x22
	adrp	x2, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #96
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0x50,0x1e,0x23,0x60,0x22
	add	x2, x2, :lo12:.LANCHOR0
	add	x4, x2, 32
	add	x18, x0, 160
	add	x17, x0, 224
	add	x16, x0, 288
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x30, x0, 96
	ld1w	z31.s, p7/z, [x4]
	add	x4, sp, 96
	str	x19, [sp, 16]
	add	x15, x0, 352
	stp	d8, d9, [sp, 32]
	add	x14, x0, 416
	add	x13, x0, 480
	stp	d10, d11, [sp, 48]
	add	x12, x0, 64
	add	x11, x0, 128
	stp	d12, d13, [sp, 64]
	add	x10, x0, 192
	add	x9, x0, 256
	stp	d14, d15, [sp, 80]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x48,0x2,0x8f,0x20
	.cfi_escape 0x10,0x49,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x38
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xd8,0
	add	x8, x0, 320
	str	z31, [x4]
	add	x4, x2, 64
	ld1w	z31.s, p7/z, [x4]
	addvl	x4, sp, #1
	add	x7, x0, 384
	add	x4, x4, 96
	str	z31, [x4]
	add	x6, x0, 448
	add	x4, x2, 96
	ld1w	z31.s, p7/z, [x4]
	add	x5, x2, 128
	addvl	x4, sp, #2
	add	x19, x0, 32
	add	x4, x4, 96
	str	z31, [x4]
	mov	x3, 0
	add	x4, x2, 384
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #3
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 640
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #4
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 896
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #5
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 160
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 416
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 672
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 928
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 256
	ld1h	z13.h, p7/z, [x4]
.L7:
	ld1h	z23.h, p7/z, [x11, x3, lsl 1]
	ld1h	z14.h, p7/z, [x0, x3, lsl 1]
	ld1h	z29.h, p7/z, [x12, x3, lsl 1]
	zip1	z9.d, z14.d, z23.d
	ld1h	z21.h, p7/z, [x10, x3, lsl 1]
	zip2	z14.d, z14.d, z23.d
	ld1h	z25.h, p7/z, [x19, x3, lsl 1]
	zip1	z23.d, z29.d, z21.d
	ld1h	z31.h, p7/z, [x30, x3, lsl 1]
	zip2	z29.d, z29.d, z21.d
	zip1	z5.d, z9.d, z23.d
	ld1h	z27.h, p7/z, [x18, x3, lsl 1]
	ld1h	z28.h, p7/z, [x17, x3, lsl 1]
	ld1h	z26.h, p7/z, [x16, x3, lsl 1]
	ld1h	z30.h, p7/z, [x15, x3, lsl 1]
	ld1h	z24.h, p7/z, [x14, x3, lsl 1]
	ld1h	z22.h, p7/z, [x13, x3, lsl 1]
	zip2	z9.d, z9.d, z23.d
	zip1	z7.d, z14.d, z29.d
	ptrue	p6.d, all
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z7.d, p6/m, z7.d
// 0 "" 2
#NO_APP
	zip2	z14.d, z14.d, z29.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z14.d, p6/m, z14.d
// 0 "" 2
#NO_APP
	rev	z27.h, z27.h
	rev	z29.h, z28.h
	rev	z25.h, z25.h
	rev	z31.h, z31.h
	zip1	z17.d, z25.d, z27.d
	zip1	z28.d, z31.d, z29.d
	zip2	z25.d, z25.d, z27.d
	zip2	z31.d, z31.d, z29.d
	zip1	z19.d, z17.d, z28.d
	zip1	z11.d, z25.d, z31.d
	zip2	z17.d, z17.d, z28.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z11.d, p6/m, z11.d
// 0 "" 2
#NO_APP
	zip2	z25.d, z25.d, z31.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	saddlb	z31.s, z14.h, z25.h
	saddlb	z28.s, z5.h, z19.h
	add	z28.s, z28.s, z31.s
	saddlt	z31.s, z14.h, z25.h
	saddlt	z23.s, z5.h, z19.h
	add	z23.s, z23.s, z31.s
	saddlb	z31.s, z7.h, z11.h
	saddlb	z27.s, z9.h, z17.h
	saddlt	z29.s, z9.h, z17.h
	add	z27.s, z27.s, z31.s
	saddlt	z31.s, z7.h, z11.h
	add	z29.s, z29.s, z31.s
#APP
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z27.d, p6/m, z27.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z28.s, z23.s
	zip2	z28.s, z28.s, z23.s
	zip1	z21.s, z29.s, z27.s
	zip2	z29.s, z29.s, z27.s
	add	z31.s, z31.s, z21.s
	add	z29.s, z28.s, z29.s
	uzp2	z28.d, z31.d, z29.d
#APP
// 43 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z31.d, z31.d, z29.d
	ld1w	z23.s, p7/z, [x2]
	add	z29.s, z28.s, z31.s
	sub	z31.s, z31.s, z28.s
	movprfx	z27, z29
	mul	z27.s, p7/m, z27.s, z23.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	add	x4, sp, 96
	ldr	z3, [x4]
	movprfx	z28, z3
	mul	z28.s, p7/m, z28.s, z31.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	addvl	x4, sp, #1
	add	x4, x4, 96
	ldr	z2, [x4]
	mul	z29.s, p7/m, z29.s, z2.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	addvl	x4, sp, #2
	add	x4, x4, 96
	ldr	z1, [x4]
	mul	z31.s, p7/m, z31.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	ld1h	z20.h, p7/z, [x7, x3, lsl 1]
	ld1h	z15.h, p7/z, [x9, x3, lsl 1]
	ld1h	z21.h, p7/z, [x8, x3, lsl 1]
	zip1	z10.d, z15.d, z20.d
	ld1h	z18.h, p7/z, [x6, x3, lsl 1]
	zip2	z15.d, z15.d, z20.d
	zip1	z20.d, z21.d, z18.d
	zip2	z21.d, z21.d, z18.d
	zip1	z6.d, z10.d, z20.d
	zip1	z8.d, z15.d, z21.d
	zip2	z10.d, z10.d, z20.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z8.d, p6/m, z8.d
// 0 "" 2
#NO_APP
	zip2	z15.d, z15.d, z21.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z15.d, p6/m, z15.d
// 0 "" 2
#NO_APP
	rev	z24.h, z24.h
	rev	z22.h, z22.h
	rev	z26.h, z26.h
	rev	z30.h, z30.h
	zip1	z18.d, z26.d, z24.d
	zip2	z26.d, z26.d, z24.d
	zip1	z24.d, z30.d, z22.d
	zip2	z30.d, z30.d, z22.d
	zip1	z20.d, z18.d, z24.d
	zip1	z12.d, z26.d, z30.d
	zip2	z18.d, z18.d, z24.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z12.d, p6/m, z12.d
// 0 "" 2
#NO_APP
	zip2	z26.d, z26.d, z30.d
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	saddlb	z30.s, z15.h, z26.h
	saddlb	z22.s, z6.h, z20.h
	add	z22.s, z22.s, z30.s
	saddlt	z30.s, z15.h, z26.h
	saddlt	z16.s, z6.h, z20.h
	add	z16.s, z16.s, z30.s
	saddlb	z30.s, z8.h, z12.h
	saddlb	z21.s, z10.h, z18.h
	saddlt	z24.s, z8.h, z12.h
	add	z21.s, z21.s, z30.s
	saddlt	z30.s, z10.h, z18.h
	add	z24.s, z30.s, z24.s
#APP
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z21.d, p6/m, z21.d
// 0 "" 2
// 34 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip1	z30.s, z22.s, z16.s
	zip2	z22.s, z22.s, z16.s
	zip1	z4.s, z24.s, z21.s
	zip2	z24.s, z24.s, z21.s
	add	z30.s, z30.s, z4.s
	add	z24.s, z22.s, z24.s
	uzp2	z22.d, z30.d, z24.d
#APP
// 43 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revw z22.d, p6/m, z22.d
// 0 "" 2
#NO_APP
	uzp1	z30.d, z30.d, z24.d
	add	z24.s, z22.s, z30.s
	sub	z30.s, z30.s, z22.s
	mul	z23.s, p7/m, z23.s, z24.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	movprfx	z22, z3
	mul	z22.s, p7/m, z22.s, z30.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z22.s, p5/m, z22.s, z22.s
// 0 "" 2
#NO_APP
	mul	z24.s, p7/m, z24.s, z2.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z24.s, p5/m, z24.s, z24.s
// 0 "" 2
#NO_APP
	mul	z30.s, p7/m, z30.s, z1.s
#APP
// 52 "kernels/dct32/candidates/best_op_mca.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z27.s, z27.s, z23.s
	rshrnb	z27.h, z27.s, #11
	uzp1	z27.h, z27.h, z27.h
	uzp1	z28.s, z28.s, z22.s
	uzp1	z29.s, z29.s, z24.s
	uzp1	z31.s, z31.s, z30.s
	rshrnb	z28.h, z28.s, #11
	rshrnb	z29.h, z29.s, #11
	uzp1	z28.h, z28.h, z28.h
	uzp1	z29.h, z29.h, z29.h
	rshrnb	z31.h, z31.s, #11
	sub	z22.h, z5.h, z19.h
	uzp1	z31.h, z31.h, z31.h
	sub	z21.h, z9.h, z17.h
	str	q27, [x1]
	sub	z27.h, z7.h, z11.h
	str	q28, [x1, 512]
	str	q29, [x1, 1024]
	str	q31, [x1, 1536]
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	sub	z28.h, z14.h, z25.h
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	sub	z24.h, z6.h, z20.h
	sub	z23.h, z10.h, z18.h
	sub	z29.h, z8.h, z12.h
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	sub	z30.h, z15.h, z26.h
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	addvl	x4, sp, #3
	movi	d31, #0
	ld1h	z4.h, p7/z, [x5]
	add	x4, x4, 96
	ldr	z2, [x4]
	movprfx	z3, z31
	sdot	z3.d, z23.h, z2.h[0]
	addvl	x4, sp, #4
	sdot	z3.d, z24.h, z4.h[0]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z2.h[0]
	add	x4, x4, 96
	ldr	z1, [x4]
	sdot	z3.d, z29.h, z1.h[0]
	addvl	x4, sp, #5
	sdot	z16.d, z22.h, z4.h[0]
	sdot	z16.d, z27.h, z1.h[0]
	add	x4, x4, 96
	ldr	z0, [x4]
	sdot	z3.d, z30.h, z0.h[0]
	addvl	x4, sp, #7
	sdot	z16.d, z28.h, z0.h[0]
	uzp1	z16.s, z16.s, z3.s
	add	x4, x4, 96
	movprfx	z3, z31
	sdot	z3.d, z23.h, z2.h[1]
	rshrnb	z16.h, z16.s, #11
	sdot	z3.d, z24.h, z4.h[1]
	uzp1	z16.h, z16.h, z16.h
	sdot	z3.d, z29.h, z1.h[1]
	sdot	z3.d, z30.h, z0.h[1]
	str	q16, [x1, 64]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z2.h[1]
	sdot	z16.d, z22.h, z4.h[1]
	sdot	z16.d, z27.h, z1.h[1]
	sdot	z16.d, z28.h, z0.h[1]
	uzp1	z16.s, z16.s, z3.s
	ldr	z3, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 96
	ldr	z2, [x4]
	rshrnb	z16.h, z16.s, #11
	addvl	x4, sp, #8
	uzp1	z16.h, z16.h, z16.h
	movprfx	z4, z31
	sdot	z4.d, z23.h, z3.h[0]
	add	x4, x4, 96
	ldr	z1, [x4]
	sdot	z4.d, z24.h, z2.h[0]
	addvl	x4, sp, #9
	sdot	z4.d, z29.h, z1.h[0]
	add	z25.h, z14.h, z25.h
	add	x4, x4, 96
	ldr	z0, [x4]
	sdot	z4.d, z30.h, z0.h[0]
	add	x4, x2, 192
	str	q16, [x1, 192]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z3.h[0]
	sdot	z16.d, z22.h, z2.h[0]
	sdot	z16.d, z27.h, z1.h[0]
	sdot	z16.d, z28.h, z0.h[0]
	uzp1	z16.s, z16.s, z4.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	movprfx	z4, z31
	sdot	z4.d, z23.h, z3.h[1]
	sdot	z4.d, z24.h, z2.h[1]
	str	q16, [x1, 320]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z3.h[1]
	sdot	z16.d, z22.h, z2.h[1]
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 448
	sdot	z4.d, z29.h, z1.h[1]
	sdot	z16.d, z27.h, z1.h[1]
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 704
	sdot	z4.d, z30.h, z0.h[1]
	ld1h	z3.h, p7/z, [x4]
	sdot	z16.d, z28.h, z0.h[1]
	add	x4, x2, 960
	uzp1	z16.s, z16.s, z4.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	ld1h	z4.h, p7/z, [x4]
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[0]
	add	x4, x2, 224
	sdot	z0.d, z24.h, z2.h[0]
	sdot	z0.d, z29.h, z3.h[0]
	sdot	z0.d, z30.h, z4.h[0]
	str	q16, [x1, 448]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[0]
	sdot	z16.d, z22.h, z2.h[0]
	sdot	z16.d, z27.h, z3.h[0]
	sdot	z16.d, z28.h, z4.h[0]
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[1]
	sdot	z0.d, z24.h, z2.h[1]
	str	q16, [x1, 576]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[1]
	sdot	z16.d, z22.h, z2.h[1]
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 480
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 736
	sdot	z0.d, z29.h, z3.h[1]
	sdot	z16.d, z27.h, z3.h[1]
	sdot	z0.d, z30.h, z4.h[1]
	ld1h	z3.h, p7/z, [x4]
	sdot	z16.d, z28.h, z4.h[1]
	add	x4, x2, 992
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	ld1h	z4.h, p7/z, [x4]
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[0]
	add	x4, x2, 512
	sdot	z0.d, z24.h, z2.h[0]
	sdot	z0.d, z29.h, z3.h[0]
	sdot	z0.d, z30.h, z4.h[0]
	str	q16, [x1, 704]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[0]
	sdot	z16.d, z22.h, z2.h[0]
	sdot	z16.d, z27.h, z3.h[0]
	sdot	z16.d, z28.h, z4.h[0]
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[1]
	sdot	z0.d, z24.h, z2.h[1]
	str	q16, [x1, 832]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[1]
	sdot	z16.d, z22.h, z2.h[1]
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 768
	sdot	z0.d, z29.h, z3.h[1]
	sdot	z16.d, z27.h, z3.h[1]
	sdot	z0.d, z30.h, z4.h[1]
	ld1h	z3.h, p7/z, [x4]
	sdot	z16.d, z28.h, z4.h[1]
	add	x4, x2, 1024
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	ld1h	z4.h, p7/z, [x4]
	movprfx	z1, z31
	sdot	z1.d, z23.h, z2.h[0]
	add	x4, x2, 288
	sdot	z1.d, z24.h, z13.h[0]
	sdot	z1.d, z29.h, z3.h[0]
	sdot	z1.d, z30.h, z4.h[0]
	str	q16, [x1, 960]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z2.h[0]
	sdot	z16.d, z22.h, z13.h[0]
	sdot	z16.d, z27.h, z3.h[0]
	sdot	z16.d, z28.h, z4.h[0]
	uzp1	z16.s, z16.s, z1.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	movprfx	z1, z31
	sdot	z1.d, z23.h, z2.h[1]
	sdot	z1.d, z24.h, z13.h[1]
	sdot	z1.d, z29.h, z3.h[1]
	sdot	z1.d, z30.h, z4.h[1]
	str	q16, [x1, 1088]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z2.h[1]
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 544
	sdot	z16.d, z22.h, z13.h[1]
	sdot	z16.d, z27.h, z3.h[1]
	sdot	z16.d, z28.h, z4.h[1]
	uzp1	z16.s, z16.s, z1.s
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 800
	rshrnb	z16.h, z16.s, #11
	ld1h	z3.h, p7/z, [x4]
	uzp1	z16.h, z16.h, z16.h
	add	x4, x2, 1056
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[0]
	sdot	z0.d, z24.h, z2.h[0]
	sdot	z0.d, z29.h, z3.h[0]
	str	q16, [x1, 1216]
	ld1h	z4.h, p7/z, [x4]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[0]
	sdot	z0.d, z30.h, z4.h[0]
	add	x4, x2, 320
	sdot	z16.d, z22.h, z2.h[0]
	sdot	z16.d, z27.h, z3.h[0]
	sdot	z16.d, z28.h, z4.h[0]
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[1]
	sdot	z0.d, z24.h, z2.h[1]
	str	q16, [x1, 1344]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[1]
	sdot	z16.d, z22.h, z2.h[1]
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 576
	ld1h	z1.h, p7/z, [x4]
	sdot	z0.d, z29.h, z3.h[1]
	add	x4, x2, 832
	sdot	z0.d, z30.h, z4.h[1]
	sdot	z16.d, z27.h, z3.h[1]
	ld1h	z3.h, p7/z, [x4]
	sdot	z16.d, z28.h, z4.h[1]
	add	x4, x2, 1088
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	ld1h	z4.h, p7/z, [x4]
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[0]
	add	x4, x2, 352
	sdot	z0.d, z24.h, z2.h[0]
	sdot	z0.d, z29.h, z3.h[0]
	sdot	z0.d, z30.h, z4.h[0]
	str	q16, [x1, 1472]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[0]
	sdot	z16.d, z22.h, z2.h[0]
	sdot	z16.d, z27.h, z3.h[0]
	sdot	z16.d, z28.h, z4.h[0]
	uzp1	z16.s, z16.s, z0.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	movprfx	z0, z31
	sdot	z0.d, z23.h, z1.h[1]
	sdot	z0.d, z24.h, z2.h[1]
	sdot	z0.d, z29.h, z3.h[1]
	sdot	z0.d, z30.h, z4.h[1]
	str	q16, [x1, 1600]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z1.h[1]
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 608
	sdot	z16.d, z22.h, z2.h[1]
	sdot	z16.d, z27.h, z3.h[1]
	sdot	z16.d, z28.h, z4.h[1]
	uzp1	z16.s, z16.s, z0.s
	ld1h	z0.h, p7/z, [x4]
	rshrnb	z16.h, z16.s, #11
	add	x4, x2, 864
	uzp1	z16.h, z16.h, z16.h
	ld1h	z2.h, p7/z, [x4]
	movprfx	z4, z31
	sdot	z4.d, z23.h, z0.h[0]
	add	x4, x2, 1120
	sdot	z4.d, z24.h, z1.h[0]
	ld1h	z3.h, p7/z, [x4]
	sdot	z4.d, z29.h, z2.h[0]
	sdot	z4.d, z30.h, z3.h[0]
	str	q16, [x1, 1728]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z0.h[0]
	sdot	z16.d, z22.h, z1.h[0]
	sdot	z16.d, z27.h, z2.h[0]
	sdot	z16.d, z28.h, z3.h[0]
	uzp1	z16.s, z16.s, z4.s
	rshrnb	z16.h, z16.s, #11
	uzp1	z16.h, z16.h, z16.h
	add	x4, x2, 1152
	str	q16, [x1, 1856]
	movprfx	z16, z31
	sdot	z16.d, z21.h, z0.h[1]
	sdot	z16.d, z22.h, z1.h[1]
	sdot	z16.d, z27.h, z2.h[1]
	sdot	z16.d, z28.h, z3.h[1]
	movprfx	z28, z31
	sdot	z28.d, z23.h, z0.h[1]
	sdot	z28.d, z24.h, z1.h[1]
	sdot	z28.d, z29.h, z2.h[1]
	sdot	z28.d, z30.h, z3.h[1]
	add	z19.h, z19.h, z5.h
	add	z17.h, z17.h, z9.h
	sub	z29.h, z19.h, z25.h
	add	z11.h, z7.h, z11.h
	add	z26.h, z15.h, z26.h
	add	z20.h, z20.h, z6.h
	ld1h	z15.h, p7/z, [x4]
	sub	z27.h, z20.h, z26.h
	add	x4, x2, 1280
	add	z18.h, z18.h, z10.h
	ld1h	z14.h, p7/z, [x4]
	add	z12.h, z8.h, z12.h
	uzp1	z16.s, z16.s, z28.s
	sub	z24.h, z18.h, z12.h
	sub	z28.h, z17.h, z11.h
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[0]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	sdot	z30.d, z29.h, z15.h[0]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	add	x4, x2, 1184
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[1]
	sdot	z23.d, z27.h, z15.h[1]
	str	q30, [x1, 128]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[1]
	sdot	z30.d, z29.h, z15.h[1]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	ld1h	z15.h, p7/z, [x4]
	add	x4, x2, 1312
	ld1h	z14.h, p7/z, [x4]
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q30, [x1, 384]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[0]
	sdot	z30.d, z29.h, z15.h[0]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	add	x4, x2, 1216
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[1]
	sdot	z23.d, z27.h, z15.h[1]
	str	q30, [x1, 640]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[1]
	sdot	z30.d, z29.h, z15.h[1]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	ld1h	z15.h, p7/z, [x4]
	add	x4, x2, 1344
	ld1h	z14.h, p7/z, [x4]
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q30, [x1, 896]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[0]
	sdot	z30.d, z29.h, z15.h[0]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	add	x4, x2, 1248
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[1]
	sdot	z23.d, z27.h, z15.h[1]
	str	q30, [x1, 1152]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[1]
	sdot	z30.d, z29.h, z15.h[1]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	ld1h	z15.h, p7/z, [x4]
	add	x4, x2, 1376
	ld1h	z14.h, p7/z, [x4]
	movprfx	z23, z31
	sdot	z23.d, z24.h, z14.h[0]
	sdot	z23.d, z27.h, z15.h[0]
	str	q30, [x1, 1408]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[0]
	sdot	z30.d, z29.h, z15.h[0]
	uzp1	z30.s, z30.s, z23.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	rshrnb	z16.h, z16.s, #11
	add	z19.h, z19.h, z25.h
	uzp1	z16.h, z16.h, z16.h
	add	z17.h, z17.h, z11.h
	str	q30, [x1, 1664]
	movprfx	z30, z31
	sdot	z30.d, z28.h, z14.h[1]
	sdot	z30.d, z29.h, z15.h[1]
	movprfx	z29, z31
	sdot	z29.d, z24.h, z14.h[1]
	sdot	z29.d, z27.h, z15.h[1]
	uzp1	z30.s, z30.s, z29.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	str	q30, [x1, 1920]
	str	q16, [x1, 1984]
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z17.d, p6/m, z17.d
// 0 "" 2
#NO_APP
	sub	z19.h, z19.h, z17.h
	add	z20.h, z20.h, z26.h
	add	z18.h, z18.h, z12.h
#APP
// 25 "kernels/dct32/candidates/best_op_mca.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	sub	z20.h, z20.h, z18.h
	add	x4, x2, 1408
	ld1h	z15.h, p7/z, [x4]
	movprfx	z29, z31
	sdot	z29.d, z20.h, z15.h[0]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z15.h[0]
	uzp1	z30.s, z30.s, z29.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	movprfx	z29, z31
	sdot	z29.d, z20.h, z15.h[1]
	str	q30, [x1, 256]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z15.h[1]
	uzp1	z30.s, z30.s, z29.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	add	x4, x2, 1440
	ld1h	z15.h, p7/z, [x4]
	movprfx	z29, z31
	sdot	z29.d, z20.h, z15.h[0]
	str	q30, [x1, 768]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z15.h[0]
	uzp1	z30.s, z30.s, z29.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	add	x3, x3, 256
	str	q30, [x1, 1280]
	movprfx	z30, z31
	sdot	z30.d, z19.h, z15.h[1]
	sdot	z31.d, z20.h, z15.h[1]
	uzp1	z31.s, z30.s, z31.s
	rshrnb	z31.h, z31.s, #11
	uzp1	z31.h, z31.h, z31.h
	str	q31, [x1, 1792]
	add	x1, x1, 16
	cmp	x3, 1024
	bne	.L7
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp]
	ldp	d8, d9, [sp, 32]
	ldp	d10, d11, [sp, 48]
	ldp	d12, d13, [sp, 64]
	ldp	d14, d15, [sp, 80]
	.cfi_restore 19
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
	addvl	sp, sp, #10
	.cfi_def_cfa_offset 96
	add	sp, sp, 96
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
	sub	sp, sp, #2064
	.cfi_def_cfa_offset 2064
	mov	x15, x1
	add	x1, sp, 16
	stp	x29, x30, [sp]
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
	mov	x29, sp
	bl	_ZL9op_pass_4PKsPsl
	add	x0, sp, 16
	mov	x1, x15
	bl	_ZL10op_pass_11PKsPsl.constprop.0
	ldp	x29, x30, [sp]
	add	sp, sp, 2064
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
