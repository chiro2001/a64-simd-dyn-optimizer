	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_dct16_sve2_shared
	.type	dynopt_dct16_sve2_shared, %function
dynopt_dct16_sve2_shared:
.LFB3896:
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
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z29.d
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	sub	z16.h, z28.h, z27.h
	sub	z17.h, z30.h, z31.h
	add	z27.h, z27.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	add	x2, x4, x3, lsl 1
	add	x5, x4, x3
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
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z26.d, z26.d, z29.d
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z26.d, p6/m, z26.d
// 0 "" 2
#NO_APP
	sub	z18.h, z28.h, z26.h
	sub	z19.h, z30.h, z31.h
	add	z26.h, z26.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	add	x5, x3, x0
	add	x0, x0, x3, lsl 1
	add	z7.h, z26.h, z31.h
	add	x4, x3, x0
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
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z25.d, z25.d, z29.d
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	sub	z20.h, z28.h, z25.h
	sub	z21.h, z30.h, z31.h
	add	z25.h, z25.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	add	x0, x2, x3, lsl 1
	add	x4, x2, x3
	add	z5.h, z25.h, z31.h
	add	x2, x0, x3
	sub	z25.h, z25.h, z31.h
	ld1h	z31.h, p7/z, [x2]
	ld1h	z24.h, p7/z, [x4]
	ld1h	z29.h, p7/z, [x0]
	zip1	z30.d, z24.d, z31.d
	add	x2, x2, x3
	zip2	z24.d, z24.d, z31.d
	ld1h	z28.h, p7/z, [x2]
	zip1	z31.d, z29.d, z28.d
	zip2	z29.d, z29.d, z28.d
	zip1	z28.d, z30.d, z31.d
	zip2	z30.d, z30.d, z31.d
	zip1	z31.d, z24.d, z29.d
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip2	z24.d, z24.d, z29.d
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z24.d, p6/m, z24.d
// 0 "" 2
#NO_APP
	sub	z22.h, z28.h, z24.h
	sub	z23.h, z30.h, z31.h
	add	z24.h, z24.h, z28.h
	add	z31.h, z31.h, z30.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	adrp	x2, .LANCHOR0
	mov	x3, sp
	add	z2.h, z24.h, z31.h
	add	x4, x2, :lo12:.LANCHOR0
	mov	x0, 0
	sub	z24.h, z24.h, z31.h
	movi	d28, #0
.L2:
	ld1h	z29.h, p7/z, [x4, x0, lsl 1]
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
	rshrnb	z31.h, z31.s, #3
	rshrnb	z30.h, z30.s, #3
	uzp1	z31.h, z31.h, z31.h
	uzp1	z30.h, z30.h, z30.h
	stp	q31, q30, [x3], 128
	cmp	x0, 256
	bne	.L2
	add	x0, x2, :lo12:.LANCHOR0
	add	x7, sp, 64
	ptrue	p7.b, all
	add	x6, sp, 80
	add	x5, x0, 64
	movi	d31, #0
	mov	x3, 0
.L3:
	lsl	x4, x3, 1
	ld1h	z28.h, p7/z, [x5, x3, lsl 1]
	movprfx	z29, z31
	sdot	z29.d, z27.h, z28.h
	movprfx	z6, z31
	sdot	z6.d, z26.h, z28.h
	uzp1	z29.s, z29.s, z6.s
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z30, z31
	sdot	z30.d, z25.h, z28.h
	movprfx	z7, z31
	sdot	z7.d, z24.h, z28.h
	str	q29, [x7, x4]
	uzp1	z30.s, z30.s, z7.s
	add	x3, x3, 64
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	str	q30, [x6, x4]
	cmp	x3, 256
	bne	.L3
	add	x3, x0, 32
	ld1h	z27.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	add	x3, x0, 544
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 96
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	rshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x3]
	uzp1	z29.h, z29.h, z29.h
	add	x3, x0, 608
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 160
	stp	q29, q30, [sp, 32]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	rshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x3]
	uzp1	z29.h, z29.h, z29.h
	add	x3, x0, 672
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 224
	stp	q29, q30, [sp, 96]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	rshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x3]
	uzp1	z29.h, z29.h, z29.h
	add	x3, x0, 736
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 288
	stp	q29, q30, [sp, 160]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	rshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x3]
	uzp1	z29.h, z29.h, z29.h
	add	x3, x0, 800
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 352
	stp	q29, q30, [sp, 224]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	rshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x3]
	uzp1	z29.h, z29.h, z29.h
	add	x3, x0, 864
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	add	x3, x0, 416
	stp	q29, q30, [sp, 288]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z25.d, z19.h, z28.h
	sdot	z29.d, z17.h, z28.h
	sdot	z30.d, z21.h, z28.h
	uzp1	z29.s, z29.s, z25.s
	uzp1	z30.s, z30.s, z27.s
	rshrnb	z29.h, z29.s, #3
	ld1h	z27.h, p7/z, [x3]
	uzp1	z29.h, z29.h, z29.h
	add	x3, x0, 928
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	ld1h	z28.h, p7/z, [x3]
	movprfx	z25, z31
	sdot	z25.d, z18.h, z27.h
	movprfx	z26, z31
	sdot	z26.d, z22.h, z27.h
	sdot	z25.d, z19.h, z28.h
	add	x3, x0, 480
	stp	q29, q30, [sp, 352]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	sdot	z30.d, z21.h, z28.h
	movprfx	z27, z26
	sdot	z27.d, z23.h, z28.h
	sdot	z29.d, z17.h, z28.h
	uzp1	z30.s, z30.s, z27.s
	uzp1	z29.s, z29.s, z25.s
	rshrnb	z30.h, z30.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z29.h, z29.h
	ld1h	z27.h, p7/z, [x3]
	add	x3, x0, 992
	movprfx	z26, z31
	sdot	z26.d, z18.h, z27.h
	ld1h	z28.h, p7/z, [x3]
	sdot	z26.d, z19.h, z28.h
	stp	q29, q30, [sp, 416]
	movprfx	z30, z31
	sdot	z30.d, z20.h, z27.h
	movprfx	z29, z31
	sdot	z29.d, z16.h, z27.h
	sdot	z30.d, z21.h, z28.h
	sdot	z29.d, z17.h, z28.h
	uzp1	z29.s, z29.s, z26.s
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	ldr	q18, [x0, 1024]
	sdot	z31.d, z22.h, z27.h
	add	x3, sp, 32
	sdot	z31.d, z23.h, z28.h
	uzp1	z31.s, z30.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	stp	q29, q31, [sp, 480]
	ld1h	z26.h, p7/z, [x3]
	ld1h	z24.h, p7/z, [sp]
	rev	z27.h, z26.h
	rev	z25.h, z24.h
	add	x3, sp, 64
	saddl2	v29.4s, v24.8h, v25.8h
	ld1h	z22.h, p7/z, [x3]
	add	x3, sp, 96
	saddl2	v30.4s, v26.8h, v27.8h
	ld1h	z23.h, p7/z, [x3]
	rev	z17.h, z22.h
	saddl	v28.4s, v26.4h, v27.4h
	sub	z26.h, z26.h, z27.h
	rev	z19.h, z23.h
	saddl	v31.4s, v24.4h, v25.4h
	sub	z24.h, z24.h, z25.h
	add	x0, x0, 1072
	tbx	v29.16b, {v29.16b}, v18.16b
	add	x5, x1, 576
	tbx	v30.16b, {v30.16b}, v18.16b
	add	x3, x1, 192
	saddl	v25.4s, v23.4h, v19.4h
	sub	v20.4s, v31.4s, v29.4s
	sub	v21.4s, v28.4s, v30.4s
	add	v31.4s, v31.4s, v29.4s
	add	v30.4s, v28.4s, v30.4s
	saddl2	v29.4s, v22.8h, v17.8h
	zip1	v27.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	saddl2	v30.4s, v23.8h, v19.8h
	sub	z23.h, z23.h, z19.h
	tbx	v29.16b, {v29.16b}, v18.16b
	rev64	v31.4s, v31.4s
	tbx	v30.16b, {v30.16b}, v18.16b
	add	v28.4s, v31.4s, v27.4s
	sub	v27.4s, v27.4s, v31.4s
	saddl	v31.4s, v22.4h, v17.4h
	sub	z22.h, z22.h, z17.h
	sub	v18.4s, v25.4s, v30.4s
	add	v30.4s, v25.4s, v30.4s
	sub	v19.4s, v31.4s, v29.4s
	add	v31.4s, v31.4s, v29.4s
	zip1	v25.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldr	q30, [x0, -32]
	mov	x4, x0
	rev64	v31.4s, v31.4s
	mul	v29.4s, v21.4s, v30.4s
	add	v17.4s, v31.4s, v25.4s
	sub	v25.4s, v25.4s, v31.4s
	mul	v31.4s, v20.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	mul	v29.4s, v19.4s, v30.4s
	mul	v30.4s, v18.4s, v30.4s
	addp	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 64]
.L4:
	ldr	q30, [x4], 16
	mul	v29.4s, v21.4s, v30.4s
	mul	v31.4s, v20.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	mul	v29.4s, v19.4s, v30.4s
	mul	v30.4s, v18.4s, v30.4s
	addp	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x3], 128
	cmp	x5, x3
	bne	.L4
	addp	v31.4s, v28.4s, v17.4s
	add	x3, x2, :lo12:.LANCHOR0
	zip1	z26.d, z26.d, z23.d
	add	x4, sp, 128
	zip1	z24.d, z24.d, z22.d
	zip1	z23.d, z24.d, z26.d
	zip2	z24.d, z24.d, z26.d
	add	x5, x1, 584
	ldr	q30, [x3, 1120]
	shl	v31.4s, v31.4s, 6
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1]
	mul	v31.4s, v27.4s, v30.4s
	mul	v30.4s, v25.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x3, 1152]
	rshrn	v31.4h, v31.4s, 10
	mul	v25.4s, v25.4s, v30.4s
	str	d31, [x1, 128]
	ldr	q31, [x3, 1136]
	mul	v17.4s, v17.4s, v31.4s
	mul	v28.4s, v28.4s, v31.4s
	mul	v31.4s, v27.4s, v30.4s
	addp	v28.4s, v28.4s, v17.4s
	addp	v31.4s, v31.4s, v25.4s
	ldr	q17, [x3, 1024]
	rshrn	v28.4h, v28.4s, 10
	rshrn	v31.4h, v31.4s, 10
	str	d28, [x1, 256]
	str	d31, [x1, 384]
	ldr	z22, [x4]
	add	x4, sp, 160
	ldr	z26, [x4]
	rev	z25.h, z22.h
	rev	z27.h, z26.h
	saddl2	v29.4s, v22.8h, v25.8h
	add	x4, sp, 192
	ldr	z20, [x4]
	saddl2	v31.4s, v26.8h, v27.8h
	rev	z7.h, z20.h
	add	x4, sp, 224
	saddl	v28.4s, v26.4h, v27.4h
	ldr	z21, [x4]
	sub	z26.h, z26.h, z27.h
	saddl	v30.4s, v22.4h, v25.4h
	rev	z16.h, z21.h
	sub	z22.h, z22.h, z25.h
	tbx	v29.16b, {v29.16b}, v17.16b
	mov	x4, x0
	tbx	v31.16b, {v31.16b}, v17.16b
	saddl	v25.4s, v21.4h, v16.4h
	sub	v18.4s, v30.4s, v29.4s
	add	v30.4s, v30.4s, v29.4s
	add	v29.4s, v28.4s, v31.4s
	sub	v19.4s, v28.4s, v31.4s
	zip1	v31.2d, v30.2d, v29.2d
	zip2	v30.2d, v30.2d, v29.2d
	saddl2	v29.4s, v20.8h, v7.8h
	rev64	v30.4s, v30.4s
	tbx	v29.16b, {v29.16b}, v17.16b
	add	v27.4s, v30.4s, v31.4s
	sub	v28.4s, v31.4s, v30.4s
	saddl2	v31.4s, v21.8h, v16.8h
	sub	z21.h, z21.h, z16.h
	saddl	v30.4s, v20.4h, v7.4h
	sub	z20.h, z20.h, z7.h
	tbx	v31.16b, {v31.16b}, v17.16b
	sub	v16.4s, v30.4s, v29.4s
	add	v30.4s, v30.4s, v29.4s
	sub	v17.4s, v25.4s, v31.4s
	add	v31.4s, v25.4s, v31.4s
	zip1	v25.2d, v30.2d, v31.2d
	zip2	v30.2d, v30.2d, v31.2d
	ldr	q31, [x3, 1040]
	add	x3, x1, 200
	rev64	v30.4s, v30.4s
	mul	v29.4s, v19.4s, v31.4s
	add	v7.4s, v30.4s, v25.4s
	sub	v25.4s, v25.4s, v30.4s
	mul	v30.4s, v18.4s, v31.4s
	addp	v30.4s, v30.4s, v29.4s
	mul	v29.4s, v16.4s, v31.4s
	mul	v31.4s, v17.4s, v31.4s
	addp	v31.4s, v29.4s, v31.4s
	addp	v30.4s, v30.4s, v31.4s
	rshrn	v30.4h, v30.4s, 10
	str	d30, [x1, 72]
.L5:
	ldr	q30, [x4], 16
	mul	v29.4s, v19.4s, v30.4s
	mul	v31.4s, v18.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	mul	v29.4s, v16.4s, v30.4s
	mul	v30.4s, v17.4s, v30.4s
	addp	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x3], 128
	cmp	x5, x3
	bne	.L5
	addp	v31.4s, v27.4s, v7.4s
	add	x3, x2, :lo12:.LANCHOR0
	zip1	z26.d, z26.d, z21.d
	add	x4, sp, 256
	zip1	z22.d, z22.d, z20.d
	zip1	z21.d, z22.d, z26.d
	zip2	z22.d, z22.d, z26.d
	add	x5, x1, 592
	ldr	q30, [x3, 1120]
	shl	v31.4s, v31.4s, 6
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 8]
	mul	v31.4s, v28.4s, v30.4s
	mul	v30.4s, v25.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x3, 1136]
	rshrn	v31.4h, v31.4s, 10
	mul	v7.4s, v7.4s, v30.4s
	str	d31, [x1, 136]
	mul	v31.4s, v27.4s, v30.4s
	ldr	q30, [x3, 1152]
	addp	v31.4s, v31.4s, v7.4s
	mul	v25.4s, v25.4s, v30.4s
	ldr	q7, [x3, 1024]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 264]
	mul	v31.4s, v28.4s, v30.4s
	addp	v31.4s, v31.4s, v25.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 392]
	ldr	z19, [x4]
	add	x4, sp, 288
	ldr	z27, [x4]
	rev	z25.h, z19.h
	rev	z26.h, z27.h
	saddl2	v29.4s, v19.8h, v25.8h
	add	x4, sp, 320
	ldr	z20, [x4]
	saddl2	v31.4s, v27.8h, v26.8h
	rev	z5.h, z20.h
	add	x4, sp, 352
	saddl	v28.4s, v27.4h, v26.4h
	sub	z27.h, z27.h, z26.h
	saddl	v30.4s, v19.4h, v25.4h
	sub	z19.h, z19.h, z25.h
	ldr	z25, [x4]
	tbx	v29.16b, {v29.16b}, v7.16b
	rev	z6.h, z25.h
	mov	x4, x0
	tbx	v31.16b, {v31.16b}, v7.16b
	saddl	v16.4s, v25.4h, v6.4h
	sub	v17.4s, v30.4s, v29.4s
	add	v30.4s, v30.4s, v29.4s
	add	v29.4s, v28.4s, v31.4s
	sub	v18.4s, v28.4s, v31.4s
	zip1	v31.2d, v30.2d, v29.2d
	zip2	v30.2d, v30.2d, v29.2d
	saddl2	v29.4s, v20.8h, v5.8h
	rev64	v30.4s, v30.4s
	tbx	v29.16b, {v29.16b}, v7.16b
	add	v26.4s, v30.4s, v31.4s
	sub	v28.4s, v31.4s, v30.4s
	saddl2	v31.4s, v25.8h, v6.8h
	sub	z25.h, z25.h, z6.h
	saddl	v30.4s, v20.4h, v5.4h
	sub	z20.h, z20.h, z5.h
	tbx	v31.16b, {v31.16b}, v7.16b
	sub	v6.4s, v30.4s, v29.4s
	add	v30.4s, v30.4s, v29.4s
	sub	v7.4s, v16.4s, v31.4s
	add	v31.4s, v16.4s, v31.4s
	zip1	v16.2d, v30.2d, v31.2d
	zip2	v30.2d, v30.2d, v31.2d
	ldr	q31, [x3, 1040]
	add	x3, x1, 208
	rev64	v30.4s, v30.4s
	mul	v29.4s, v18.4s, v31.4s
	add	v5.4s, v30.4s, v16.4s
	sub	v16.4s, v16.4s, v30.4s
	mul	v30.4s, v17.4s, v31.4s
	addp	v30.4s, v30.4s, v29.4s
	mul	v29.4s, v6.4s, v31.4s
	mul	v31.4s, v7.4s, v31.4s
	addp	v31.4s, v29.4s, v31.4s
	addp	v30.4s, v30.4s, v31.4s
	rshrn	v30.4h, v30.4s, 10
	str	d30, [x1, 80]
.L6:
	ldr	q30, [x4], 16
	mul	v29.4s, v18.4s, v30.4s
	mul	v31.4s, v17.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	mul	v29.4s, v6.4s, v30.4s
	mul	v30.4s, v7.4s, v30.4s
	addp	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x3], 128
	cmp	x5, x3
	bne	.L6
	addp	v31.4s, v26.4s, v5.4s
	add	x3, x2, :lo12:.LANCHOR0
	zip1	z27.d, z27.d, z25.d
	add	x4, sp, 384
	zip1	z19.d, z19.d, z20.d
	zip1	z18.d, z19.d, z27.d
	zip2	z19.d, z19.d, z27.d
	ldr	q30, [x3, 1120]
	shl	v31.4s, v31.4s, 6
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 16]
	mul	v31.4s, v28.4s, v30.4s
	mul	v30.4s, v16.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x3, 1136]
	rshrn	v31.4h, v31.4s, 10
	mul	v5.4s, v5.4s, v30.4s
	str	d31, [x1, 144]
	mul	v31.4s, v26.4s, v30.4s
	ldr	q30, [x3, 1152]
	addp	v31.4s, v31.4s, v5.4s
	mul	v16.4s, v16.4s, v30.4s
	ldr	q5, [x3, 1024]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 272]
	mul	v31.4s, v28.4s, v30.4s
	addp	v31.4s, v31.4s, v16.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 400]
	ldr	z20, [x4]
	add	x4, sp, 416
	ldr	z26, [x4]
	rev	z25.h, z20.h
	rev	z27.h, z26.h
	saddl2	v29.4s, v20.8h, v25.8h
	add	x4, sp, 448
	ldr	z17, [x4]
	saddl2	v30.4s, v26.8h, v27.8h
	rev	z3.h, z17.h
	add	x4, sp, 480
	saddl	v28.4s, v26.4h, v27.4h
	sub	z26.h, z26.h, z27.h
	saddl	v31.4s, v20.4h, v25.4h
	sub	z20.h, z20.h, z25.h
	ldr	z25, [x4]
	tbx	v29.16b, {v29.16b}, v5.16b
	rev	z4.h, z25.h
	add	x4, x1, 600
	tbx	v30.16b, {v30.16b}, v5.16b
	saddl	v6.4s, v25.4h, v4.4h
	sub	v7.4s, v31.4s, v29.4s
	sub	v16.4s, v28.4s, v30.4s
	add	v31.4s, v31.4s, v29.4s
	add	v30.4s, v28.4s, v30.4s
	saddl2	v29.4s, v17.8h, v3.8h
	zip1	v27.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	saddl2	v30.4s, v25.8h, v4.8h
	sub	z25.h, z25.h, z4.h
	tbx	v29.16b, {v29.16b}, v5.16b
	rev64	v31.4s, v31.4s
	tbx	v30.16b, {v30.16b}, v5.16b
	add	v28.4s, v31.4s, v27.4s
	sub	v27.4s, v27.4s, v31.4s
	saddl	v31.4s, v17.4h, v3.4h
	sub	z17.h, z17.h, z3.h
	sub	v5.4s, v6.4s, v30.4s
	add	v30.4s, v6.4s, v30.4s
	sub	v4.4s, v31.4s, v29.4s
	add	v31.4s, v31.4s, v29.4s
	zip1	v6.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldr	q30, [x3, 1040]
	add	x3, x1, 216
	rev64	v31.4s, v31.4s
	mul	v29.4s, v16.4s, v30.4s
	add	v3.4s, v31.4s, v6.4s
	sub	v6.4s, v6.4s, v31.4s
	mul	v31.4s, v7.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	mul	v29.4s, v4.4s, v30.4s
	mul	v30.4s, v5.4s, v30.4s
	addp	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 88]
.L7:
	ldr	q30, [x0], 16
	mul	v29.4s, v16.4s, v30.4s
	mul	v31.4s, v7.4s, v30.4s
	addp	v31.4s, v31.4s, v29.4s
	mul	v29.4s, v4.4s, v30.4s
	mul	v30.4s, v5.4s, v30.4s
	addp	v30.4s, v29.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x3], 128
	cmp	x3, x4
	bne	.L7
	addp	v31.4s, v28.4s, v3.4s
	add	x2, x2, :lo12:.LANCHOR0
	zip1	z20.d, z20.d, z17.d
	add	x3, x2, 32
	add	x1, x1, 32
	zip1	z26.d, z26.d, z25.d
	add	x2, x2, 544
	mov	x0, 0
	zip1	z17.d, z20.d, z26.d
	ldr	q30, [x2, 576]
	zip2	z20.d, z20.d, z26.d
	ptrue	p7.b, all
	shl	v31.4s, v31.4s, 6
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, -8]
	mul	v31.4s, v27.4s, v30.4s
	mul	v30.4s, v6.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x2, 608]
	rshrn	v31.4h, v31.4s, 10
	mul	v6.4s, v6.4s, v30.4s
	str	d31, [x1, 120]
	ldr	q31, [x2, 592]
	mul	v28.4s, v28.4s, v31.4s
	mul	v3.4s, v3.4s, v31.4s
	mul	v31.4s, v27.4s, v30.4s
	movi	d27, #0
	addp	v28.4s, v28.4s, v3.4s
	addp	v31.4s, v31.4s, v6.4s
	rshrn	v28.4h, v28.4s, 10
	rshrn	v31.4h, v31.4s, 10
	str	d28, [x1, 248]
	str	d31, [x1, 376]
	.p2align 5,,15
.L8:
	ld1h	z28.h, p7/z, [x3, x0, lsl 1]
	ld1h	z29.h, p7/z, [x2, x0, lsl 1]
	movprfx	z31, z27
	sdot	z31.d, z23.h, z28.h
	movprfx	z25, z27
	sdot	z25.d, z21.h, z28.h
	movprfx	z30, z27
	sdot	z30.d, z18.h, z28.h
	sdot	z31.d, z24.h, z29.h
	sdot	z25.d, z22.h, z29.h
	sdot	z30.d, z19.h, z29.h
	movprfx	z26, z27
	sdot	z26.d, z17.h, z28.h
	uzp1	z31.s, z31.s, z25.s
	movprfx	z28, z26
	sdot	z28.d, z20.h, z29.h
	rshrnb	z31.h, z31.s, #10
	uzp1	z30.s, z30.s, z28.s
	rshrnb	z30.h, z30.s, #10
	uzp1	z31.h, z31.h, z30.h
	st1h	z31.h, p7, [x1, x0, lsl 1]
	add	x0, x0, 32
	cmp	x0, 256
	bne	.L8
	add	sp, sp, 512
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3896:
	.size	dynopt_dct16_sve2_shared, .-dynopt_dct16_sve2_shared
	.section	.rodata
	.align	4
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
.LC0:
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	0
	.byte	1
	.byte	2
	.byte	3
.LC1:
	.word	89
	.word	75
	.word	50
	.word	18
	.type	_ZN12_GLOBAL__N_1L8GT16_S32E, %object
	.size	_ZN12_GLOBAL__N_1L8GT16_S32E, 64
_ZN12_GLOBAL__N_1L8GT16_S32E:
	.word	89
	.word	75
	.word	50
	.word	18
	.word	75
	.word	-18
	.word	-89
	.word	-50
	.word	50
	.word	-89
	.word	18
	.word	75
	.word	18
	.word	-50
	.word	75
	.word	-89
.LC2:
	.word	83
	.word	36
	.word	83
	.word	36
.LC3:
	.word	64
	.word	-64
	.word	64
	.word	-64
.LC4:
	.word	36
	.word	-83
	.word	36
	.word	-83
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
