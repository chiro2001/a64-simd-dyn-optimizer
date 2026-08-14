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
	addvl	sp, sp, #-10
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x50,0x1e,0x22
	add	x17, x0, 192
	ptrue	p7.h, all
	sub	sp, sp, #2272
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x50,0x1e,0x23,0xe0,0x11,0x22
	add	x16, x0, 320
	add	x15, x0, 448
	add	x14, x0, 576
	add	x13, x0, 704
	add	x12, x0, 832
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x11, x0, 960
	add	x10, x0, 1088
	add	x9, x0, 1216
	stp	x19, x20, [sp, 16]
	add	x8, x0, 1344
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	add	x19, x0, 64
	stp	x21, x22, [sp, 32]
	add	x7, x0, 1472
	add	x6, x0, 1600
	stp	x23, x24, [sp, 48]
	add	x5, x0, 1728
	add	x4, x0, 1856
	stp	x25, x26, [sp, 64]
	add	x3, x0, 1984
	adrp	x18, _ZL6CDOT_O
	stp	x27, x28, [sp, 80]
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x1b,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x1c,0x3,0x8f,0xd8,0
	add	x21, x18, :lo12:_ZL6CDOT_O
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
	ldr	z15, [x19]
	ldr	z24, [x17]
	ldr	z16, [x16]
	ldr	z25, [x15]
	ldr	z17, [x14]
	ldr	z26, [x13]
	ldr	z18, [x12]
	ldr	z27, [x11]
	ldr	z19, [x10]
	ldr	z28, [x9]
	ldr	z20, [x8]
	ldr	z29, [x7]
	ldr	z21, [x6]
	ldr	z30, [x5]
	ldr	z22, [x4]
	ldr	z31, [x3]
	zip1	z0.h, z15.h, z24.h
	zip1	z1.h, z16.h, z25.h
	zip1	z2.h, z17.h, z26.h
	zip1	z3.h, z18.h, z27.h
	zip1	z4.h, z19.h, z28.h
	zip1	z7.h, z20.h, z29.h
	zip1	z8.h, z21.h, z30.h
	zip1	z22.h, z22.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+256
	add	x22, x20, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+512
	add	x24, x23, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+768
	add	x26, x25, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x27, _ZL6CDOT_O+1024
	add	x28, x27, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z22.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x30, _ZL6CDOT_O+1280
	add	x18, x30, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z22.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+1536
	add	x17, x19, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z22.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+1792
	add	x15, x16, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z8.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z22.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+2048
	add	x14, sp, 224
	str	z9, [x14]
	add	x12, x13, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x11, sp, #1
	adrp	x10, _ZL6CDOT_O+2304
	add	x11, x11, 224
	add	x9, x10, :lo12:_ZL6CDOT_O+2304
	str	z13, [x11]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z22.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #2
	adrp	x7, _ZL6CDOT_O+2560
	add	x8, x8, 224
	add	x23, x7, :lo12:_ZL6CDOT_O+2560
	str	z12, [x8]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x6, sp, #3
	adrp	x5, _ZL6CDOT_O+2816
	add	x6, x6, 224
	add	x25, x5, :lo12:_ZL6CDOT_O+2816
	str	z9, [x6]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #4
	adrp	x3, _ZL6CDOT_O+3072
	add	x4, x4, 224
	add	x27, x3, :lo12:_ZL6CDOT_O+3072
	str	z5, [x4]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #5
	adrp	x30, _ZL6CDOT_O+3328
	add	x20, x20, 224
	add	x16, x30, :lo12:_ZL6CDOT_O+3328
	str	z11, [x20]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z22.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #6
	adrp	x14, _ZL6CDOT_O+3584
	add	x19, x19, 224
	add	x13, x14, :lo12:_ZL6CDOT_O+3584
	str	z10, [x19]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z22.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x11, sp, #7
	adrp	x10, _ZL6CDOT_O+3840
	add	x11, x11, 224
	add	x8, x10, :lo12:_ZL6CDOT_O+3840
	str	z6, [x11]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z12.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x7, sp, #8
	add	x5, x0, 128
	ldr	z22, [x5]
	add	x7, x7, 224
	add	x3, x0, 384
	ldr	z18, [x3]
	add	x20, x0, 640
	ldr	z5, [x20]
	add	x30, x0, 896
	ldr	z19, [x30]
	add	x19, x0, 1152
	ldr	z20, [x19]
	add	x14, x0, 1408
	ldr	z13, [x14]
	add	x11, x0, 1664
	ldr	z14, [x11]
	add	x10, x0, 1920
	ldr	z11, [x10]
	adrp	x6, .LANCHOR0
	zip1	z10.h, z22.h, z18.h
	add	x4, x6, :lo12:.LANCHOR0
	zip1	z21.h, z5.h, z19.h
	zip1	z9.h, z20.h, z13.h
	zip1	z15.h, z14.h, z11.h
	str	z17, [x7]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z10.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x8, x4, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z10.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z21.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z9.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	add	x7, x4, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z21.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z9.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	add	x6, x4, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z10.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z21.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z9.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x4, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z10.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z21.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z16.h
// 0 "" 2
#NO_APP
	add	x3, x4, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z21.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	add	x20, x4, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z21.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	add	x30, x4, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z10.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z21.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z9.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	add	x14, x0, 256
	ldr	z6, [x14]
	add	x19, x0, 768
	ldr	z15, [x19]
	add	x11, x0, 1280
	ldr	z13, [x11]
	add	x10, x0, 1792
	ldr	z14, [x10]
	add	x8, x4, 1024
	zip1	z23.h, z13.h, z14.h
	zip1	z16.h, z6.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z16.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z23.h, z17.h
// 0 "" 2
#NO_APP
	add	x7, x4, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z16.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z23.h, z18.h
// 0 "" 2
#NO_APP
	add	x6, x4, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z16.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z23.h, z20.h
// 0 "" 2
#NO_APP
	add	x5, x4, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z16.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	add	x3, x0, 512
	ldr	z13, [x3]
	add	x20, x0, 1536
	ldr	z15, [x20]
	add	x30, x4, 1280
	zip1	z14.h, z13.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	add	x14, x4, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z16.h
// 0 "" 2
#NO_APP
	ldr	z17, [x0]
	add	x11, x0, 1024
	ldr	z18, [x11]
	add	x19, x4, 1344
	zip1	z20.h, z17.h, z18.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	add	x4, x4, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z20.h, z9.h
// 0 "" 2
#NO_APP
	add	x7, x0, 336
	ldr	z15, [x7]
	add	x6, x0, 464
	add	x3, x0, 720
	ldr	z17, [x3]
	add	x11, x0, 1232
	ldr	z9, [x11]
	ldr	z14, [x6]
	add	x5, x0, 592
	ldr	z16, [x5]
	add	x30, x0, 976
	ldr	z20, [x30]
	add	x14, x0, 1104
	ldr	z19, [x14]
	add	x6, x0, 1744
	zip1	z14.h, z15.h, z14.h
	zip1	z15.h, z16.h, z17.h
	zip1	z17.h, z19.h, z9.h
	ldr	z9, [x6]
	add	x20, x0, 848
	ldr	z18, [x20]
	add	x4, x0, 1488
	add	x7, x0, 1616
	ldr	z19, [x7]
	add	x3, x0, 2000
	zip1	z16.h, z18.h, z20.h
	ldr	z20, [x4]
	zip1	z19.h, z19.h, z9.h
	ldr	z9, [x3]
	add	x19, x0, 1360
	ldr	z18, [x19]
	add	x5, x0, 1872
	zip1	z18.h, z18.h, z20.h
	ldr	z20, [x5]
	zip1	z20.h, z20.h, z9.h
	add	z9.s, z23.s, z13.s
	sub	z23.s, z23.s, z13.s
	add	z13.s, z21.s, z22.s
	sub	z21.s, z21.s, z22.s
	add	z22.s, z9.s, z7.s
	sub	z9.s, z9.s, z7.s
	add	z7.s, z13.s, z10.s
	sub	z13.s, z13.s, z10.s
	add	z10.s, z21.s, z6.s
	sub	z21.s, z21.s, z6.s
	add	z6.s, z23.s, z1.s
	sub	z23.s, z23.s, z1.s
	add	z1.s, z22.s, z2.s
	sub	z22.s, z22.s, z2.s
	add	z2.s, z7.s, z3.s
	sub	z7.s, z7.s, z3.s
	add	z3.s, z10.s, z11.s
	sub	z10.s, z10.s, z11.s
	add	z11.s, z6.s, z4.s
	sub	z6.s, z6.s, z4.s
	add	z4.s, z23.s, z8.s
	sub	z23.s, z23.s, z8.s
	add	z8.s, z21.s, z5.s
	sub	z21.s, z21.s, z5.s
	add	z5.s, z13.s, z0.s
	sub	z0.s, z13.s, z0.s
	add	z13.s, z9.s, z12.s
	sub	z9.s, z9.s, z12.s
	add	z12.s, z1.s, z24.s
	sub	z1.s, z1.s, z24.s
	sqrshrnb	z24.h, z12.s, #7
	sqrshrnb	z12.h, z1.s, #7
	uzp1	z1.h, z12.h, z12.h
	ptrue	p4.h, vl8
	add	z12.s, z2.s, z25.s
	sub	z25.s, z2.s, z25.s
	sqrshrnb	z2.h, z12.s, #7
	uzp1	z12.h, z2.h, z2.h
	sqrshrnb	z25.h, z25.s, #7
	uzp1	z24.h, z24.h, z24.h
	uzp1	z2.h, z25.h, z25.h
	splice	z24.h, p4, z24.h, z12.h
	movprfx	z12, z2
	splice	z12.h, p4, z12.h, z1.h
	add	z1.s, z3.s, z26.s
	sub	z3.s, z3.s, z26.s
	sqrshrnb	z26.h, z1.s, #7
	sqrshrnb	z25.h, z3.s, #7
	add	z3.s, z11.s, z27.s
	uzp1	z1.h, z25.h, z25.h
	sub	z27.s, z11.s, z27.s
	uzp1	z2.h, z26.h, z26.h
	sqrshrnb	z11.h, z3.s, #7
	sqrshrnb	z25.h, z27.s, #7
	uzp1	z26.h, z11.h, z11.h
	uzp1	z3.h, z25.h, z25.h
	splice	z2.h, p4, z2.h, z26.h
	splice	z3.h, p4, z3.h, z1.h
	uzp1	z1.h, z24.h, z2.h
	uzp2	z2.h, z24.h, z2.h
	add	z24.s, z4.s, z28.s
	sub	z4.s, z4.s, z28.s
	sqrshrnb	z28.h, z24.s, #7
	sqrshrnb	z11.h, z4.s, #7
	add	z25.s, z8.s, z29.s
	uzp1	z27.h, z28.h, z28.h
	sub	z29.s, z8.s, z29.s
	add	z28.s, z5.s, z30.s
	sqrshrnb	z8.h, z25.s, #7
	sqrshrnb	z4.h, z29.s, #7
	uzp1	z24.h, z8.h, z8.h
	add	x20, sp, 224
	splice	z27.h, p4, z27.h, z24.h
	ldr	z24, [x20]
	uzp1	z26.h, z11.h, z11.h
	add	z29.s, z13.s, z24.s
	sub	z5.s, z5.s, z30.s
	sub	z13.s, z13.s, z24.s
	sqrshrnb	z30.h, z28.s, #7
	sqrshrnb	z25.h, z5.s, #7
	addvl	x30, sp, #1
	uzp1	z8.h, z25.h, z25.h
	uzp1	z11.h, z4.h, z4.h
	sqrshrnb	z4.h, z29.s, #7
	uzp1	z28.h, z4.h, z4.h
	splice	z11.h, p4, z11.h, z26.h
	sqrshrnb	z5.h, z13.s, #7
	add	x30, x30, 224
	addvl	x14, sp, #2
	addvl	x11, sp, #3
	uzp1	z26.h, z30.h, z30.h
	uzp1	z29.h, z5.h, z5.h
	splice	z26.h, p4, z26.h, z28.h
	splice	z29.h, p4, z29.h, z8.h
	ldr	z8, [x30]
	uzp2	z30.h, z27.h, z26.h
	uzp1	z25.h, z27.h, z26.h
	add	z27.s, z9.s, z8.s
	sub	z9.s, z9.s, z8.s
	sqrshrnb	z24.h, z27.s, #7
	sqrshrnb	z13.h, z9.s, #7
	uzp1	z28.h, z13.h, z13.h
	uzp1	z26.h, z1.h, z25.h
	add	x14, x14, 224
	ldr	z5, [x14]
	uzp2	z1.h, z1.h, z25.h
	add	x11, x11, 224
	add	z25.s, z0.s, z5.s
	addvl	x19, sp, #4
	sub	z0.s, z0.s, z5.s
	sqrshrnb	z8.h, z25.s, #7
	sqrshrnb	z9.h, z0.s, #7
	uzp1	z27.h, z8.h, z8.h
	uzp1	z4.h, z24.h, z24.h
	uzp1	z13.h, z9.h, z9.h
	splice	z13.h, p4, z13.h, z28.h
	ldr	z28, [x11]
	add	z24.s, z21.s, z28.s
	splice	z4.h, p4, z4.h, z27.h
	sub	z21.s, z21.s, z28.s
	sqrshrnb	z5.h, z24.s, #7
	sqrshrnb	z0.h, z21.s, #7
	add	x19, x19, 224
	ldr	z27, [x19]
	uzp1	z8.h, z0.h, z0.h
	add	z9.s, z23.s, z27.s
	addvl	x4, sp, #5
	sub	z23.s, z23.s, z27.s
	sqrshrnb	z28.h, z9.s, #7
	uzp1	z25.h, z5.h, z5.h
	uzp1	z24.h, z28.h, z28.h
	splice	z25.h, p4, z25.h, z24.h
	sqrshrnb	z21.h, z23.s, #7
	add	x4, x4, 224
	ldr	z5, [x4]
	addvl	x7, sp, #6
	addvl	x6, sp, #7
	uzp1	z0.h, z21.h, z21.h
	splice	z0.h, p4, z0.h, z8.h
	uzp1	z8.h, z4.h, z25.h
	uzp2	z4.h, z4.h, z25.h
	add	z25.s, z6.s, z5.s
	sub	z6.s, z6.s, z5.s
	sqrshrnb	z27.h, z25.s, #7
	sqrshrnb	z23.h, z6.s, #7
	uzp1	z28.h, z23.h, z23.h
	add	x7, x7, 224
	ldr	z24, [x7]
	add	x6, x6, 224
	add	z21.s, z10.s, z24.s
	addvl	x5, sp, #8
	sub	z10.s, z10.s, z24.s
	sqrshrnb	z5.h, z21.s, #7
	sqrshrnb	z6.h, z10.s, #7
	uzp1	z9.h, z27.h, z27.h
	uzp1	z23.h, z6.h, z6.h
	splice	z23.h, p4, z23.h, z28.h
	ldr	z28, [x6]
	add	z27.s, z7.s, z28.s
	uzp1	z25.h, z5.h, z5.h
	sub	z7.s, z7.s, z28.s
	splice	z9.h, p4, z9.h, z25.h
	sqrshrnb	z24.h, z27.s, #7
	add	x5, x5, 224
	ldr	z5, [x5]
	addvl	x3, sp, #10
	add	z6.s, z22.s, z5.s
	uzp1	z21.h, z24.h, z24.h
	sqrshrnb	z28.h, z6.s, #7
	uzp1	z27.h, z28.h, z28.h
	splice	z21.h, p4, z21.h, z27.h
	sqrshrnb	z10.h, z7.s, #7
	uzp1	z24.h, z9.h, z21.h
	uzp1	z25.h, z10.h, z10.h
	sub	z22.s, z22.s, z5.s
	add	x3, x3, 224
	uzp2	z5.h, z9.h, z21.h
	addvl	x20, sp, #10
	uzp1	z9.h, z8.h, z24.h
	uzp1	z21.h, z26.h, z9.h
	str	z21, [x3]
	uzp2	z6.h, z26.h, z9.h
	sqrshrnb	z7.h, z22.s, #7
	uzp2	z26.h, z4.h, z5.h
	add	x20, x20, 288
	addvl	x30, sp, #10
	uzp1	z10.h, z7.h, z7.h
	splice	z10.h, p4, z10.h, z25.h
	uzp1	z25.h, z2.h, z30.h
	uzp2	z2.h, z2.h, z30.h
	uzp1	z30.h, z4.h, z5.h
	uzp1	z4.h, z25.h, z30.h
	str	z4, [x20]
	uzp2	z8.h, z8.h, z24.h
	add	x10, x0, 80
	uzp2	z22.h, z1.h, z8.h
	add	x30, x30, 352
	uzp1	z1.h, z1.h, z8.h
	addvl	x14, sp, #10
	str	z1, [x30]
	uzp1	z27.h, z2.h, z26.h
	add	x8, x0, 208
	add	x14, x14, 416
	str	z27, [x14]
	ldr	z24, [x10]
	addvl	x10, sp, #10
	add	x10, x10, 480
	str	z6, [x10]
	ldr	z5, [x8]
	addvl	x8, sp, #10
	uzp2	z28.h, z25.h, z30.h
	addvl	x11, sp, #10
	add	x8, x8, 544
	str	z28, [x8]
	add	x11, x11, 608
	addvl	x19, sp, #10
	addvl	x4, sp, #10
	str	z22, [x11]
	uzp1	z8.h, z10.h, z23.h
	uzp1	z6.h, z0.h, z13.h
	uzp1	z9.h, z3.h, z12.h
	uzp2	z7.h, z2.h, z26.h
	uzp1	z1.h, z29.h, z11.h
	uzp2	z0.h, z0.h, z13.h
	uzp2	z29.h, z29.h, z11.h
	uzp2	z12.h, z3.h, z12.h
	uzp1	z11.h, z1.h, z9.h
	uzp1	z3.h, z8.h, z6.h
	add	x19, x19, 672
	add	x4, x4, 256
	addvl	x7, sp, #10
	uzp1	z13.h, z3.h, z11.h
	str	z7, [x19]
	str	z13, [x4]
	uzp2	z10.h, z10.h, z23.h
	uzp1	z2.h, z29.h, z12.h
	uzp1	z22.h, z10.h, z0.h
	add	x7, x7, 320
	addvl	x6, sp, #10
	uzp1	z23.h, z22.h, z2.h
	str	z23, [x7]
	uzp2	z4.h, z8.h, z6.h
	uzp2	z27.h, z1.h, z9.h
	add	x6, x6, 384
	addvl	x5, sp, #10
	uzp1	z25.h, z4.h, z27.h
	str	z25, [x6]
	uzp2	z30.h, z10.h, z0.h
	uzp2	z7.h, z29.h, z12.h
	add	x5, x5, 448
	addvl	x3, sp, #10
	uzp1	z26.h, z30.h, z7.h
	str	z26, [x5]
	add	x3, x3, 512
	addvl	x20, sp, #10
	uzp2	z28.h, z3.h, z11.h
	str	z28, [x3]
	zip1	z21.h, z24.h, z5.h
	add	x20, x20, 576
	addvl	x30, sp, #10
	uzp2	z24.h, z22.h, z2.h
	str	z24, [x20]
	add	x30, x30, 640
	addvl	x14, sp, #10
	uzp2	z5.h, z4.h, z27.h
	str	z5, [x30]
	add	x14, x14, 704
	uzp2	z8.h, z30.h, z7.h
	str	z8, [x14]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z16.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z17.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z18.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z19.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z20.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z21.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z18.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z19.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z20.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z21.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z18.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z19.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z20.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z21.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z18.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z19.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z20.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z21.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z18.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z19.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z20.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z18.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z19.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z20.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z21.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z14.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z15.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z18.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z19.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	add	x21, sp, 224
	str	z2, [x21]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z18.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z19.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #1
	add	x22, x22, 224
	str	z22, [x22]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z21.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z14.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z15.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z16.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z18.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z19.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #2
	add	x24, x24, 224
	str	z13, [x24]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z16.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z17.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z18.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z19.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #3
	add	x26, x26, 224
	str	z12, [x26]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z21.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z16.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z17.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z18.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z19.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x28, sp, #4
	add	x28, x28, 224
	str	z11, [x28]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z16.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z17.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z18.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z19.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #5
	add	x18, x18, 224
	str	z10, [x18]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z21.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z16.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z17.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z18.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z19.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #6
	add	x17, x17, 224
	str	z9, [x17]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z21.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z16.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z18.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z19.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x15, sp, #7
	add	x15, x15, 224
	str	z8, [x15]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z21.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z16.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z18.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z19.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x12, sp, #8
	adrp	x9, _ZL6CDOT_O+3840
	add	x12, x12, 224
	add	x23, x9, :lo12:_ZL6CDOT_O+3840
	str	z7, [x12]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z21.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z16.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z17.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z18.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z19.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z3.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x25, sp, #9
	add	x27, x0, 144
	ldr	z2, [x27]
	add	x25, x25, 224
	add	x16, x0, 400
	ldr	z20, [x16]
	add	x13, x0, 656
	ldr	z12, [x13]
	add	x10, x0, 912
	ldr	z10, [x10]
	add	x8, x0, 1168
	ldr	z23, [x8]
	add	x11, x0, 1424
	ldr	z8, [x11]
	add	x19, x0, 1680
	ldr	z4, [x19]
	add	x4, x0, 1936
	ldr	z24, [x4]
	adrp	x7, .LANCHOR0
	zip1	z25.h, z2.h, z20.h
	zip1	z5.h, z12.h, z10.h
	zip1	z13.h, z23.h, z8.h
	zip1	z11.h, z4.h, z24.h
	add	x3, x7, :lo12:.LANCHOR0
	str	z22, [x25]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z25.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z3.h
// 0 "" 2
#NO_APP
	add	x30, x3, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z25.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z11.h, z16.h
// 0 "" 2
#NO_APP
	add	x22, x3, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z25.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z2.h
// 0 "" 2
#NO_APP
	add	x24, x3, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z25.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	add	x26, x3, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z25.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z6.h
// 0 "" 2
#NO_APP
	add	x28, x3, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z25.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z14.h
// 0 "" 2
#NO_APP
	add	x12, x3, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z25.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z2.h
// 0 "" 2
#NO_APP
	add	x6, x3, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z25.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z13.h
// 0 "" 2
#NO_APP
	add	x20, x0, 272
	ldr	z11, [x20]
	add	x14, x0, 784
	ldr	z10, [x14]
	add	x21, x0, 1296
	ldr	z4, [x21]
	add	x5, x0, 1808
	ldr	z24, [x5]
	add	x9, x3, 1024
	zip1	z23.h, z11.h, z10.h
	zip1	z9.h, z4.h, z24.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z23.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x15, x3, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z23.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x25, x3, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z23.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z9.h, z2.h
// 0 "" 2
#NO_APP
	add	x27, x3, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z23.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z5.h
// 0 "" 2
#NO_APP
	add	x18, x0, 528
	ldr	z13, [x18]
	add	x17, x0, 1552
	ldr	z11, [x17]
	add	x16, x3, 1280
	zip1	z10.h, z13.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z24.h
// 0 "" 2
#NO_APP
	add	x13, x3, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z9.h
// 0 "" 2
#NO_APP
	add	x10, x0, 16
	ldr	z1, [x10]
	add	x8, x0, 1040
	ldr	z14, [x8]
	add	x11, x3, 1344
	zip1	z16.h, z1.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	add	x19, x3, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x0, 96
	ldr	z5, [x4]
	add	x20, x0, 352
	ldr	z11, [x20]
	add	x21, x0, 608
	ldr	z1, [x21]
	add	x7, x0, 224
	ldr	z13, [x7]
	add	x14, x0, 480
	ldr	z10, [x14]
	add	x5, x0, 736
	ldr	z14, [x5]
	add	x17, x0, 992
	ldr	z16, [x17]
	add	x10, x0, 1120
	add	x4, x0, 1376
	zip1	z9.h, z5.h, z13.h
	ldr	z5, [x10]
	zip1	z10.h, z11.h, z10.h
	zip1	z11.h, z1.h, z14.h
	ldr	z1, [x4]
	add	x18, x0, 864
	ldr	z15, [x18]
	add	x8, x0, 1248
	ldr	z13, [x8]
	add	x7, x0, 1504
	ldr	z14, [x7]
	add	x14, x0, 1760
	add	x21, x0, 1888
	zip1	z12.h, z15.h, z16.h
	ldr	z16, [x14]
	add	x5, x0, 2016
	zip1	z13.h, z5.h, z13.h
	ldr	z5, [x5]
	zip1	z14.h, z1.h, z14.h
	ldr	z1, [x21]
	add	x20, x0, 1632
	ldr	z15, [x20]
	zip1	z15.h, z15.h, z16.h
	zip1	z16.h, z1.h, z5.h
	sub	z1.s, z2.s, z23.s
	add	z5.s, z2.s, z23.s
	add	z23.s, z24.s, z6.s
	add	z2.s, z5.s, z3.s
	sub	z24.s, z24.s, z6.s
	sub	z5.s, z5.s, z3.s
	add	z3.s, z23.s, z25.s
	sub	z25.s, z23.s, z25.s
	sub	z23.s, z24.s, z4.s
	add	z6.s, z24.s, z4.s
	add	z4.s, z1.s, z31.s
	sub	z24.s, z23.s, z20.s
	sub	z31.s, z1.s, z31.s
	add	z1.s, z2.s, z7.s
	sub	z2.s, z2.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z6.s, z17.s
	sub	z6.s, z6.s, z17.s
	add	z17.s, z4.s, z18.s
	sub	z4.s, z4.s, z18.s
	add	z18.s, z31.s, z19.s
	sub	z31.s, z31.s, z19.s
	add	z19.s, z23.s, z20.s
	add	z20.s, z25.s, z21.s
	sub	z23.s, z25.s, z21.s
	add	z21.s, z5.s, z22.s
	sub	z5.s, z5.s, z22.s
	add	z22.s, z1.s, z0.s
	sub	z0.s, z1.s, z0.s
	sqrshrnb	z25.h, z22.s, #7
	sqrshrnb	z1.h, z0.s, #7
	add	z22.s, z7.s, z26.s
	uzp1	z0.h, z1.h, z1.h
	sub	z26.s, z7.s, z26.s
	sqrshrnb	z7.h, z22.s, #7
	sqrshrnb	z22.h, z26.s, #7
	uzp1	z1.h, z7.h, z7.h
	uzp1	z26.h, z22.h, z22.h
	movprfx	z7, z26
	splice	z7.h, p4, z7.h, z0.h
	add	z0.s, z8.s, z27.s
	uzp1	z25.h, z25.h, z25.h
	sub	z8.s, z8.s, z27.s
	splice	z25.h, p4, z25.h, z1.h
	sqrshrnb	z27.h, z0.s, #7
	sqrshrnb	z22.h, z8.s, #7
	uzp1	z0.h, z22.h, z22.h
	add	z26.s, z17.s, z28.s
	uzp1	z1.h, z27.h, z27.h
	sub	z28.s, z17.s, z28.s
	sqrshrnb	z17.h, z26.s, #7
	sqrshrnb	z27.h, z28.s, #7
	uzp1	z8.h, z17.h, z17.h
	uzp1	z22.h, z27.h, z27.h
	splice	z1.h, p4, z1.h, z8.h
	splice	z22.h, p4, z22.h, z0.h
	uzp1	z0.h, z25.h, z1.h
	uzp2	z1.h, z25.h, z1.h
	add	z25.s, z18.s, z29.s
	add	z8.s, z19.s, z30.s
	sub	z18.s, z18.s, z29.s
	sub	z30.s, z19.s, z30.s
	sqrshrnb	z29.h, z25.s, #7
	sqrshrnb	z26.h, z18.s, #7
	sqrshrnb	z19.h, z8.s, #7
	sqrshrnb	z25.h, z30.s, #7
	uzp1	z27.h, z19.h, z19.h
	addvl	x8, sp, #1
	add	x10, sp, 224
	ldr	z18, [x10]
	uzp1	z17.h, z26.h, z26.h
	add	x8, x8, 224
	addvl	x4, sp, #2
	uzp1	z28.h, z29.h, z29.h
	uzp1	z19.h, z25.h, z25.h
	splice	z28.h, p4, z28.h, z27.h
	ldr	z27, [x8]
	add	z29.s, z20.s, z18.s
	add	z25.s, z21.s, z27.s
	sub	z20.s, z20.s, z18.s
	sqrshrnb	z26.h, z29.s, #7
	sqrshrnb	z8.h, z20.s, #7
	splice	z19.h, p4, z19.h, z17.h
	uzp1	z30.h, z8.h, z8.h
	sub	z21.s, z21.s, z27.s
	sqrshrnb	z18.h, z25.s, #7
	add	x4, x4, 224
	ldr	z8, [x4]
	uzp1	z29.h, z18.h, z18.h
	addvl	x7, sp, #3
	addvl	x20, sp, #4
	uzp1	z17.h, z26.h, z26.h
	sqrshrnb	z20.h, z21.s, #7
	splice	z17.h, p4, z17.h, z29.h
	uzp1	z26.h, z28.h, z17.h
	uzp2	z17.h, z28.h, z17.h
	add	z28.s, z5.s, z8.s
	sub	z5.s, z5.s, z8.s
	sqrshrnb	z27.h, z28.s, #7
	sqrshrnb	z25.h, z5.s, #7
	add	x7, x7, 224
	uzp1	z18.h, z25.h, z25.h
	add	x20, x20, 224
	addvl	x14, sp, #5
	uzp1	z21.h, z20.h, z20.h
	ldr	z20, [x7]
	splice	z21.h, p4, z21.h, z30.h
	uzp1	z29.h, z27.h, z27.h
	ldr	z27, [x20]
	uzp1	z30.h, z0.h, z26.h
	add	z25.s, z24.s, z27.s
	uzp2	z0.h, z0.h, z26.h
	add	z26.s, z23.s, z20.s
	sub	z23.s, z23.s, z20.s
	sqrshrnb	z8.h, z26.s, #7
	sqrshrnb	z5.h, z23.s, #7
	uzp1	z28.h, z8.h, z8.h
	sub	z24.s, z24.s, z27.s
	splice	z29.h, p4, z29.h, z28.h
	sqrshrnb	z26.h, z24.s, #7
	add	x14, x14, 224
	ldr	z28, [x14]
	uzp1	z8.h, z26.h, z26.h
	addvl	x21, sp, #6
	adrp	x18, _ZL6CDOT_O
	uzp1	z23.h, z5.h, z5.h
	add	z5.s, z31.s, z28.s
	splice	z23.h, p4, z23.h, z18.h
	sqrshrnb	z27.h, z5.s, #7
	sqrshrnb	z18.h, z25.s, #7
	uzp1	z25.h, z27.h, z27.h
	uzp1	z20.h, z18.h, z18.h
	splice	z20.h, p4, z20.h, z25.h
	sub	z31.s, z31.s, z28.s
	uzp1	z26.h, z29.h, z20.h
	uzp2	z28.h, z29.h, z20.h
	sqrshrnb	z24.h, z31.s, #7
	add	x17, x18, :lo12:_ZL6CDOT_O
	add	x21, x21, 224
	ldr	z29, [x21]
	addvl	x5, sp, #7
	add	z18.s, z4.s, z29.s
	addvl	x18, sp, #8
	sub	z4.s, z4.s, z29.s
	sqrshrnb	z20.h, z18.s, #7
	uzp1	z5.h, z24.h, z24.h
	splice	z5.h, p4, z5.h, z8.h
	sqrshrnb	z8.h, z4.s, #7
	add	x5, x5, 224
	ldr	z24, [x5]
	uzp1	z25.h, z8.h, z8.h
	add	z31.s, z6.s, z24.s
	add	x18, x18, 224
	sub	z6.s, z6.s, z24.s
	sqrshrnb	z29.h, z31.s, #7
	addvl	x10, sp, #9
	uzp1	z18.h, z29.h, z29.h
	uzp1	z27.h, z20.h, z20.h
	ldr	z20, [x18]
	sqrshrnb	z4.h, z6.s, #7
	add	z8.s, z3.s, z20.s
	splice	z27.h, p4, z27.h, z18.h
	sub	z3.s, z3.s, z20.s
	add	x10, x10, 224
	ldr	z18, [x10]
	sqrshrnb	z31.h, z3.s, #7
	addvl	x8, sp, #10
	uzp1	z6.h, z4.h, z4.h
	add	z4.s, z2.s, z18.s
	splice	z6.h, p4, z6.h, z25.h
	sqrshrnb	z20.h, z4.s, #7
	sqrshrnb	z25.h, z8.s, #7
	uzp1	z8.h, z20.h, z20.h
	uzp1	z24.h, z25.h, z25.h
	splice	z24.h, p4, z24.h, z8.h
	uzp1	z29.h, z31.h, z31.h
	uzp2	z4.h, z27.h, z24.h
	uzp1	z31.h, z27.h, z24.h
	add	x8, x8, 736
	uzp1	z27.h, z26.h, z31.h
	addvl	x4, sp, #10
	uzp1	z24.h, z30.h, z27.h
	str	z24, [x8]
	sub	z2.s, z2.s, z18.s
	add	x4, x4, 800
	uzp2	z18.h, z30.h, z27.h
	sqrshrnb	z3.h, z2.s, #7
	addvl	x7, sp, #10
	uzp1	z25.h, z3.h, z3.h
	splice	z25.h, p4, z25.h, z29.h
	uzp1	z29.h, z1.h, z17.h
	uzp2	z1.h, z1.h, z17.h
	uzp1	z17.h, z28.h, z4.h
	uzp1	z30.h, z29.h, z17.h
	str	z30, [x4]
	uzp2	z26.h, z26.h, z31.h
	add	x7, x7, 864
	uzp2	z20.h, z0.h, z26.h
	addvl	x20, sp, #10
	uzp1	z0.h, z0.h, z26.h
	str	z0, [x7]
	uzp2	z28.h, z28.h, z4.h
	add	x20, x20, 928
	uzp1	z8.h, z1.h, z28.h
	addvl	x14, sp, #10
	str	z8, [x20]
	add	x14, x14, 992
	addvl	x21, sp, #10
	str	z18, [x14]
	uzp2	z2.h, z29.h, z17.h
	add	x21, x21, 1056
	addvl	x5, sp, #10
	addvl	x18, sp, #10
	str	z2, [x21]
	uzp2	z3.h, z1.h, z28.h
	add	x5, x5, 1120
	add	x18, x18, 1184
	str	z20, [x5]
	addvl	x10, sp, #10
	str	z3, [x18]
	uzp1	z4.h, z25.h, z6.h
	uzp1	z18.h, z5.h, z23.h
	uzp1	z29.h, z21.h, z19.h
	uzp1	z1.h, z22.h, z7.h
	uzp2	z19.h, z21.h, z19.h
	uzp2	z7.h, z22.h, z7.h
	uzp1	z27.h, z29.h, z1.h
	uzp1	z22.h, z4.h, z18.h
	add	x10, x10, 768
	addvl	x8, sp, #10
	uzp1	z21.h, z22.h, z27.h
	str	z21, [x10]
	uzp2	z6.h, z25.h, z6.h
	uzp2	z5.h, z5.h, z23.h
	uzp1	z26.h, z19.h, z7.h
	uzp1	z24.h, z6.h, z5.h
	add	x8, x8, 832
	addvl	x4, sp, #10
	uzp1	z23.h, z24.h, z26.h
	str	z23, [x8]
	uzp2	z17.h, z4.h, z18.h
	uzp2	z30.h, z29.h, z1.h
	add	x4, x4, 896
	addvl	x7, sp, #10
	uzp1	z25.h, z17.h, z30.h
	str	z25, [x4]
	uzp2	z31.h, z6.h, z5.h
	uzp2	z2.h, z19.h, z7.h
	add	x7, x7, 960
	addvl	x20, sp, #10
	uzp1	z28.h, z31.h, z2.h
	str	z28, [x7]
	add	x20, x20, 1024
	addvl	x14, sp, #10
	uzp2	z20.h, z22.h, z27.h
	str	z20, [x20]
	add	x14, x14, 1088
	addvl	x21, sp, #10
	uzp2	z0.h, z24.h, z26.h
	str	z0, [x14]
	add	x21, x21, 1152
	addvl	x5, sp, #10
	uzp2	z8.h, z17.h, z30.h
	str	z8, [x21]
	add	x5, x5, 1216
	uzp2	z3.h, z31.h, z2.h
	str	z3, [x5]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z10.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z12.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+256
	add	x18, x17, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+512
	add	x8, x10, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+768
	add	x7, x4, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+1024
	add	x14, x20, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+1280
	add	x5, x21, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+1536
	add	x18, x17, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+1792
	add	x8, x10, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2048
	add	x7, x4, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+2304
	add	x14, x20, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+2560
	add	x5, x21, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z10.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+2816
	add	x18, x17, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z10.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+3072
	add	x8, x10, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+3328
	add	x7, x4, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z10.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+3584
	add	x14, x20, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z11.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	add	x21, sp, 224
	str	z5, [x21]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z6.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #1
	add	x5, x0, 160
	ldr	z16, [x5]
	add	x23, x23, 224
	add	x17, x0, 416
	ldr	z7, [x17]
	add	x18, x0, 672
	ldr	z2, [x18]
	add	x10, x0, 928
	ldr	z31, [x10]
	add	x8, x0, 1184
	ldr	z8, [x8]
	add	x4, x0, 1440
	ldr	z3, [x4]
	add	x7, x0, 1696
	ldr	z4, [x7]
	add	x20, x0, 1952
	ldr	z1, [x20]
	zip1	z18.h, z16.h, z7.h
	zip1	z9.h, z2.h, z31.h
	zip1	z10.h, z8.h, z3.h
	zip1	z11.h, z4.h, z1.h
	str	z5, [x23]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z18.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z11.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 224
	str	z8, [x3]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z18.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z9.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z10.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z18.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z10.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z18.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z10.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z18.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z9.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z10.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z18.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z18.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z18.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z10.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	add	x30, x0, 288
	ldr	z11, [x30]
	add	x22, x0, 800
	ldr	z12, [x22]
	add	x24, x0, 1312
	ldr	z13, [x24]
	add	x26, x0, 1824
	ldr	z14, [x26]
	zip1	z8.h, z11.h, z12.h
	zip1	z31.h, z13.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z31.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z31.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z31.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z31.h, z8.h
// 0 "" 2
#NO_APP
	add	x28, x0, 544
	ldr	z31, [x28]
	add	x12, x0, 1568
	ldr	z9, [x12]
	zip1	z12.h, z31.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z12.h, z16.h
// 0 "" 2
#NO_APP
	add	x6, x0, 32
	ldr	z8, [x6]
	add	x9, x0, 1056
	ldr	z31, [x9]
	zip1	z9.h, z8.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	add	z9.s, z16.s, z10.s
	addvl	x20, sp, #2
	sub	z16.s, z16.s, z10.s
	add	z10.s, z31.s, z11.s
	sub	z8.s, z31.s, z11.s
	add	z12.s, z10.s, z13.s
	add	z11.s, z9.s, z18.s
	add	x20, x20, 224
	sub	z18.s, z9.s, z18.s
	sub	z9.s, z10.s, z13.s
	ldr	z10, [x20]
	add	z13.s, z8.s, z14.s
	sub	z31.s, z8.s, z14.s
	add	z8.s, z12.s, z1.s
	add	z14.s, z16.s, z15.s
	sub	z12.s, z12.s, z1.s
	sub	z16.s, z16.s, z15.s
	add	z1.s, z13.s, z2.s
	add	z15.s, z11.s, z10.s
	sub	z13.s, z13.s, z2.s
	sub	z11.s, z11.s, z10.s
	add	z2.s, z14.s, z3.s
	sub	z10.s, z9.s, z6.s
	sub	z14.s, z14.s, z3.s
	add	z3.s, z16.s, z4.s
	sub	z16.s, z16.s, z4.s
	add	z4.s, z31.s, z5.s
	sub	z31.s, z31.s, z5.s
	add	z5.s, z9.s, z6.s
	add	z6.s, z18.s, z7.s
	sub	z9.s, z18.s, z7.s
	add	z7.s, z15.s, z17.s
	sub	z18.s, z15.s, z17.s
	sqrshrnb	z17.h, z7.s, #7
	sqrshrnb	z15.h, z18.s, #7
	add	z7.s, z8.s, z0.s
	uzp1	z18.h, z15.h, z15.h
	sub	z0.s, z8.s, z0.s
	sqrshrnb	z8.h, z7.s, #7
	sqrshrnb	z7.h, z0.s, #7
	uzp1	z15.h, z8.h, z8.h
	uzp1	z0.h, z7.h, z7.h
	splice	z0.h, p4, z0.h, z18.h
	add	z18.s, z1.s, z19.s
	uzp1	z17.h, z17.h, z17.h
	sub	z1.s, z1.s, z19.s
	splice	z17.h, p4, z17.h, z15.h
	sqrshrnb	z19.h, z18.s, #7
	sqrshrnb	z15.h, z1.s, #7
	uzp1	z8.h, z19.h, z19.h
	uzp1	z7.h, z15.h, z15.h
	add	z18.s, z2.s, z20.s
	sub	z2.s, z2.s, z20.s
	sqrshrnb	z20.h, z18.s, #7
	sqrshrnb	z19.h, z2.s, #7
	uzp1	z1.h, z20.h, z20.h
	movprfx	z15, z8
	splice	z15.h, p4, z15.h, z1.h
	uzp1	z8.h, z19.h, z19.h
	uzp2	z2.h, z17.h, z15.h
	splice	z8.h, p4, z8.h, z7.h
	uzp1	z7.h, z17.h, z15.h
	add	z17.s, z3.s, z21.s
	sub	z3.s, z3.s, z21.s
	sqrshrnb	z21.h, z17.s, #7
	sqrshrnb	z18.h, z3.s, #7
	add	z15.s, z4.s, z22.s
	uzp1	z1.h, z18.h, z18.h
	sub	z4.s, z4.s, z22.s
	uzp1	z20.h, z21.h, z21.h
	sqrshrnb	z22.h, z15.s, #7
	add	z21.s, z5.s, z23.s
	uzp1	z19.h, z22.h, z22.h
	sqrshrnb	z17.h, z4.s, #7
	splice	z20.h, p4, z20.h, z19.h
	sub	z5.s, z5.s, z23.s
	add	z4.s, z6.s, z24.s
	sqrshrnb	z23.h, z21.s, #7
	sub	z6.s, z6.s, z24.s
	uzp1	z18.h, z23.h, z23.h
	sqrshrnb	z24.h, z4.s, #7
	uzp1	z3.h, z17.h, z17.h
	uzp1	z22.h, z24.h, z24.h
	splice	z3.h, p4, z3.h, z1.h
	movprfx	z19, z18
	splice	z19.h, p4, z19.h, z22.h
	sqrshrnb	z1.h, z5.s, #7
	uzp1	z21.h, z20.h, z19.h
	uzp1	z15.h, z1.h, z1.h
	uzp1	z23.h, z7.h, z21.h
	sqrshrnb	z17.h, z6.s, #7
	uzp2	z7.h, z7.h, z21.h
	add	z18.s, z9.s, z25.s
	add	z21.s, z16.s, z28.s
	sub	z9.s, z9.s, z25.s
	add	z6.s, z10.s, z26.s
	sqrshrnb	z25.h, z18.s, #7
	sub	z10.s, z10.s, z26.s
	sub	z16.s, z16.s, z28.s
	sqrshrnb	z26.h, z6.s, #7
	add	z28.s, z14.s, z29.s
	addvl	x22, sp, #1
	uzp1	z5.h, z17.h, z17.h
	splice	z5.h, p4, z5.h, z15.h
	sqrshrnb	z15.h, z9.s, #7
	uzp1	z4.h, z15.h, z15.h
	uzp2	z20.h, z20.h, z19.h
	add	z17.s, z31.s, z27.s
	add	x3, sp, 224
	uzp1	z1.h, z25.h, z25.h
	uzp1	z24.h, z26.h, z26.h
	add	z25.s, z13.s, z30.s
	sqrshrnb	z19.h, z10.s, #7
	sub	z31.s, z31.s, z27.s
	ldr	z27, [x3]
	sqrshrnb	z6.h, z25.s, #7
	add	x22, x22, 224
	ldr	z18, [x22]
	addvl	x24, sp, #10
	uzp1	z9.h, z19.h, z19.h
	sub	z14.s, z14.s, z29.s
	splice	z9.h, p4, z9.h, z4.h
	add	z29.s, z11.s, z18.s
	sqrshrnb	z4.h, z28.s, #7
	sqrshrnb	z26.h, z29.s, #7
	sub	z13.s, z13.s, z30.s
	add	z30.s, z12.s, z27.s
	sqrshrnb	z10.h, z30.s, #7
	uzp1	z28.h, z10.h, z10.h
	movprfx	z22, z1
	splice	z22.h, p4, z22.h, z24.h
	sqrshrnb	z15.h, z21.s, #7
	sqrshrnb	z1.h, z17.s, #7
	uzp1	z19.h, z15.h, z15.h
	uzp1	z21.h, z6.h, z6.h
	add	x24, x24, 1248
	addvl	x26, sp, #10
	sub	z12.s, z12.s, z27.s
	uzp1	z24.h, z1.h, z1.h
	uzp1	z27.h, z26.h, z26.h
	splice	z24.h, p4, z24.h, z19.h
	movprfx	z25, z28
	splice	z25.h, p4, z25.h, z27.h
	uzp1	z17.h, z4.h, z4.h
	sub	z11.s, z11.s, z18.s
	splice	z17.h, p4, z17.h, z21.h
	uzp1	z4.h, z22.h, z24.h
	uzp1	z6.h, z17.h, z25.h
	uzp1	z28.h, z4.h, z6.h
	uzp1	z26.h, z23.h, z28.h
	str	z26, [x24]
	uzp1	z21.h, z2.h, z20.h
	uzp2	z29.h, z17.h, z25.h
	sqrshrnb	z18.h, z11.s, #7
	uzp2	z22.h, z22.h, z24.h
	add	x26, x26, 1312
	uzp1	z17.h, z22.h, z29.h
	addvl	x28, sp, #10
	uzp1	z11.h, z21.h, z17.h
	sqrshrnb	z12.h, z12.s, #7
	str	z11, [x26]
	uzp2	z27.h, z4.h, z6.h
	sqrshrnb	z30.h, z16.s, #7
	add	x28, x28, 1376
	uzp1	z16.h, z12.h, z12.h
	addvl	x12, sp, #10
	uzp1	z12.h, z7.h, z27.h
	str	z12, [x28]
	uzp2	z24.h, z22.h, z29.h
	uzp2	z2.h, z2.h, z20.h
	sqrshrnb	z1.h, z31.s, #7
	add	x12, x12, 1440
	addvl	x6, sp, #10
	uzp1	z31.h, z18.h, z18.h
	uzp1	z18.h, z2.h, z24.h
	str	z18, [x12]
	uzp2	z23.h, z23.h, z28.h
	add	x6, x6, 1504
	addvl	x9, sp, #10
	adrp	x16, _ZL6CDOT_O
	sqrshrnb	z13.h, z13.s, #7
	str	z23, [x6]
	add	x30, x16, :lo12:_ZL6CDOT_O
	add	x9, x9, 1568
	addvl	x16, sp, #10
	uzp1	z15.h, z13.h, z13.h
	uzp2	z13.h, z21.h, z17.h
	str	z13, [x9]
	uzp2	z7.h, z7.h, z27.h
	add	x16, x16, 1632
	addvl	x20, sp, #10
	sqrshrnb	z14.h, z14.s, #7
	str	z7, [x16]
	uzp1	z20.h, z14.h, z14.h
	add	x20, x20, 1696
	uzp2	z14.h, z2.h, z24.h
	addvl	x3, sp, #10
	str	z14, [x20]
	uzp1	z19.h, z8.h, z0.h
	splice	z15.h, p4, z15.h, z20.h
	splice	z31.h, p4, z31.h, z16.h
	uzp1	z10.h, z5.h, z3.h
	uzp2	z0.h, z8.h, z0.h
	uzp2	z3.h, z5.h, z3.h
	uzp1	z8.h, z31.h, z15.h
	uzp1	z5.h, z10.h, z19.h
	add	x3, x3, 1280
	addvl	x22, sp, #10
	uzp1	z25.h, z30.h, z30.h
	uzp1	z30.h, z1.h, z1.h
	splice	z25.h, p4, z25.h, z30.h
	uzp1	z16.h, z25.h, z9.h
	uzp1	z4.h, z8.h, z16.h
	uzp1	z6.h, z4.h, z5.h
	str	z6, [x3]
	uzp2	z31.h, z31.h, z15.h
	uzp2	z9.h, z25.h, z9.h
	uzp1	z15.h, z3.h, z0.h
	uzp1	z22.h, z31.h, z9.h
	add	x22, x22, 1344
	uzp1	z29.h, z22.h, z15.h
	addvl	x24, sp, #10
	str	z29, [x22]
	uzp2	z1.h, z10.h, z19.h
	add	x24, x24, 1408
	uzp2	z10.h, z8.h, z16.h
	addvl	x26, sp, #10
	uzp1	z21.h, z10.h, z1.h
	str	z21, [x24]
	uzp2	z17.h, z3.h, z0.h
	uzp2	z28.h, z31.h, z9.h
	add	x26, x26, 1472
	addvl	x28, sp, #10
	uzp1	z27.h, z28.h, z17.h
	str	z27, [x26]
	uzp2	z2.h, z4.h, z5.h
	add	x28, x28, 1536
	addvl	x12, sp, #10
	str	z2, [x28]
	add	x25, x0, 112
	uzp2	z24.h, z22.h, z15.h
	add	x12, x12, 1600
	addvl	x6, sp, #10
	str	z24, [x12]
	uzp2	z19.h, z10.h, z1.h
	add	x27, x0, 240
	add	x17, x0, 1264
	add	x5, x0, 1776
	add	x6, x6, 1664
	str	z19, [x6]
	ldr	z3, [x25]
	ldr	z5, [x27]
	ldr	z7, [x17]
	ldr	z1, [x5]
	addvl	x25, sp, #10
	zip1	z4.h, z3.h, z5.h
	add	x19, x0, 368
	ldr	z18, [x19]
	add	x15, x0, 496
	ldr	z23, [x15]
	add	x14, x0, 624
	ldr	z11, [x14]
	add	x13, x0, 752
	ldr	z25, [x13]
	add	x21, x0, 880
	ldr	z12, [x21]
	add	x11, x0, 1008
	ldr	z26, [x11]
	add	x23, x0, 1136
	ldr	z13, [x23]
	add	x18, x0, 1392
	ldr	z14, [x18]
	add	x10, x0, 1520
	ldr	z0, [x10]
	add	x8, x0, 1648
	ldr	z8, [x8]
	add	x4, x0, 1904
	ldr	z16, [x4]
	add	x7, x0, 2032
	ldr	z30, [x7]
	add	x25, x25, 1728
	uzp2	z20.h, z28.h, z17.h
	zip1	z5.h, z13.h, z7.h
	zip1	z15.h, z8.h, z1.h
	zip1	z6.h, z18.h, z23.h
	zip1	z2.h, z11.h, z25.h
	zip1	z3.h, z12.h, z26.h
	zip1	z7.h, z14.h, z0.h
	zip1	z1.h, z16.h, z30.h
	str	z20, [x25]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x27, _ZL6CDOT_O+256
	add	x15, x27, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+512
	add	x14, x19, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+768
	add	x21, x13, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1024
	add	x23, x11, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+1280
	add	x16, x17, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+1536
	add	x10, x18, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+1792
	add	x9, x8, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2048
	add	x22, x5, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2304
	add	x7, x4, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+2560
	add	x24, x20, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x26, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+3072
	add	x28, sp, 224
	str	z12, [x28]
	add	x6, x12, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+3328
	add	x27, x25, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #1
	adrp	x13, _ZL6CDOT_O+3584
	add	x19, x19, 224
	add	x11, x13, :lo12:_ZL6CDOT_O+3584
	str	z16, [x19]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z1.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+3840
	add	x18, x17, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z8.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #2
	add	x4, x0, 176
	ldr	z1, [x4]
	add	x8, x8, 224
	add	x20, x0, 432
	ldr	z9, [x20]
	add	x3, x0, 688
	ldr	z29, [x3]
	add	x28, x0, 944
	ldr	z10, [x28]
	add	x12, x0, 1200
	ldr	z16, [x12]
	add	x25, x0, 1456
	ldr	z14, [x25]
	add	x27, x0, 1712
	ldr	z17, [x27]
	add	x19, x0, 1968
	ldr	z11, [x19]
	adrp	x5, .LANCHOR0
	zip1	z4.h, z1.h, z9.h
	zip1	z2.h, z29.h, z10.h
	zip1	z3.h, z16.h, z14.h
	zip1	z1.h, z17.h, z11.h
	add	x13, x5, :lo12:.LANCHOR0
	str	z13, [x8]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z7.h
// 0 "" 2
#NO_APP
	add	x11, x13, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x13, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z11.h
// 0 "" 2
#NO_APP
	add	x18, x13, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z7.h
// 0 "" 2
#NO_APP
	add	x8, x13, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x5, x13, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z5.h
// 0 "" 2
#NO_APP
	add	x4, x13, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x20, x13, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z3.h
// 0 "" 2
#NO_APP
	add	x3, x0, 304
	ldr	z6, [x3]
	add	x28, x0, 816
	ldr	z5, [x28]
	add	x12, x0, 1328
	ldr	z7, [x12]
	add	x25, x0, 1840
	ldr	z1, [x25]
	add	x27, x13, 1024
	zip1	z29.h, z6.h, z5.h
	zip1	z17.h, z7.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z29.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	add	x19, x13, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z29.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	add	x11, x13, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z29.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	add	x17, x13, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z29.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	add	x8, x0, 560
	ldr	z17, [x8]
	add	x18, x0, 1584
	ldr	z3, [x18]
	add	x5, x13, 1280
	zip1	z1.h, z17.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x13, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z29.h
// 0 "" 2
#NO_APP
	add	x20, x0, 48
	ldr	z1, [x20]
	add	x0, x0, 1072
	ldr	z17, [x0]
	add	x3, x13, 1344
	zip1	z1.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x13, x13, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x13, #0, MUL VL]
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
	splice	z8.h, p4, z8.h, z16.h
	add	z16.s, z9.s, z20.s
	sub	z9.s, z9.s, z20.s
	sqrshrnb	z19.h, z9.s, #7
	sqrshrnb	z20.h, z16.s, #7
	uzp1	z15.h, z19.h, z19.h
	add	z16.s, z10.s, z21.s
	uzp1	z18.h, z18.h, z18.h
	sub	z10.s, z10.s, z21.s
	splice	z18.h, p4, z18.h, z7.h
	sqrshrnb	z21.h, z16.s, #7
	uzp1	z7.h, z20.h, z20.h
	uzp1	z9.h, z21.h, z21.h
	movprfx	z19, z7
	splice	z19.h, p4, z19.h, z9.h
	sqrshrnb	z20.h, z10.s, #7
	uzp2	z10.h, z18.h, z19.h
	uzp1	z7.h, z20.h, z20.h
	splice	z7.h, p4, z7.h, z15.h
	uzp1	z15.h, z18.h, z19.h
	add	z18.s, z11.s, z22.s
	add	z19.s, z12.s, z23.s
	sub	z11.s, z11.s, z22.s
	sub	z12.s, z12.s, z23.s
	sqrshrnb	z22.h, z18.s, #7
	sqrshrnb	z21.h, z11.s, #7
	uzp1	z9.h, z21.h, z21.h
	sqrshrnb	z23.h, z19.s, #7
	sqrshrnb	z18.h, z12.s, #7
	uzp1	z20.h, z23.h, z23.h
	add	z12.s, z14.s, z25.s
	uzp1	z16.h, z22.h, z22.h
	uzp1	z11.h, z18.h, z18.h
	splice	z16.h, p4, z16.h, z20.h
	splice	z11.h, p4, z11.h, z9.h
	add	z22.s, z13.s, z24.s
	sub	z13.s, z13.s, z24.s
	sqrshrnb	z24.h, z22.s, #7
	sqrshrnb	z9.h, z13.s, #7
	sub	z14.s, z14.s, z25.s
	uzp1	z19.h, z9.h, z9.h
	sqrshrnb	z25.h, z12.s, #7
	sqrshrnb	z20.h, z14.s, #7
	uzp1	z23.h, z25.h, z25.h
	add	z22.s, z2.s, z27.s
	uzp1	z21.h, z24.h, z24.h
	splice	z21.h, p4, z21.h, z23.h
	uzp1	z18.h, z16.h, z21.h
	uzp2	z21.h, z16.h, z21.h
	uzp1	z24.h, z15.h, z18.h
	uzp2	z9.h, z15.h, z18.h
	add	z15.s, z1.s, z26.s
	sub	z1.s, z1.s, z26.s
	sqrshrnb	z26.h, z15.s, #7
	sqrshrnb	z16.h, z1.s, #7
	uzp1	z12.h, z16.h, z16.h
	add	x28, sp, 224
	sub	z2.s, z2.s, z27.s
	addvl	x12, sp, #1
	sqrshrnb	z27.h, z22.s, #7
	sqrshrnb	z25.h, z2.s, #7
	uzp1	z14.h, z27.h, z27.h
	addvl	x25, sp, #2
	uzp1	z13.h, z20.h, z20.h
	uzp1	z23.h, z25.h, z25.h
	splice	z13.h, p4, z13.h, z19.h
	splice	z23.h, p4, z23.h, z12.h
	add	z20.s, z29.s, z28.s
	uzp1	z19.h, z26.h, z26.h
	ldr	z26, [x28]
	splice	z19.h, p4, z19.h, z14.h
	add	z16.s, z17.s, z26.s
	sub	z29.s, z29.s, z28.s
	sqrshrnb	z12.h, z16.s, #7
	sqrshrnb	z28.h, z20.s, #7
	sqrshrnb	z15.h, z29.s, #7
	uzp1	z18.h, z28.h, z28.h
	uzp1	z22.h, z12.h, z12.h
	uzp1	z1.h, z15.h, z15.h
	movprfx	z2, z18
	splice	z2.h, p4, z2.h, z22.h
	sub	z17.s, z17.s, z26.s
	uzp1	z25.h, z19.h, z2.h
	uzp2	z15.h, z19.h, z2.h
	add	z18.s, z4.s, z0.s
	add	z19.s, z6.s, z30.s
	sqrshrnb	z27.h, z17.s, #7
	sqrshrnb	z29.h, z19.s, #7
	add	x12, x12, 224
	add	x25, x25, 224
	ldr	z20, [x25]
	addvl	x27, sp, #10
	sub	z6.s, z6.s, z30.s
	ldr	z30, [x12]
	uzp1	z12.h, z29.h, z29.h
	add	z28.s, z5.s, z30.s
	sqrshrnb	z16.h, z28.s, #7
	uzp1	z22.h, z16.h, z16.h
	splice	z12.h, p4, z12.h, z22.h
	sqrshrnb	z17.h, z18.s, #7
	add	x27, x27, 1760
	addvl	x19, sp, #10
	uzp1	z14.h, z27.h, z27.h
	uzp1	z2.h, z17.h, z17.h
	splice	z14.h, p4, z14.h, z1.h
	add	z1.s, z3.s, z20.s
	sub	z3.s, z3.s, z20.s
	sqrshrnb	z26.h, z1.s, #7
	uzp1	z27.h, z26.h, z26.h
	splice	z2.h, p4, z2.h, z27.h
	uzp1	z28.h, z12.h, z2.h
	uzp2	z20.h, z12.h, z2.h
	uzp1	z18.h, z25.h, z28.h
	uzp1	z12.h, z13.h, z11.h
	uzp2	z11.h, z13.h, z11.h
	uzp1	z13.h, z24.h, z18.h
	str	z13, [x27]
	uzp1	z26.h, z14.h, z23.h
	uzp1	z22.h, z10.h, z21.h
	uzp1	z2.h, z15.h, z20.h
	uzp2	z17.h, z14.h, z23.h
	add	x19, x19, 1824
	uzp1	z23.h, z22.h, z2.h
	addvl	x11, sp, #10
	str	z23, [x19]
	sqrshrnb	z19.h, z3.s, #7
	add	x11, x11, 1888
	uzp2	z3.h, z25.h, z28.h
	addvl	x17, sp, #10
	uzp1	z14.h, z9.h, z3.h
	str	z14, [x11]
	uzp2	z25.h, z10.h, z21.h
	uzp2	z29.h, z15.h, z20.h
	add	x17, x17, 1952
	uzp1	z15.h, z25.h, z29.h
	addvl	x8, sp, #10
	str	z15, [x17]
	uzp2	z24.h, z24.h, z18.h
	add	x8, x8, 2016
	addvl	x18, sp, #10
	str	z24, [x8]
	uzp2	z16.h, z22.h, z2.h
	add	x18, x18, 2080
	addvl	x5, sp, #10
	str	z16, [x18]
	uzp2	z9.h, z9.h, z3.h
	add	x5, x5, 2144
	addvl	x4, sp, #10
	str	z9, [x5]
	add	x4, x4, 2208
	addvl	x20, sp, #10
	sub	z5.s, z5.s, z30.s
	sub	z0.s, z4.s, z0.s
	sqrshrnb	z6.h, z6.s, #7
	sqrshrnb	z4.h, z0.s, #7
	uzp1	z1.h, z19.h, z19.h
	uzp1	z30.h, z4.h, z4.h
	uzp2	z19.h, z25.h, z29.h
	str	z19, [x4]
	uzp1	z27.h, z7.h, z8.h
	splice	z1.h, p4, z1.h, z30.h
	uzp1	z21.h, z12.h, z27.h
	uzp1	z10.h, z6.h, z6.h
	add	x20, x20, 1792
	addvl	x0, sp, #10
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z0.h, z5.h, z5.h
	splice	z0.h, p4, z0.h, z10.h
	uzp1	z6.h, z1.h, z0.h
	uzp1	z20.h, z6.h, z26.h
	uzp1	z30.h, z20.h, z21.h
	str	z30, [x20]
	uzp2	z4.h, z12.h, z27.h
	uzp2	z1.h, z1.h, z0.h
	uzp2	z8.h, z7.h, z8.h
	uzp1	z28.h, z1.h, z17.h
	uzp1	z7.h, z11.h, z8.h
	add	x0, x0, 1856
	uzp1	z12.h, z28.h, z7.h
	addvl	x3, sp, #10
	str	z12, [x0]
	uzp2	z22.h, z6.h, z26.h
	add	x3, x3, 1920
	uzp1	z26.h, z22.h, z4.h
	addvl	x13, sp, #10
	str	z26, [x3]
	uzp2	z5.h, z11.h, z8.h
	uzp2	z18.h, z1.h, z17.h
	add	x13, x13, 1984
	uzp1	z2.h, z18.h, z5.h
	addvl	x28, sp, #10
	str	z2, [x13]
	uzp2	z3.h, z20.h, z21.h
	add	x28, x28, 2048
	addvl	x12, sp, #10
	str	z3, [x28]
	uzp2	z25.h, z28.h, z7.h
	add	x12, x12, 2112
	addvl	x25, sp, #10
	str	z25, [x12]
	uzp2	z27.h, z22.h, z4.h
	add	x25, x25, 2176
	addvl	x27, sp, #10
	str	z27, [x25]
	uzp2	z29.h, z18.h, z5.h
	add	x19, sp, 224
	add	x27, x27, 2240
	addvl	x11, sp, #10
	str	z29, [x19]
	add	x11, x11, 288
	addvl	x17, sp, #10
	str	z29, [x27]
	addvl	x8, sp, #10
	addvl	x18, sp, #10
	ldr	z0, [x11]
	addvl	x5, sp, #10
	addvl	x4, sp, #10
	addvl	x20, sp, #10
	addvl	x0, sp, #10
	addvl	x3, sp, #10
	addvl	x13, sp, #10
	addvl	x28, sp, #10
	addvl	x12, sp, #10
	addvl	x25, sp, #10
	addvl	x27, sp, #10
	add	x17, x17, 416
	ldr	z17, [x17]
	add	x8, x8, 544
	ldr	z21, [x8]
	add	x18, x18, 672
	ldr	z7, [x18]
	add	x5, x5, 800
	ldr	z10, [x5]
	add	x4, x4, 928
	ldr	z23, [x4]
	add	x20, x20, 1056
	ldr	z11, [x20]
	add	x0, x0, 1184
	ldr	z24, [x0]
	add	x3, x3, 1312
	ldr	z16, [x3]
	add	x13, x13, 1440
	ldr	z19, [x13]
	add	x28, x28, 1568
	ldr	z13, [x28]
	add	x12, x12, 1696
	ldr	z4, [x12]
	add	x25, x25, 1824
	ldr	z14, [x25]
	add	x27, x27, 1952
	ldr	z5, [x27]
	addvl	x19, sp, #10
	addvl	x11, sp, #10
	add	x19, x19, 2080
	ldr	z15, [x19]
	add	x11, x11, 2208
	ldr	z6, [x11]
	zip1	z3.h, z13.h, z4.h
	zip1	z8.h, z0.h, z17.h
	zip1	z4.h, z14.h, z5.h
	zip1	z9.h, z21.h, z7.h
	zip1	z1.h, z10.h, z23.h
	zip1	z2.h, z11.h, z24.h
	zip1	z12.h, z16.h, z19.h
	zip1	z5.h, z15.h, z6.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z12.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x30, _ZL6CDOT_O+3328
	add	x5, x30, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z12.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x15, sp, #1
	adrp	x14, _ZL6CDOT_O+3584
	add	x15, x15, 224
	add	x4, x14, :lo12:_ZL6CDOT_O+3584
	str	z15, [x15]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z5.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+3840
	add	x3, x21, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #2
	addvl	x10, sp, #10
	addvl	x9, sp, #10
	addvl	x22, sp, #10
	addvl	x7, sp, #10
	addvl	x24, sp, #10
	addvl	x26, sp, #10
	addvl	x6, sp, #10
	addvl	x17, sp, #10
	add	x23, x23, 224
	str	z16, [x23]
	add	x10, x10, 352
	ldr	z5, [x10]
	add	x9, x9, 608
	ldr	z15, [x9]
	add	x22, x22, 864
	ldr	z6, [x22]
	add	x7, x7, 1120
	ldr	z30, [x7]
	add	x24, x24, 1376
	ldr	z7, [x24]
	add	x26, x26, 1632
	ldr	z14, [x26]
	add	x6, x6, 1888
	ldr	z10, [x6]
	add	x17, x17, 2144
	ldr	z11, [x17]
	adrp	x16, .LANCHOR0
	zip1	z1.h, z5.h, z15.h
	zip1	z2.h, z6.h, z30.h
	zip1	z3.h, z7.h, z14.h
	zip1	z16.h, z10.h, z11.h
	add	x0, x16, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z16.h, z4.h
// 0 "" 2
#NO_APP
	add	x13, x0, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	add	x12, x0, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	add	x11, x0, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	add	x10, x0, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z16.h, z14.h
// 0 "" 2
#NO_APP
	add	x9, x0, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	add	x8, x0, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z16.h, z5.h
// 0 "" 2
#NO_APP
	add	x7, x0, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z16.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #10
	addvl	x28, sp, #10
	add	x20, x20, 480
	ldr	z30, [x20]
	addvl	x25, sp, #10
	addvl	x27, sp, #10
	add	x28, x28, 992
	ldr	z16, [x28]
	add	x25, x25, 1504
	ldr	z4, [x25]
	add	x27, x27, 2016
	ldr	z7, [x27]
	zip1	z1.h, z30.h, z16.h
	add	x18, x0, 1024
	zip1	z30.h, z4.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z30.h, z6.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z3.h
// 0 "" 2
#NO_APP
	add	x16, x0, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z7.h
// 0 "" 2
#NO_APP
	add	x15, x0, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z30.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #10
	addvl	x30, sp, #10
	add	x19, x19, 736
	ldr	z30, [x19]
	add	x30, x30, 1760
	ldr	z3, [x30]
	add	x22, x0, 1280
	zip1	z16.h, z30.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	add	x21, x0, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x14, sp, #10
	addvl	x23, sp, #10
	add	x14, x14, 224
	ldr	z1, [x14]
	add	x23, x23, 1248
	ldr	z16, [x23]
	add	x20, x0, 1344
	zip1	z1.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z30.h
// 0 "" 2
#NO_APP
	add	x19, x0, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z30.h
// 0 "" 2
#NO_APP
	add	z1.s, z16.s, z2.s
	sub	z16.s, z16.s, z2.s
	add	z2.s, z31.s, z3.s
	sub	z30.s, z1.s, z4.s
	sub	z31.s, z31.s, z3.s
	add	z3.s, z1.s, z4.s
	sub	z1.s, z2.s, z5.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z31.s, z6.s
	add	z5.s, z31.s, z6.s
	add	z6.s, z16.s, z7.s
	sub	z31.s, z2.s, z13.s
	sub	z16.s, z16.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z16.s, z12.s
	sub	z16.s, z16.s, z12.s
	add	z12.s, z2.s, z13.s
	add	z13.s, z1.s, z14.s
	sub	z2.s, z1.s, z14.s
	add	z14.s, z30.s, z15.s
	sub	z1.s, z7.s, z17.s
	sub	z30.s, z30.s, z15.s
	add	z15.s, z7.s, z17.s
	sqrshrnb	z7.h, z1.s, #12
	sqrshrnb	z17.h, z15.s, #12
	uzp1	z1.h, z7.h, z7.h
	add	z15.s, z8.s, z18.s
	sub	z18.s, z8.s, z18.s
	sqrshrnb	z8.h, z15.s, #12
	sqrshrnb	z15.h, z18.s, #12
	uzp1	z7.h, z8.h, z8.h
	uzp1	z8.h, z15.h, z15.h
	splice	z8.h, p4, z8.h, z1.h
	add	z1.s, z9.s, z19.s
	sub	z9.s, z9.s, z19.s
	sqrshrnb	z18.h, z9.s, #12
	sqrshrnb	z19.h, z1.s, #12
	uzp1	z15.h, z18.h, z18.h
	add	z1.s, z10.s, z20.s
	uzp1	z17.h, z17.h, z17.h
	sub	z10.s, z10.s, z20.s
	splice	z17.h, p4, z17.h, z7.h
	sqrshrnb	z20.h, z1.s, #12
	uzp1	z7.h, z19.h, z19.h
	uzp1	z9.h, z20.h, z20.h
	movprfx	z18, z7
	splice	z18.h, p4, z18.h, z9.h
	sqrshrnb	z19.h, z10.s, #12
	uzp2	z10.h, z17.h, z18.h
	uzp1	z7.h, z19.h, z19.h
	splice	z7.h, p4, z7.h, z15.h
	uzp1	z15.h, z17.h, z18.h
	add	z17.s, z11.s, z21.s
	add	z18.s, z12.s, z22.s
	sub	z11.s, z11.s, z21.s
	sub	z12.s, z12.s, z22.s
	sqrshrnb	z21.h, z17.s, #12
	sqrshrnb	z20.h, z11.s, #12
	sqrshrnb	z22.h, z18.s, #12
	uzp1	z9.h, z20.h, z20.h
	uzp1	z19.h, z22.h, z22.h
	sqrshrnb	z17.h, z12.s, #12
	addvl	x28, sp, #1
	add	z12.s, z14.s, z24.s
	uzp1	z1.h, z21.h, z21.h
	sub	z14.s, z14.s, z24.s
	add	z21.s, z13.s, z23.s
	sqrshrnb	z24.h, z12.s, #12
	splice	z1.h, p4, z1.h, z19.h
	sub	z13.s, z13.s, z23.s
	uzp1	z22.h, z24.h, z24.h
	sqrshrnb	z23.h, z21.s, #12
	sqrshrnb	z19.h, z14.s, #12
	add	z21.s, z30.s, z25.s
	add	z12.s, z2.s, z26.s
	sub	z30.s, z30.s, z25.s
	sub	z2.s, z2.s, z26.s
	sqrshrnb	z25.h, z21.s, #12
	sqrshrnb	z24.h, z2.s, #12
	add	x28, x28, 224
	uzp1	z11.h, z17.h, z17.h
	uzp1	z20.h, z23.h, z23.h
	splice	z11.h, p4, z11.h, z9.h
	splice	z20.h, p4, z20.h, z22.h
	sqrshrnb	z9.h, z13.s, #12
	uzp1	z17.h, z1.h, z20.h
	uzp1	z18.h, z9.h, z9.h
	uzp2	z20.h, z1.h, z20.h
	uzp1	z23.h, z15.h, z17.h
	sqrshrnb	z1.h, z30.s, #12
	uzp2	z15.h, z15.h, z17.h
	sqrshrnb	z26.h, z12.s, #12
	uzp1	z13.h, z19.h, z19.h
	uzp1	z9.h, z25.h, z25.h
	splice	z13.h, p4, z13.h, z18.h
	add	z19.s, z31.s, z27.s
	uzp1	z18.h, z1.h, z1.h
	sub	z31.s, z31.s, z27.s
	add	z25.s, z16.s, z28.s
	sqrshrnb	z27.h, z19.s, #12
	uzp1	z22.h, z24.h, z24.h
	ldr	z24, [x28]
	uzp1	z17.h, z27.h, z27.h
	addvl	x28, sp, #2
	splice	z22.h, p4, z22.h, z18.h
	uzp1	z14.h, z26.h, z26.h
	sqrshrnb	z21.h, z31.s, #12
	add	z26.s, z6.s, z29.s
	uzp1	z30.h, z21.h, z21.h
	sub	z16.s, z16.s, z28.s
	add	x28, x28, 224
	ldr	z27, [x28]
	sqrshrnb	z28.h, z25.s, #12
	add	z31.s, z3.s, z27.s
	uzp1	z1.h, z28.h, z28.h
	sqrshrnb	z25.h, z31.s, #12
	movprfx	z18, z17
	splice	z18.h, p4, z18.h, z1.h
	sub	z6.s, z6.s, z29.s
	sqrshrnb	z17.h, z26.s, #12
	add	z29.s, z5.s, z24.s
	sub	z5.s, z5.s, z24.s
	add	z19.s, z4.s, z0.s
	splice	z9.h, p4, z9.h, z14.h
	sqrshrnb	z12.h, z16.s, #12
	uzp1	z14.h, z9.h, z18.h
	sqrshrnb	z21.h, z29.s, #12
	uzp2	z9.h, z9.h, z18.h
	uzp1	z28.h, z21.h, z21.h
	uzp1	z18.h, z25.h, z25.h
	sqrshrnb	z26.h, z5.s, #12
	uzp1	z2.h, z12.h, z12.h
	uzp1	z16.h, z17.h, z17.h
	splice	z2.h, p4, z2.h, z30.h
	splice	z16.h, p4, z16.h, z28.h
	uzp1	z25.h, z2.h, z22.h
	sqrshrnb	z30.h, z19.s, #12
	uzp2	z2.h, z2.h, z22.h
	uzp1	z1.h, z30.h, z30.h
	splice	z1.h, p4, z1.h, z18.h
	uzp1	z5.h, z16.h, z1.h
	uzp1	z17.h, z14.h, z5.h
	uzp1	z22.h, z23.h, z17.h
	str	z22, [x1]
	add	x24, x1, x2, lsl 1
	uzp1	z19.h, z10.h, z20.h
	sub	z3.s, z3.s, z27.s
	uzp2	z27.h, z16.h, z1.h
	uzp1	z1.h, z9.h, z27.h
	uzp1	z30.h, z19.h, z1.h
	str	z30, [x24]
	add	x27, x24, x2, lsl 1
	uzp2	z14.h, z14.h, z5.h
	add	x6, x2, x2, lsl 1
	uzp1	z18.h, z15.h, z14.h
	str	z18, [x27]
	add	x26, x27, x2, lsl 1
	uzp2	z10.h, z10.h, z20.h
	uzp2	z9.h, z9.h, z27.h
	sqrshrnb	z12.h, z3.s, #12
	uzp1	z3.h, z10.h, z9.h
	str	z3, [x26]
	add	x25, x26, x2, lsl 1
	add	x30, x24, 32
	add	x14, x1, x2, lsl 2
	uzp2	z23.h, z23.h, z17.h
	add	x24, x1, x6, lsl 1
	str	z23, [x25]
	add	x23, x14, 32
	add	x27, x24, 32
	stp	x23, x27, [sp, 176]
	sub	z0.s, z4.s, z0.s
	add	x6, x1, x6, lsl 2
	sqrshrnb	z4.h, z0.s, #12
	uzp2	z0.h, z19.h, z1.h
	str	x30, [sp, 168]
	add	x30, x25, x2, lsl 1
	str	z0, [x30]
	add	x23, x30, x2, lsl 1
	add	x26, x6, 32
	uzp2	z15.h, z15.h, z14.h
	add	x25, x2, x2, lsl 2
	str	z15, [x23]
	uzp1	z24.h, z4.h, z4.h
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z31.h, z12.h, z12.h
	uzp2	z12.h, z10.h, z9.h
	splice	z31.h, p4, z31.h, z24.h
	str	x26, [sp, 208]
	add	x26, x23, x2, lsl 1
	str	z12, [x26]
	uzp1	z20.h, z7.h, z8.h
	add	x14, x1, x25, lsl 1
	uzp1	z29.h, z13.h, z11.h
	add	x24, x1, 32
	uzp1	z16.h, z29.h, z20.h
	uzp1	z21.h, z6.h, z6.h
	uzp1	z28.h, z26.h, z26.h
	splice	z28.h, p4, z28.h, z21.h
	uzp1	z26.h, z31.h, z28.h
	uzp2	z6.h, z31.h, z28.h
	uzp1	z5.h, z26.h, z25.h
	uzp1	z31.h, z5.h, z16.h
	str	z31, [x24]
	ldp	x6, x30, [sp, 168]
	add	x27, x14, 32
	uzp2	z11.h, z13.h, z11.h
	uzp2	z8.h, z7.h, z8.h
	uzp2	z13.h, z29.h, z20.h
	uzp1	z7.h, z11.h, z8.h
	uzp1	z29.h, z6.h, z2.h
	uzp1	z24.h, z29.h, z7.h
	str	z24, [x6]
	str	x27, [sp, 200]
	lsl	x27, x2, 3
	uzp2	z19.h, z26.h, z25.h
	uzp1	z25.h, z19.h, z13.h
	ldr	x25, [sp, 184]
	str	z25, [x30]
	uzp2	z4.h, z11.h, z8.h
	sub	x23, x27, x2
	uzp2	z17.h, z6.h, z2.h
	uzp1	z10.h, z17.h, z4.h
	add	x30, x1, x2, lsl 3
	str	z10, [x25]
	uzp2	z27.h, z5.h, z16.h
	add	x25, x30, 32
	str	x25, [sp, 192]
	uzp2	z1.h, z29.h, z7.h
	add	x24, x1, x23, lsl 1
	adrp	x27, _ZL6CDOT_O
	uzp2	z14.h, z19.h, z13.h
	add	x6, x24, 32
	str	x6, [sp, 216]
	uzp2	z9.h, z17.h, z4.h
	ldp	x23, x24, [sp, 192]
	str	z27, [x23]
	add	x6, x27, :lo12:_ZL6CDOT_O
	str	z1, [x24]
	ldr	x14, [sp, 208]
	str	z14, [x14]
	addvl	x30, sp, #10
	addvl	x25, sp, #10
	addvl	x27, sp, #10
	addvl	x23, sp, #10
	add	x30, x30, 304
	ldr	x14, [sp, 216]
	str	z9, [x14]
	ldr	z20, [x30]
	add	x25, x25, 432
	ldr	z21, [x25]
	zip1	z8.h, z20.h, z21.h
	add	x27, x27, 560
	add	x23, x23, 688
	ldr	z2, [x27]
	ldr	z16, [x23]
	addvl	x24, sp, #10
	addvl	x14, sp, #10
	addvl	x30, sp, #10
	addvl	x25, sp, #10
	zip1	z6.h, z2.h, z16.h
	addvl	x27, sp, #10
	addvl	x23, sp, #10
	add	x24, x24, 816
	add	x14, x14, 944
	ldr	z22, [x24]
	add	x30, x30, 1072
	add	x25, x25, 1200
	ldr	z18, [x14]
	add	x27, x27, 1328
	add	x23, x23, 1456
	ldr	z3, [x30]
	ldr	z23, [x25]
	ldr	z0, [x27]
	ldr	z28, [x23]
	addvl	x24, sp, #10
	addvl	x14, sp, #10
	zip1	z5.h, z22.h, z18.h
	addvl	x30, sp, #10
	addvl	x25, sp, #10
	zip1	z11.h, z3.h, z23.h
	addvl	x27, sp, #10
	addvl	x23, sp, #10
	zip1	z12.h, z0.h, z28.h
	add	x24, x24, 1584
	ldr	z7, [x24]
	add	x14, x14, 1712
	ldr	z13, [x14]
	add	x30, x30, 1840
	ldr	z4, [x30]
	add	x25, x25, 1968
	ldr	z30, [x25]
	add	x27, x27, 2096
	ldr	z15, [x27]
	add	x23, x23, 2224
	ldr	z26, [x23]
	zip1	z31.h, z7.h, z13.h
	zip1	z1.h, z4.h, z30.h
	zip1	z2.h, z15.h, z26.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z12.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z31.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+256
	add	x24, x6, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z31.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+512
	add	x30, x14, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z31.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+768
	add	x27, x25, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z31.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+1024
	add	x6, x23, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z31.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x24, _ZL6CDOT_O+1280
	add	x14, x24, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z31.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x30, _ZL6CDOT_O+1536
	add	x25, x30, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z31.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x27, _ZL6CDOT_O+1792
	add	x23, x27, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z31.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2048
	add	x24, x6, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z31.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+2304
	add	x30, x14, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z31.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+2560
	add	x27, x25, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z31.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+2816
	add	x6, x23, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z31.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x24, _ZL6CDOT_O+3072
	add	x14, x24, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z6.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z11.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z31.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z2.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #1
	add	x30, x30, 224
	str	z4, [x30]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z31.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z11.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z12.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z31.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	str	z9, [x28]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z11.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z31.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #3
	addvl	x4, sp, #10
	addvl	x3, sp, #10
	addvl	x25, sp, #10
	addvl	x27, sp, #10
	addvl	x23, sp, #10
	addvl	x6, sp, #10
	addvl	x24, sp, #10
	addvl	x14, sp, #10
	add	x5, x5, 224
	str	z16, [x5]
	add	x4, x4, 368
	ldr	z2, [x4]
	add	x3, x3, 624
	ldr	z10, [x3]
	add	x25, x25, 880
	ldr	z14, [x25]
	add	x27, x27, 1136
	ldr	z9, [x27]
	add	x23, x23, 1392
	ldr	z3, [x23]
	add	x6, x6, 1648
	ldr	z0, [x6]
	add	x24, x24, 1904
	ldr	z7, [x24]
	add	x14, x14, 2160
	ldr	z4, [x14]
	zip1	z13.h, z2.h, z10.h
	zip1	z29.h, z14.h, z9.h
	zip1	z15.h, z3.h, z0.h
	zip1	z6.h, z7.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z29.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z29.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z15.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z29.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z15.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z13.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z29.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z29.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z29.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z29.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z29.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	addvl	x13, sp, #10
	addvl	x12, sp, #10
	addvl	x11, sp, #10
	add	x0, x0, 496
	ldr	z6, [x0]
	add	x13, x13, 1008
	ldr	z9, [x13]
	add	x12, x12, 1520
	ldr	z5, [x12]
	add	x11, x11, 2032
	ldr	z11, [x11]
	zip1	z10.h, z6.h, z9.h
	zip1	z16.h, z5.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z16.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z16.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z16.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z10.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #10
	addvl	x9, sp, #10
	add	x10, x10, 752
	ldr	z16, [x10]
	add	x9, x9, 1776
	ldr	z13, [x9]
	zip1	z29.h, z16.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z29.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #10
	addvl	x7, sp, #10
	add	x8, x8, 240
	ldr	z13, [x8]
	add	x7, x7, 1264
	ldr	z16, [x7]
	zip1	z10.h, z13.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z10.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z9.h
// 0 "" 2
#NO_APP
	add	z10.s, z13.s, z15.s
	sub	z16.s, z13.s, z15.s
	add	z13.s, z29.s, z14.s
	add	z15.s, z10.s, z5.s
	sub	z14.s, z29.s, z14.s
	sub	z9.s, z10.s, z5.s
	sub	z29.s, z13.s, z11.s
	add	z5.s, z13.s, z11.s
	add	z11.s, z14.s, z6.s
	sub	z13.s, z14.s, z6.s
	add	z6.s, z16.s, z1.s
	sub	z14.s, z13.s, z4.s
	add	z10.s, z6.s, z3.s
	sub	z16.s, z16.s, z1.s
	add	z1.s, z15.s, z8.s
	sub	z15.s, z15.s, z8.s
	add	z8.s, z5.s, z2.s
	sub	z5.s, z5.s, z2.s
	add	z2.s, z11.s, z31.s
	sub	z31.s, z11.s, z31.s
	sub	z11.s, z6.s, z3.s
	add	z3.s, z16.s, z7.s
	sub	z6.s, z16.s, z7.s
	add	z7.s, z13.s, z4.s
	add	z4.s, z29.s, z0.s
	sub	z13.s, z1.s, z17.s
	sub	z0.s, z29.s, z0.s
	add	z29.s, z9.s, z12.s
	sub	z9.s, z9.s, z12.s
	add	z12.s, z1.s, z17.s
	add	x25, x2, x2, lsl 1
	sqrshrnb	z17.h, z12.s, #12
	sqrshrnb	z1.h, z13.s, #12
	add	z12.s, z8.s, z18.s
	uzp1	z13.h, z1.h, z1.h
	sub	z18.s, z8.s, z18.s
	uzp1	z16.h, z17.h, z17.h
	sqrshrnb	z8.h, z12.s, #12
	sqrshrnb	z1.h, z18.s, #12
	uzp1	z17.h, z8.h, z8.h
	uzp1	z12.h, z1.h, z1.h
	splice	z12.h, p4, z12.h, z13.h
	add	z13.s, z2.s, z19.s
	splice	z16.h, p4, z16.h, z17.h
	add	x0, x2, x25, lsl 2
	sub	z2.s, z2.s, z19.s
	add	z1.s, z10.s, z20.s
	sqrshrnb	z19.h, z13.s, #12
	sqrshrnb	z18.h, z2.s, #12
	sub	z20.s, z10.s, z20.s
	uzp1	z17.h, z18.h, z18.h
	sqrshrnb	z10.h, z1.s, #12
	uzp1	z8.h, z19.h, z19.h
	uzp1	z13.h, z10.h, z10.h
	splice	z8.h, p4, z8.h, z13.h
	sqrshrnb	z2.h, z20.s, #12
	uzp2	z19.h, z16.h, z8.h
	add	z10.s, z7.s, z22.s
	uzp1	z1.h, z2.h, z2.h
	sub	z7.s, z7.s, z22.s
	splice	z1.h, p4, z1.h, z17.h
	sqrshrnb	z22.h, z10.s, #12
	uzp1	z17.h, z16.h, z8.h
	add	z16.s, z3.s, z21.s
	sub	z3.s, z3.s, z21.s
	sqrshrnb	z21.h, z16.s, #12
	sqrshrnb	z18.h, z3.s, #12
	uzp1	z8.h, z21.h, z21.h
	uzp1	z20.h, z18.h, z18.h
	add	x11, x1, x0, lsl 1
	add	x18, x1, x2, lsl 4
	uzp1	z13.h, z22.h, z22.h
	sqrshrnb	z16.h, z7.s, #12
	movprfx	z2, z8
	splice	z2.h, p4, z2.h, z13.h
	add	z21.s, z4.s, z23.s
	add	z10.s, z29.s, z24.s
	sub	z4.s, z4.s, z23.s
	sub	z24.s, z29.s, z24.s
	sqrshrnb	z23.h, z21.s, #12
	sqrshrnb	z18.h, z4.s, #12
	sqrshrnb	z29.h, z10.s, #12
	sqrshrnb	z22.h, z24.s, #12
	uzp1	z7.h, z29.h, z29.h
	uzp1	z3.h, z16.h, z16.h
	uzp1	z8.h, z23.h, z23.h
	splice	z3.h, p4, z3.h, z20.h
	splice	z8.h, p4, z8.h, z7.h
	uzp1	z20.h, z18.h, z18.h
	uzp1	z13.h, z2.h, z8.h
	add	x27, x18, 32
	uzp2	z21.h, z17.h, z13.h
	add	x18, x11, 32
	uzp2	z2.h, z2.h, z8.h
	add	z29.s, z14.s, z27.s
	uzp1	z8.h, z17.h, z13.h
	sub	z14.s, z14.s, z27.s
	add	z17.s, z9.s, z25.s
	sqrshrnb	z27.h, z29.s, #12
	sub	z9.s, z9.s, z25.s
	addvl	x0, sp, #1
	sqrshrnb	z25.h, z17.s, #12
	sqrshrnb	z16.h, z9.s, #12
	addvl	x11, sp, #3
	uzp1	z18.h, z16.h, z16.h
	uzp1	z4.h, z22.h, z22.h
	uzp1	z23.h, z25.h, z25.h
	splice	z4.h, p4, z4.h, z20.h
	uzp1	z22.h, z27.h, z27.h
	add	z20.s, z0.s, z26.s
	sub	z0.s, z0.s, z26.s
	sqrshrnb	z26.h, z20.s, #12
	sqrshrnb	z24.h, z0.s, #12
	uzp1	z10.h, z26.h, z26.h
	splice	z23.h, p4, z23.h, z10.h
	add	z27.s, z31.s, z30.s
	sqrshrnb	z13.h, z14.s, #12
	add	z9.s, z6.s, z28.s
	uzp1	z17.h, z13.h, z13.h
	sub	z6.s, z6.s, z28.s
	sub	z31.s, z31.s, z30.s
	ldr	z30, [x28]
	sqrshrnb	z28.h, z9.s, #12
	add	x0, x0, 224
	uzp1	z25.h, z28.h, z28.h
	add	x11, x11, 224
	ldr	z20, [x11]
	uzp1	z7.h, z24.h, z24.h
	splice	z7.h, p4, z7.h, z18.h
	movprfx	z18, z22
	splice	z18.h, p4, z18.h, z25.h
	add	z22.s, z15.s, z20.s
	uzp2	z10.h, z23.h, z18.h
	uzp1	z26.h, z23.h, z18.h
	ldr	z23, [x0]
	add	z24.s, z11.s, z23.s
	sub	z14.s, z11.s, z23.s
	add	z11.s, z5.s, z30.s
	add	x26, x26, x2, lsl 1
	sqrshrnb	z16.h, z6.s, #12
	sub	z5.s, z5.s, z30.s
	sqrshrnb	z13.h, z24.s, #12
	sqrshrnb	z29.h, z11.s, #12
	sqrshrnb	z9.h, z22.s, #12
	sub	z15.s, z15.s, z20.s
	uzp1	z18.h, z9.h, z9.h
	uzp1	z20.h, z4.h, z3.h
	uzp1	z0.h, z16.h, z16.h
	uzp2	z3.h, z4.h, z3.h
	splice	z0.h, p4, z0.h, z17.h
	uzp1	z28.h, z13.h, z13.h
	sqrshrnb	z17.h, z27.s, #12
	uzp1	z25.h, z29.h, z29.h
	uzp1	z6.h, z17.h, z17.h
	splice	z25.h, p4, z25.h, z18.h
	splice	z28.h, p4, z28.h, z6.h
	uzp1	z11.h, z28.h, z25.h
	uzp1	z22.h, z26.h, z11.h
	uzp1	z4.h, z8.h, z22.h
	str	z4, [x26]
	add	x22, x26, x2, lsl 1
	uzp1	z29.h, z19.h, z2.h
	sqrshrnb	z16.h, z5.s, #12
	uzp2	z5.h, z28.h, z25.h
	uzp2	z28.h, z10.h, z5.h
	uzp1	z9.h, z10.h, z5.h
	uzp1	z10.h, z29.h, z9.h
	str	z10, [x22]
	add	x21, x22, x2, lsl 1
	uzp2	z26.h, z26.h, z11.h
	uzp1	z6.h, z21.h, z26.h
	str	z6, [x21]
	add	x20, x21, x2, lsl 1
	uzp2	z2.h, z19.h, z2.h
	uzp1	z25.h, z2.h, z28.h
	str	z25, [x20]
	add	x19, x20, x2, lsl 1
	uzp2	z8.h, z8.h, z22.h
	add	x15, x2, x2, lsl 3
	str	z8, [x19]
	add	x12, x19, x2, lsl 1
	uzp2	z18.h, z29.h, z9.h
	str	z18, [x12]
	add	x9, x12, x2, lsl 1
	add	x30, x2, x2, lsl 2
	add	x17, x1, x15, lsl 1
	uzp2	z21.h, z21.h, z26.h
	str	z21, [x9]
	add	x14, x17, 32
	sqrshrnb	z23.h, z15.s, #12
	add	x17, x9, x2, lsl 1
	uzp2	z15.h, z2.h, z28.h
	sqrshrnb	z27.h, z14.s, #12
	uzp1	z14.h, z16.h, z16.h
	str	z15, [x17]
	uzp1	z13.h, z0.h, z7.h
	uzp1	z17.h, z1.h, z12.h
	uzp2	z7.h, z0.h, z7.h
	sqrshrnb	z24.h, z31.s, #12
	uzp1	z0.h, z20.h, z17.h
	uzp1	z19.h, z27.h, z27.h
	add	x16, x2, x30, lsl 1
	uzp1	z31.h, z23.h, z23.h
	uzp1	z30.h, z24.h, z24.h
	splice	z31.h, p4, z31.h, z14.h
	splice	z30.h, p4, z30.h, z19.h
	uzp1	z14.h, z31.h, z30.h
	uzp1	z11.h, z14.h, z13.h
	uzp1	z23.h, z11.h, z0.h
	str	z23, [x27]
	uzp2	z31.h, z31.h, z30.h
	add	x5, x1, x30, lsl 2
	uzp1	z27.h, z31.h, z7.h
	lsl	x4, x2, 3
	uzp2	z12.h, z1.h, z12.h
	uzp1	z1.h, z3.h, z12.h
	uzp1	z30.h, z27.h, z1.h
	str	z30, [x14]
	uzp2	z16.h, z20.h, z17.h
	sub	x3, x4, x2
	uzp2	z5.h, z14.h, z13.h
	add	x6, x5, 32
	uzp1	z13.h, z5.h, z16.h
	add	x24, x1, x16, lsl 1
	str	z13, [x6]
	uzp2	z24.h, z3.h, z12.h
	uzp2	z20.h, z31.h, z7.h
	add	x10, x1, x25, lsl 3
	uzp1	z17.h, z20.h, z24.h
	add	x7, x24, 32
	lsl	x13, x2, 4
	str	z17, [x7]
	add	x23, x1, x3, lsl 2
	uzp2	z29.h, z11.h, z0.h
	add	x5, x10, 32
	sub	x4, x13, x2
	str	z29, [x5]
	add	x8, x23, 32
	uzp2	z2.h, z27.h, z1.h
	str	z2, [x18]
	add	x3, x1, x4, lsl 1
	uzp2	z22.h, z5.h, z16.h
	addvl	x26, sp, #10
	addvl	x22, sp, #10
	str	z22, [x8]
	addvl	x21, sp, #10
	addvl	x27, sp, #10
	uzp2	z26.h, z20.h, z24.h
	addvl	x20, sp, #10
	addvl	x14, sp, #10
	addvl	x19, sp, #10
	addvl	x12, sp, #10
	addvl	x6, sp, #10
	addvl	x9, sp, #10
	addvl	x8, sp, #10
	addvl	x7, sp, #10
	addvl	x18, sp, #10
	addvl	x5, sp, #10
	addvl	x4, sp, #10
	add	x23, x3, 32
	str	z26, [x23]
	add	x26, x26, 320
	ldr	z9, [x26]
	add	x22, x22, 448
	ldr	z19, [x22]
	add	x21, x21, 576
	ldr	z7, [x21]
	add	x27, x27, 704
	ldr	z0, [x27]
	add	x20, x20, 832
	ldr	z3, [x20]
	add	x14, x14, 960
	ldr	z12, [x14]
	add	x19, x19, 1088
	ldr	z1, [x19]
	add	x12, x12, 1216
	ldr	z4, [x12]
	add	x6, x6, 1344
	ldr	z6, [x6]
	add	x9, x9, 1472
	ldr	z28, [x9]
	add	x8, x8, 1600
	ldr	z25, [x8]
	add	x7, x7, 1728
	ldr	z8, [x7]
	add	x18, x18, 1856
	ldr	z18, [x18]
	add	x5, x5, 1984
	ldr	z21, [x5]
	add	x4, x4, 2112
	ldr	z24, [x4]
	add	x3, sp, 224
	ldr	z31, [x3]
	adrp	x24, _ZL6CDOT_O
	lsl	x25, x25, 3
	add	x10, x24, :lo12:_ZL6CDOT_O
	zip1	z10.h, z9.h, z19.h
	zip1	z11.h, z7.h, z0.h
	zip1	z5.h, z3.h, z12.h
	zip1	z13.h, z1.h, z4.h
	zip1	z14.h, z6.h, z28.h
	zip1	z15.h, z25.h, z8.h
	zip1	z16.h, z18.h, z21.h
	zip1	z17.h, z24.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z10.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+256
	add	x27, x23, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z10.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x24, _ZL6CDOT_O+512
	add	x9, x24, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+768
	add	x8, x0, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1024
	add	x6, x11, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x26, _ZL6CDOT_O+1280
	add	x7, x26, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+1536
	add	x5, x22, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+1792
	add	x4, x21, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+2048
	add	x14, x20, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+2304
	add	x12, x19, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z10.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+2560
	add	x3, x18, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z10.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+2816
	add	x24, x23, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3072
	add	x11, x0, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z10.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z16.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+3328
	add	x26, sp, 224
	str	z7, [x26]
	add	x21, x22, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z10.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z13.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z15.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #1
	adrp	x14, _ZL6CDOT_O+3584
	add	x20, x20, 224
	add	x19, x14, :lo12:_ZL6CDOT_O+3584
	str	z2, [x20]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x19, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x19, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x19, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z16.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x19, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+3840
	add	x18, x12, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z10.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z4.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z10.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z12.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z13.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z15.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z16.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z17.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #10
	addvl	x23, sp, #10
	str	z14, [x28]
	add	x24, x24, 640
	ldr	z3, [x24]
	addvl	x0, sp, #10
	addvl	x11, sp, #10
	addvl	x26, sp, #10
	addvl	x22, sp, #10
	addvl	x21, sp, #10
	addvl	x20, sp, #10
	add	x23, x23, 384
	ldr	z9, [x23]
	add	x0, x0, 896
	ldr	z7, [x0]
	add	x11, x11, 1152
	ldr	z1, [x11]
	add	x26, x26, 1408
	ldr	z16, [x26]
	add	x22, x22, 1664
	ldr	z4, [x22]
	add	x21, x21, 1920
	ldr	z17, [x21]
	add	x20, x20, 2176
	ldr	z10, [x20]
	adrp	x3, .LANCHOR0
	zip1	z6.h, z9.h, z3.h
	zip1	z29.h, z7.h, z1.h
	zip1	z2.h, z16.h, z4.h
	zip1	z3.h, z17.h, z10.h
	add	x19, x3, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z29.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z13.h
// 0 "" 2
#NO_APP
	add	x14, x19, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z29.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z1.h
// 0 "" 2
#NO_APP
	add	x12, x19, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z29.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z11.h
// 0 "" 2
#NO_APP
	add	x18, x19, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z29.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z14.h
// 0 "" 2
#NO_APP
	add	x3, x19, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z29.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x23, x19, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z29.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z14.h
// 0 "" 2
#NO_APP
	add	x24, x19, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z29.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x0, x19, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z29.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #10
	addvl	x22, sp, #10
	addvl	x21, sp, #10
	addvl	x20, sp, #10
	add	x26, x26, 512
	ldr	z3, [x26]
	add	x22, x22, 1024
	ldr	z17, [x22]
	add	x21, x21, 1536
	ldr	z5, [x21]
	add	x20, x20, 2048
	ldr	z7, [x20]
	add	x11, x19, 1024
	zip1	z1.h, z3.h, z17.h
	zip1	z29.h, z5.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z29.h, z6.h
// 0 "" 2
#NO_APP
	add	x14, x19, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z29.h, z3.h
// 0 "" 2
#NO_APP
	add	x12, x19, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z29.h, z7.h
// 0 "" 2
#NO_APP
	add	x18, x19, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z29.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #10
	addvl	x24, sp, #10
	add	x23, x23, 768
	ldr	z29, [x23]
	add	x24, x24, 1792
	ldr	z2, [x24]
	add	x3, x19, 1280
	zip1	z17.h, z29.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x0, x19, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #10
	addvl	x22, sp, #10
	add	x26, x26, 256
	ldr	z1, [x26]
	add	x22, x22, 1280
	ldr	z29, [x22]
	add	x11, x19, 1344
	zip1	z1.h, z1.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	add	x19, x19, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x19, #0, MUL VL]
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
	add	z3.s, z1.s, z4.s
	sub	z16.s, z29.s, z6.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z2.s, z5.s
	add	z5.s, z29.s, z6.s
	add	z6.s, z17.s, z7.s
	sub	z17.s, z17.s, z7.s
	sub	z29.s, z5.s, z10.s
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
	sub	z17.s, z7.s, z30.s
	sub	z16.s, z16.s, z13.s
	add	z13.s, z2.s, z14.s
	sub	z2.s, z2.s, z14.s
	add	z14.s, z1.s, z15.s
	sub	z1.s, z1.s, z15.s
	add	z15.s, z7.s, z30.s
	sqrshrnb	z7.h, z17.s, #12
	sqrshrnb	z30.h, z15.s, #12
	uzp1	z17.h, z7.h, z7.h
	add	z15.s, z8.s, z18.s
	sub	z18.s, z8.s, z18.s
	sqrshrnb	z8.h, z15.s, #12
	sqrshrnb	z15.h, z18.s, #12
	uzp1	z7.h, z8.h, z8.h
	uzp1	z8.h, z15.h, z15.h
	splice	z8.h, p4, z8.h, z17.h
	add	z17.s, z9.s, z19.s
	sub	z9.s, z9.s, z19.s
	uzp1	z30.h, z30.h, z30.h
	sqrshrnb	z19.h, z17.s, #12
	splice	z30.h, p4, z30.h, z7.h
	sqrshrnb	z18.h, z9.s, #12
	uzp1	z7.h, z19.h, z19.h
	uzp1	z15.h, z18.h, z18.h
	add	z17.s, z10.s, z20.s
	sub	z10.s, z10.s, z20.s
	sqrshrnb	z20.h, z17.s, #12
	uzp1	z9.h, z20.h, z20.h
	sub	x25, x25, x2
	movprfx	z18, z7
	splice	z18.h, p4, z18.h, z9.h
	sqrshrnb	z19.h, z10.s, #12
	uzp2	z10.h, z30.h, z18.h
	uzp1	z7.h, z19.h, z19.h
	splice	z7.h, p4, z7.h, z15.h
	uzp1	z15.h, z30.h, z18.h
	add	z30.s, z11.s, z21.s
	sub	z21.s, z11.s, z21.s
	sqrshrnb	z11.h, z30.s, #12
	sqrshrnb	z20.h, z21.s, #12
	uzp1	z9.h, z20.h, z20.h
	add	x18, x2, x15, lsl 1
	add	x26, x2, x30, lsl 2
	add	z18.s, z12.s, z22.s
	add	z21.s, z13.s, z23.s
	sub	z12.s, z12.s, z22.s
	sub	z13.s, z13.s, z23.s
	sqrshrnb	z22.h, z18.s, #12
	sqrshrnb	z30.h, z12.s, #12
	uzp1	z19.h, z22.h, z22.h
	sqrshrnb	z23.h, z21.s, #12
	uzp1	z17.h, z11.h, z11.h
	uzp1	z11.h, z30.h, z30.h
	splice	z17.h, p4, z17.h, z19.h
	splice	z11.h, p4, z11.h, z9.h
	sqrshrnb	z9.h, z13.s, #12
	add	x14, x1, x25, lsl 1
	uzp1	z18.h, z9.h, z9.h
	add	z12.s, z14.s, z24.s
	uzp1	z20.h, z23.h, z23.h
	sub	z14.s, z14.s, z24.s
	sqrshrnb	z24.h, z12.s, #12
	sqrshrnb	z19.h, z14.s, #12
	uzp1	z22.h, z24.h, z24.h
	splice	z20.h, p4, z20.h, z22.h
	uzp1	z30.h, z17.h, z20.h
	uzp2	z20.h, z17.h, z20.h
	uzp1	z23.h, z15.h, z30.h
	uzp2	z9.h, z15.h, z30.h
	add	z15.s, z1.s, z25.s
	sub	z25.s, z1.s, z25.s
	sqrshrnb	z1.h, z15.s, #12
	sqrshrnb	z21.h, z25.s, #12
	uzp1	z17.h, z1.h, z1.h
	add	x11, x14, 32
	add	x0, x1, x18, lsl 1
	add	x14, x1, x26, lsl 1
	add	z12.s, z2.s, z26.s
	addvl	x26, sp, #1
	sub	z2.s, z2.s, z26.s
	uzp1	z13.h, z19.h, z19.h
	sqrshrnb	z26.h, z12.s, #12
	splice	z13.h, p4, z13.h, z18.h
	uzp1	z14.h, z26.h, z26.h
	uzp1	z18.h, z21.h, z21.h
	movprfx	z24, z17
	splice	z24.h, p4, z24.h, z14.h
	sqrshrnb	z22.h, z2.s, #12
	add	z19.s, z16.s, z27.s
	add	z21.s, z6.s, z28.s
	sub	z27.s, z16.s, z27.s
	sub	z6.s, z6.s, z28.s
	sqrshrnb	z16.h, z19.s, #12
	sqrshrnb	z15.h, z27.s, #12
	sqrshrnb	z28.h, z21.s, #12
	uzp1	z30.h, z16.h, z16.h
	uzp1	z17.h, z28.h, z28.h
	splice	z30.h, p4, z30.h, z17.h
	ldr	z16, [x28]
	uzp1	z2.h, z24.h, z30.h
	uzp2	z14.h, z24.h, z30.h
	add	x18, x0, 32
	add	z30.s, z3.s, z16.s
	uzp1	z25.h, z15.h, z15.h
	add	x0, sp, 224
	ldr	z24, [x0]
	add	x26, x26, 224
	add	z26.s, z5.s, z24.s
	uzp1	z1.h, z22.h, z22.h
	sqrshrnb	z15.h, z26.s, #12
	splice	z1.h, p4, z1.h, z18.h
	sub	z22.s, z5.s, z24.s
	ldr	z5, [x26]
	sqrshrnb	z18.h, z6.s, #12
	sub	z27.s, z29.s, z5.s
	sqrshrnb	z6.h, z30.s, #12
	add	x17, x17, x2, lsl 1
	add	z19.s, z29.s, z5.s
	uzp1	z24.h, z6.h, z6.h
	add	z29.s, z4.s, z0.s
	sqrshrnb	z5.h, z27.s, #12
	sqrshrnb	z21.h, z29.s, #12
	uzp1	z12.h, z18.h, z18.h
	uzp1	z28.h, z15.h, z15.h
	splice	z12.h, p4, z12.h, z25.h
	uzp1	z18.h, z21.h, z21.h
	sqrshrnb	z25.h, z19.s, #12
	splice	z18.h, p4, z18.h, z24.h
	uzp1	z17.h, z25.h, z25.h
	splice	z28.h, p4, z28.h, z17.h
	uzp1	z27.h, z28.h, z18.h
	uzp1	z15.h, z2.h, z27.h
	uzp1	z6.h, z23.h, z15.h
	str	z6, [x17]
	add	x20, x17, x2, lsl 1
	uzp2	z29.h, z28.h, z18.h
	sub	z3.s, z3.s, z16.s
	uzp1	z18.h, z10.h, z20.h
	uzp1	z16.h, z14.h, z29.h
	uzp1	z17.h, z18.h, z16.h
	str	z17, [x20]
	add	x3, x20, x2, lsl 1
	uzp2	z2.h, z2.h, z27.h
	sub	z0.s, z4.s, z0.s
	uzp1	z24.h, z9.h, z2.h
	str	z24, [x3]
	add	x23, x3, x2, lsl 1
	uzp2	z10.h, z10.h, z20.h
	uzp2	z14.h, z14.h, z29.h
	sqrshrnb	z4.h, z0.s, #12
	uzp1	z0.h, z10.h, z14.h
	str	z0, [x23]
	add	x24, x23, x2, lsl 1
	add	x16, x1, x16, lsl 2
	sqrshrnb	z26.h, z3.s, #12
	uzp2	z23.h, z23.h, z15.h
	str	z23, [x24]
	add	x22, x16, 32
	add	x12, x2, 1
	add	x16, x24, x2, lsl 1
	uzp1	z30.h, z26.h, z26.h
	uzp2	z26.h, z18.h, z16.h
	str	z26, [x16]
	add	x25, x16, x2, lsl 1
	add	x13, x13, x2
	add	x30, x1, x30, lsl 3
	uzp2	z9.h, z9.h, z2.h
	str	z9, [x25]
	add	x19, x1, x12, lsl 5
	uzp1	z19.h, z4.h, z4.h
	add	x12, x30, 32
	uzp2	z4.h, z10.h, z14.h
	add	x30, x25, x2, lsl 1
	sqrshrnb	z22.h, z22.s, #12
	str	z4, [x30]
	uzp1	z25.h, z12.h, z1.h
	uzp1	z28.h, z7.h, z8.h
	splice	z30.h, p4, z30.h, z19.h
	uzp1	z21.h, z13.h, z11.h
	uzp2	z1.h, z12.h, z1.h
	add	x21, x1, x13, lsl 1
	uzp1	z12.h, z21.h, z28.h
	uzp1	z20.h, z22.h, z22.h
	uzp1	z3.h, z5.h, z5.h
	splice	z3.h, p4, z3.h, z20.h
	uzp1	z22.h, z30.h, z3.h
	uzp1	z19.h, z22.h, z25.h
	uzp1	z27.h, z19.h, z12.h
	str	z27, [x19]
	uzp2	z11.h, z13.h, z11.h
	uzp2	z30.h, z30.h, z3.h
	uzp2	z13.h, z21.h, z28.h
	add	x13, x21, 32
	uzp1	z21.h, z30.h, z1.h
	add	x15, x1, x15, lsl 2
	uzp2	z8.h, z7.h, z8.h
	uzp1	z7.h, z11.h, z8.h
	uzp1	z29.h, z21.h, z7.h
	str	z29, [x13]
	uzp2	z18.h, z22.h, z25.h
	add	x21, x15, 32
	uzp1	z25.h, z18.h, z13.h
	str	z25, [x21]
	uzp2	z5.h, z11.h, z8.h
	uzp2	z15.h, z30.h, z1.h
	uzp1	z16.h, z15.h, z5.h
	str	z16, [x18]
	uzp2	z2.h, z19.h, z12.h
	add	x15, x14, 32
	str	z2, [x12]
	uzp2	z10.h, z21.h, z7.h
	uzp2	z14.h, z18.h, z13.h
	str	z10, [x15]
	addvl	x28, sp, #10
	uzp2	z28.h, z15.h, z5.h
	str	z14, [x22]
	add	x28, x28, 336
	addvl	x17, sp, #10
	addvl	x20, sp, #10
	addvl	x3, sp, #10
	str	z28, [x11]
	ldr	z3, [x28]
	addvl	x22, sp, #10
	addvl	x23, sp, #10
	addvl	x13, sp, #10
	addvl	x24, sp, #10
	addvl	x11, sp, #10
	addvl	x19, sp, #10
	addvl	x16, sp, #10
	addvl	x21, sp, #10
	addvl	x18, sp, #10
	addvl	x25, sp, #10
	addvl	x12, sp, #10
	addvl	x14, sp, #10
	add	x17, x17, 464
	ldr	z20, [x17]
	add	x20, x20, 592
	ldr	z1, [x20]
	add	x3, x3, 720
	ldr	z6, [x3]
	add	x22, x22, 848
	ldr	z17, [x22]
	add	x23, x23, 976
	ldr	z24, [x23]
	add	x13, x13, 1104
	ldr	z0, [x13]
	add	x24, x24, 1232
	ldr	z23, [x24]
	add	x11, x11, 1360
	ldr	z12, [x11]
	add	x19, x19, 1488
	ldr	z26, [x19]
	add	x16, x16, 1616
	ldr	z4, [x16]
	add	x21, x21, 1744
	ldr	z7, [x21]
	add	x18, x18, 1872
	ldr	z5, [x18]
	add	x25, x25, 2000
	ldr	z22, [x25]
	add	x12, x12, 2128
	ldr	z19, [x12]
	add	x14, x14, 2256
	ldr	z27, [x14]
	zip1	z8.h, z3.h, z20.h
	zip1	z9.h, z1.h, z6.h
	zip1	z2.h, z17.h, z24.h
	zip1	z11.h, z0.h, z23.h
	zip1	z3.h, z12.h, z26.h
	zip1	z13.h, z4.h, z7.h
	zip1	z14.h, z5.h, z22.h
	zip1	z15.h, z19.h, z27.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2048
	add	x27, x10, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x27, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x27, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x27, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x27, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2304
	add	x8, x9, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2560
	add	x7, x6, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2816
	add	x4, x5, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+3072
	add	x0, x15, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x26, _ZL6CDOT_O+3328
	add	x28, x26, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x28, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x28, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x28, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x28, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x28, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x28, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x28, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x28, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z4.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+3584
	add	x17, sp, 224
	str	z30, [x17]
	add	x3, x20, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #1
	adrp	x23, _ZL6CDOT_O+3840
	add	x22, x22, 224
	add	x13, x23, :lo12:_ZL6CDOT_O+3840
	str	z5, [x22]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z8.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #10
	addvl	x11, sp, #10
	add	x19, x19, 656
	ldr	z30, [x19]
	addvl	x16, sp, #10
	addvl	x21, sp, #10
	addvl	x18, sp, #10
	addvl	x25, sp, #10
	addvl	x12, sp, #10
	addvl	x14, sp, #10
	add	x11, x11, 400
	ldr	z5, [x11]
	add	x16, x16, 912
	ldr	z10, [x16]
	add	x21, x21, 1168
	ldr	z15, [x21]
	add	x18, x18, 1424
	ldr	z7, [x18]
	add	x25, x25, 1680
	ldr	z1, [x25]
	add	x12, x12, 1936
	ldr	z16, [x12]
	add	x14, x14, 2192
	ldr	z12, [x14]
	adrp	x24, .LANCHOR0
	zip1	z2.h, z5.h, z30.h
	zip1	z6.h, z10.h, z15.h
	zip1	z3.h, z7.h, z1.h
	zip1	z30.h, z16.h, z12.h
	add	x10, x24, :lo12:.LANCHOR0
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	add	x27, x10, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x27, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x27, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x27, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x27, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x9, x10, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	add	x8, x10, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z30.h, z5.h
// 0 "" 2
#NO_APP
	add	x6, x10, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z30.h, z16.h
// 0 "" 2
#NO_APP
	add	x7, x10, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x5, x10, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z30.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x10, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z30.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	addvl	x26, sp, #10
	add	x0, x0, 528
	ldr	z30, [x0]
	addvl	x28, sp, #10
	addvl	x17, sp, #10
	add	x26, x26, 1040
	ldr	z7, [x26]
	add	x28, x28, 1552
	ldr	z16, [x28]
	add	x17, x17, 2064
	ldr	z4, [x17]
	zip1	z1.h, z30.h, z7.h
	add	x15, x10, 1024
	zip1	z30.h, z16.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z30.h, z2.h
// 0 "" 2
#NO_APP
	add	x20, x10, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z3.h
// 0 "" 2
#NO_APP
	add	x3, x10, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z16.h
// 0 "" 2
#NO_APP
	add	x22, x10, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z30.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x13, sp, #10
	addvl	x24, sp, #10
	add	x13, x13, 784
	ldr	z30, [x13]
	add	x24, x24, 1808
	ldr	z3, [x24]
	add	x23, x10, 1280
	zip1	z16.h, z30.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	add	x11, x10, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x16, sp, #10
	addvl	x21, sp, #10
	add	x16, x16, 272
	ldr	z1, [x16]
	add	x21, x21, 1296
	ldr	z16, [x21]
	add	x19, x10, 1344
	zip1	z1.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z30.h
// 0 "" 2
#NO_APP
	add	x18, x10, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z30.h
// 0 "" 2
#NO_APP
	add	z1.s, z16.s, z2.s
	sub	z16.s, z16.s, z2.s
	add	z2.s, z31.s, z3.s
	sub	z30.s, z1.s, z4.s
	sub	z31.s, z31.s, z3.s
	add	z3.s, z1.s, z4.s
	sub	z1.s, z2.s, z5.s
	add	z4.s, z2.s, z5.s
	sub	z2.s, z31.s, z6.s
	add	z5.s, z31.s, z6.s
	add	z6.s, z16.s, z7.s
	sub	z31.s, z2.s, z13.s
	sub	z16.s, z16.s, z7.s
	add	z7.s, z3.s, z8.s
	sub	z3.s, z3.s, z8.s
	add	z8.s, z4.s, z9.s
	sub	z4.s, z4.s, z9.s
	add	z9.s, z5.s, z10.s
	sub	z5.s, z5.s, z10.s
	add	z10.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z16.s, z12.s
	sub	z16.s, z16.s, z12.s
	add	z12.s, z2.s, z13.s
	add	z13.s, z1.s, z14.s
	sub	z2.s, z1.s, z14.s
	add	z14.s, z30.s, z15.s
	sub	z1.s, z7.s, z17.s
	sub	z30.s, z30.s, z15.s
	add	z15.s, z7.s, z17.s
	add	x25, x2, x2, lsl 2
	sqrshrnb	z17.h, z15.s, #12
	sqrshrnb	z7.h, z1.s, #12
	add	z15.s, z8.s, z18.s
	uzp1	z1.h, z7.h, z7.h
	sub	z18.s, z8.s, z18.s
	sqrshrnb	z8.h, z15.s, #12
	sqrshrnb	z15.h, z18.s, #12
	uzp1	z7.h, z8.h, z8.h
	uzp1	z8.h, z15.h, z15.h
	splice	z8.h, p4, z8.h, z1.h
	add	z1.s, z9.s, z19.s
	sub	z9.s, z9.s, z19.s
	add	x27, x2, x2, lsl 1
	add	x6, x25, x25, lsl 2
	sqrshrnb	z19.h, z1.s, #12
	sqrshrnb	z18.h, z9.s, #12
	add	z1.s, z10.s, z20.s
	uzp1	z15.h, z18.h, z18.h
	sub	z10.s, z10.s, z20.s
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z20.h, z1.s, #12
	splice	z17.h, p4, z17.h, z7.h
	uzp1	z9.h, z20.h, z20.h
	uzp1	z7.h, z19.h, z19.h
	sqrshrnb	z19.h, z10.s, #12
	movprfx	z18, z7
	splice	z18.h, p4, z18.h, z9.h
	uzp1	z7.h, z19.h, z19.h
	uzp2	z10.h, z17.h, z18.h
	splice	z7.h, p4, z7.h, z15.h
	uzp1	z15.h, z17.h, z18.h
	add	z17.s, z11.s, z21.s
	sub	z11.s, z11.s, z21.s
	sqrshrnb	z21.h, z17.s, #12
	sqrshrnb	z20.h, z11.s, #12
	uzp1	z9.h, z20.h, z20.h
	add	x8, x2, x27, lsl 2
	add	x7, x1, x6, lsl 1
	add	z18.s, z12.s, z22.s
	uzp1	z1.h, z21.h, z21.h
	sub	z12.s, z12.s, z22.s
	add	z21.s, z13.s, z23.s
	sqrshrnb	z22.h, z18.s, #12
	sqrshrnb	z17.h, z12.s, #12
	uzp1	z19.h, z22.h, z22.h
	sub	z13.s, z13.s, z23.s
	uzp1	z11.h, z17.h, z17.h
	splice	z11.h, p4, z11.h, z9.h
	sqrshrnb	z9.h, z13.s, #12
	splice	z1.h, p4, z1.h, z19.h
	add	x23, x7, 32
	sqrshrnb	z23.h, z21.s, #12
	uzp1	z18.h, z9.h, z9.h
	uzp1	z20.h, z23.h, z23.h
	add	z12.s, z14.s, z24.s
	add	z9.s, z30.s, z25.s
	sub	z14.s, z14.s, z24.s
	sub	z30.s, z30.s, z25.s
	sqrshrnb	z24.h, z12.s, #12
	sqrshrnb	z17.h, z14.s, #12
	uzp1	z22.h, z24.h, z24.h
	sqrshrnb	z25.h, z9.s, #12
	movprfx	z19, z20
	splice	z19.h, p4, z19.h, z22.h
	addvl	x7, sp, #1
	uzp1	z21.h, z1.h, z19.h
	add	x4, x1, x8, lsl 2
	uzp1	z23.h, z15.h, z21.h
	add	x8, sp, 224
	uzp2	z15.h, z15.h, z21.h
	add	z14.s, z2.s, z26.s
	add	z21.s, z16.s, z28.s
	sub	z2.s, z2.s, z26.s
	sub	z16.s, z16.s, z28.s
	sqrshrnb	z26.h, z14.s, #12
	add	z28.s, z6.s, z29.s
	uzp1	z24.h, z26.h, z26.h
	add	x7, x7, 224
	uzp1	z13.h, z17.h, z17.h
	sub	z6.s, z6.s, z29.s
	ldr	z29, [x7]
	splice	z13.h, p4, z13.h, z18.h
	add	z17.s, z31.s, z27.s
	uzp1	z18.h, z25.h, z25.h
	sub	z31.s, z31.s, z27.s
	ldr	z27, [x8]
	add	z25.s, z5.s, z27.s
	uzp2	z20.h, z1.h, z19.h
	movprfx	z22, z18
	splice	z22.h, p4, z22.h, z24.h
	sqrshrnb	z1.h, z30.s, #12
	add	z18.s, z3.s, z0.s
	add	z30.s, z4.s, z29.s
	uzp1	z12.h, z1.h, z1.h
	sqrshrnb	z19.h, z2.s, #12
	sqrshrnb	z26.h, z30.s, #12
	sqrshrnb	z2.h, z25.s, #12
	sqrshrnb	z24.h, z18.s, #12
	sub	z5.s, z5.s, z27.s
	sub	z4.s, z4.s, z29.s
	uzp1	z27.h, z26.h, z26.h
	uzp1	z29.h, z24.h, z24.h
	sqrshrnb	z14.h, z28.s, #12
	movprfx	z25, z27
	splice	z25.h, p4, z25.h, z29.h
	add	x30, x30, x2, lsl 1
	uzp1	z9.h, z19.h, z19.h
	sqrshrnb	z1.h, z17.s, #12
	splice	z9.h, p4, z9.h, z12.h
	uzp1	z17.h, z1.h, z1.h
	sqrshrnb	z12.h, z21.s, #12
	uzp1	z28.h, z14.h, z14.h
	uzp1	z19.h, z12.h, z12.h
	uzp1	z21.h, z2.h, z2.h
	splice	z17.h, p4, z17.h, z19.h
	splice	z28.h, p4, z28.h, z21.h
	uzp1	z14.h, z22.h, z17.h
	uzp2	z2.h, z28.h, z25.h
	uzp1	z18.h, z28.h, z25.h
	uzp1	z25.h, z14.h, z18.h
	uzp1	z27.h, z23.h, z25.h
	str	z27, [x30]
	add	x14, x30, x2, lsl 1
	uzp1	z21.h, z10.h, z20.h
	uzp2	z22.h, z22.h, z17.h
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z17.h, z22.h, z2.h
	uzp1	z29.h, z21.h, z17.h
	str	z29, [x14]
	uzp2	z26.h, z14.h, z18.h
	add	x10, x14, x2, lsl 1
	sqrshrnb	z30.h, z16.s, #12
	sub	z0.s, z3.s, z0.s
	uzp1	z16.h, z4.h, z4.h
	sqrshrnb	z3.h, z0.s, #12
	uzp1	z4.h, z15.h, z26.h
	str	z4, [x10]
	add	x28, x10, x2, lsl 1
	uzp2	z24.h, z22.h, z2.h
	uzp2	z10.h, z10.h, z20.h
	sqrshrnb	z1.h, z31.s, #12
	uzp1	z31.h, z3.h, z3.h
	uzp1	z3.h, z10.h, z24.h
	str	z3, [x28]
	add	x20, x28, x2, lsl 1
	uzp2	z23.h, z23.h, z25.h
	sqrshrnb	z5.h, z5.s, #12
	str	z23, [x20]
	add	x15, x20, x2, lsl 1
	uzp1	z12.h, z5.h, z5.h
	uzp2	z5.h, z21.h, z17.h
	str	z5, [x15]
	add	x13, x15, x2, lsl 1
	uzp2	z15.h, z15.h, z26.h
	sqrshrnb	z6.h, z6.s, #12
	str	z15, [x13]
	add	x9, x1, x27, lsl 4
	lsl	x12, x2, 3
	uzp1	z20.h, z6.h, z6.h
	add	x17, x13, x2, lsl 1
	uzp2	z6.h, z10.h, z24.h
	str	z6, [x17]
	sub	x26, x12, x2
	uzp1	z19.h, z7.h, z8.h
	splice	z12.h, p4, z12.h, z20.h
	splice	z31.h, p4, z31.h, z16.h
	uzp1	z28.h, z13.h, z11.h
	uzp2	z8.h, z7.h, z8.h
	uzp2	z11.h, z13.h, z11.h
	uzp1	z7.h, z31.h, z12.h
	uzp1	z13.h, z28.h, z19.h
	add	x22, x9, 32
	add	x5, x27, x27, lsl 3
	uzp1	z0.h, z30.h, z30.h
	uzp1	z30.h, z1.h, z1.h
	splice	z0.h, p4, z0.h, z30.h
	uzp1	z16.h, z0.h, z9.h
	uzp1	z18.h, z7.h, z16.h
	uzp1	z14.h, z18.h, z13.h
	str	z14, [x22]
	uzp2	z31.h, z31.h, z12.h
	uzp2	z9.h, z0.h, z9.h
	uzp1	z12.h, z11.h, z8.h
	uzp1	z22.h, z31.h, z9.h
	uzp1	z2.h, z22.h, z12.h
	str	z2, [x23]
	add	x24, x2, x26, lsl 2
	uzp2	z1.h, z28.h, z19.h
	add	x0, x1, x5, lsl 1
	lsl	x19, x2, 4
	uzp2	z28.h, z7.h, z16.h
	add	x11, x4, 32
	uzp1	z21.h, z28.h, z1.h
	str	z21, [x11]
	uzp2	z17.h, z11.h, z8.h
	add	x3, x1, x26, lsl 3
	sub	x21, x19, x2
	uzp2	z25.h, z31.h, z9.h
	add	x16, x0, 32
	lsl	x18, x2, 5
	uzp1	z26.h, z25.h, z17.h
	str	z26, [x16]
	add	x27, x1, x24, lsl 1
	uzp2	z10.h, z18.h, z13.h
	add	x25, x3, 32
	sub	x2, x18, x2
	str	z10, [x25]
	add	x6, x1, x21, lsl 2
	add	x12, x27, 32
	uzp2	z24.h, z22.h, z12.h
	str	z24, [x12]
	add	x26, x6, 32
	add	x1, x1, x2, lsl 1
	uzp2	z19.h, z28.h, z1.h
	str	z19, [x26]
	add	x9, x1, 32
	uzp2	z20.h, z25.h, z17.h
	str	z20, [x9]
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
	addvl	sp, sp, #10
	.cfi_def_cfa_offset 2272
	add	sp, sp, 2272
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
