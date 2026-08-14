	.arch armv9.4-a+crc
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct16_sve2_shared
	.type	dynopt_idct16_sve2_shared, %function
dynopt_idct16_sve2_shared:
.LFB5:
	.cfi_startproc
	addvl	sp, sp, #-14
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x70,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.h, all
	sub	sp, sp, #576
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x70,0x1e,0x23,0xc0,0x4,0x22
	add	x3, x3, :lo12:.LANCHOR0
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
	ldp	q6, q5, [x0, 352]
	ldp	q15, q18, [x0, 32]
	ldp	q31, q3, [x0, 96]
	zip1	z0.h, z15.h, z31.h
	ldp	q16, q20, [x0, 160]
	ldp	q1, q4, [x0, 224]
	zip1	z2.h, z16.h, z1.h
	ldp	q17, q21, [x0, 288]
	zip1	z7.h, z17.h, z6.h
	ldp	q19, q22, [x0, 416]
	ldp	q8, q6, [x0, 480]
	zip1	z9.h, z19.h, z8.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z23.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z12.h
// 0 "" 2
#NO_APP
	add	x10, x3, 128
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z13.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z24.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x9, x3, 256
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z16.h
// 0 "" 2
#NO_APP
	add	x8, x3, 384
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z17.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z19.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	add	x7, x3, 512
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z7.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z12.h
// 0 "" 2
#NO_APP
	add	x6, x3, 640
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z13.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z24.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	add	x5, x3, 768
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x4, x3, 896
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z19.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z2.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z7.h
// 0 "" 2
#NO_APP
	ldp	q8, q10, [x0, 192]
	addvl	x11, sp, #8
	add	x11, x11, 64
	addvl	x12, sp, #11
	ldp	q9, q14, [x0, 64]
	zip1	z11.h, z9.h, z8.h
	add	x12, x12, 64
	str	q10, [x11]
	add	x14, x3, 1024
	ldp	q16, q13, [x0, 448]
	ldp	q12, q15, [x0, 320]
	zip1	z1.h, z12.h, z16.h
	str	q13, [x12]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z8.s, z11.h, z17.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z19.h
// 0 "" 2
#NO_APP
	add	x13, x3, 1088
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z11.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z2.h
// 0 "" 2
#NO_APP
	add	x12, x3, 1152
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z11.h, z7.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	add	x11, x3, 1216
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z11.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z11.h
// 0 "" 2
#NO_APP
	ldp	q1, q17, [x0]
	addvl	x15, sp, #6
	addvl	x16, sp, #9
	add	x15, x15, 64
	add	x16, x16, 64
	add	x17, x3, 1280
	str	q17, [x15]
	ldp	q19, q0, [x0, 256]
	zip1	z9.h, z1.h, z19.h
	str	q0, [x16]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z12.s, z9.h, z2.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1312
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	ldp	q1, q17, [x0, 128]
	addvl	x18, sp, #7
	add	x18, x18, 64
	add	x15, x3, 1344
	str	q17, [x18]
	ldp	q19, q0, [x0, 384]
	zip1	z9.h, z1.h, z19.h
	addvl	x0, sp, #10
	add	x0, x0, 64
	str	q0, [x0]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	add	x0, x3, 1376
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x18, sp, 64
	add	z0.s, z12.s, z2.s
	sub	z9.s, z0.s, z8.s
	add	z17.s, z0.s, z8.s
	add	z8.s, z17.s, z23.s
	str	z8, [x18]
	addvl	x18, sp, #4
	sub	z12.s, z12.s, z2.s
	sub	z2.s, z17.s, z23.s
	add	x18, x18, 64
	add	z23.s, z9.s, z24.s
	str	z23, [x18]
	addvl	x18, sp, #5
	sub	z24.s, z9.s, z24.s
	add	z11.s, z12.s, z13.s
	add	x18, x18, 64
	str	z24, [x18]
	add	z1.s, z11.s, z25.s
	addvl	x18, sp, #1
	sub	z13.s, z12.s, z13.s
	sub	z8.s, z11.s, z25.s
	add	x18, x18, 64
	str	z1, [x18]
	add	z25.s, z13.s, z29.s
	addvl	x18, sp, #2
	sub	z13.s, z13.s, z29.s
	add	z29.s, z7.s, z19.s
	add	x18, x18, 64
	sub	z7.s, z7.s, z19.s
	add	z19.s, z29.s, z10.s
	str	z25, [x18]
	addvl	x18, sp, #3
	sub	z0.s, z29.s, z10.s
	add	z12.s, z7.s, z16.s
	add	z29.s, z19.s, z26.s
	sub	z10.s, z19.s, z26.s
	add	x18, x18, 64
	add	z26.s, z0.s, z27.s
	sub	z11.s, z0.s, z27.s
	add	z19.s, z12.s, z28.s
	sub	z27.s, z7.s, z16.s
	zip1	z18.h, z18.h, z3.h
	sub	z12.s, z12.s, z28.s
	zip1	z3.h, z20.h, z4.h
	add	z17.s, z27.s, z30.s
	sub	z9.s, z27.s, z30.s
	zip1	z20.h, z21.h, z5.h
	zip1	z4.h, z22.h, z6.h
	str	z26, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z18.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z22.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z20.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z18.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z20.h, z23.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z24.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z18.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z20.h, z7.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z18.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z20.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z18.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z20.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #12
	add	x18, x18, 64
	str	z30, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z18.h, z7.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z20.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #13
	add	x18, x18, 64
	str	z25, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z18.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z20.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z18.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z20.h, z3.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #8
	add	x18, x18, 64
	ldr	z4, [x18]
	zip1	z14.h, z14.h, z4.h
	addvl	x18, sp, #11
	add	x18, x18, 64
	ldr	z1, [x18]
	zip1	z15.h, z15.h, z1.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z7.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #6
	add	x18, x18, 64
	ldr	z20, [x18]
	addvl	x18, sp, #9
	add	x18, x18, 64
	ldr	z14, [x18]
	zip1	z15.h, z20.h, z14.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #7
	add	x18, x18, 64
	ldr	z6, [x18]
	addvl	x18, sp, #10
	add	x18, x18, 64
	ldr	z28, [x18]
	zip1	z30.h, z6.h, z28.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z30.h, z18.h
// 0 "" 2
#NO_APP
	add	x18, sp, 64
	ldr	z20, [x18]
	sqrshrnb	z14.h, z20.s, #7
	addvl	x18, sp, #1
	uzp1	z7.h, z14.h, z14.h
	ptrue	p5.h, vl8
	add	x18, x18, 64
	ldr	z15, [x18]
	sqrshrnb	z30.h, z15.s, #7
	addvl	x18, sp, #2
	uzp1	z20.h, z30.h, z30.h
	sqrshrnb	z2.h, z2.s, #7
	add	x18, x18, 64
	ldr	z16, [x18]
	sqrshrnb	z18.h, z16.s, #7
	addvl	x18, sp, #3
	uzp1	z15.h, z18.h, z18.h
	uzp1	z2.h, z2.h, z2.h
	add	x18, x18, 64
	ldr	z14, [x18]
	sqrshrnb	z16.h, z14.s, #7
	addvl	x18, sp, #4
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x18, x18, 64
	ldr	z30, [x18]
	sqrshrnb	z18.h, z30.s, #7
	addvl	x18, sp, #5
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x18, x18, 64
	ldr	z14, [x18]
	sqrshrnb	z30.h, z14.s, #7
	add	z14.s, z27.s, z6.s
	sub	z27.s, z27.s, z6.s
	add	z6.s, z14.s, z0.s
	sub	z14.s, z14.s, z0.s
	add	z0.s, z6.s, z21.s
	sub	z21.s, z6.s, z21.s
	sqrshrnb	z0.h, z0.s, #7
	sqrshrnb	z6.h, z21.s, #7
	uzp1	z21.h, z0.h, z0.h
	uzp1	z0.h, z6.h, z6.h
	splice	z7.h, p5, z7.h, z21.h
	add	z21.s, z1.s, z28.s
	sub	z1.s, z1.s, z28.s
	add	z28.s, z21.s, z3.s
	splice	z2.h, p5, z2.h, z0.h
	sub	z6.s, z28.s, z22.s
	sub	z0.s, z21.s, z3.s
	addvl	x18, sp, #12
	add	z3.s, z28.s, z22.s
	sqrshrnb	z22.h, z3.s, #7
	uzp1	z28.h, z22.h, z22.h
	sqrshrnb	z21.h, z6.s, #7
	splice	z29.h, p5, z29.h, z28.h
	add	z22.s, z1.s, z4.s
	add	x18, x18, 64
	sub	z4.s, z1.s, z4.s
	add	z1.s, z22.s, z23.s
	sqrshrnb	z6.h, z1.s, #7
	uzp1	z28.h, z6.h, z6.h
	uzp1	z3.h, z21.h, z21.h
	splice	z19.h, p5, z19.h, z28.h
	ldr	z28, [x18]
	sub	z23.s, z22.s, z23.s
	addvl	x18, sp, #13
	sqrshrnb	z21.h, z23.s, #7
	add	z1.s, z27.s, z5.s
	add	x18, x18, 64
	sub	z5.s, z27.s, z5.s
	sqrshrnb	z10.h, z10.s, #7
	add	z27.s, z1.s, z24.s
	uzp1	z10.h, z10.h, z10.h
	sub	z24.s, z1.s, z24.s
	splice	z10.h, p5, z10.h, z3.h
	sqrshrnb	z22.h, z27.s, #7
	uzp1	z3.h, z21.h, z21.h
	sqrshrnb	z6.h, z24.s, #7
	uzp1	z23.h, z22.h, z22.h
	uzp1	z21.h, z6.h, z6.h
	ldr	z6, [x18]
	splice	z20.h, p5, z20.h, z23.h
	sub	z1.s, z5.s, z28.s
	add	z23.s, z4.s, z6.s
	sqrshrnb	z27.h, z1.s, #7
	sub	z4.s, z4.s, z6.s
	uzp1	z22.h, z27.h, z27.h
	addvl	x18, sp, #14
	sqrshrnb	z8.h, z8.s, #7
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z8.h, z8.h, z8.h
	uzp1	z12.h, z12.h, z12.h
	splice	z8.h, p5, z8.h, z21.h
	splice	z12.h, p5, z12.h, z3.h
	sqrshrnb	z21.h, z23.s, #7
	add	z3.s, z5.s, z28.s
	sqrshrnb	z5.h, z3.s, #7
	uzp1	z24.h, z5.h, z5.h
	add	z6.s, z14.s, z26.s
	splice	z15.h, p5, z15.h, z24.h
	sqrshrnb	z28.h, z4.s, #7
	uzp1	z3.h, z21.h, z21.h
	uzp1	z1.h, z28.h, z28.h
	add	z5.s, z0.s, z25.s
	sqrshrnb	z23.h, z6.s, #7
	sub	z25.s, z0.s, z25.s
	uzp1	z4.h, z23.h, z23.h
	sqrshrnb	z0.h, z5.s, #7
	sqrshrnb	z27.h, z25.s, #7
	uzp1	z24.h, z0.h, z0.h
	add	x18, x18, 64
	sub	z26.s, z14.s, z26.s
	sqrshrnb	z13.h, z13.s, #7
	sqrshrnb	z14.h, z26.s, #7
	uzp1	z13.h, z13.h, z13.h
	uzp1	z21.h, z14.h, z14.h
	splice	z13.h, p5, z13.h, z22.h
	uzp1	z22.h, z27.h, z27.h
	ptrue	p6.b, all
	zip1	z5.h, z15.h, z8.h
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z16.h, z16.h, z16.h
	uzp1	z17.h, z17.h, z17.h
	splice	z16.h, p5, z16.h, z24.h
	splice	z17.h, p5, z17.h, z3.h
	zip1	z6.h, z16.h, z10.h
	zip1	z14.h, z17.h, z12.h
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z11.h, z11.s, #7
	splice	z18.h, p5, z18.h, z4.h
	uzp1	z30.h, z30.h, z30.h
	uzp1	z11.h, z11.h, z11.h
	splice	z30.h, p5, z30.h, z21.h
	splice	z11.h, p5, z11.h, z22.h
	zip1	z28.h, z7.h, z30.h
	zip1	z27.h, z29.h, z11.h
	zip1	z22.h, z20.h, z13.h
	zip1	z24.h, z27.h, z14.h
	zip1	z21.h, z18.h, z2.h
	zip1	z26.h, z28.h, z5.h
	zip1	z4.h, z22.h, z21.h
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	splice	z9.h, p5, z9.h, z1.h
	zip1	z1.h, z24.h, z4.h
	zip1	z25.h, z19.h, z9.h
	zip1	z3.h, z25.h, z6.h
	zip1	z23.h, z26.h, z3.h
	zip1	z0.h, z23.h, z1.h
	st1h	z0.h, p6, [x18]
	addvl	x18, sp, #14
	zip2	z23.h, z23.h, z1.h
	add	x18, x18, 96
	st1h	z23.h, p6, [x18]
	zip2	z26.h, z26.h, z3.h
	addvl	x18, sp, #14
	zip2	z3.h, z24.h, z4.h
	zip1	z24.h, z26.h, z3.h
	add	x18, x18, 128
	st1h	z24.h, p6, [x18]
	zip2	z4.h, z26.h, z3.h
	addvl	x18, sp, #14
	zip2	z5.h, z28.h, z5.h
	zip2	z28.h, z25.h, z6.h
	add	x18, x18, 160
	st1h	z4.h, p6, [x18]
	zip2	z6.h, z22.h, z21.h
	addvl	x18, sp, #14
	zip2	z25.h, z27.h, z14.h
	zip1	z27.h, z5.h, z28.h
	add	x18, x18, 192
	zip1	z14.h, z25.h, z6.h
	zip1	z22.h, z27.h, z14.h
	st1h	z22.h, p6, [x18]
	addvl	x18, sp, #14
	zip2	z21.h, z27.h, z14.h
	add	x18, x18, 224
	st1h	z21.h, p6, [x18]
	zip2	z1.h, z5.h, z28.h
	addvl	x18, sp, #14
	zip2	z0.h, z25.h, z6.h
	zip1	z23.h, z1.h, z0.h
	add	x18, x18, 256
	st1h	z23.h, p6, [x18]
	zip2	z26.h, z1.h, z0.h
	addvl	x18, sp, #14
	zip2	z15.h, z15.h, z8.h
	zip2	z19.h, z19.h, z9.h
	add	x18, x18, 288
	st1h	z26.h, p6, [x18]
	zip2	z16.h, z16.h, z10.h
	addvl	x18, sp, #14
	zip2	z29.h, z29.h, z11.h
	zip2	z17.h, z17.h, z12.h
	add	x18, x18, 320
	zip1	z11.h, z19.h, z16.h
	zip1	z9.h, z29.h, z17.h
	zip2	z20.h, z20.h, z13.h
	zip2	z18.h, z18.h, z2.h
	zip2	z7.h, z7.h, z30.h
	zip1	z8.h, z20.h, z18.h
	zip1	z30.h, z7.h, z15.h
	zip1	z12.h, z9.h, z8.h
	zip1	z13.h, z30.h, z11.h
	zip1	z10.h, z13.h, z12.h
	st1h	z10.h, p6, [x18]
	addvl	x18, sp, #14
	zip2	z2.h, z13.h, z12.h
	zip2	z3.h, z30.h, z11.h
	add	x18, x18, 352
	st1h	z2.h, p6, [x18]
	zip2	z24.h, z9.h, z8.h
	addvl	x18, sp, #14
	zip1	z4.h, z3.h, z24.h
	zip2	z5.h, z3.h, z24.h
	add	x18, x18, 384
	st1h	z4.h, p6, [x18]
	zip2	z25.h, z7.h, z15.h
	addvl	x18, sp, #14
	zip2	z6.h, z19.h, z16.h
	zip2	z14.h, z29.h, z17.h
	add	x18, x18, 416
	st1h	z5.h, p6, [x18]
	zip2	z22.h, z20.h, z18.h
	addvl	x18, sp, #14
	zip1	z28.h, z25.h, z6.h
	zip1	z27.h, z14.h, z22.h
	add	x18, x18, 448
	zip1	z21.h, z28.h, z27.h
	st1h	z21.h, p6, [x18]
	addvl	x18, sp, #14
	zip2	z1.h, z28.h, z27.h
	zip2	z0.h, z25.h, z6.h
	add	x18, x18, 480
	st1h	z1.h, p6, [x18]
	zip2	z23.h, z14.h, z22.h
	addvl	x18, sp, #14
	zip1	z26.h, z0.h, z23.h
	zip2	z7.h, z0.h, z23.h
	add	x18, x18, 512
	st1h	z26.h, p6, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 64
	ldr	q17, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 544
	st1h	z7.h, p6, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 96
	ldr	q15, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 128
	ldr	q20, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 160
	ldr	q19, [x18]
	zip1	z11.h, z15.h, z19.h
	addvl	x18, sp, #14
	add	x18, x18, 192
	ldr	q9, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 224
	ldr	q16, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 256
	ldr	q8, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 288
	ldr	q29, [x18]
	zip1	z12.h, z16.h, z29.h
	addvl	x18, sp, #14
	add	x18, x18, 320
	ldr	q2, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 352
	ldr	q18, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 384
	ldr	q3, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 416
	ldr	q30, [x18]
	zip1	z13.h, z18.h, z30.h
	addvl	x18, sp, #14
	add	x18, x18, 448
	ldr	q4, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 480
	ldr	q10, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 512
	ldr	q5, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 544
	ldr	q24, [x18]
	zip1	z6.h, z10.h, z24.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z11.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z12.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z13.h, z22.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z6.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z12.h, z21.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z23.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z19.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z22.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z21.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z19.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z11.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z12.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z13.h
// 0 "" 2
#NO_APP
	zip1	z8.h, z20.h, z8.h
	zip1	z3.h, z3.h, z5.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z8.h, z20.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z11.s, z8.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z22.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z14.s, z8.h, z21.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z15.h
// 0 "" 2
#NO_APP
	zip1	z17.h, z17.h, z2.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z2.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z17.h, z19.h
// 0 "" 2
#NO_APP
	zip1	z9.h, z9.h, z4.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z12.s, z9.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #14
	add	z8.s, z29.s, z12.s
	add	z20.s, z8.s, z5.s
	add	x18, x18, 80
	add	z15.s, z20.s, z1.s
	sub	z1.s, z20.s, z1.s
	sub	z5.s, z8.s, z5.s
	add	z17.s, z5.s, z10.s
	sub	z10.s, z5.s, z10.s
	ldr	q9, [x18]
	sub	z3.s, z29.s, z12.s
	add	z22.s, z3.s, z18.s
	addvl	x18, sp, #14
	sub	z21.s, z3.s, z18.s
	sub	z0.s, z22.s, z25.s
	add	x18, x18, 112
	add	z20.s, z22.s, z25.s
	sub	z25.s, z21.s, z24.s
	add	z18.s, z13.s, z16.s
	sub	z26.s, z13.s, z16.s
	add	z6.s, z21.s, z24.s
	ldr	q4, [x18]
	add	z24.s, z18.s, z11.s
	sub	z11.s, z18.s, z11.s
	addvl	x18, sp, #3
	sub	z18.s, z11.s, z27.s
	add	z29.s, z24.s, z7.s
	add	x18, x18, 64
	str	z1, [x18]
	add	z13.s, z26.s, z14.s
	add	x18, sp, 64
	str	z10, [x18]
	add	z19.s, z13.s, z23.s
	addvl	x18, sp, #14
	sub	z23.s, z13.s, z23.s
	add	x18, x18, 144
	ldr	q2, [x18]
	addvl	x18, sp, #4
	add	x18, x18, 64
	str	q2, [x18]
	addvl	x18, sp, #1
	sub	z2.s, z24.s, z7.s
	add	x18, x18, 64
	str	z25, [x18]
	add	z7.s, z11.s, z27.s
	addvl	x18, sp, #14
	sub	z27.s, z26.s, z14.s
	add	z16.s, z27.s, z28.s
	add	x18, x18, 176
	sub	z1.s, z27.s, z28.s
	ldr	q28, [x18]
	zip1	z12.h, z4.h, z28.h
	addvl	x18, sp, #14
	add	x18, x18, 208
	ldr	q10, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 240
	ldr	q14, [x18]
	addvl	x18, sp, #2
	add	x18, x18, 64
	str	z23, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 272
	ldr	q8, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 304
	ldr	q30, [x18]
	zip1	z13.h, z14.h, z30.h
	addvl	x18, sp, #14
	add	x18, x18, 336
	ldr	q4, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 368
	ldr	q5, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 400
	ldr	q3, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 432
	ldr	q22, [x18]
	zip1	z14.h, z5.h, z22.h
	addvl	x18, sp, #14
	add	x18, x18, 464
	ldr	q5, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 496
	ldr	q21, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 528
	ldr	q11, [x18]
	addvl	x18, sp, #14
	add	x18, x18, 560
	ldr	q26, [x18]
	zip1	z28.h, z21.h, z26.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z24.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z28.h, z23.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z28.h, z24.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z28.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z28.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z28.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z28.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	str	z26, [x3]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z28.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z13.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #4
	add	x10, x10, 64
	ldr	z28, [x10]
	zip1	z30.h, z28.h, z8.h
	zip1	z28.h, z3.h, z11.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z8.s, z30.h, z3.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z8.s, z28.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z11.s, z30.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z11.s, z28.h, z13.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z12.s, z30.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z12.s, z28.h, z3.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z30.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z28.h, z30.h
// 0 "" 2
#NO_APP
	zip1	z3.h, z9.h, z4.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z9.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	zip1	z10.h, z10.h, z5.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z14.s, z10.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z31.s, z10.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #1
	add	x9, sp, 64
	ldr	z3, [x9]
	add	x8, x8, 64
	ldr	z10, [x8]
	sqrshrnb	z4.h, z3.s, #12
	sqrshrnb	z5.h, z10.s, #12
	addvl	x7, sp, #2
	addvl	x6, sp, #3
	add	x7, x7, 64
	ldr	z3, [x7]
	add	x6, x6, 64
	uzp1	z30.h, z4.h, z4.h
	sqrshrnb	z10.h, z3.s, #12
	uzp1	z4.h, z5.h, z5.h
	ldr	z5, [x6]
	uzp1	z3.h, z10.h, z10.h
	sqrshrnb	z10.h, z5.s, #12
	add	z5.s, z28.s, z14.s
	sub	z28.s, z28.s, z14.s
	add	z14.s, z5.s, z8.s
	sub	z5.s, z5.s, z8.s
	add	z8.s, z14.s, z21.s
	sub	z21.s, z14.s, z21.s
	sqrshrnb	z8.h, z8.s, #12
	sqrshrnb	z14.h, z21.s, #12
	uzp1	z21.h, z8.h, z8.h
	uzp1	z8.h, z14.h, z14.h
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z10.h, z10.h, z10.h
	uzp1	z15.h, z15.h, z15.h
	splice	z10.h, p5, z10.h, z8.h
	splice	z15.h, p5, z15.h, z21.h
	add	z21.s, z9.s, z31.s
	sub	z31.s, z9.s, z31.s
	sub	z8.s, z21.s, z11.s
	add	z9.s, z21.s, z11.s
	add	z11.s, z9.s, z22.s
	sub	z22.s, z9.s, z22.s
	sqrshrnb	z14.h, z11.s, #12
	sqrshrnb	z21.h, z22.s, #12
	uzp1	z9.h, z14.h, z14.h
	add	z22.s, z31.s, z12.s
	uzp1	z11.h, z21.h, z21.h
	sub	z12.s, z31.s, z12.s
	add	z31.s, z22.s, z23.s
	addvl	x5, sp, #5
	sub	z23.s, z22.s, z23.s
	sqrshrnb	z14.h, z31.s, #12
	sqrshrnb	z21.h, z23.s, #12
	add	z31.s, z28.s, z13.s
	sqrshrnb	z29.h, z29.s, #12
	sub	z13.s, z28.s, z13.s
	uzp1	z29.h, z29.h, z29.h
	add	z28.s, z31.s, z24.s
	splice	z29.h, p5, z29.h, z9.h
	sub	z24.s, z31.s, z24.s
	uzp1	z9.h, z14.h, z14.h
	sqrshrnb	z22.h, z28.s, #12
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	splice	z2.h, p5, z2.h, z11.h
	uzp1	z11.h, z21.h, z21.h
	sqrshrnb	z14.h, z24.s, #12
	splice	z3.h, p5, z3.h, z11.h
	uzp1	z23.h, z22.h, z22.h
	sub	z11.s, z13.s, z25.s
	uzp1	z21.h, z14.h, z14.h
	sqrshrnb	z31.h, z11.s, #12
	add	x5, x5, 64
	ldr	z24, [x5]
	uzp1	z28.h, z31.h, z31.h
	add	z22.s, z12.s, z24.s
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	splice	z19.h, p5, z19.h, z9.h
	add	z9.s, z13.s, z25.s
	sqrshrnb	z25.h, z9.s, #12
	uzp1	z13.h, z25.h, z25.h
	splice	z4.h, p5, z4.h, z28.h
	sub	z12.s, z12.s, z24.s
	add	z28.s, z5.s, z27.s
	sqrshrnb	z14.h, z22.s, #12
	add	z11.s, z8.s, z26.s
	sqrshrnb	z24.h, z28.s, #12
	sub	z26.s, z8.s, z26.s
	uzp1	z22.h, z24.h, z24.h
	sqrshrnb	z8.h, z11.s, #12
	sqrshrnb	z25.h, z26.s, #12
	uzp1	z31.h, z8.h, z8.h
	sub	z27.s, z5.s, z27.s
	sqrshrnb	z20.h, z20.s, #12
	sqrshrnb	z5.h, z27.s, #12
	uzp1	z20.h, z20.h, z20.h
	sqrshrnb	z6.h, z6.s, #12
	splice	z20.h, p5, z20.h, z23.h
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z23.h, z12.s, #12
	splice	z6.h, p5, z6.h, z13.h
	uzp1	z9.h, z23.h, z23.h
	uzp1	z13.h, z25.h, z25.h
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	splice	z0.h, p5, z0.h, z21.h
	uzp1	z21.h, z14.h, z14.h
	zip1	z23.h, z20.h, z4.h
	uzp1	z12.h, z5.h, z5.h
	sqrshrnb	z16.h, z16.s, #12
	splice	z30.h, p5, z30.h, z12.h
	uzp1	z16.h, z16.h, z16.h
	sqrshrnb	z7.h, z7.s, #12
	splice	z16.h, p5, z16.h, z21.h
	sqrshrnb	z17.h, z17.s, #12
	zip1	z21.h, z16.h, z3.h
	uzp1	z7.h, z7.h, z7.h
	uzp1	z17.h, z17.h, z17.h
	splice	z7.h, p5, z7.h, z31.h
	splice	z17.h, p5, z17.h, z22.h
	zip1	z31.h, z15.h, z30.h
	zip1	z14.h, z7.h, z2.h
	zip1	z5.h, z17.h, z10.h
	sqrshrnb	z18.h, z18.s, #12
	zip1	z22.h, z23.h, z5.h
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z1.h, z1.s, #12
	splice	z18.h, p5, z18.h, z13.h
	uzp1	z1.h, z1.h, z1.h
	zip1	z28.h, z29.h, z18.h
	splice	z1.h, p5, z1.h, z9.h
	zip1	z25.h, z28.h, z21.h
	zip1	z26.h, z19.h, z1.h
	zip1	z9.h, z25.h, z22.h
	zip1	z11.h, z26.h, z14.h
	zip1	z13.h, z6.h, z0.h
	zip1	z27.h, z31.h, z13.h
	zip1	z24.h, z27.h, z11.h
	zip1	z8.h, z24.h, z9.h
	st1h	z8.h, p6, [x1]
	zip2	z12.h, z24.h, z9.h
	st1h	z12.h, p6, [x1, x2, lsl 1]
	zip2	z27.h, z27.h, z11.h
	add	x1, x1, x2, lsl 2
	zip2	z11.h, z25.h, z22.h
	zip1	z24.h, z27.h, z11.h
	st1h	z24.h, p6, [x1]
	zip2	z25.h, z27.h, z11.h
	add	x4, x1, x2, lsl 2
	st1h	z25.h, p6, [x1, x2, lsl 1]
	zip2	z13.h, z31.h, z13.h
	zip2	z31.h, z26.h, z14.h
	zip2	z14.h, z23.h, z5.h
	zip2	z26.h, z28.h, z21.h
	zip1	z28.h, z13.h, z31.h
	zip1	z21.h, z26.h, z14.h
	zip1	z23.h, z28.h, z21.h
	st1h	z23.h, p6, [x4]
	zip2	z5.h, z28.h, z21.h
	st1h	z5.h, p6, [x4, x2, lsl 1]
	zip2	z22.h, z13.h, z31.h
	zip2	z9.h, z26.h, z14.h
	add	x14, x4, x2, lsl 2
	zip1	z8.h, z22.h, z9.h
	st1h	z8.h, p6, [x14]
	zip2	z12.h, z22.h, z9.h
	add	x13, x14, x2, lsl 2
	st1h	z12.h, p6, [x14, x2, lsl 1]
	zip2	z6.h, z6.h, z0.h
	zip2	z19.h, z19.h, z1.h
	zip2	z7.h, z7.h, z2.h
	zip2	z29.h, z29.h, z18.h
	zip2	z16.h, z16.h, z3.h
	zip2	z20.h, z20.h, z4.h
	zip2	z17.h, z17.h, z10.h
	zip2	z15.h, z15.h, z30.h
	zip1	z18.h, z19.h, z7.h
	zip1	z30.h, z15.h, z6.h
	zip1	z1.h, z29.h, z16.h
	zip1	z4.h, z30.h, z18.h
	zip1	z0.h, z20.h, z17.h
	zip1	z3.h, z1.h, z0.h
	zip1	z2.h, z4.h, z3.h
	st1h	z2.h, p6, [x13]
	zip2	z10.h, z4.h, z3.h
	st1h	z10.h, p6, [x13, x2, lsl 1]
	add	x12, x13, x2, lsl 2
	zip2	z11.h, z30.h, z18.h
	zip2	z24.h, z1.h, z0.h
	zip1	z27.h, z11.h, z24.h
	st1h	z27.h, p6, [x12]
	zip2	z25.h, z11.h, z24.h
	st1h	z25.h, p6, [x12, x2, lsl 1]
	zip2	z13.h, z15.h, z6.h
	add	x11, x12, x2, lsl 2
	zip2	z14.h, z29.h, z16.h
	zip2	z26.h, z19.h, z7.h
	zip2	z21.h, z20.h, z17.h
	zip1	z31.h, z13.h, z26.h
	zip1	z28.h, z14.h, z21.h
	zip1	z23.h, z31.h, z28.h
	st1h	z23.h, p6, [x11]
	zip2	z5.h, z31.h, z28.h
	st1h	z5.h, p6, [x11, x2, lsl 1]
	zip2	z9.h, z14.h, z21.h
	zip2	z22.h, z13.h, z26.h
	add	x17, x11, x2, lsl 2
	zip1	z8.h, z22.h, z9.h
	st1h	z8.h, p6, [x17]
	zip2	z12.h, z22.h, z9.h
	st1h	z12.h, p6, [x17, x2, lsl 1]
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
	addvl	sp, sp, #14
	.cfi_def_cfa_offset 576
	add	sp, sp, 576
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	dynopt_idct16_sve2_shared, .-dynopt_idct16_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL6CDOT_O, %object
	.size	_ZL6CDOT_O, 1024
_ZL6CDOT_O:
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.type	_ZL7CDOT_EO, %object
	.size	_ZL7CDOT_EO, 256
_ZL7CDOT_EO:
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.type	_ZL8CDOT_EEE, %object
	.size	_ZL8CDOT_EEE, 64
_ZL8CDOT_EEE:
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
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.type	_ZL8CDOT_EEO, %object
	.size	_ZL8CDOT_EEO, 64
_ZL8CDOT_EEO:
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
