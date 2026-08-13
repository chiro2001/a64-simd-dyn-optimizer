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
	adrp	x5, _ZN12_GLOBAL__N_1L6idx_qaE
	add	x5, x5, :lo12:_ZN12_GLOBAL__N_1L6idx_qaE
	ptrue	p7.b, all
	ld1h	z31.h, p7/z, [x5]
	ld1h	z23.h, p7/z, [x0]
	ld1h	z24.h, p7/z, [x0, x2, lsl 1]
	mov	z26.d, z23.d
	mov	z27.d, z24.d
	adrp	x5, _ZN12_GLOBAL__N_1L6idx_qbE
	add	x5, x5, :lo12:_ZN12_GLOBAL__N_1L6idx_qbE
	adrp	x3, .LANCHOR0
	ld1h	z30.h, p7/z, [x5]
	add	x4, x3, :lo12:.LANCHOR0
	add	x5, x0, x2, lsl 2
	ld1h	z28.h, p7/z, [x4]
	ld1h	z25.h, p7/z, [x5]
	ld1h	z29.h, p7/z, [x5, x2, lsl 1]
	tbl	z21.h, {z26.h - z27.h}, z28.h
	mov	z26.d, z25.d
	mov	z27.d, z29.d
	tbl	z22.h, {z26.h - z27.h}, z28.h
	rev	z27.h, z24.h
	rev	z26.h, z23.h
	tbl	z23.h, {z26.h - z27.h}, z28.h
	rev	z26.h, z25.h
	rev	z27.h, z29.h
	mov	z25.d, z22.d
	tbl	z29.h, {z26.h - z27.h}, z28.h
	mov	z24.d, z21.d
	mov	z27.d, z29.d
	tbl	z19.h, {z24.h - z25.h}, z31.h
	mov	z26.d, z23.d
	tbl	z24.h, {z24.h - z25.h}, z30.h
	sub	sp, sp, #512
	.cfi_def_cfa_offset 512
	tbl	z25.h, {z26.h - z27.h}, z31.h
	ptrue	p6.d, all
	tbl	z26.h, {z26.h - z27.h}, z30.h
	add	z18.h, z19.h, z25.h
	add	z29.h, z24.h, z26.h
	sub	z19.h, z19.h, z25.h
	sub	z24.h, z24.h, z26.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	add	x0, x5, x2, lsl 2
	ld1h	z20.h, p7/z, [x0]
	ld1h	z23.h, p7/z, [x0, x2, lsl 1]
	mov	z26.d, z20.d
	mov	z27.d, z23.d
	add	x0, x0, x2, lsl 2
	tbl	z22.h, {z26.h - z27.h}, z28.h
	add	z3.h, z18.h, z29.h
	ld1h	z21.h, p7/z, [x0]
	sub	z18.h, z18.h, z29.h
	mov	z26.d, z21.d
	ld1h	z29.h, p7/z, [x0, x2, lsl 1]
	mov	z27.d, z29.d
	tbl	z25.h, {z26.h - z27.h}, z28.h
	rev	z26.h, z20.h
	rev	z27.h, z23.h
	tbl	z23.h, {z26.h - z27.h}, z28.h
	rev	z26.h, z21.h
	rev	z27.h, z29.h
	tbl	z29.h, {z26.h - z27.h}, z28.h
	mov	z26.d, z22.d
	mov	z27.d, z25.d
	tbl	z20.h, {z26.h - z27.h}, z31.h
	tbl	z25.h, {z26.h - z27.h}, z30.h
	mov	z27.d, z29.d
	mov	z26.d, z23.d
	tbl	z22.h, {z26.h - z27.h}, z31.h
	tbl	z26.h, {z26.h - z27.h}, z30.h
	add	z17.h, z20.h, z22.h
	add	z29.h, z25.h, z26.h
	sub	z20.h, z20.h, z22.h
	sub	z25.h, z25.h, z26.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	add	x0, x0, x2, lsl 2
	add	z4.h, z17.h, z29.h
	ld1h	z16.h, p7/z, [x0, x2, lsl 1]
	ld1h	z7.h, p7/z, [x0]
	mov	z23.d, z16.d
	add	x0, x0, x2, lsl 2
	sub	z17.h, z17.h, z29.h
	ld1h	z29.h, p7/z, [x0, x2, lsl 1]
	mov	z27.d, z29.d
	ld1h	z21.h, p7/z, [x0]
	mov	z22.d, z7.d
	mov	z26.d, z21.d
	tbl	z22.h, {z22.h - z23.h}, z28.h
	tbl	z23.h, {z26.h - z27.h}, z28.h
	rev	z27.h, z16.h
	rev	z26.h, z7.h
	tbl	z16.h, {z26.h - z27.h}, z28.h
	rev	z27.h, z29.h
	rev	z26.h, z21.h
	tbl	z29.h, {z26.h - z27.h}, z28.h
	mov	z27.d, z23.d
	mov	z26.d, z22.d
	mov	z23.d, z29.d
	tbl	z21.h, {z26.h - z27.h}, z31.h
	mov	z22.d, z16.d
	tbl	z26.h, {z26.h - z27.h}, z30.h
	tbl	z27.h, {z22.h - z23.h}, z31.h
	tbl	z22.h, {z22.h - z23.h}, z30.h
	add	z16.h, z21.h, z27.h
	add	z29.h, z26.h, z22.h
	sub	z21.h, z21.h, z27.h
	sub	z26.h, z26.h, z22.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	add	x0, x0, x2, lsl 2
	ld1h	z2.h, p7/z, [x0]
	mov	z22.d, z2.d
	ld1h	z6.h, p7/z, [x0, x2, lsl 1]
	add	x0, x0, x2, lsl 2
	mov	z23.d, z6.d
	ld1h	z7.h, p7/z, [x0]
	tbl	z1.h, {z22.h - z23.h}, z28.h
	mov	z22.d, z7.d
	add	z5.h, z16.h, z29.h
	sub	z16.h, z16.h, z29.h
	ld1h	z29.h, p7/z, [x0, x2, lsl 1]
	mov	z23.d, z29.d
	tbl	z27.h, {z22.h - z23.h}, z28.h
	rev	z22.h, z2.h
	rev	z23.h, z6.h
	tbl	z2.h, {z22.h - z23.h}, z28.h
	rev	z22.h, z7.h
	mov	z7.d, z27.d
	mov	z6.d, z1.d
	rev	z23.h, z29.h
	tbl	z27.h, {z6.h - z7.h}, z30.h
	tbl	z29.h, {z22.h - z23.h}, z28.h
	tbl	z22.h, {z6.h - z7.h}, z31.h
	mov	z7.d, z29.d
	mov	z6.d, z2.d
	tbl	z31.h, {z6.h - z7.h}, z31.h
	tbl	z6.h, {z6.h - z7.h}, z30.h
	add	z7.h, z22.h, z31.h
	add	z30.h, z27.h, z6.h
	sub	z22.h, z22.h, z31.h
	sub	z27.h, z27.h, z6.h
#APP
// 339 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct16/candidates/best_sve2.cpp" 1
	revh z31.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	mov	x2, sp
	add	x4, x4, 32
	add	z1.h, z7.h, z31.h
	mov	x0, 0
	sub	z7.h, z7.h, z31.h
	movi	d23, #0
.L2:
	ld1h	z29.h, p7/z, [x4, x0, lsl 1]
	add	x0, x0, 64
	movprfx	z31, z23
	sdot	z31.d, z3.h, z29.h
	movprfx	z2, z23
	sdot	z2.d, z4.h, z29.h
	movprfx	z30, z23
	sdot	z30.d, z5.h, z29.h
	movprfx	z6, z23
	sdot	z6.d, z1.h, z29.h
	uzp1	z31.s, z31.s, z2.s
	uzp1	z30.s, z30.s, z6.s
	rshrnb	z31.h, z31.s, #3
	rshrnb	z30.h, z30.s, #3
	uzp1	z31.h, z31.h, z31.h
	uzp1	z30.h, z30.h, z30.h
	stp	q31, q30, [x2], 128
	cmp	x0, 256
	bne	.L2
	add	x0, x3, :lo12:.LANCHOR0
	add	x7, sp, 64
	ptrue	p7.b, all
	add	x6, sp, 80
	add	x5, x0, 96
	movi	d31, #0
	mov	x2, 0
.L3:
	lsl	x4, x2, 1
	ld1h	z23.h, p7/z, [x5, x2, lsl 1]
	movprfx	z29, z31
	sdot	z29.d, z18.h, z23.h
	movprfx	z5, z31
	sdot	z5.d, z17.h, z23.h
	uzp1	z29.s, z29.s, z5.s
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z30, z31
	sdot	z30.d, z16.h, z23.h
	movprfx	z6, z31
	sdot	z6.d, z7.h, z23.h
	str	q29, [x7, x4]
	uzp1	z30.s, z30.s, z6.s
	add	x2, x2, 64
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	str	q30, [x6, x4]
	cmp	x2, 256
	bne	.L3
	add	x2, x0, 64
	add	x4, x0, 576
	ld1h	z29.h, p7/z, [x2]
	ld1h	z30.h, p7/z, [x4]
	movprfx	z17, z31
	sdot	z17.d, z19.h, z29.h
	movprfx	z16, z31
	sdot	z16.d, z20.h, z29.h
	movprfx	z23, z31
	sdot	z23.d, z21.h, z29.h
	sdot	z16.d, z25.h, z30.h
	movprfx	z18, z31
	sdot	z18.d, z22.h, z29.h
	add	x4, x0, 128
	movprfx	z29, z18
	sdot	z29.d, z27.h, z30.h
	sdot	z17.d, z24.h, z30.h
	sdot	z23.d, z26.h, z30.h
	uzp1	z17.s, z17.s, z16.s
	uzp1	z23.s, z23.s, z29.s
	ld1h	z16.h, p7/z, [x4]
	add	x4, x0, 640
	movprfx	z6, z31
	sdot	z6.d, z20.h, z16.h
	ld1h	z29.h, p7/z, [x4]
	sdot	z6.d, z25.h, z29.h
	movprfx	z18, z31
	sdot	z18.d, z19.h, z16.h
	movprfx	z30, z31
	sdot	z30.d, z21.h, z16.h
	movprfx	z7, z31
	sdot	z7.d, z22.h, z16.h
	add	x4, x0, 192
	movprfx	z16, z7
	sdot	z16.d, z27.h, z29.h
	sdot	z18.d, z24.h, z29.h
	uzp1	z18.s, z18.s, z6.s
	ld1h	z6.h, p7/z, [x4]
	sdot	z30.d, z26.h, z29.h
	movprfx	z4, z31
	sdot	z4.d, z20.h, z6.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z6.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z6.h
	add	x4, x0, 704
	uzp1	z30.s, z30.s, z16.s
	ld1h	z7.h, p7/z, [x4]
	movprfx	z16, z31
	sdot	z16.d, z19.h, z6.h
	movprfx	z6, z5
	sdot	z6.d, z27.h, z7.h
	sdot	z4.d, z25.h, z7.h
	add	x4, x0, 256
	sdot	z16.d, z24.h, z7.h
	sdot	z29.d, z26.h, z7.h
	uzp1	z16.s, z16.s, z4.s
	uzp1	z29.s, z29.s, z6.s
	rshrnb	z16.h, z16.s, #3
	ld1h	z6.h, p7/z, [x4]
	uzp1	z16.h, z16.h, z16.h
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z4, z31
	sdot	z4.d, z20.h, z6.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z6.h
	add	x4, x0, 768
	ld1h	z7.h, p7/z, [x4]
	stp	q16, q29, [sp, 160]
	movprfx	z16, z31
	sdot	z16.d, z19.h, z6.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z6.h
	movprfx	z6, z5
	sdot	z6.d, z27.h, z7.h
	sdot	z4.d, z25.h, z7.h
	add	x4, x0, 320
	sdot	z16.d, z24.h, z7.h
	sdot	z29.d, z26.h, z7.h
	uzp1	z16.s, z16.s, z4.s
	uzp1	z29.s, z29.s, z6.s
	rshrnb	z16.h, z16.s, #3
	ld1h	z6.h, p7/z, [x4]
	uzp1	z16.h, z16.h, z16.h
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z4, z31
	sdot	z4.d, z20.h, z6.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z6.h
	add	x4, x0, 832
	ld1h	z7.h, p7/z, [x4]
	stp	q16, q29, [sp, 224]
	movprfx	z16, z31
	sdot	z16.d, z19.h, z6.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z6.h
	movprfx	z6, z5
	sdot	z6.d, z27.h, z7.h
	sdot	z4.d, z25.h, z7.h
	add	x4, x0, 384
	sdot	z16.d, z24.h, z7.h
	sdot	z29.d, z26.h, z7.h
	uzp1	z16.s, z16.s, z4.s
	uzp1	z29.s, z29.s, z6.s
	rshrnb	z16.h, z16.s, #3
	ld1h	z6.h, p7/z, [x4]
	uzp1	z16.h, z16.h, z16.h
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z4, z31
	sdot	z4.d, z20.h, z6.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z6.h
	add	x4, x0, 896
	ld1h	z7.h, p7/z, [x4]
	stp	q16, q29, [sp, 288]
	movprfx	z16, z31
	sdot	z16.d, z19.h, z6.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z6.h
	movprfx	z6, z5
	sdot	z6.d, z27.h, z7.h
	sdot	z4.d, z25.h, z7.h
	add	x4, x0, 448
	sdot	z16.d, z24.h, z7.h
	sdot	z29.d, z26.h, z7.h
	uzp1	z16.s, z16.s, z4.s
	uzp1	z29.s, z29.s, z6.s
	rshrnb	z16.h, z16.s, #3
	ld1h	z6.h, p7/z, [x4]
	uzp1	z16.h, z16.h, z16.h
	rshrnb	z29.h, z29.s, #3
	uzp1	z29.h, z29.h, z29.h
	movprfx	z4, z31
	sdot	z4.d, z20.h, z6.h
	movprfx	z5, z31
	sdot	z5.d, z22.h, z6.h
	add	x4, x0, 960
	ld1h	z7.h, p7/z, [x4]
	sdot	z4.d, z25.h, z7.h
	stp	q16, q29, [sp, 352]
	movprfx	z16, z31
	sdot	z16.d, z19.h, z6.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z6.h
	sdot	z16.d, z24.h, z7.h
	movprfx	z6, z5
	sdot	z6.d, z27.h, z7.h
	sdot	z29.d, z26.h, z7.h
	uzp1	z16.s, z16.s, z4.s
	uzp1	z29.s, z29.s, z6.s
	rshrnb	z16.h, z16.s, #3
	rshrnb	z29.h, z29.s, #3
	uzp1	z16.h, z16.h, z16.h
	uzp1	z29.h, z29.h, z29.h
	add	x2, x0, 1024
	add	x4, x0, 512
	ld1h	z7.h, p7/z, [x4]
	stp	q16, q29, [sp, 416]
	ld1h	z16.h, p7/z, [x2]
	movprfx	z29, z31
	sdot	z29.d, z19.h, z7.h
	movprfx	z19, z29
	sdot	z19.d, z24.h, z16.h
	movprfx	z24, z31
	sdot	z24.d, z20.h, z7.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z7.h
	sdot	z24.d, z25.h, z16.h
	sdot	z29.d, z26.h, z16.h
	sdot	z31.d, z22.h, z7.h
	sdot	z31.d, z27.h, z16.h
	ldr	q16, [x0, 1120]
	rshrnb	z23.h, z23.s, #3
	uzp1	z23.h, z23.h, z23.h
	uzp1	z27.s, z19.s, z24.s
	rshrnb	z17.h, z17.s, #3
	uzp1	z17.h, z17.h, z17.h
	ldp	q22, q26, [sp]
	uzp1	z31.s, z29.s, z31.s
	rshrnb	z31.h, z31.s, #3
	uzp1	z31.h, z31.h, z31.h
	rshrnb	z27.h, z27.s, #3
	uzp1	z27.h, z27.h, z27.h
	tbx	v23.16b, {v23.16b}, v16.16b
	stp	q27, q31, [sp, 480]
	rshrnb	z30.h, z30.s, #3
	uzp1	z30.h, z30.h, z30.h
	rshrnb	z18.h, z18.s, #3
	uzp1	z18.h, z18.h, z18.h
	tbx	v26.16b, {v26.16b}, v16.16b
	add	x2, x0, 1056
	ld1h	z29.h, p7/z, [x2]
	ldr	q5, [x0, 1136]
	add	x2, x0, 1088
	ld1h	z27.h, p7/z, [x2]
	saddl2	v24.4s, v17.8h, v23.8h
	add	x0, x0, 1184
	saddl	v31.4s, v22.4h, v26.4h
	add	x5, x1, 576
	saddl2	v21.4s, v22.8h, v26.8h
	sub	z22.h, z22.h, z26.h
	add	x2, x1, 192
	saddl	v25.4s, v17.4h, v23.4h
	sub	z23.h, z17.h, z23.h
	mov	v26.16b, v24.16b
	tbx	v30.16b, {v30.16b}, v16.16b
	tbx	v21.16b, {v21.16b}, v5.16b
	tbx	v26.16b, {v24.16b}, v5.16b
	saddl	v6.4s, v18.4h, v30.4h
	sub	v17.4s, v31.4s, v21.4s
	add	v31.4s, v31.4s, v21.4s
	sub	z21.h, z18.h, z30.h
	sub	v19.4s, v25.4s, v26.4s
	add	v26.4s, v25.4s, v26.4s
	zip1	v24.2d, v31.2d, v26.2d
	zip2	v31.2d, v31.2d, v26.2d
	ldp	q20, q26, [sp, 64]
	rev64	v31.4s, v31.4s
	tbx	v26.16b, {v26.16b}, v16.16b
	saddl2	v16.4s, v18.8h, v30.8h
	add	v25.4s, v31.4s, v24.4s
	saddl2	v7.4s, v20.8h, v26.8h
	mov	v30.16b, v16.16b
	sub	v24.4s, v24.4s, v31.4s
	saddl	v31.4s, v20.4h, v26.4h
	sub	z20.h, z20.h, z26.h
	mov	v26.16b, v7.16b
	tbx	v30.16b, {v16.16b}, v5.16b
	tbx	v26.16b, {v7.16b}, v5.16b
	sub	v16.4s, v6.4s, v30.4s
	add	v30.4s, v6.4s, v30.4s
	sub	v7.4s, v31.4s, v26.4s
	add	v31.4s, v31.4s, v26.4s
	zip1	v18.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldr	q30, [x0, -32]
	mov	x4, x0
	rev64	v31.4s, v31.4s
	mul	v26.4s, v19.4s, v30.4s
	add	v6.4s, v31.4s, v18.4s
	sub	v18.4s, v18.4s, v31.4s
	mul	v31.4s, v17.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v7.4s, v30.4s
	mul	v30.4s, v16.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 64]
.L4:
	ldr	q30, [x4], 16
	mul	v26.4s, v19.4s, v30.4s
	mul	v31.4s, v17.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v7.4s, v30.4s
	mul	v30.4s, v16.4s, v30.4s
	addp	v26.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x2], 128
	cmp	x5, x2
	bne	.L4
	addp	v31.4s, v25.4s, v6.4s
	add	x2, x3, :lo12:.LANCHOR0
	add	x5, x1, 584
	mov	x4, x0
	ldr	q30, [x2, 1232]
	shl	v31.4s, v31.4s, 6
	ldr	q7, [x2, 1120]
	ldr	q4, [x2, 1136]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1]
	mul	v31.4s, v24.4s, v30.4s
	mul	v30.4s, v18.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x2, 1264]
	rshrn	v31.4h, v31.4s, 10
	mul	v18.4s, v18.4s, v30.4s
	str	d31, [x1, 128]
	ldr	q31, [x2, 1248]
	mul	v6.4s, v6.4s, v31.4s
	mul	v25.4s, v25.4s, v31.4s
	mul	v31.4s, v24.4s, v30.4s
	mov	z30.d, z22.d
	addp	v25.4s, v25.4s, v6.4s
	addp	v31.4s, v31.4s, v18.4s
	rshrn	v25.4h, v25.4s, 10
	rshrn	v31.4h, v31.4s, 10
	str	d25, [x1, 256]
	str	d31, [x1, 384]
	mov	z31.d, z23.d
	tbl	z26.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z20.d
	mov	z31.d, z21.d
	tbl	z25.h, {z30.h - z31.h}, z28.h
	mov	z24.d, z26.d
	ldp	q20, q26, [sp, 128]
	tbl	z23.h, {z24.h - z25.h}, z29.h
	tbl	z25.h, {z30.h - z31.h}, z28.h
	tbl	z24.h, {z24.h - z25.h}, z27.h
	ldp	q21, q30, [sp, 160]
	tbx	v26.16b, {v26.16b}, v7.16b
	tbx	v30.16b, {v30.16b}, v7.16b
	saddl2	v19.4s, v20.8h, v26.8h
	saddl	v31.4s, v20.4h, v26.4h
	sub	z20.h, z20.h, z26.h
	saddl2	v22.4s, v21.8h, v30.8h
	saddl	v25.4s, v21.4h, v30.4h
	sub	z21.h, z21.h, z30.h
	mov	v26.16b, v19.16b
	mov	v30.16b, v22.16b
	tbx	v26.16b, {v19.16b}, v4.16b
	tbx	v30.16b, {v22.16b}, v4.16b
	sub	v16.4s, v31.4s, v26.4s
	add	v31.4s, v31.4s, v26.4s
	sub	v17.4s, v25.4s, v30.4s
	add	v30.4s, v25.4s, v30.4s
	ldp	q18, q26, [sp, 192]
	zip1	v22.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldp	q19, q30, [sp, 224]
	tbx	v26.16b, {v26.16b}, v7.16b
	rev64	v31.4s, v31.4s
	tbx	v30.16b, {v30.16b}, v7.16b
	saddl2	v5.4s, v18.8h, v26.8h
	add	v25.4s, v31.4s, v22.4s
	saddl2	v6.4s, v19.8h, v30.8h
	saddl	v7.4s, v19.4h, v30.4h
	sub	z19.h, z19.h, z30.h
	sub	v22.4s, v22.4s, v31.4s
	saddl	v31.4s, v18.4h, v26.4h
	sub	z18.h, z18.h, z26.h
	mov	v30.16b, v6.16b
	mov	v26.16b, v5.16b
	tbx	v30.16b, {v6.16b}, v4.16b
	tbx	v26.16b, {v5.16b}, v4.16b
	sub	v6.4s, v7.4s, v30.4s
	sub	v5.4s, v31.4s, v26.4s
	add	v30.4s, v7.4s, v30.4s
	add	v31.4s, v31.4s, v26.4s
	zip1	v7.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldr	q30, [x2, 1152]
	add	x2, x1, 200
	rev64	v31.4s, v31.4s
	mul	v26.4s, v17.4s, v30.4s
	add	v4.4s, v31.4s, v7.4s
	sub	v7.4s, v7.4s, v31.4s
	mul	v31.4s, v16.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v5.4s, v30.4s
	mul	v30.4s, v6.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 72]
.L5:
	ldr	q30, [x4], 16
	mul	v26.4s, v17.4s, v30.4s
	mul	v31.4s, v16.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v5.4s, v30.4s
	mul	v30.4s, v6.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x2], 128
	cmp	x5, x2
	bne	.L5
	addp	v31.4s, v25.4s, v4.4s
	add	x2, x3, :lo12:.LANCHOR0
	add	x5, x1, 592
	mov	x4, x0
	ldr	q30, [x2, 1232]
	shl	v31.4s, v31.4s, 6
	ldr	q5, [x2, 1120]
	ldr	q2, [x2, 1136]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 8]
	mul	v31.4s, v22.4s, v30.4s
	mul	v30.4s, v7.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x2, 1264]
	rshrn	v31.4h, v31.4s, 10
	mul	v7.4s, v7.4s, v30.4s
	str	d31, [x1, 136]
	ldr	q31, [x2, 1248]
	mul	v4.4s, v4.4s, v31.4s
	mul	v25.4s, v25.4s, v31.4s
	mul	v31.4s, v22.4s, v30.4s
	mov	z30.d, z20.d
	addp	v25.4s, v25.4s, v4.4s
	addp	v31.4s, v31.4s, v7.4s
	rshrn	v25.4h, v25.4s, 10
	rshrn	v31.4h, v31.4s, 10
	str	d25, [x1, 264]
	str	d31, [x1, 392]
	mov	z31.d, z21.d
	tbl	z25.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z18.d
	mov	z31.d, z19.d
	tbl	z26.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z25.d
	mov	z31.d, z26.d
	ldp	q18, q26, [sp, 256]
	tbl	z21.h, {z30.h - z31.h}, z29.h
	tbl	z22.h, {z30.h - z31.h}, z27.h
	ldp	q19, q30, [sp, 288]
	tbx	v26.16b, {v26.16b}, v5.16b
	tbx	v30.16b, {v30.16b}, v5.16b
	saddl2	v17.4s, v18.8h, v26.8h
	saddl	v31.4s, v18.4h, v26.4h
	sub	z18.h, z18.h, z26.h
	saddl2	v20.4s, v19.8h, v30.8h
	saddl	v25.4s, v19.4h, v30.4h
	sub	z19.h, z19.h, z30.h
	mov	v26.16b, v17.16b
	mov	v30.16b, v20.16b
	tbx	v26.16b, {v17.16b}, v2.16b
	tbx	v30.16b, {v20.16b}, v2.16b
	sub	v6.4s, v31.4s, v26.4s
	add	v31.4s, v31.4s, v26.4s
	sub	v7.4s, v25.4s, v30.4s
	add	v30.4s, v25.4s, v30.4s
	ldp	q16, q26, [sp, 320]
	zip1	v20.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldp	q17, q30, [sp, 352]
	tbx	v26.16b, {v26.16b}, v5.16b
	rev64	v31.4s, v31.4s
	tbx	v30.16b, {v30.16b}, v5.16b
	saddl2	v3.4s, v16.8h, v26.8h
	add	v25.4s, v31.4s, v20.4s
	saddl2	v4.4s, v17.8h, v30.8h
	saddl	v5.4s, v17.4h, v30.4h
	sub	z17.h, z17.h, z30.h
	sub	v20.4s, v20.4s, v31.4s
	saddl	v31.4s, v16.4h, v26.4h
	sub	z16.h, z16.h, z26.h
	mov	v30.16b, v4.16b
	mov	v26.16b, v3.16b
	tbx	v30.16b, {v4.16b}, v2.16b
	tbx	v26.16b, {v3.16b}, v2.16b
	sub	v4.4s, v5.4s, v30.4s
	sub	v3.4s, v31.4s, v26.4s
	add	v30.4s, v5.4s, v30.4s
	add	v31.4s, v31.4s, v26.4s
	zip1	v5.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldr	q30, [x2, 1152]
	add	x2, x1, 208
	rev64	v31.4s, v31.4s
	mul	v26.4s, v7.4s, v30.4s
	add	v2.4s, v31.4s, v5.4s
	sub	v5.4s, v5.4s, v31.4s
	mul	v31.4s, v6.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v3.4s, v30.4s
	mul	v30.4s, v4.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 80]
.L6:
	ldr	q30, [x4], 16
	mul	v26.4s, v7.4s, v30.4s
	mul	v31.4s, v6.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v3.4s, v30.4s
	mul	v30.4s, v4.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x2], 128
	cmp	x5, x2
	bne	.L6
	addp	v31.4s, v25.4s, v2.4s
	add	x2, x3, :lo12:.LANCHOR0
	add	x4, x1, 600
	ldr	q30, [x2, 1232]
	shl	v31.4s, v31.4s, 6
	ldr	q3, [x2, 1120]
	ldr	q0, [x2, 1136]
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 16]
	mul	v31.4s, v20.4s, v30.4s
	mul	v30.4s, v5.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x2, 1264]
	rshrn	v31.4h, v31.4s, 10
	mul	v5.4s, v5.4s, v30.4s
	str	d31, [x1, 144]
	ldr	q31, [x2, 1248]
	mul	v2.4s, v2.4s, v31.4s
	mul	v25.4s, v25.4s, v31.4s
	mul	v31.4s, v20.4s, v30.4s
	mov	z30.d, z18.d
	addp	v25.4s, v25.4s, v2.4s
	addp	v31.4s, v31.4s, v5.4s
	rshrn	v25.4h, v25.4s, 10
	rshrn	v31.4h, v31.4s, 10
	str	d25, [x1, 272]
	str	d31, [x1, 400]
	mov	z31.d, z19.d
	tbl	z25.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z16.d
	mov	z31.d, z17.d
	tbl	z26.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z25.d
	mov	z31.d, z26.d
	ldp	q17, q26, [sp, 384]
	tbl	z19.h, {z30.h - z31.h}, z29.h
	tbl	z20.h, {z30.h - z31.h}, z27.h
	ldp	q18, q30, [sp, 416]
	tbx	v26.16b, {v26.16b}, v3.16b
	tbx	v30.16b, {v30.16b}, v3.16b
	saddl2	v7.4s, v17.8h, v26.8h
	saddl	v31.4s, v17.4h, v26.4h
	sub	z17.h, z17.h, z26.h
	saddl2	v16.4s, v18.8h, v30.8h
	saddl	v25.4s, v18.4h, v30.4h
	sub	z18.h, z18.h, z30.h
	mov	v26.16b, v7.16b
	mov	v30.16b, v16.16b
	tbx	v26.16b, {v7.16b}, v0.16b
	tbx	v30.16b, {v16.16b}, v0.16b
	sub	v5.4s, v31.4s, v26.4s
	add	v31.4s, v31.4s, v26.4s
	sub	v6.4s, v25.4s, v30.4s
	add	v30.4s, v25.4s, v30.4s
	ldp	q7, q26, [sp, 448]
	zip1	v4.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldp	q16, q30, [sp, 480]
	tbx	v26.16b, {v26.16b}, v3.16b
	rev64	v31.4s, v31.4s
	tbx	v30.16b, {v30.16b}, v3.16b
	saddl2	v1.4s, v7.8h, v26.8h
	add	v25.4s, v31.4s, v4.4s
	saddl2	v2.4s, v16.8h, v30.8h
	saddl	v3.4s, v16.4h, v30.4h
	sub	z16.h, z16.h, z30.h
	sub	v4.4s, v4.4s, v31.4s
	saddl	v31.4s, v7.4h, v26.4h
	sub	z7.h, z7.h, z26.h
	mov	v30.16b, v2.16b
	mov	v26.16b, v1.16b
	tbx	v30.16b, {v2.16b}, v0.16b
	tbx	v26.16b, {v1.16b}, v0.16b
	sub	v2.4s, v3.4s, v30.4s
	sub	v1.4s, v31.4s, v26.4s
	add	v30.4s, v3.4s, v30.4s
	add	v31.4s, v31.4s, v26.4s
	zip1	v3.2d, v31.2d, v30.2d
	zip2	v31.2d, v31.2d, v30.2d
	ldr	q30, [x2, 1152]
	add	x2, x1, 216
	rev64	v31.4s, v31.4s
	mul	v26.4s, v6.4s, v30.4s
	add	v0.4s, v31.4s, v3.4s
	sub	v3.4s, v3.4s, v31.4s
	mul	v31.4s, v5.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v1.4s, v30.4s
	mul	v30.4s, v2.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, 88]
.L7:
	ldr	q30, [x0], 16
	mul	v26.4s, v6.4s, v30.4s
	mul	v31.4s, v5.4s, v30.4s
	addp	v31.4s, v31.4s, v26.4s
	mul	v26.4s, v1.4s, v30.4s
	mul	v30.4s, v2.4s, v30.4s
	addp	v30.4s, v26.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x2], 128
	cmp	x2, x4
	bne	.L7
	addp	v31.4s, v25.4s, v0.4s
	add	x2, x3, :lo12:.LANCHOR0
	ptrue	p7.b, all
	add	x3, x2, 64
	add	x1, x1, 32
	add	x2, x2, 576
	mov	x0, 0
	ldr	q30, [x2, 656]
	shl	v31.4s, v31.4s, 6
	rshrn	v31.4h, v31.4s, 10
	str	d31, [x1, -8]
	mul	v31.4s, v4.4s, v30.4s
	mul	v30.4s, v3.4s, v30.4s
	addp	v31.4s, v31.4s, v30.4s
	ldr	q30, [x2, 688]
	rshrn	v31.4h, v31.4s, 10
	mul	v3.4s, v3.4s, v30.4s
	str	d31, [x1, 120]
	ldr	q31, [x2, 672]
	mul	v25.4s, v25.4s, v31.4s
	mul	v0.4s, v0.4s, v31.4s
	mul	v31.4s, v4.4s, v30.4s
	mov	z30.d, z17.d
	addp	v25.4s, v25.4s, v0.4s
	addp	v31.4s, v31.4s, v3.4s
	rshrn	v25.4h, v25.4s, 10
	rshrn	v31.4h, v31.4s, 10
	str	d25, [x1, 248]
	str	d31, [x1, 376]
	mov	z31.d, z18.d
	tbl	z26.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z7.d
	mov	z31.d, z16.d
	tbl	z28.h, {z30.h - z31.h}, z28.h
	mov	z30.d, z26.d
	mov	z31.d, z28.d
	tbl	z18.h, {z30.h - z31.h}, z27.h
	tbl	z17.h, {z30.h - z31.h}, z29.h
	movi	d27, #0
	.p2align 5,,15
.L8:
	ld1h	z28.h, p7/z, [x3, x0, lsl 1]
	ld1h	z29.h, p7/z, [x2, x0, lsl 1]
	movprfx	z31, z27
	sdot	z31.d, z23.h, z28.h
	movprfx	z25, z27
	sdot	z25.d, z21.h, z28.h
	movprfx	z30, z27
	sdot	z30.d, z19.h, z28.h
	sdot	z31.d, z24.h, z29.h
	sdot	z25.d, z22.h, z29.h
	sdot	z30.d, z20.h, z29.h
	movprfx	z26, z27
	sdot	z26.d, z17.h, z28.h
	uzp1	z31.s, z31.s, z25.s
	movprfx	z28, z26
	sdot	z28.d, z18.h, z29.h
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
	.set	_ZN12_GLOBAL__N_1L6idx_qbE,_ZN12_GLOBAL__N_1L6idx_q1E
	.set	_ZN12_GLOBAL__N_1L6idx_qaE,_ZN12_GLOBAL__N_1L6idx_q0E
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
	.type	_ZN12_GLOBAL__N_1L6idx_loE, %object
	.size	_ZN12_GLOBAL__N_1L6idx_loE, 32
_ZN12_GLOBAL__N_1L6idx_loE:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	20
	.hword	21
	.hword	22
	.hword	23
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
	.type	_ZN12_GLOBAL__N_1L6idx_q0E, %object
	.size	_ZN12_GLOBAL__N_1L6idx_q0E, 32
_ZN12_GLOBAL__N_1L6idx_q0E:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	24
	.hword	25
	.hword	26
	.hword	27
	.type	_ZN12_GLOBAL__N_1L6idx_q1E, %object
	.size	_ZN12_GLOBAL__N_1L6idx_q1E, 32
_ZN12_GLOBAL__N_1L6idx_q1E:
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.hword	28
	.hword	29
	.hword	30
	.hword	31
.LC0:
	.byte	14
	.byte	15
	.byte	12
	.byte	13
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	2
	.byte	3
	.byte	0
	.byte	1
.LC1:
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
.LC2:
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
.LC3:
	.word	83
	.word	36
	.word	83
	.word	36
.LC4:
	.word	64
	.word	-64
	.word	64
	.word	-64
.LC5:
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
