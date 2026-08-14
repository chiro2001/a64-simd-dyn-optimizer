	.arch armv9.4-a+crc
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB5:
	.cfi_startproc
	addvl	sp, sp, #-3
	.cfi_escape 0xf,0x8,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x22
	adrp	x18, _ZL6CDOT_O
	ptrue	p7.h, all
	sub	sp, sp, #2256
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x48,0x1e,0x23,0xd0,0x11,0x22
	add	x18, x18, :lo12:_ZL6CDOT_O
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x1b,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x1c,0x3,0x8f,0xd8,0
	mov	x27, x1
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	.cfi_escape 0x10,0x48,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4d,0x3,0x8f,0x88,0x1
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x90,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x98,0x1
	ldr	q14, [x0, 64]
	ldr	q31, [x0, 192]
	zip1	z0.h, z14.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+256
	add	x17, x17, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+512
	add	x16, x16, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z2.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+768
	add	x15, x15, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+1024
	add	x14, x14, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+1280
	add	x13, x13, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+1536
	add	x12, x12, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1792
	add	x11, x11, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2048
	add	x10, x10, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2304
	add	x26, x9, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+2560
	add	x28, x8, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+2816
	add	x30, x7, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+3072
	add	x9, x6, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+3328
	add	x8, x5, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+3584
	add	x7, x4, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3840
	add	x6, x3, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z0.h, z14.h
// 0 "" 2
#NO_APP
	ldr	q0, [x0, 320]
	ldr	q2, [x0, 448]
	zip1	z3.h, z0.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z3.h, z5.h
// 0 "" 2
#NO_APP
	ldr	q3, [x0, 576]
	ldr	q6, [x0, 704]
	zip1	z7.h, z3.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z7.h, z9.h
// 0 "" 2
#NO_APP
	ldr	q7, [x0, 832]
	ldr	q10, [x0, 960]
	zip1	z11.h, z7.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z11.h, z12.h
// 0 "" 2
#NO_APP
	ldr	q11, [x0, 1088]
	ldr	q13, [x0, 1216]
	zip1	z14.h, z11.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z14.h, z2.h
// 0 "" 2
#NO_APP
	ldr	q14, [x0, 1344]
	ldr	q4, [x0, 1472]
	zip1	z5.h, z14.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z5.h, z6.h
// 0 "" 2
#NO_APP
	ldr	q5, [x0, 1600]
	ldr	q8, [x0, 1728]
	zip1	z9.h, z5.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z9.h, z10.h
// 0 "" 2
#NO_APP
	ldr	q9, [x0, 1856]
	ldr	q17, [x0, 1984]
	zip1	z12.h, z9.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	add	x1, sp, 208
	str	z29, [x1]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #1
	add	x19, x19, 208
	str	z15, [x19]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z16.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z12.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #2
	adrp	x21, .LANCHOR0
	ldr	q17, [x0, 384]
	add	x20, x20, 208
	str	z1, [x20]
	ldr	q1, [x0, 128]
	zip1	z2.h, z1.h, z17.h
	add	x5, x21, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z12.h
// 0 "" 2
#NO_APP
	add	x25, x5, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z11.h
// 0 "" 2
#NO_APP
	add	x24, x5, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x5, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	add	x22, x5, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x5, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	add	x3, x5, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	add	x1, x5, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z5.h
// 0 "" 2
#NO_APP
	ldr	q7, [x0, 640]
	ldr	q29, [x0, 896]
	zip1	z1.h, z7.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z7.h
// 0 "" 2
#NO_APP
	ldr	q29, [x0, 1152]
	ldr	q1, [x0, 1408]
	zip1	z17.h, z29.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z17.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z17.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z17.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1664]
	ldr	q17, [x0, 1920]
	zip1	z2.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z1.h
// 0 "" 2
#NO_APP
	ldr	q17, [x0, 256]
	add	x24, x5, 1024
	ldr	q2, [x0, 768]
	zip1	z3.h, z17.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x21, x5, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z6.h
// 0 "" 2
#NO_APP
	add	x20, x5, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z7.h
// 0 "" 2
#NO_APP
	add	x19, x5, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1280]
	ldr	q17, [x0, 1792]
	zip1	z2.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z1.h
// 0 "" 2
#NO_APP
	ldr	q17, [x0, 512]
	add	x23, x5, 1280
	ldr	q2, [x0, 1536]
	zip1	z29.h, z17.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z29.h, z3.h
// 0 "" 2
#NO_APP
	add	x22, x5, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0]
	add	x4, x5, 1344
	ldr	q17, [x0, 1024]
	zip1	z1.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	add	x5, x5, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	add	z1.s, z17.s, z2.s
	sub	z29.s, z16.s, z3.s
	sub	z17.s, z17.s, z2.s
	add	z2.s, z16.s, z3.s
	sub	z16.s, z29.s, z6.s
	add	z3.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z2.s, z5.s
	add	z5.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	sub	z29.s, z16.s, z13.s
	sub	z17.s, z17.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z17.s, z17.s, z12.s
	add	z12.s, z16.s, z13.s
	add	z13.s, z2.s, z14.s
	sub	z16.s, z7.s, z18.s
	sub	z2.s, z2.s, z14.s
	add	z14.s, z1.s, z15.s
	sub	z1.s, z1.s, z15.s
	add	z15.s, z7.s, z18.s
	sqrshrnb	z7.h, z16.s, #7
	sqrshrnb	z18.h, z15.s, #7
	uzp1	z16.h, z7.h, z7.h
	add	z15.s, z8.s, z19.s
	sub	z19.s, z8.s, z19.s
	sqrshrnb	z8.h, z15.s, #7
	ptrue	p5.h, vl8
	uzp1	z7.h, z8.h, z8.h
	sqrshrnb	z15.h, z19.s, #7
	uzp1	z8.h, z15.h, z15.h
	splice	z8.h, p5, z8.h, z16.h
	add	z16.s, z9.s, z20.s
	uzp1	z18.h, z18.h, z18.h
	sub	z9.s, z9.s, z20.s
	splice	z18.h, p5, z18.h, z7.h
	sqrshrnb	z20.h, z16.s, #7
	sqrshrnb	z19.h, z9.s, #7
	uzp1	z7.h, z20.h, z20.h
	uzp1	z15.h, z19.h, z19.h
	add	z16.s, z10.s, z21.s
	sub	z10.s, z10.s, z21.s
	sqrshrnb	z21.h, z16.s, #7
	sqrshrnb	z20.h, z10.s, #7
	uzp1	z9.h, z21.h, z21.h
	movprfx	z19, z7
	splice	z19.h, p5, z19.h, z9.h
	uzp1	z7.h, z20.h, z20.h
	uzp2	z10.h, z18.h, z19.h
	splice	z7.h, p5, z7.h, z15.h
	uzp1	z15.h, z18.h, z19.h
	add	z18.s, z11.s, z22.s
	sub	z11.s, z11.s, z22.s
	sqrshrnb	z22.h, z18.s, #7
	sqrshrnb	z21.h, z11.s, #7
	add	z19.s, z12.s, z23.s
	uzp1	z9.h, z21.h, z21.h
	sub	z12.s, z12.s, z23.s
	uzp1	z16.h, z22.h, z22.h
	sqrshrnb	z23.h, z19.s, #7
	sqrshrnb	z18.h, z12.s, #7
	uzp1	z20.h, z23.h, z23.h
	add	z22.s, z13.s, z24.s
	splice	z16.h, p5, z16.h, z20.h
	sub	z13.s, z13.s, z24.s
	add	z12.s, z14.s, z25.s
	sqrshrnb	z24.h, z22.s, #7
	sub	z14.s, z14.s, z25.s
	uzp1	z11.h, z18.h, z18.h
	sqrshrnb	z25.h, z12.s, #7
	splice	z11.h, p5, z11.h, z9.h
	uzp1	z23.h, z25.h, z25.h
	sqrshrnb	z9.h, z13.s, #7
	sqrshrnb	z20.h, z14.s, #7
	uzp1	z19.h, z9.h, z9.h
	uzp1	z21.h, z24.h, z24.h
	splice	z21.h, p5, z21.h, z23.h
	uzp1	z18.h, z16.h, z21.h
	uzp2	z21.h, z16.h, z21.h
	add	z16.s, z1.s, z26.s
	sub	z1.s, z1.s, z26.s
	sqrshrnb	z26.h, z16.s, #7
	sqrshrnb	z22.h, z1.s, #7
	uzp1	z24.h, z15.h, z18.h
	add	x3, sp, 208
	uzp2	z15.h, z15.h, z18.h
	add	z12.s, z2.s, z27.s
	addvl	x1, sp, #1
	sub	z2.s, z2.s, z27.s
	addvl	x24, sp, #2
	sqrshrnb	z27.h, z12.s, #7
	uzp1	z13.h, z20.h, z20.h
	uzp1	z14.h, z27.h, z27.h
	splice	z13.h, p5, z13.h, z19.h
	add	z20.s, z29.s, z28.s
	uzp1	z19.h, z22.h, z22.h
	sub	z29.s, z29.s, z28.s
	uzp1	z9.h, z26.h, z26.h
	ldr	z26, [x3]
	sqrshrnb	z28.h, z20.s, #7
	add	z22.s, z17.s, z26.s
	uzp1	z18.h, z28.h, z28.h
	sqrshrnb	z16.h, z29.s, #7
	uzp1	z1.h, z16.h, z16.h
	splice	z9.h, p5, z9.h, z14.h
	add	z28.s, z6.s, z30.s
	add	z16.s, z4.s, z0.s
	sqrshrnb	z25.h, z2.s, #7
	sub	z17.s, z17.s, z26.s
	add	x1, x1, 208
	sqrshrnb	z27.h, z17.s, #7
	add	x24, x24, 208
	ldr	z20, [x24]
	addvl	x21, sp, #3
	add	z29.s, z3.s, z20.s
	uzp1	z23.h, z25.h, z25.h
	sub	z3.s, z3.s, z20.s
	splice	z23.h, p5, z23.h, z19.h
	uzp1	z14.h, z27.h, z27.h
	sqrshrnb	z19.h, z22.s, #7
	splice	z14.h, p5, z14.h, z1.h
	uzp1	z12.h, z19.h, z19.h
	sqrshrnb	z1.h, z28.s, #7
	movprfx	z2, z18
	splice	z2.h, p5, z2.h, z12.h
	sub	z6.s, z6.s, z30.s
	ldr	z30, [x1]
	add	z18.s, z5.s, z30.s
	sqrshrnb	z22.h, z18.s, #7
	uzp1	z25.h, z9.h, z2.h
	sqrshrnb	z17.h, z16.s, #7
	uzp2	z9.h, z9.h, z2.h
	sqrshrnb	z19.h, z29.s, #7
	uzp1	z12.h, z22.h, z22.h
	uzp1	z27.h, z19.h, z19.h
	uzp1	z22.h, z14.h, z23.h
	sqrshrnb	z28.h, z3.s, #7
	add	x21, x21, 208
	uzp2	z3.h, z14.h, z23.h
	addvl	x20, sp, #3
	uzp1	z26.h, z1.h, z1.h
	uzp1	z2.h, z17.h, z17.h
	splice	z26.h, p5, z26.h, z12.h
	splice	z2.h, p5, z2.h, z27.h
	uzp1	z1.h, z26.h, z2.h
	uzp1	z16.h, z25.h, z1.h
	uzp1	z23.h, z24.h, z16.h
	str	z23, [x21]
	uzp2	z17.h, z26.h, z2.h
	add	x20, x20, 272
	uzp1	z26.h, z10.h, z21.h
	uzp1	z18.h, z9.h, z17.h
	addvl	x19, sp, #3
	uzp1	z14.h, z26.h, z18.h
	str	z14, [x20]
	uzp2	z12.h, z25.h, z1.h
	add	x19, x19, 336
	uzp1	z19.h, z15.h, z12.h
	addvl	x23, sp, #3
	str	z19, [x19]
	uzp2	z25.h, z9.h, z17.h
	uzp2	z10.h, z10.h, z21.h
	add	x23, x23, 400
	uzp1	z27.h, z10.h, z25.h
	addvl	x22, sp, #3
	str	z27, [x23]
	uzp2	z24.h, z24.h, z16.h
	add	x22, x22, 464
	addvl	x4, sp, #3
	str	z24, [x22]
	add	x4, x4, 528
	addvl	x5, sp, #3
	uzp1	z29.h, z28.h, z28.h
	uzp2	z28.h, z26.h, z18.h
	str	z28, [x4]
	uzp2	z15.h, z15.h, z12.h
	add	x5, x5, 592
	addvl	x3, sp, #3
	sub	z0.s, z4.s, z0.s
	sqrshrnb	z4.h, z0.s, #7
	str	z15, [x5]
	uzp1	z20.h, z13.h, z11.h
	add	x3, x3, 656
	addvl	x1, sp, #3
	sub	z5.s, z5.s, z30.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z30.h, z4.h, z4.h
	uzp2	z4.h, z10.h, z25.h
	str	z4, [x3]
	uzp1	z9.h, z7.h, z8.h
	splice	z29.h, p5, z29.h, z30.h
	ldr	q30, [x0, 208]
	uzp1	z0.h, z20.h, z9.h
	uzp2	z11.h, z13.h, z11.h
	uzp1	z21.h, z6.h, z6.h
	uzp2	z13.h, z20.h, z9.h
	add	x1, x1, 240
	ldr	q6, [x0, 80]
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z2.h, z5.h, z5.h
	addvl	x24, sp, #3
	splice	z2.h, p5, z2.h, z21.h
	uzp1	z17.h, z29.h, z2.h
	uzp1	z20.h, z17.h, z22.h
	uzp1	z26.h, z20.h, z0.h
	str	z26, [x1]
	uzp2	z29.h, z29.h, z2.h
	uzp2	z8.h, z7.h, z8.h
	uzp1	z16.h, z29.h, z3.h
	uzp1	z7.h, z11.h, z8.h
	add	x24, x24, 304
	addvl	x21, sp, #3
	uzp1	z18.h, z16.h, z7.h
	str	z18, [x24]
	uzp2	z22.h, z17.h, z22.h
	add	x21, x21, 368
	addvl	x20, sp, #3
	uzp1	z12.h, z22.h, z13.h
	str	z12, [x21]
	uzp2	z5.h, z11.h, z8.h
	uzp2	z10.h, z29.h, z3.h
	add	x20, x20, 432
	addvl	x19, sp, #3
	uzp1	z25.h, z10.h, z5.h
	str	z25, [x20]
	add	x19, x19, 496
	addvl	x23, sp, #3
	uzp2	z9.h, z20.h, z0.h
	str	z9, [x19]
	add	x23, x23, 560
	addvl	x22, sp, #3
	uzp2	z2.h, z16.h, z7.h
	str	z2, [x23]
	add	x22, x22, 624
	addvl	x4, sp, #3
	uzp2	z21.h, z22.h, z13.h
	str	z21, [x22]
	add	x4, x4, 688
	uzp2	z3.h, z10.h, z5.h
	zip1	z1.h, z6.h, z30.h
	str	z3, [x4]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z10.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 336]
	ldr	q9, [x0, 464]
	zip1	z2.h, z1.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z2.h, z9.h
// 0 "" 2
#NO_APP
	ldr	q2, [x0, 592]
	ldr	q3, [x0, 720]
	zip1	z0.h, z2.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z0.h, z14.h
// 0 "" 2
#NO_APP
	ldr	q0, [x0, 848]
	ldr	q15, [x0, 976]
	zip1	z4.h, z0.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z12.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z4.h, z12.h
// 0 "" 2
#NO_APP
	ldr	q4, [x0, 1104]
	ldr	q11, [x0, 1232]
	zip1	z8.h, z4.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z8.h, z7.h
// 0 "" 2
#NO_APP
	ldr	q8, [x0, 1360]
	ldr	q13, [x0, 1488]
	zip1	z6.h, z8.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z17.h
// 0 "" 2
#NO_APP
	ldr	q6, [x0, 1616]
	ldr	q10, [x0, 1744]
	zip1	z29.h, z6.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z29.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z29.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z29.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z29.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z29.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z29.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z29.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z29.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z29.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z29.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z29.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z29.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z29.h, z1.h
// 0 "" 2
#NO_APP
	ldr	q29, [x0, 1872]
	ldr	q9, [x0, 2000]
	zip1	z2.h, z29.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	add	x26, sp, 208
	str	z5, [x26]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x28, sp, #1
	add	x28, x28, 208
	str	z16, [x28]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z2.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #2
	adrp	x9, .LANCHOR0
	ldr	q9, [x0, 144]
	add	x30, x30, 208
	str	z31, [x30]
	ldr	q31, [x0, 400]
	zip1	z2.h, z9.h, z31.h
	add	x1, x9, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	mov	x24, x25
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	add	x23, x1, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	add	x22, x1, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z12.h
// 0 "" 2
#NO_APP
	add	x21, x1, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	add	x20, x1, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z7.h
// 0 "" 2
#NO_APP
	add	x19, x1, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z17.h
// 0 "" 2
#NO_APP
	add	x30, x1, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	ldr	q5, [x0, 656]
	ldr	q1, [x0, 912]
	zip1	z29.h, z5.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z29.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z29.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z29.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z29.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z29.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z29.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z29.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z29.h, z5.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1168]
	ldr	q29, [x0, 1424]
	zip1	z2.h, z1.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z1.h
// 0 "" 2
#NO_APP
	ldr	q29, [x0, 1680]
	ldr	q2, [x0, 1936]
	zip1	z3.h, z29.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q2, [x0, 272]
	add	x28, x1, 1024
	ldr	q3, [x0, 784]
	zip1	z17.h, z2.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	add	x8, x1, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	add	x26, x1, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	add	x25, x1, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q2, [x0, 1296]
	ldr	q3, [x0, 1808]
	zip1	z17.h, z2.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	str	x8, [sp, 168]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	ldr	q3, [x0, 528]
	add	x7, x1, 1280
	ldr	q17, [x0, 1552]
	zip1	z1.h, z3.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x6, x1, 1312
	stp	x7, x6, [sp, 176]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 16]
	add	x5, x1, 1344
	ldr	q17, [x0, 1040]
	zip1	z1.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x3, x1, 1376
	stp	x5, x3, [sp, 192]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	add	z1.s, z17.s, z2.s
	sub	z29.s, z16.s, z3.s
	sub	z17.s, z17.s, z2.s
	add	z2.s, z16.s, z3.s
	sub	z16.s, z29.s, z6.s
	add	z3.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z2.s, z5.s
	add	z5.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	sub	z29.s, z16.s, z13.s
	sub	z17.s, z17.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z17.s, z17.s, z12.s
	add	z12.s, z16.s, z13.s
	add	z13.s, z2.s, z14.s
	sub	z16.s, z7.s, z18.s
	sub	z2.s, z2.s, z14.s
	add	z14.s, z1.s, z15.s
	sub	z1.s, z1.s, z15.s
	add	z15.s, z7.s, z18.s
	sqrshrnb	z7.h, z16.s, #7
	sqrshrnb	z18.h, z15.s, #7
	uzp1	z16.h, z7.h, z7.h
	add	z15.s, z8.s, z19.s
	sub	z19.s, z8.s, z19.s
	sqrshrnb	z8.h, z15.s, #7
	sqrshrnb	z15.h, z19.s, #7
	uzp1	z7.h, z8.h, z8.h
	uzp1	z8.h, z15.h, z15.h
	splice	z8.h, p5, z8.h, z16.h
	add	z16.s, z9.s, z20.s
	sub	z9.s, z9.s, z20.s
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z20.h, z16.s, #7
	splice	z18.h, p5, z18.h, z7.h
	sqrshrnb	z19.h, z9.s, #7
	uzp1	z7.h, z20.h, z20.h
	uzp1	z15.h, z19.h, z19.h
	add	z16.s, z10.s, z21.s
	sub	z10.s, z10.s, z21.s
	sqrshrnb	z21.h, z16.s, #7
	uzp1	z9.h, z21.h, z21.h
	sqrshrnb	z20.h, z10.s, #7
	movprfx	z19, z7
	splice	z19.h, p5, z19.h, z9.h
	uzp1	z7.h, z20.h, z20.h
	uzp2	z10.h, z18.h, z19.h
	splice	z7.h, p5, z7.h, z15.h
	uzp1	z15.h, z18.h, z19.h
	add	z18.s, z11.s, z22.s
	sub	z11.s, z11.s, z22.s
	sqrshrnb	z22.h, z18.s, #7
	sqrshrnb	z21.h, z11.s, #7
	uzp1	z9.h, z21.h, z21.h
	add	z19.s, z12.s, z23.s
	uzp1	z16.h, z22.h, z22.h
	sub	z12.s, z12.s, z23.s
	add	z22.s, z13.s, z24.s
	sqrshrnb	z23.h, z19.s, #7
	sqrshrnb	z18.h, z12.s, #7
	uzp1	z20.h, z23.h, z23.h
	sub	z13.s, z13.s, z24.s
	splice	z16.h, p5, z16.h, z20.h
	sqrshrnb	z24.h, z22.s, #7
	uzp1	z11.h, z18.h, z18.h
	splice	z11.h, p5, z11.h, z9.h
	sqrshrnb	z9.h, z13.s, #7
	add	z12.s, z14.s, z25.s
	uzp1	z19.h, z9.h, z9.h
	sub	z14.s, z14.s, z25.s
	uzp1	z21.h, z24.h, z24.h
	sqrshrnb	z25.h, z12.s, #7
	sqrshrnb	z20.h, z14.s, #7
	uzp1	z23.h, z25.h, z25.h
	splice	z21.h, p5, z21.h, z23.h
	uzp1	z18.h, z16.h, z21.h
	uzp2	z21.h, z16.h, z21.h
	uzp1	z24.h, z15.h, z18.h
	uzp2	z9.h, z15.h, z18.h
	add	z15.s, z1.s, z26.s
	sub	z1.s, z1.s, z26.s
	sqrshrnb	z26.h, z15.s, #7
	sqrshrnb	z16.h, z1.s, #7
	add	z22.s, z2.s, z27.s
	uzp1	z12.h, z16.h, z16.h
	sub	z2.s, z2.s, z27.s
	mov	x8, x18
	sqrshrnb	z27.h, z22.s, #7
	add	x18, sp, 208
	uzp1	z14.h, z27.h, z27.h
	sqrshrnb	z25.h, z2.s, #7
	addvl	x9, sp, #2
	uzp1	z13.h, z20.h, z20.h
	add	z20.s, z29.s, z28.s
	splice	z13.h, p5, z13.h, z19.h
	sub	z29.s, z29.s, z28.s
	uzp1	z19.h, z26.h, z26.h
	ldr	z26, [x18]
	splice	z19.h, p5, z19.h, z14.h
	add	z16.s, z17.s, z26.s
	sqrshrnb	z28.h, z20.s, #7
	sqrshrnb	z15.h, z29.s, #7
	sub	z17.s, z17.s, z26.s
	uzp1	z1.h, z15.h, z15.h
	add	z29.s, z4.s, z0.s
	uzp1	z18.h, z28.h, z28.h
	sqrshrnb	z27.h, z17.s, #7
	addvl	x4, sp, #1
	sqrshrnb	z17.h, z29.s, #7
	add	x9, x9, 208
	ldr	z20, [x9]
	addvl	x7, sp, #3
	add	z15.s, z3.s, z20.s
	uzp1	z23.h, z25.h, z25.h
	uzp1	z14.h, z27.h, z27.h
	splice	z23.h, p5, z23.h, z12.h
	splice	z14.h, p5, z14.h, z1.h
	sqrshrnb	z12.h, z16.s, #7
	uzp1	z22.h, z12.h, z12.h
	movprfx	z2, z18
	splice	z2.h, p5, z2.h, z22.h
	uzp1	z25.h, z19.h, z2.h
	uzp2	z28.h, z19.h, z2.h
	add	z19.s, z6.s, z30.s
	sqrshrnb	z1.h, z19.s, #7
	sqrshrnb	z12.h, z15.s, #7
	sub	z3.s, z3.s, z20.s
	uzp1	z27.h, z12.h, z12.h
	add	x4, x4, 208
	add	x7, x7, 720
	addvl	x6, sp, #3
	sub	z6.s, z6.s, z30.s
	ldr	z30, [x4]
	uzp1	z26.h, z1.h, z1.h
	add	z18.s, z5.s, z30.s
	uzp1	z1.h, z14.h, z23.h
	sqrshrnb	z16.h, z18.s, #7
	uzp1	z2.h, z17.h, z17.h
	uzp1	z22.h, z16.h, z16.h
	splice	z2.h, p5, z2.h, z27.h
	splice	z26.h, p5, z26.h, z22.h
	uzp2	z17.h, z14.h, z23.h
	uzp1	z20.h, z26.h, z2.h
	uzp1	z15.h, z25.h, z20.h
	uzp1	z23.h, z24.h, z15.h
	str	z23, [x7]
	uzp2	z29.h, z26.h, z2.h
	uzp1	z22.h, z10.h, z21.h
	uzp1	z16.h, z28.h, z29.h
	add	x6, x6, 784
	uzp1	z14.h, z22.h, z16.h
	addvl	x5, sp, #3
	str	z14, [x6]
	uzp2	z26.h, z25.h, z20.h
	add	x5, x5, 848
	uzp1	z27.h, z9.h, z26.h
	addvl	x3, sp, #3
	sub	z0.s, z4.s, z0.s
	str	z27, [x5]
	uzp2	z25.h, z28.h, z29.h
	uzp2	z10.h, z10.h, z21.h
	sqrshrnb	z4.h, z0.s, #7
	add	x3, x3, 912
	uzp1	z0.h, z10.h, z25.h
	addvl	x18, sp, #3
	str	z0, [x3]
	sqrshrnb	z19.h, z3.s, #7
	uzp2	z24.h, z24.h, z15.h
	add	x18, x18, 976
	addvl	x4, sp, #3
	str	z24, [x18]
	addvl	x9, sp, #3
	add	x4, x4, 1040
	sub	z5.s, z5.s, z30.s
	uzp1	z30.h, z19.h, z19.h
	uzp2	z19.h, z22.h, z16.h
	str	z19, [x4]
	uzp2	z9.h, z9.h, z26.h
	add	x9, x9, 1104
	addvl	x7, sp, #3
	sqrshrnb	z6.h, z6.s, #7
	str	z9, [x9]
	uzp1	z18.h, z4.h, z4.h
	uzp1	z21.h, z6.h, z6.h
	ldr	q6, [x0, 96]
	uzp2	z4.h, z10.h, z25.h
	uzp1	z28.h, z7.h, z8.h
	add	x7, x7, 1168
	str	z4, [x7]
	splice	z30.h, p5, z30.h, z18.h
	addvl	x6, sp, #3
	uzp1	z12.h, z13.h, z11.h
	addvl	x5, sp, #3
	ldr	q18, [x0, 224]
	uzp1	z3.h, z12.h, z28.h
	sqrshrnb	z5.h, z5.s, #7
	add	x6, x6, 752
	uzp1	z2.h, z5.h, z5.h
	splice	z2.h, p5, z2.h, z21.h
	uzp1	z20.h, z30.h, z2.h
	uzp1	z22.h, z20.h, z1.h
	uzp1	z29.h, z22.h, z3.h
	str	z29, [x6]
	uzp2	z11.h, z13.h, z11.h
	uzp2	z30.h, z30.h, z2.h
	uzp2	z8.h, z7.h, z8.h
	uzp1	z15.h, z30.h, z17.h
	uzp1	z7.h, z11.h, z8.h
	add	x5, x5, 816
	addvl	x3, sp, #3
	uzp1	z16.h, z15.h, z7.h
	str	z16, [x5]
	uzp2	z13.h, z12.h, z28.h
	uzp2	z1.h, z20.h, z1.h
	add	x3, x3, 880
	addvl	x18, sp, #3
	uzp1	z26.h, z1.h, z13.h
	str	z26, [x3]
	uzp2	z5.h, z11.h, z8.h
	uzp2	z10.h, z30.h, z17.h
	add	x18, x18, 944
	addvl	x4, sp, #3
	uzp1	z25.h, z10.h, z5.h
	str	z25, [x18]
	add	x4, x4, 1008
	addvl	x9, sp, #3
	uzp2	z28.h, z22.h, z3.h
	str	z28, [x4]
	add	x9, x9, 1072
	addvl	x7, sp, #3
	uzp2	z2.h, z15.h, z7.h
	str	z2, [x9]
	add	x7, x7, 1136
	addvl	x6, sp, #3
	uzp2	z21.h, z1.h, z13.h
	str	z21, [x7]
	add	x6, x6, 1200
	uzp2	z17.h, z10.h, z5.h
	zip1	z12.h, z6.h, z18.h
	str	z17, [x6]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z3.h
// 0 "" 2
#NO_APP
	mov	x7, x17
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	mov	x6, x16
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z14.h
// 0 "" 2
#NO_APP
	mov	x5, x15
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	mov	x4, x14
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z0.h
// 0 "" 2
#NO_APP
	mov	x3, x13
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z24.h
// 0 "" 2
#NO_APP
	mov	x18, x12
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	mov	x17, x11
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z4.h
// 0 "" 2
#NO_APP
	mov	x16, x10
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+2304
	add	x15, x15, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+2560
	add	x14, x14, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+2816
	add	x13, x13, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z12.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+3072
	add	x12, x12, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3328
	add	x11, x11, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+3584
	add	x10, x10, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z1.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+3840
	add	x9, x9, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z12.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q12, [x0, 352]
	ldr	q2, [x0, 480]
	zip1	z17.h, z12.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	ldr	q17, [x0, 608]
	ldr	q9, [x0, 736]
	zip1	z4.h, z17.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z8.h
// 0 "" 2
#NO_APP
	ldr	q4, [x0, 864]
	ldr	q7, [x0, 992]
	zip1	z6.h, z4.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q6, [x0, 1120]
	ldr	q1, [x0, 1248]
	zip1	z16.h, z6.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z16.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z16.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z16.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	ldr	q16, [x0, 1376]
	ldr	q3, [x0, 1504]
	zip1	z14.h, z16.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	ldr	q14, [x0, 1632]
	ldr	q11, [x0, 1760]
	zip1	z8.h, z14.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z8.h, z7.h
// 0 "" 2
#NO_APP
	ldr	q8, [x0, 1888]
	ldr	q13, [x0, 2016]
	zip1	z29.h, z8.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z29.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z29.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z29.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z29.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z29.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z29.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z29.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z29.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z29.h, z7.h
// 0 "" 2
#NO_APP
	add	x18, sp, 208
	str	z5, [x18]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z29.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z29.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #1
	add	x17, x17, 208
	str	z15, [x17]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z29.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x16, sp, #2
	ldr	q29, [x0, 416]
	add	x16, x16, 208
	str	z10, [x16]
	ldr	q10, [x0, 160]
	zip1	z6.h, z10.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z7.h
// 0 "" 2
#NO_APP
	ldr	q5, [x0, 672]
	ldr	q29, [x0, 928]
	zip1	z6.h, z5.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z5.h
// 0 "" 2
#NO_APP
	ldr	q29, [x0, 1184]
	ldr	q6, [x0, 1440]
	zip1	z1.h, z29.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q6, [x0, 1696]
	ldr	q1, [x0, 1952]
	zip1	z2.h, z6.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 288]
	ldr	q2, [x0, 800]
	zip1	z3.h, z1.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	ldr	x1, [sp, 168]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1312]
	ldr	q2, [x0, 1824]
	zip1	z3.h, z1.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z1.h
// 0 "" 2
#NO_APP
	ldr	x19, [sp, 176]
	ldr	q2, [x0, 544]
	ldr	q3, [x0, 1568]
	zip1	z17.h, z2.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	ldr	x26, [sp, 184]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 32]
	ldr	x25, [sp, 192]
	ldr	q17, [x0, 1056]
	zip1	z1.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	ldr	x15, [sp, 200]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	add	z1.s, z17.s, z2.s
	sub	z29.s, z16.s, z3.s
	sub	z17.s, z17.s, z2.s
	add	z2.s, z16.s, z3.s
	sub	z16.s, z29.s, z6.s
	add	z3.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z2.s, z5.s
	add	z5.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	sub	z29.s, z16.s, z13.s
	sub	z17.s, z17.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z17.s, z17.s, z12.s
	add	z12.s, z16.s, z13.s
	add	z13.s, z2.s, z14.s
	sub	z16.s, z7.s, z18.s
	sub	z2.s, z2.s, z14.s
	add	z14.s, z1.s, z15.s
	sub	z1.s, z1.s, z15.s
	add	z15.s, z7.s, z18.s
	sqrshrnb	z7.h, z16.s, #7
	sqrshrnb	z18.h, z15.s, #7
	uzp1	z16.h, z7.h, z7.h
	add	z15.s, z8.s, z19.s
	sub	z19.s, z8.s, z19.s
	sqrshrnb	z8.h, z15.s, #7
	sqrshrnb	z15.h, z19.s, #7
	uzp1	z7.h, z8.h, z8.h
	uzp1	z8.h, z15.h, z15.h
	splice	z8.h, p5, z8.h, z16.h
	add	z16.s, z9.s, z20.s
	sub	z9.s, z9.s, z20.s
	uzp1	z18.h, z18.h, z18.h
	sqrshrnb	z20.h, z16.s, #7
	splice	z18.h, p5, z18.h, z7.h
	sqrshrnb	z19.h, z9.s, #7
	uzp1	z7.h, z20.h, z20.h
	uzp1	z15.h, z19.h, z19.h
	add	z16.s, z10.s, z21.s
	sub	z10.s, z10.s, z21.s
	sqrshrnb	z21.h, z16.s, #7
	uzp1	z9.h, z21.h, z21.h
	sqrshrnb	z20.h, z10.s, #7
	movprfx	z19, z7
	splice	z19.h, p5, z19.h, z9.h
	uzp1	z7.h, z20.h, z20.h
	uzp2	z10.h, z18.h, z19.h
	splice	z7.h, p5, z7.h, z15.h
	uzp1	z15.h, z18.h, z19.h
	add	z18.s, z11.s, z22.s
	sub	z11.s, z11.s, z22.s
	sqrshrnb	z22.h, z18.s, #7
	sqrshrnb	z21.h, z11.s, #7
	uzp1	z9.h, z21.h, z21.h
	add	z19.s, z12.s, z23.s
	uzp1	z16.h, z22.h, z22.h
	sub	z12.s, z12.s, z23.s
	add	z22.s, z13.s, z24.s
	sqrshrnb	z23.h, z19.s, #7
	sqrshrnb	z18.h, z12.s, #7
	uzp1	z20.h, z23.h, z23.h
	sub	z13.s, z13.s, z24.s
	splice	z16.h, p5, z16.h, z20.h
	sqrshrnb	z24.h, z22.s, #7
	uzp1	z11.h, z18.h, z18.h
	splice	z11.h, p5, z11.h, z9.h
	sqrshrnb	z9.h, z13.s, #7
	add	z12.s, z14.s, z25.s
	uzp1	z19.h, z9.h, z9.h
	sub	z14.s, z14.s, z25.s
	uzp1	z21.h, z24.h, z24.h
	sqrshrnb	z25.h, z12.s, #7
	sqrshrnb	z20.h, z14.s, #7
	uzp1	z23.h, z25.h, z25.h
	splice	z21.h, p5, z21.h, z23.h
	uzp1	z18.h, z16.h, z21.h
	uzp2	z21.h, z16.h, z21.h
	uzp1	z24.h, z15.h, z18.h
	uzp2	z9.h, z15.h, z18.h
	add	z15.s, z1.s, z26.s
	sub	z1.s, z1.s, z26.s
	sqrshrnb	z26.h, z15.s, #7
	sqrshrnb	z16.h, z1.s, #7
	add	z22.s, z2.s, z27.s
	uzp1	z12.h, z16.h, z16.h
	sub	z2.s, z2.s, z27.s
	uzp1	z13.h, z20.h, z20.h
	sqrshrnb	z27.h, z22.s, #7
	splice	z13.h, p5, z13.h, z19.h
	uzp1	z14.h, z27.h, z27.h
	sqrshrnb	z25.h, z2.s, #7
	add	z20.s, z29.s, z28.s
	uzp1	z19.h, z26.h, z26.h
	ldr	z26, [x18]
	splice	z19.h, p5, z19.h, z14.h
	add	z16.s, z17.s, z26.s
	sub	z29.s, z29.s, z28.s
	sub	z17.s, z17.s, z26.s
	sqrshrnb	z28.h, z20.s, #7
	sqrshrnb	z15.h, z29.s, #7
	uzp1	z1.h, z15.h, z15.h
	ldr	z20, [x16]
	add	z29.s, z4.s, z0.s
	add	z15.s, z3.s, z20.s
	uzp1	z18.h, z28.h, z28.h
	sqrshrnb	z27.h, z17.s, #7
	addvl	x14, sp, #3
	sqrshrnb	z17.h, z29.s, #7
	uzp1	z23.h, z25.h, z25.h
	uzp1	z14.h, z27.h, z27.h
	splice	z23.h, p5, z23.h, z12.h
	splice	z14.h, p5, z14.h, z1.h
	sqrshrnb	z12.h, z16.s, #7
	uzp1	z22.h, z12.h, z12.h
	movprfx	z2, z18
	splice	z2.h, p5, z2.h, z22.h
	uzp1	z25.h, z19.h, z2.h
	uzp2	z28.h, z19.h, z2.h
	add	z19.s, z6.s, z30.s
	sqrshrnb	z1.h, z19.s, #7
	sqrshrnb	z12.h, z15.s, #7
	sub	z3.s, z3.s, z20.s
	uzp1	z27.h, z12.h, z12.h
	add	x14, x14, 1232
	addvl	x13, sp, #3
	sub	z6.s, z6.s, z30.s
	ldr	z30, [x17]
	uzp1	z26.h, z1.h, z1.h
	add	z18.s, z5.s, z30.s
	uzp1	z1.h, z14.h, z23.h
	sqrshrnb	z16.h, z18.s, #7
	uzp1	z2.h, z17.h, z17.h
	uzp1	z22.h, z16.h, z16.h
	splice	z2.h, p5, z2.h, z27.h
	splice	z26.h, p5, z26.h, z22.h
	uzp2	z17.h, z14.h, z23.h
	uzp1	z20.h, z26.h, z2.h
	uzp1	z15.h, z25.h, z20.h
	uzp1	z23.h, z24.h, z15.h
	str	z23, [x14]
	uzp2	z29.h, z26.h, z2.h
	uzp1	z22.h, z10.h, z21.h
	uzp1	z16.h, z28.h, z29.h
	add	x13, x13, 1296
	uzp1	z14.h, z22.h, z16.h
	addvl	x12, sp, #3
	str	z14, [x13]
	uzp2	z26.h, z25.h, z20.h
	add	x12, x12, 1360
	uzp1	z27.h, z9.h, z26.h
	addvl	x11, sp, #3
	sub	z0.s, z4.s, z0.s
	str	z27, [x12]
	uzp2	z25.h, z28.h, z29.h
	uzp2	z10.h, z10.h, z21.h
	sqrshrnb	z4.h, z0.s, #7
	add	x11, x11, 1424
	uzp1	z0.h, z10.h, z25.h
	addvl	x10, sp, #3
	str	z0, [x11]
	sqrshrnb	z19.h, z3.s, #7
	uzp2	z24.h, z24.h, z15.h
	add	x10, x10, 1488
	addvl	x9, sp, #3
	str	z24, [x10]
	addvl	x18, sp, #3
	add	x9, x9, 1552
	sub	z5.s, z5.s, z30.s
	uzp1	z30.h, z19.h, z19.h
	uzp2	z19.h, z22.h, z16.h
	str	z19, [x9]
	uzp2	z9.h, z9.h, z26.h
	add	x18, x18, 1616
	addvl	x17, sp, #3
	str	z9, [x18]
	uzp1	z18.h, z4.h, z4.h
	add	x17, x17, 1680
	uzp2	z4.h, z10.h, z25.h
	addvl	x16, sp, #3
	sqrshrnb	z6.h, z6.s, #7
	str	z4, [x17]
	uzp1	z28.h, z7.h, z8.h
	splice	z30.h, p5, z30.h, z18.h
	ldr	q18, [x0, 240]
	uzp1	z12.h, z13.h, z11.h
	uzp1	z21.h, z6.h, z6.h
	uzp1	z3.h, z12.h, z28.h
	ldr	q6, [x0, 112]
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z2.h, z5.h, z5.h
	add	x16, x16, 1264
	splice	z2.h, p5, z2.h, z21.h
	uzp1	z20.h, z30.h, z2.h
	addvl	x1, sp, #3
	uzp1	z22.h, z20.h, z1.h
	uzp1	z29.h, z22.h, z3.h
	str	z29, [x16]
	uzp2	z11.h, z13.h, z11.h
	uzp2	z30.h, z30.h, z2.h
	uzp2	z8.h, z7.h, z8.h
	uzp1	z15.h, z30.h, z17.h
	uzp1	z7.h, z11.h, z8.h
	add	x1, x1, 1328
	addvl	x19, sp, #3
	uzp1	z16.h, z15.h, z7.h
	str	z16, [x1]
	uzp2	z13.h, z12.h, z28.h
	uzp2	z1.h, z20.h, z1.h
	add	x19, x19, 1392
	addvl	x26, sp, #3
	uzp1	z26.h, z1.h, z13.h
	str	z26, [x19]
	uzp2	z5.h, z11.h, z8.h
	uzp2	z10.h, z30.h, z17.h
	add	x26, x26, 1456
	addvl	x25, sp, #3
	uzp1	z25.h, z10.h, z5.h
	str	z25, [x26]
	add	x25, x25, 1520
	addvl	x15, sp, #3
	uzp2	z28.h, z22.h, z3.h
	str	z28, [x25]
	add	x15, x15, 1584
	addvl	x14, sp, #3
	uzp2	z2.h, z15.h, z7.h
	str	z2, [x15]
	add	x14, x14, 1648
	addvl	x13, sp, #3
	uzp2	z21.h, z1.h, z13.h
	str	z21, [x14]
	add	x13, x13, 1712
	uzp2	z17.h, z10.h, z5.h
	zip1	z12.h, z6.h, z18.h
	str	z17, [x13]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+1536
	add	x18, x8, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+1792
	add	x17, x7, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2048
	add	x16, x6, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2304
	add	x15, x5, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2560
	add	x14, x4, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+2816
	add	x13, x12, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3072
	add	x12, x11, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z12.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+3328
	add	x1, x10, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+3584
	add	x11, x9, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z1.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+3840
	add	x10, x19, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z12.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q12, [x0, 368]
	adrp	x26, _ZL6CDOT_O
	ldr	q2, [x0, 496]
	zip1	z17.h, z12.h, z2.h
	add	x8, x26, :lo12:_ZL6CDOT_O
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+256
	add	x7, x25, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+512
	add	x9, x6, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+768
	add	x6, x5, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1024
	add	x5, x4, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z17.h, z4.h
// 0 "" 2
#NO_APP
	mov	x19, x3
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z17.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	ldr	q17, [x0, 624]
	ldr	q23, [x0, 752]
	zip1	z14.h, z17.h, z23.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z14.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	ldr	q14, [x0, 880]
	ldr	q4, [x0, 1008]
	zip1	z11.h, z14.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z11.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z11.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z11.h, z8.h
// 0 "" 2
#NO_APP
	ldr	q11, [x0, 1136]
	ldr	q7, [x0, 1264]
	zip1	z5.h, z11.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x1, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z13.h
// 0 "" 2
#NO_APP
	ldr	q5, [x0, 1392]
	ldr	q29, [x0, 1520]
	zip1	z1.h, z5.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x1, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1648]
	ldr	q12, [x0, 1776]
	zip1	z2.h, z1.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x1, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	ldr	q2, [x0, 1904]
	ldr	q17, [x0, 2032]
	zip1	z23.h, z2.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z23.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z23.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z23.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z23.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z23.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z23.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z23.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z23.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z23.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z23.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z23.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z23.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z23.h, z3.h
// 0 "" 2
#NO_APP
	add	x3, sp, 208
	str	z6, [x3]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x1, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z23.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #1
	add	x26, x26, 208
	str	z15, [x26]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z23.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x25, sp, #2
	adrp	x4, .LANCHOR0
	ldr	q17, [x0, 432]
	add	x25, x25, 208
	str	z10, [x25]
	ldr	q10, [x0, 176]
	zip1	z23.h, z10.h, z17.h
	add	x3, x4, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	mov	x26, x24
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	mov	x25, x23
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z23.h, z4.h
// 0 "" 2
#NO_APP
	mov	x24, x22
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z23.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z23.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z23.h, z5.h
// 0 "" 2
#NO_APP
	add	x22, x3, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z23.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z23.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 688]
	ldr	q3, [x0, 944]
	zip1	z6.h, z1.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1200]
	ldr	q3, [x0, 1456]
	zip1	z6.h, z1.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1712]
	ldr	q3, [x0, 1968]
	zip1	z6.h, z1.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z16.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 304]
	ldr	q3, [x0, 816]
	zip1	z2.h, z1.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	add	x23, x3, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z2.h, z17.h
// 0 "" 2
#NO_APP
	add	x21, x3, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 1328]
	ldr	q16, [x0, 1840]
	zip1	z3.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	ldr	q1, [x0, 560]
	add	x20, x3, 1280
	ldr	q16, [x0, 1584]
	zip1	z17.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x22, x3, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z17.h, z4.h
// 0 "" 2
#NO_APP
	ldr	q29, [x0, 48]
	add	x4, x3, 1344
	ldr	q1, [x0, 1072]
	zip1	z4.h, z29.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z16.h
// 0 "" 2
#NO_APP
	add	x0, x3, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z29.h
// 0 "" 2
#NO_APP
	add	z1.s, z17.s, z2.s
	sub	z29.s, z16.s, z3.s
	sub	z17.s, z17.s, z2.s
	add	z2.s, z16.s, z3.s
	add	z3.s, z1.s, z23.s
	add	z4.s, z2.s, z5.s
	sub	z23.s, z1.s, z23.s
	sub	z16.s, z29.s, z6.s
	sub	z1.s, z2.s, z5.s
	add	z5.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	sub	z29.s, z5.s, z10.s
	sub	z17.s, z17.s, z7.s
	sub	z2.s, z1.s, z14.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z6.s, z11.s
	add	z10.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z6.s, z17.s, z12.s
	add	z12.s, z16.s, z13.s
	sub	z16.s, z16.s, z13.s
	add	z13.s, z1.s, z14.s
	sub	z1.s, z23.s, z15.s
	add	z14.s, z23.s, z15.s
	add	z15.s, z7.s, z18.s
	sub	z23.s, z7.s, z18.s
	sqrshrnb	z18.h, z15.s, #7
	sqrshrnb	z7.h, z23.s, #7
	add	z15.s, z8.s, z19.s
	uzp1	z23.h, z7.h, z7.h
	sub	z19.s, z8.s, z19.s
	sqrshrnb	z8.h, z15.s, #7
	sqrshrnb	z7.h, z19.s, #7
	uzp1	z17.h, z18.h, z18.h
	uzp1	z18.h, z8.h, z8.h
	uzp1	z8.h, z7.h, z7.h
	splice	z8.h, p5, z8.h, z23.h
	add	z23.s, z9.s, z20.s
	splice	z17.h, p5, z17.h, z18.h
	sub	z9.s, z9.s, z20.s
	add	z7.s, z10.s, z21.s
	sqrshrnb	z20.h, z23.s, #7
	sub	z10.s, z10.s, z21.s
	uzp1	z15.h, z20.h, z20.h
	sqrshrnb	z21.h, z7.s, #7
	uzp1	z23.h, z21.h, z21.h
	sqrshrnb	z19.h, z9.s, #7
	sqrshrnb	z20.h, z10.s, #7
	movprfx	z9, z15
	splice	z9.h, p5, z9.h, z23.h
	uzp1	z18.h, z19.h, z19.h
	uzp1	z15.h, z17.h, z9.h
	uzp2	z10.h, z17.h, z9.h
	add	z23.s, z12.s, z22.s
	add	z17.s, z11.s, z31.s
	sub	z12.s, z12.s, z22.s
	sub	z11.s, z11.s, z31.s
	sqrshrnb	z22.h, z23.s, #7
	sqrshrnb	z31.h, z17.s, #7
	sqrshrnb	z19.h, z11.s, #7
	uzp1	z9.h, z22.h, z22.h
	uzp1	z21.h, z19.h, z19.h
	add	z17.s, z13.s, z30.s
	add	z23.s, z14.s, z24.s
	sub	z30.s, z13.s, z30.s
	sub	z14.s, z14.s, z24.s
	sqrshrnb	z13.h, z17.s, #7
	uzp1	z7.h, z20.h, z20.h
	sqrshrnb	z20.h, z12.s, #7
	splice	z7.h, p5, z7.h, z18.h
	uzp1	z18.h, z31.h, z31.h
	splice	z18.h, p5, z18.h, z9.h
	sqrshrnb	z19.h, z30.s, #7
	sqrshrnb	z24.h, z23.s, #7
	sqrshrnb	z22.h, z14.s, #7
	uzp1	z12.h, z24.h, z24.h
	uzp1	z11.h, z20.h, z20.h
	uzp1	z31.h, z13.h, z13.h
	splice	z11.h, p5, z11.h, z21.h
	splice	z31.h, p5, z31.h, z12.h
	uzp1	z21.h, z19.h, z19.h
	uzp1	z20.h, z18.h, z31.h
	uzp2	z30.h, z18.h, z31.h
	uzp2	z14.h, z15.h, z20.h
	uzp1	z13.h, z15.h, z20.h
	add	z15.s, z1.s, z25.s
	sub	z25.s, z1.s, z25.s
	sqrshrnb	z1.h, z15.s, #7
	sqrshrnb	z17.h, z25.s, #7
	uzp1	z18.h, z1.h, z1.h
	uzp1	z31.h, z17.h, z17.h
	add	z19.s, z2.s, z26.s
	add	z1.s, z6.s, z28.s
	sub	z2.s, z2.s, z26.s
	sub	z6.s, z6.s, z28.s
	sqrshrnb	z26.h, z19.s, #7
	sqrshrnb	z24.h, z2.s, #7
	sqrshrnb	z28.h, z1.s, #7
	sqrshrnb	z17.h, z6.s, #7
	addvl	x20, sp, #1
	addvl	x22, sp, #2
	uzp1	z9.h, z22.h, z22.h
	add	z22.s, z16.s, z27.s
	splice	z9.h, p5, z9.h, z21.h
	sub	z27.s, z16.s, z27.s
	uzp1	z21.h, z26.h, z26.h
	sqrshrnb	z16.h, z22.s, #7
	movprfx	z23, z18
	splice	z23.h, p5, z23.h, z21.h
	uzp1	z20.h, z16.h, z16.h
	uzp1	z18.h, z28.h, z28.h
	splice	z20.h, p5, z20.h, z18.h
	add	x3, sp, 208
	uzp1	z21.h, z23.h, z20.h
	sqrshrnb	z15.h, z27.s, #7
	uzp2	z23.h, z23.h, z20.h
	uzp1	z25.h, z15.h, z15.h
	add	x20, x20, 208
	add	x22, x22, 208
	ldr	z16, [x22]
	addvl	x4, sp, #3
	add	z20.s, z3.s, z16.s
	uzp1	z12.h, z24.h, z24.h
	sqrshrnb	z6.h, z20.s, #7
	splice	z12.h, p5, z12.h, z31.h
	ldr	z31, [x3]
	uzp1	z2.h, z17.h, z17.h
	add	z19.s, z5.s, z31.s
	sub	z24.s, z5.s, z31.s
	ldr	z5, [x20]
	sqrshrnb	z26.h, z19.s, #7
	add	z22.s, z29.s, z5.s
	sub	z27.s, z29.s, z5.s
	uzp1	z17.h, z6.h, z6.h
	add	z29.s, z4.s, z0.s
	sqrshrnb	z1.h, z29.s, #7
	uzp1	z18.h, z1.h, z1.h
	splice	z18.h, p5, z18.h, z17.h
	splice	z2.h, p5, z2.h, z25.h
	sqrshrnb	z15.h, z22.s, #7
	sub	z3.s, z3.s, z16.s
	uzp1	z25.h, z15.h, z15.h
	sqrshrnb	z5.h, z27.s, #7
	sqrshrnb	z22.h, z24.s, #7
	add	x4, x4, 1744
	addvl	x0, sp, #3
	uzp1	z28.h, z26.h, z26.h
	uzp1	z26.h, z10.h, z30.h
	splice	z28.h, p5, z28.h, z25.h
	uzp2	z10.h, z10.h, z30.h
	uzp1	z24.h, z28.h, z18.h
	uzp2	z27.h, z28.h, z18.h
	uzp1	z16.h, z21.h, z24.h
	uzp1	z18.h, z23.h, z27.h
	uzp2	z30.h, z23.h, z27.h
	uzp1	z23.h, z13.h, z16.h
	str	z23, [x4]
	uzp1	z6.h, z26.h, z18.h
	add	x0, x0, 1808
	addvl	x3, sp, #3
	addvl	x20, sp, #3
	str	z6, [x0]
	uzp2	z28.h, z21.h, z24.h
	add	x3, x3, 1872
	uzp1	z15.h, z14.h, z28.h
	add	x20, x20, 1936
	str	z15, [x3]
	uzp1	z25.h, z10.h, z30.h
	addvl	x3, sp, #3
	addvl	x22, sp, #3
	str	z25, [x20]
	addvl	x20, sp, #3
	uzp2	z13.h, z13.h, z16.h
	add	x22, x22, 2000
	addvl	x4, sp, #3
	add	x3, x3, 272
	add	x20, x20, 400
	str	z13, [x22]
	uzp2	z17.h, z26.h, z18.h
	sqrshrnb	z31.h, z3.s, #7
	add	x4, x4, 2064
	addvl	x0, sp, #3
	str	z17, [x4]
	addvl	x22, sp, #3
	add	x0, x0, 2128
	sub	z0.s, z4.s, z0.s
	uzp1	z1.h, z31.h, z31.h
	sqrshrnb	z4.h, z0.s, #7
	uzp2	z31.h, z14.h, z28.h
	str	z31, [x0]
	uzp1	z19.h, z4.h, z4.h
	uzp1	z21.h, z22.h, z22.h
	ldr	q22, [x20]
	uzp2	z4.h, z10.h, z30.h
	add	x22, x22, 2192
	uzp1	z0.h, z5.h, z5.h
	ldr	q5, [x3]
	str	z4, [x22]
	uzp1	z29.h, z7.h, z8.h
	addvl	x4, sp, #3
	splice	z0.h, p5, z0.h, z21.h
	uzp1	z20.h, z2.h, z12.h
	uzp1	z3.h, z9.h, z11.h
	uzp2	z12.h, z2.h, z12.h
	splice	z1.h, p5, z1.h, z19.h
	uzp1	z2.h, z3.h, z29.h
	uzp1	z19.h, z1.h, z0.h
	add	x4, x4, 1776
	uzp1	z27.h, z19.h, z20.h
	addvl	x0, sp, #3
	uzp1	z24.h, z27.h, z2.h
	str	z24, [x4]
	uzp2	z11.h, z9.h, z11.h
	uzp2	z1.h, z1.h, z0.h
	uzp2	z8.h, z7.h, z8.h
	uzp1	z26.h, z1.h, z12.h
	uzp1	z7.h, z11.h, z8.h
	add	x0, x0, 1840
	addvl	x3, sp, #3
	uzp1	z16.h, z26.h, z7.h
	str	z16, [x0]
	uzp2	z9.h, z3.h, z29.h
	uzp2	z20.h, z19.h, z20.h
	add	x3, x3, 1904
	addvl	x20, sp, #3
	uzp1	z18.h, z20.h, z9.h
	str	z18, [x3]
	uzp2	z14.h, z11.h, z8.h
	uzp2	z10.h, z1.h, z12.h
	add	x20, x20, 1968
	addvl	x22, sp, #3
	uzp1	z28.h, z10.h, z14.h
	str	z28, [x20]
	add	x22, x22, 2032
	addvl	x4, sp, #3
	uzp2	z30.h, z27.h, z2.h
	str	z30, [x22]
	add	x4, x4, 2096
	addvl	x0, sp, #3
	uzp2	z29.h, z26.h, z7.h
	str	z29, [x4]
	add	x0, x0, 2160
	addvl	x3, sp, #3
	uzp2	z0.h, z20.h, z9.h
	str	z0, [x0]
	add	x3, x3, 2224
	uzp2	z21.h, z10.h, z14.h
	zip1	z3.h, z5.h, z22.h
	str	z21, [x3]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #3
	addvl	x22, sp, #3
	add	x20, x20, 528
	add	x22, x22, 656
	ldr	q3, [x20]
	ldr	q30, [x22]
	zip1	z0.h, z3.h, z30.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z9.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #3
	addvl	x0, sp, #3
	add	x4, x4, 784
	add	x0, x0, 912
	ldr	q0, [x4]
	ldr	q6, [x0]
	zip1	z15.h, z0.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z16.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #3
	addvl	x3, sp, #3
	add	x10, x10, 1040
	add	x3, x3, 1168
	ldr	q15, [x10]
	ldr	q13, [x3]
	zip1	z17.h, z15.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z15.h
// 0 "" 2
#NO_APP
	mov	x9, x11
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3840
	add	x8, x11, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z17.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x6, sp, #3
	addvl	x5, sp, #3
	add	x6, x6, 1296
	add	x5, x5, 1424
	adrp	x7, _ZL6CDOT_O
	add	x7, x7, :lo12:_ZL6CDOT_O
	ldr	q17, [x6]
	ldr	q4, [x5]
	zip1	z11.h, z17.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+256
	add	x6, x20, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+512
	add	x5, x22, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+768
	add	x4, x4, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z1.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1024
	add	x3, x0, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x19, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x1, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z11.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #3
	addvl	x11, sp, #3
	add	x10, x10, 1552
	add	x11, x11, 1680
	ldr	q11, [x10]
	ldr	q7, [x11]
	zip1	z1.h, z11.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x1, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #3
	addvl	x22, sp, #3
	add	x20, x20, 1808
	add	x22, x22, 1936
	ldr	q1, [x20]
	ldr	q10, [x22]
	zip1	z9.h, z1.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x19, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x1, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z9.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	addvl	x10, sp, #3
	add	x0, x0, 2064
	add	x10, x10, 2192
	ldr	q9, [x0]
	ldr	q2, [x10]
	zip1	z6.h, z9.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x19, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x18, sp, 208
	str	z29, [x18]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x1, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z6.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #1
	add	x17, x17, 208
	str	z5, [x17]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x15, sp, #3
	addvl	x14, sp, #3
	add	x15, x15, 336
	addvl	x16, sp, #2
	add	x16, x16, 208
	add	x14, x14, 592
	str	z12, [x16]
	ldr	q2, [x14]
	adrp	x13, .LANCHOR0
	ldr	q12, [x15]
	zip1	z6.h, z12.h, z2.h
	add	x0, x13, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z16.h
// 0 "" 2
#NO_APP
	mov	x16, x26
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z15.h
// 0 "" 2
#NO_APP
	mov	x15, x25
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z13.h
// 0 "" 2
#NO_APP
	mov	x14, x24
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z17.h
// 0 "" 2
#NO_APP
	add	x13, x0, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z4.h
// 0 "" 2
#NO_APP
	add	x12, x0, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z8.h
// 0 "" 2
#NO_APP
	add	x11, x0, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z7.h
// 0 "" 2
#NO_APP
	mov	x10, x30
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #3
	addvl	x19, sp, #3
	add	x30, x30, 848
	add	x19, x19, 1104
	ldr	q29, [x30]
	ldr	q3, [x19]
	zip1	z5.h, z29.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #3
	addvl	x25, sp, #3
	add	x26, x26, 1360
	add	x25, x25, 1616
	ldr	q29, [x26]
	ldr	q3, [x25]
	zip1	z5.h, z29.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #3
	addvl	x20, sp, #3
	add	x24, x24, 1872
	add	x20, x20, 2128
	ldr	q29, [x24]
	ldr	q3, [x20]
	zip1	z5.h, z29.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #3
	addvl	x18, sp, #3
	add	x22, x22, 464
	add	x18, x18, 976
	ldr	q29, [x22]
	ldr	q3, [x18]
	zip1	z2.h, z29.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	mov	x30, x21
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z16.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #3
	addvl	x19, sp, #3
	add	x21, x21, 1488
	add	x19, x19, 2000
	ldr	q1, [x21]
	ldr	q29, [x19]
	zip1	z3.h, z1.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #3
	addvl	x26, sp, #3
	add	x23, x23, 720
	add	x26, x26, 1744
	add	x28, x0, 1280
	ldr	q1, [x23]
	ldr	q29, [x26]
	zip1	z5.h, z1.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z5.h, z3.h
// 0 "" 2
#NO_APP
	add	x25, x0, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z5.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #3
	addvl	x22, sp, #3
	add	x20, x20, 208
	add	x22, x22, 1232
	add	x24, x0, 1344
	ldr	q1, [x20]
	ldr	q17, [x22]
	zip1	z5.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z29.h
// 0 "" 2
#NO_APP
	add	x18, x0, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z29.h
// 0 "" 2
#NO_APP
	add	x30, x2, x2, lsl 1
	add	x21, x27, x2, lsl 1
	add	z1.s, z17.s, z2.s
	add	x18, x21, 32
	add	x17, x27, x2, lsl 2
	sub	z29.s, z16.s, z3.s
	add	x22, x27, x30, lsl 2
	add	x19, x27, x30, lsl 1
	add	z5.s, z29.s, z6.s
	add	x30, x22, 32
	stp	x18, x30, [sp, 168]
	sub	z17.s, z17.s, z2.s
	add	x18, x2, x2, lsl 2
	add	z2.s, z16.s, z3.s
	add	z3.s, z1.s, z4.s
	add	x20, x17, 32
	sub	z16.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	add	x17, x27, x18, lsl 1
	lsl	x18, x2, 3
	sub	z17.s, z17.s, z7.s
	sub	x18, x18, x2
	add	z7.s, z3.s, z31.s
	sub	z29.s, z16.s, z13.s
	sub	z1.s, z1.s, z4.s
	sub	z31.s, z3.s, z31.s
	add	z4.s, z2.s, z8.s
	sub	z3.s, z5.s, z10.s
	sub	z2.s, z2.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z6.s, z11.s
	add	z10.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z6.s, z17.s, z12.s
	add	z12.s, z16.s, z13.s
	add	z13.s, z2.s, z14.s
	sub	z16.s, z7.s, z18.s
	sub	z2.s, z2.s, z14.s
	add	z14.s, z1.s, z15.s
	sub	z1.s, z1.s, z15.s
	add	z15.s, z7.s, z18.s
	sqrshrnb	z7.h, z16.s, #12
	sqrshrnb	z18.h, z15.s, #12
	uzp1	z16.h, z7.h, z7.h
	add	z15.s, z8.s, z19.s
	add	x18, x27, x18, lsl 1
	sub	z19.s, z8.s, z19.s
	sqrshrnb	z8.h, z15.s, #12
	sqrshrnb	z7.h, z19.s, #12
	add	x18, x18, 32
	uzp1	z17.h, z18.h, z18.h
	uzp1	z18.h, z8.h, z8.h
	uzp1	z8.h, z7.h, z7.h
	add	z7.s, z10.s, z21.s
	splice	z8.h, p5, z8.h, z16.h
	sub	z10.s, z10.s, z21.s
	add	z16.s, z9.s, z20.s
	sub	z9.s, z9.s, z20.s
	sqrshrnb	z20.h, z16.s, #12
	sqrshrnb	z19.h, z9.s, #12
	splice	z17.h, p5, z17.h, z18.h
	uzp1	z15.h, z20.h, z20.h
	uzp1	z18.h, z19.h, z19.h
	sqrshrnb	z21.h, z7.s, #12
	sqrshrnb	z20.h, z10.s, #12
	uzp1	z16.h, z21.h, z21.h
	add	z19.s, z11.s, z22.s
	movprfx	z9, z15
	splice	z9.h, p5, z9.h, z16.h
	sub	z11.s, z11.s, z22.s
	sqrshrnb	z10.h, z11.s, #12
	str	x18, [sp, 184]
	add	x18, x27, x2, lsl 3
	uzp1	z15.h, z17.h, z9.h
	sqrshrnb	z22.h, z19.s, #12
	uzp2	z17.h, z17.h, z9.h
	uzp1	z21.h, z10.h, z10.h
	add	z16.s, z12.s, z23.s
	add	z19.s, z13.s, z24.s
	sub	z12.s, z12.s, z23.s
	sub	z13.s, z13.s, z24.s
	sqrshrnb	z23.h, z16.s, #12
	sqrshrnb	z24.h, z19.s, #12
	uzp1	z9.h, z23.h, z23.h
	sqrshrnb	z10.h, z13.s, #12
	add	x18, x18, 32
	uzp1	z7.h, z20.h, z20.h
	sqrshrnb	z20.h, z12.s, #12
	splice	z7.h, p5, z7.h, z18.h
	uzp1	z18.h, z22.h, z22.h
	splice	z18.h, p5, z18.h, z9.h
	add	z16.s, z14.s, z25.s
	uzp1	z11.h, z20.h, z20.h
	sub	z14.s, z14.s, z25.s
	splice	z11.h, p5, z11.h, z21.h
	sqrshrnb	z25.h, z16.s, #12
	uzp1	z21.h, z10.h, z10.h
	uzp1	z12.h, z25.h, z25.h
	uzp1	z22.h, z24.h, z24.h
	splice	z22.h, p5, z22.h, z12.h
	uzp1	z20.h, z18.h, z22.h
	uzp2	z13.h, z18.h, z22.h
	uzp1	z24.h, z15.h, z20.h
	uzp2	z10.h, z15.h, z20.h
	add	z15.s, z1.s, z26.s
	sub	z1.s, z1.s, z26.s
	sqrshrnb	z18.h, z1.s, #12
	str	x18, [sp, 160]
	add	x18, sp, 208
	uzp1	z19.h, z18.h, z18.h
	uzp1	z18.h, z17.h, z13.h
	uzp2	z13.h, z17.h, z13.h
	ldr	z17, [x18]
	addvl	x18, sp, #1
	sqrshrnb	z23.h, z14.s, #12
	add	z22.s, z2.s, z27.s
	add	x18, x18, 208
	sub	z2.s, z2.s, z27.s
	sqrshrnb	z27.h, z22.s, #12
	uzp1	z16.h, z27.h, z27.h
	sqrshrnb	z26.h, z15.s, #12
	add	z27.s, z5.s, z30.s
	sqrshrnb	z14.h, z2.s, #12
	add	z25.s, z29.s, z28.s
	uzp1	z9.h, z23.h, z23.h
	sub	z29.s, z29.s, z28.s
	splice	z9.h, p5, z9.h, z21.h
	sqrshrnb	z28.h, z25.s, #12
	sqrshrnb	z20.h, z29.s, #12
	uzp1	z23.h, z28.h, z28.h
	uzp1	z21.h, z26.h, z26.h
	splice	z21.h, p5, z21.h, z16.h
	sub	z16.s, z5.s, z30.s
	ldr	z30, [x18]
	addvl	x18, sp, #2
	uzp1	z1.h, z9.h, z11.h
	add	z28.s, z3.s, z30.s
	uzp1	z15.h, z20.h, z20.h
	uzp2	z11.h, z9.h, z11.h
	add	x18, x18, 208
	add	z9.s, z6.s, z17.s
	uzp1	z12.h, z14.h, z14.h
	sub	z6.s, z6.s, z17.s
	splice	z12.h, p5, z12.h, z19.h
	sqrshrnb	z26.h, z9.s, #12
	sqrshrnb	z2.h, z6.s, #12
	uzp1	z19.h, z26.h, z26.h
	uzp1	z14.h, z2.h, z2.h
	movprfx	z22, z23
	splice	z22.h, p5, z22.h, z19.h
	ldr	z23, [x18]
	splice	z14.h, p5, z14.h, z15.h
	add	z20.s, z31.s, z23.s
	uzp1	z25.h, z21.h, z22.h
	sub	z5.s, z3.s, z30.s
	uzp2	z21.h, z21.h, z22.h
	add	z3.s, z4.s, z0.s
	sqrshrnb	z15.h, z27.s, #12
	sqrshrnb	z17.h, z28.s, #12
	sqrshrnb	z29.h, z3.s, #12
	sqrshrnb	z9.h, z20.s, #12
	uzp1	z6.h, z17.h, z17.h
	uzp1	z20.h, z14.h, z12.h
	uzp1	z22.h, z9.h, z9.h
	uzp2	z12.h, z14.h, z12.h
	sub	z31.s, z31.s, z23.s
	uzp1	z26.h, z15.h, z15.h
	uzp1	z19.h, z29.h, z29.h
	splice	z26.h, p5, z26.h, z6.h
	splice	z19.h, p5, z19.h, z22.h
	uzp1	z28.h, z26.h, z19.h
	uzp1	z23.h, z25.h, z28.h
	uzp1	z14.h, z24.h, z23.h
	str	z14, [x27]
	sqrshrnb	z27.h, z5.s, #12
	uzp2	z5.h, z26.h, z19.h
	uzp1	z15.h, z21.h, z5.h
	uzp1	z26.h, z18.h, z15.h
	str	z26, [x21]
	add	x26, x21, x2, lsl 1
	uzp2	z25.h, z25.h, z28.h
	uzp1	z6.h, z10.h, z25.h
	str	z6, [x26]
	add	x25, x26, x2, lsl 1
	uzp2	z29.h, z21.h, z5.h
	uzp1	z22.h, z13.h, z29.h
	str	z22, [x25]
	add	x24, x25, x2, lsl 1
	uzp2	z24.h, z24.h, z23.h
	str	z24, [x24]
	add	x23, x24, x2, lsl 1
	uzp2	z18.h, z18.h, z15.h
	str	z18, [x23]
	add	x22, x23, x2, lsl 1
	uzp2	z10.h, z10.h, z25.h
	str	z10, [x22]
	add	x30, x17, 32
	sqrshrnb	z2.h, z31.s, #12
	uzp2	z13.h, z13.h, z29.h
	add	x17, x22, x2, lsl 1
	sub	z0.s, z4.s, z0.s
	str	z13, [x17]
	uzp1	z9.h, z7.h, z8.h
	add	x28, x27, 32
	uzp1	z17.h, z1.h, z9.h
	sqrshrnb	z4.h, z0.s, #12
	sqrshrnb	z3.h, z16.s, #12
	uzp1	z30.h, z2.h, z2.h
	uzp1	z16.h, z4.h, z4.h
	uzp1	z21.h, z3.h, z3.h
	splice	z30.h, p5, z30.h, z16.h
	uzp1	z19.h, z27.h, z27.h
	splice	z19.h, p5, z19.h, z21.h
	uzp1	z31.h, z30.h, z19.h
	uzp1	z0.h, z31.h, z20.h
	uzp1	z2.h, z0.h, z17.h
	str	z2, [x28]
	uzp2	z8.h, z7.h, z8.h
	ldp	x26, x21, [sp, 160]
	uzp1	z7.h, z11.h, z8.h
	uzp2	z4.h, z30.h, z19.h
	uzp1	z27.h, z4.h, z12.h
	uzp1	z3.h, z27.h, z7.h
	str	z3, [x21]
	uzp2	z1.h, z1.h, z9.h
	uzp2	z16.h, z31.h, z20.h
	uzp1	z20.h, z16.h, z1.h
	str	z20, [x20]
	uzp2	z30.h, z4.h, z12.h
	addvl	x24, sp, #3
	addvl	x20, sp, #3
	uzp2	z11.h, z11.h, z8.h
	add	x19, x19, 32
	uzp1	z23.h, z30.h, z11.h
	str	z23, [x19]
	add	x24, x24, 288
	add	x20, x20, 416
	uzp2	z28.h, z0.h, z17.h
	str	z28, [x26]
	uzp2	z5.h, z27.h, z7.h
	str	z5, [x30]
	ldr	x25, [sp, 176]
	uzp2	z15.h, z16.h, z1.h
	str	z15, [x25]
	uzp2	z25.h, z30.h, z11.h
	ldr	x28, [sp, 184]
	str	z25, [x28]
	ldr	q29, [x24]
	ldr	q9, [x20]
	zip1	z12.h, z29.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+1280
	add	x19, x23, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+1536
	add	x30, x22, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+1792
	add	x25, x18, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x26, _ZL6CDOT_O+2048
	add	x28, x26, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+2304
	add	x24, x21, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+2560
	add	x23, x20, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z1.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+2816
	add	x18, x22, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x26, _ZL6CDOT_O+3072
	add	x20, x26, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #3
	addvl	x22, sp, #3
	add	x21, x21, 544
	add	x22, x22, 672
	ldr	q9, [x21]
	ldr	q12, [x22]
	zip1	z19.h, z9.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z19.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z19.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z19.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z19.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z19.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z19.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z19.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z19.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z19.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z19.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z19.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z19.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z19.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z19.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z19.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #3
	addvl	x21, sp, #3
	add	x26, x26, 800
	add	x21, x21, 928
	ldr	q19, [x26]
	ldr	q14, [x21]
	zip1	z6.h, z19.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z6.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #3
	addvl	x26, sp, #3
	add	x22, x22, 1056
	add	x26, x26, 1184
	ldr	q6, [x22]
	ldr	q13, [x26]
	zip1	z8.h, z6.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z8.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #3
	addvl	x22, sp, #3
	add	x21, x21, 1312
	add	x22, x22, 1440
	ldr	q8, [x21]
	ldr	q1, [x22]
	zip1	z11.h, z8.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x19, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x20, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x1, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #3
	addvl	x21, sp, #3
	add	x26, x26, 1568
	add	x21, x21, 1696
	ldr	q11, [x26]
	ldr	q4, [x21]
	zip1	z5.h, z11.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x19, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x20, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x1, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #3
	addvl	x26, sp, #3
	add	x22, x22, 1824
	add	x26, x26, 1952
	ldr	q5, [x22]
	ldr	q9, [x26]
	zip1	z12.h, z5.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x19, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x20, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x1, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #3
	addvl	x22, sp, #3
	add	x21, x21, 2080
	add	x22, x22, 2208
	ldr	q12, [x21]
	ldr	q19, [x22]
	zip1	z14.h, z12.h, z19.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	add	x25, sp, 208
	str	z0, [x25]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x20, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x1, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x1, sp, #1
	add	x1, x1, 208
	str	z3, [x1]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z16.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #3
	addvl	x28, sp, #3
	add	x8, x8, 352
	addvl	x9, sp, #2
	add	x9, x9, 208
	add	x28, x28, 608
	str	z29, [x9]
	ldr	q12, [x28]
	ldr	q29, [x8]
	zip1	z19.h, z29.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z19.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z19.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z19.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z19.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z19.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z19.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z19.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z19.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #3
	addvl	x23, sp, #3
	add	x24, x24, 864
	add	x23, x23, 1120
	ldr	q5, [x24]
	ldr	q17, [x23]
	zip1	z3.h, z5.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #3
	addvl	x20, sp, #3
	add	x18, x18, 1376
	add	x20, x20, 1632
	ldr	q5, [x18]
	ldr	q17, [x20]
	zip1	z3.h, z5.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #3
	addvl	x21, sp, #3
	add	x26, x26, 1888
	add	x21, x21, 2144
	ldr	q5, [x26]
	ldr	q17, [x21]
	zip1	z3.h, z5.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x16, sp, #3
	addvl	x15, sp, #3
	add	x16, x16, 480
	add	x15, x15, 992
	add	x11, x0, 1024
	ldr	q5, [x16]
	ldr	q17, [x15]
	zip1	z3.h, z5.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x14, x0, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	add	x13, x0, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z7.h
// 0 "" 2
#NO_APP
	add	x12, x0, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #3
	addvl	x22, sp, #3
	add	x10, x10, 1504
	add	x22, x22, 2016
	ldr	q2, [x10]
	ldr	q4, [x22]
	zip1	z17.h, z2.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x1, sp, #3
	addvl	x9, sp, #3
	add	x1, x1, 736
	add	x9, x9, 1760
	add	x25, x0, 1280
	ldr	q2, [x1]
	ldr	q4, [x9]
	zip1	z17.h, z2.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x8, x0, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #3
	addvl	x23, sp, #3
	add	x24, x24, 224
	add	x23, x23, 1248
	add	x28, x0, 1344
	ldr	q29, [x24]
	ldr	q1, [x23]
	zip1	z3.h, z29.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x0, x0, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	add	z1.s, z17.s, z2.s
	sub	z29.s, z16.s, z4.s
	add	z3.s, z1.s, z19.s
	sub	z17.s, z17.s, z2.s
	sub	z19.s, z1.s, z19.s
	add	z2.s, z16.s, z4.s
	sub	z16.s, z29.s, z6.s
	add	z4.s, z2.s, z5.s
	sub	z1.s, z2.s, z5.s
	add	z5.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	sub	z17.s, z17.s, z7.s
	add	z7.s, z3.s, z8.s
	add	x26, x2, x2, lsl 2
	sub	z29.s, z16.s, z13.s
	sub	z2.s, z1.s, z14.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z17.s, z17.s, z12.s
	add	z12.s, z16.s, z13.s
	add	z13.s, z1.s, z14.s
	add	z14.s, z19.s, z15.s
	sub	z1.s, z19.s, z15.s
	add	z15.s, z7.s, z18.s
	sub	z19.s, z7.s, z18.s
	sqrshrnb	z7.h, z19.s, #12
	sqrshrnb	z18.h, z15.s, #12
	uzp1	z19.h, z7.h, z7.h
	add	z15.s, z8.s, z31.s
	sub	z31.s, z8.s, z31.s
	sqrshrnb	z7.h, z31.s, #12
	add	x10, x2, x26, lsl 1
	add	x25, x2, x2, lsl 1
	lsl	x0, x2, 3
	sqrshrnb	z8.h, z15.s, #12
	uzp1	z16.h, z18.h, z18.h
	uzp1	z31.h, z7.h, z7.h
	uzp1	z18.h, z8.h, z8.h
	splice	z31.h, p5, z31.h, z19.h
	splice	z16.h, p5, z16.h, z18.h
	add	z19.s, z9.s, z20.s
	add	z7.s, z10.s, z21.s
	sub	z9.s, z9.s, z20.s
	sub	z10.s, z10.s, z21.s
	sqrshrnb	z20.h, z19.s, #12
	uzp1	z15.h, z20.h, z20.h
	add	x1, x27, x26, lsl 2
	add	x14, x2, x2, lsl 3
	sub	x26, x0, x2
	sqrshrnb	z8.h, z9.s, #12
	sqrshrnb	z21.h, z7.s, #12
	sqrshrnb	z20.h, z10.s, #12
	uzp1	z19.h, z21.h, z21.h
	movprfx	z9, z15
	splice	z9.h, p5, z9.h, z19.h
	uzp1	z15.h, z16.h, z9.h
	uzp2	z7.h, z16.h, z9.h
	add	z16.s, z11.s, z22.s
	sub	z11.s, z11.s, z22.s
	sqrshrnb	z10.h, z11.s, #12
	add	x8, x27, x10, lsl 1
	uzp1	z18.h, z8.h, z8.h
	add	x10, x2, x25, lsl 2
	sqrshrnb	z22.h, z16.s, #12
	add	x25, x27, x25, lsl 3
	uzp1	z21.h, z10.h, z10.h
	add	z19.s, z12.s, z23.s
	add	z16.s, z13.s, z24.s
	sub	z12.s, z12.s, z23.s
	sub	z13.s, z13.s, z24.s
	uzp1	z8.h, z20.h, z20.h
	sqrshrnb	z24.h, z16.s, #12
	sqrshrnb	z20.h, z12.s, #12
	sqrshrnb	z10.h, z13.s, #12
	splice	z8.h, p5, z8.h, z18.h
	add	x12, x27, x14, lsl 1
	add	x9, x1, 32
	add	x14, x27, x26, lsl 2
	sqrshrnb	z23.h, z19.s, #12
	add	x1, x25, 32
	lsl	x0, x2, 4
	uzp1	z9.h, z23.h, z23.h
	add	x25, sp, 208
	add	z19.s, z14.s, z25.s
	uzp1	z18.h, z22.h, z22.h
	sub	z14.s, z14.s, z25.s
	splice	z18.h, p5, z18.h, z9.h
	sqrshrnb	z25.h, z19.s, #12
	uzp1	z11.h, z20.h, z20.h
	uzp1	z12.h, z25.h, z25.h
	splice	z11.h, p5, z11.h, z21.h
	uzp1	z22.h, z24.h, z24.h
	uzp1	z21.h, z10.h, z10.h
	splice	z22.h, p5, z22.h, z12.h
	uzp1	z20.h, z18.h, z22.h
	uzp1	z24.h, z15.h, z20.h
	uzp2	z10.h, z15.h, z20.h
	add	z15.s, z1.s, z26.s
	sub	z1.s, z1.s, z26.s
	uzp2	z13.h, z18.h, z22.h
	add	x23, x12, 32
	sqrshrnb	z23.h, z14.s, #12
	add	x12, x14, 32
	sqrshrnb	z26.h, z15.s, #12
	sub	x14, x0, x2
	sqrshrnb	z16.h, z1.s, #12
	ldr	z1, [x25]
	add	z22.s, z2.s, z27.s
	add	z25.s, z29.s, z28.s
	sub	z2.s, z2.s, z27.s
	sub	z29.s, z29.s, z28.s
	sqrshrnb	z27.h, z22.s, #12
	sqrshrnb	z14.h, z2.s, #12
	uzp1	z19.h, z27.h, z27.h
	sqrshrnb	z28.h, z25.s, #12
	sqrshrnb	z20.h, z29.s, #12
	addvl	x0, sp, #1
	uzp1	z15.h, z20.h, z20.h
	addvl	x25, sp, #2
	uzp1	z9.h, z23.h, z23.h
	uzp1	z18.h, z26.h, z26.h
	splice	z9.h, p5, z9.h, z21.h
	splice	z18.h, p5, z18.h, z19.h
	uzp1	z21.h, z16.h, z16.h
	add	z26.s, z17.s, z1.s
	uzp1	z23.h, z28.h, z28.h
	sub	z17.s, z17.s, z1.s
	sqrshrnb	z16.h, z26.s, #12
	sqrshrnb	z2.h, z17.s, #12
	add	x0, x0, 208
	add	x25, x25, 208
	ldr	z28, [x25]
	uzp1	z12.h, z14.h, z14.h
	uzp1	z14.h, z2.h, z2.h
	splice	z12.h, p5, z12.h, z21.h
	splice	z14.h, p5, z14.h, z15.h
	uzp1	z21.h, z16.h, z16.h
	movprfx	z22, z23
	splice	z22.h, p5, z22.h, z21.h
	uzp1	z25.h, z18.h, z22.h
	uzp2	z27.h, z18.h, z22.h
	add	z18.s, z6.s, z30.s
	sub	z6.s, z6.s, z30.s
	ldr	z30, [x0]
	sqrshrnb	z20.h, z18.s, #12
	add	z19.s, z5.s, z30.s
	sqrshrnb	z15.h, z19.s, #12
	add	x17, x17, x2, lsl 1
	add	z29.s, z4.s, z0.s
	add	z23.s, z3.s, z28.s
	sqrshrnb	z1.h, z29.s, #12
	sqrshrnb	z17.h, z23.s, #12
	uzp1	z16.h, z15.h, z15.h
	uzp1	z22.h, z17.h, z17.h
	sub	z3.s, z3.s, z28.s
	uzp1	z26.h, z20.h, z20.h
	uzp1	z21.h, z1.h, z1.h
	splice	z26.h, p5, z26.h, z16.h
	splice	z21.h, p5, z21.h, z22.h
	uzp1	z20.h, z14.h, z12.h
	uzp1	z28.h, z26.h, z21.h
	uzp2	z12.h, z14.h, z12.h
	uzp1	z15.h, z25.h, z28.h
	uzp1	z14.h, z24.h, z15.h
	str	z14, [x17]
	add	x18, x17, x2, lsl 1
	uzp2	z29.h, z26.h, z21.h
	uzp1	z23.h, z7.h, z13.h
	uzp1	z1.h, z27.h, z29.h
	uzp2	z7.h, z7.h, z13.h
	uzp2	z13.h, z27.h, z29.h
	uzp1	z27.h, z23.h, z1.h
	str	z27, [x18]
	uzp2	z26.h, z25.h, z28.h
	add	x28, x18, x2, lsl 1
	uzp1	z21.h, z10.h, z26.h
	str	z21, [x28]
	add	x22, x28, x2, lsl 1
	sqrshrnb	z2.h, z3.s, #12
	uzp1	z3.h, z7.h, z13.h
	str	z3, [x22]
	add	x21, x22, x2, lsl 1
	uzp2	z24.h, z24.h, z15.h
	sub	z0.s, z4.s, z0.s
	str	z24, [x21]
	add	x24, x21, x2, lsl 1
	sqrshrnb	z4.h, z0.s, #12
	uzp2	z0.h, z23.h, z1.h
	str	z0, [x24]
	add	x16, x24, x2, lsl 1
	uzp2	z10.h, z10.h, z26.h
	str	z10, [x16]
	add	x20, x27, x2, lsl 4
	uzp1	z18.h, z4.h, z4.h
	add	x13, x16, x2, lsl 1
	sub	z5.s, z5.s, z30.s
	sqrshrnb	z6.h, z6.s, #12
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z30.h, z2.h, z2.h
	uzp2	z2.h, z7.h, z13.h
	str	z2, [x13]
	uzp1	z16.h, z8.h, z31.h
	splice	z30.h, p5, z30.h, z18.h
	uzp1	z19.h, z9.h, z11.h
	add	x15, x20, 32
	uzp1	z17.h, z19.h, z16.h
	uzp1	z25.h, z6.h, z6.h
	uzp1	z22.h, z5.h, z5.h
	splice	z22.h, p5, z22.h, z25.h
	uzp1	z5.h, z30.h, z22.h
	uzp1	z6.h, z5.h, z20.h
	uzp1	z18.h, z6.h, z17.h
	str	z18, [x15]
	uzp2	z11.h, z9.h, z11.h
	uzp2	z30.h, z30.h, z22.h
	uzp2	z31.h, z8.h, z31.h
	uzp1	z28.h, z30.h, z12.h
	uzp1	z8.h, z11.h, z31.h
	uzp1	z29.h, z28.h, z8.h
	str	z29, [x23]
	uzp2	z9.h, z19.h, z16.h
	uzp2	z20.h, z5.h, z20.h
	uzp1	z19.h, z20.h, z9.h
	str	z19, [x9]
	uzp2	z23.h, z30.h, z12.h
	add	x20, x8, 32
	addvl	x17, sp, #3
	addvl	x18, sp, #3
	uzp2	z4.h, z11.h, z31.h
	uzp1	z15.h, z23.h, z4.h
	str	z15, [x20]
	add	x8, x27, x10, lsl 1
	add	x17, x17, 304
	add	x18, x18, 432
	uzp2	z1.h, z6.h, z17.h
	str	z1, [x1]
	add	x26, x8, 32
	uzp2	z26.h, z28.h, z8.h
	str	z26, [x26]
	add	x10, x27, x14, lsl 1
	uzp2	z7.h, z20.h, z9.h
	str	z7, [x12]
	add	x8, x10, 32
	uzp2	z13.h, z23.h, z4.h
	str	z13, [x8]
	ldr	q16, [x17]
	ldr	q22, [x18]
	zip1	z12.h, z16.h, z22.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z0.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+1792
	add	x30, x7, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2048
	add	x28, x6, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z2.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2304
	add	x22, x5, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2560
	add	x21, x4, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x24, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+3072
	add	x23, x15, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+3328
	add	x9, x16, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z12.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+3584
	add	x1, x20, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+3840
	add	x26, x12, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x14, sp, #3
	addvl	x0, sp, #3
	add	x14, x14, 560
	add	x0, x0, 688
	adrp	x10, _ZL6CDOT_O
	add	x8, x10, :lo12:_ZL6CDOT_O
	ldr	q15, [x14]
	ldr	q7, [x0]
	zip1	z16.h, z15.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+256
	add	x18, x17, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+512
	add	x6, x7, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+768
	add	x4, x5, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1024
	add	x15, x3, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z3.h
// 0 "" 2
#NO_APP
	mov	x16, x19
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+1536
	add	x20, x19, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z16.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z16.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z16.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z16.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x12, sp, #3
	addvl	x14, sp, #3
	add	x12, x12, 816
	add	x14, x14, 944
	ldr	q16, [x12]
	ldr	q12, [x14]
	zip1	z17.h, z16.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z17.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z17.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #3
	addvl	x0, sp, #3
	add	x10, x10, 1072
	add	x0, x0, 1200
	ldr	q17, [x10]
	ldr	q3, [x0]
	zip1	z10.h, z17.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z10.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z10.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z10.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z10.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z10.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z10.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #3
	addvl	x7, sp, #3
	add	x17, x17, 1328
	add	x7, x7, 1456
	ldr	q10, [x17]
	ldr	q11, [x7]
	zip1	z8.h, z10.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x20, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z8.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x1, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z8.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #3
	addvl	x3, sp, #3
	add	x5, x5, 1584
	add	x3, x3, 1712
	ldr	q8, [x5]
	ldr	q5, [x3]
	zip1	z29.h, z8.h, z5.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z29.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z29.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z29.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z29.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z29.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z29.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x20, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z29.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z29.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z29.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z29.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z29.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x1, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z29.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #3
	addvl	x12, sp, #3
	add	x19, x19, 1840
	add	x12, x12, 1968
	ldr	q29, [x19]
	ldr	q15, [x12]
	zip1	z7.h, z29.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x20, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z7.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z7.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x1, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z7.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x14, sp, #3
	addvl	x10, sp, #3
	add	x14, x14, 2096
	add	x10, x10, 2224
	ldr	q7, [x14]
	ldr	q16, [x10]
	zip1	z12.h, z7.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x20, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	add	x30, sp, 208
	str	z9, [x30]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z12.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x28, sp, #1
	add	x28, x28, 208
	str	z6, [x28]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x1, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z12.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #3
	addvl	x21, sp, #3
	str	z1, [x25]
	add	x22, x22, 368
	add	x21, x21, 624
	adrp	x24, .LANCHOR0
	add	x23, x24, :lo12:.LANCHOR0
	ldr	q1, [x22]
	ldr	q16, [x21]
	zip1	z17.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	add	x26, x23, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	add	x8, x23, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x18, x23, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	add	x6, x23, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z17.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x23, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z17.h, z5.h
// 0 "" 2
#NO_APP
	add	x15, x23, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	add	x1, x23, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x1, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #3
	addvl	x16, sp, #3
	add	x9, x9, 880
	add	x16, x16, 1136
	ldr	q6, [x9]
	ldr	q7, [x16]
	zip1	z1.h, z6.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x1, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #3
	addvl	x0, sp, #3
	add	x20, x20, 1392
	add	x0, x0, 1648
	ldr	q6, [x20]
	ldr	q7, [x0]
	zip1	z1.h, z6.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x1, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #3
	addvl	x7, sp, #3
	add	x17, x17, 1904
	add	x7, x7, 2160
	ldr	q6, [x17]
	ldr	q7, [x7]
	zip1	z1.h, z6.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x1, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #3
	addvl	x3, sp, #3
	add	x5, x5, 496
	add	x3, x3, 1008
	ldr	q6, [x5]
	ldr	q7, [x3]
	zip1	z1.h, z6.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x19, x23, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z17.h
// 0 "" 2
#NO_APP
	add	x12, x23, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z3.h
// 0 "" 2
#NO_APP
	add	x14, x23, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #3
	addvl	x30, sp, #3
	add	x10, x10, 1520
	add	x30, x30, 2032
	ldr	q29, [x10]
	ldr	q6, [x30]
	zip1	z1.h, z29.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x28, sp, #3
	addvl	x22, sp, #3
	add	x28, x28, 752
	add	x22, x22, 1776
	add	x11, x23, 1280
	ldr	q29, [x28]
	ldr	q6, [x22]
	zip1	z1.h, z29.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x21, x23, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #3
	addvl	x8, sp, #3
	add	x26, x26, 240
	add	x8, x8, 1264
	add	x24, x23, 1344
	ldr	q29, [x26]
	ldr	q6, [x8]
	zip1	z1.h, z29.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x23, x23, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	add	z1.s, z17.s, z2.s
	sub	z17.s, z17.s, z2.s
	add	z2.s, z6.s, z3.s
	sub	z16.s, z6.s, z3.s
	sub	z29.s, z1.s, z4.s
	add	z3.s, z1.s, z4.s
	sub	z1.s, z2.s, z5.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z16.s, z9.s
	add	z5.s, z16.s, z9.s
	add	z6.s, z17.s, z7.s
	sub	z16.s, z2.s, z13.s
	sub	z17.s, z17.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z23.s
	sub	z4.s, z4.s, z23.s
	add	z23.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z17.s, z17.s, z12.s
	add	z12.s, z2.s, z13.s
	add	z13.s, z1.s, z14.s
	sub	z2.s, z1.s, z14.s
	add	z14.s, z29.s, z15.s
	sub	z29.s, z29.s, z15.s
	add	z15.s, z7.s, z18.s
	sub	z9.s, z7.s, z18.s
	sqrshrnb	z18.h, z15.s, #12
	sqrshrnb	z7.h, z9.s, #12
	add	z15.s, z8.s, z19.s
	add	x3, x2, x2, lsl 2
	uzp1	z9.h, z7.h, z7.h
	sub	z19.s, z8.s, z19.s
	uzp1	z1.h, z18.h, z18.h
	sqrshrnb	z8.h, z15.s, #12
	sqrshrnb	z7.h, z19.s, #12
	uzp1	z18.h, z8.h, z8.h
	add	z15.s, z23.s, z20.s
	splice	z1.h, p5, z1.h, z18.h
	sub	z23.s, z23.s, z20.s
	add	z19.s, z10.s, z21.s
	sqrshrnb	z20.h, z15.s, #12
	sub	z10.s, z10.s, z21.s
	uzp1	z18.h, z20.h, z20.h
	sqrshrnb	z21.h, z19.s, #12
	uzp1	z8.h, z7.h, z7.h
	uzp1	z15.h, z21.h, z21.h
	splice	z8.h, p5, z8.h, z9.h
	sqrshrnb	z9.h, z23.s, #12
	uzp1	z7.h, z9.h, z9.h
	movprfx	z23, z18
	splice	z23.h, p5, z23.h, z15.h
	add	x17, x2, x3, lsl 2
	uzp1	z18.h, z1.h, z23.h
	sqrshrnb	z20.h, z10.s, #12
	add	z15.s, z12.s, z30.s
	uzp1	z9.h, z20.h, z20.h
	splice	z9.h, p5, z9.h, z7.h
	uzp2	z7.h, z1.h, z23.h
	add	z1.s, z11.s, z22.s
	add	x6, x2, 1
	sub	z11.s, z11.s, z22.s
	sub	z30.s, z12.s, z30.s
	sqrshrnb	z22.h, z1.s, #12
	sqrshrnb	z19.h, z11.s, #12
	sqrshrnb	z12.h, z15.s, #12
	uzp1	z21.h, z19.h, z19.h
	uzp1	z23.h, z12.h, z12.h
	add	z1.s, z13.s, z24.s
	add	z15.s, z14.s, z25.s
	sub	z13.s, z13.s, z24.s
	sub	z14.s, z14.s, z25.s
	sqrshrnb	z24.h, z1.s, #12
	add	x8, x27, x17, lsl 1
	sqrshrnb	z20.h, z30.s, #12
	sqrshrnb	z19.h, z13.s, #12
	sqrshrnb	z25.h, z15.s, #12
	sqrshrnb	z12.h, z14.s, #12
	uzp1	z30.h, z25.h, z25.h
	uzp1	z10.h, z22.h, z22.h
	uzp1	z11.h, z20.h, z20.h
	splice	z10.h, p5, z10.h, z23.h
	splice	z11.h, p5, z11.h, z21.h
	uzp1	z22.h, z24.h, z24.h
	uzp1	z21.h, z19.h, z19.h
	splice	z22.h, p5, z22.h, z30.h
	uzp1	z23.h, z10.h, z22.h
	uzp2	z14.h, z18.h, z23.h
	uzp1	z24.h, z18.h, z23.h
	add	z18.s, z29.s, z26.s
	uzp2	z10.h, z10.h, z22.h
	add	x7, x27, x6, lsl 5
	add	x5, x27, x3, lsl 3
	sub	z29.s, z29.s, z26.s
	add	x6, x8, 32
	sqrshrnb	z26.h, z18.s, #12
	sqrshrnb	z1.h, z29.s, #12
	add	z22.s, z2.s, z27.s
	uzp1	z19.h, z1.h, z1.h
	sub	z2.s, z2.s, z27.s
	add	z25.s, z16.s, z28.s
	sqrshrnb	z27.h, z22.s, #12
	sqrshrnb	z15.h, z2.s, #12
	sub	z16.s, z16.s, z28.s
	addvl	x8, sp, #1
	sqrshrnb	z28.h, z25.s, #12
	sqrshrnb	z23.h, z16.s, #12
	uzp1	z13.h, z12.h, z12.h
	uzp1	z18.h, z23.h, z23.h
	splice	z13.h, p5, z13.h, z21.h
	uzp1	z20.h, z26.h, z26.h
	uzp1	z21.h, z27.h, z27.h
	splice	z20.h, p5, z20.h, z21.h
	add	x21, x5, 32
	uzp1	z12.h, z28.h, z28.h
	add	x5, sp, 208
	ldr	z29, [x5]
	add	z28.s, z4.s, z0.s
	add	z26.s, z17.s, z29.s
	add	x8, x8, 208
	sub	z17.s, z17.s, z29.s
	sqrshrnb	z1.h, z26.s, #12
	sqrshrnb	z2.h, z17.s, #12
	uzp1	z30.h, z15.h, z15.h
	uzp1	z21.h, z2.h, z2.h
	splice	z30.h, p5, z30.h, z19.h
	splice	z21.h, p5, z21.h, z18.h
	add	z15.s, z6.s, z31.s
	uzp1	z19.h, z1.h, z1.h
	sqrshrnb	z23.h, z15.s, #12
	movprfx	z22, z12
	splice	z22.h, p5, z22.h, z19.h
	sub	z6.s, z6.s, z31.s
	ldr	z31, [x8]
	uzp1	z25.h, z20.h, z22.h
	uzp2	z27.h, z20.h, z22.h
	ldr	z20, [x25]
	add	z16.s, z5.s, z31.s
	sqrshrnb	z18.h, z16.s, #12
	add	x13, x13, x2, lsl 1
	add	z12.s, z3.s, z20.s
	sqrshrnb	z29.h, z28.s, #12
	sqrshrnb	z17.h, z12.s, #12
	uzp1	z1.h, z18.h, z18.h
	uzp1	z22.h, z17.h, z17.h
	sub	z3.s, z3.s, z20.s
	uzp1	z26.h, z23.h, z23.h
	uzp1	z19.h, z29.h, z29.h
	splice	z26.h, p5, z26.h, z1.h
	splice	z19.h, p5, z19.h, z22.h
	uzp1	z23.h, z7.h, z10.h
	uzp2	z20.h, z26.h, z19.h
	uzp1	z28.h, z26.h, z19.h
	uzp1	z16.h, z27.h, z20.h
	uzp1	z18.h, z25.h, z28.h
	uzp2	z7.h, z7.h, z10.h
	uzp2	z10.h, z27.h, z20.h
	uzp1	z27.h, z24.h, z18.h
	str	z27, [x13]
	add	x10, x13, x2, lsl 1
	uzp1	z17.h, z23.h, z16.h
	str	z17, [x10]
	uzp2	z26.h, z25.h, z28.h
	add	x9, x10, x2, lsl 1
	uzp1	z22.h, z14.h, z26.h
	str	z22, [x9]
	add	x30, x9, x2, lsl 1
	sqrshrnb	z2.h, z3.s, #12
	uzp1	z3.h, z7.h, z10.h
	str	z3, [x30]
	add	x12, x30, x2, lsl 1
	uzp2	z24.h, z24.h, z18.h
	sub	z0.s, z4.s, z0.s
	str	z24, [x12]
	add	x18, x2, x2, lsl 3
	add	x14, x12, x2, lsl 1
	sqrshrnb	z4.h, z0.s, #12
	uzp2	z0.h, z23.h, z16.h
	str	z0, [x14]
	add	x4, x2, x2, lsl 4
	add	x20, x14, x2, lsl 1
	sub	z5.s, z5.s, z31.s
	uzp1	z31.h, z2.h, z2.h
	uzp2	z2.h, z14.h, z26.h
	str	z2, [x20]
	add	x15, x2, x18, lsl 1
	add	x16, x27, x18, lsl 2
	uzp1	z15.h, z4.h, z4.h
	add	x18, x20, x2, lsl 1
	uzp2	z4.h, z7.h, z10.h
	sqrshrnb	z5.h, z5.s, #12
	sqrshrnb	z6.h, z6.s, #12
	str	z4, [x18]
	uzp1	z29.h, z9.h, z8.h
	add	x1, x27, x4, lsl 1
	splice	z31.h, p5, z31.h, z15.h
	uzp1	z12.h, z21.h, z30.h
	uzp1	z1.h, z13.h, z11.h
	uzp2	z30.h, z21.h, z30.h
	uzp1	z25.h, z6.h, z6.h
	uzp1	z21.h, z1.h, z29.h
	uzp1	z19.h, z5.h, z5.h
	splice	z19.h, p5, z19.h, z25.h
	uzp1	z5.h, z31.h, z19.h
	uzp1	z6.h, z5.h, z12.h
	uzp1	z15.h, z6.h, z21.h
	str	z15, [x7]
	uzp2	z11.h, z13.h, z11.h
	uzp2	z31.h, z31.h, z19.h
	add	x11, x1, 32
	uzp1	z28.h, z31.h, z30.h
	uzp2	z8.h, z9.h, z8.h
	add	x28, x2, x2, lsl 1
	uzp1	z9.h, z11.h, z8.h
	uzp1	z20.h, z28.h, z9.h
	str	z20, [x11]
	add	x0, x27, x15, lsl 1
	uzp2	z13.h, z1.h, z29.h
	add	x24, x16, 32
	uzp2	z12.h, z5.h, z12.h
	uzp1	z1.h, z12.h, z13.h
	str	z1, [x24]
	uzp2	z23.h, z31.h, z30.h
	add	x26, x0, 32
	add	x22, x2, x3, lsl 1
	addvl	x25, sp, #3
	uzp2	z14.h, z11.h, z8.h
	addvl	x13, sp, #3
	lsl	x19, x28, 3
	uzp1	z18.h, z23.h, z14.h
	str	z18, [x26]
	sub	x1, x19, x2
	add	x25, x25, 320
	add	x13, x13, 448
	uzp2	z16.h, z6.h, z21.h
	str	z16, [x21]
	add	x23, x27, x22, lsl 2
	uzp2	z26.h, z28.h, z9.h
	str	z26, [x6]
	add	x16, x27, x1, lsl 1
	add	x4, x23, 32
	uzp2	z7.h, z12.h, z13.h
	str	z7, [x4]
	add	x0, x16, 32
	adrp	x17, _ZL6CDOT_O
	uzp2	z10.h, z23.h, z14.h
	lsl	x15, x2, 4
	add	x22, x17, :lo12:_ZL6CDOT_O
	lsl	x1, x2, 3
	str	z10, [x0]
	ldr	q29, [x25]
	ldr	q19, [x13]
	zip1	z30.h, z29.h, z19.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z30.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+256
	add	x30, x10, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+512
	add	x24, x9, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+768
	add	x20, x7, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+1024
	add	x14, x12, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z30.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1280
	add	x26, x11, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+1536
	add	x16, x21, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z30.h, z0.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1792
	add	x17, x6, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z30.h, z2.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+2048
	add	x25, x23, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z30.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2304
	add	x13, x4, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2560
	add	x8, x0, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z30.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2816
	add	x10, x5, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z30.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+3072
	add	x7, x9, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+3328
	add	x11, x12, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+3584
	add	x6, x21, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z30.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+3840
	add	x0, x23, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #3
	addvl	x5, sp, #3
	add	x4, x4, 576
	add	x5, x5, 704
	ldr	q1, [x4]
	ldr	q16, [x5]
	zip1	z7.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z5.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z7.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #3
	addvl	x12, sp, #3
	add	x9, x9, 832
	add	x12, x12, 960
	ldr	q7, [x9]
	ldr	q10, [x12]
	zip1	z3.h, z7.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z3.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #3
	addvl	x23, sp, #3
	add	x21, x21, 1088
	add	x23, x23, 1216
	ldr	q3, [x21]
	ldr	q2, [x23]
	zip1	z4.h, z3.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z4.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #3
	addvl	x5, sp, #3
	add	x4, x4, 1344
	add	x5, x5, 1472
	ldr	q4, [x4]
	ldr	q8, [x5]
	zip1	z9.h, z4.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x20, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #3
	addvl	x12, sp, #3
	add	x9, x9, 1600
	add	x12, x12, 1728
	ldr	q9, [x9]
	ldr	q13, [x12]
	zip1	z6.h, z9.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x20, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #3
	addvl	x23, sp, #3
	add	x21, x21, 1856
	add	x23, x23, 1984
	ldr	q6, [x21]
	ldr	q1, [x23]
	zip1	z5.h, z6.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x20, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #3
	addvl	x5, sp, #3
	add	x4, x4, 2112
	add	x5, x5, 2240
	ldr	q5, [x4]
	ldr	q7, [x5]
	zip1	z10.h, z5.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z10.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x20, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z10.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z10.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z10.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z10.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z10.h, z7.h
// 0 "" 2
#NO_APP
	add	x22, sp, 208
	str	z12, [x22]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z10.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #3
	addvl	x20, sp, #3
	add	x20, x20, 640
	addvl	x30, sp, #1
	add	x30, x30, 208
	add	x24, x24, 384
	str	z31, [x30]
	ldr	q10, [x24]
	adrp	x14, .LANCHOR0
	ldr	q31, [x20]
	zip1	z11.h, z10.h, z31.h
	add	x26, x14, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z3.h
// 0 "" 2
#NO_APP
	add	x16, x26, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z11.h, z2.h
// 0 "" 2
#NO_APP
	add	x17, x26, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z11.h, z4.h
// 0 "" 2
#NO_APP
	add	x25, x26, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z11.h, z8.h
// 0 "" 2
#NO_APP
	add	x13, x26, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z11.h, z14.h
// 0 "" 2
#NO_APP
	add	x8, x26, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z11.h, z9.h
// 0 "" 2
#NO_APP
	add	x10, x26, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z13.h
// 0 "" 2
#NO_APP
	add	x7, x26, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x11, sp, #3
	addvl	x6, sp, #3
	add	x11, x11, 896
	add	x6, x6, 1152
	ldr	q16, [x11]
	ldr	q12, [x6]
	zip1	z10.h, z16.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z10.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z10.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z10.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	addvl	x9, sp, #3
	add	x0, x0, 1408
	add	x9, x9, 1664
	ldr	q10, [x0]
	ldr	q11, [x9]
	zip1	z8.h, z10.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x12, sp, #3
	addvl	x21, sp, #3
	add	x12, x12, 1920
	add	x21, x21, 2176
	ldr	q8, [x12]
	ldr	q14, [x21]
	zip1	z9.h, z8.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z9.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #3
	addvl	x5, sp, #3
	add	x4, x4, 512
	add	x5, x5, 1024
	add	x23, x26, 1024
	ldr	q9, [x4]
	ldr	q13, [x5]
	zip1	z16.h, z9.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	add	x22, x26, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	add	x30, x26, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z16.h, z11.h
// 0 "" 2
#NO_APP
	add	x24, x26, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #3
	addvl	x14, sp, #3
	add	x20, x20, 1536
	add	x14, x14, 2048
	ldr	q9, [x20]
	ldr	q16, [x14]
	zip1	z10.h, z9.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z10.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z10.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z10.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #3
	addvl	x25, sp, #3
	add	x17, x17, 768
	add	x25, x25, 1792
	add	x16, x26, 1280
	ldr	q10, [x17]
	ldr	q11, [x25]
	zip1	z8.h, z10.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z8.h, z9.h
// 0 "" 2
#NO_APP
	add	x13, x26, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z8.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #3
	addvl	x7, sp, #3
	add	x10, x10, 256
	add	x7, x7, 1280
	add	x8, x26, 1344
	ldr	q8, [x10]
	ldr	q9, [x7]
	zip1	z9.h, z8.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	add	x26, x26, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	add	z9.s, z16.s, z10.s
	sub	z16.s, z16.s, z10.s
	add	z10.s, z31.s, z11.s
	sub	z31.s, z31.s, z11.s
	add	z11.s, z9.s, z12.s
	sub	z9.s, z9.s, z12.s
	add	z12.s, z10.s, z13.s
	sub	z10.s, z10.s, z13.s
	add	z13.s, z31.s, z14.s
	sub	z31.s, z31.s, z14.s
	add	z14.s, z16.s, z15.s
	sub	z16.s, z16.s, z15.s
	add	z8.s, z12.s, z1.s
	add	z15.s, z11.s, z0.s
	sub	z0.s, z11.s, z0.s
	sub	z11.s, z12.s, z1.s
	sub	z12.s, z13.s, z2.s
	add	z1.s, z13.s, z2.s
	sub	z13.s, z14.s, z3.s
	add	z2.s, z14.s, z3.s
	sub	z14.s, z16.s, z4.s
	add	z3.s, z16.s, z4.s
	add	z4.s, z31.s, z5.s
	sub	z16.s, z15.s, z17.s
	sub	z31.s, z31.s, z5.s
	add	z5.s, z10.s, z6.s
	sub	z10.s, z10.s, z6.s
	add	z6.s, z9.s, z7.s
	sub	z9.s, z9.s, z7.s
	add	z7.s, z15.s, z17.s
	sqrshrnb	z15.h, z16.s, #12
	sqrshrnb	z17.h, z7.s, #12
	uzp1	z16.h, z15.h, z15.h
	add	z7.s, z8.s, z18.s
	sub	z18.s, z8.s, z18.s
	sqrshrnb	z8.h, z7.s, #12
	sqrshrnb	z7.h, z18.s, #12
	uzp1	z15.h, z8.h, z8.h
	uzp1	z8.h, z7.h, z7.h
	splice	z8.h, p5, z8.h, z16.h
	add	z16.s, z1.s, z19.s
	uzp1	z17.h, z17.h, z17.h
	sub	z1.s, z1.s, z19.s
	splice	z17.h, p5, z17.h, z15.h
	sqrshrnb	z19.h, z16.s, #12
	sqrshrnb	z18.h, z1.s, #12
	uzp1	z15.h, z19.h, z19.h
	uzp1	z7.h, z18.h, z18.h
	add	z16.s, z2.s, z20.s
	sub	z2.s, z2.s, z20.s
	sqrshrnb	z20.h, z16.s, #12
	sqrshrnb	z19.h, z2.s, #12
	uzp1	z1.h, z20.h, z20.h
	movprfx	z18, z15
	splice	z18.h, p5, z18.h, z1.h
	uzp1	z15.h, z19.h, z19.h
	uzp2	z2.h, z17.h, z18.h
	splice	z15.h, p5, z15.h, z7.h
	uzp1	z7.h, z17.h, z18.h
	add	z17.s, z3.s, z21.s
	sub	z3.s, z3.s, z21.s
	sqrshrnb	z21.h, z17.s, #12
	sqrshrnb	z20.h, z3.s, #12
	sub	x22, x1, x2
	add	x12, x2, x28, lsl 2
	uzp1	z1.h, z20.h, z20.h
	add	z18.s, z4.s, z22.s
	uzp1	z16.h, z21.h, z21.h
	sub	z4.s, z4.s, z22.s
	add	z21.s, z5.s, z23.s
	sqrshrnb	z22.h, z18.s, #12
	sqrshrnb	z17.h, z4.s, #12
	uzp1	z19.h, z22.h, z22.h
	sub	z5.s, z5.s, z23.s
	splice	z16.h, p5, z16.h, z19.h
	sqrshrnb	z23.h, z21.s, #12
	uzp1	z20.h, z23.h, z23.h
	add	z4.s, z6.s, z24.s
	uzp1	z3.h, z17.h, z17.h
	sub	z6.s, z6.s, z24.s
	splice	z3.h, p5, z3.h, z1.h
	sqrshrnb	z24.h, z4.s, #12
	sqrshrnb	z1.h, z5.s, #12
	uzp1	z22.h, z24.h, z24.h
	uzp1	z18.h, z1.h, z1.h
	movprfx	z19, z20
	splice	z19.h, p5, z19.h, z22.h
	sqrshrnb	z17.h, z6.s, #12
	uzp1	z21.h, z16.h, z19.h
	uzp2	z20.h, z16.h, z19.h
	add	z16.s, z9.s, z25.s
	add	x1, x27, x12, lsl 2
	add	x4, x2, x22, lsl 2
	add	x17, x27, x22, lsl 3
	uzp1	z23.h, z7.h, z21.h
	add	x12, sp, 208
	uzp2	z7.h, z7.h, z21.h
	sub	z9.s, z9.s, z25.s
	add	z21.s, z14.s, z28.s
	sqrshrnb	z25.h, z16.s, #12
	add	z6.s, z10.s, z26.s
	sub	z16.s, z14.s, z28.s
	sub	z10.s, z10.s, z26.s
	add	z28.s, z13.s, z29.s
	sqrshrnb	z26.h, z6.s, #12
	addvl	x22, sp, #1
	uzp1	z5.h, z17.h, z17.h
	add	z17.s, z31.s, z27.s
	splice	z5.h, p5, z5.h, z18.h
	sub	z31.s, z31.s, z27.s
	ldr	z27, [x12]
	sqrshrnb	z18.h, z9.s, #12
	uzp1	z4.h, z18.h, z18.h
	uzp1	z1.h, z25.h, z25.h
	uzp1	z24.h, z26.h, z26.h
	add	z25.s, z12.s, z30.s
	sqrshrnb	z19.h, z10.s, #12
	sub	z14.s, z13.s, z29.s
	sqrshrnb	z18.h, z21.s, #12
	sub	z13.s, z12.s, z30.s
	sqrshrnb	z6.h, z25.s, #12
	add	z30.s, z11.s, z27.s
	sub	z12.s, z11.s, z27.s
	sqrshrnb	z10.h, z30.s, #12
	add	x22, x22, 208
	ldr	z11, [x22]
	uzp1	z9.h, z19.h, z19.h
	add	z29.s, z0.s, z11.s
	splice	z9.h, p5, z9.h, z4.h
	sqrshrnb	z26.h, z29.s, #12
	sqrshrnb	z4.h, z28.s, #12
	uzp1	z27.h, z26.h, z26.h
	uzp1	z28.h, z10.h, z10.h
	movprfx	z22, z1
	splice	z22.h, p5, z22.h, z24.h
	movprfx	z25, z28
	splice	z25.h, p5, z25.h, z27.h
	add	x18, x18, x2, lsl 1
	sqrshrnb	z1.h, z17.s, #12
	uzp1	z19.h, z18.h, z18.h
	uzp1	z21.h, z6.h, z6.h
	uzp1	z24.h, z1.h, z1.h
	uzp1	z17.h, z4.h, z4.h
	splice	z24.h, p5, z24.h, z19.h
	splice	z17.h, p5, z17.h, z21.h
	uzp1	z6.h, z22.h, z24.h
	uzp1	z18.h, z17.h, z25.h
	sub	z0.s, z0.s, z11.s
	uzp1	z28.h, z6.h, z18.h
	uzp1	z27.h, z23.h, z28.h
	str	z27, [x18]
	add	x21, x18, x2, lsl 1
	uzp1	z19.h, z2.h, z20.h
	uzp2	z29.h, z17.h, z25.h
	sqrshrnb	z11.h, z0.s, #12
	uzp2	z22.h, z22.h, z24.h
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z17.h, z22.h, z29.h
	uzp1	z0.h, z19.h, z17.h
	str	z0, [x21]
	add	x23, x21, x2, lsl 1
	uzp2	z26.h, z6.h, z18.h
	sqrshrnb	z30.h, z16.s, #12
	uzp1	z16.h, z12.h, z12.h
	uzp1	z12.h, z7.h, z26.h
	str	z12, [x23]
	add	x9, x23, x2, lsl 1
	uzp2	z24.h, z22.h, z29.h
	uzp2	z2.h, z2.h, z20.h
	sqrshrnb	z1.h, z31.s, #12
	uzp1	z31.h, z11.h, z11.h
	uzp1	z11.h, z2.h, z24.h
	str	z11, [x9]
	add	x30, x9, x2, lsl 1
	uzp2	z23.h, z23.h, z28.h
	sqrshrnb	z13.h, z13.s, #12
	str	z23, [x30]
	add	x24, x30, x2, lsl 1
	uzp1	z4.h, z13.h, z13.h
	uzp2	z13.h, z19.h, z17.h
	str	z13, [x24]
	add	x20, x24, x2, lsl 1
	uzp2	z7.h, z7.h, z26.h
	add	x3, x3, x3, lsl 2
	sqrshrnb	z14.h, z14.s, #12
	str	z7, [x20]
	add	x11, x27, x28, lsl 4
	add	x16, x20, x2, lsl 1
	uzp1	z21.h, z14.h, z14.h
	uzp2	z14.h, z2.h, z24.h
	str	z14, [x16]
	uzp1	z20.h, z15.h, z8.h
	splice	z4.h, p5, z4.h, z21.h
	add	x0, x27, x3, lsl 1
	splice	z31.h, p5, z31.h, z16.h
	uzp1	z10.h, z5.h, z3.h
	uzp2	z8.h, z15.h, z8.h
	uzp2	z3.h, z5.h, z3.h
	uzp1	z15.h, z31.h, z4.h
	uzp1	z5.h, z10.h, z20.h
	add	x6, x11, 32
	add	x28, x28, x19
	uzp1	z25.h, z30.h, z30.h
	uzp1	z30.h, z1.h, z1.h
	splice	z25.h, p5, z25.h, z30.h
	uzp1	z16.h, z25.h, z9.h
	uzp1	z18.h, z15.h, z16.h
	uzp1	z6.h, z18.h, z5.h
	str	z6, [x6]
	uzp2	z31.h, z31.h, z4.h
	uzp2	z9.h, z25.h, z9.h
	uzp1	z4.h, z3.h, z8.h
	uzp1	z22.h, z31.h, z9.h
	add	x19, x0, 32
	uzp1	z29.h, z22.h, z4.h
	str	z29, [x19]
	add	x14, x27, x28, lsl 1
	uzp2	z1.h, z10.h, z20.h
	add	x5, x1, 32
	uzp2	z10.h, z15.h, z16.h
	uzp1	z19.h, z10.h, z1.h
	str	z19, [x5]
	uzp2	z28.h, z31.h, z9.h
	uzp2	z17.h, z3.h, z8.h
	add	x25, x14, 32
	sub	x15, x15, x2
	lsl	x13, x2, 5
	uzp1	z26.h, z28.h, z17.h
	str	z26, [x25]
	add	x10, x27, x4, lsl 1
	add	x8, x17, 32
	uzp2	z2.h, z18.h, z5.h
	sub	x2, x13, x2
	str	z2, [x8]
	add	x26, x27, x15, lsl 2
	add	x7, x10, 32
	uzp2	z24.h, z22.h, z4.h
	str	z24, [x7]
	add	x11, x26, 32
	add	x27, x27, x2, lsl 1
	uzp2	z20.h, z10.h, z1.h
	str	z20, [x11]
	add	x3, x27, 32
	uzp2	z21.h, z28.h, z17.h
	str	z21, [x3]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
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
	addvl	sp, sp, #3
	.cfi_def_cfa_offset 2256
	add	sp, sp, 2256
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	dynopt_idct32_sve2_shared, .-dynopt_idct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL7CDOT_EO, %object
	.size	_ZL7CDOT_EO, 1024
_ZL7CDOT_EO:
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
	.type	_ZL8CDOT_EEO, %object
	.size	_ZL8CDOT_EEO, 256
_ZL8CDOT_EEO:
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
	.type	_ZL9CDOT_EEEO, %object
	.size	_ZL9CDOT_EEEO, 64
_ZL9CDOT_EEEO:
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
	.type	_ZL9CDOT_EEEE, %object
	.size	_ZL9CDOT_EEEE, 64
_ZL9CDOT_EEEE:
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
	.type	_ZL6CDOT_O, %object
	.size	_ZL6CDOT_O, 4096
_ZL6CDOT_O:
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
