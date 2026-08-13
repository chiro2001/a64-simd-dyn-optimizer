	.arch armv8.2-a+crc+sve2
	.file	"best_legacy_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_sve2_shared
	.type	dynopt_dct16_sve2_shared, %function
dynopt_dct16_sve2_shared:
.LFB3900:
	.cfi_startproc
	ptrue	p7.b, all
	add	x5, x0, x2, lsl 2
	ld1h	z31.h, p7/z, [x5]
	ld1h	z28.h, p7/z, [x5, x2, lsl 1]
	ld1h	z27.h, p7/z, [x0]
	ld1h	z29.h, p7/z, [x0, x2, lsl 1]
	zip1	z30.d, z27.d, z31.d
	zip2	z27.d, z27.d, z31.d
	zip1	z31.d, z29.d, z28.d
	sub	sp, sp, #512
	.cfi_def_cfa_offset 512
	zip2	z29.d, z29.d, z28.d
	lsl	x3, x2, 1
	zip1	z28.d, z30.d, z31.d
	add	x4, x5, x2, lsl 1
	zip2	z30.d, z30.d, z31.d
	ptrue	p6.d, all
	zip1	z31.d, z27.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	sub	z16.h, z28.h, z27.h
	sub	z17.h, z30.h, z31.h
	add	z27.h, z27.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	add	x2, x4, x3, lsl 1
	add	x5, x3, x4
	add	z6.h, z27.h, z31.h
	add	x4, x3, x2
	sub	z27.h, z27.h, z31.h
	ld1h	z31.h, p7/z, [x4]
	ld1h	z28.h, p7/z, [x2, x3, lsl 1]
	ld1h	z26.h, p7/z, [x5]
	ld1h	z29.h, p7/z, [x2]
	zip1	z30.d, z26.d, z31.d
	zip2	z26.d, z26.d, z31.d
	zip1	z31.d, z29.d, z28.d
	add	x0, x2, x3, lsl 1
	zip2	z29.d, z29.d, z28.d
	zip1	z28.d, z30.d, z31.d
	zip2	z30.d, z30.d, z31.d
	zip1	z31.d, z26.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z26.d, z26.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	sub	z18.h, z28.h, z26.h
	sub	z19.h, z30.h, z31.h
	add	z26.h, z26.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	add	x5, x3, x0
	add	x0, x0, x3, lsl 1
	add	z7.h, z26.h, z31.h
	add	x4, x0, x3
	sub	z26.h, z26.h, z31.h
	ld1h	z31.h, p7/z, [x4]
	ld1h	z28.h, p7/z, [x0, x3, lsl 1]
	ld1h	z25.h, p7/z, [x5]
	ld1h	z29.h, p7/z, [x0]
	zip1	z30.d, z25.d, z31.d
	zip2	z25.d, z25.d, z31.d
	zip1	z31.d, z29.d, z28.d
	add	x2, x0, x3, lsl 1
	zip2	z29.d, z29.d, z28.d
	zip1	z28.d, z30.d, z31.d
	zip2	z30.d, z30.d, z31.d
	zip1	z31.d, z25.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z25.d, z25.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	sub	z20.h, z28.h, z25.h
	sub	z21.h, z30.h, z31.h
	add	z25.h, z25.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	add	x0, x2, x3, lsl 1
	add	x4, x2, x3
	add	z5.h, z25.h, z31.h
	add	x2, x3, x0
	sub	z25.h, z25.h, z31.h
	ld1h	z31.h, p7/z, [x2]
	ld1h	z24.h, p7/z, [x4]
	ld1h	z29.h, p7/z, [x0]
	zip1	z30.d, z24.d, z31.d
	add	x3, x3, x2
	zip2	z24.d, z24.d, z31.d
	ld1h	z28.h, p7/z, [x3]
	zip1	z31.d, z29.d, z28.d
	zip2	z29.d, z29.d, z28.d
	zip1	z28.d, z30.d, z31.d
	zip2	z30.d, z30.d, z31.d
	zip1	z31.d, z24.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z24.d, z24.d, z29.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	sub	z22.h, z28.h, z24.h
	sub	z23.h, z30.h, z31.h
	add	z24.h, z24.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	adrp	x4, .LANCHOR0
	mov	x2, sp
	add	z2.h, z24.h, z31.h
	add	x3, x4, :lo12:.LANCHOR0
	mov	x0, 0
	sub	z24.h, z24.h, z31.h
	movi	d28, #0
.L2:
	ld1h	z29.h, p7/z, [x3, x0, lsl 1]
	add	x0, x0, 64
	movprfx	z31, z28
	sdot	z31.d, z6.h, z29.h
	movprfx	z3, z28
	sdot	z3.d, z7.h, z29.h
	movprfx	z30, z28
	sdot	z30.d, z5.h, z29.h
	movprfx	z4, z28
	sdot	z4.d, z2.h, z29.h
	uzp1	z31.s, z31.s, z3.s
	uzp1	z30.s, z30.s, z4.s
	sqrshrnb	z31.h, z31.s, #3
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z31.h, z31.h, z31.h
	uzp1	z30.h, z30.h, z30.h
	stp	q31, q30, [x2], 128
	cmp	x0, 256
	bne	.L2
	add	x0, x4, :lo12:.LANCHOR0
	add	x7, sp, 64
	ptrue	p7.b, all
	add	x6, sp, 80
	add	x5, x0, 64
	movi	d31, #0
	mov	x2, 0
.L3:
	lsl	x3, x2, 1
	ld1h	z28.h, p7/z, [x5, x2, lsl 1]
	movprfx	z29, z31
	sdot	z29.d, z27.h, z28.h
	movprfx	z6, z31
	sdot	z6.d, z26.h, z28.h
	uzp1	z29.s, z29.s, z6.s
	sqrshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z30, z31
	sdot	z30.d, z25.h, z28.h
	movprfx	z7, z31
	sdot	z7.d, z24.h, z28.h
	str	q29, [x7, x3]
	uzp1	z30.s, z30.s, z7.s
	add	x2, x2, 64
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	str	q30, [x6, x3]
	cmp	x2, 256
	bne	.L3
	add	x7, x0, 32
	ld1h	z27.h, p7/z, [x7]
	add	x6, x0, 544
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	ld1h	z28.h, p7/z, [x6]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	add	x5, x0, 96
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x5]
	uzp1	z29.h, z29.h, z29.h
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 608
	add	x8, x0, 160
	ld1h	z28.h, p7/z, [x3]
	stp	q29, q30, [sp, 32]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x8]
	uzp1	z29.h, z29.h, z29.h
	add	x8, x0, 672
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x8]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x8, x0, 224
	stp	q29, q30, [sp, 96]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x8]
	uzp1	z29.h, z29.h, z29.h
	add	x8, x0, 736
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x8]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x8, x0, 288
	stp	q29, q30, [sp, 160]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x8]
	uzp1	z29.h, z29.h, z29.h
	add	x8, x0, 800
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x8]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x8, x0, 352
	stp	q29, q30, [sp, 224]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x8]
	uzp1	z29.h, z29.h, z29.h
	add	x8, x0, 864
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x8]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x8, x0, 416
	stp	q29, q30, [sp, 288]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x8]
	uzp1	z29.h, z29.h, z29.h
	add	x8, x0, 928
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x8]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	sdot	z25.d, z19.h, z28.h
	add	x8, x0, 480
	stp	q29, q30, [sp, 352]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	sdot	z29.d, z17.h, z28.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	sqrshrnb	z29.h, z29.s, #3
	sqrshrnb	z30.h, z30.s, #3
	uzp1	z29.h, z29.h, z29.h
	uzp1	z30.h, z30.h, z30.h
	ld1h	z27.h, p7/z, [x8]
	add	x2, x0, 1024
	movprfx	z26, z31
	sdot	z26.d, z18.h, z27.h
	add	x8, x0, 992
	ld1h	z28.h, p7/z, [x8]
	stp	q29, q30, [sp, 416]
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	sdot	z31.d, z22.h, z27.h
	sdot	z30.d, z21.h, z28.h
	sdot	z31.d, z23.h, z28.h
	uzp1	z31.s, z30.s, z31.s
	sqrshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	sdot	z26.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	uzp1	z29.s, z29.s, z26.s
	sqrshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	stp	q29, q31, [sp, 480]
	ld1w	z31.s, p7/z, [x2]
	add	x2, x0, 1056
	ld1w	z28.s, p7/z, [x2]
	add	x2, x0, 1088
	ld1w	z6.s, p7/z, [x2]
	ld1d	z27.d, p7/z, [sp]
	add	x2, x0, 1120
	add	x0, x0, 1152
	ld1d	z29.d, p7/z, [x0]
	add	x0, sp, 32
	ld1d	z26.d, p7/z, [x0]
	ld1w	z7.s, p7/z, [x2]
	add	x0, sp, 64
	ld1d	z24.d, p7/z, [x0]
	zip1	z30.d, z27.d, z24.d
	add	x0, sp, 96
	zip2	z27.d, z27.d, z24.d
	ld1d	z25.d, p7/z, [x0]
	zip1	z24.d, z26.d, z25.d
	ptrue	p6.d, all
	zip2	z26.d, z26.d, z25.d
	zip1	z25.d, z30.d, z24.d
	zip2	z30.d, z30.d, z24.d
	zip1	z24.d, z27.d, z26.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z26.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	sub	z20.h, z25.h, z27.h
	saddlb	z26.s, z25.h, z27.h
	sub	z21.h, z30.h, z24.h
	saddlt	z25.s, z25.h, z27.h
	saddlb	z23.s, z30.h, z24.h
	zip1	z27.s, z26.s, z25.s
	saddlt	z30.s, z30.h, z24.h
	zip2	z26.s, z26.s, z25.s
#APP
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z25.d, p6/m, z23.d
// 0 "" 2
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z24.s, z30.s, z25.s
	zip2	z30.s, z30.s, z25.s
	sub	z16.s, z27.s, z24.s
	sub	z25.s, z26.s, z30.s
	add	z27.s, z27.s, z24.s
	add	z30.s, z26.s, z30.s
	uzp1	z16.h, z16.h, z25.h
	uzp2	z26.d, z27.d, z30.d
#APP
// 34 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z30.d, z27.d, z30.d
	add	z25.s, z26.s, z30.s
	sub	z30.s, z30.s, z26.s
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z31.s
	movprfx	z26, z30
	mul	z26.s, p7/m, z26.s, z28.s
	mul	z25.s, p7/m, z25.s, z6.s
	mul	z30.s, p7/m, z30.s, z7.s
#APP
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z27.s, p5/m, z27.s, z25.s
// 0 "" 2
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z26.s, p5/m, z26.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z27.s, z26.s
	uzp2	z27.s, z27.s, z26.s
	sqrshrnb	z30.h, z30.s, #10
	sqrshrnb	z27.h, z27.s, #10
	uzp1	z30.h, z30.h, z27.h
#APP
// 54 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	st1d {z30.d}, p6, [x1, z29.d]
// 0 "" 2
#NO_APP
	add	x0, sp, 128
	ld1d	z27.d, p7/z, [x0]
	add	x0, sp, 160
	ld1d	z26.d, p7/z, [x0]
	add	x0, sp, 192
	ld1d	z24.d, p7/z, [x0]
	zip1	z30.d, z27.d, z24.d
	add	x0, sp, 224
	zip2	z27.d, z27.d, z24.d
	ld1d	z25.d, p7/z, [x0]
	zip1	z24.d, z26.d, z25.d
	zip2	z26.d, z26.d, z25.d
	zip1	z25.d, z30.d, z24.d
	zip2	z30.d, z30.d, z24.d
	zip1	z24.d, z27.d, z26.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z26.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	sub	z22.h, z25.h, z27.h
	saddlb	z26.s, z25.h, z27.h
	sub	z23.h, z30.h, z24.h
	saddlt	z25.s, z25.h, z27.h
	saddlb	z19.s, z30.h, z24.h
	zip1	z27.s, z26.s, z25.s
	saddlt	z30.s, z30.h, z24.h
	zip2	z26.s, z26.s, z25.s
#APP
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z25.d, p6/m, z19.d
// 0 "" 2
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z24.s, z30.s, z25.s
	zip2	z30.s, z30.s, z25.s
	sub	z17.s, z27.s, z24.s
	sub	z25.s, z26.s, z30.s
	add	z27.s, z27.s, z24.s
	add	z30.s, z26.s, z30.s
	uzp1	z17.h, z17.h, z25.h
	uzp2	z26.d, z27.d, z30.d
#APP
// 34 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	uzp1	z30.d, z27.d, z30.d
	add	z25.s, z26.s, z30.s
	sub	z30.s, z30.s, z26.s
	movprfx	z27, z25
	mul	z27.s, p7/m, z27.s, z31.s
	movprfx	z26, z30
	mul	z26.s, p7/m, z26.s, z28.s
	mul	z25.s, p7/m, z25.s, z6.s
	mul	z30.s, p7/m, z30.s, z7.s
#APP
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z27.s, p5/m, z27.s, z25.s
// 0 "" 2
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z26.s, p5/m, z26.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z27.s, z26.s
	add	x0, x1, 8
	uzp2	z27.s, z27.s, z26.s
	sqrshrnb	z30.h, z30.s, #10
	sqrshrnb	z27.h, z27.s, #10
	uzp1	z30.h, z30.h, z27.h
#APP
// 54 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	st1d {z30.d}, p6, [x0, z29.d]
// 0 "" 2
#NO_APP
	add	x0, sp, 256
	ld1d	z27.d, p7/z, [x0]
	add	x0, sp, 288
	ld1d	z26.d, p7/z, [x0]
	add	x0, sp, 320
	ld1d	z25.d, p7/z, [x0]
	zip1	z30.d, z27.d, z25.d
	add	x0, sp, 352
	zip2	z27.d, z27.d, z25.d
	ld1d	z24.d, p7/z, [x0]
	zip1	z25.d, z26.d, z24.d
	zip2	z26.d, z26.d, z24.d
	zip1	z19.d, z30.d, z25.d
	zip1	z18.d, z27.d, z26.d
	zip2	z30.d, z30.d, z25.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z26.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	sub	z24.h, z19.h, z27.h
	saddlb	z26.s, z19.h, z27.h
	sub	z25.h, z30.h, z18.h
	saddlt	z19.s, z19.h, z27.h
	saddlb	z5.s, z30.h, z18.h
	zip1	z27.s, z26.s, z19.s
	saddlt	z30.s, z30.h, z18.h
	zip2	z26.s, z26.s, z19.s
#APP
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z19.d, p6/m, z5.d
// 0 "" 2
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z5.s, z30.s, z19.s
	zip2	z30.s, z30.s, z19.s
	sub	z18.s, z27.s, z5.s
	sub	z19.s, z26.s, z30.s
	add	z27.s, z27.s, z5.s
	add	z30.s, z26.s, z30.s
	uzp1	z18.h, z18.h, z19.h
	uzp2	z26.d, z27.d, z30.d
#APP
// 34 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	uzp1	z30.d, z27.d, z30.d
	add	z19.s, z26.s, z30.s
	sub	z30.s, z30.s, z26.s
	movprfx	z27, z19
	mul	z27.s, p7/m, z27.s, z31.s
	movprfx	z26, z30
	mul	z26.s, p7/m, z26.s, z28.s
	mul	z19.s, p7/m, z19.s, z6.s
	mul	z30.s, p7/m, z30.s, z7.s
#APP
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z27.s, p5/m, z27.s, z19.s
// 0 "" 2
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z26.s, p5/m, z26.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z27.s, z26.s
	add	x0, x1, 16
	uzp2	z27.s, z27.s, z26.s
	sqrshrnb	z30.h, z30.s, #10
	sqrshrnb	z27.h, z27.s, #10
	uzp1	z30.h, z30.h, z27.h
#APP
// 54 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	st1d {z30.d}, p6, [x0, z29.d]
// 0 "" 2
#NO_APP
	add	x0, sp, 384
	ld1d	z19.d, p7/z, [x0]
	add	x0, sp, 416
	ld1d	z27.d, p7/z, [x0]
	add	x0, sp, 448
	ld1d	z26.d, p7/z, [x0]
	zip1	z30.d, z19.d, z26.d
	add	x0, sp, 480
	ld1d	z5.d, p7/z, [x0]
	zip2	z19.d, z19.d, z26.d
	zip1	z26.d, z27.d, z5.d
	zip2	z27.d, z27.d, z5.d
	zip1	z5.d, z30.d, z26.d
	zip1	z3.d, z19.d, z27.d
	zip2	z30.d, z30.d, z26.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z3.d, p6/m, z3.d
// 0 "" 2
#NO_APP
	zip2	z19.d, z19.d, z27.d
#APP
// 15 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revh z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	sub	z26.h, z5.h, z19.h
	saddlb	z4.s, z5.h, z19.h
	sub	z27.h, z30.h, z3.h
	saddlt	z19.s, z5.h, z19.h
	saddlb	z2.s, z30.h, z3.h
	zip1	z5.s, z4.s, z19.s
	saddlt	z30.s, z30.h, z3.h
	zip2	z4.s, z4.s, z19.s
#APP
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z19.d, p6/m, z2.d
// 0 "" 2
// 25 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z3.s, z30.s, z19.s
	zip2	z30.s, z30.s, z19.s
	sub	z19.s, z5.s, z3.s
	sub	z2.s, z4.s, z30.s
	add	z5.s, z5.s, z3.s
	add	z30.s, z4.s, z30.s
	uzp1	z19.h, z19.h, z2.h
	uzp2	z4.d, z5.d, z30.d
#APP
// 34 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	revw z4.d, p6/m, z4.d
// 0 "" 2
#NO_APP
	uzp1	z30.d, z5.d, z30.d
	add	z5.s, z4.s, z30.s
	sub	z30.s, z30.s, z4.s
	mul	z31.s, p7/m, z31.s, z5.s
	mul	z28.s, p7/m, z28.s, z30.s
	mul	z5.s, p7/m, z5.s, z6.s
	mul	z30.s, p7/m, z30.s, z7.s
#APP
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z31.s, p5/m, z31.s, z5.s
// 0 "" 2
// 45 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	addp z28.s, p5/m, z28.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z31.s, z28.s
	add	x0, x1, 24
	sqrshrnb	z30.h, z30.s, #10
	uzp2	z31.s, z31.s, z28.s
	sqrshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z30.h, z31.h
#APP
// 54 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_legacy_sve2.cpp" 1
	st1d {z31.d}, p6, [x0, z29.d]
// 0 "" 2
#NO_APP
	add	x9, x1, 32
	add	x8, x1, 96
	ptrue	p7.b, all
	add	x2, x4, :lo12:.LANCHOR0
	mov	x0, 0
	movi	d31, #0
.L4:
	ld1h	z7.h, p7/z, [x7, x0, lsl 1]
	ld1h	z28.h, p7/z, [x6, x0, lsl 1]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z7.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z7.h
	movprfx	z29, z31
	sdot	z29.d, z24.h, z7.h
	movprfx	z6, z31
	sdot	z6.d, z26.h, z7.h
	movprfx	z7, z6
	sdot	z7.d, z27.h, z28.h
	sdot	z5.d, z23.h, z28.h
	sdot	z30.d, z21.h, z28.h
	sdot	z29.d, z25.h, z28.h
	uzp1	z30.s, z30.s, z5.s
	uzp1	z29.s, z29.s, z7.s
	sqrshrnb	z30.h, z30.s, #10
	ld1h	z7.h, p7/z, [x5, x0, lsl 1]
	sqrshrnb	z29.h, z29.s, #10
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x9, x0, lsl 1]
	ld1h	z28.h, p7/z, [x3, x0, lsl 1]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z7.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z7.h
	movprfx	z29, z31
	sdot	z29.d, z24.h, z7.h
	sdot	z30.d, z21.h, z28.h
	sdot	z5.d, z23.h, z28.h
	sdot	z29.d, z25.h, z28.h
	movprfx	z6, z31
	sdot	z6.d, z26.h, z7.h
	uzp1	z30.s, z30.s, z5.s
	movprfx	z7, z6
	sdot	z7.d, z27.h, z28.h
	sqrshrnb	z30.h, z30.s, #10
	uzp1	z29.s, z29.s, z7.s
	sqrshrnb	z29.h, z29.s, #10
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x8, x0, lsl 1]
	add	x0, x0, 64
	cmp	x0, 256
	bne	.L4
	add	x0, x2, 64
	ld1h	z28.h, p7/z, [x0]
	movprfx	z26, z31
	sdot	z26.d, z17.h, z28.h
	add	x0, x1, 64
	movprfx	z27, z31
	sdot	z27.d, z19.h, z28.h
	movprfx	z30, z31
	sdot	z30.d, z16.h, z28.h
	movprfx	z29, z31
	sdot	z29.d, z18.h, z28.h
	uzp1	z30.s, z30.s, z26.s
	uzp1	z29.s, z29.s, z27.s
	sqrshrnb	z30.h, z30.s, #10
	sqrshrnb	z29.h, z29.s, #10
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x0]
	add	x0, x2, 192
	ld1h	z28.h, p7/z, [x0]
	add	x0, x1, 192
	movprfx	z26, z31
	sdot	z26.d, z17.h, z28.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z28.h
	movprfx	z30, z31
	sdot	z30.d, z16.h, z28.h
	movprfx	z29, z31
	sdot	z29.d, z18.h, z28.h
	uzp1	z30.s, z30.s, z26.s
	uzp1	z29.s, z29.s, z27.s
	sqrshrnb	z30.h, z30.s, #10
	sqrshrnb	z29.h, z29.s, #10
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x0]
	add	x0, x2, 320
	ld1h	z28.h, p7/z, [x0]
	add	x0, x1, 320
	movprfx	z27, z31
	sdot	z27.d, z19.h, z28.h
	movprfx	z30, z31
	sdot	z30.d, z16.h, z28.h
	movprfx	z26, z31
	sdot	z26.d, z17.h, z28.h
	movprfx	z29, z31
	sdot	z29.d, z18.h, z28.h
	uzp1	z30.s, z30.s, z26.s
	uzp1	z29.s, z29.s, z27.s
	sqrshrnb	z30.h, z30.s, #10
	sqrshrnb	z29.h, z29.s, #10
	uzp1	z30.h, z30.h, z29.h
	st1h	z30.h, p7, [x0]
	add	x2, x2, 448
	add	x1, x1, 448
	ld1h	z28.h, p7/z, [x2]
	movprfx	z30, z31
	sdot	z30.d, z16.h, z28.h
	movprfx	z27, z31
	sdot	z27.d, z17.h, z28.h
	movprfx	z29, z31
	sdot	z29.d, z18.h, z28.h
	uzp1	z30.s, z30.s, z27.s
	sdot	z31.d, z19.h, z28.h
	sqrshrnb	z30.h, z30.s, #10
	uzp1	z31.s, z29.s, z31.s
	sqrshrnb	z31.h, z31.s, #10
	uzp1	z31.h, z30.h, z31.h
	st1h	z31.h, p7, [x1]
	add	sp, sp, 512
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3900:
	.size	dynopt_dct16_sve2_shared, .-dynopt_dct16_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZN12_GLOBAL__N_1L5CQ_LOE, %object
	.size	_ZN12_GLOBAL__N_1L5CQ_LOE, 512
_ZN12_GLOBAL__N_1L5CQ_LOE:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
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
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
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
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
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
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
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
	.type	_ZN12_GLOBAL__N_1L5CQ_HIE, %object
	.size	_ZN12_GLOBAL__N_1L5CQ_HIE, 512
_ZN12_GLOBAL__N_1L5CQ_HIE:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
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
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
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
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
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
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
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
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
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
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
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
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
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
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
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
	.type	_ZN12_GLOBAL__N_1L4T8E8E, %object
	.size	_ZN12_GLOBAL__N_1L4T8E8E, 128
_ZN12_GLOBAL__N_1L4T8E8E:
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
	.type	_ZN12_GLOBAL__N_1L9EVEN_OFFSE, %object
	.size	_ZN12_GLOBAL__N_1L9EVEN_OFFSE, 32
_ZN12_GLOBAL__N_1L9EVEN_OFFSE:
	.xword	0
	.xword	128
	.xword	256
	.xword	384
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
