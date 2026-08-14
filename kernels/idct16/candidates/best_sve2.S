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
	addvl	sp, sp, #-16
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x80,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.h, all
	sub	sp, sp, #576
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x80,0x1e,0x23,0xc0,0x4,0x22
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
	ldp	q22, q23, [x0, 32]
	ldp	q31, q1, [x0, 96]
	zip1	z0.h, z22.h, z31.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z2.h
// 0 "" 2
#NO_APP
	add	x10, x3, 128
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	add	x9, x3, 256
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z4.h
// 0 "" 2
#NO_APP
	add	x8, x3, 384
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z5.h
// 0 "" 2
#NO_APP
	add	x7, x3, 512
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z6.h
// 0 "" 2
#NO_APP
	add	x6, x3, 640
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z31.s, z0.h, z30.h
// 0 "" 2
#NO_APP
	add	x5, x3, 768
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z29.h
// 0 "" 2
#NO_APP
	add	x4, x3, 896
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z21.h
// 0 "" 2
#NO_APP
	ldp	q7, q18, [x0, 160]
	ldp	q8, q0, [x0, 224]
	zip1	z9.h, z7.h, z8.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z13.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	ldp	q2, q20, [x0, 352]
	addvl	x11, sp, #9
	add	x11, x11, 64
	ldp	q22, q19, [x0, 288]
	zip1	z3.h, z22.h, z2.h
	str	q20, [x11]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z21.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z7.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z31.s, z3.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z9.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z10.h
// 0 "" 2
#NO_APP
	ldp	q11, q2, [x0, 416]
	ldp	q12, q20, [x0, 480]
	zip1	z13.h, z11.h, z12.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z17.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z22.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z31.s, z13.h, z3.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z5.h
// 0 "" 2
#NO_APP
	ldp	q21, q7, [x0, 192]
	addvl	x12, sp, #10
	add	x12, x12, 64
	add	x14, x3, 1024
	ldp	q6, q12, [x0, 64]
	zip1	z8.h, z6.h, z21.h
	str	q7, [x12]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z9.h
// 0 "" 2
#NO_APP
	add	x13, x3, 1088
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z10.h
// 0 "" 2
#NO_APP
	add	x12, x3, 1152
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	add	x11, x3, 1216
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z14.s, z8.h, z13.h
// 0 "" 2
#NO_APP
	ldp	q22, q3, [x0, 320]
	addvl	x15, sp, #11
	add	x15, x15, 64
	str	q3, [x15]
	ldp	q4, q13, [x0, 448]
	zip1	z5.h, z22.h, z4.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z21.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z7.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z14.s, z5.h, z8.h
// 0 "" 2
#NO_APP
	ldp	q9, q10, [x0]
	addvl	x16, sp, #12
	addvl	x18, sp, #13
	add	x16, x16, 64
	add	x18, x18, 64
	add	x17, x3, 1280
	str	q10, [x16]
	ldp	q11, q22, [x0, 256]
	zip1	z3.h, z9.h, z11.h
	str	q22, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1312
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z6.h
// 0 "" 2
#NO_APP
	ldp	q7, q8, [x0, 128]
	addvl	x18, sp, #14
	add	x18, x18, 64
	add	x15, x3, 1344
	str	q8, [x18]
	ldp	q9, q10, [x0, 384]
	zip1	z11.h, z7.h, z9.h
	addvl	x0, sp, #15
	add	x0, x0, 64
	str	q10, [x0]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z11.h, z22.h
// 0 "" 2
#NO_APP
	add	x0, x3, 1376
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z4.h
// 0 "" 2
#NO_APP
	add	z10.s, z21.s, z6.s
	add	x18, sp, 64
	sub	z11.s, z21.s, z6.s
	add	z4.s, z10.s, z16.s
	sub	z21.s, z5.s, z3.s
	sub	z6.s, z10.s, z16.s
	add	z9.s, z5.s, z3.s
	sub	z10.s, z9.s, z17.s
	add	z5.s, z9.s, z17.s
	add	z17.s, z5.s, z24.s
	sub	z3.s, z5.s, z24.s
	add	z24.s, z4.s, z25.s
	str	z24, [x18]
	addvl	x18, sp, #8
	sub	z25.s, z4.s, z25.s
	add	x18, x18, 64
	str	z25, [x18]
	add	z7.s, z11.s, z15.s
	addvl	x18, sp, #1
	add	z16.s, z7.s, z26.s
	add	z8.s, z21.s, z14.s
	add	x18, x18, 64
	str	z16, [x18]
	sub	z9.s, z7.s, z26.s
	addvl	x18, sp, #2
	add	z26.s, z8.s, z27.s
	sub	z14.s, z21.s, z14.s
	add	x18, x18, 64
	str	z26, [x18]
	sub	z7.s, z8.s, z27.s
	addvl	x18, sp, #7
	sub	z27.s, z14.s, z28.s
	zip1	z1.h, z23.h, z1.h
	add	x18, x18, 64
	str	z27, [x18]
	add	z23.s, z6.s, z30.s
	addvl	x18, sp, #3
	sub	z22.s, z11.s, z15.s
	add	z15.s, z14.s, z28.s
	add	x18, x18, 64
	str	z23, [x18]
	add	z28.s, z10.s, z29.s
	addvl	x18, sp, #4
	sub	z29.s, z10.s, z29.s
	add	z16.s, z22.s, z31.s
	add	x18, x18, 64
	str	z28, [x18]
	sub	z31.s, z22.s, z31.s
	addvl	x18, sp, #5
	sub	z30.s, z6.s, z30.s
	add	x18, x18, 64
	str	z29, [x18]
	addvl	x18, sp, #6
	add	x18, x18, 64
	str	z31, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z28.h
// 0 "" 2
#NO_APP
	zip1	z18.h, z18.h, z0.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z18.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z18.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z18.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z18.h, z31.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z18.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z18.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z18.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #9
	add	x18, x18, 64
	ldr	z6, [x18]
	zip1	z19.h, z19.h, z6.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z19.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z19.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z19.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z19.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z19.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z19.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z19.h, z31.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	zip1	z2.h, z2.h, z20.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z20.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z2.h, z5.h
// 0 "" 2
#NO_APP
	str	z4, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z6.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z19.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #10
	add	x18, x18, 64
	ldr	z18, [x18]
	zip1	z12.h, z12.h, z18.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z12.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z12.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z6.s, z12.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #11
	add	x18, x18, 64
	ldr	z11, [x18]
	zip1	z13.h, z11.h, z13.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z13.h, z2.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z5.s, z13.h, z20.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z6.s, z13.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #12
	add	x18, x18, 64
	ldr	z19, [x18]
	addvl	x18, sp, #13
	add	x18, x18, 64
	ldr	z10, [x18]
	zip1	z18.h, z19.h, z10.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z28.s, z18.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #14
	add	x18, x18, 64
	ldr	z31, [x18]
	addvl	x18, sp, #15
	add	x18, x18, 64
	ldr	z11, [x18]
	zip1	z13.h, z31.h, z11.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z14.s, z13.h, z2.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	add	x18, sp, 64
	ldr	z8, [x18]
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z10.h, z17.h, z17.h
	str	z10, [x18]
	addvl	x18, sp, #1
	add	x18, x18, 64
	ldr	z18, [x18]
	sqrshrnb	z12.h, z18.s, #7
	addvl	x18, sp, #2
	uzp1	z10.h, z12.h, z12.h
	sqrshrnb	z19.h, z8.s, #7
	add	x18, x18, 64
	ldr	z31, [x18]
	sqrshrnb	z13.h, z31.s, #7
	addvl	x18, sp, #3
	uzp1	z8.h, z13.h, z13.h
	uzp1	z11.h, z19.h, z19.h
	add	x18, x18, 64
	ldr	z2, [x18]
	sqrshrnb	z20.h, z2.s, #7
	addvl	x18, sp, #4
	ptrue	p5.h, vl8
	sqrshrnb	z3.h, z3.s, #7
	add	x18, x18, 64
	ldr	z17, [x18]
	sqrshrnb	z19.h, z17.s, #7
	addvl	x18, sp, #5
	uzp1	z17.h, z20.h, z20.h
	uzp1	z18.h, z19.h, z19.h
	add	x18, x18, 64
	ldr	z12, [x18]
	sqrshrnb	z31.h, z12.s, #7
	addvl	x18, sp, #6
	uzp1	z3.h, z3.h, z3.h
	sqrshrnb	z7.h, z7.s, #7
	add	x18, x18, 64
	ldr	z13, [x18]
	sqrshrnb	z2.h, z13.s, #7
	addvl	x18, sp, #7
	uzp1	z19.h, z2.h, z2.h
	sqrshrnb	z9.h, z9.s, #7
	add	x18, x18, 64
	ldr	z20, [x18]
	sqrshrnb	z12.h, z20.s, #7
	addvl	x18, sp, #8
	uzp1	z20.h, z12.h, z12.h
	uzp1	z7.h, z7.h, z7.h
	add	x18, x18, 64
	ldr	z13, [x18]
	sqrshrnb	z2.h, z13.s, #7
	add	z13.s, z28.s, z14.s
	sub	z28.s, z28.s, z14.s
	add	x18, sp, 64
	add	z14.s, z29.s, z1.s
	uzp1	z12.h, z2.h, z2.h
	sub	z29.s, z29.s, z1.s
	add	z2.s, z13.s, z4.s
	sub	z13.s, z13.s, z4.s
	add	z1.s, z2.s, z21.s
	add	z4.s, z14.s, z5.s
	sub	z14.s, z14.s, z5.s
	add	z5.s, z29.s, z6.s
	sub	z29.s, z29.s, z6.s
	add	z6.s, z28.s, z0.s
	sub	z0.s, z28.s, z0.s
	sqrshrnb	z28.h, z1.s, #7
	sub	z21.s, z2.s, z21.s
	ldr	z2, [x18]
	uzp1	z1.h, z28.h, z28.h
	addvl	x18, sp, #9
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z28.h, z21.h, z21.h
	splice	z2.h, p5, z2.h, z1.h
	splice	z3.h, p5, z3.h, z28.h
	add	x18, x18, 64
	ldr	z1, [x18]
	add	z21.s, z4.s, z1.s
	sub	z4.s, z4.s, z1.s
	sqrshrnb	z28.h, z21.s, #7
	sqrshrnb	z1.h, z4.s, #7
	uzp1	z21.h, z28.h, z28.h
	uzp1	z4.h, z1.h, z1.h
	add	z28.s, z5.s, z22.s
	splice	z11.h, p5, z11.h, z21.h
	splice	z12.h, p5, z12.h, z4.h
	sub	z5.s, z5.s, z22.s
	sqrshrnb	z22.h, z28.s, #7
	sqrshrnb	z1.h, z5.s, #7
	uzp1	z21.h, z22.h, z22.h
	uzp1	z4.h, z1.h, z1.h
	add	z28.s, z6.s, z23.s
	sub	z6.s, z6.s, z23.s
	splice	z10.h, p5, z10.h, z21.h
	sqrshrnb	z23.h, z28.s, #7
	sqrshrnb	z5.h, z6.s, #7
	uzp1	z22.h, z23.h, z23.h
	uzp1	z1.h, z5.h, z5.h
	add	z21.s, z0.s, z24.s
	splice	z7.h, p5, z7.h, z1.h
	sub	z0.s, z0.s, z24.s
	uzp1	z9.h, z9.h, z9.h
	splice	z9.h, p5, z9.h, z4.h
	sqrshrnb	z4.h, z0.s, #7
	uzp1	z6.h, z4.h, z4.h
	splice	z20.h, p5, z20.h, z6.h
	splice	z8.h, p5, z8.h, z22.h
	sqrshrnb	z24.h, z21.s, #7
	addvl	x18, sp, #16
	uzp1	z28.h, z24.h, z24.h
	sqrshrnb	z15.h, z15.s, #7
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z15.h, z15.h, z15.h
	uzp1	z16.h, z16.h, z16.h
	splice	z15.h, p5, z15.h, z28.h
	zip1	z5.h, z15.h, z7.h
	zip2	z15.h, z15.h, z7.h
	zip1	z7.h, z8.h, z20.h
	zip2	z8.h, z8.h, z20.h
	add	z20.s, z29.s, z25.s
	sub	z29.s, z29.s, z25.s
	sqrshrnb	z25.h, z20.s, #7
	sqrshrnb	z23.h, z29.s, #7
	uzp1	z22.h, z25.h, z25.h
	uzp1	z1.h, z23.h, z23.h
	splice	z16.h, p5, z16.h, z22.h
	zip1	z21.h, z16.h, z9.h
	zip2	z16.h, z16.h, z9.h
	add	z9.s, z13.s, z26.s
	sub	z26.s, z13.s, z26.s
	sqrshrnb	z13.h, z9.s, #7
	splice	z19.h, p5, z19.h, z1.h
	uzp1	z4.h, z13.h, z13.h
	zip1	z0.h, z10.h, z19.h
	sqrshrnb	z28.h, z26.s, #7
	zip2	z19.h, z10.h, z19.h
	uzp1	z6.h, z28.h, z28.h
	add	z10.s, z14.s, z27.s
	add	x18, x18, 64
	sub	z14.s, z14.s, z27.s
	sqrshrnb	z30.h, z30.s, #7
	sqrshrnb	z20.h, z14.s, #7
	uzp1	z30.h, z30.h, z30.h
	uzp1	z29.h, z20.h, z20.h
	splice	z30.h, p5, z30.h, z29.h
	zip1	z1.h, z11.h, z30.h
	zip1	z13.h, z1.h, z21.h
	ptrue	p6.b, all
	zip2	z26.h, z1.h, z21.h
	splice	z18.h, p5, z18.h, z4.h
	zip2	z30.h, z11.h, z30.h
	zip1	z22.h, z18.h, z3.h
	sqrshrnb	z27.h, z10.s, #7
	zip1	z21.h, z7.h, z22.h
	zip2	z18.h, z18.h, z3.h
	zip1	z11.h, z13.h, z21.h
	uzp1	z24.h, z27.h, z27.h
	uzp1	z31.h, z31.h, z31.h
	splice	z17.h, p5, z17.h, z24.h
	splice	z31.h, p5, z31.h, z6.h
	zip1	z23.h, z17.h, z12.h
	zip1	z25.h, z2.h, z31.h
	zip1	z14.h, z0.h, z23.h
	zip1	z9.h, z25.h, z5.h
	zip2	z6.h, z13.h, z21.h
	zip1	z4.h, z9.h, z14.h
	zip2	z2.h, z2.h, z31.h
	zip1	z3.h, z2.h, z15.h
	zip2	z13.h, z2.h, z15.h
	zip1	z15.h, z4.h, z11.h
	st1h	z15.h, p6, [x18]
	addvl	x18, sp, #16
	zip2	z5.h, z25.h, z5.h
	zip1	z31.h, z30.h, z16.h
	add	x18, x18, 96
	zip2	z0.h, z0.h, z23.h
	zip2	z20.h, z5.h, z0.h
	zip1	z28.h, z5.h, z0.h
	zip2	z5.h, z30.h, z16.h
	zip2	z16.h, z4.h, z11.h
	st1h	z16.h, p6, [x18]
	addvl	x18, sp, #16
	zip2	z24.h, z9.h, z14.h
	add	x18, x18, 128
	zip1	z23.h, z24.h, z6.h
	st1h	z23.h, p6, [x18]
	addvl	x18, sp, #16
	zip2	z14.h, z24.h, z6.h
	zip2	z7.h, z7.h, z22.h
	add	x18, x18, 160
	st1h	z14.h, p6, [x18]
	zip2	z17.h, z17.h, z12.h
	addvl	x18, sp, #16
	zip1	z12.h, z26.h, z7.h
	zip2	z25.h, z26.h, z7.h
	add	x18, x18, 192
	zip1	z26.h, z28.h, z12.h
	st1h	z26.h, p6, [x18]
	addvl	x18, sp, #16
	zip2	z0.h, z28.h, z12.h
	zip1	z21.h, z20.h, z25.h
	add	x18, x18, 224
	st1h	z0.h, p6, [x18]
	zip2	z7.h, z20.h, z25.h
	addvl	x18, sp, #16
	zip1	z10.h, z19.h, z17.h
	zip1	z29.h, z8.h, z18.h
	add	x18, x18, 256
	st1h	z21.h, p6, [x18]
	zip1	z1.h, z3.h, z10.h
	addvl	x18, sp, #16
	zip1	z22.h, z31.h, z29.h
	zip1	z2.h, z1.h, z22.h
	add	x18, x18, 288
	st1h	z7.h, p6, [x18]
	zip2	z30.h, z1.h, z22.h
	addvl	x18, sp, #16
	zip2	z9.h, z31.h, z29.h
	zip2	z27.h, z3.h, z10.h
	add	x18, x18, 320
	st1h	z2.h, p6, [x18]
	zip1	z3.h, z27.h, z9.h
	addvl	x18, sp, #16
	zip2	z10.h, z27.h, z9.h
	zip2	z19.h, z19.h, z17.h
	add	x18, x18, 352
	st1h	z30.h, p6, [x18]
	zip2	z8.h, z8.h, z18.h
	addvl	x18, sp, #16
	zip1	z17.h, z13.h, z19.h
	zip1	z18.h, z5.h, z8.h
	add	x18, x18, 384
	st1h	z3.h, p6, [x18]
	zip1	z4.h, z17.h, z18.h
	addvl	x18, sp, #16
	zip2	z11.h, z17.h, z18.h
	zip2	z31.h, z13.h, z19.h
	add	x18, x18, 96
	zip2	z24.h, z5.h, z8.h
	zip1	z6.h, z31.h, z24.h
	zip2	z28.h, z31.h, z24.h
	ldr	q12, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 160
	ldr	q20, [x18]
	zip1	z1.h, z12.h, z20.h
	addvl	x18, sp, #16
	add	x18, x18, 416
	st1h	z10.h, p6, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 448
	st1h	z4.h, p6, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 480
	st1h	z11.h, p6, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 512
	st1h	z6.h, p6, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 544
	st1h	z28.h, p6, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z1.h, z9.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z15.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z16.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 224
	ldr	q21, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 288
	ldr	q2, [x18]
	zip1	z19.h, z21.h, z2.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z19.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z19.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z19.h, z17.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z19.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z19.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z19.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z19.h, z31.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 352
	ldr	q6, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 416
	ldr	q28, [x18]
	zip1	z12.h, z6.h, z28.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z12.h, z20.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z1.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z29.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z12.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z12.h, z9.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 480
	ldr	q16, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 544
	ldr	q14, [x18]
	zip1	z21.h, z16.h, z14.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z21.h, z2.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z21.h, z19.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z21.h, z30.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z0.s, z21.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z7.s, z21.h, z17.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z3.s, z21.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z21.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 128
	ldr	q31, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 256
	ldr	q24, [x18]
	zip1	z6.h, z31.h, z24.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z28.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z6.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z20.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 384
	ldr	q29, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 512
	ldr	q27, [x18]
	zip1	z9.h, z29.h, z27.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z5.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z1.s, z9.h, z14.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z21.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 64
	ldr	q19, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 320
	ldr	q30, [x18]
	zip1	z8.h, z19.h, z30.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z8.h, z18.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 192
	ldr	q6, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 448
	ldr	q31, [x18]
	zip1	z28.h, z6.h, z31.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z20.s, z28.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z29.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #1
	add	z14.s, z24.s, z29.s
	add	z27.s, z4.s, z20.s
	add	x18, x18, 64
	sub	z21.s, z4.s, z20.s
	add	z19.s, z27.s, z15.s
	sub	z4.s, z14.s, z1.s
	add	z8.s, z14.s, z1.s
	add	z14.s, z19.s, z13.s
	sub	z13.s, z19.s, z13.s
	str	z13, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 112
	sub	z9.s, z24.s, z29.s
	sub	z11.s, z27.s, z15.s
	add	z5.s, z9.s, z17.s
	add	z15.s, z8.s, z22.s
	sub	z1.s, z8.s, z22.s
	add	z22.s, z5.s, z23.s
	sub	z5.s, z5.s, z23.s
	add	z2.s, z21.s, z16.s
	ldr	q23, [x18]
	sub	z16.s, z21.s, z16.s
	sub	z18.s, z9.s, z17.s
	addvl	x18, sp, #16
	add	z17.s, z2.s, z0.s
	add	z6.s, z16.s, z7.s
	add	x18, x18, 176
	sub	z30.s, z16.s, z7.s
	sub	z2.s, z2.s, z0.s
	add	z29.s, z18.s, z3.s
	sub	z9.s, z18.s, z3.s
	add	z7.s, z4.s, z26.s
	add	z16.s, z11.s, z10.s
	sub	z31.s, z11.s, z10.s
	sub	z28.s, z4.s, z26.s
	ldr	q0, [x18]
	zip1	z3.h, z23.h, z0.h
	add	x18, sp, 64
	str	z22, [x18]
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z24.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z25.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 240
	ldr	q11, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 304
	ldr	q13, [x18]
	zip1	z0.h, z11.h, z13.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z3.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 368
	ldr	q13, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 432
	ldr	q0, [x18]
	zip1	z3.h, z13.h, z0.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z10.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #16
	add	x18, x18, 496
	ldr	q0, [x18]
	addvl	x18, sp, #16
	add	x18, x18, 560
	ldr	q3, [x18]
	zip1	z10.h, z0.h, z3.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z18.s, z10.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z12.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z27.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z11.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z13.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	addvl	x10, sp, #16
	add	x3, x3, 144
	add	x10, x10, 272
	ldr	q3, [x3]
	ldr	q10, [x10]
	zip1	z27.h, z3.h, z10.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z11.s, z27.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z12.s, z27.h, z8.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z27.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z8.s, z27.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #16
	addvl	x8, sp, #16
	add	x9, x9, 400
	add	x8, x8, 528
	ldr	q3, [x9]
	ldr	q10, [x8]
	zip1	z27.h, z3.h, z10.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z11.s, z27.h, z26.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z12.s, z27.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z13.s, z27.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z8.s, z27.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x7, sp, #16
	addvl	x6, sp, #16
	add	x7, x7, 80
	add	x6, x6, 336
	ldr	q10, [x7]
	ldr	q27, [x6]
	zip1	z0.h, z10.h, z27.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z4.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #16
	addvl	x4, sp, #16
	add	x5, x5, 208
	add	x4, x4, 464
	ldr	q0, [x5]
	ldr	q10, [x4]
	zip1	z3.h, z0.h, z10.h
#APP
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z0.h
// 0 "" 2
// 106 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	addvl	x14, sp, #2
	add	x14, x14, 64
	str	z10, [x14]
	ldr	z0, [x14]
	movi	d10, #0
#APP
// 97 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct16/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z0.h
// 0 "" 2
#NO_APP
	add	x13, sp, 64
	ldr	z3, [x13]
	addvl	x12, sp, #1
	sqrshrnb	z0.h, z3.s, #12
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z3.h, z9.h, z9.h
	add	x12, x12, 64
	ldr	z9, [x12]
	str	z3, [x13]
	sqrshrnb	z3.h, z9.s, #12
	uzp1	z9.h, z3.h, z3.h
	sqrshrnb	z14.h, z14.s, #12
	add	z3.s, z26.s, z4.s
	sub	z26.s, z26.s, z4.s
	add	z4.s, z27.s, z10.s
	sub	z27.s, z27.s, z10.s
	add	z10.s, z3.s, z11.s
	sub	z3.s, z3.s, z11.s
	add	z11.s, z4.s, z12.s
	sub	z4.s, z4.s, z12.s
	add	z12.s, z27.s, z13.s
	sub	z27.s, z27.s, z13.s
	add	z13.s, z26.s, z8.s
	sub	z26.s, z26.s, z8.s
	add	z8.s, z10.s, z18.s
	sub	z18.s, z10.s, z18.s
	sqrshrnb	z8.h, z8.s, #12
	sqrshrnb	z10.h, z18.s, #12
	uzp1	z18.h, z8.h, z8.h
	uzp1	z8.h, z10.h, z10.h
	add	z10.s, z11.s, z19.s
	uzp1	z14.h, z14.h, z14.h
	sub	z11.s, z11.s, z19.s
	splice	z14.h, p5, z14.h, z18.h
	sqrshrnb	z19.h, z10.s, #12
	sqrshrnb	z18.h, z11.s, #12
	uzp1	z10.h, z18.h, z18.h
	splice	z9.h, p5, z9.h, z8.h
	add	z11.s, z12.s, z20.s
	uzp1	z8.h, z19.h, z19.h
	sub	z12.s, z12.s, z20.s
	sqrshrnb	z1.h, z1.s, #12
	sqrshrnb	z20.h, z11.s, #12
	sqrshrnb	z19.h, z12.s, #12
	uzp1	z18.h, z20.h, z20.h
	uzp1	z1.h, z1.h, z1.h
	splice	z1.h, p5, z1.h, z10.h
	add	z10.s, z13.s, z21.s
	sub	z13.s, z13.s, z21.s
	sqrshrnb	z21.h, z10.s, #12
	sqrshrnb	z11.h, z13.s, #12
	uzp1	z12.h, z21.h, z21.h
	uzp1	z20.h, z11.h, z11.h
	add	z21.s, z27.s, z23.s
	sqrshrnb	z15.h, z15.s, #12
	sub	z27.s, z27.s, z23.s
	uzp1	z15.h, z15.h, z15.h
	add	z23.s, z4.s, z24.s
	splice	z15.h, p5, z15.h, z8.h
	sub	z4.s, z4.s, z24.s
	uzp1	z8.h, z19.h, z19.h
	sqrshrnb	z24.h, z21.s, #12
	add	z19.s, z26.s, z22.s
	uzp1	z0.h, z0.h, z0.h
	sub	z26.s, z26.s, z22.s
	splice	z0.h, p5, z0.h, z18.h
	sqrshrnb	z30.h, z30.s, #12
	sqrshrnb	z18.h, z26.s, #12
	uzp1	z30.h, z30.h, z30.h
	uzp1	z10.h, z18.h, z18.h
	sqrshrnb	z2.h, z2.s, #12
	splice	z30.h, p5, z30.h, z10.h
	uzp1	z2.h, z2.h, z2.h
	splice	z2.h, p5, z2.h, z20.h
	sqrshrnb	z22.h, z19.s, #12
	uzp1	z11.h, z24.h, z24.h
	sqrshrnb	z18.h, z4.s, #12
	sqrshrnb	z27.h, z27.s, #12
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z24.h, z27.h, z27.h
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z6.h, z6.s, #12
	splice	z17.h, p5, z17.h, z12.h
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	splice	z5.h, p5, z5.h, z8.h
	uzp1	z8.h, z22.h, z22.h
	splice	z6.h, p5, z6.h, z8.h
	zip1	z13.h, z6.h, z2.h
	zip2	z6.h, z6.h, z2.h
	zip1	z2.h, z17.h, z30.h
	zip2	z17.h, z17.h, z30.h
	add	z30.s, z3.s, z25.s
	sub	z3.s, z3.s, z25.s
	sqrshrnb	z20.h, z30.s, #12
	sqrshrnb	z25.h, z23.s, #12
	uzp1	z12.h, z25.h, z25.h
	add	x16, sp, 64
	ldr	z30, [x16]
	uzp1	z19.h, z20.h, z20.h
	splice	z30.h, p5, z30.h, z24.h
	sqrshrnb	z26.h, z3.s, #12
	uzp1	z8.h, z18.h, z18.h
	uzp1	z22.h, z26.h, z26.h
	sqrshrnb	z29.h, z29.s, #12
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z29.h, z29.h, z29.h
	sqrshrnb	z16.h, z16.s, #12
	splice	z29.h, p5, z29.h, z11.h
	uzp1	z7.h, z7.h, z7.h
	zip1	z21.h, z29.h, z5.h
	splice	z7.h, p5, z7.h, z12.h
	uzp1	z16.h, z16.h, z16.h
	zip1	z4.h, z7.h, z1.h
	splice	z16.h, p5, z16.h, z19.h
	sqrshrnb	z31.h, z31.s, #12
	zip1	z3.h, z16.h, z9.h
	sqrshrnb	z28.h, z28.s, #12
	zip1	z12.h, z2.h, z3.h
	zip2	z16.h, z16.h, z9.h
	uzp1	z31.h, z31.h, z31.h
	uzp1	z28.h, z28.h, z28.h
	splice	z31.h, p5, z31.h, z22.h
	splice	z28.h, p5, z28.h, z8.h
	zip1	z10.h, z14.h, z31.h
	zip1	z23.h, z15.h, z28.h
	zip1	z25.h, z10.h, z13.h
	zip2	z20.h, z10.h, z13.h
	zip2	z31.h, z14.h, z31.h
	zip1	z13.h, z23.h, z21.h
	zip1	z14.h, z0.h, z30.h
	zip1	z11.h, z13.h, z12.h
	zip1	z18.h, z14.h, z4.h
	zip1	z9.h, z25.h, z18.h
	zip1	z24.h, z9.h, z11.h
	st1h	z24.h, p6, [x1]
	zip2	z29.h, z29.h, z5.h
	zip1	z5.h, z31.h, z6.h
	zip2	z6.h, z31.h, z6.h
	zip2	z31.h, z9.h, z11.h
	st1h	z31.h, p6, [x1, x2, lsl 1]
	zip2	z10.h, z14.h, z4.h
	add	x11, x1, x2, lsl 2
	zip2	z19.h, z25.h, z18.h
	zip2	z4.h, z13.h, z12.h
	zip1	z13.h, z19.h, z4.h
	st1h	z13.h, p6, [x11]
	zip2	z8.h, z23.h, z21.h
	zip2	z18.h, z19.h, z4.h
	st1h	z18.h, p6, [x11, x2, lsl 1]
	zip2	z23.h, z15.h, z28.h
	add	x17, x11, x2, lsl 2
	zip2	z2.h, z2.h, z3.h
	zip1	z3.h, z20.h, z10.h
	zip1	z25.h, z8.h, z2.h
	zip2	z15.h, z8.h, z2.h
	zip1	z8.h, z3.h, z25.h
	st1h	z8.h, p6, [x17]
	zip2	z12.h, z3.h, z25.h
	st1h	z12.h, p6, [x17, x2, lsl 1]
	add	x15, x17, x2, lsl 2
	zip2	z28.h, z20.h, z10.h
	zip1	z10.h, z28.h, z15.h
	st1h	z10.h, p6, [x15]
	zip2	z2.h, z28.h, z15.h
	st1h	z2.h, p6, [x15, x2, lsl 1]
	zip1	z21.h, z17.h, z16.h
	zip2	z14.h, z23.h, z29.h
	add	x18, x15, x2, lsl 2
	zip2	z7.h, z7.h, z1.h
	zip2	z0.h, z0.h, z30.h
	zip1	z1.h, z23.h, z29.h
	zip1	z22.h, z0.h, z7.h
	zip1	z30.h, z1.h, z21.h
	zip1	z26.h, z5.h, z22.h
	zip1	z29.h, z26.h, z30.h
	st1h	z29.h, p6, [x18]
	zip2	z27.h, z5.h, z22.h
	zip2	z5.h, z26.h, z30.h
	st1h	z5.h, p6, [x18, x2, lsl 1]
	add	x3, x18, x2, lsl 2
	zip2	z20.h, z1.h, z21.h
	zip1	z23.h, z27.h, z20.h
	st1h	z23.h, p6, [x3]
	zip2	z1.h, z27.h, z20.h
	st1h	z1.h, p6, [x3, x2, lsl 1]
	add	x10, x3, x2, lsl 2
	zip2	z0.h, z0.h, z7.h
	zip2	z17.h, z17.h, z16.h
	zip1	z7.h, z6.h, z0.h
	zip1	z16.h, z14.h, z17.h
	zip1	z9.h, z7.h, z16.h
	st1h	z9.h, p6, [x10]
	zip2	z11.h, z7.h, z16.h
	st1h	z11.h, p6, [x10, x2, lsl 1]
	zip2	z4.h, z14.h, z17.h
	add	x0, x10, x2, lsl 2
	zip2	z19.h, z6.h, z0.h
	zip1	z3.h, z19.h, z4.h
	st1h	z3.h, p6, [x0]
	zip2	z25.h, z19.h, z4.h
	st1h	z25.h, p6, [x0, x2, lsl 1]
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
	addvl	sp, sp, #16
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
